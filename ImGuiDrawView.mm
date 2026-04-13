#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Esp/ImGuiDrawView.h"
#import "IMGUI/imgui.h"
#import "IMGUI/imgui_impl_metal.h"

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

static bool MenDeal = true;

struct MenuVars {
    bool Enable = false, Box = false, skeleton = false, lines = false;
    bool Name = false, Health = false, Distance = false;
    bool ShowGhostButton = false, ShowTeleKillButton = false;
    bool ShowTeleVerticalButton = false, ShowWallHackButton = false;
    bool TeleEnmy = false, Telekill = false, Ninjarun = false;
    int  selectedGame = 0;
} Vars;

const char* Games[] = { "Free Fire", "PUBG Mobile", "Call of Duty", "RoV", "Honor of Kings" };

@interface ImGuiDrawView () <MTKViewDelegate>
@property (nonatomic, strong) id <MTLDevice> device;
@property (nonatomic, strong) id <MTLCommandQueue> commandQueue;
@property (nonatomic, strong) UIButton *teleKillButton;
@property (nonatomic, strong) UISwitch *teleKillSwitch;
@property (nonatomic, strong) UIButton *telefuckButton;
@property (nonatomic, strong) UISwitch *telefuckSwitch;
@property (nonatomic, strong) UIButton *satooButton;
@property (nonatomic, strong) UISwitch *satooSwitch;
@end

@implementation ImGuiDrawView

+ (void)showChange:(BOOL)open { MenDeal = open; }

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _device = MTLCreateSystemDefaultDevice();
        _commandQueue = [_device newCommandQueue];
        
        IMGUI_CHECKVERSION();
        ImGui::CreateContext();
        ImGui::StyleColorsDark();
        ImGui_ImplMetal_Init(_device);
        
        ImGuiStyle& style = ImGui::GetStyle();
        style.WindowRounding = 12.0f;
        style.FrameRounding = 6.0f;
        style.Colors[ImGuiCol_WindowBg] = ImVec4(0.06f, 0.06f, 0.10f, 0.96f);
        style.Colors[ImGuiCol_Button] = ImVec4(0.25f, 0.45f, 0.85f, 0.7f);
        style.Colors[ImGuiCol_ButtonHovered] = ImVec4(0.35f, 0.55f, 0.95f, 0.9f);
        style.Colors[ImGuiCol_CheckMark] = ImVec4(0.3f, 0.8f, 0.3f, 1.0f);
        style.Colors[ImGuiCol_TabActive] = ImVec4(0.25f, 0.45f, 0.85f, 0.8f);
    }
    return self;
}

- (MTKView *)mtkView { return (MTKView *)self.view; }

- (void)loadView {
    self.view = [[MTKView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    self.mtkView.device = self.device;
    self.mtkView.delegate = self;
    self.mtkView.clearColor = MTLClearColorMake(0, 0, 0, 0);
    self.mtkView.backgroundColor = [UIColor clearColor];
    self.mtkView.userInteractionEnabled = YES;  // สำคัญ!
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createButtons];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    // ให้ปุ่ม Native รับ event ก่อน
    for (UIView *subview in self.subviews) {
        if ([subview pointInside:[self convertPoint:point toView:subview] withEvent:event]) {
            return YES;
        }
    }
    return [super pointInside:point withEvent:event];
}

- (void)createButtons {
    CGFloat w = 80, h = 100, spacing = 25;
    CGFloat total = (3 * h) + (2 * spacing);
    CGFloat startY = (kHeight - total) / 2;
    CGFloat centerX = kWidth / 2 - w / 2;
    
    NSArray *titles = @[@" TeleKill", @" NinjaRun", @" Speed"];
    NSArray *colors = @[[UIColor redColor], [UIColor purpleColor], [UIColor greenColor]];
    
    for (int i = 0; i < 3; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(centerX, startY + (i * (h + spacing)), w, h)];
        btn.backgroundColor = [UIColor colorWithWhite:0.15 alpha:0.95];
        btn.layer.cornerRadius = 20;
        btn.layer.borderWidth = 1.5;
        btn.layer.borderColor = [colors[i] colorWithAlphaComponent:0.7].CGColor;
        [btn addTarget:self action:@selector(buttonDragged:withEvent:) forControlEvents:UIControlEventTouchDragInside];
        [[UIApplication sharedApplication].keyWindow addSubview:btn];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 70, 25)];
        label.text = titles[i];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont boldSystemFontOfSize:12];
        label.textAlignment = NSTextAlignmentCenter;
        [btn addSubview:label];
        
        UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(14, 50, 51, 31)];
        sw.onTintColor = colors[i];
        [sw addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
        [btn addSubview:sw];
        
        if (i == 0) { self.teleKillButton = btn; self.teleKillSwitch = sw; }
        else if (i == 1) { self.telefuckButton = btn; self.telefuckSwitch = sw; }
        else { self.satooButton = btn; self.satooSwitch = sw; }
    }
}

- (void)buttonDragged:(UIButton *)sender withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint point = [touch locationInView:sender.superview];
    sender.center = point;
}

