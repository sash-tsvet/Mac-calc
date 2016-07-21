//
//  ViewController.m
//  calculator
//
//  Created by Alexandra on 20/07/16.
//  Copyright © 2016 Alexandra. All rights reserved.
//

#import "ViewController.h"
#import "CalcBrain.h"

@interface ViewController () {
    __weak IBOutlet UILabel *label;
    CalcBrain *brain;
}

@property BOOL operationEnd;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)acPressed:(id)sender {
    [brain cleanState];
    [label setText:[NSString stringWithFormat:@"%d", 0]];
}

- (IBAction)cPressed:(id)sender {
    [label setText:[NSString stringWithFormat:@"%d", 0]];
}

- (IBAction)monoOperandOperation:(id)sender {
    [label setText:[NSString stringWithFormat:@"%@", [[self brain] performOperation:[[sender titleLabel] text] withArgument:label.text withNumberOfArguments:1]]];
    _operationEnd = true;
}

- (IBAction)twoOperandsOperation:(id)sender {
    [label setText:[NSString stringWithFormat:@"%@", [[self brain] performOperation:[[sender titleLabel] text] withArgument:label.text withNumberOfArguments:2]]];
    _operationEnd = true;
}

- (IBAction)digitPressed:(id)sender {
    NSString *digit= [[sender titleLabel] text];
    NSString *text = label.text;
    if (![text  isEqual: @"0"] && ![text  isEqual: @"(null)"] && !_operationEnd)
        [label setText:[NSString stringWithFormat:@"%@%@", text, digit]];
    else
        [label setText:[NSString stringWithFormat:@"%@", digit]];
    _operationEnd = false;
}

-(CalcBrain *)brain {
    if (!brain) brain = [[CalcBrain alloc] init];
    return brain;
}

@end
