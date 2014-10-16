// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> // explicit import of UI* types


#import "BAAbstractAdapter.h"


typedef id(^BATabBarAdaptee)(UITabBar* tabBar, UITabBarItem* selectedItem);

@interface BATabBarBlockAdapter : BAAbstractAdapter <UITabBarDelegate> {

    
    // client
    UITabBar* _client;
    //@property (nonatomic, retain) UITabBar* client;
    //@synthesize client = _client;

    // adaptee
    BATabBarAdaptee _adaptee;
    //@property (nonatomic, copy) JBTabBarDelegate adaptee;
    //@synthesize adaptee = _adaptee;

    
}

+(BATabBarBlockAdapter*)adapterWithClient:(UITabBar *)client adaptee:(BATabBarAdaptee)adaptee;

+(BATabBarBlockAdapter*)adapterWithClient:(UITabBar *)client adaptee:(BATabBarAdaptee)adaptee asyncTask:(jbBlock)asyncTask afterAsyncTaskDone:(jbBlockDone)asyncTaskDone afterAsyncTaskFailed:(jbBlockFailed)asyncTaskFailed;


#pragma mark -
#pragma mark instance lifecycle

-(id)initWithClient:(UITabBar*)client adaptee:(BATabBarAdaptee)adaptee;
-(id)initWithClient:(UITabBar*)client adaptee:(BATabBarAdaptee)adaptee asyncBlock:(jbBlock)asyncTask asyncBlockDone:(jbBlockDone)asyncTaskDone asyncBlockFailed:(jbBlockFailed)asyncTaskFailed;

@end
