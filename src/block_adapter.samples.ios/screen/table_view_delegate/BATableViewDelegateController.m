//
//  JBTableViewDelegateController.m
//  jsonbroker.samples
//
//  Created by rlong on 17/05/13.
//
//



#import "JBLog.h"
#import "BATabBarBlockAdapter.h"
#import "BATableViewBlockAdapter.h"
#import "BATableViewDelegateController.h"
#import "BATableViewDelegateView.h"


@implementation BATableViewDelegateController



-(BATableViewDelegateView*)getTypedView {
    
    return (BATableViewDelegateView*)[self view];
}






#pragma mark -
#pragma mark <UITableViewDataSource> implementation

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
    return 3;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    

    NSString* reuseIdentifier = @"BATableViewDelegateController";
    
    UITableViewCell *answer = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
	if( nil == answer ) {
        
        answer = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier] autorelease];
	}
    
    
    int index = indexPath.row;
    NSString* textLabel = [NSString stringWithFormat:@"row %d", index];
    [[answer textLabel] setText:textLabel];
    
    return answer;

    
}

#pragma mark -
#pragma mark UI lifecycle

- (void)viewDidLoad
{
    
	[super viewDidLoad];
    Log_enteredMethod();
    
    BATableViewDelegateView* myView = [self getTypedView];
    
    
    // block table ...
    {
        
        id adapter = [BATableViewBlockAdapter
                      adapterWithClient:[myView blockTableView]
                      
                      adaptee:(id)^(UITableView* tableView, NSIndexPath* indexPath) {
                          
                          Log_debugInt( indexPath.row );
                          
                          return nil;
                      }
                      ];
        
        [myView addAdapter:adapter];
    }
    
    
    // async block table ...
    {
        
        id adapter = [BATableViewBlockAdapter
                      adapterWithClient:[myView asyncBlockTableView]
                      
                      adaptee:(id)^(UITableView* tableView, NSIndexPath* indexPath) {
                          
                          
                          Log_debugInt( indexPath.row );
                          
                          return indexPath;
                          
                      }
                      
                      asyncTask:(id)^(id adapteeResponse) {
                          
                          NSIndexPath* indexPath = adapteeResponse;
                          Log_debugInt( indexPath.row );
                          
                          return nil;
                      }
                      
                      afterAsyncTaskDone:^(id adapteeResponse, id asyncTaskResponse) {
                          NSIndexPath* indexPath = adapteeResponse;
                          Log_debugInt( indexPath.row );
                      }
                      
                      afterAsyncTaskFailed:nil];
        
        [myView addAdapter:adapter];
    }
    
    // tab bar
    {
        id adapter = [BATabBarBlockAdapter
                      adapterWithClient:[myView tabBar]
                      adaptee:(id)^(UITabBar* tabBar, UITabBarItem* selectedItem) {
                          
                          NSArray* items = [tabBar items];
                          if( selectedItem == [items objectAtIndex:0] ) {
                              [[myView blockTableView] setHidden:false];
                              [[myView asyncBlockTableView] setHidden:true];
                          } else {
                              [[myView blockTableView] setHidden:true];
                              [[myView asyncBlockTableView] setHidden:false];
                          }
                          
                          Log_enteredMethod();
                      }];
        
        [myView addAdapter:adapter];
    }
    
}


@end
