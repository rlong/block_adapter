// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import "BAPickerBlockAdapter.h"

#import "JBMemoryModel.h"
#import "JBWorkManager.h"


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface BAPickerBlockAdapter ()


-(id)initWithClient:(UIPickerView*)client adaptee:(BAPickerAdaptee)adaptee;

-(id)initWithClient:(UIPickerView*)client adaptee:(BAPickerAdaptee)adaptee asyncBlock:(JBBlock)asyncTask asyncBlockDone:(JBBlockDone)asyncTaskDone asyncBlockFailed:(JBBlockFailed)asyncTaskFailed;


#pragma mark fields

// client
//UIPickerView* _client;
@property (nonatomic, retain) UIPickerView* client;
//@synthesize client = _client;


// adaptee
//BAPickerAdaptee _adaptee;
@property (nonatomic, copy) BAPickerAdaptee adaptee;
//@synthesize adaptee = _adaptee;


@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#pragma mark -

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface BATitlePickerBlockAdapter : BAPickerBlockAdapter {
    
    // titleProvider
    BAPickerTitleProvider _titleProvider;
    //@property (nonatomic, copy) BAPickerTitleProvider titleProvider;
    //@synthesize titleProvider = _titleProvider;
    
    
}


// titleProvider
//BAPickerTitleProvider _titleProvider;
@property (nonatomic, copy) BAPickerTitleProvider titleProvider;
//@synthesize titleProvider = _titleProvider;


@end

@implementation BATitlePickerBlockAdapter



#pragma mark -
#pragma mark <UIPickerViewDelegate> implementation


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return _titleProvider( pickerView, row, component );
    
}

#pragma mark instance lifecycle


-(id)initWithClient:(UIPickerView*)client titleProvider:(BAPickerTitleProvider)titleProvider adaptee:(BAPickerAdaptee)adaptee {
    
    BATitlePickerBlockAdapter* answer = [super initWithClient:client adaptee:adaptee];
    
    if( nil != answer ) {
        
        [answer setTitleProvider:titleProvider];
        
        [client setDelegate:answer];
        
    }
    
    return answer;
}

-(id)initWithClient:(UIPickerView*)client titleProvider:(BAPickerTitleProvider)titleProvider adaptee:(BAPickerAdaptee)adaptee asyncBlock:(JBBlock)asyncTask asyncBlockDone:(JBBlockDone)asyncTaskDone asyncBlockFailed:(JBBlockFailed)asyncTaskFailed {
    
    BATitlePickerBlockAdapter* answer = [super initWithClient:client adaptee:adaptee asyncBlock:asyncTask asyncBlockDone:asyncTaskDone asyncBlockFailed:asyncTaskFailed];
    
    if( nil != answer ) {
        
        [answer setTitleProvider:titleProvider];
        
        [client setDelegate:answer];
    }
    
    return answer;
}

-(void)dealloc {
	
	[self setTitleProvider:nil];
	
    JBSuperDealloc();
	
}

#pragma mark fields


// titleProvider
//BAPickerTitleProvider _titleProvider;
//@property (nonatomic, copy) BAPickerTitleProvider titleProvider;
@synthesize titleProvider = _titleProvider;

@end



#pragma mark -

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////


@interface BAViewPickerBlockAdapter : BAPickerBlockAdapter {
    
    // viewProvider
    BAPickerViewProvider _viewProvider;
    //@property (nonatomic, copy) BAPickerViewProvider viewProvider;
    //@synthesize viewProvider = _viewProvider;
    
}

// viewProvider
//BAPickerViewProvider _viewProvider;
@property (nonatomic, copy) BAPickerViewProvider viewProvider;
//@synthesize viewProvider = _viewProvider;

@end

@implementation BAViewPickerBlockAdapter

#pragma mark -
#pragma mark <UIPickerViewDelegate> implementation


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    return _viewProvider( pickerView, row, component, view );
    
}


#pragma mark instance lifecycle


#pragma mark instance lifecycle


-(id)initWithClient:(UIPickerView*)client viewProvider:(BAPickerViewProvider)viewProvider adaptee:(BAPickerAdaptee)adaptee {
    
    BAViewPickerBlockAdapter* answer = [super initWithClient:client adaptee:adaptee];
    
    if( nil != answer ) {
        
        [answer setViewProvider:viewProvider];
        
        [client setDelegate:answer];
        
    }
    
    return answer;
}

-(id)initWithClient:(UIPickerView*)client viewProvider:(BAPickerViewProvider)viewProvider adaptee:(BAPickerAdaptee)adaptee asyncBlock:(JBBlock)asyncTask asyncBlockDone:(JBBlockDone)asyncTaskDone asyncBlockFailed:(JBBlockFailed)asyncTaskFailed {
    
    BAViewPickerBlockAdapter* answer = [super initWithClient:client adaptee:adaptee asyncBlock:asyncTask asyncBlockDone:asyncTaskDone asyncBlockFailed:asyncTaskFailed];
    
    if( nil != answer ) {
        
        [answer setViewProvider:viewProvider];
        
        [client setDelegate:answer];
    }
    
    return answer;
}


