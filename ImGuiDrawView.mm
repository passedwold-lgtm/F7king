#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
#import <Foundation/Foundation.h>
#include <iostream>
#include <UIKit/UIKit.h>
#include <vector>
#import "pthread.h"
#include <array>
#import <os/log.h>
#include <cmath>
#include <deque>
#include <fstream>
#include <algorithm>
#include "Hook/hook.h"

#include <string>
#include <sstream>
#include <cstring>
#include <cstdlib>
#include <cstdio>
#include <cstdint>
#include <cinttypes>
#include <cerrno>
#include <cctype>
#import <objc/runtime.h>
#import <objc/message.h>

#import "Esp/CaptainHook.h"
#import "Esp/ImGuiDrawView.h"
#import "IMGUI/imgui.h"
#import "IMGUI/imgui_internal.h"
#import "IMGUI/imgui_impl_metal.h"
#import "IMGUI/zzz.h"
#include "oxorany/oxorany_include.h"
#import "Helper/Mem.h"
#include "font.h"
#import "Helper/Vector3.h"
#import "Helper/Vector2.h"
#import "Helper/Quaternion.h"
#import "Helper/Monostring.h"
#include "Helper/font.h"
#include "Helper/data.h"
ImFont* verdana_smol;
ImFont* pixel_big = {};
ImFont* pixel_smol = {};
#include "Helper/Obfuscate.h"
#import "Helper/Hooks.h"
#include <OpenGLES/ES2/gl.h>
#include <OpenGLES/ES2/glext.h>
#include <unistd.h>
#include <string.h>
#import "SatooScan/MemScan.h"


extern ImFont* verdana_smol;
extern ImFont* pixel_big;
extern ImFont* pixel_smol;


extern bool force;
extern bool ignoreKnocked;

#define patch_NULL(a, b) vm(ENCRYPTOFFSET(a), strtoul(ENCRYPTHEX(b), nullptr, 0))
#define patch(a, b) vm_unity(ENCRYPTOFFSET(a), strtoul(ENCRYPTHEX(b), nullptr, 0))

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kScale [UIScreen mainScreen].scale


bool rsttk = true;
bool Guest(void* _this){
    return rsttk ? true : false;
}

bool chino = true;
bool Login(void* _this){
    return chino ? true : false;
}

bool antiban(void *instance) {
    if(instance != nullptr) {
        return false;
    } else {
        return false;
    }
}

bool NAPDANNHANH = false;
float napdannhanh(void *instance) {
    if (NAPDANNHANH) return 1.0f;
    return 1.0f;
}


static void DrawAnimatedNeonBackground(ImDrawList* dl, ImVec2 origin, ImVec2 size, float time) {
    if (!dl) return;
    
    const float spacing = 42.0f;
    float phase = sinf(time * 0.6f) * 12.0f;

    ImU32 cTL = ImColor(0.0f, 0.0f, 0.0f, 0.0f);
    ImU32 cTR = ImColor(0.0f, 0.0f, 0.0f, 0.0f);
    ImU32 cBR = ImColor(0.0f, 0.0f, 0.0f, 0.0f);
    ImU32 cBL = ImColor(0.0f, 0.0f, 0.0f, 0.0f);
    dl->AddRectFilledMultiColor(origin, ImVec2(origin.x + size.x, origin.y + size.y), cTL, cTR, cBR, cBL);


    ImVec4 pulse = ImVec4(0.0f, 0.0f, 0.0f, 0.0f); 
    ImU32 dotCol = ImColor(pulse);
    
    for (float x = origin.x - 0.0f; x < origin.x + size.x + 0.0f; x += spacing) {
        float yy = origin.y + fmodf(x + phase, spacing);
        dl->AddLine(ImVec2(x, origin.y), ImVec2(x - size.y, origin.y + size.y), dotCol, 0.0f);
        dl->AddCircleFilled(ImVec2(x + fmodf(phase, spacing), yy), 0.0f, dotCol);
    }
}


@interface ImGuiDrawView () <MTKViewDelegate>
{
    
}
@property (nonatomic, strong) id <MTLDevice> device;
@property (nonatomic, strong) id <MTLCommandQueue> commandQueue;
@property (nonatomic, assign) BOOL isProcessing;
@property (nonatomic, assign) CGRect menuBounds; 

@property (nonatomic, strong) UIButton *teleKillButton;
@property (nonatomic, strong) UILabel *teleKillLabel;
@property (nonatomic, strong) UISwitch *teleKillSwitch;

@property (nonatomic, strong) UIButton *telefuckButton;  
@property (nonatomic, strong) UILabel *telefuckLabel;
@property (nonatomic, strong) UISwitch *telefuckSwitch;

@property (nonatomic, strong) UIButton *wallHackButton;
@property (nonatomic, strong) UILabel *wallHackLabel;

@property (nonatomic, strong) UIButton *satooButton;
@property (nonatomic, strong) UILabel *satooLabel;
@property (nonatomic, strong) UISwitch *satooSwitch;

