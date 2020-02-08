#pragma once

#include "cocos2d.h"

class HelloShader : public cocos2d::Layer
{
public:
	// there's no 'id' in cpp, so we recommend returning the class instance pointer
	static cocos2d::Scene* createScene();

	// Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
	virtual bool init();

	// a selector callback
	void menuCloseCallback(cocos2d::Ref* pSender);

	bool onTouchBegin(cocos2d::Touch* touch, cocos2d::Event* event);
	void onTouchMoved(cocos2d::Touch * touch, cocos2d::Event * event);
	void onTouchEnded(cocos2d::Touch * touch, cocos2d::Event * event);

	// implement the "static create()" method manually
	CREATE_FUNC(HelloShader);

	cocos2d::CustomCommand _customCommand;

	cocos2d::Node* node;

	cocos2d::Sprite3D* m_pSprite3D;

	cocos2d::Animation3D* animation01;
	cocos2d::Animation3D* animation02;
	cocos2d::Animate3D* idol;
	cocos2d::Animate3D* jump;
	cocos2d::RepeatForever* repeat;
};