
attribute vec4 a_position;  //(����)���W
attribute vec4 a_color;   //(����)�F

uniform mat4 u_wvp_matrix;

varying vec4 v_color;        //(�o��)�F

void main()
{
	gl_Position = u_wvp_matrix * a_position;  //�V�F�[�_�̏o�͂ɍ��W���R�s�[
	v_color = a_color;         //���͂���o�͂ɃR�s�[
}