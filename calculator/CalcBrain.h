//
//  CalcBrain.h
//  calculator
//
//  Created by Alexandra on 21/07/16.
//  Copyright © 2016 Alexandra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalcBrain : NSObject
- (NSString *)performOperation: (NSString*)inputOperation withArgument: (NSString*)operand withNumberOfArguments: (int)args;
- (void)cleanState;

@end
