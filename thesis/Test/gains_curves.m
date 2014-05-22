test_gains_step_response

%figure1 = figure;
%axes1 = axes('Parent',figure1,'XTickLabel','-','FontSize',10);



hold all
%cc=hsv(64);
for i = 1:64
plot(dat{i}(:,1)*10^9,dat{i}(:,2));
end


xlabel('$t\;(\mathrm{ns})$','Interpreter','LaTeX','FontSize',18);
ylabel('$\left(\mathrm{V}\right)$','Interpreter','LaTeX','FontSize',18);

set(gca,'FontSize',13)

box(gca,'on')

axis([50 170 -0.01 0.06])

save2pdf('gain_curves');
save2eps('gain_curves');