// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import <Foundation/Foundation.h>

@interface BAInitialView : UIView {
    
    // blockAdapters
    NSMutableArray* _blockAdapters;
    //@property (nonatomic, retain) NSMutableArray* blockAdapters;
    //@synthesize blockAdapters = _blockAdapters;
    
    
    // buttons
    UIButton* _buttons;
    //@property (nonatomic, retain) IBOutlet UIButton* buttons;
    //@synthesize buttons = _buttons;
    

    // alerts
    UIButton* _alerts;
    //@property (nonatomic, retain) IBOutlet UIButton* alerts;
    //@synthesize alerts = _alerts;

    // actionSheets
    UIButton* _actionSheets;
    //@property (nonatomic, retain) IBOutlet UIButton* actionSheets;
    //@synthesize actionSheets = _actionSheets;

    // tableViewDelegate
    UIButton* _tableViewDelegate;
    //@property (nonatomic, retain) IBOutlet UIButton* tableViewDelegate;
    //@synthesize tableViewDelegate = _tableViewDelegate;
    
    // barButtonItem
    UIButton* _barButtonItem;
    //@property (nonatomic, retain) IBOutlet UIButton* barButtonItem;
    //@synthesize barButtonItem = _barButtonItem;
    
    // picker
    UIButton* _picker;
    //@property (nonatomic, retain) IBOutlet UIButton* picker;
    //@synthesize picker = _picker;


}

-(void)addAdapter:(id)adapter;


#pragma mark -
#pragma mark fields

// buttons
//UIButton* _buttons;
@property (nonatomic, retain) IBOutlet UIButton* buttons;
//@synthesize buttons = _buttons;

// alerts
//UIButton* _alerts;
@property (nonatomic, retain) IBOutlet UIButton* alerts;
//@synthesize alerts = _alerts;

// actionSheets
//UIButton* _actionSheets;
@property (nonatomic, retain) IBOutlet UIButton* actionSheets;
//@synthesize actionSheets = _actionSheets;

// tableViewDelegate
//UIButton* _tableViewDelegate;
@property (nonatomic, retain) IBOutlet UIButton* tableViewDelegate;
//@synthesize tableViewDelegate = _tableViewDelegate;

// barButtonItem
//UIButton* _barButtonItem;
@property (nonatomic, retain) IBOutlet UIButton* barButtonItem;
//@synthesize barButtonItem = _barButtonItem;

// picker
//UIButton* _picker;
@property (nonatomic, retain) IBOutlet UIButton* picker;
//@synthesize picker = _picker;

@end
