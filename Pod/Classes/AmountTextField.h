//
//  AmountTextField.h
//  GoodyHut
//
//  Created by Cristian Azov on 10/6/15.
//  Copyright (c) 2015 Cristian Azov. All rights reserved.
//

#import "VATextField.h"

@protocol AmountTextFieldDelegate <VATextFieldDelegate>
@optional
- (void)vaTextFieldDidChange:(UITextField *)textField;
@end

@interface AmountTextField : VATextField

@property (nonatomic, strong) NSNumber *amount;
@property (nonatomic, strong) NSLocale *locale;
@property (nonatomic, assign) NSUInteger minimumFractionDigits; // default 2
@property (nonatomic, assign) BOOL usesGroupingSeparator;       // default YES

@property (nonatomic, assign) id<AmountTextFieldDelegate>amountTextFieldDelegate;


@end
