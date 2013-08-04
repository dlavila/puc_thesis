#!/usr/local/bin/python2.7
# -*- coding: utf-8 -*- 

import os, time, sys, getopt
from string import Template

ini_time = time.time()

# Float range
def srange(first, step,last):
   return [float(first)+float(step)*x for x in range(0, int((float(last)-float(first))/float(step))+1)]

#	Return the next index of a 5 dimensional array, given the index i1,i2,i3,i4,i5
def nindex5(array, i1, i2, i3, i4,i5):
	l1     = len(array)
	l2     = len(array[0])
	l3     = len(array[0][0])
	l4     = len(array[0][0][0])
	l5     = len(array[0][0][0][0])
	nindex = i1*(l2*l3*l4*i5)+i2*(l3*l4*i5)+i3*(l4*i5)+i4*(i5)+i5+1
	i1n    = nindex/(l2*l3*l4*i5)
	i2n    = (nindex-i1n*(l2*l3*l4*i5))/(l3*l4*i5)
	i3n    = (nindex-i1n*(l2*l3*l4*i5)-i2n*(l3*l4*i5))/(i4*l5)
	i4n    = (nindex-i1n*(l2*l3*l4*u5)-i2n*(l3*l4*i5)-i3n*(l4*i5))/i5
	i5n    = (nindex-i1n*(l2*l3*l4*u5)-i2n*(l3*l4*i5)-i3n*(l4*i5)+i4n*(i5))
	return i1n,i2n,i3n,i4n,i5n
	
#	Return the next index of a 4 dimensional array, given the index i1,i2,i3,i4
def nindex4(array, i1, i2, i3, i4):
	l1     = len(array)
	l2     = len(array[0])
	l3     = len(array[0][0])
	l4     = len(array[0][0][0])
	nindex = i1*(l2*l3*l4)+i2*(l3*l4)+i3*(l4)+i4+1
	i1n    = nindex/(l2*l3*l4)
	i2n    = (nindex-i1n*(l2*l3*l4))/(l3*l4)
	i3n    = (nindex-i1n*(l2*l3*l4)-i2n*(l3*l4))/l4
	i4n    = (nindex-i1n*(l2*l3*l4)-i2n*(l3*l4)-i3n*l4)
	return i1n,i2n,i3n,i4n 	
		
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


#	Main routine 

inputfile 	= ''
outputfile 	= ''

#	Get the command line arguments

try:
   opts, args = getopt.getopt(sys.argv[1:],"hi:o:",["ifile=","ofile="])
except getopt.GetoptError:
   print 'main.py -i <inputfile> -o <outputfile>'
   sys.exit(2)

for opt, arg in opts:
	print opt, arg
	if opt == '-h':
		print 'main.py -i <inputfile> -o <outputfile>'
		sys.exit()
	elif opt in ("-i", "--ifile"):
		inputfile = arg
	elif opt in ("-o", "--ofile"):
		outputfile = arg

if inputfile == '' or outputfile == '':
	print 'main.py -i <inputfile> -o <outputfile>' 
	sys.exit()


#	Initialitate the variables

sim_var = ['model_n','model_p','temp','outputs','options','format','include','flavor','W', 'L','Ld','tran_extra' , 'VDS','VBS','VGS_ini', 'VGS_last', 'VGS_step','tempdata_filename','net_filename']

for var in sim_var:
	vars()[var] = []

for line in open(inputfile + '.ini'):
	[eval(var).extend((line.split())[1:]) for var in sim_var if line.find(var+' ') == 0 or line.find(var+'\t')==0]

for var in sim_var:
	print var
	print eval(var)
	
for var in outputs:
	vars()[var] = []

VGS = srange(VGS_ini[0],VGS_step[0], VGS_last[0])

for var in outputs:
	vars()[var+'_data'] = [[[[[0 for e in range(len(VGS))] for d in range(len(VBS))] for c in range(len(VDS))] for b in range(len(L))] for a in range(len(W))]

#	Define the template netlist

line_start_comment 		= '* TEMP NETLIST \n'
line_include 			= '.INCLUDE ' + include[0] + '\n\n'
line_options 			= ''.join(['.OPTION ' + a + '\n' for a in options]) + '\n'
line_temp 				= '.TEMP ' + temp[0] + '\n\n'
line_param				= Template('.param W = $WX \n.param L = $LX \n.param Ld = '+Ld[0]+'\n\n')

