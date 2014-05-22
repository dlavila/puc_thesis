test_gains_step_response

%figure1 = figure;
%axes1 = axes('Parent',figure1,'XTickLabel','-','FontSize',10);



hold all
%cc=hsv(64);

gain = 58;
plot(dat{gain}(:,1)*10^9,dat{gain}(:,2),'LineWidth',1.5,'Color','Black');



xlabel('$t\;(\mathrm{ns})$','Interpreter','LaTeX','FontSize',18);
ylabel('$\left(\mathrm{V}\right)$','Interpreter','LaTeX','FontSize',18);


box(gca,'on')

axis([50 170 -0.01 0.04])

set(gca,'FontSize',14)

save2pdf('settling_time');
save2eps('settiling_time');


