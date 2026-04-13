#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Esp/ImGuiDrawView.h"
#import "IMGUI/imgui.h"
#import "IMGUI/imgui_impl_metal.h"
#include "font.h"
#import "Helper/Mem.h"
#import "Helper/Hooks.h"

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

static bool MenDeal = true;
static bool PC = true;

@interface ImGuiDrawView () <MTKViewDelegate>
@property (nonatomic, strong) id <MTLDevice> device;
@property (nonatomic, strong) id <MTLCommandQueue> commandQueue;
@property (nonatomic, strong) UIButton *ghostButtonView;
@property (nonatomic, strong) UISwitch *ghostSwitch;
@property (nonatomic, strong) UIButton *wallHackButtonView;
@property (nonatomic, strong) UISwitch *wallHackSwitch;
@property (nonatomic, strong) UIButton *teleKillButton;
@property (nonatomic, strong) UISwitch *teleKillSwitch;
@property (nonatomic, strong) UIButton *telefuckButton;
@property (nonatomic, strong) UISwitch *telefuckSwitch;
@property (nonatomic, strong) UIButton *satooButton;
@property (nonatomic, strong) UISwitch *satooSwitch;
@property (nonatomic, assign) CGRect menuBounds;
@property (nonatomic, assign) BOOL isProcessing;
@end

@implementation ImGuiDrawView

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _device = MTLCreateSystemDefaultDevice();
        _commandQueue = [_device newCommandQueue];
        
        IMGUI_CHECKVERSION();
        ImGui::CreateContext();
        ImGuiIO& io = ImGui::GetIO();
        ImGui_ImplMetal_Init(_device);
        
        ImGui::StyleColorsDark();
        ImGui::GetStyle().WindowRounding = 5.0f;
    }
    return self;
}

- (MTKView *)mtkView { return (MTKView *)self.view; }

