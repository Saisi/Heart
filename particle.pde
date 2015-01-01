class HeartBeat{

	float nx = 0;
	float ny = 0;
	float x_vel = 0;
	float y_vel = 0;
	float x = 0;
	float y = 0;
	float size,r,g,b,a  = 0;

	HeartBeat(){
		x = center_x;
		y = center_y;
		size = random(1,max_size);
		x_vel = ((max_size + min_vel) - size)/2 - (random(1) * ((max_size + min_vel) - size));
		y_vel = ((max_size + min_vel) - size)/2 - (random(1) * ((max_size + min_vel) - size));
		nx = x;
		ny = y;
		r = g = b = 0.05 * size;
		a = random(20,250);
	}


	void draw(){
		r = ( 255 * ( x / width));
		g = ( 255 * (1 - ( y / height)));
		b = ( 255 - r );		
		fill(r,g,b,a);
		arc(x,y,size,size,0,PI*2);

	}

	void move(float dt){
	    nx += x_vel * dt;
	    ny += y_vel * dt;
	    if( !insideHeart(nx,ny)){
	      if( !insideHeart(nx,y)){
	        x_vel *= -1;
	        return;
	      }
					      
	    if( !insideHeart(x,ny)){
			y_vel *= -1;
			return;
		}
	    
	      x_vel = -1 * y_vel;
	      y_vel = -1 * x_vel;
	      return;
	    }
          
		x = nx;
		y = ny;

	}

	boolean insideHeart(float x, float y){
		x = ((x - center_x) / (center_x)) * 3;
	  	y = ((y - center_y) / (center_y)) * -3;
	  	float x2 = x * x;
		float y2 = y * y;
		return (pow((x2 + y2 - 1), 3) - (x2 * (y2 * y)) < 0);
	}
}