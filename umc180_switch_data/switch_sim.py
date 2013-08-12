#!/usr/local/bin/python2.7
# -*- coding: utf-8 -*- 

import os, time, sys, getopt
from string import Template

ini_time = time.time()

# Float range
def srange(first, step,last):
   return [float(first)+float(step)*x for x in range(0, int((float(last)-float(first))/float(step))+1)]

#	Return the next index of a 3 dimensional array, given the index i1,i2,i3
def nindex3(array, i1, i2, i3):
	l1 		=	len(array)
	l2 		= 	len(array[0])
	l3 		=	len(array[0][0])
	nindex 	= 	i1*(l2*l3)+i2*(l3)+i3+1
	i1n 	=	nindex/(l2*l3)
	i2n 	=	(nindex-i1n*(l2*l3))/(l3)
	i3n 	=	(nindex-i1n*(l2*l3)-i2n*(l3))
	return i1n,i2n,i3n

def nindex2(array, i1, i2):
	l1 		=	len(array)
	l2 		= 	len(array[0])
	nindex 	= 	i1*(l2)+i2+1
	i1n 	=	nindex/(l2)
	i2n 	=	nindex-i1n*(l2)
	return i1n,i2n
		
#	Main routine 

inputfile 	= ''
outputfile 	= ''

#	Get the command line arguments

try:
   opts, args = getopt.getopt(sys.argv[1:],"hi:o:",["ifile=","ofile="])
except getopt.GetoptError:
   print 'switch_sim.py -i <inputfile> -o <outputfile>'
   sys.exit(2)

for opt, arg in opts:
	print opt, arg
	if opt == '-h':
		print 'switch_sim.py -i <inputfile> -o <outputfile>'
		sys.exit()
	elif opt in ("-i", "--ifile"):
		inputfile = arg
	elif opt in ("-o", "--ofile"):
		outputfile = arg

if inputfile == '' or outputfile == '':
	print 'switch_sim.py -i <inputfile> -o <outputfile>' 
	sys.exit()


#	Initialitate the variables

sim_var = ['model_n','model_p','temp','outputs','options','format','include','flavor','W', 'L','Ld','tran_extra' ,'VDS_delta', 'Vin_ini', 'Vin_last', 'Vin_step','tempdata_filename','net_filename']

for var in sim_var:
	vars()[var] = []

for line in open(inputfile + '.ini'):
	[eval(var).extend((line.split())[1:]) for var in sim_var if line.find(var+' ') == 0 or line.find(var+'\t')==0]

for var in outputs:
	vars()[var] = []

Vin = srange(Vin_ini[0],Vin_step[0], Vin_last[0])

for var in outputs:
	vars()[var+'_data'] = [[[0 for c in range(len(Vin))] for b in range(len(L))] for a in range(len(W))]

#	Define the template netlist

line_start_comment 		= '* TEMP NETLIST \n'
line_include 			= '.INCLUDE ' + include[0] + '\n\n'
line_options 			= ''.join(['.OPTION ' + a + '\n' for a in options]) + '\n'
line_temp 				= '.TEMP ' + temp[0] + '\n\n'
line_param				= Template('.param W = $WX \n.param L = $LX \n.param Ld = '+Ld[0]+'\n\n')

if flavor[0] == 'n':
	line_tran       	= Template("M1 IN DD OUT 0 " + model_n[0] + " W = 'W' L = 'L' $textra\n")
else:
	line_tran       	= Template("M1 OUT 0 IN DD " + model_p[0] + " W = 'W' L = 'L' $textra\n")


line_vdd 				= 'VDD DD 0 DC 1.8 \n'
line_out				= 'E1 OUT 0 IN X 1 \n'
line_ds					= Template('VAUX X 0 DC $DSX \n')
line_vi					= 'VIN IN 0 DC 1 \n\n'

line_sim 				= '.DC VIN ' + Vin_ini[0] + ' ' + Vin_last[0] + ' ' + Vin_step[0] + '\n\n'
line_printfile 			= '.printfile DC Id(M1) file="'+ tempdata_filename[0] + '.dat" \n\n'	
line_end 				= '.op\n\n.end'

tran_data = [[a + ' ' + b for b in L] for a in W]

sim_n = len(tran_data)*len(tran_data[0])

ct = '%'
ex = '.m'
if format[0] == 'scilab':
	ct = '//'
	ex = '.sce'

#	Create the output file
m = open(outputfile + ex,'w')
m.write(('W_' + flavor[0] + '\t= [' + ';'.join(W) + '];').replace('u','') + '\n')
m.write(('L_' + flavor[0] + '\t= [' + ';'.join(L) + '];').replace('u','') + '\n')
m.write('Vin_' + flavor[0] + '\t= (' + Vin_ini[0] + ':' + Vin_step[0] + ':' + Vin_last[0] + ')\';\n\n')
m.write('Vds_' + flavor[0] + '\t= ' + VDS_delta[0] + ';\n\n')

m.write(ct + '\tStored transistor parameters: ' + ' , '.join(outputs) + '\n\n')

[m.write(var + '_' + flavor[0] + '\t= zeros(' + str(len(Vin)) + ',' + str(len(tran_data[0])) + ',' + str(len(tran_data)) + ');\n') for var in outputs]

i1,i2 = 0,0

#	Iterate through the transistor parameter combinations, simulate and store the parameters in the output file

for j in range(sim_n):
	o = open(net_filename[0] + '.cir','w')
	o.write(line_start_comment)
	o.write(line_include)
	o.write(line_options)
	o.write(line_temp)
	i_data = tran_data[i1][i2].split()
	o.write(line_param.substitute(WX = i_data[0], LX = i_data[1]))
	o.write(line_tran.substitute(textra = ' '.join(tran_extra)))
	o.write(line_vdd)
	o.write(line_out)
	o.write(line_ds.substitute(DSX = VDS_delta[0]))
	o.write(line_vi)
	o.write(line_sim)
	o.write(line_printfile)
	o.write(line_end)
	
	o.close()

	os.system('eldo ' + net_filename[0] + '.cir')

	a1,a2,a3 = i1,i2,0
	
	for line in open(tempdata_filename[0] + '.dat').readlines():
		d_line = line.split()
		if len(d_line) == len(outputs) + 1:
			a = 1
			for var in outputs:
				eval(var + '_data')[a1][a2][a3] = d_line[a]
				a = a + 1
			a1,a2,a3 = nindex3(eval(outputs[0]+'_data'),a1,a2,a3)
	m.write('\n')
	[m.write(var + '_'+ flavor[0] +'(:,' + str(i2+1) + ',' + str(i1+1) + ') = [' + ';'.join(eval(var + '_data')[i1][i2]) + '];\n') for var in outputs]
	i1,i2= nindex2(tran_data,i1,i2)
m.write('\n\nr_switch_' + flavor[0] + ' = -Vds_' + flavor[0] + './id_' + 
flavor[0] + ';')
os.system('rm ' + tempdata_filename[0] + '*')
os.system('rm ' + net_filename[0] + '*')
m.close()


print 'Elapsed time = ' + str(time.time()-ini_time)
