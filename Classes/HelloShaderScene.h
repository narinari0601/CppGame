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
	// implement the "static create()" method manually
	CREATE_FUNC(HelloShader);

	cocos2d::CustomCommand _customCommand;

	cocos2d::Node* node;
};