- (void)loadView {
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    CGFloat h = [UIScreen mainScreen].bounds.size.height;
    self.view = [[MTKView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
    self.mtkView.device = self.device;
    self.mtkView.delegate = self;
    self.mtkView.clearColor = MTLClearColorMake(0, 0, 0, 0);
    self.mtkView.backgroundColor = [UIColor clearColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTelegogoButton];
    [self createTelefuckButton];
    [self createSatooButton];
}

- (CGRect)centeredButtonFrameForIndex:(NSInteger)index {
    CGFloat w = 58, h = 78, spacing = 15;
    CGFloat total = (4 * h) + (3 * spacing);
    CGFloat startY = (kHeight - total) / 2;
    CGFloat centerX = kWidth / 2 - w / 2;
    return CGRectMake(centerX, startY + (index * (h + spacing)), w, h);
}

- (void)createTelegogoButton {
    self.teleKillButton = [[UIButton alloc] initWithFrame:[self centeredButtonFrameForIndex:0]];
    self.teleKillButton.backgroundColor = [UIColor clearColor];
    [self.teleKillButton addTarget:self action:@selector(buttonDragged:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [[UIApplication sharedApplication].keyWindow addSubview:self.teleKillButton];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(7, 1, 72, 20)];
    label.text = @"TeleKill";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:8];
    [self.teleKillButton addSubview:label];
    
    self.teleKillSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(3.5, 20, 51, 31)];
    self.teleKillSwitch.onTintColor = [UIColor redColor];
    [self.teleKillSwitch addTarget:self action:@selector(teleKillSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    [self.teleKillButton addSubview:self.teleKillSwitch];
}

- (void)createTelefuckButton {
    self.telefuckButton = [[UIButton alloc] initWithFrame:[self centeredButtonFrameForIndex:2]];
    self.telefuckButton.backgroundColor = [UIColor clearColor];
    [self.telefuckButton addTarget:self action:@selector(buttonDragged:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [[UIApplication sharedApplication].keyWindow addSubview:self.telefuckButton];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(7, 1, 72, 20)];
    label.text = @"NinjaRun";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:8];
    [self.telefuckButton addSubview:label];
    
    self.telefuckSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(3.5, 20, 51, 31)];
    self.telefuckSwitch.onTintColor = [UIColor purpleColor];
    [self.telefuckSwitch addTarget:self action:@selector(telefuckSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    [self.telefuckButton addSubview:self.telefuckSwitch];
}

- (void)createSatooButton {
    self.satooButton = [[UIButton alloc] initWithFrame:[self centeredButtonFrameForIndex:3]];
    self.satooButton.backgroundColor = [UIColor clearColor];
    [self.satooButton addTarget:self action:@selector(buttonDragged:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [[UIApplication sharedApplication].keyWindow addSubview:self.satooButton];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(7, 1, 72, 20)];
    label.text = @"Speed";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:8];
    [self.satooButton addSubview:label];
    
    self.satooSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(3.5, 20, 51, 31)];
    self.satooSwitch.onTintColor = [UIColor greenColor];
    [self.satooSwitch addTarget:self action:@selector(satooSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    [self.satooButton addSubview:self.satooSwitch];
}

- (void)buttonDragged:(UIButton *)sender withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint point = [touch locationInView:sender.superview];
    sender.center = point;
}

- (void)teleKillSwitchChanged:(UISwitch *)sender { Vars.Telekill = sender.on; }
- (void)telefuckSwitchChanged:(UISwitch *)sender { Vars.Ninjarun = sender.on; }
- (void)satooSwitchChanged:(UISwitch *)sender { }

#pragma mark - MTKViewDelegate

- (void)drawInMTKView:(MTKView*)view {
    ImGuiIO& io = ImGui::GetIO();
    io.DisplaySize.x = view.bounds.size.width;
    io.DisplaySize.y = view.bounds.size.height;
    io.DeltaTime = 1 / 60.0f;
    
    id<MTLCommandBuffer> commandBuffer = [self.commandQueue commandBuffer];
    MTLRenderPassDescriptor* renderPass = view.currentRenderPassDescriptor;
    if (!renderPass) return;
    
    id<MTLRenderCommandEncoder> encoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPass];
    ImGui_ImplMetal_NewFrame(renderPass);
    ImGui::NewFrame();
    
    CGFloat x = (io.DisplaySize.x - 380) / 2;
    CGFloat y = (io.DisplaySize.y - 260) / 2;
    ImGui::SetNextWindowPos(ImVec2(x, y), ImGuiCond_FirstUseEver);
    ImGui::SetNextWindowSize(ImVec2(320, 270), ImGuiCond_FirstUseEver);
    
    if (MenDeal) {
        ImGui::Begin("NEXORA", &MenDeal);
        if (ImGui::BeginTabBar("Tabs")) {
            if (ImGui::BeginTabItem("Visuals")) {
                ImGui::Checkbox("ESP", &Vars.Enable);
                ImGui::Checkbox("Box", &Vars.Box);
                ImGui::Checkbox("Skeleton", &Vars.skeleton);
                ImGui::Checkbox("Line", &Vars.lines);
                ImGui::Checkbox("Name", &Vars.Name);
                ImGui::Checkbox("Health", &Vars.Health);
                ImGui::Checkbox("Distance", &Vars.Distance);
                ImGui::Checkbox("Ghost", &Vars.ShowGhostButton);
                ImGui::Checkbox("TeleKill", &Vars.ShowTeleKillButton);
                ImGui::Checkbox("NinjaRun", &Vars.ShowTeleVerticalButton);
                ImGui::Checkbox("Fly", &Vars.ShowWallHackButton);
                ImGui::EndTabItem();
            }
            if (ImGui::BeginTabItem("Extra")) {
                ImGui::Checkbox("Tele Enemy", &Vars.TeleEnmy);
                ImGui::Checkbox("Bypass PC", &PC);
                ImGui::EndTabItem();
            }
            ImGui::EndTabBar();
        }
        ImGui::End();
    }
    
    ImGui::Render();
    ImDrawData* drawData = ImGui::GetDrawData();
    ImGui_ImplMetal_RenderDrawData(drawData, commandBuffer, encoder);
    [encoder endEncoding];
    [commandBuffer presentDrawable:view.currentDrawable];
    [commandBuffer commit];
}

- (void)mtkView:(MTKView*)view drawableSizeWillChange:(CGSize)size {}

@end