@property (nonatomic, strong) UIButton *ghostButtonView;
@property (nonatomic, strong) UISwitch *ghostSwitch;
@property (nonatomic, assign) BOOL hasGhostBeenDrawn;
@property (nonatomic, assign) BOOL ShowGhostUI;
@property (nonatomic, assign) BOOL func_ghost;
@property (nonatomic, assign) void* ghostTarget;

@property (nonatomic, strong) UIButton *wallHackButtonView;
@property (nonatomic, strong) UISwitch *wallHackSwitch;

@end

@implementation ImGuiDrawView


int FUNC_GHOST(void *instance) {
    return 31278;
}

static BOOL ghostState = NO;

bool Norecoill = true;
int norecoil(void *instance) {
     if (Norecoill) {
         return 99;
     }else{
    return 1;
}
}

float camxa = 60; 
int CamXa(void *instance) {
    if (camxa > 0.0) {
        return 100.0; 
    } else {
        return 60.0;
    }
}

float Speed = 1.0; 
int SPeed(void *instance) {
    if (Speed > 2.0) {
        return 30.0; 
    } else {
        return 2.0;
    }
}

bool Satoo(void *instance) {
    if(instance != nullptr) {
        return false;
    } else {
        return false;
    }
}

static bool PC = true;

ImFont *_espFont;
ImFont* verdanab;
ImFont* icons;
ImFont* interb;
ImFont* Urbanist;
static bool MenDeal = true;
static float networkColor[3] = {1.0f, 1.0f, 1.0f};

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _device = MTLCreateSystemDefaultDevice();
        _commandQueue = [_device newCommandQueue];
        _func_ghost = NO;
        _hasGhostBeenDrawn = NO;
        _ShowGhostUI = NO;

        if (!self.device) abort();

        IMGUI_CHECKVERSION();
        ImGui::CreateContext();
        ImGuiIO& io = ImGui::GetIO(); (void)io;

        
        ImGui::StyleColorsClassic();
        ImGuiStyle& style = ImGui::GetStyle();

        
        style.GrabRounding = 8.0f;
        style.GrabMinSize = 12.0f;
        style.FramePadding = ImVec2(4.0f, 4.0f);
        auto& Style = ImGui::GetStyle();
        Style.WindowPadding = ImVec2(6.0f, 6.0f);
        Style.FramePadding = ImVec2(6.0f, 4.0f);
        Style.ScrollbarRounding = 6.0f;


        ImVec4* colors = ImGui::GetStyle().Colors;
        colors[ImGuiCol_Text] = ImVec4(1.0f, 1.0f, 1.0f, 1.0f);

        colors[ImGuiCol_WindowBg] = ImVec4(0.08f, 0.08f, 0.08f, 1.00f);
        colors[ImGuiCol_PopupBg] = ImVec4(0.12f, 0.12f, 0.12f, 1.00f);

        colors[ImGuiCol_FrameBg] = ImVec4(0.15f, 0.15f, 0.15f, 1.0f);
        colors[ImGuiCol_FrameBgHovered] = ImVec4(0.20f, 0.20f, 0.20f, 0.9f);
        colors[ImGuiCol_FrameBgActive] = ImVec4(0.18f, 0.18f, 0.18f, 1.0f);

        colors[ImGuiCol_TitleBg] = ImVec4(0.10f, 0.10f, 0.10f, 1.00f);
        colors[ImGuiCol_TitleBgActive] = ImVec4(0.15f, 0.15f, 0.15f, 1.00f);
        colors[ImGuiCol_CheckMark] = ImVec4(1.0f, 1.0f, 1.0f, 1.0f);


        colors[ImGuiCol_ScrollbarBg] = ImVec4(0, 0, 0, 0);
        colors[ImGuiCol_ScrollbarGrab] = ImVec4(0.3f, 0.3f, 0.3f, 1.0f);
        colors[ImGuiCol_ScrollbarGrabHovered] = ImVec4(0.4f, 0.4f, 0.4f, 1.0f);
        colors[ImGuiCol_ScrollbarGrabActive] = ImVec4(0.5f, 0.5f, 0.5f, 1.0f);


        colors[ImGuiCol_SliderGrab] = ImVec4(0.5f, 0.5f, 0.5f, 1.0f);
        colors[ImGuiCol_SliderGrabActive] = ImVec4(0.6f, 0.6f, 0.6f, 1.0f);


        colors[ImGuiCol_Button] = ImVec4(0.2f, 0.2f, 0.2f, 0.4f);
        colors[ImGuiCol_ButtonHovered] = ImVec4(0.3f, 0.3f, 0.3f, 1.0f);
        colors[ImGuiCol_ButtonActive] = ImVec4(0.25f, 0.25f, 0.25f, 1.0f);


        colors[ImGuiCol_Header] = ImVec4(0.25f, 0.25f, 0.25f, 0.31f);
        colors[ImGuiCol_HeaderHovered] = ImVec4(0.3f, 0.3f, 0.3f, 0.8f);
        colors[ImGuiCol_HeaderActive] = ImVec4(0.35f, 0.35f, 0.35f, 1.0f);


        colors[ImGuiCol_Separator] = ImVec4(0.3f, 0.3f, 0.3f, 0.5f);
        colors[ImGuiCol_SeparatorHovered] = ImVec4(0.35f, 0.35f, 0.35f, 0.78f);
        colors[ImGuiCol_SeparatorActive] = ImVec4(0.4f, 0.4f, 0.4f, 1.0f);


        colors[ImGuiCol_ResizeGrip] = ImVec4(0.3f, 0.3f, 0.3f, 1.0f);
        colors[ImGuiCol_ResizeGripHovered] = ImVec4(0.4f, 0.4f, 0.4f, 1.0f);
        colors[ImGuiCol_ResizeGripActive] = ImVec4(0.5f, 0.5f, 0.5f, 1.0f);


        colors[ImGuiCol_Tab] = ImVec4(0.15f, 0.15f, 0.15f, 0.86f);
        colors[ImGuiCol_TabHovered] = ImVec4(0.25f, 0.25f, 0.25f, 0.8f);
        colors[ImGuiCol_TabActive] = ImVec4(0.3f, 0.3f, 0.3f, 1.0f);
        colors[ImGuiCol_TabUnfocused] = ImVec4(0.1f, 0.1f, 0.1f, 0.97f);
        colors[ImGuiCol_TabUnfocusedActive] = ImVec4(0.15f, 0.15f, 0.15f, 1.0f);


        colors[ImGuiCol_TextSelectedBg] = ImVec4(0.3f, 0.3f, 0.3f, 0.35f);
        colors[ImGuiCol_NavHighlight] = ImVec4(0.25f, 0.25f, 0.25f, 1.0f);
        style.Colors[ImGuiCol_WindowBg] = ImVec4(0.08f, 0.08f, 0.08f, 0.9f);
        style.Colors[ImGuiCol_Border] = ImVec4(0.15f, 0.15f, 0.15f, 0.3f);
        ImGui::GetStyle().Colors[ImGuiCol_ChildBg] = ImVec4(0.08f, 0.08f, 0.08f, 1.0f);


        ImGui::GetStyle().WindowRounding = 5.0f;
        ImGui::GetStyle().FrameRounding = 3.0f;
        ImGui::GetStyle().ChildRounding = 4.0f;

        ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(2, 2));
        ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 2.0f);
        ImGui::PushStyleVar(ImGuiStyleVar_ItemSpacing, ImVec2(4.0f, 4.0f));

        
        ImFont* font = io.Fonts->AddFontFromMemoryTTF(sansbold, sizeof(sansbold), 15.0f, NULL, io.Fonts->GetGlyphRangesCyrillic());
        verdana_smol = io.Fonts->AddFontFromMemoryTTF(verdana, sizeof verdana, 18.0f, NULL, io.Fonts->GetGlyphRangesCyrillic()); 
        pixel_big = io.Fonts->AddFontFromMemoryTTF((void*)smallestpixel, sizeof smallestpixel, 42.0f, NULL, io.Fonts->GetGlyphRangesCyrillic()); 
        pixel_smol = io.Fonts->AddFontFromMemoryTTF((void*)smallestpixel, sizeof smallestpixel, 14.0f, NULL, io.Fonts->GetGlyphRangesCyrillic()); 
        
        ImGui_ImplMetal_Init(_device);
    }
    return self;
}

