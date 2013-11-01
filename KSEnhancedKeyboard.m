//
//  KSEnhancedKeyboard.m
//  TextTabTest
//
//  Created by ksenno on 10/31/13.
//  Copyright (c) 2013 ksenno. All rights reserved.
//
//  based on http://zeroheroblog.com/ios/how-to-create-a-simple-keyboard-with-custom-navigation-buttons
//

#import "KSEnhancedKeyboard.h"

@implementation KSEnhancedKeyboard

- (UIToolbar*)getToolbarWithPrevEnabled:(BOOL)prevEnabled NextEnabled:(BOOL)nextEnabled DoneEnabled:(BOOL)doneEnabled
{
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setBarStyle:UIBarStyleDefault];
    [toolbar sizeToFit];
    
    NSMutableArray *toolbarItems = [[NSMutableArray alloc] init];
    
    UISegmentedControl *leftItems = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Previous", @"Next", nil]];
    //leftItems.segmentedControlStyle = UISegmentedControlStyleBar;
    [leftItems setEnabled:prevEnabled forSegmentAtIndex:0];
    [leftItems setEnabled:nextEnabled forSegmentAtIndex:1];
    leftItems.momentary = YES; // do not preserve button's state
    [leftItems addTarget:self action:@selector(nextPrevHandlerDidChange:) forControlEvents:UIControlEventValueChanged];
    
    UIBarButtonItem *nextPrevControl = [[UIBarButtonItem alloc] initWithCustomView:leftItems];
    [toolbarItems addObject:nextPrevControl];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [toolbarItems addObject:flexSpace];
    
    UIBarButtonItem *doneButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneDidClick:)];
    [toolbarItems addObject:doneButton];
    
    toolbar.items = toolbarItems;
    
    return toolbar;
}

- (void)nextPrevHandlerDidChange:(id)sender
{
    switch ([(UISegmentedControl *)sender selectedSegmentIndex])
    {
        if (! [self delegate])
        {
            return;
        }
        
        case 0:
            [self.delegate previousDidTouchDown];
            NSLog(@"Previous");
            break;
        case 1:
            [self.delegate nextDidTouchDown];
            NSLog(@"Next");
            break;
        default:
            break;
    }
}

- (void)doneDidClick:(id)sender
{
    [self.delegate doneDidTouchDown];
    NSLog(@"Done");
}

@end
