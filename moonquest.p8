pico-8 cartridge // http://www.pico-8.com
version 38
__lua__
--main

--todo
--1. refactor code (objects using tables)
game={}

function _init()
	init_vars()
	show_menu()
end

function _update()
	game.upd()
end

function _draw()
 game.drw()
end
-->8
--menu

function show_menu()
 music(63)
 game.upd=menu_update
 game.drw=menu_draw
 blnk={
  colr={0,2,8,7,8,2},
  i=0,
  f=0,
  s=5
 }
 st=false
 fl_num=5
end

function menu_update()
	if btnp(4) or btnp(5) then
		st=true
		blnk.s=1
	end
	blnk.f+=1
	if blnk.f%blnk.s==0 then
		if blnk.i+1>#blnk.colr then
		 blnk.i=0
		else
		 blnk.i+=1
		end
	end
	if st==true and blnk.i==0 then
		fl_num-=1
		if fl_num==0 then
			mode="game"
			show_game()
		end
	end
end

function menu_draw()
	cls()
	sspr(12*8,0,32,32,28,24,64,64)
	print("press ❎ to start",30,100,blnk.colr[blnk.i])
end
-->8
--game

function show_game()
	deaths=0
	game.upd=game_update
	game.drw=game_draw
	music(0)
	
	gfx={}
	
	moons=0
	moon={}
	add_moon(40,30)
	
	game_reset()
end

function game_update()
	player_update()
	player_animate()
	for u in all(umb) do
	 u:update()
	end
	cam_update()
	
	for m in all(moon) do
	 m:update()
	end
	for r in all(rain) do
	 r:update()
	end
	for g in all(gfx) do
	 g:update()
	end
	
 --debug
	if debug_on then
		debug_update()
	end
	
end

function game_draw()
	cls(0)
	for r in all(rain) do
	 r:draw()
	end
	map(0,0)
	for u in all(umb) do
	 u:draw()
	end
	for m in all(moon) do
	 m:draw()
	end
	spr(player.sp,player.x,player.y,1,1,player.flp)
	
	
 for i=1,#enm do
  local myenm=enm[i]
  spr(myenm.spr,myenm.x,myenm.y)	
	end

	if deaths>0 then
	 print("deaths:"..deaths,cam.x+2,cam.y+120,7)
	end
	
	drw_mns(moons,2)
	for g in all(gfx) do
	 g:draw()
	end
	--debug
	if debug_on then
	 debug_draw()
	end
end

function game_reset()
	player_init(10,10)
	cam_init()
	
	umb={}
	add_umb()
	
	rain={}
	for i=1,100 do
	 add_rain()
	end
	
	enm={}
	local my_en={}
	my_en.x=90
	my_en.y=20
	my_en.spr=54
	add(enm,my_en)
	
end
-->8
--player
function player_init(_x,_y)
 player={
	 sp=1,--sprite
	 x=_x,
	 y=_y,
	 w=8,
	 h=8,
	 flp=false, 
	 dx=0,
	 dy=0,
	 max_dx=6,
	 max_dy=5,
	 acc=0.7,
	 boost=5,
	 wljmp_frc=5,
	 wljmp_dx=5,
	 wljmp_dy=5,
	 wlclm_dy=5,
	 anim=0,
	 hb={
	  x1=0, y1=0,
	  x2=7, y2=7
	 },
		running=false,
		jumping=false,
		sliding=false,
		landed=false,
		on_wall="none",
		prev_wall="none",
		--debug
		db={
		 x1r=0, y1r=0,
		 x2r=0, y2r=0,
		 c_u=false, c_d=false,
		 c_l=false, c_r=false
		}
	}
end