+ (void)showChange:(BOOL)open
{
    MenDeal = open;
}

- (MTKView *)mtkView
{
    return (MTKView *)self.view;
}

- (void)loadView
{
    CGFloat w = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.width;
    CGFloat h = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.height;
    self.view = [[MTKView alloc] initWithFrame:CGRectMake(0, 0, w, h)];

    
    void* address[] = {
        (void*)getRealOffset(0x100FD150C),
        (void*)getRealOffset(ENCRYPTOFFSET("0x102D86DE4")),
        (void*)getRealOffset(ENCRYPTOFFSET("")),
        (void*)getRealOffset(ENCRYPTOFFSET("")),
        (void*)getRealOffset(ENCRYPTOFFSET("")),
        (void*)getRealOffset(ENCRYPTOFFSET("")),
        (void*)getRealOffset(ENCRYPTOFFSET("l"))
    };
    void* function[] = {
        (void*)Guest,
        (void*)Login,
        (void*)antiban,
        (void*)antiban,
        (void*)antiban
    };
    satoo(address, function, 5);
}


- (void)handleMenuClose:(CGPoint)touchPoint {
    if (MenDeal && !CGRectContainsPoint(self.menuBounds, touchPoint)) {
        MenDeal = false;
    }
}


- (void)ghostModeUI {
    if (self.ghostButtonView) return;

    self.ghostButtonView = [[UIButton alloc] initWithFrame:CGRectMake(305, 330, 58, 54)];
    self.ghostButtonView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    self.ghostButtonView.layer.cornerRadius = 13;
    self.ghostButtonView.clipsToBounds = YES;
    self.ghostButtonView.layer.shadowOpacity = 0;
    self.ghostButtonView.layer.shadowColor = [UIColor clearColor].CGColor;
    self.ghostButtonView.layer.shadowRadius = 0;
    self.ghostButtonView.alpha = 1.0f;

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 1, 58, 20)];
    label.text = @"Ghost";
    label.font = [UIFont fontWithName:@"CourierNewPS-BoldMT" size:11];
    label.textColor = [UIColor blackColor];
    label.backgroundColor = [UIColor clearColor];
    [self.ghostButtonView addSubview:label];

    self.ghostSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(3.5, 20, 51, 31)];
    self.ghostSwitch.onTintColor = [UIColor purpleColor];
    self.ghostSwitch.thumbTintColor = [UIColor whiteColor];
    self.ghostSwitch.backgroundColor = [UIColor clearColor];
    [self.ghostSwitch addTarget:self action:@selector(ghostSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    [self.ghostButtonView addSubview:self.ghostSwitch];

    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGhostDrag:)];
    [self.ghostButtonView addGestureRecognizer:panGesture];

    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    [mainWindow addSubview:self.ghostButtonView];
}

