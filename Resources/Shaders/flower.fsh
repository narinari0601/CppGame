varying vec4 v_color;       //(����)�F

uniform vec2 center;

uniform vec2 size_div2;

uniform float time;

void main()
{
    //�F�w��p�̈ꎞ�ϐ�
    //float col = 0.5;
	
	//vec3 rgb = vec3(col,col,col);

	//�o�̓J���[��ݒ�i�P���w��j
	//gl_FragColor = vec4(col,col,col,1);

	//gl_FragColor = vec4(rgb,1);

	//gl_FragColor = vec4(rgb.xyz,1);

	//gl_FragColor = vec4(rgb.xyz,0.1);

	//gl_FragColor = vec4(0,rgb.yz,1);

	//gl_FragColor = vec4(rgb.yz,rgb.xy);

    //gl_FragColor *= v_color;  //�V�F�[�_�[�̏o�͂ɃJ���[���R�s�[

	//7-1
	//gl_FragColor = vec4(gl_FragCoord.y/720 ,0 ,gl_FragCoord.x/1280 ,1);


	//7-2
	vec2 p = gl_FragCoord.xy - center;

	float col;

	

	//col = p.x / size_div2.x;


	//���E�Ώ�
	//col = abs(p.x/size_div2.x);
	//col = 1 - col;

	//�㉺�Ώ�
	//col = abs(p.y / size_div2.y);
	//col = 1 - col;

	//�~
	//col = sqrt(p.x*p.x + p.y*p.y) /size_div2.x ;
	//col = length(p) / size_div2.x;
	//col = 1 - col;

	//col = sign(col);
	//col=step(0.0001f,col);

	//���b
	//float angle=atan(p.y,p.x);
	//float deg = abs(degrees(angle));
	//col = deg / 180.0f;
	//col = step(0.2,col);

	//�~
	//float circle = length(p) / size_div2.x;
	//circle = 1 - circle;
	//circle = sign(circle);

	//����
	//col *= circle;

	//9_1
	//col = time / 2.0f;

	float w = sin(time * 3.14);
	col = w;

	col=w/2.0+0.5;


	gl_FragColor = vec4(col, col, col, 1);
	

}