program Flappy;
private
f=0;
c=0;
demo=false;

begin

load_fnt("flappy.FNT");
set_fps(30,4);
//write_int(1,320,0,1,&fps);
write_int(1,320,0,1,&x);
write_int(1,320,32,1,&y);

load_fpg("flappy.FPG");
set_mode(m640x480);
start_scroll(0,0,2,3,0,5);

scroll[0].camera=camera();

graph=8;
size=25;
//flags=1;
ctype=c_scroll;
y=0;

loop
snowflake();

if(y<420 || f<0)
y+=f;
x+=10;
end

if(mouse.left || key(_enter) || key(_up) || key(_down) || key(_left) || key(_right) || key(_space) || key(_alt) || key(_control))
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
angle=(240-y)*100;


if(demo)
if(x>=1600)
x-=1600;
end
end

if(!demo)

if(timer[0]>50)
//rand(0,30)==10)
if(y<420)
present();
end

timer[0]=0;
end
end

c=collision(type present);

if(c)
presentgo(c.x,c.y,c.graph,c.size);
c.y=1000;
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


while(x>father.x || !out_region(id,0))

graph++;

if(graph==65)
graph=50;
end

//y+=10;
y+=3;

frame;

end

if(x>father.x)
father.x=0;
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
size++;
end

end


process snowflake()
private;

rang = 0;
begin

x=rand(640,0);
y=0;
graph=9;
size=rand(25,75);
rang=rand(-5,5);
if(rang==0) rang=1; end

while(!out_region(id,0));
angle+=(rang*5000);
y+=abs(rang)*5;

frame;

end


end
