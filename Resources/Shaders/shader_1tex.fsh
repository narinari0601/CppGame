varying vec4 v_color;       //(����)�F

varying vec2 v_texCoord;    //(����)�e�N�X�`�����W

uniform sampler2D sampler;  //(����)�e�N�X�`���T���v���[

void main()
{
    vec4 texcolor = texture2D(sampler,v_texCoord);

	//�ŏI�I�ɂ����ɐF�������
    gl_FragColor = texcolor* v_color;  //�V�F�[�_�[�̏o�͂ɃJ���[���R�s�[
}