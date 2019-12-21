
attribute vec4 a_position;  //(入力)座標
attribute vec4 a_color;   //(入力)色
//atrribute vec2 a_center;  

uniform mat4 u_wvp_matrix;
//uniform vec2 u_center;
//uniform vec2 u_size_div2;

varying vec4 v_color;        //(出力)色
//varying vec2 center;
//varying vec2 size_div2;


void main()
{
	gl_Position = u_wvp_matrix * a_position;  //シェーダの出力に座標をコピー
	v_color = a_color;         //入力から出力にコピー
	//center = u_center;
	//size_div2 = u_size_div2;
}