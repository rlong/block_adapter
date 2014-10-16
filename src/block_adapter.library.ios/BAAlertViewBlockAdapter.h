// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> // explicit import of UI* types


#import "BAAbstractAdapter.h"



typedef id(^BAAlertViewAdaptee)(UIAlertView* alertView, NSInteger buttonIndex);


@interface BAAlertViewBlockAdapter : BAAbstractAdapter {
    
    
    // client
    UIAlertView* _client;
    //@property (nonatomic, retain) UIAlertView* client;
    //@synthesize client = _client;
    
    
    // adaptee
    BAAlertViewAdaptee _adaptee;
    //@property (nonatomic, copy) AlertViewDelegate adaptee;
    //@synthesize adaptee = _adaptee;

    
    
}

+(BAAlertViewBlockAdapter*)adapterWithClient:(UIAlertView *)client adaptee:(BAAlertViewAdaptee)adaptee;

+(BAAlertViewBlockAdapter*)adapterWithClient:(UIAlertView *)client adaptee:(BAAlertViewAdaptee)adaptee asyncTask:(jbBlock)asyncTask afterAsyncTaskDone:(jbBlockDone)asyncTaskDone afterAsyncTaskFailed:(jbBlockFailed)asyncTaskFailed;

#pragma mark -
#pragma mark instance lifecycle

-(id)initWithClient:(UIAlertView*)client adaptee:(BAAlertViewAdaptee)adaptee;
-(id)initWithClient:(UIAlertView*)client adaptee:(BAAlertViewAdaptee)adaptee asyncBlock:(jbBlock)asyncTask asyncBlockDone:(jbBlockDone)asyncTaskDone asyncBlockFailed:(jbBlockFailed)asyncTaskFailed;

@end