function player_update()

	--physics
	player.dy+=gravity
	if player.on_wall!="none" then
	 if player.dy>player.wljmp_frc then
	  player.dy=player.wljmp_frc
	 end
	 if player.dy>0.5 then
		 if player.on_wall=="l" then
		  add_dust(player.x,player.y,player.dx,player.dy)
		 else
		  add_dust(player.x+player.w,player.y,player.dx,player.dy)
		 end
		end
	end
	if player.sliding and abs(player.dx)>2 then
	 add_dust(player.x+player.w/2,player.y+player.h,player.dy,player.dy)
	end
	player.dx*=friction
	
	--controls
	if btn(⬅️) then
		player.dx-=player.acc
		player.running=true
		player.flp=true
	end
	if btn(➡️) then
		player.dx+=player.acc
		player.running=true
		player.flp=false
	end
	
	--slide
	if player.running
	and not btn(⬅️)
	and not btn(➡️)
	and not player.falling
	and not player.jumping then
	 player.running=false
	 player.sliding=true
	end

	--jump
	if btnp(❎)
	and player.landed then
		player.dy-=player.boost
		sfx(62)
		player.landed=false
		
	--let go of ❎ for short hop
	elseif not btn(❎)
	and player.jumping then
	 player.dy=0
	 player.jumping=false
	 
	--wall jump left
	elseif btnp(❎)
	and player.on_wall=="l" then
		sfx(62)
		if player.prev_wall=="l" then
	  player.dy=-1*player.wlclm_dy
	 else
	  player.dy=-1*player.wljmp_dy
	 end
	 player.prev_wall="l"
	 player.dx+=player.wljmp_dx
	 player.jumping=true
	 
	--wall jump right
	elseif btnp(❎)
	and player.on_wall=="r" then
	 sfx(62)
	 if player.prev_wall=="r" then
	  player.dy=-1*player.wlclm_dy
	 else
	  player.dy=-1*player.wljmp_dy
	 end
	 player.prev_wall="r"
	 player.dx-=player.wljmp_dx
	 player.jumping=true
	end 
	
	--check hitbox for bad things
	if player.dx<0 and collide_map(player,"left",2)
	or player.dx>0 and collide_map(player,"right",2)
	or player.dy>0 and collide_map(player,"up",2)
	or player.dy<0 and collide_map(player,"down",2)
	then
	 sfx(63)
	 add_wipe(8)
	 deaths+=1
		game_reset()
	end
	
	--check hitbox for good things
	for m in all(moon) do
		if touch(player,m) then
		 sfx(61)
		 moons+=1
		 add_swoosh(m.x+0.5*m.w,m.y+0.5*m.h)
		 del(moon,m)
		end
	end
	
	if not collide_map(player,"left",1)
	 and not collide_map(player,"right",1) then
	  player.on_wall="none"
	 end
	
	--check collision on y
	if player.dy>0 then
		player.falling=true
		player.landed=false
		player.jumping=false
		
		player.dy=limit_speed(player.dy,player.max_dy)
		
		if collide_map(player,"down",0) then
		 player.landed=true
		 player.prev_wall="none"
		 player.falling=false
		 player.dy=0
		 player.y-=((player.y+player.h+1)%8)-1
		 player.db.c_d=true
		end
	elseif player.dy<0 then
		player.jumping=true
		if collide_map(player,"up",1) then
		 player.dy=0
		 player.db.c_u=true
		end
	end
	
	--check collision on x
	--moving left
	if player.dx<0 then
	 player.dx=limit_speed(player.dx,player.max_dx)
	 if collide_map(player,"left",1) then
	 	player.dx=0
	 	player.on_wall="l"
	 	player.db.c_l=true
	 	while flr(player.x)%8!=0 do
	 	 player.x+=1
	 	end
	 else
	 	player.on_wall="none"
	 end
	elseif player.dx>0 then
	 
	 player.dx=limit_speed(player.dx,player.max_dx)
	 
	 if collide_map(player,"right",1) then
	  player.dx=0
	  player.on_wall="r"
	  player.db.c_r=true
	  while flr(player.x)%8!=0 do
	 	 player.x-=1
	 	end
	 else
	 	player.on_wall="none"
	 end
	else
		player.db.c_u=false
		player.db.c_d=false
		player.db.c_l=false
		player.db.c_r=false
	end
	
	
	
	--stop sliding
	if player.sliding then
	 if abs(player.dx)<.2
	 or player.running then
	  player.dx=0
	  player.sliding=false
	 end
	end
	
	--move
	player.x+=player.dx
	player.y+=player.dy

	--limit to map
	if player.x<map_start then
	 player.x=map_start
	end
	if player.x>map_end-player.w then
	 player.x=map_end-player.w
	end
end

