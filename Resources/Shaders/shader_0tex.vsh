
attribute vec4 a_position;  //(����)���W
attribute vec4 a_color;   //(����)�F
varying vec4 v_color;        //(�o��)�F

void main()
{
	gl_Position = a_position;  //�V�F�[�_�̏o�͂ɍ��W���R�s�[
	v_color = a_color;         //���͂���o�͂ɃR�s�[
}