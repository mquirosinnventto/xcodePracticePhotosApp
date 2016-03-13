//
//  FeedViewController.m
//  photoApp
//
//  Created by mkdev on 13/03/16.
//  Copyright © 2016 Monitron. All rights reserved.
//

#import "FeedViewController.h"
#import "FavoritesViewController.h"
#import "../extensions/AppScreen.h"
#import "../extensions/AppColors.h"


@implementation FeedViewController

float const PROFILE_IMAGE_WIDTH = 150.0;
float const PROFILE_LABELS_WIDTH = 200.0;
float const PROFILE_IMAGE_MARGIN = 30.0;

- (FeedViewController *)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self)
    {

        [self setupControllerTab];
        [self setupViewComponents];
    }
    return self;
}

- (void)setupControllerTab{
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 800.0);

    [self.view addSubview:self.scrollView];
    self.view.backgroundColor = [AppColors blueBackground];
    self.title = @"Feed";
}

- (void)setupViewComponents{
    NSDictionary *profileInfo = @{ @"image_url": @"https://s3.amazonaws.com/uifaces/faces/twitter/rem/128.jpg", @"name": @"David Silverman",
                                   @"from" : @"New Jersey", @"member_since" : @"Members since Ago 2013" };
    
    [self drawProfileImage: profileInfo[@"image_url"]];
    [self drawDisplayControls:profileInfo];
}

- (void)drawDisplayControls:(NSDictionary *) profileInfo{
    float labelsPosX = 10;
    float labelsWidth = [AppScreen screenWidth] -20;
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame: CGRectMake(labelsPosX, 200, labelsWidth, 40)];
    nameLabel.text = profileInfo[@"name"];
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.textAlignment =  NSTextAlignmentCenter;
    
    UILabel *originLabel = [[UILabel alloc] initWithFrame: CGRectMake(labelsPosX, 240, labelsWidth, 40)];
    originLabel.text = profileInfo[@"from"];
    originLabel.textColor = [UIColor whiteColor];
    originLabel.textAlignment =  NSTextAlignmentCenter;
    
    UILabel *totalLabel = [[UILabel alloc] initWithFrame: CGRectMake(labelsPosX, 280, labelsWidth, 40)];
    totalLabel.text = @"34 photos posted";
    totalLabel.textColor = [UIColor whiteColor];
    totalLabel.textAlignment =  NSTextAlignmentCenter;
    
    UILabel *memberLabel = [[UILabel alloc] initWithFrame: CGRectMake(labelsPosX, 320, labelsWidth, 40)];
    memberLabel.text = profileInfo[@"member_since"];
    memberLabel.textColor = [UIColor whiteColor];
    memberLabel.textAlignment =  NSTextAlignmentCenter;
   
    UIButton *navPhotosButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    navPhotosButton.frame = CGRectMake(labelsPosX, 380, labelsWidth, 40);
    navPhotosButton.backgroundColor = [UIColor whiteColor];
    [navPhotosButton addTarget:self action:@selector(showFavorites) forControlEvents: UIControlEventTouchUpInside];
    [navPhotosButton setTitle:@"Go to pothos" forState: UIControlStateNormal];
    
    [self.scrollView addSubview: nameLabel];
    [self.scrollView addSubview: originLabel];
    [self.scrollView addSubview: totalLabel];
    [self.scrollView addSubview: memberLabel];
    [self.scrollView addSubview: navPhotosButton];

}

- (void)drawProfileImage:(NSString *)imageUrl{
    NSData *profileImageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: imageUrl]];
    UIImage *profileImage = [[UIImage alloc] initWithData:profileImageData];
    UIImageView *profileImageComponent = [[UIImageView alloc] initWithImage:profileImage];
    
    float profileImagePosX = [AppScreen getViewComponentPositionX: PROFILE_IMAGE_MARGIN withWidth:PROFILE_IMAGE_WIDTH];
    profileImageComponent.layer.cornerRadius = (PROFILE_IMAGE_WIDTH/2.0);
    profileImageComponent.layer.borderWidth = 5.0;
    profileImageComponent.layer.borderColor = [AppColors blueBackgroundComplement].CGColor;
    profileImageComponent.layer.masksToBounds = YES;
    profileImageComponent.backgroundColor = [UIColor redColor];
    profileImageComponent.frame = CGRectMake(profileImagePosX, 50, PROFILE_IMAGE_WIDTH, PROFILE_IMAGE_WIDTH);
    
    [self.scrollView addSubview:profileImageComponent];

}

- (void)showFavorites{
    FavoritesViewController *favoriteViewController = [[FavoritesViewController alloc] init];
    [self.navigationController pushViewController: favoriteViewController animated:YES];
}


@end
