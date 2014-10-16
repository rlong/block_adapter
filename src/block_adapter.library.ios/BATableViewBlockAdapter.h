// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> // explicit import of UI* types

#import "BAAbstractAdapter.h"


typedef id(^BATableViewAdaptee)(UITableView* tableView, NSIndexPath* indexPath);


@interface BATableViewBlockAdapter : BAAbstractAdapter <UITableViewDelegate> {
    
    
    // client
    UITableView* _client;
    //@property (nonatomic, retain) UITableView* client;
    //@synthesize client = _client;

    // adaptee
    BATableViewAdaptee _adaptee;
    //@property (nonatomic, copy) JBTableViewDelegate adaptee;
    //@synthesize adaptee = _adaptee;

    
}


+(BATableViewBlockAdapter*)adapterWithClient:(UITableView *)client adaptee:(BATableViewAdaptee)adaptee;


+(BATableViewBlockAdapter*)adapterWithClient:(UITableView *)client adaptee:(BATableViewAdaptee)adaptee asyncTask:(jbBlock)asyncTask afterAsyncTaskDone:(jbBlockDone)asyncTaskDone afterAsyncTaskFailed:(jbBlockFailed)asyncTaskFailed;

#pragma mark -
#pragma mark instance lifecycle


-(id)initWithClient:(UITableView*)client adaptee:(BATableViewAdaptee)adaptee;
-(id)initWithClient:(UITableView*)client adaptee:(BATableViewAdaptee)adaptee asyncBlock:(jbBlock)asyncTask asyncBlockDone:(jbBlockDone)asyncTaskDone asyncBlockFailed:(jbBlockFailed)asyncTaskFailed;

@end
