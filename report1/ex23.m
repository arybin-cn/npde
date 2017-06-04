A=-[99 7*sqrt(2);7*sqrt(2) 2];
T=2; U0=[1 1]';U={}; K=3;I=3;
fns={@solve_by_abe @solve_by_abi};
types={'explicit' 'implicit'};

for j=1:length(fns)
  solve_method=fns{j};
  figure;
  for k=1:K
    h=10/10^k;
    interval=0:h:T;
    for i=1:I
      U{i}=solve_method(interval,A,U0,i);
      subplot(K,I,(k-1)*I+i);
      scatter(interval,U{i}(1,:),'o','r');hold on;
      plot(interval,U{i}(1,:),'r');hold on;
      scatter(interval,U{i}(2,:),'.','g');hold on;
      plot(interval,U{i}(2,:),'g');hold on;
      axis([0 T -1 1.5]);
      title(sprintf('Adams-Bshforth(%s) order-%d with h=%.4f',types{j},i,h));
    end
  end
  set(gcf,'PaperUnits','Inches','PaperPosition',[0 0 15 15]);
  print('-djpeg','-r100',sprintf('ex23-%s',types{j}));
end