- (void)ghostSwitchChanged:(UISwitch *)sender {
    Vars.EnableGhost = sender.on;

    static bool ghostState = false;

    void* ghostMain = (void*)getRealOffset(ENCRYPTOFFSET("0x104670ED8"));    

    if (sender.on && !ghostState) {
        satoo((void*[]){ ghostMain },
             (void*[]){ (void*)FUNC_GHOST},
             1);
        self.func_ghost = true;
        ghostState = true;
    } else if (!sender.on && ghostState) {
        Unsatoo(ghostMain);
        
        self.func_ghost = false;
        ghostState = false;
    }
}

- (void)handleGhostDrag:(UIPanGestureRecognizer *)gesture {
    UIView *draggedView = gesture.view;
    CGPoint translation = [gesture translationInView:draggedView.superview];
    CGPoint newCenter = CGPointMake(draggedView.center.x + translation.x, draggedView.center.y + translation.y);
    draggedView.center = newCenter;
    [gesture setTranslation:CGPointZero inView:draggedView.superview];
}

- (void)wallHackModeUI {
    if (self.wallHackButtonView) return;

    self.wallHackButtonView = [[UIButton alloc] initWithFrame:CGRectMake(305, 330, 58, 54)];
    self.wallHackButtonView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    self.wallHackButtonView.layer.cornerRadius = 13;
    self.wallHackButtonView.clipsToBounds = YES;
    self.wallHackButtonView.layer.shadowOpacity = 0;
    self.wallHackButtonView.layer.shadowColor = [UIColor clearColor].CGColor;
    self.wallHackButtonView.layer.shadowRadius = 0;
    self.wallHackButtonView.alpha = 1.0f;

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 1, 58, 20)];
    label.text = @"Fly Hack";
    label.font = [UIFont fontWithName:@"CourierNewPS-BoldMT" size:11];
    label.textColor = [UIColor blackColor];
    label.backgroundColor = [UIColor clearColor];
    [self.wallHackButtonView addSubview:label];

    self.wallHackSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(3.5, 20, 51, 31)];
    self.wallHackSwitch.onTintColor = [UIColor blueColor];
    self.wallHackSwitch.thumbTintColor = [UIColor whiteColor];
    self.wallHackSwitch.backgroundColor = [UIColor clearColor];
    [self.wallHackSwitch addTarget:self action:@selector(wallHackSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    [self.wallHackButtonView addSubview:self.wallHackSwitch];

    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleWallHackDrag:)];
    [self.wallHackButtonView addGestureRecognizer:panGesture];

    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    [mainWindow addSubview:self.wallHackButtonView];
}

- (void)handleWallHackDrag:(UIPanGestureRecognizer *)gesture {
    UIView *draggedView = gesture.view;
    CGPoint translation = [gesture translationInView:draggedView.superview];
    CGPoint newCenter = CGPointMake(draggedView.center.x + translation.x, draggedView.center.y + translation.y);
    draggedView.center = newCenter;
    [gesture setTranslation:CGPointZero inView:draggedView.superview];
}

- (void)teleKillModeUI {
    if (Vars.ShowTeleKillButton) {
        [UIView animateWithDuration:0.3 animations:^{
            self.teleKillButton.alpha = 1.0f;
        }];
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            self.teleKillButton.alpha = 0.0f;
        }];
    }
}

