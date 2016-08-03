//
//  ViewController.m
//  text
//
//  Created by 崔佳琪 on 16/8/2.
//  Copyright © 2016年 Qsyx. All rights reserved.
//

#import "ViewController.h"
#import "ToolKit.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self myUI];
}
- (void)myUI
{
    UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    tf.placeholder = @"你的想法是jb";
    [self.view addSubview:tf];
    UIImageView *_view1 = [[UIImageView alloc]initWithFrame:CGRectMake(0,50,50,50)];
    _view1.userInteractionEnabled=YES;
    _view1.backgroundColor=[UIColor clearColor];
    _view1.image = BundleImage(@"cjdp_df_@2x.png");
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImage)];//给图片加上点击方法
    [_view1 addGestureRecognizer:tap];
    [self.view addSubview:_view1];
    
}
- (void)tapImage
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:@"拍照上传"
                                                    otherButtonTitles:@"本地照片上传",nil];
    [actionSheet setBackgroundColor:[UIColor clearColor]];
    actionSheet.tag = -2;
    [actionSheet showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
//尽管这东西过时了但是我还是喜欢用
{
    UIImagePickerController * picker = [[UIImagePickerController alloc]init];
    switch (buttonIndex)
    {
            
            
        case 0://take photo
        {
            //            [self presentModalViewController:picker animated:YES];
            [self presentViewController:picker animated:YES completion:nil];
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            picker.allowsEditing = YES;
            picker.delegate = self;
            
            break;
        }
        case 1://upload image
        {
            //            UIImagePickerController * picker = [[UIImagePickerController alloc]init];
            //            [self presentModalViewController:picker animated:YES];
            [self presentViewController:picker animated:YES completion:nil];
            
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            picker.allowsEditing = YES;
            picker.delegate = self;
            
            break;
        }
        case 2://cancel
        {
            //            [self.presentedViewController dismissModalViewControllerAnimated:YES];
            break;
        }
        default:
            break;
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
