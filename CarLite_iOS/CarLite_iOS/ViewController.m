//
//  ViewController.m
//  CarLite_iOS
//
//  Created by lizh on 2020/11/12.
//  Copyright © 2020 lizh. All rights reserved.
//

#import "ViewController.h"
#import "MapViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *mapButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    mapButton.backgroundColor = [UIColor redColor];
    [mapButton addTarget:self action:@selector(mapClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mapButton];
    
    
//    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
}

- (void)mapClick{
    
    MapViewController *map = [[MapViewController alloc] init];
//    [self.navigationController pushViewController:map animated:YES];
    [self presentViewController:map animated:YES completion:nil];
}


@end
