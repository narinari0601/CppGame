
attribute vec4 a_position;  //(����)���W
attribute vec4 a_color;   //(����)�F
//atrribute vec2 a_center;  

attribute vec2 a_texCoord;

uniform mat4 u_wvp_matrix;
//uniform vec2 u_center;
//uniform vec2 u_size_div2;

varying vec4 v_color;        //(�o��)�F
//varying vec2 center;
//varying vec2 size_div2;
varying vec2 v_texCoord;


void main()
{
	gl_Position = u_wvp_matrix * a_position;  //�V�F�[�_�̏o�͂ɍ��W���R�s�[
	v_color = a_color;         //���͂���o�͂ɃR�s�[
	//center = u_center;
	//size_div2 = u_size_div2;
	v_texCoord = a_texCoord;
}