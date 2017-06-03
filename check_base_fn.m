%Check the base function.
I=0:0.01:1;
[U,V]=base_fn_p1(0,1,0.2);
[U2,V2]=base_fn_p2(0,1,0.2);
%Show P-1 base function in [0,1]
figure;
subplot(2,1,1);
scatter(I,U{1}(I),'o','r');hold on;
scatter(I,U{2}(I),'*','g');hold on;
scatter(I,U{end}(I),'p','b');hold on;
scatter(I,U{end-1}(I),'+','k');hold on;
subplot(2,1,2);
scatter(I,V{1}(I),'o','r');hold on;
scatter(I,V{2}(I),'*','g');hold on;
scatter(I,V{end}(I),'p','b');hold on;
scatter(I,V{end-1}(I),'+','k');hold on;
suptitle('P-1 Base Function');
saveas(gcf,'p1_base.png');

figure;
subplot(2,1,1);
scatter(I,U2{1}(I),'o','r');hold on;
scatter(I,U2{2}(I),'*','g');hold on;
scatter(I,U2{end}(I),'p','b');hold on;
scatter(I,U2{end-1}(I),'+','k');hold on;
subplot(2,1,2);
scatter(I,V2{1}(I),'o','r');hold on;
scatter(I,V2{2}(I),'*','g');hold on;
scatter(I,V2{end}(I),'p','b');hold on;
scatter(I,V2{end-1}(I),'+','k');hold on;
suptitle('P-2 Base Function');
saveas(gcf,'p2_base.png');
