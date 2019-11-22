varying vec4 v_color;       //(入力)色

void main()
{
    gl_FragColor = v_color;  //シェーダーの出力にカラーをコピー
}