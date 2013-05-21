// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> // explicit import of UI* types


#import "BAAbstractAdapter.h"


typedef id(^JBTabBarDelegate)(UITabBar* tabBar, UITabBarItem* selectedItem);

@interface BATabBarBlockAdapter : BAAbstractAdapter <UITabBarDelegate> {

    
    // client
    UITabBar* _client;
    //@property (nonatomic, retain) UITabBar* client;
    //@synthesize client = _client;

    // adaptee
    JBTabBarDelegate _adaptee;
    //@property (nonatomic, copy) JBTabBarDelegate adaptee;
    //@synthesize adaptee = _adaptee;

    
}

+(BATabBarBlockAdapter*)adapterWithClient:(UITabBar *)client adaptee:(JBTabBarDelegate)adaptee;

+(BATabBarBlockAdapter*)adapterWithClient:(UITabBar *)client adaptee:(JBTabBarDelegate)adaptee asyncTask:(JBBlock)asyncTask afterAsyncTaskDone:(JBBlockDone)asyncTaskDone afterAsyncTaskFailed:(JBBlockFailed)asyncTaskFailed;


#pragma mark -
#pragma mark instance lifecycle

-(id)initWithClient:(UITabBar*)client adaptee:(JBTabBarDelegate)adaptee;
-(id)initWithClient:(UITabBar*)client adaptee:(JBTabBarDelegate)adaptee asyncBlock:(JBBlock)asyncTask asyncBlockDone:(JBBlockDone)asyncTaskDone asyncBlockFailed:(JBBlockFailed)asyncTaskFailed;

@end
