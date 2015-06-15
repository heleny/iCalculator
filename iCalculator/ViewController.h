//
//  ViewController.h
//  iCalculator
//
//  Created by Helen Yang on 2015-06-14.
//  Copyright © 2015 Helen Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, Operation) {
    Add,
    Substract,
    Multiply,
    Divide,
    None
};

@interface ViewController : UIViewController {
    Operation _operation;
    double _display;
    double _result;
    BOOL _isDecimal;
}


@property (weak, nonatomic) IBOutlet UILabel *resultLabel;


- (IBAction)ac:(id)sender;
- (IBAction)plusMinus:(id)sender;
- (IBAction)divide:(id)sender;
- (IBAction)multiply:(id)sender;
- (IBAction)subsctract:(id)sender;
- (IBAction)add:(id)sender;
- (IBAction)equal:(id)sender;
- (IBAction)dot:(id)sender;
- (IBAction)seven:(id)sender;
- (IBAction)eight:(id)sender;
- (IBAction)nine:(id)sender;
- (IBAction)six:(id)sender;
- (IBAction)five:(id)sender;
- (IBAction)four:(id)sender;
- (IBAction)three:(id)sender;
- (IBAction)two:(id)sender;
- (IBAction)one:(id)sender;
- (IBAction)zero:(id)sender;

- (void)setResultWithNumber:(int)number;
- (void)numberWithOperation:(Operation)operation;

@end

