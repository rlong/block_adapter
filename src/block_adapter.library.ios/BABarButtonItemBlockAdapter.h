// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> // explicit import of UI* types

#import "BAAbstractAdapter.h"


typedef id(^BABarButtonItemAdaptee)(UIBarButtonItem* barButtonItem);

@interface BABarButtonItemBlockAdapter : BAAbstractAdapter {
 
    // client
    UIBarButtonItem* _client;
    //@property (nonatomic, retain) UIBarButtonItem* client;
    //@synthesize client = _client;

    // adaptee
    BABarButtonItemAdaptee _adaptee;
    //@property (nonatomic, copy) JBBarButtonItemDelegate adaptee;
    //@synthesize adaptee = _adaptee;

}

+(BABarButtonItemBlockAdapter*)adapterWithClient:(UIBarButtonItem*)client adaptee:(BABarButtonItemAdaptee)adaptee;

+(BABarButtonItemBlockAdapter*)adapterWithClient:(UIBarButtonItem*)client adaptee:(BABarButtonItemAdaptee)adaptee asyncTask:(jbBlock)asyncTask afterAsyncTaskDone:(jbBlockDone)asyncTaskDone afterAsyncTaskFailed:(jbBlockFailed)asyncTaskFailed;


#pragma mark -
#pragma mark instance lifecycle

-(id)initWithClient:(UIBarButtonItem*)client adaptee:(BABarButtonItemAdaptee)adaptee;
-(id)initWithClient:(UIBarButtonItem*)client adaptee:(BABarButtonItemAdaptee)adaptee asyncBlock:(jbBlock)asyncTask asyncBlockDone:(jbBlockDone)asyncTaskDone asyncBlockFailed:(jbBlockFailed)asyncTaskFailed;

@end
