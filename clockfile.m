clc   %clear command window
clear %clear all variables
clf   %clear current figure
shg   %show graph window
axis([-1.1 1.1 -1.1 1.1]) %ristrict axis
axis square
axis off
x = sin(2*pi*(1:60)/60); %takes sin 0 to 2*pi in x
y = cos(2*pi*(1:60)/60);
k = 5:5:60; %minutes
line(x,y,'linestyle','none','marker','o','color','black','markersize',2)
line(x(k),y(k),'linestyle','none','marker','*','color','black','markersize',8)

h = line([0 0],[0 0],'color','blue','linewidth',5);%for hrs
m = line([0 0],[0,0],'color','blue','linewidth',3);%for min
s = line([0 0],[0 0],'color',[0 2/3 0],'linewidth',2);%for sec(r=0 g=170 b=0) light green color
d = line([0],[0],'marker','o','color',[0 2/3 0],'linewidth',1.5,'markersize',5);%for sec(r=0 g=170 b=0) light green color
klose = uicontrol('string','close','style','toggle');

while get(klose,'value')==0 
   c = clock;
   
   text(-0.4,-1.2,datestr(datenum(c(1),c(2),c(3))),'fontsize',16)   %writes date at given x,y
   t = c(4)/12 + c(5)/720 + c(6)/43200;         %compute value for hrs
   set(h,'xdata',[0 0.8*sin(2*pi*t)],'ydata',[0 0.8*cos(2*pi*t)])
   t = c(5)/60 + c(6)/3600;%calc min
   set(m,'xdata',[0 sin(2*pi*t)],'ydata',[0 cos(2*pi*t)])
   k = ceil(c(6));
   set(s,'xdata',[-(0.2*x(k)) .9*x(k) ],'ydata',[-(0.2*y(k)) .9*y(k)])
   set(d,'xdata',[-(0.2*x(k))],'ydata',[-(0.2*y(k))])
   pause(1.0)
end
close(gcf)