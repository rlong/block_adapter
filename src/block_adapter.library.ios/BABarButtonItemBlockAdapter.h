// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> // explicit import of UI* types

#import "BAAbstractAdapter.h"


typedef id(^JBBarButtonItemDelegate)(UIBarButtonItem* barButtonItem);

@interface BABarButtonItemBlockAdapter : BAAbstractAdapter {
 
    // client
    UIBarButtonItem* _client;
    //@property (nonatomic, retain) UIBarButtonItem* client;
    //@synthesize client = _client;

    // adaptee
    JBBarButtonItemDelegate _adaptee;
    //@property (nonatomic, copy) JBBarButtonItemDelegate adaptee;
    //@synthesize adaptee = _adaptee;

}

+(BABarButtonItemBlockAdapter*)adapterWithClient:(UIBarButtonItem*)client adaptee:(JBBarButtonItemDelegate)adaptee;

+(BABarButtonItemBlockAdapter*)adapterWithClient:(UIBarButtonItem*)client adaptee:(JBBarButtonItemDelegate)adaptee asyncTask:(JBBlock)asyncTask afterAsyncTaskDone:(JBBlockDone)asyncTaskDone afterAsyncTaskFailed:(JBBlockFailed)asyncTaskFailed;


#pragma mark -
#pragma mark instance lifecycle

-(id)initWithClient:(UIBarButtonItem*)client adaptee:(JBBarButtonItemDelegate)adaptee;
-(id)initWithClient:(UIBarButtonItem*)client adaptee:(JBBarButtonItemDelegate)adaptee asyncBlock:(JBBlock)asyncTask asyncBlockDone:(JBBlockDone)asyncTaskDone asyncBlockFailed:(JBBlockFailed)asyncTaskFailed;

@end
