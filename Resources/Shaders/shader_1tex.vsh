
attribute vec4 a_position;  //(����)���W
attribute vec4 a_color;   //(����)�F
attribute vec2 a_texCoord;  //(����)�e�N�X�`�����W

varying vec4 v_color;        //(�o��)�F
varying vec2 v_texCoord;     //(�o��)�e�N�X�`�����W

void main()
{
	gl_Position = a_position;  //�V�F�[�_�̏o�͂ɍ��W���R�s�[
	v_color = a_color;         //���͂���o�͂ɃR�s�[
	v_texCoord = a_texCoord;
}