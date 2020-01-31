varying vec4 v_color;       //(入力)色

uniform vec2 center;

uniform vec2 size_div2;

uniform float time;

float u(float x ){ return (x > 0.0) ?1.0:0.0 ;}

void main()
{
   
	vec2 p = gl_FragCoord.xy - center;

	float col;

	float len;

	len = length(p) / size_div2.x;


	//課題


	//円全体
	col = len;         
	col = 1 - col;      
	col = step(0 , col);



	//赤い部分
	float red;

	red = len;
	red = 1 - red;
	red = step(0.1 , red);


	//中央の黒い輪の部分
	float cBlack;
	
	cBlack = len;
	cBlack = 1 - len;
	cBlack = abs(0.2 - len);  //中心から0.2離れたところを0にする
	cBlack = 0.11 / cBlack;   //割る数が0<x<1のとき割られる数が大きくなることを利用
	cBlack = step(1 , cBlack);
	cBlack = 1 - cBlack;


	//上の円
	float up;
	vec2 pUp = p - vec2(size_div2.x/3.05,size_div2.x/1.8);  
	up = length(pUp) / size_div2.x;
	up = 0.5 - up;

	up = 0.1 / abs(0.06 - up);
	up = step(1,up);


	float upAngle;   //切り取る角度
	upAngle = atan(pUp.y , pUp.x);    
	upAngle = abs(degrees(upAngle) + 30); 
	upAngle = upAngle / 180.0f;
	upAngle = abs(upAngle);
	upAngle = step(0.45,upAngle);

	up *= upAngle;
	up = 1 - up;


	//左の円
	float left;
	vec2 pLeft= p + vec2(size_div2.x/1.56 ,-size_div2.x / 80);
	left = length(pLeft)/ size_div2.x;
	left = 0.5 - left;

	left = 0.1 / abs(0.06 - left);
	left = step(1,left);

	float lAngle;
	lAngle = atan(pLeft.y,pLeft.x);
	lAngle = abs(degrees(lAngle)-90);
	lAngle = lAngle / 180.0f;
	lAngle = abs(lAngle);
	lAngle = step(0.45,lAngle);

	left *= lAngle;
	left = 1- left;


	//右の円
	float right;
	vec2 pRight = p - vec2(size_div2.x/3.7,-size_div2.x/1.7);

	right = length(pRight)/ size_div2.x;
	right = 0.5 - right;
	right = 0.1 / abs(0.06 - right);
	right = step(1,right);

	float rAngle;
	rAngle = atan(pRight.y,pRight.x);
	rAngle = abs(degrees(rAngle));
	rAngle = rAngle / 180.0f;
	rAngle = abs(rAngle);
	rAngle = step(0.6,rAngle);
	rAngle = 1-rAngle;

	right *= rAngle;
	right = 1- right;



	//合成
	red *= cBlack;
	red *= up;
	red *= left;
	red *= right;



	gl_FragColor = vec4(red, 0, 0, col);
	

}

