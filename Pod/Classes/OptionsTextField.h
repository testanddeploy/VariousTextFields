//
//  OptionsTextField.h
//  GoodyHut
//
//  Created by Cristian Azov on 10/7/15.
//  Copyright (c) 2015 Cristian Azov. All rights reserved.
//

#import "VATextField.h"

@protocol OptionsTextFieldDelegate <VATextFieldDelegate>
@optional
- (void)vaTextField:(UITextField *)textField didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
@end

@interface OptionsTextField : VATextField

@property (nonatomic, strong) NSArray *options;
@property (nonatomic, assign) id<OptionsTextFieldDelegate>optionsTextFieldDelegate;
@property (nonatomic, assign) BOOL dismissUponSelection;

- (void)preselectOptionAtRow:(NSUInteger)index inColumn:(NSUInteger)column animated:(BOOL)animated;

@end
