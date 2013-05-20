//
//  JBButtonBlockAdapter.h
//  jsonbroker
//
//  Created by rlong on 16/05/13.
//
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

+(BAButtonBlockAdapter*)onTouchUpInside:(UIButton*)button adaptee:(ButtonDelegate)adaptee asyncTask:(BAAsyncTask)asyncTask afterAsyncTaskDone:(AsyncTaskDone)asyncTaskDone afterAsyncTaskFailed:(AsyncTaskFailed)asyncTaskFailed;

@end
