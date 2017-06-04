A=[-50 49;49 -50];
T=2; U0=[1 1]';U={}; K=3;I=3;
exact=@(t) [exp(-t)-exp(-99*t);
            exp(-t)+exp(-99*t)];
X=0:0.001:T;
Y=exact(X);
fns={@solve_by_abe @solve_by_ami};
types={'explicit' 'implicit'};

for j=1:length(fns)
  solve_method=fns{j};
  figure;
  for k=1:K
    h=10/(10*k^3);
    interval=0:h:T;
    for i=1:I
      U{i}=solve_method(interval,A,U0,i);
      subplot(K,I,(k-1)*I+i);
      scatter(interval,U{i}(1,:),'o','r');hold on;
      scatter(interval,U{i}(2,:),'p','g');hold on;
      plot(X,Y,'b');hold on;
      title(sprintf('Adams(%s) order-%d with h=%.4f',types{j},i,h));
    end
  end
  set(gcf,'PaperUnits','Inches','PaperPosition',[0 0 15 15]);
  print('-djpeg','-r100',sprintf('ex24-%s',types{j}));
end
