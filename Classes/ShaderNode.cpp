/****************************************************************************
 Copyright (c) 2017-2018 Xiamen Yaji Software Co., Ltd.

 http://www.cocos2d-x.org

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 ****************************************************************************/

#include "ShaderNode.h"
#include "SimpleAudioEngine.h"

USING_NS_CC;

//Scene* ShaderNode::createScene()
//{
//	return ShaderNode::create();
//}

// Print useful error message instead of segfaulting when files are not there.
//static void problemLoading(const char* filename)
//{
//	printf("Error while loading: %s\n", filename);
//	printf("Depending on how you compiled you might have to add 'Resources/' in front of filenames in ShaderNodeScene.cpp\n");
//}

// on "init" you need to initialize your instance
bool ShaderNode::init()
{
	//////////////////////////////
	// 1. super init first
	if (!Node::init())
	{
		return false;
	}

	auto visibleSize = Director::getInstance()->getVisibleSize();
	Vec2 origin = Director::getInstance()->getVisibleOrigin();



	GLenum error;

	m_pProgram = new GLProgram;

	m_pProgram->initWithFilenames("shaders/shader_0tex.vsh", "shaders/shader_0tex.fsh");
	error = glGetError();

	//attribute�ϐ��ɑ����C���f�b�N�X������U��
	m_pProgram->bindAttribLocation("a_position", GLProgram::VERTEX_ATTRIB_POSITION);
	error = glGetError();

	//atttibute�ϐ��ɑ����C���f�b�N�X������U��
	m_pProgram->bindAttribLocation("a_color", GLProgram::VERTEX_ATTRIB_COLOR);
	error = glGetError();

	//m_pProgram->bindAttribLocation("a_texCoord", GLProgram::VERTEX_ATTRIB_TEX_COORD);
	//error = glGetError();

	//�V�F�[�_�[�������N
	m_pProgram->link();
	error = glGetError();

	//uniform�ϐ��̃��X�g��ۑ�
	m_pProgram->updateUniforms();
	error = glGetError();

	//�w�i�F��ݒ�
	//Director::getInstance()->setClearColor(Color4F(0, 1, 0, 0));


	//uniform_sampler = glGetUniformLocation(m_pProgram->getProgram(), "sampler");


	//m_pTexture = Director::getInstance()->getTextureCache()->addImage("banana00.png");


	uniform_wvp_matrix = glGetUniformLocation(m_pProgram->getProgram(), "u_wvp_matrix");


	

	return true;
}




void ShaderNode::draw(Renderer *renderer, const Mat4& transform, uint32_t flags)
{
	//�R���e���c�T�C�Y���擾
	Size size = getContentSize();

	//���W��1�_���ݒ�
	pos[0] = Vec3(-size.width / 2.0f, -size.height / 4.0f, 0);
	pos[1] = Vec3(-size.width / 2.0f, +size.height / 4.0f, 0);
	pos[2] = Vec3(+size.width / 2.0f, -size.height / 4.0f, 0);
	pos[3] = Vec3(+size.width / 2.0f, +size.height / 4.0f, 0);

	color[0] = Vec4(_realColor.r / 255.0f, _realColor.g / 255.0f, _realColor.b / 255.0f, _realOpacity / 255.0f);
	color[1] = Vec4(_realColor.r / 255.0f, _realColor.g / 255.0f, _realColor.b / 255.0f, _realOpacity / 255.0f);
	color[2] = Vec4(_realColor.r / 255.0f, _realColor.g / 255.0f, _realColor.b / 255.0f, _realOpacity / 255.0f);
	color[3] = Vec4(_realColor.r / 255.0f, _realColor.g / 255.0f, _realColor.b / 255.0f, _realOpacity / 255.0f);

	_customCommand.init(_globalZOrder, transform, flags);
	_customCommand.func = CC_CALLBACK_0(ShaderNode::onDraw, this, transform, flags);
	renderer->addCommand(&_customCommand);


	//pos[0] = Vec3(-x, -y, 0);
	//pos[1] = Vec3(-x, +y, 0);
	//pos[2] = Vec3(+x, -y, 0);
	//pos[3] = Vec3(+x, +y, 0);

	//color[0] = Vec4(1, 0, 0, 1);
	//color[1] = Vec4(1, 0, 0, 1);
	//color[2] = Vec4(1, 0, 0, 1);
	//color[3] = Vec4(1, 0, 0, 1);

	uv[0] = Vec2(0, 1);
	uv[1] = Vec2(0, 0);
	uv[2] = Vec2(1, 1);
	uv[3] = Vec2(1, 0);


	//���[���h�r���[�v���W�F�N�V�����̍s��쐬
	//static float yaw = 0.0f;
	//yaw += CC_DEGREES_TO_RADIANS(5.0f);
	Mat4 matProjection;
	//Mat4 matView;
	//Mat4 matTrans, matScale, matRot, matWorld;

	//�v���W�F�N�V�����s��(�ˉe�s��)���擾
	matProjection = _director->getMatrix(MATRIX_STACK_TYPE::MATRIX_STACK_PROJECTION);

	////�r���[�s����擾
	//matView = _director->getMatrix(MATRIX_STACK_TYPE::MATRIX_STACK_MODELVIEW);

	////���s�ړ��s����쐬
	//Mat4::createTranslation(Vec3(1280 / 2, 720 / 2, 0), &matTrans);

	////��]�s����쐬
	//Mat4::createRotationY(yaw, &matRot);

	////+1�`+3�{�Ŏ���
	////float scale = sinf(yaw) + 2.0f;
	//float scale = 3.0f;

	////�X�P�[�����O�s�������
	//Mat4::createScale(Vec3(scale, scale, scale), &matScale);

	////���[���h�s�������
	//matWorld = matTrans * matRot * matScale;

	////��������WVP�s����V�F�[�_�[�ɑ���
	//matWVP = matProjection * matView * matWorld;
	matWVP = matProjection * transform;

}

void ShaderNode::onDraw(const cocos2d::Mat4& transform, uint32_t /*flags*/)
{

	GLenum error;

	m_pProgram->use();
	m_pProgram->setUniformsForBuiltins(transform);
	GL::enableVertexAttribs(GL::VERTEX_ATTRIB_FLAG_POSITION | GL::VERTEX_ATTRIB_FLAG_COLOR);
	glBindBuffer(GL_ARRAY_BUFFER, 0);


	glVertexAttribPointer(GLProgram::VERTEX_ATTRIB_POSITION, 3, GL_FLOAT, GL_FALSE, 0, pos);
	glVertexAttribPointer(GLProgram::VERTEX_ATTRIB_COLOR, 4, GL_FLOAT, GL_FALSE, 0, color);

	

	glUniformMatrix4fv(uniform_wvp_matrix, 1, GL_FALSE, matWVP.m);


	//�`��(�O��)
	glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);



	error = glGetError();

}

bool ShaderNode::onTouchBegin(cocos2d::Touch * touch, cocos2d::Event * event)
{
	auto touchPos = touch->getLocation();


	return true;
}
