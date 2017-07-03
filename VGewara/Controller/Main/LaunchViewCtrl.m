//
//  LaunchViewCtrl.m
//  VGewara
//
//  Created by 黄聪 on 2017/3/31.
//  Copyright © 2017年 黄聪. All rights reserved.
//

#import "LaunchViewCtrl.h"
#import <YYImage/YYImage.h>

@interface LaunchViewCtrl (){
    YYAnimatedImageView *logoImgView;
}


@end

@implementation LaunchViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    YYImage *image = [YYImage imageNamed:@"launchGif.gif"];
    logoImgView = [[YYAnimatedImageView alloc] initWithImage:image];
    [self.view addSubview:logoImgView];
    [logoImgView addObserver:self forKeyPath:@"currentAnimatedImageIndex" options:NSKeyValueObservingOptionInitial context:nil];
    
}


- (void)updateViewConstraints {
    [logoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    [super updateViewConstraints];
}

- (void)dealloc {
    [logoImgView removeObserver:self forKeyPath:@"currentAnimatedImageIndex"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark gif kvo
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([object currentAnimatedImageIndex]==26) {
        [object stopAnimating];
        UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *mainViewCtrl = [mainSB instantiateViewControllerWithIdentifier:@"MainViewCtrl"];
        [self.navigationController pushViewController:mainViewCtrl animated:YES];
    }
    NSLog(@"%ld",[object currentAnimatedImageIndex]);
}

//#pragma mark NavDelegate
//- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
//    
//
//
//
//
//}
- (IBAction)pushtest:(id)sender {
    UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *mainViewCtrl = [mainSB instantiateViewControllerWithIdentifier:@"MainViewCtrl"];
    [self presentViewController:mainViewCtrl animated:YES completion:nil];
}




@end
