varying vec4 v_color;       //(����)�F

uniform vec2 center;

uniform vec2 size_div2;

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

	col = p.x/size_div2;


	gl_FragColor = vec4(col, col, col, 1);

}