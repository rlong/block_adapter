// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import <Foundation/Foundation.h>

@interface BATableViewDelegateView : UIView {
    
    // blockAdapters
    NSMutableArray* _blockAdapters;
    //@property (nonatomic, retain) NSMutableArray* blockAdapters;
    //@synthesize blockAdapters = _blockAdapters;
    
    
    // blockTableView
    UITableView* _blockTableView;
    //@property (nonatomic, retain) IBOutlet UITableView* blockTableView;
    //@synthesize blockTableView = _blockTableView;

    
    // asyncBlockTableView
    UITableView* _asyncBlockTableView;
    //@property (nonatomic, retain) IBOutlet UITableView* asyncBlockTableView;
    //@synthesize asyncBlockTableView = _asyncBlockTableView;
    
    // tabBar
    UITabBar* _tabBar;
    //@property (nonatomic, retain) IBOutlet UITabBar* tabBar;
    //@synthesize tabBar = _tabBar;


}

-(void)addAdapter:(id)adapter;

#pragma mark -
#pragma mark fields


// blockTableView
//UITableView* _blockTableView;
@property (nonatomic, retain) IBOutlet UITableView* blockTableView;
//@synthesize blockTableView = _blockTableView;


// asyncBlockTableView
//UITableView* _asyncBlockTableView;
@property (nonatomic, retain) IBOutlet UITableView* asyncBlockTableView;
//@synthesize asyncBlockTableView = _asyncBlockTableView;

// tabBar
//UITabBar* _tabBar;
@property (nonatomic, retain) IBOutlet UITabBar* tabBar;
//@synthesize tabBar = _tabBar;
@end
