% 凡x,y均表示平均值,k=(x*y-xy)/(x^2-x2),返回值分别为k,b,x,y,中间值均有输出
% 若只需k,b，采用polyfit()更好
function [k,b,x,y]=min2mult(X,Y)
try
    x=sum(X)/length(X);
    y=sum(Y)/length(X);
    x2=sum(X.^2)/length(X);
    xy=sum(X.*Y)/length(X); %求均值亦可用mean()
    syms m n;
    m=x*y-xy;
    n=x^2-x2;
    k=m/n;
    b=y-k*x;
    fprintf("xy=%f\nx2=%f\nnumerator=%f\ndenominator=%f\n",xy,x2,m,n);
    hold on
    plot(X,Y,"--*")
    y1=b+k*X;
    plot(X,y1,"-ro")
    legend("experiment","fit")
    hold off
    xlabel("X")
    ylabel("Y")
catch
    error("请检查输入数组的维数是否一致");
end