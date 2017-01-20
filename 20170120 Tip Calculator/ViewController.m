//
//  ViewController.m
//  20170120 Tip Calculator
//
//  Created by Minhung Ling on 2017-01-20.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UIButton *tipButton;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UISlider *tipSlider;
@property (weak, nonatomic) IBOutlet UITextField *tipTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tipTextField setKeyboardType:UIKeyboardTypeDecimalPad];
    [self.billTextField setKeyboardType:UIKeyboardTypeDecimalPad];
    [self.tipTextField addTarget:self action:@selector(hideKeyboard:) forControlEvents:UIControlEventEditingDidEnd];
    self.tipTextField.delegate = self;
    self.billTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressTipButton:(UIButton *)sender {
    self.tipAmountLabel.text = [NSString stringWithFormat:@"$%.2f", ([self.billTextField.text intValue]*self.tipSlider.value/100)];
}

- (IBAction)setTextTipChange:(UITextField *)sender {
    float bill = [self.billTextField.text intValue];
    float percent = [self.tipTextField.text intValue];
    self.tipAmountLabel.text = [NSString stringWithFormat:@"$%.2f", (bill*percent/100)];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void) hideKeyboard: (id) sender {
}

- (IBAction)slideSlider:(UISlider *)sender {
    [self.tipButton setTitle:[NSString stringWithFormat:@"Calculate %.0f%%", self.tipSlider.value] forState:UIControlStateNormal];
}
@end