-(void)dealloc {
	
    [self setViewProvider:nil];
	
    JBSuperDealloc();
	
}

#pragma mark fields

// viewProvider
//BAPickerViewProvider _viewProvider;
//@property (nonatomic, copy) BAPickerViewProvider viewProvider;
@synthesize viewProvider = _viewProvider;


@end



#pragma mark -




@implementation BAPickerBlockAdapter



+(BAPickerBlockAdapter*)adapterWithClient:(UIPickerView *)client titleProvider:(BAPickerTitleProvider)titleProvider adaptee:(BAPickerAdaptee)adaptee {
    
    BAPickerBlockAdapter* answer = [[BATitlePickerBlockAdapter alloc]
                                    initWithClient:client
                                    titleProvider:titleProvider
                                    adaptee:adaptee];
    JBAutorelease(answer);
    
    return answer;
    
}

+(BAPickerBlockAdapter*)adapterWithClient:(UIPickerView *)client titleProvider:(BAPickerTitleProvider)titleProvider adaptee:(BAPickerAdaptee)adaptee asyncTask:(JBBlock)asyncTask afterAsyncTaskDone:(JBBlockDone)asyncTaskDone afterAsyncTaskFailed:(JBBlockFailed)asyncTaskFailed {
    
    BAPickerBlockAdapter* answer = [[BATitlePickerBlockAdapter alloc]
                                    initWithClient:client
                                    titleProvider:titleProvider
                                    adaptee:adaptee
                                    asyncBlock:asyncTask
                                    asyncBlockDone:asyncTaskDone
                                    asyncBlockFailed:asyncTaskFailed];
    JBAutorelease(answer);
    
    return answer;
    
}


+(BAPickerBlockAdapter*)adapterWithClient:(UIPickerView *)client viewProvider:(BAPickerViewProvider)viewProvider adaptee:(BAPickerAdaptee)adaptee {
    
    BAPickerBlockAdapter* answer = [[BAViewPickerBlockAdapter alloc]
                                    initWithClient:client
                                    viewProvider:viewProvider
                                    adaptee:adaptee];
    JBAutorelease(answer);
    
    return answer;
    
}


+(BAPickerBlockAdapter*)adapterWithClient:(UIPickerView *)client viewProvider:(BAPickerViewProvider)viewProvider adaptee:(BAPickerAdaptee)adaptee asyncTask:(JBBlock)asyncTask afterAsyncTaskDone:(JBBlockDone)asyncTaskDone afterAsyncTaskFailed:(JBBlockFailed)asyncTaskFailed {
    
    BAPickerBlockAdapter* answer = [[BAViewPickerBlockAdapter alloc]
                                    initWithClient:client
                                    viewProvider:viewProvider
                                    adaptee:adaptee
                                    asyncBlock:asyncTask
                                    asyncBlockDone:asyncTaskDone
                                    asyncBlockFailed:asyncTaskFailed];
    JBAutorelease(answer);
    
    return answer;
    
}


#pragma mark -
#pragma mark <UIPickerViewDelegate> implementation


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    id adapteeResponse = _adaptee( pickerView, row, component );
    
    if( nil != _asyncBlock ) {
        
        [JBBlockJob executeWithContext:adapteeResponse block:_asyncBlock onBlockDone:_asyncBlockDone onBlockFailed:_asyncBlockFailed];
    }

    
}


#pragma mark -
#pragma mark instance lifecycle


-(id)initWithClient:(UIPickerView*)client adaptee:(BAPickerAdaptee)adaptee {
    
    BAPickerBlockAdapter* answer = [super initWithAsyncBlock:nil asyncBlockDone:nil asyncBlockFailed:nil];
    
    if( nil != answer ) {
        
        [answer setClient:client];
        [answer setAdaptee:adaptee];
        
        
    }
    
    return answer;
}

-(id)initWithClient:(UIPickerView*)client adaptee:(BAPickerAdaptee)adaptee asyncBlock:(JBBlock)asyncTask asyncBlockDone:(JBBlockDone)asyncTaskDone asyncBlockFailed:(JBBlockFailed)asyncTaskFailed {
    
    BAPickerBlockAdapter* answer = [super initWithAsyncBlock:asyncTask asyncBlockDone:asyncTaskDone asyncBlockFailed:asyncTaskFailed];
    
    if( nil != answer ) {
        
        [answer setClient:client];
        [answer setAdaptee:adaptee];
        
    }
    
    return answer;
}

-(void)dealloc {
	
    [self setClient:nil];
	[self setAdaptee:nil];

	
    JBSuperDealloc();
	
}

#pragma mark -
#pragma mark fields

// client
//UIPickerView* _client;
//@property (nonatomic, retain) UIPickerView* client;
@synthesize client = _client;


// adaptee
//BAPickerAdaptee _adaptee;
//@property (nonatomic, copy) BAPickerAdaptee adaptee;
@synthesize adaptee = _adaptee;



@end
