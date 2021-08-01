//
//  NewsDetailViewController.m
//  sampleapp
//
//  Created by 高浩哲 on 2021/7/29.
//

#import "NewsDetailViewController.h"
#import <WebKit/WebKit.h>
@interface NewsDetailViewController ()<WKNavigationDelegate>
@property(nonatomic,strong,readwrite) WKWebView *webview;
@property(nonatomic,strong,readwrite) UIProgressView *ProgressView;
@property(nonatomic,copy,readwrite)NSString *articleUrl;
@end

@implementation NewsDetailViewController


- (instancetype)initWithUrlString:(NSString *)urlString{
    self = [super init];
    if (self) {
        self.articleUrl = urlString;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:({
        self.webview = [[WKWebView alloc]initWithFrame:CGRectMake(0, 88, kScreenWidth, kScreenHeight - 88)];
        self.webview;
    })];
    
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.articleUrl]]];
    self.webview.navigationDelegate = self;
    
    //kvo 监听加载进度
    [self.webview addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.view addSubview:({
        self.ProgressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 88, kScreenWidth, 20)];
        self.ProgressView;
    }
                           )];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    self.ProgressView.progress = self.webview.estimatedProgress;
    
    
}

//webview 代理拦截
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction preferences:(WKWebpagePreferences *)preferences decisionHandler:(void (^)(WKNavigationActionPolicy, WKWebpagePreferences * _Nonnull))decisionHandler{
    NSLog(@"是否拦截 %@",navigationAction.request.URL);
    decisionHandler(WKNavigationActionPolicyAllow,[WKWebpagePreferences new]);
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation{
    
    NSLog(@"加载完毕");
}

- (void)dealloc
{
    [self.webview removeObserver:self forKeyPath:@"estimatedProgress"];
}
@end