- (void)teleVerticalModeUI {
    if (Vars.ShowTeleVerticalButton) {
        [UIView animateWithDuration:0.3 animations:^{
            self.telefuckButton.alpha = 1.0f;
        }];
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            self.telefuckButton.alpha = 0.0f;
        }];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mtkView.device = self.device;
    self.mtkView.delegate = self;
    self.mtkView.clearColor = MTLClearColorMake(0, 0, 0, 0);
    self.mtkView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    self.mtkView.clipsToBounds = YES;
    
    [self createTelegogoButton];
    [self createTelefuckButton];
    [self createSatooButton];

    self.teleKillButton.alpha = 0.0f;
    self.telefuckButton.alpha = 0.0f;
}

- (CGRect)centeredButtonFrameForIndex:(NSInteger)index {
    CGFloat buttonWidth = 58;
    CGFloat buttonHeight = 78;
    CGFloat spacing = 15;
    CGFloat totalHeight = (4 * buttonHeight) + (3 * spacing);
    
    CGFloat startY = (kHeight - totalHeight) / 2;
    CGFloat centerX = kWidth / 2 - buttonWidth / 2;
    CGFloat buttonY = startY + (index * (buttonHeight + spacing));
    
    return CGRectMake(centerX, buttonY, buttonWidth, buttonHeight);
}

- (void)createTelegogoButton {
    UIWindow *mainWindow = [UIApplication sharedApplication].windows.firstObject;
    
    self.teleKillButton = [[UIButton alloc] initWithFrame:[self centeredButtonFrameForIndex:0]];
    self.teleKillButton.transform = CGAffineTransformMakeScale(1.0, 1.0);
    self.teleKillButton.alpha = 1.0f;
    self.teleKillButton.layer.borderWidth = 0.0f;
    self.teleKillButton.layer.cornerRadius = 0.0f;
    self.teleKillButton.backgroundColor = [UIColor clearColor];
    
    [self.teleKillButton addTarget:self action:@selector(buttonDragged:withEvent:) 
              forControlEvents:UIControlEventTouchDragInside];
    
    [mainWindow addSubview:self.teleKillButton];

    self.teleKillLabel = [[UILabel alloc] initWithFrame:CGRectMake(7, 1, 72, 20.8)];
    self.teleKillLabel.textColor = [UIColor whiteColor];
    self.teleKillLabel.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:8];
    self.teleKillLabel.numberOfLines = 1;
    self.teleKillLabel.text = @"TeleKill";
    self.teleKillLabel.backgroundColor = [UIColor clearColor];
    [self.teleKillButton addSubview:self.teleKillLabel];

    self.teleKillSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(3.5, 20, 51, 31)];
    self.teleKillSwitch.layer.borderWidth = 2.5;
    self.teleKillSwitch.layer.cornerRadius = 5.0;
    self.teleKillSwitch.transform = CGAffineTransformMakeScale(1.00, 1.00);
    self.teleKillSwitch.backgroundColor = [UIColor colorWithRed:0.8 green:0.0 blue:0.0 alpha:0.3];
    self.teleKillSwitch.layer.cornerRadius = 16;
    self.teleKillSwitch.thumbTintColor = [UIColor whiteColor];
    self.teleKillSwitch.onTintColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5];
    
    [self.teleKillSwitch addTarget:self action:@selector(teleKillSwitchChanged:) 
              forControlEvents:UIControlEventValueChanged];
    
    [self.teleKillButton addSubview:self.teleKillSwitch];
}

- (void)createTelefuckButton {
    UIWindow *mainWindow = [UIApplication sharedApplication].windows.firstObject;
    
    self.telefuckButton = [[UIButton alloc] initWithFrame:[self centeredButtonFrameForIndex:2]];
    self.telefuckButton.transform = CGAffineTransformMakeScale(1.0, 1.0);
    self.telefuckButton.alpha = 0.0f;
    self.telefuckButton.layer.borderWidth = 0.0f;
    self.telefuckButton.layer.cornerRadius = 0.0f;
    self.telefuckButton.backgroundColor = [UIColor clearColor];
    
    [self.telefuckButton addTarget:self action:@selector(buttonDragged:withEvent:) 
                forControlEvents:UIControlEventTouchDragInside];
    
    [mainWindow addSubview:self.telefuckButton];

    self.telefuckLabel = [[UILabel alloc] initWithFrame:CGRectMake(7, 1, 72, 20.8)];
    self.telefuckLabel.textColor = [UIColor whiteColor];
    self.telefuckLabel.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:8];
    self.telefuckLabel.numberOfLines = 1;
    self.telefuckLabel.text = @"NinjaRun";
    self.telefuckLabel.backgroundColor = [UIColor clearColor];
    [self.telefuckButton addSubview:self.telefuckLabel];

    self.telefuckSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(3.5, 20, 51, 31)];
    self.telefuckSwitch.layer.borderWidth = 2.5;
    self.telefuckSwitch.layer.cornerRadius = 5.0;
    self.telefuckSwitch.transform = CGAffineTransformMakeScale(1.00, 1.00);
    self.telefuckSwitch.backgroundColor = [UIColor colorWithRed:0.5 green:0.0 blue:0.5 alpha:0.3];
    self.telefuckSwitch.layer.cornerRadius = 16;
    self.telefuckSwitch.thumbTintColor = [UIColor whiteColor];
    self.telefuckSwitch.onTintColor = [UIColor colorWithRed:0.7 green:0.0 blue:0.7 alpha:0.5];
    
    self.telefuckSwitch.on = Vars.Ninjarun;
    
    [self.telefuckSwitch addTarget:self action:@selector(telefuckSwitchChanged:) 
                forControlEvents:UIControlEventValueChanged];
    
    [self.telefuckButton addSubview:self.telefuckSwitch];
}

