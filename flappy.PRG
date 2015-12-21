program Flappy;
global
loss=0;
demo=0;
local
caught=0;


private
f=0;
c=0;
begin

load_fnt("flappy16.FNT");
set_fps(30,2);
//write_int(1,320,0,1,&fps);
//write_int(1,320,0,1,&x);
write_int(1,320,32,1,&y);
write(1,320,0,1,"FLAPPY CHRISTMAS!");

load_fpg("flappy.FPG");
set_mode(m640x480);
start_scroll(0,0,2,3,0,13);

scroll[0].camera=camera();

graph=8;
size=100;
//flags=1;
ctype=c_scroll;
y=0;
fade_on();
angle=-10000;
loop
if(size>25)
size--;
end

snowflake();

if((y<440 && f>0) || (y>-40 && f<0))
y+=f;
end

x+=10;
//end

if(loss< 9 &&
(mouse.left || key(_enter) || key(_up) || key(_down) || key(_left) || key(_right) || key(_space) || key(_alt) || key(_control))
)

f=-10;
end

///if(mouse.right || key(_space))
//present();
//end


if(f<15)
f++;
end

//y=mouse.y;
//size=y/4;
//angle=(240-y)*100;


if(demo)
if(x>=1600)
x-=1600;
end
end

if(size==25)
steam(x-60,y+20);
end
if(!demo)

if(loss< 9 && timer[0]>50)
//rand(0,30)==10)
//if(y<420)
present();
//end

timer[0]=0;
end
end

c=collision(type present);

if(c)
presentgo(c.x,c.y,c.graph,c.size);
c.caught=1;
c.x=x-200;
end




frame;

end


end


process camera()

begin

loop
x=father.x+150;
ctype=c_scroll;

frame;
end

end



process present()

begin
x=father.x+640;//rand(300,400);
y=rand(-100,200);
ctype=c_scroll;
graph=50;
size=rand(25,100);


while((caught==0 && !out_region(id,0)) || x> father.x )
// || father.x<x)

graph++;

if(graph==65)
graph=50;
end

//y+=10;
y+=3;

frame;

end

//if(x>father.x)
//father.x=0;
//end

if(caught==0)
fail();
end


end


process presentgo(x,y,graph,size)

begin

//size=50;
ctype=c_scroll;

while(!out_region(id,0))

graph++;
if(graph==65)
graph=50;
end

frame(50);
y-=10;
size+=5;
end

end


process snowflake()
private;

rang = 0;
begin

flags=4;

x=rand(640,0);
y=0;
graph=10;
size=rand(25,75);
rang=rand(-5,5);
if(rang==0) rang=1; end

while(!out_region(id,0));
angle+=(rang*5000);
y+=abs(rang)*5;

frame;

end


end

process steam(x,y)
begin

ctype=c_scroll;

graph=9;

flags=4;
size=rand(25,100);
while(!out_region(id,0))
angle+=1000;
size+=5;
frame;

end


end


process fail()

begin
loss++;
//if(loss==3)
//demo=true;
//end

graph=11;
size=25;
x=600;
y=loss*50;
//y=100;
loop
frame;

end

end

