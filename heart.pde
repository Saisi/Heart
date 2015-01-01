int max_size = 24;
int max_particles = 1600;
float min_vel = 20;
float max_gen_per_frame = 8;

boolean animate = true;
ArrayList<HeartBeat> beats = new ArrayList<HeartBeat>();

float center_x = 0;
float center_y = 0;
float step = .25;

int max_dots = 1200;
float dots_constant =  2 * PI / max_dots;
float dot_step = 0;
int tick = 0;
int i = 0;

void setup(){
	size(500,500);
	background(255);
	frameRate(25);
	center_x = width/2;
	center_y = height/2;
	noStroke();
}
 
void draw(){

	background(255);
	
	for(HeartBeat h: beats){
		h.draw();
	}
	heartTick();
	dotsTick();

}



void heartTick(){

	int alive = beats.size();
	int dead = max_particles - alive;

	for( int i = 0; i < dead && i < max_gen_per_frame; i++ ){
	    beats.add(new HeartBeat());
	}

	for(HeartBeat p: beats){
		p.move(step);
	}
}


void dotsTick(){
	render_dots(dot_step);
	dot_step = ++dot_step%1e6;
}

void render_dots(float f){
	
	float angle = 0;
	
	for (int i = 0; i < max_dots; i++) {
		
		angle = dots_constant * i + (f * 0.001);
		float a =  width/2 + ((sin(f * 0.00005 * i) * 300) * cos(angle));
		float b =  height/2 + ((sin(f * 0.0005 * i) * 300) * sin(angle));

		fill(69,139,12);
		arc(a, b, 1, 1, 0, PI*2);
		
	}
}