- (void)createSatooButton {
    UIWindow *mainWindow = [UIApplication sharedApplication].windows.firstObject;
    
    self.satooButton = [[UIButton alloc] initWithFrame:[self centeredButtonFrameForIndex:3]];
    self.satooButton.transform = CGAffineTransformMakeScale(1.0, 1.0);
    self.satooButton.alpha = 1.0f;
    self.satooButton.layer.borderWidth = 0.0f;
    self.satooButton.layer.cornerRadius = 0.0f;
    self.satooButton.backgroundColor = [UIColor clearColor];
    
    [self.satooButton addTarget:self action:@selector(buttonDragged:withEvent:) 
              forControlEvents:UIControlEventTouchDragInside];
    
    [mainWindow addSubview:self.satooButton];

    self.satooLabel = [[UILabel alloc] initWithFrame:CGRectMake(7, 1, 72, 20.8)];
    self.satooLabel.textColor = [UIColor whiteColor];
    self.satooLabel.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:8];
    self.satooLabel.numberOfLines = 1;
    self.satooLabel.text = @"Speed";
    self.satooLabel.backgroundColor = [UIColor clearColor];
    [self.satooButton addSubview:self.satooLabel];

    self.satooSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(3.5, 20, 51, 31)];
    self.satooSwitch.layer.borderWidth = 2.5;
    self.satooSwitch.layer.cornerRadius = 5.0;
    self.satooSwitch.transform = CGAffineTransformMakeScale(1.00, 1.00);
    self.satooSwitch.backgroundColor = [UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:0.3];
    self.satooSwitch.layer.cornerRadius = 16;
    self.satooSwitch.thumbTintColor = [UIColor whiteColor];
    self.satooSwitch.onTintColor = [UIColor colorWithRed:0.0 green:0.8 blue:0.0 alpha:0.5];
    
    [self.satooSwitch addTarget:self action:@selector(satooSwitchChanged:) 
              forControlEvents:UIControlEventValueChanged];
    
    [self.satooButton addSubview:self.satooSwitch];
    
    static vector<void*> cachedAddresses;
    if (cachedAddresses.empty()) {
        JRMemoryEngine engine = JRMemoryEngine(mach_task_self());
        AddrRange range = (AddrRange){0x100000000, 0x160000000};
        uint64_t search = 4397530849764387586;
        engine.JRScanMemory(range, &search, JR_Search_Type_ULong);

        cachedAddresses = engine.getAllResults();
    }
}

- (void)teleKillSwitchChanged:(UISwitch *)sender {
    Vars.Telekill = sender.on;
    
    if (Vars.ShowTeleKillButton && sender.on) {
        [self teleKillModeUI];
    }
    
    if (sender.on) {
        [self executeTelegogo];
    }
}

- (void)buttonDragged:(UIButton *)sender withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint point = [touch locationInView:sender.superview];
    sender.center = point;
}

- (void)executeTelegogo {
    if (Vars.Telekill) {

    }
}

- (void)telefuckSwitchChanged:(UISwitch *)sender {
    Vars.Ninjarun = sender.on;
    
    if (Vars.ShowTeleVerticalButton && sender.on) {
        [self teleVerticalModeUI];
    }
    
    if (sender.on) {
        [self executeTelefuck];
    }
}

- (void)executeTelefuck {
    if (Vars.Ninjarun) {

    }
}

- (void)wallHackSwitchChanged:(UISwitch *)sender {
    if (self.isProcessing) {
        [sender setOn:!sender.isOn animated:YES];
        return;
    }

    self.isProcessing = YES;
    
    JRMemoryEngine engine = JRMemoryEngine(mach_task_self());
    uint64_t modify = sender.on ? 4510805389574406144 : 4510805389526423306;

    static vector<void*> cachedAddresses;
    if (cachedAddresses.empty()) {
        AddrRange range = (AddrRange){0x100000000, 0x160000000};
        uint64_t search = 4510805389526423306;
        engine.JRScanMemory(range, &search, JR_Search_Type_ULong);
        cachedAddresses = engine.getAllResults();
    }

    for (int i = 0; i < cachedAddresses.size(); i++) {
        engine.JRWriteMemory((unsigned long long)(cachedAddresses[i]), &modify, JR_Search_Type_ULong);
    }
    
    self.isProcessing = NO;
}

