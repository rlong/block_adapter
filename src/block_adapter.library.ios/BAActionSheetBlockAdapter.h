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

+(BAActionSheetBlockAdapter*)adapterWithClient:(UIActionSheet *)client adaptee:(BAActionSheetAdaptee)adaptee asyncBlock:(JBBlock)asyncTask afterAsyncBlockDone:(JBBlockDone)asyncTaskDone afterAsyncBlockFailed:(JBBlockFailed)asyncTaskFailed;


#pragma mark -
#pragma mark instance lifecycle

-(id)initWithClient:(UIActionSheet*)client adaptee:(BAActionSheetAdaptee)adaptee;
-(id)initWithClient:(UIActionSheet*)client adaptee:(BAActionSheetAdaptee)adaptee asyncBlock:(JBBlock)asyncTask asyncBlockDone:(JBBlockDone)asyncTaskDone asyncBlockFailed:(JBBlockFailed)asyncTaskFailed;


@end
