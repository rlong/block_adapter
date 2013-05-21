// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> // explicit import of UI* types


#import "BAAbstractAdapter.h"



typedef id(^JBAlertViewDelegate)(UIAlertView* alertView, NSInteger buttonIndex);


@interface BAAlertViewBlockAdapter : BAAbstractAdapter {
    
    
    // client
    UIAlertView* _client;
    //@property (nonatomic, retain) UIAlertView* client;
    //@synthesize client = _client;
    
    
    // adaptee
    JBAlertViewDelegate _adaptee;
    //@property (nonatomic, copy) AlertViewDelegate adaptee;
    //@synthesize adaptee = _adaptee;

    
    
}

+(BAAlertViewBlockAdapter*)adapterWithClient:(UIAlertView *)client adaptee:(JBAlertViewDelegate)adaptee;

+(BAAlertViewBlockAdapter*)adapterWithClient:(UIAlertView *)client adaptee:(JBAlertViewDelegate)adaptee asyncTask:(JBBlock)asyncTask afterAsyncTaskDone:(JBBlockDone)asyncTaskDone afterAsyncTaskFailed:(JBBlockFailed)asyncTaskFailed;

#pragma mark -
#pragma mark instance lifecycle

-(id)initWithClient:(UIAlertView*)client adaptee:(JBAlertViewDelegate)adaptee;
-(id)initWithClient:(UIAlertView*)client adaptee:(JBAlertViewDelegate)adaptee asyncBlock:(JBBlock)asyncTask asyncBlockDone:(JBBlockDone)asyncTaskDone asyncBlockFailed:(JBBlockFailed)asyncTaskFailed;

@end
