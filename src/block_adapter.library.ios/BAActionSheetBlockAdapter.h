// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> // explicit import of UI* types

#import "BAAbstractAdapter.h"


typedef id(^BAActionSheetAdaptee)(UIActionSheet* actionSheet, NSInteger buttonIndex);

@interface BAActionSheetBlockAdapter : BAAbstractAdapter <UIActionSheetDelegate> {

    // client
    UIActionSheet* _client;
    //@property (nonatomic, retain) UIActionSheet* client;
    //@synthesize client = _client;
    
    
    // adaptee
    BAActionSheetAdaptee _adaptee;
    //@property (nonatomic, copy) ActionSheetDelegate adaptee;
    //@synthesize adaptee = _adaptee;
    
    
}


+(BAActionSheetBlockAdapter*)adapterWithClient:(UIActionSheet *)client adaptee:(BAActionSheetAdaptee)adaptee;

+(BAActionSheetBlockAdapter*)adapterWithClient:(UIActionSheet *)client adaptee:(BAActionSheetAdaptee)adaptee asyncBlock:(jbBlock)asyncTask afterAsyncBlockDone:(jbBlockDone)asyncTaskDone afterAsyncBlockFailed:(jbBlockFailed)asyncTaskFailed;


#pragma mark -
#pragma mark instance lifecycle

-(id)initWithClient:(UIActionSheet*)client adaptee:(BAActionSheetAdaptee)adaptee;
-(id)initWithClient:(UIActionSheet*)client adaptee:(BAActionSheetAdaptee)adaptee asyncBlock:(jbBlock)asyncTask asyncBlockDone:(jbBlockDone)asyncTaskDone asyncBlockFailed:(jbBlockFailed)asyncTaskFailed;


@end