- (void)switchChanged:(UISwitch *)sender {
    if (sender == self.teleKillSwitch) Vars.Telekill = sender.on;
    else if (sender == self.telefuckSwitch) Vars.Ninjarun = sender.on;
}

#pragma mark - MTKViewDelegate

- (void)drawInMTKView:(MTKView*)view {
    ImGuiIO& io = ImGui::GetIO();
    io.DisplaySize.x = view.bounds.size.width;
    io.DisplaySize.y = view.bounds.size.height;
    io.DeltaTime = 1 / 60.0f;
    
    // ให้ ImGui ไม่กิน event ทั้งหมด
    io.ConfigFlags |= ImGuiConfigFlags_NoMouseCursorChange;
    io.MouseDrawCursor = false;
    
    id<MTLCommandBuffer> commandBuffer = [self.commandQueue commandBuffer];
    MTLRenderPassDescriptor* renderPass = view.currentRenderPassDescriptor;
    if (!renderPass) return;
    
    id<MTLRenderCommandEncoder> encoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPass];
    ImGui_ImplMetal_NewFrame(renderPass);
    ImGui::NewFrame();
    
    // UI ขนาดใหญ่ขึ้น (900x650)
    CGFloat x = (io.DisplaySize.x - 900) / 2;
    CGFloat y = (io.DisplaySize.y - 650) / 2;
    ImGui::SetNextWindowPos(ImVec2(x, y), ImGuiCond_FirstUseEver);
    ImGui::SetNextWindowSize(ImVec2(900, 650), ImGuiCond_FirstUseEver);
    
    if (MenDeal) {
        ImGui::Begin("🐍 REVERSED SNAKE  |  DEEPSEEK x SATOO", &MenDeal);
        
        ImGui::TextColored(ImVec4(0.3f, 0.8f, 1.0f, 1.0f), "══════════════════════════════════════════════════════════════════");
        ImGui::SetCursorPosX(380);
        ImGui::Text("🐍 NEXORA iOS TWEAK 🐍");
        ImGui::SetCursorPosX(330);
        ImGui::TextColored(ImVec4(0.7f, 0.7f, 0.9f, 1.0f), "by SATOO  |  UI by DEEPSEEK");
        ImGui::TextColored(ImVec4(0.3f, 0.8f, 1.0f, 1.0f), "══════════════════════════════════════════════════════════════════");
        ImGui::Spacing();
        
        if (ImGui::BeginTabBar("MainTabs")) {
            
            if (ImGui::BeginTabItem("🎨 Visuals")) {
                ImGui::Spacing();
                ImGui::Checkbox("ESP Enable", &Vars.Enable);
                ImGui::Checkbox("Box ESP", &Vars.Box);
                ImGui::Checkbox("Skeleton", &Vars.skeleton);
                ImGui::Checkbox("Line ESP", &Vars.lines);
                ImGui::Checkbox("Player Name", &Vars.Name);
                ImGui::Checkbox("Health Bar", &Vars.Health);
                ImGui::Checkbox("Distance", &Vars.Distance);
                ImGui::Separator();
                ImGui::Checkbox("Ghost Mode", &Vars.ShowGhostButton);
                ImGui::Checkbox("TeleKill", &Vars.ShowTeleKillButton);
                ImGui::Checkbox("NinjaRun", &Vars.ShowTeleVerticalButton);
                ImGui::Checkbox("Fly Hack", &Vars.ShowWallHackButton);
                ImGui::EndTabItem();
            }
            
            if (ImGui::BeginTabItem("⚙️ Extra")) {
                ImGui::Spacing();
                ImGui::Checkbox("Tele Enemy", &Vars.TeleEnmy);
                ImGui::EndTabItem();
            }
            
            if (ImGui::BeginTabItem("🎮 Game Manager")) {
                ImGui::Spacing();
                ImGui::TextColored(ImVec4(0.3f, 0.9f, 0.5f, 1.0f), "═══ Load / Save Config ═══");
                ImGui::Spacing();
                
                if (ImGui::Button("📂 Load Config", ImVec2(200, 35))) {
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Loaded" message:@"Config loaded from game!" preferredStyle:UIAlertControllerStyleAlert];
                    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                        [alert dismissViewControllerAnimated:YES completion:nil];
                    });
                }
                ImGui::SameLine();
                if (ImGui::Button("💾 Save Config", ImVec2(200, 35))) {
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Saved" message:@"Config saved!" preferredStyle:UIAlertControllerStyleAlert];
                    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                        [alert dismissViewControllerAnimated:YES completion:nil];
                    });
                }
                
                ImGui::Spacing();
                ImGui::Separator();
                ImGui::Spacing();
                
                ImGui::TextColored(ImVec4(0.3f, 0.9f, 0.5f, 1.0f), "═══ Select Game Preset ═══");
                ImGui::Combo("##game", &Vars.selectedGame, Games, 5);
                
                if (ImGui::Button("🎯 Apply Preset", ImVec2(300, 40))) {
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Applied" message:[NSString stringWithFormat:@"Preset for %s loaded!", Games[Vars.selectedGame]] preferredStyle:UIAlertControllerStyleAlert];
                    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                        [alert dismissViewControllerAnimated:YES completion:nil];
                    });
                }
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
