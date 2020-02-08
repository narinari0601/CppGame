#include "HelloShaderScene.h"

#include "ShaderNode.h"

USING_NS_CC;

Scene* HelloShader::createScene()
{
	// 'scene' is an autorelease object
	auto scene = Scene::create();

	// 'layer' is an autorelease object
	auto layer = HelloShader::create();

	// add layer as a child to scene
	scene->addChild(layer);

	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
bool HelloShader::init()
{
	//////////////////////////////
	// 1. super init first
	if (!Layer::init())
	{
		return false;
	}

	Size visibleSize = Director::getInstance()->getVisibleSize();
	Vec2 origin = Director::getInstance()->getVisibleOrigin();

	/////////////////////////////
	// 2. add a menu item with "X" image, which is clicked to quit the program
	//    you may modify it.

	// add a "close" icon to exit the progress. it's an autorelease object
	auto closeItem = MenuItemImage::create(
		"CloseNormal.png",
		"CloseSelected.png",
		CC_CALLBACK_1(HelloShader::menuCloseCallback, this));

	closeItem->setPosition(Vec2(origin.x + visibleSize.width - closeItem->getContentSize().width / 2,
		origin.y + closeItem->getContentSize().height / 2));

	// create menu, it's an autorelease object
	auto menu = Menu::create(closeItem, NULL);
	menu->setPosition(Vec2::ZERO);
	this->addChild(menu, 1);

	/////////////////////////////
	// 3. add your codes below...

	// add a label shows "Hello World"
	// create and initialize a label

	auto label = Label::createWithTTF("Hello World", "fonts/Marker Felt.ttf", 24);

	// position the label on the center of the screen
	label->setPosition(Vec2(origin.x + visibleSize.width / 2,
		origin.y + visibleSize.height - label->getContentSize().height));

	// add the label as a child to this layer
	this->addChild(label, 1);

	Sprite* sprite;

	Director::getInstance()->setClearColor(Color4F(0.0f, 0.0f, 0.0f, 0.0f));

	// Cocos�̃��S�X�v���C�g���쐬�B�`��D���0
	sprite = Sprite::create("HelloWorld.png");
	sprite->setColor(Color3B(0xff, 0x00, 0x00));
	sprite->setScale(2.0f);
	sprite->setPosition(Vec2(visibleSize.width/2 + origin.x + 200, visibleSize.height/2 + origin.y));
	//this->addChild(sprite, 0);

	// LayerColor�̎g�p��
	//LayerColor* layerColor = LayerColor::create(Color4B(255, 255, 0, 255), 500, 500);
	//this->addChild(layerColor, 2);

	// ShaderNode���쐬�B�`��D���1
	//node = ShaderNode::create();
	//node->setContentSize(Size(500, 500));
	//this->addChild(node, 1);
	//node->setPosition(500, 500);

	//node->setOpacity(128);
	//MoveTo* action01=MoveTo::create(onTouchMoved)

	//node->setRotation(45.0f);
	//node->setScale(3.0f, 5.0f);
	//node->setColor(Color3B(0, 255, 0));

	Sprite* spriteA = Sprite::create("HelloWorld.png");
	//node->addChild(spriteA);

	//this -> addChild(spriteA, 2);
	spriteA->setPosition(400, 300);

	//Sprite* spriteB;
	//Sprite* spriteC;

	//// layer��SpriteA,B,C���Ԃ牺����
	//scene->addChild(spriteA, 2);
	//scene->addChild(spriteB, 0);
	//scene->addChild(spriteC, 1);

	auto listener = EventListenerTouchOneByOne::create();

	listener->onTouchBegan = CC_CALLBACK_2(HelloShader::onTouchBegin, this);
	listener->onTouchMoved = CC_CALLBACK_2(HelloShader::onTouchMoved, this);
	listener->onTouchEnded = CC_CALLBACK_2(HelloShader::onTouchEnded, this);
	listener->onTouchCancelled = CC_CALLBACK_2(HelloShader::onTouchEnded, this);

	this->getEventDispatcher()->addEventListenerWithSceneGraphPriority(listener, this);

	//�X�v���C�g3D�̍쐬
	m_pSprite3D = Sprite3D::create("orc/orc.c3t");
	m_pSprite3D->setPosition(640, 360);
	
	m_pSprite3D->setScale(10.0f);
	m_pSprite3D->setRotation3D(Vec3(0, 180, 0));

	this->addChild(m_pSprite3D, 1);

	//�A�j���[�V�����f�[�^��ǂݍ���
	animation01 = Animation3D::create("orc/orc.c3t");
	animation02 = Animation3D::create("orc/orc_jump.c3t");

	idol = Animate3D::create(animation01);
	//jump = Animate3D::create(animation02);

	repeat = RepeatForever::create(idol);

	//m_pSprite3D->runAction(animate);
	m_pSprite3D->runAction(repeat);

	return true;
}

void HelloShader::menuCloseCallback(Ref* pSender)
{
	//Director::getInstance()->end();
	m_pSprite3D->stopAllActions();

	jump = Animate3D::create(animation02);
	m_pSprite3D->runAction(jump);

#if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
	exit(0);
#endif
}

bool HelloShader::onTouchBegin(cocos2d::Touch * touch, cocos2d::Event * event)
{
	auto touchPos = touch->getLocation();

	//node->setPosition(touchPos);
	m_pSprite3D->setPosition(touchPos);

	return true;
}

void HelloShader::onTouchMoved(cocos2d::Touch * touch, cocos2d::Event * event)
{
	auto touchPos = touch->getLocation();

	//node ->setPosition(touchPos);
	m_pSprite3D->setPosition(touchPos);
}

void HelloShader::onTouchEnded(cocos2d::Touch * touch, cocos2d::Event * event)
{

}
