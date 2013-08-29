//
//  SHViewController.m
//  AVMemoryIssue
//
//  Created by Nicholas Dawson on 29/08/2013.
//  Copyright (c) 2013 Shopitize Ltd. All rights reserved.
//

#import "SHViewController.h"

#import <ZBarSDK/ZBarReaderViewController.h>

@interface SHViewController ()

@property (nonatomic, strong) ZBarReaderViewController *readerVC;

@end

@implementation SHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showBarcodeScanner:(id)sender {
    self.readerVC = [ZBarReaderViewController new];
    self.readerVC.readerDelegate = self;
    self.readerVC.showsZBarControls = YES;
    self.readerVC.showsCameraControls = NO;
    self.readerVC.tracksSymbols = YES;
    
    // Lock it down to QR, EAN13, EAN8, UPC-A and UPC-E
    [self.readerVC.scanner setSymbology:0 config:ZBAR_CFG_ENABLE to:0];
    [self.readerVC.scanner setSymbology:ZBAR_EAN13 config:ZBAR_CFG_ENABLE to:1];
    [self.readerVC.scanner setSymbology:ZBAR_EAN8 config:ZBAR_CFG_ENABLE to:1];
    [self.readerVC.scanner setSymbology:ZBAR_UPCA config:ZBAR_CFG_ENABLE to:1];
    [self.readerVC.scanner setSymbology:ZBAR_UPCE config:ZBAR_CFG_ENABLE to:1];
    [self.readerVC.scanner setSymbology:ZBAR_QRCODE config:ZBAR_CFG_ENABLE to:1];
    
    [self presentViewController:self.readerVC animated:YES completion:^{
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
    }];
}

@end
