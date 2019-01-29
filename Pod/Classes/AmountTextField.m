//
//  AmountTextField.m
//  GoodyHut
//
//  Created by Cristian Azov on 10/6/15.
//  Copyright (c) 2015 Cristian Azov. All rights reserved.
//

#define IS_AN_INTEGER(string) [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^([+-]?)(?:|0|[1-9]\\d*)?$"] evaluateWithObject:string]


#import "AmountTextField.h"

@interface AmountTextField () <AmountTextFieldDelegate> {
  NSNumberFormatter *formatter;
}

@end

@implementation AmountTextField

@synthesize amount = _amount;

- (instancetype)initWithCoder:(NSCoder *)coder
{
  self = [super initWithCoder:coder];
  if (self) {
    self.textAlignment = NSTextAlignmentRight;
    _usesGroupingSeparator = YES;
    _minimumFractionDigits = 2;

    self.keyboardType = UIKeyboardTypeDecimalPad;
    
    formatter = [[NSNumberFormatter alloc] init];
    formatter.minimumFractionDigits = _minimumFractionDigits;
    formatter.maximumFractionDigits = _minimumFractionDigits;
    formatter.minimumIntegerDigits = 1;
    formatter.locale = [NSLocale currentLocale];
    formatter.usesGroupingSeparator = YES;

    self.amount = @(0);
    self.vaTextFieldDelegate = self;
  }
  return self;
}

#pragma mark - Setters, getters

- (NSNumber *)amount {
  return [formatter numberFromString:self.text];
}

- (void)setAmount:(NSNumber *)amount {
  _amount = amount;
  self.text = [formatter stringFromNumber:amount];
}

- (void)setLocale:(NSLocale *)locale {
  formatter.locale = locale;
  self.text = [formatter stringFromNumber:_amount];
}

#pragma mark - UITextField delegates
- (BOOL)vaTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
  
  formatter.usesGroupingSeparator = _usesGroupingSeparator;
  
  if (string.length > 1 || !IS_AN_INTEGER(string)) {
    return NO;
  }
  else {
    NSMutableString *amount = [[NSMutableString alloc] initWithString:textField.text];
    
    NSUInteger count = 1 + _minimumFractionDigits + (_minimumFractionDigits > 0 ? 1 : 0);
    
    if (string.length == 0) { // backspace
      [amount deleteCharactersInRange:NSMakeRange(amount.length - 1, 1)];
      
      if (amount.length < count) {
        [amount insertString:@"0" atIndex:0];
      }
    }
    else { // number
      [amount appendString:string];
      if ([amount characterAtIndex:0] == '0') {
        [amount deleteCharactersInRange:NSMakeRange(0, 1)];
      }
    }
    [self removeSeparator:formatter.decimalSeparator string:amount];
    [self removeSeparator:formatter.groupingSeparator string:amount];
    
    textField.text = [self addSeparatorsInString:amount];
    
    if ([_amountTextFieldDelegate respondsToSelector:@selector(vaTextFieldDidChange:)]) {
      [_amountTextFieldDelegate vaTextFieldDidChange:textField];
    }
  }
  return NO;
}

#pragma mark - Separator operations

- (NSString *)addSeparatorsInString:(NSString *)string {
  
  NSMutableString *result = [[NSMutableString alloc] init];
  
  int counter = 0;
  for (int i = (int)string.length - 1; i >= 0; i--) {
    counter++;
    NSString *symbol = [NSString stringWithFormat:@"%c", [string characterAtIndex:i]];
    [result insertString:symbol atIndex:0];
    
    // decimal separator
    if (_minimumFractionDigits > 0 && counter == _minimumFractionDigits) {
      [result insertString:formatter.decimalSeparator atIndex:0];
    }
    
    // grouping separator
    if (_usesGroupingSeparator &&
        counter > _minimumFractionDigits &&
        counter != string.length &&
        (counter - _minimumFractionDigits) % 3 == 0) {
      [result insertString:formatter.groupingSeparator atIndex:0];
    }
  }
  return result;
}

- (void)shiftSeparatorToRight:(NSString *)separator string:(NSMutableString *)string {
  
  for (int i = (int)string.length - 1; i >= 0; i--) {
    
    NSString *symbol = [NSString stringWithFormat:@"%c", [string characterAtIndex:i]];
    
    if ([symbol isEqualToString:separator]) {
      [string deleteCharactersInRange:NSMakeRange(i, 1)];
      [string insertString:symbol atIndex:i + 1];
    }
  }
}

- (void)removeSeparator:(NSString *)separator string:(NSMutableString *)string {
  for (int i = (int)string.length - 1; i >= 0; i--) {
    if ([[NSString stringWithFormat:@"%c", [string characterAtIndex:i]] isEqualToString:separator]) {
      [string deleteCharactersInRange:NSMakeRange(i, 1)];
    }
  }
}

@end