function player_animate()
 if player.on_wall!="none" then
 	player.sp=5
	elseif player.jumping then
	 player.sp=6
	elseif player.falling then
	 player.sp=8
	elseif player.sliding then
	 player.sp=7
	elseif player.running then
	 if time()-player.anim>.1 then
	  player.anim=time()
	  player.sp+=1
	  if player.sp>4 then
	   player.sp=3
	  end
	 end
	else --player idle
		if time()-player.anim>.3 then
		 player.anim=time()
		 player.sp+=1
		 if player.sp>2 then
		  player.sp=1
		 end
		end
	end
end

function limit_speed(num,maximum)
 return mid(-maximum,num,maximum)
end
		
-->8
--debug

function debug_update()

end

function debug_draw()
	print("debug:on",cam.x,cam.y,11)
	print("on_wall:"..player.on_wall,cam.x,cam.y+10,11)
 print("moons:"..moons,cam.x,cam.y+16,11)
	rect(
	 player.db.x1r,
	 player.db.y1r,
	 player.db.x2r,
	 player.db.y2r,
	 11
	)
	print("c<⬆️>:"..(player.db.c_u and 'true' or 'false'),player.x,player.y-10)
	print("c<⬇️>:"..(player.db.c_d and 'true' or 'false'),player.x,player.y-16)
	print("c<⬅️>:"..(player.db.c_l and 'true' or 'false'),player.x,player.y-22)
	print("c<➡️>:"..(player.db.c_r and 'true' or 'false'),player.x,player.y-28)
end
-->8
--cam

function cam_init()
 cam={
  x=0,
  y=0,
  tx=0,
  ty=0,
  spd=.9,
  lk=20
 }
end

function cam_update()
 cam.tx=player.x-64
	if player.flp then
  cam.tx-=cam.lk
 else
 	cam.tx+=cam.lk
 end
 cam.ty=player.y-64
 
 cam.x=(cam.spd*cam.x)+((1-cam.spd)*cam.tx)
 cam.y=(cam.spd*cam.y)+((1-cam.spd)*cam.ty)
	--do not go off of the map
	--left bound
	if cam.x<map_start then
	 cam.x=map_start
	end
	--right bound
	if cam.x>map_end-128 then
	 cam.x=map_end-128	
	end
	--top bound
	if cam.y<map_top then
		cam.y=map_top
	end
	--bottom bound
	if cam.y>map_bottom-128 then
		cam.y=map_bottom-128
	end
	
	camera(cam.x,cam.y)
end
-->8
--variables

function init_vars()
	gravity=0.35
	friction=0.88
	
	--map limits
	map_start=0
	map_end=1024
	map_top=0
	map_bottom=64*8

	debug_on=false
end
-->8
--collisions

function collide_map(obj,dir,flag)
	--obj=table needs x,y,w,h,hb
	local x=obj.x
	local y=obj.y
	local dx=obj.dx
	local dy=obj.dy
	local w=obj.w
	local h=obj.h
	local hb=obj.hb
	
	--collision box
	local x1=0 local y1=0
	local x2=0 local y2=0
	
	--placing collision box
	if dir=="left" then
		x1=x+hb.x1-1
		y1=y+hb.y1+dy
		
		x2=x+hb.x1-1
		y2=y+hb.y2+dy-3
		
	elseif dir=="right" then
		x1=x+hb.x2+1
		y1=y+hb.y1+dy
		
		x2=x+hb.x2+1
		y2=y+hb.y2+dy-3
	
	elseif dir=="up" then
	 x1=x+hb.x1+3
	 y1=y+hb.y1+dy
	 
	 x2=x+hb.x2-3
	 y2=y+hb.y1+dy
	
	elseif dir=="down" then	
	 x1=x+hb.x1+dx
	 y1=y+h
	 
	 x2=x+hb.x2+dx
	 y2=y+h
	end
	
	--debug
	if debug_on then
		player.db.x1r=x1
		player.db.y1r=y1
		player.db.x2r=x2
		player.db.y2r=y2
	end
	
	--pixels to tiles
	x1/=8 y1/=8
	x2/=8 y2/=8
	
	--check collide (finally)
	if fget(mget(x1,y1), flag)
	or fget(mget(x1,y2), flag)
	or fget(mget(x2,y1), flag)
	or fget(mget(x2,y2), flag) then
	 return true
	else
		return false
	end
