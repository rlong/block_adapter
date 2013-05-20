// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import <Foundation/Foundation.h>

@interface BAAlertView : UIView {
    
    // blockAdapters
    NSMutableArray* _blockAdapters;
    //@property (nonatomic, retain) NSMutableArray* blockAdapters;
    //@synthesize blockAdapters = _blockAdapters;

    
    
    // blockAlert
    UIButton* _blockAlert;
    //@property (nonatomic, retain) IBOutlet UIButton* blockAlert;
    //@synthesize blockAlert = _blockAlert;


    // asyncBlockAlert
    UIButton* _asyncBlockAlert;
    //@property (nonatomic, retain) IBOutlet UIButton* asyncBlockAlert;
    //@synthesize asyncBlockAlert = _asyncBlockAlert;

    
}

-(void)addAdapter:(id)adapter;

#pragma mark -
#pragma mark fields

// blockAlert
//UIButton* _blockAlert;
@property (nonatomic, retain) IBOutlet UIButton* blockAlert;
//@synthesize blockAlert = _blockAlert;

// asyncBlockAlert
//UIButton* _asyncBlockAlert;
@property (nonatomic, retain) IBOutlet UIButton* asyncBlockAlert;
//@synthesize asyncBlockAlert = _asyncBlockAlert;


@end
