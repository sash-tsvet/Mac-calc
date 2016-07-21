//
//  CalcBrain.m
//  calculator
//
//  Created by Alexandra on 21/07/16.
//  Copyright © 2016 Alexandra. All rights reserved.
//

#import "CalcBrain.h"

@interface CalcBrain ()

@property NSString *operandOld;
@property NSString *savedOperation;

@end


@implementation CalcBrain

- (instancetype)init {
    self = [super init];
    if (self) {
        _operandOld = @"0";
        _savedOperation = @"=";
    }
    return self;
}

- (NSString *)performOperation: (NSString*)inputOperation withArgument: (NSString*)operand withNumberOfArguments: (int)args{
    if (args == 1){
        if ([inputOperation isEqualToString:@"+-"]) return [NSString stringWithFormat:@"%f", -[operand doubleValue]];
        if ([inputOperation isEqualToString:@"sqrt"]) return [NSString stringWithFormat:@"%f", sqrt([operand doubleValue])];
    }
    else if (args == 2){
        if ([_savedOperation isEqualToString:@"+"])
            _operandOld = [NSString stringWithFormat:@"%f", [_operandOld doubleValue] + [operand doubleValue]];
        else if ([_savedOperation isEqualToString:@"-"])
            _operandOld = [NSString stringWithFormat:@"%f", [_operandOld doubleValue] - [operand doubleValue]];
        else if ([_savedOperation isEqualToString:@"*"])
            _operandOld = [NSString stringWithFormat:@"%f", [_operandOld doubleValue] * [operand doubleValue]];
        else if ([_savedOperation isEqualToString:@"/"])
            _operandOld = [NSString stringWithFormat:@"%f", [_operandOld doubleValue] / [operand doubleValue]];
        else //if ([_savedOperation isEqualToString:@"="]) or new
            _operandOld = [NSString stringWithFormat:@"%f", [operand doubleValue]];
        _savedOperation = inputOperation;
        return _operandOld;
    }
    return nil;
}

- (void)cleanState{
    _operandOld = @"";
    _savedOperation = @"";
}

@end
