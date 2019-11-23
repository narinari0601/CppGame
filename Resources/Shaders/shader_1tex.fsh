varying vec4 v_color;       //(入力)色

varying vec2 v_texCoord;    //(入力)テクスチャ座標

uniform sampler2D sampler;  //(入力)テクスチャサンプラー

void main()
{
    vec4 texcolor = texture2D(sampler,v_texCoord);

	//最終的にここに色をいれる
    gl_FragColor = texcolor* v_color;  //シェーダーの出力にカラーをコピー
}