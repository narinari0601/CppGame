varying vec4 v_color;       //(入力)色

uniform vec2 center;

uniform vec2 size_div2;

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
	//col = sqrt(p.x*p.x + p.y*p.y) /size_div2.x ;
	col = length(p) / size_div2.x;
	//col = 1 - col;

	gl_FragColor = vec4(col, col, col, 1);

}