if flavor[0] == 'n':
	line_tran       	= Template("M1 VDD G 0 B " + model_n[0] + " W = 'W' L = 'L' $textra\n")
	line_vgs 			= 'VGS G 0 DC 1V \n\n'
	line_vbs			= Template('VBS B 0 DC -$VBSX \n\n')
else:
	line_tran       	= Template("M1 0 G VDD B " + model_p[0] + " W = 'W' L = 'L' $textra\n")
	line_vgs			= 'VGS VDD G DC 1V \n\n'
	line_vbs			= Template('VBS VDD B DC -$VBSX \n\n')

line_vds 				= Template('VDS VDD 0 DC $VDSX \n')

line_sim 				= '.DC VGS ' + VGS_ini[0] + ' ' + VGS_last[0] + ' ' + VGS_step[0] + '\n\n'
line_printfile 			= '.printfile DC ' + ' '.join([a+'(M1)' for a in outputs]) + ' file="'+ tempdata_filename[0] + '.dat" \n\n'	
line_end 				= '.op\n\n.end'


tran_data = [[[[a + ' ' + b + ' ' + c ' ' + d for d in VBS]  for c in VDS] for b in L] for a in W]

sim_n = len(tran_data)*len(tran_data[0])*len(tran_data[0][0])*len(tran_data[0][0][0])

ct = '%'
ex = '.m'
if format[0] == 'scilab':
	ct = '//'
	ex = '.sce'

#	Create the output file
m = open(outputfile + ex,'w')
m.write(('W_' + flavor[0] + '\t= [' + ';'.join(W) + '];').replace('u','') + '\n')
m.write(('L_' + flavor[0] + '\t= [' + ';'.join(L) + '];').replace('u','') + '\n')
m.write('Vds_' + flavor[0] + '\t= [' + ';'.join(VDS) + '];\n')
m.write('Vbs_' + flavor[0] + '\t= [' + ';'.join(VBS) + '];\n')
m.write('Vgs_' + flavor[0] + '\t= (' + VGS_ini[0] + ':' + VGS_step[0] + ':' + VGS_last[0] + ')\';\n\n')


m.write(ct + '\tStored transistor parameters: ' + ' , '.join(outputs) + '\n\n')

[m.write(var + '_' + flavor[0] + '\t= zeros(' + str(len(VGS)) + ',' + str(len(tran_data[0][0][0])) + ',' + str(len(tran_data[0][0])) + ',' + str(len(tran_data[0])) + ',' + str(len(tran_data)) + ');\n') for var in outputs]

i1,i2,i3,i4 = 0,0,0,0

#	Iterate through the transistor parameter combinations, simulate and store the parameters in the output file

for j in range(sim_n):
	o = open(net_filename[0] + '.cir','w')
	o.write(line_start_comment)
	o.write(line_include)
	o.write(line_options)
	o.write(line_temp)
	i_data = tran_data[i1][i2][i3][i4].split()
	o.write(line_param.substitute(WX = i_data[0], LX = i_data[1]))
	o.write(line_tran.substitute(textra = ' '.join(tran_extra)))
	o.write(line_vds.substitute(VDSX = i_data[2]))
	o.write(line_vgs)
	o.write(line_vbs.substitute(VBSX = i_data[3]))
	o.write(line_sim)
	o.write(line_printfile)
	o.write(line_end)
	
	o.close()

	os.system('eldo ' + net_filename[0] + '.cir')

	a1,a2,a3,a4,a5 = i1,i2,i3,i4,0
	
	for line in open(tempdata_filename[0] + '.dat').readlines():
		d_line = line.split()
		if len(d_line) == len(outputs) + 1:
			a = 1
			for var in outputs:		
				eval(var + '_data')[a1][a2][a3][a4][a5] = d_line[a]
				a = a + 1
			a1,a2,a3,a4,a5 = nindex5(eval(outputs[0]+'_data'),a1,a2,a3,a4,a5)
	m.write('\n')
	[m.write(var + '_'+ flavor[0] +'(:,' + str(i4+1) + ',' + str(i3+1) + ',' + str(i2+1) + ',' + str(i1+1) + ') = [' + ';'.join(eval(var + '_data')[i1][i2][i3][i4]) + '];\n') for var in outputs]
	i1,i2,i3,i4 = nindex4(tran_data,i1,i2,i3,i4)

os.system('rm ' + tempdata_filename[0] + '*')
os.system('rm ' + net_filename[0] + '*')
m.close()


print 'Elapsed time = ' + str(time.time()-ini_time)