- (void)satooSwitchChanged:(UISwitch *)sender {
    if (self.isProcessing) {
        [sender setOn:!sender.isOn animated:YES];
        return;
    }

    self.isProcessing = YES;
    
    JRMemoryEngine engine = JRMemoryEngine(mach_task_self());
    uint64_t modify = sender.on ? 4366458311853765201 : 4397530849764387586;

    static vector<void*> cachedAddresses;
    if (cachedAddresses.empty()) {
        AddrRange range = (AddrRange){0x100000000, 0x160000000};
        uint64_t search = 4397530849764387586;
        engine.JRScanMemory(range, &search, JR_Search_Type_ULong);
        cachedAddresses = engine.getAllResults();
    }

    for (int i = 0; i < cachedAddresses.size(); i++) {
        engine.JRWriteMemory((unsigned long long)(cachedAddresses[i]), &modify, JR_Search_Type_ULong);
    }
    
    self.isProcessing = NO;
}

#pragma mark - Interaction

- (void)updateIOWithTouchEvent:(UIEvent *)event
{
    UITouch *anyTouch = event.allTouches.anyObject;
    CGPoint touchLocation = [anyTouch locationInView:self.view];
    ImGuiIO &io = ImGui::GetIO();
    io.MousePos = ImVec2(touchLocation.x, touchLocation.y);

    BOOL hasActiveTouch = NO;
    for (UITouch *touch in event.allTouches)
    {
        if (touch.phase != UITouchPhaseEnded && touch.phase != UITouchPhaseCancelled)
        {
            hasActiveTouch = YES;
            break;
        }
    }
    io.MouseDown[0] = hasActiveTouch;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
    
    CGPoint touchLocation = [[touches anyObject] locationInView:self.view];
    [self handleMenuClose:touchLocation];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];

    CGPoint touchLocation = [[touches anyObject] locationInView:self.view];
    [self handleMenuClose:touchLocation];
}

#pragma mark - MTKViewDelegate

