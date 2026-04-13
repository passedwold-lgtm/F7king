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
    bool Enable = false;
    bool Box = false;
    bool skeleton = false;
    bool lines = false;
    bool Name = false;
    bool Health = false;
    bool Distance = false;
    bool ShowGhostButton = false;
    bool ShowTeleKillButton = false;
    bool ShowTeleVerticalButton = false;
    bool ShowWallHackButton = false;
    bool TeleEnmy = false;
    bool Telekill = false;
    bool Ninjarun = false;
} Vars;

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

+ (void)showChange:(BOOL)open {
    MenDeal = open;
}

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _device = MTLCreateSystemDefaultDevice();
        _commandQueue = [_device newCommandQueue];
        
        IMGUI_CHECKVERSION();
        ImGui::CreateContext();
        ImGuiIO& io = ImGui::GetIO();
        
        // Load custom font (optional)
        // io.Fonts->AddFontDefault();
        
        ImGui::StyleColorsDark();
        ImGui_ImplMetal_Init(_device);
        
        // === CUSTOM THEME (ไม่เกรียน) ===
        ImGuiStyle& style = ImGui::GetStyle();
        style.WindowRounding = 12.0f;
        style.FrameRounding = 6.0f;
        style.GrabRounding = 6.0f;
        style.Colors[ImGuiCol_WindowBg] = ImVec4(0.08f, 0.08f, 0.12f, 0.92f);
        style.Colors[ImGuiCol_Button] = ImVec4(0.25f, 0.45f, 0.85f, 0.7f);
        style.Colors[ImGuiCol_ButtonHovered] = ImVec4(0.35f, 0.55f, 0.95f, 0.9f);
        style.Colors[ImGuiCol_CheckMark] = ImVec4(0.3f, 0.8f, 0.3f, 1.0f);
        style.Colors[ImGuiCol_Header] = ImVec4(0.25f, 0.45f, 0.85f, 0.5f);
        style.Colors[ImGuiCol_TabActive] = ImVec4(0.25f, 0.45f, 0.85f, 0.8f);
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
    [self createButtons];
}

- (void)createButtons {
    CGFloat w = 68, h = 88, spacing = 18;  // ขนาดใหญ่ขึ้น
    CGFloat total = (3 * h) + (2 * spacing);
    CGFloat startY = (kHeight - total) / 2;
    CGFloat centerX = kWidth / 2 - w / 2;
    
    NSArray *titles = @[@"🔫 TeleKill", @"👟 NinjaRun", @"⚡ Speed"];
    for (int i = 0; i < 3; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(centerX, startY + (i * (h + spacing)), w, h)];
        btn.backgroundColor = [UIColor colorWithWhite:0.15 alpha:0.85];
        btn.layer.cornerRadius = 16;
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = [UIColor colorWithRed:0.3 green:0.6 blue:1.0 alpha:0.5].CGColor;
        [btn addTarget:self action:@selector(buttonDragged:withEvent:) forControlEvents:UIControlEventTouchDragInside];
        [[UIApplication sharedApplication].keyWindow addSubview:btn];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(4, 8, 60, 20)];
        label.text = titles[i];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont boldSystemFontOfSize:10];
        label.textAlignment = NSTextAlignmentCenter;
        [btn addSubview:label];
        
        UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(8, 40, 51, 31)];
        sw.onTintColor = i == 0 ? [UIColor redColor] : (i == 1 ? [UIColor purpleColor] : [UIColor greenColor]);
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
    
    id<MTLCommandBuffer> commandBuffer = [self.commandQueue commandBuffer];
    MTLRenderPassDescriptor* renderPass = view.currentRenderPassDescriptor;
    if (!renderPass) return;
    
    id<MTLRenderCommandEncoder> encoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPass];
    ImGui_ImplMetal_NewFrame(renderPass);
    ImGui::NewFrame();
    
    // === UI ขนาดใหญ่ (480x360) ===
    CGFloat x = (io.DisplaySize.x - 480) / 2;
    CGFloat y = (io.DisplaySize.y - 360) / 2;
    ImGui::SetNextWindowPos(ImVec2(x, y), ImGuiCond_FirstUseEver);
    ImGui::SetNextWindowSize(ImVec2(480, 360), ImGuiCond_FirstUseEver);
    
    if (MenDeal) {
        ImGui::Begin("🐍 REVERSED SNAKE  |  by DEEPSEEK", &MenDeal);
        
        // แสดงโลโก้งู + ชื่อเพื่อนแบบเท่ๆ
        ImGui::TextColored(ImVec4(0.3f, 0.8f, 1.0f, 1.0f), "════════════════════════════════════════");
        ImGui::SetCursorPosX(180);
        ImGui::Text("🐍 DEEPSEEK X KING 🐍");
        ImGui::SetCursorPosX(160);
        ImGui::TextColored(ImVec4(0.7f, 0.7f, 0.9f, 1.0f), "iOS Tweak by SATOO");
        ImGui::TextColored(ImVec4(0.3f, 0.8f, 1.0f, 1.0f), "════════════════════════════════════════");
        ImGui::Spacing();
        
        if (ImGui::BeginTabBar("Tabs")) {
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
