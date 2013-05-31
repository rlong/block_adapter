// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import <Foundation/Foundation.h>

@interface BAPickerView : UIView {
    
    // blockAdapters
    NSMutableArray* _blockAdapters;
    //@property (nonatomic, retain) NSMutableArray* blockAdapters;
    //@synthesize blockAdapters = _blockAdapters;
    
    
    
    // standardView
    UIView* _standardView;
    //@property (nonatomic, retain) IBOutlet UIView* standardView;
    //@synthesize standardView = _standardView;
    
    // standardPicker
    UIPickerView* _standardPicker;
    //@property (nonatomic, retain) IBOutlet UIPickerView* standardPicker;
    //@synthesize standardPicker = _standardPicker;
    

    
    
    // blockView
    UIView* _blockView;
    //@property (nonatomic, retain) IBOutlet UIView* blockView;
    //@synthesize blockView = _blockView;
    
    // blockPicker
    UIPickerView* _blockPicker;
    //@property (nonatomic, retain) IBOutlet UIPickerView* blockPicker;
    //@synthesize blockPicker = _blockPicker;

    
    // asyncBlockView
    UIView* _asyncBlockView;
    //@property (nonatomic, retain) IBOutlet UIView* asyncBlockView;
    //@synthesize asyncBlockView = _asyncBlockView;
    
    // asyncBlockPicker
    UIPickerView* _asyncBlockPicker;
    //@property (nonatomic, retain) IBOutlet UIPickerView* asyncBlockPicker;
    //@synthesize asyncBlockPicker = _asyncBlockPicker;

    

    // tabBar
    UITabBar* _tabBar;
    //@property (nonatomic, retain) IBOutlet UITabBar* tabBar;
    //@synthesize tabBar = _tabBar;


}

-(void)addAdapter:(id)adapter;

#pragma mark -
#pragma mark fields




// standardView
//UIView* _standardView;
@property (nonatomic, retain) IBOutlet UIView* standardView;
//@synthesize standardView = _standardView;


// standardPicker
//UIPickerView* _standardPicker;
@property (nonatomic, retain) IBOutlet UIPickerView* standardPicker;
//@synthesize standardPicker = _standardPicker;



// blockView
//UIView* _blockView;
@property (nonatomic, retain) IBOutlet UIView* blockView;
//@synthesize blockView = _blockView;

// blockPicker
//UIPickerView* _blockPicker;
@property (nonatomic, retain) IBOutlet UIPickerView* blockPicker;
//@synthesize blockPicker = _blockPicker;

// asyncBlockView
//UIView* _asyncBlockView;
@property (nonatomic, retain) IBOutlet UIView* asyncBlockView;
//@synthesize asyncBlockView = _asyncBlockView;

// asyncBlockPicker
//UIPickerView* _asyncBlockPicker;
@property (nonatomic, retain) IBOutlet UIPickerView* asyncBlockPicker;
//@synthesize asyncBlockPicker = _asyncBlockPicker;

// tabBar
//UITabBar* _tabBar;
@property (nonatomic, retain) IBOutlet UITabBar* tabBar;
//@synthesize tabBar = _tabBar;

@end
