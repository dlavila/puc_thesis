Vo=[
1	2976.136144	-0.053246046
1.258925412	2976.136146	-0.067032801
1.584893192	2976.136146	-0.084389296
1.995262315	2976.136144	-0.10623983
2.511886432	2976.136142	-0.133748021
3.16227766	2976.136138	-0.168378783
3.981071706	2976.136133	-0.211976328
5.011872336	2976.136124	-0.266862385
6.309573445	2976.13611	-0.335959836
7.943282347	2976.136088	-0.422948372
10	2976.136053	-0.532460447
12.58925412	2976.135997	-0.670327975
15.84893192	2976.135909	-0.843892897
19.95262315	2976.135769	-1.062398163
25.11886432	2976.135547	-1.337479946
31.6227766	2976.135195	-1.683787292
39.81071706	2976.134638	-2.119762214
50.11872336	2976.133755	-2.668621726
63.09573445	2976.132356	-3.359594126
79.43282347	2976.130138	-4.229475267
100	2976.126623	-5.324587603
125.8925412	2976.121051	-6.703246094
158.4893192	2976.112221	-8.438861814
199.5262315	2976.098227	-10.62384763
251.1886432	2976.076048	-13.37453209
316.227766	2976.040897	-16.83733947
398.1071706	2975.985189	-21.19655779
501.1872336	2975.896901	-26.68409366
630.9573445	2975.756988	-33.59170436
794.3282347	2975.535266	-42.28629963
1000	2975.183926	-53.22901199
1258.925412	2974.627261	-66.99881914
1584.893192	2973.745432	-84.32151405
1995.262315	2972.3489	-106.1046497
2511.886432	2970.138227	-133.4785021
3162.27766	2966.641276	-167.8416543
3981.071706	2961.115815	-210.9066119
5011.872336	2952.400576	-264.7343012
6309.573445	2938.692452	-331.7334647
7943.282347	2917.225354	-414.5772468
10000	2883.83732	-515.9489999
12589.25412	2832.458307	-637.9701941
15848.93192	2754.674794	-781.1034166
19952.62315	2639.781305	-942.3414082
25118.86432	2476.100118	-1112.786619
31622.7766	2254.537264	-1275.576313
39810.71706	1974.50912	-1406.425162
50118.72336	1649.735689	-1479.398779
63095.73445	1308.577721	-1477.378076
79432.82347	985.5304323	-1400.863546
100000	708.3321317	-1267.69887
125892.5412	489.8828134	-1103.966651
158489.3192	328.9953457	-933.657535
199526.2315	216.312402	-773.2000851
251188.6432	140.1419593	-631.1256834
316227.766	89.87993051	-510.2057552
398107.1706	57.23968897	-409.8539162
501187.2336	36.26250682	-327.8981371
630957.3445	22.87095505	-261.6450665
794328.2347	14.3585028	-208.4309781
1000000	8.962213396	-165.8640879
1258925.412	5.547255842	-131.901942
1584893.192	3.388516184	-104.8492995
1995262.315	2.024829001	-83.3226158
2511886.432	1.163757532	-66.20422985
3162277.66	0.62020302	-52.59694499
3981071.706	0.27714334	-41.78335996
5011872.336	0.060650205	-33.19124157
6309573.445	-0.075958245	-26.36484826
7943282.347	-0.162149778	-20.94156219
1.00E+07	-0.216521212	-16.63303103
1.26E+07	-0.250805573	-13.21003912
1.58E+07	-0.272401876	-10.4904147
2.00E+07	-0.285971042	-8.32938568
2.51E+07	-0.294441392	-6.611898816
3.16E+07	-0.299640255	-5.24650746
3.98E+07	-0.30268773	-4.160510036
5.01E+07	-0.30423741	-3.296084909
6.31E+07	-0.304616176	-2.607219956
7.94E+07	-0.303894781	-2.057278974
1.00E+08	-0.301909419	-1.61708412
1.26E+08	-0.298250931	-1.263425609
1.58E+08	-0.292245923	-0.977937601
2.00E+08	-0.282983814	-0.746292593
2.51E+08	-0.269491251	-0.557614374
3.16E+08	-0.251068205	-0.403826779
3.98E+08	-0.227239102	-0.278752528
5.01E+08	-0.196989762	-0.178284644
6.31E+08	-0.16039321	-0.101736526
7.94E+08	-0.121308323	-0.048997772
1.00E+09	-0.085019595	-0.017146002];

figure;

Voabs = sqrt(Vo(:,2).^2+Vo(:,3).^2);

subplot(2, 1, 1)

semilogx (Vo(:,1),20*log10(Voabs),'LineWidth',1.2,'Color','black')

ylabel('Magnitude (dB)','FontSize',14,'Interpreter','LaTeX') 

grid on

axis([1e0 1e9 -10 80])
set(gca,'FontSize',12)

subplot(2,1,2)

semilogx (Vo(:,1),180*angle(1i*Vo(:,3)+Vo(:,2))/pi,'LineWidth',1.2,'Color','black' )

grid on

axis([1e0 1e9 -120 5])
set(gca,'FontSize',12)
ylabel('Phase (deg))','FontSize',14,'Interpreter','LaTeX') 

xlabel('Frequency (Hz)','FontSize',14,'Interpreter','LaTeX') 

save2pdf('bode_OTA');
save2eps('bode_OTA');