- (void)drawInMTKView:(MTKView*)view
{
    ImGuiIO& io = ImGui::GetIO();
    io.DisplaySize.x = view.bounds.size.width;
    io.DisplaySize.y = view.bounds.size.height;

    CGFloat framebufferScale = view.window.screen.nativeScale ?: UIScreen.mainScreen.nativeScale;
    io.DisplayFramebufferScale = ImVec2(framebufferScale, framebufferScale);
    io.DeltaTime = 1 / float(view.preferredFramesPerSecond ?: 60);
    
    id<MTLCommandBuffer> commandBuffer = [self.commandQueue commandBuffer];
        
    if (MenDeal == true) {
        [self.view setUserInteractionEnabled:YES];
    } else {
        [self.view setUserInteractionEnabled:NO];
    }

    MTLRenderPassDescriptor* renderPassDescriptor = view.currentRenderPassDescriptor;
    if (renderPassDescriptor != nil)
    {
        id <MTLRenderCommandEncoder> renderEncoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor];
        [renderEncoder pushDebugGroup:@"ImGui Jane"];

        ImGui_ImplMetal_NewFrame(renderPassDescriptor);
        ImGui::NewFrame();

        
        {
            ImDrawList* bg = ImGui::GetBackgroundDrawList();
            DrawAnimatedNeonBackground(bg, ImVec2(0,0), ImVec2(io.DisplaySize.x, io.DisplaySize.y), ImGui::GetTime());
        }

        UIWindow *mainWindow = [UIApplication.sharedApplication.windows firstObject];
        CGFloat x = (mainWindow.bounds.size.width - 380) / 2;
        CGFloat y = (mainWindow.bounds.size.height - 260) / 2;

        ImGui::SetNextWindowPos(ImVec2(x, y), ImGuiCond_FirstUseEver);
        ImGui::SetNextWindowSize(ImVec2(320, 270), ImGuiCond_FirstUseEver);

        if (MenDeal == true)
        {                
            ImGui::Begin(oxorany("N E X O R A"), &MenDeal);
            ImDrawList* draw_list = ImGui::GetWindowDrawList();
            ImVec2 menuPos = ImGui::GetWindowPos();
            ImVec2 menuSize = ImGui::GetWindowSize();

      
            self.menuBounds = CGRectMake(menuPos.x, menuPos.y, menuSize.x, menuSize.y);

            if (ImGui::BeginTabBar(oxorany("Tab"), ImGuiTabBarFlags_FittingPolicyScroll)) 
            {
                if (ImGui::BeginTabItem(("Visuales"))) 
                {
                    ImGui::Checkbox(oxorany("Enable Esp"), &Vars.Enable);
                    ImGui::TableNextColumn();
                    ImGui::Checkbox(oxorany("Enable Aimbot"), &Vars.Aimbot);           
                    ImGui::Combo(oxorany("Aim When"), &Vars.AimWhen, Vars.dir, 4);
                    ImGui::SliderFloat(oxorany("Aim FOV"), &Vars.AimFov, 0.0f, 500.0f);
                    
                    if (ImGui::BeginTable("ESP Features", 4))
                    {

                        ImGui::TableNextColumn();
                        ImGui::Checkbox(oxorany("Box"), &Vars.Box);
                        ImGui::Checkbox(oxorany("Skeleton"), &Vars.skeleton);
                        ImGui::Checkbox(oxorany("Line"), &Vars.lines);
                        
                        ImGui::TableNextColumn();
                        ImGui::Checkbox(oxorany("Name"), &Vars.Name);
                        ImGui::Checkbox(oxorany("Health"), &Vars.Health);
                        ImGui::Checkbox(oxorany("Distance"), &Vars.Distance);
                              
                        ImGui::Checkbox(oxorany("UpPlayer"), &Vars.UpPlayer);

                        ImGui::TableNextColumn();

                        ImGui::Checkbox("Ghost", &Vars.ShowGhostButton);
                        
                        if (Vars.ShowGhostButton) {
                            if (!self.ghostButtonView) {
                                [self ghostModeUI];
                            }
                        } else {
                            if (self.ghostButtonView) {
                                [self.ghostButtonView removeFromSuperview];
                                self.ghostButtonView = nil;
                            }
                        }

                        ImGui::Checkbox(oxorany("TeleKill"), &Vars.ShowTeleKillButton);
                        [self teleKillModeUI];

                        ImGui::Checkbox(oxorany("NinjaRun"), &Vars.ShowTeleVerticalButton);
                        [self teleVerticalModeUI];

                        ImGui::TableNextColumn();

                        ImGui::Checkbox(oxorany("WallKill"), &Vars.Telegogo);
                        ImGui::Checkbox(oxorany("AimKill"), &Vars.aimkill);

ImGui::Checkbox(oxorany("AutoChange"), &Vars.AutoTroca);
                        ImGui::Checkbox(oxorany("Ninjaru"), &Vars.Ninjarun);
                        ImGui::Checkbox(oxorany("Fly"), &Vars.ShowWallHackButton);

                        if (Vars.ShowWallHackButton) {
                            if (!self.wallHackButtonView) {
                                [self wallHackModeUI];
                            }
                        } else {
                            if (self.wallHackButtonView) {
                                [self.wallHackButtonView removeFromSuperview];
                                self.wallHackButtonView = nil;
                            }
                        }
                        
                        ImGui::EndTable();
                    }
                    ImGui::EndTabItem();
                }

                if (ImGui::BeginTabItem("Extra")) 
                {
                    ImGui::Spacing();
                    ImGui::Checkbox(oxorany("Tele Enemy"), &Vars.TeleEnmy);
                    
                    if (Vars.TeleEnmy) {
                        ImGui::SliderFloat("Distancia", &Vars.TeleEnmyDistance, 1.0f, 17.0f, "%.1f m");
                    }

                    ImGui::Spacing();
                    ImGui::Separator();
                    ImGui::Spacing();
                    
                    ImGui::Checkbox("Bypass Emulator PC", &PC);
                    ImGui::Spacing();
                    ImGui::Separator();
                    ImGui::Spacing();

                    if (ImGui::Checkbox("Teleport Suave a Enemigos", &Vars.SmoothHorizontalTeleport)) {
                        if (Vars.SmoothHorizontalTeleport) {
                            Vars.InstantHorizontalTeleport = false;
                            ProcessSmoothHorizontalTeleport();
                        }
                    }
                    
                    if (ImGui::Checkbox("Teleport Instantáneo a Enemigos", &Vars.InstantHorizontalTeleport)) {
                        if (Vars.InstantHorizontalTeleport) {
                            Vars.SmoothHorizontalTeleport = false;
                            InstantHorizontalTeleport();
                        }
                    }
                    
                    ImGui::SliderFloat("Velocidad Teleport", &Vars.TeleportHorizontalSpeed, 1.0f, 20.0f, "%.1f");
                    smoothTeleportSpeed = Vars.TeleportHorizontalSpeed;

                    ImGui::Spacing();
                    ImGui::Separator();
                    
                    ImGui::EndTabItem();
                }
                
                ImGui::EndTabBar();
            }
            ImGui::End();
        }

        get_players(); 
        aimbot();
        game_sdk->init();
        Vars.isAimFov = (Vars.AimFov > 0);

        ImGui::Render();
        ImDrawData* draw_data = ImGui::GetDrawData();
        ImGui_ImplMetal_RenderDrawData(draw_data, commandBuffer, renderEncoder);

        [renderEncoder popDebugGroup];
        [renderEncoder endEncoding];

        [commandBuffer presentDrawable:view.currentDrawable];
    }

    [commandBuffer commit];
}

- (void)mtkView:(MTKView*)view drawableSizeWillChange:(CGSize)size
{
    
}

@end
