varying vec4 v_color;       //(入力)色

uniform vec2 center;

uniform vec2 size_div2;

uniform float time;

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

	

	//col = p.x / size_div2.x;


	//左右対称
	//col = abs(p.x/size_div2.x);
	//col = 1 - col;

	//上下対称
	//col = abs(p.y / size_div2.y);
	//col = 1 - col;

	//円
	//col = sqrt(p.x*p.x + p.y*p.y) /size_div2.x ;
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

	float w = sin(time * 3.14);
	col = w;

	col=w/2.0+0.5;


	gl_FragColor = vec4(col, col, col, 1);
	

}