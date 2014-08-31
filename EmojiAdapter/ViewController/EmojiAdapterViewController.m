//
//  EmojiAdapterViewController.m
//  EmojiAdapter
//
//  Created by Jeason on 14-8-31.
//  Copyright (c) 2014年 Jeason. All rights reserved.
//

#import "EmojiAdapterViewController.h"
#import "NSString+Emoji.h"

static const NSUInteger inset = 20;

@interface EmojiAdapterViewController ()

@end

@implementation EmojiAdapterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect textViewFrame = self.view.frame;
    textViewFrame.origin.y += inset * 3;
    textViewFrame.size.height -= inset * 6;
    textViewFrame.origin.x += inset;
    textViewFrame.size.width -= inset * 2;
    UITextView *aTextView = [[UITextView alloc] initWithFrame:textViewFrame];
    aTextView.editable = NO;
    
    NSString *toEncodeString = @"EmojiToBegin 😁 😍 😁 I Like Emoji! 😄 😳 😁 EmojiEnd.";
    aTextView.text = @"ToEncodeString is :\n";
    aTextView.text = [aTextView.text stringByAppendingString:toEncodeString];
    aTextView.text = [aTextView.text stringByAppendingFormat:@"\nLength is : %u\n",[toEncodeString length]];
    
    NSString *enCodedString = [toEncodeString encodeString];
    aTextView.text = [aTextView.text stringByAppendingFormat:@"\n\nEncoded String is : %@\n Length is : %u\n", enCodedString, [enCodedString length]];
    
    NSString *decodedString = [enCodedString decodeString];
    aTextView.text = [aTextView.text stringByAppendingFormat:@"\n\nDecoded String is : %@\nLength is: %u\n", decodedString, [decodedString length]];
    
    [self.view addSubview:aTextView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
