This folder contains:


gmId_sim.py - generates the matlab files with the transistors data.
	* OS: Unix.
	* Dependences: python2.7, Eldos.
	* Usage: python gmId_sim.py -i inputfilename -o outputfilename		// inputfilename and outputfilename must be written without extension
			 inputfilename.ini must be created in the current folder and has the following format:
			
			
			include  $MGC_DESIGN_KIT/models/ELDO/include_all					//	include the netlist dependences
			options 		NOASCII MODWL ENGNOT AEX							//  include the simulation options
																				//
			model_n			n_18_mm												//	nmos transistor model name  
			model_p			p_18_mm												//	pmos transistor model name
																				//
																				//
			flavor			n													//	flavor of the transitor for the current dataset simulations, options 'n' or 'p'
			W 			0.3u 0.6u 1.2u											//	list of transistor weights, SPICE format values
			L 			0.18u 0.36u 0.72u										//	list of transistor lengths, SPICE format values
			Ld			0.49u													//	transistor Ld 
			tran_extra		AS='Ld*W' AD='Ld*W' PS='2*Ld+2*W' PD='2*Ld+2*W' 	//	extra arguments for the transistor instantiation, SPICE format string
			VDS 			0.01 0.03 0.06 0.09 0.1 0.2 0.3 0.4 0.5 0.6 0.7		//	list of Vds values
			VBS				0 0.5 1												// 	list of Vbs values
			VGS_ini 		0.1													//	lower value of Vgs for the DC simulation
			VGS_last 		1.8													//	high value of Vgs for the DC simulation
			VGS_step 		0.01												//	step of Vgs for the DC simulation
			temp 			27													//	temperature of the simulation
																				//
																				//
			outputs	 	id gm gmb gds ro vt cgs cgd cgb csb cdb cgg				//	outputs variables to save
																				//
			format			matlab												// 	output file format, options 'matlab' or 'scilab'
																				//
			net_filename		temp											//	temp netlist file name without extension
			tempdata_filename	tempdata										//	temp output data file name without extension
			data_filename		data											//	output data filename without extension
			
