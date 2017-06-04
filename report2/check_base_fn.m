%Check the base function.
I=0:0.01:1;
[U,dU]=base_fn_p1(0,1,0.2);
[U2,dU2]=base_fn_p2(0,1,0.2);
figure;
subplot(2,1,1);
scatter(I,U{1}(I),'o','r');hold on;
scatter(I,U{2}(I),'*','g');hold on;
scatter(I,U{end}(I),'p','b');hold on;
scatter(I,U{end-1}(I),'+','k');hold on;
subplot(2,1,2);
scatter(I,dU{1}(I),'o','r');hold on;
scatter(I,dU{2}(I),'*','g');hold on;
scatter(I,dU{end}(I),'p','b');hold on;
scatter(I,dU{end-1}(I),'+','k');hold on;
suptitle('P-1 Base Function');
saveas(gcf,'p1_base.png');

figure;
subplot(2,1,1);
scatter(I,U2{1}(I),'o','r');hold on;
scatter(I,U2{2}(I),'*','g');hold on;
scatter(I,U2{end}(I),'p','b');hold on;
scatter(I,U2{end-1}(I),'+','k');hold on;
subplot(2,1,2);
scatter(I,dU2{1}(I),'o','r');hold on;
scatter(I,dU2{2}(I),'*','g');hold on;
scatter(I,dU2{end}(I),'p','b');hold on;
scatter(I,dU2{end-1}(I),'+','k');hold on;
suptitle('P-2 Base Function');
saveas(gcf,'p2_base.png');