end

function touch(o1,o2)
 if o1.x+o1.w<o2.x
 or o2.x+o2.w<o1.x
 or o1.y+o1.h<o2.y
 or o2.y+o2.h<o1.y then
  return false
 else
  return true
 end
end
-->8
--effects
function add_rain()
 add(rain,{
  x=flr(rnd(128)),
	 y=flr(rnd(128)),
	 l=flr(rnd(7)),
	 s=flr(rnd(3))+3,
	 draw=function(self)
	 	for i=1,self.l do
	 		local colr=0
	 		if i<0.2*self.l then
	 		 colr=0
	   elseif i<0.7*self.l then
	    colr=13
	   else
	    colr=1
	   end
	   pset(self.x+cam.x+i,self.y+cam.y-i,colr) 
	  end
	 end,
	 update=function(self)
	  self.x-=self.s
			if self.x<-4 then
				self.x+=132
			end
			self.y+=self.s
			if self.y>132 then
				self.y-=132
			end
	 end
 })
end

function add_swoosh(_x,_y)
 add(gfx,{
  x=_x,
  y=_y,
  t=0,
  r=10,
  phi=4,
  thta=0,
  draw=function(self)
   for i=1,10 do
    local theta=(0.03*i)+self.thta
    local phi=(0.1*i)*self.phi
    local r=self.t
    circfill(self.x+r*cos(theta),self.y+r*sin(theta),phi,7)
   end
  end,
  update=function(self)
   self.t+=1
   self.thta=(0.1*(self.t))
   if self.phi<0 then
    del(gfx,self)
   end
   self.phi-=0.1
  end
 })
end

function add_wipe(_c)
 add(gfx,{
  colr=_c,
  a=0,
  b=0,
  draw=function(self)
   local a=self.a
   local b=self.b
   local x=cam.x+63
   local y=cam.y+63
   for i=a,b do
    rect(x-i,y-i,x+i,y+i,self.colr)
   end
  end,
  update=function(self)
   self.b+=10
   if self.b>=64 then
    self.a+=10
   end
   if self.a>128 then
    del(gfx,self)
   end
  end
 })
end

function add_dust(_x,_y,_dx,_dy)
 add(gfx,{
  x=_x,
  y=_y,
  dx=_dx+rnd(1)-1,
  dy=_dy,
  r=rnd(3),
  draw=function(self)
   circfill(self.x,self.y,self.r,13)
  end,
  update=function(self)
   self.r-=0.1
   if self.dy>-1.5 then
    self.dy=(self.dy - 1.5)/2
   end
   if self.dx<-0.1 then
    self.dx+=0.1
   elseif self.dx>0.1 then
    self.dx-=0.1
   else
    self.dx=0
   end
   self.x+=self.dx
   self.y+=self.dy
  end
 })
end
-->8
--moons
function add_moon(_x,_y)
 add(moon,{
  sp={48,49,50,51,52,51,50,49},
  x=_x,
  y=_y,
  w=8,
  h=8,
  flp=false,
  t=0,
  i=1,
  rev_anim=false,
  draw=function(self)
   spr(self.sp[self.i],self.x,self.y,1,1,self.flp)
   circ(self.x+4,self.y+4,1.3*(sin(0.1*self.t)+8),13)
  end,
  update=function(self)
   local t=self.t
   local l=#(self.sp)
   --flip only during short window
   if t%l<=4.01 
			and t%l>=3.99 then
				self.flp=(not self.flp)
		 end
		 --set index based on time
		 self.i=flr(t%l)+1
   --float up&down
   self.y=self.y+sin(0.05*self.t)
   self.t+=0.5
  end
 })
end

function drw_mns(_n,_m)
 for i=0,_n do
  spr(17,cam.x+120,cam.y+8*i)
 end
 for i=_n,_m-1 do
  spr(16,cam.x+120,cam.y+8*i)
 end
end

