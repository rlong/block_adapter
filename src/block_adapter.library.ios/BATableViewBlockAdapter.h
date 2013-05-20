//
//  JBTableViewBlockAdapter.h
//  jsonbroker
//
//  Created by rlong on 17/05/13.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> // explicit import of UI* types

#import "BAAbstractAdapter.h"


typedef id(^JBTableViewDelegate)(UITableView* tableView, NSIndexPath* indexPath);


@interface BATableViewBlockAdapter : BAAbstractAdapter <UITableViewDelegate> {
    
    
    // client
    UITableView* _client;
    //@property (nonatomic, retain) UITableView* client;
    //@synthesize client = _client;

    // adaptee
    JBTableViewDelegate _adaptee;
    //@property (nonatomic, copy) JBTableViewDelegate adaptee;
    //@synthesize adaptee = _adaptee;

    
}


+(BATableViewBlockAdapter*)adapterWithClient:(UITableView *)client adaptee:(JBTableViewDelegate)adaptee;


+(BATableViewBlockAdapter*)adapterWithClient:(UITableView *)client adaptee:(JBTableViewDelegate)adaptee asyncTask:(BAAsyncTask)asyncTask afterAsyncTaskDone:(AsyncTaskDone)asyncTaskDone afterAsyncTaskFailed:(AsyncTaskFailed)asyncTaskFailed;

@end
