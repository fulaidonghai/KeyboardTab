//
//  ViewController.m
//  TextTabTest
//
//  Created by ksenno on 10/31/13.
//  Copyright (c) 2013 ksenno. All rights reserved.
//
//  based on http://zeroheroblog.com/ios/how-to-create-a-simple-keyboard-with-custom-navigation-buttons
//

#import "ViewController.h"


@interface ViewController ()
@property (strong, nonatomic) KSEnhancedKeyboard *enhancedKeyboard;

@end

@implementation ViewController
@synthesize field1;
@synthesize field2;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.field1 setTag:1];
    [self.field2 setTag:2];
    
    self.enhancedKeyboard = [[KSEnhancedKeyboard alloc] init];
    field1.delegate = self;
    field2.delegate = self;
    
    self.enhancedKeyboard.delegate = self;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"yes");
    
    [textField setInputAccessoryView:[self.enhancedKeyboard getToolbarWithPrevEnabled:YES NextEnabled:YES DoneEnabled:YES]];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//Implementing delegated methods

- (void)nextDidTouchDown
{
    if ([self.field1 isEditing])
    {
        [self.field2 becomeFirstResponder];
    }
}

- (void)previousDidTouchDown
{
    if ([self.field2 isEditing])
    {
        [self.field1 becomeFirstResponder];
    }
}

- (void)doneDidTouchDown
{
    if ([self.field1 isEditing])
    {
        NSLog(@"done from field 1");
        [self.field1 resignFirstResponder];
    }
    else
    {
        NSLog(@"done from field 2");
        [self.field2 resignFirstResponder];
    }
}

@end