-->8
--umbrella
function add_umb()
 add(umb,{
  x=0,
  y=0,
  ty=0,
  spd=0.8,
  draw=function(self)
   spr(9,self.x,self.y,1,1,true)
  end,
  update=function(self)
   self.ty=player.y+(player.h/2)-7
 		self.x=player.x+5
 		--interpolate to ty with t=spd
 		self.y=(self.spd*self.y)+((1-self.spd)*self.ty)
			--top bound
			if self.y<self.ty-5 then
				self.y=self.ty-5
			end
			--bottom bound
			if self.y>self.ty+2 then
				self.y=self.ty+2
			end
  end
 })
end


-->8
--flag
function add_flag(_x,_y)
 add(flag,{
  x=_x*8,
  y=_y*8,
  up=false,
 })
end
__gfx__
00000000077777700000000007777770077777700000777007777770000000000777777060888800000000000000000000700000070000000000000000000000
00000000777277270777777077727727777277270077777777727727077777707772772708888280000000000000000007700000077007770007770077000777
000700707778778777727727777877877778778707777277777877877772772777787787888222000000d0000000000007770000777077277077277007700070
00007700777777777778778777777777777777770727787777777777777877877777777788262000d0000d000000000007777007770072227072227007770070
00007700777777777777777777777777777777770787777777777777777777777777777788226000000000000000000007707777070072227072227007070070
00070070077777707777777707777770077777700077777707777770777777770777777082200600d00000000000000000700770070072827072827007077070
000000000070060007777770007006000070060000777777007006000777777670000006080000600000000000000000d0700070070078887078887007007770
000000000070060000700600070006000070600000077700070060000077006000000000000006600dd0000d00000000d07d0000070078887078887007000770
00000000000000000000700080000880000888000888000088000000000000000000000000000000000000000000000007700000d70077877077877007000070
00000d000000080000007000880088880888888888888088888008880000000d0000000000000000000000000000000007700000070007770007770077700777
000000d0000000800000700088828280882888808888888088888880000000d10000000000000000000000000000000000700000070000000000000000000000
000000d0000000800000700082888880888828808282888028288820000000d100000000000000000000000000000000007000d007077700000000d000000777
000000d000000080000070008228228082822820282828800882888000000d1d0000000000000000000000000000000000700000070007777777777777777700
0d000dd008000880000060002282822888220288220022880228828800000111000000000000000000000000000000000070d00007000d00000d0d00000d0000
00dddd0000888800000060000222200082200000200002000002220000000d10000000000000000000000000000000000070000d0700ddd000000d00000d0000
000000000000000000077700000000000000000000000000000000000000d100000000000000000000000000000000000000000007700d000d000d0000dd0070
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ddd0000d0070
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077777770070000000d0000000770
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000777770007700770000000700770077
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077d7000000770700777077007070070
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007d77000000070700070070007070070
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077d70000000070700070077007000070
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007dd70000000070700070070000700070
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007dd70000000070700070070000770070
0000070000000700000070000007000000070000000000000070707007070700007070700707070000000000000000007dd77000000070770770077000070070
0000007000000700000007000000700000070000000000007077770000777707707777000077770700000000000000007ddd7000000070077700000707700070
0000007700000070000007000000700000070000000000000777777777777770077777777777777000000000000000007ddd770077777000000dddd000000070
00000077000000700000070000007000000700000000000077771770077717777777777007777777000000000000000007ddd7777dd770000ddd00dd00000070
0000007700000070000007000000700000070000000000000777c7777777c7700777c777777777700000000000000000077ddddddd7d77000d00000dd0000070
7000077707000770007007000007700000070000000000007777777007777777777777700777777700000000000000000077ddddd77dd7770000dd00ddd00070
0777777000000700007077000007700000070000000000000077770770777700007777077077770000000000000000000007777777000000000dddd000dd0000
00777700007777000007700000070000000700000000000007070700007070700707070000707070000000000000000000000770000000000000000000000000
77777777777777777777777707777777777777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77171771717777171777717777777177777717770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
117777777777177777717771771777171717777700000000000000000000000d0000000000000000000000000000000000000000000000000000000000000000
71717171171771171717777171711777177177170000000000000000000000d00000000000000000000000000000000000000000000000000000000000000000
1711771117717111111171717771717717111777000000d0000000000dd000d00dd000000000d00000dd00000000000000000000077777777777000000000000
111117171171111111717117777111717117171700d00d0d0000d000d00d00d0000d00d0000ddd000dddd0000000000000000777777777777777777766000000
11111171117111111711711177171111111171170d00000d000d00000d0d0d00000d0d0d0000d0000dddd00d0000000000077777777777777777777776660000
11111111111111111177111171111111111111170d00d00dd00d0d00000d0d000d0d0d000d00d00d0dddd0d00000000007777776667777776667777777666000
71111111111111171111111171111111111111170000700000000008888888888000000000000000000000000000000007777668887777778886677767666660
71111111111111171111111171111111111111170000800000008888088888808880000000000000000000000000000077777882286777768228877777766666
77111111111111171111111171111111111111170007880000888888088888808888800000000000000000000000000077777822288777788222877777676666
71111111111111771111111171111111111111170088880078888888088888008888870000000000000000000000000077776872228777782722877777666666
71111111111111111111111171111111111111170088888000788888008888008888888700000000000000000000000077778278828777782782877776766666
71711111111111111111111171111111111111170888888000088888008870008888880000000000000000000000000077778878888777788788877777666666
17111111111111111111111171111111111111170888888000000888000800008888000000000000000000000000000077778eeee8777778eeee877777676666
111111111111111111111111711111111111111788888888000000080007000080000000000000000000000000000000777778ee88777778eee8777776666666
07777777777777777777777071111111111111170777777071111117000000000000000000000000000000000000000077777888877777778887777777666666
77e77e7ee7eee7e7e7eee77771111111111111177771777771111117000000000000000000000000000000000000000077777777777777777777777777766666
7777e7ee7ee7ee7e7ee7ee7771111111111111177717777771111117000000000000000000000000000000000000000067777777777777777777777776666666
07777777777777777777777071111111111111177777177771111117000000000000000000000000000000000000000067777777776777777776777677666666
0000d000d000d000d000d00071111111111111177717771771111117000000000000000000000000000000000000000067767777777777777777777777766666
000ddd00d00ddd00d00ddd0071111111111111177111177771111117000000000000000000000000000000000000000067776767776776767777767776666666
0000d0000000d0000000d00077111111111111777711111771111117000000000000000000000000000000000000000006777777777777777777777676766666
0000d0000000d0000000d00007777777777777707111111771111117000000000000000000000000000000000000000006666676677667767776777767666666
07777770111111110000000000000000077777707111111707777777777777777777777000000000000000000000000000667666667777667666676666666660
77e77e77111111110000000000000000777777777111111777777777717177717777717700000000000000000000000000006666766666666676666667666660
7777e7e7111111110000000000000000771717177111171777717117171717111771771700000000000000000000000000000066666666666666667666666600
07777770111111110000000000000000717177777111111771711717117711111711717700000000000000000000000000000000766666666666666666660000
0000d000111111110000000000000000711171777171111771711117117111711171117700000000000000000000000000000000776600000000076660000000
000ddd00111111110000000000000000711711177111111771111711111111111111111700000000000000000000000000000000776600000000077660000000
0000d000111111110000000000000000771111777711117777111111111111111111117700000000000000000000000000000007776600000000777660000000
0000d000777777770000000000000000077777700777777007777777777777777777777000000000000000000000000000000007776600000000777660000000
__gff__
0000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003030303030000000000000000000000020200020204040404000000000000000101010202030200000000000000000001020000030203030300000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
5271717171717171717171717171715252520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5400000000000000000000000000005352520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5400000000000000000000000000005352520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5400000000474546000000000000005352520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5400000000434244000000000000005352520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5400494a00535254464800000000005352520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5142414241404241404240440000005352520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5252525252525252525252540000005352520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5271717171717171717171640000005352520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5400000000000000000000000000005352520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5400000000000000000000000000005352520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5400000000000000000000000000005352525252525252525252520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5400000000555555000000000000005352527171717171717152717171717171717171717153000000535352520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5400000043424142404240414042405252540000000000000066000000000000000000000066000000535252520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5400005653527152525252525252525252540000000000000066000000000000000000000066000000535252520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5400005653544953525252525252525252540000000000000066000000000000000000000066000000535252520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5400005653524152525252525252525252540000434400000075000000004344000000000066000000535252520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5400000063717171717171717171717171640000535400000000000000005354000000000075000000535252520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5400000000000000000000000000000000000000535400000000000000005354000000000000000000535252520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5400000000000000000000000000000000000000535400000000000000005354000000000000000000535252520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5400004745000000000000000000000000000000535400606161616200005354000000000000000000535252520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5240414142404400000000000000000043414142505400000000000000005354000000000000000000535252520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5252525252525400000000000000006053525252525455555555555555555354000000000000000000535252000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5252525252525461616162000000000053525252525141404241404040415254000000000000000000535252000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5252525252525400000000000000000053525252525252525252525252525254555555555555555555535252000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5252525252525455555555555555555553525252525252525252525252525251414242414041424142525252000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5252525252525240404240424041404252525252525252525252525252525252525252525252525252525252520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5252525252525252525252525252525252525252525252525252525252525252525252525252525252525252520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
011000201f2211f2221f2221f2251f2221f2251e2221c2221c2221c2221c2221c2251e2221e2251f2221f2252122121222212222122521222212251f2221e2221e2221e2221e2221e2251f2211f2251e2221e225
011000001e2221e2221f2221f2251f2221f2251e2221c2221c2221c2221c2221c2251e2221e2251f2221f2252122223222232222122224222242252122223222232222322223222232251e2221e2251722117225
491000001722117222172221722517222172251522213222132221322213222132251522215225172221722518221182221822218225182221822517222152221522215222152221522517221172251522215225
4910000015222152221722217225172221722515222132221322213222132221322515222152251722217225182221a2221a222182221c2221c222182221a2221a2221a2221a2221a22518222182251322113225
4710000004245042451024504245042000424510245042450b2450b245172450b2450b2000b245172450b2450c2450c245182450c2450c2000c2451824500245092450924515245152450b2450b2451724517245
31100020284152f415374153c4153b415374152f4152b415284152f415374153c4153b415374152f4152b415284152f415374153c4153b415374152f4152b415284152f415374153c4153b415374152f4152b415
011000002812228122281222b1212b1222a1222b1212b1222b1222b1222b1222b1222a1222a1222b1252b12226127261220010026122001002612528121281222812228122281222812200100001002312223122
011000000207334715296350207334715020732963534715020733471529635020733471502073296350207302073347152963502073347153471529635347150207334715296350207334715347152963529635
011000002812228122281222b1212b1222a1222d1212d1222d1222d1222d1222d1222f1222f1222d1222f1223012530122001003012200100301252f1212f1222f1222f1222f1222f12200100001002312223122
4710002010235132351723510235132351723510235132350b2350e235122350b2350e235122350b2350e2350c23510235132350c23510235132350c235102350e23512235152350e23512235152350e23512235
4710000010235132351723510235132351723510235132350b2350e235122350b2350e235122350b2350e2350c23510235132350c23510235132350c235102350f23512235152351723515235122350f2350b235
0110000028435284350000526435264352b4052b4352a4352343523435000052643526435000052a435264352443524435000052843528435000052b435284352643526435000052a4352a435000052d4352a435
011000001e2221e2221f2221f2251f2221f2251e2221c2221c2221c2221c2221c2251e2221e2251f2221f22521221212222122221222232222322524222232222322223222232222322223222232251720017200
0110000015222152221722217225172221722515222132221322213222132221322515222152251722217225182211822218222182221a2221a2251c2221a2221a2221a2221a2221a2221a2221a2251320013200
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
31102001107651e7001070010765237000e765107651e700107000070513765007051576513765127650e765107651e7001070010765237000e76510765007050070500705187650070515765177651376512765
01100000100431c6001c62510043000031c6251004300003000031020010200102001020010200170430000310043000031c62510043000031c62510043000030000310200102001020010200102001704300003
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010500002b1402f141341403414530100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100
49010000263242a3212c3212e32130321323213432136325343003a3003f3002b3002e30031300323000030000300003000030000300003000030000300003000030000300003000030000300003000030000300
4f0200001d37017370113600c36007350003500030000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300
__music__
01 40424405
01 41430405
01 00420405
01 01430405
01 00020405
01 01030405
01 00020405
01 0c0d0405
01 05060704
01 05080704
01 05060704
01 05080704
01 09074b44
02 0a074b44
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
03 20214344

