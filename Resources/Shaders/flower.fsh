varying vec4 v_color;       //(入力)色

uniform vec2 center;

uniform vec2 size_div2;

uniform float time;

float u(float x ){ return (x > 0.0) ?1.0:0.0 ;}

void main()
{
    //色指定用の一時変数
    //float col = 0.5;
	
	//vec3 rgb = vec3(col,col,col);

	//出力カラーを設定（１つずつ指定）
	//gl_FragColor = vec4(col,col,col,1);

	//gl_FragColor = vec4(rgb,1);

	//gl_FragColor = vec4(rgb.xyz,1);

	//gl_FragColor = vec4(rgb.xyz,0.1);

	//gl_FragColor = vec4(0,rgb.yz,1);

	//gl_FragColor = vec4(rgb.yz,rgb.xy);

    //gl_FragColor *= v_color;  //シェーダーの出力にカラーをコピー

	//7-1
	//gl_FragColor = vec4(gl_FragCoord.y/720 ,0 ,gl_FragCoord.x/1280 ,1);


	//7-2
	vec2 p = gl_FragCoord.xy - center;

	float col;
	
	

	col = p.x / size_div2.x;


	//左右対称
	//col = abs(p.x/size_div2.x);
	//col = 1 - col;

	//上下対称
	//col = abs(p.y / size_div2.y);
	//col = 1 - col;

	//円
	//col = sqrt(p.x*p.x + p.y*p.y) /size_div2.x ;  //←こっちよりlengthを使うべき	
	//col = length(p) / size_div2.x;
	//col = 1 - col;

	//col = sign(col);
	//col=step(0.0001f,col);

	//怪獣
	//float angle=atan(p.y,p.x);
	//float deg = abs(degrees(angle));
	//col = deg / 180.0f;
	//col = step(0.2,col);

	//円
	//float circle = length(p) / size_div2.x;
	//circle = 1 - circle;
	//circle = sign(circle);

	//合成
	//col *= circle;

	//9_1
	//col = time / 2.0f;

	float angle = atan(p.y, p.x);

	//float w;

	//w = sin(time * 3.14 - angle);
	//w = sin(sin(time * 3.14) - angle * 4);
    //w = cos(sin(time * 3.14) - angle * 4);
	//w = sin(time * 3.14 - p.x / size_div2.x);
	//w = sin(time * 3.14 - p.x / size_div2.x * 3.14);
	//col = w;

	//col = w / 2.0 + 0.5;


	//9_1 やってみよう
	//float col2 = length(p) / size_div2.x;
	//col2= 1 - col2;

	//float s = sin(sin(time * 3.14) + 3.14 / 2) / 2.0 + 0.5;
	//float s = cos(sin(time * 3.14)) / 2.0 + 0.5;

	//col2 = col2 * s;

	//col = col2;



	//9_2 花
	p /= size_div2;

	float a = atan(p.x,p.y);

	float r= length(p);

	float w = cos(3.14 * time - r * 2.0);

	float h = 0.5 + 0.5 * cos(12.0 * a - w *7.0 + r * 8.0);

	float d = 0.25 + 0.75 * pow(h , 1.0 * r) * (0.7 + 0.3 * w);

	col = u(d - r) * sqrt(1.0 - r / d) * r * 2.5;

	col *= 1.25 + 0.25 * cos((12.0 * a - w * 7.0 + r * 8.0) / 2.0);
	col *= 1.0 - 0.35 * (0.5 + 0.5 * sin(r * 30.0)) * (0.5 + 0.5 * cos(12.0 * a - w * 7.0 + r * 8.0));

	gl_FragColor = vec4(
	    col,
		col - h * 0.5 + r * 0.2 + 0.35 * h * (1 - r),
		col - h * r + 0.1 * h *(1.0 - r),
		1);


	//gl_FragColor = vec4(col, col, col, 1);
	

}

