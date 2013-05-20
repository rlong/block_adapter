//
//  JBTableViewDelegateView.m
//  jsonbroker.samples
//
//  Created by rlong on 17/05/13.
//
//

#import "JBLog.h"
#import "BATableViewDelegateView.h"

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface BATableViewDelegateView ()

// blockAdapters
//NSMutableArray* _blockAdapters;
@property (nonatomic, retain) NSMutableArray* blockAdapters;
//@synthesize blockAdapters = _blockAdapters;

@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#pragma mark -

@implementation BATableViewDelegateView



-(void)addAdapter:(id)adapter {
    
    [_blockAdapters addObject:adapter];
}


#pragma mark -
#pragma mark instance lifecycle


-(id)initWithCoder:(NSCoder *)aDecoder {
    
    Log_enteredMethod();
    
    BATableViewDelegateView* answer = [super initWithCoder:aDecoder];
    if( nil != answer ) {
        _blockAdapters = [[NSMutableArray alloc] init];
        
    }
    
    return answer;
    
}

-(void)dealloc {
	
    [self setBlockAdapters:nil];
    
	[self setBlockTableView:nil];
    [self setAsyncBlockTableView:nil];
	[self setTabBar:nil];


	[super dealloc];
	
}


#pragma mark -
#pragma mark fields

// blockAdapters
//NSMutableArray* _blockAdapters;
//@property (nonatomic, retain) NSMutableArray* blockAdapters;
@synthesize blockAdapters = _blockAdapters;


// blockTableView
//UITableView* _blockTableView;
//@property (nonatomic, retain) IBOutlet UITableView* blockTableView;
@synthesize blockTableView = _blockTableView;


// asyncBlockTableView
//UITableView* _asyncBlockTableView;
//@property (nonatomic, retain) IBOutlet UITableView* asyncBlockTableView;
@synthesize asyncBlockTableView = _asyncBlockTableView;

// tabBar
//UITabBar* _tabBar;
//@property (nonatomic, retain) IBOutlet UITabBar* tabBar;
@synthesize tabBar = _tabBar;


@end
