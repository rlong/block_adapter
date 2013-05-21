// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> // explicit import of UI* types


#import "BAAbstractAdapter.h"

typedef id(^ButtonDelegate)(UIButton*);

@interface BAButtonBlockAdapter : BAAbstractAdapter {
    
    // client
    UIButton* _client;
    //@property (nonatomic, retain) UIButton* client;
    //@synthesize client = _client;
    
    // adaptee
    ButtonDelegate _adaptee;
    //@property (nonatomic, copy) ButtonDelegate adaptee;
    //@synthesize adaptee = _adaptee;


}


+(BAButtonBlockAdapter*)onTouchUpInside:(UIButton*)button adaptee:(ButtonDelegate)adaptee;

+(BAButtonBlockAdapter*)onTouchUpInside:(UIButton*)button adaptee:(ButtonDelegate)adaptee asyncTask:(JBBlock)asyncTask afterAsyncTaskDone:(JBBlockDone)asyncTaskDone afterAsyncTaskFailed:(JBBlockFailed)asyncTaskFailed;


#pragma mark -
#pragma mark instance lifecycle

-(id)initWithClient:(UIButton*)client adaptee:(ButtonDelegate)adaptee;
-(id)initWithClient:(UIButton*)client adaptee:(ButtonDelegate)adaptee asyncBlock:(JBBlock)asyncTask asyncBlockDone:(JBBlockDone)asyncTaskDone asyncBlockFailed:(JBBlockFailed)asyncTaskFailed;

@end
