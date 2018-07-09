//
//  JLSearchViewController.m
//  iOSNote
//
//  Created by li’Pro on 2018/7/9.
//  Copyright © 2018年 li’s Air. All rights reserved.
//

#import "JLSearchViewController.h"

@interface JLSearchViewController ()<UISearchResultsUpdating, UISearchBarDelegate>

@property (strong, nonatomic) MASConstraint *consTableViewTop;
@property (assign, nonatomic) CGFloat searchBarOffX;

@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation JLSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setup];
    [self setupUI];
}

#pragma -mark override

- (void)setup {
    for (NSUInteger i = 0; i<30; i++) {
        [self.arrClassName addObject:[NSString stringWithFormat:@"data %ld", i]];
    }
}

- (void)setupUI {
    self.title = @"联系人";
    if (@available(iOS 11.0, *)) {
        
    } else {
        // Fallback on earlier versions
        self.automaticallyAdjustsScrollViewInsets = YES;
    }
    self.definesPresentationContext = YES;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        self.consTableViewTop = make.top.offset(0);
    }];
    
    // 将searchBar赋值给tableView的tableHeaderView
    self.tableView.tableHeaderView = self.searchController.searchBar;
}

- (void)viewDidLayoutSubviews {
    if (self.searchController.isActive) {
        self.consTableViewTop.mas_equalTo(STATUSBAR_HEIGHT);
    } else {
        self.consTableViewTop.mas_equalTo(0);
    }
}

#pragma -mark private

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

#pragma mark - UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    [self.tableView reloadData];
}

#pragma mark - UISearchBarDelegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    if (![UIDevice adt_lessThenVersion:@"11"]) {
        [self.searchController.searchBar setPositionAdjustment:UIOffsetZero forSearchBarIcon:UISearchBarIconSearch];
    }
    return YES;
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    return YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    if (![UIDevice adt_lessThenVersion:@"11"]) {
        [self.searchController.searchBar setPositionAdjustment:UIOffsetMake(self.searchBarOffX, 0) forSearchBarIcon:UISearchBarIconSearch];
    }
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *text = searchBar.text;
    if (nil == text) {
        [BBSProgressHUD showToView:self.view text:@"请输入搜索词"];
        return;
    }
    [BBSProgressHUD showLoadingToView:self.view];
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.searchController.searchBar.text = nil;
}


#pragma -mark getter
- (UISearchController *)searchController {
    if (!_searchController) {
        // 创建UISearchController, 这里使用当前控制器来展示结果
        UISearchController *search = [[UISearchController alloc]initWithSearchResultsController:nil];
        // 设置结果更新代理
        search.searchResultsUpdater = self;
        // 因为在当前控制器展示结果, 所以不需要这个透明视图
        search.dimsBackgroundDuringPresentation = NO;
        // 是否自动隐藏导航
        _searchController = search;
        
        search.searchBar.delegate = self;
        
        search.searchBar.barTintColor = COLOR_WHITE; // 搜索框背景色
        [search.searchBar setBackgroundImage:[UIImage adt_imageWithColor:COLOR_WHITE]];
        
        //位置
        search.searchBar.frame = CGRectMake(0, 0, SCREEN_WIDTH, 54.0);
        search.searchBar.contentMode = UIViewContentModeCenter;
        // bottom line/cancel button/
        [search.searchBar adt_addBottomLineWithColor:nil];
        [search.searchBar adt_setCancelButtonTitle:@"取消"];
        [search.searchBar adt_setCancelColor:COLOR_BLACK fontSize:15];
        [search.searchBar setSearchTextPositionAdjustment:UIOffsetMake(10, 0)];
        [search.searchBar adt_setTextFieldCornerRadius:4];
        
        search.searchBar.placeholder = @"搜索联系人";
        UITextField *searchField = [search.searchBar adt_textField];
        searchField.frame = CGRectMake(15, 9, SCREEN_WIDTH - 30, 36);
        searchField.font = [UIFont systemFontOfSize:16];
        // To change background color
        searchField.backgroundColor = COLOR_GRAY_F2;
        searchField.leftView = ({
            UIImageView *v = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"add_topic_icon_search"]];
            v;
        });
        searchField.leftViewMode = UITextFieldViewModeAlways;
        // To change text color
        searchField.textColor = COLOR_BLACK;
        if (![UIDevice adt_lessThenVersion:@"11"]) {
            CGFloat textW = [search.searchBar.placeholder textWidthWithFont:searchField.font height:searchField.font.lineHeight];
            self.searchBarOffX = (searchField.frame.size.width - textW) * 0.5;
            [search.searchBar setPositionAdjustment:UIOffsetMake(self.searchBarOffX, 0) forSearchBarIcon:UISearchBarIconSearch];
        }
    }
    return _searchController;
}

@end









