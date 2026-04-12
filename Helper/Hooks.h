#import "vinhtran.hpp"
#import "loading.hxx"
#include <fstream>
#define FMT_HEADER_ONLY
#include "fmt/core.h"
#include <unordered_map>


struct COW_GamePlay_IHAAMHPPLMG_o {
 uint32_t NBPDJAAAFBH;
 uint32_t JEDDPHIHGKL;
 uint8_t IOICFFEKAIL;
 uint8_t PHAFNFOFFDB;
 uint64_t BNFAIDHEHOM;
};


typedef void* DamageInfo2_o;
monoList<float *> *LCLHHHKFCFP(void *Weapon,void *CAGCICACKCF,void *HFBDJJDICLN,bool LDGHPONPPNL,void* DamageInfo)
{
    return ((monoList<float *> * (*)(void*,void*,void*,bool,void*))getRealOffset(0x1003C2E44))(Weapon,CAGCICACKCF,HFBDJJDICLN,LDGHPONPPNL,DamageInfo);
}

static int GetDamage(void *pthis)
{
    return ((int (*)(void *))getRealOffset(0x10039D4F8))(pthis);
}

static void StartFiring(void *Player, void *WeaponOnHand) {
    void (*_StartFiring)(void *, void *) = (void (*)(void *, void *))getRealOffset(0x104AF289C);
    return _StartFiring(Player, WeaponOnHand);
}

static void StopFire1(void* Player,void* WeaponOnHand){
    void(*_StopFire1)(void*,void*) = (void(*)(void*,void*))getRealOffset(0x104AC9ABC);
}

static void *GetWeaponOnHand1(void *local) {
    void *(*_GetWeaponOnHand1)(void *local) = (void *(*)(void *))getRealOffset(0x10492FBA4);
    return _GetWeaponOnHand1(local);
}

static int GetWeapon(void* enemy) {
    int (*GetWeapon)(void *player) = (int(*)(void *))getRealOffset(0x10302C5DC);
    return GetWeapon(enemy);
}

static void* get_HeadCollider(void *pthis)
{
    return ((void* (*)(void *))getRealOffset(0x104933544))(pthis);
}

static void* get_gameObject(void *Pthis)
{
    return ((void* (*)(void *))getRealOffset(0x105850AF8))(Pthis);
}

static void* GKHECDLGAJA(void *pthis, void* a1)
{
    return ((void* (*)(void *,void *))getRealOffset(0x10499485C))(pthis,a1);
}

static void StartWholeBodyFiring(void* player,void* WeaponOnHand){
    void(*StartWholeBodyFiring)(void*,void*) = (void(*)(void*,void*))getRealOffset(ENCRYPTOFFSET("0x104AF2E18"));
    return StartWholeBodyFiring(player,WeaponOnHand);
}

static int32_t TakeDamage(void *_this, int32_t KOCMLPLOILD,COW_GamePlay_IHAAMHPPLMG_o HLJDHPGGODB, void* JIIJIFKKCCB, int32_t BOEIBGAABDL, Vector3 NJMFBKNHMBP, Vector3 DOBOBMFMKBJ, monoList<float *> *NBKBEBFNDBE, void* damagerWeaponDynamicInfo, uint32_t damagerVehicleID) {
    return ((int32_t (*)(void*, int32_t, COW_GamePlay_IHAAMHPPLMG_o, void*, int32_t, Vector3, Vector3, monoList<float *> *, void*, uint32_t))getRealOffset(0x104AC7E08))(_this, KOCMLPLOILD, HLJDHPGGODB, JIIJIFKKCCB, BOEIBGAABDL, NJMFBKNHMBP, DOBOBMFMKBJ, NBKBEBFNDBE, damagerWeaponDynamicInfo, damagerVehicleID);
}

COW_GamePlay_IHAAMHPPLMG_o GetplayerID(void *_this)
{
    return ((COW_GamePlay_IHAAMHPPLMG_o (*)(void *))getRealOffset(0x104914BB0))(_this);
}


static void SwapWeapon(void *player, int POFFNNMOOBM, bool GDKLMFLNNGM) {
    void (*_SwapWeapon)(void *player, int POFFNNMOOBM, bool GDKLMFLNNGM) = (void (*)(void *, int, bool))getRealOffset(ENCRYPTOFFSET("0x104AF3484"));
    _SwapWeapon(player, POFFNNMOOBM, GDKLMFLNNGM);
}


bool AimKill = false;
bool SowDamage = true;
bool autochangeweapon = false;
bool POFFNNMOOBM = false;
int GDKLMFLNNGM = 0;


bool autotroca = false;
bool sID = false;
int tS = 0;
int weaponChangeCooldown = 1000; 


ImVec4 espv = ImVec4(0.0f, 1.0f, 0.0f, 1.0f); 
ImVec4 espi = ImVec4(1.0f, 0.0f, 0.0f, 1.0f); 
ImVec4 nameColor = ImVec4(1.0f, 1.0f, 1.0f, 1.0f); 
ImVec4 distanceColor = ImVec4(1.0f, 1.0f, 1.0f, 1.0f); 
bool istelekill = false;
bool isfly = false;

namespace Save{
    void* DamageInfo;
    clock_t AimDelay;
    int AimFPS = (1000000 / 15);
}


extern ImVec4 espv; 
extern ImVec4 espi; 
extern ImVec4 nameColor;
extern ImVec4 distanceColor;
extern bool istelekill;
extern bool isfly;


struct Vars_t
{ 
    float aimKillCooldown = 0.5f; 
    float minAimKillDistance = 5.0f; 
    float maxAimKillDistance = 100.0f; 
    int Target = {};
    bool SilentAim = false; 
    bool UpPlayerOne = false;
    bool Enable = {};
    bool AimbotEnable = {};
    bool Aimbot = {};
    float AimFov = {};
    int AimCheck = {};
    int AimType = {};
    int AimWhen = {};
    bool isAimFov = {};
    int AimHitbox = 0; 
    const char* aimHitboxes[3] = {" Cabeça", " Pescoço", " Corpo"};
    const char* dir[4] = { " Automático", " Disparo", " Escopo", " Disparo + Escopo" };
    bool lines = {};
    bool Box = {};
    bool Outline = {};
    bool Name = {};
    bool Health = {};
    bool Distance = {};
    bool fovaimglow = {};
    bool circlepos = {};
    bool skeleton = {};
    bool OOF = {};
    bool counts = {};
    ImVec4 boxColor = ImVec4(1.0f, 0.0f, 0.0f, 0.8f);
    float AimSpeed = 9999.0f; 
    bool VisibleCheck = false; 
    bool IgnoreKnocked = false;
    bool espActive = true;     
    bool hidePanel = false;    
    int LineStyle = 0; 
    int NameStyle = 0; 
    int BoxStyle = 0;  
    int HealthPos = 0; 
    const char* healthPosOptions[2] = { " Esquerda", " Direita" };
    
    bool AutoTroca = {};
    bool TeleEnmy = {};
    bool Telekill = {};
    bool Telekillpro = {};
    bool ShowTeleVerticalButton = {};
    bool SmoothHorizontalTeleport = {};
    bool InstantHorizontalTeleport = {};
    float TeleportHorizontalSpeed = 5.0f;
    bool Underground = false; 
    bool ShowUndergroundButton = false;
    bool Masskill = {};
    bool UpPlayer = {};
    bool Guppy = {};
    bool campp = {};
    bool Ninjarun = {}; 
    bool Telegogo = {};
    bool enemycount = {};
    bool modDock = {};
    bool AutoFire = {};
    bool TeleportVertical = {};
    bool ghostcamera = {};
    bool aimkill = {};  
    bool EnableGhost = false; 
    bool ShowGhostButton = false; 
    bool EnableFlyHack = {};
    bool EnableSpeed = {};
    bool EnableTeleKill = {};
    bool ShowSpeedButton = {};
    bool ShowTeleKillButton = {};
    bool ShowFlyHackButton = {};
    bool AutoDamage = false;
    bool ShowWallHackButton = {};
    float AutoDamageRange = 15.0f;
    float TeleEnmyDistance = 10.0f;
    float TeleportOffset = 1.4f;
    float MasskillDistance = 2.0f;
    float fovLineColor[4] = {1.0f, 1.0f, 1.0f, 1.0f};
    float targetDistance = 15.0f;
    float margin = 1.0f;
} Vars;


inline void DrawCornerBox(ImDrawList* draw_list, ImVec2 min, ImVec2 max, ImU32 color, float thickness) {
    draw_list->AddRect(min, max, color, 0.0f, 0, thickness);
}

inline void DrawRoundBox(ImDrawList* draw_list, ImVec2 min, ImVec2 max, ImU32 color, float thickness) {
    draw_list->AddRect(min, max, color, 5.0f, 0, thickness);
}

void DrawLine(ImDrawList* drawList, ImVec2 start, ImVec2 end, float thickness, bool isDead = false, bool isVisible = false) {
    if (!drawList) return;
    ImColor color = isDead ? ImColor(espi) : isVisible ? ImColor(espv) : ImColor(espi);
    drawList->AddLine(start, end, color, thickness);
}

void DrawHealthBar(ImDrawList* drawList, ImVec2 start, ImVec2 end, float healthMultiplier, float thickness, bool isDead = false) {
    if (!drawList) return;

    float totalHeight = end.y - start.y;
    float healthHeight = totalHeight * healthMultiplier;

    drawList->AddRectFilled(
        ImVec2(start.x - thickness/2, start.y),
        ImVec2(start.x + thickness/2, end.y),
        ImColor(50, 50, 50, 200)
    );

    if (healthMultiplier > 0) {
        ImColor color = isDead ? ImColor(255, 0, 0) : ImColor(0, 255, 0);
        drawList->AddRectFilled(
            ImVec2(start.x - thickness/2, end.y - healthHeight),
            ImVec2(start.x + thickness/2, end.y),
            color
        );
    }

    if (Vars.Outline) {
        drawList->AddRect(
            ImVec2(start.x - thickness/2 - 1, start.y - 1),
            ImVec2(start.x + thickness/2 + 1, end.y + 1),
            ImColor(0, 255, 0)
        );
    }
}

class game_sdk_t
{
public:
    void init();
    int (*GetHp)(void *player);
    bool (*get_IsCatapultFalling)(void *);
    void (*OnStopCatapultFalling)(void *);
    Vector3 (*get_AttackableCenterWS)(void* player);
    void* (*PlayerWeaponOnHand)(void* Player);
    Vector3 (*CameraPosition)(void* Player);
    void* (*PlayerTakeDamage)(void* Player, void* DamageInfo, void* DamagerWeaponDynamicInfo, void* CheckParams, uint DamagerVehicleID);
    void (*PlayerNetworkStartWholeBodyFiring)(void* Player, void* WeaponOnHand);
    void (*PlayerNetworkStopFire)(void* Player, void* WeaponOnHand);
    void* (*GameFacadeCurrentLocalPlayer)();
    Vector3 (*PlayerHeadPosition)(void* Player);
    void (*spofNick)(void* player, monoString* nick);
    void* (*GetWeaponOnHand)(void*);
    void (*StartWholeBodyFiring)(void*, void*);
    void* (*GetLocalPlayer_Facade)();
    void (*TakeDamage)(void*, void*);
    void *(*Curent_Match)();
    void *(*GetLocalPlayer)(void *Game);
    void *(*GetHeadPositions)(void *player);
    Vector3 (*get_position)(void *player);
    void *(*Component_GetTransform)(void *player);
    void *(*get_camera)();
    Vector3 (*WorldToScreenPoint)(void *, Vector3);
    bool (*get_isVisible)(void *player);
    bool (*get_isLocalTeam)(void *player);
    bool (*get_IsDieing)(void *player);
    int (*get_MaxHP)(void *player);
    Vector3 (*GetForward)(void *player);
    void (*set_aim)(void *player, Quaternion look);
    bool (*get_IsSighting)(void *player);
    bool (*get_IsFiring)(void *player);
    monoString *(*name)(void *player);
    void *(*_GetHeadPositions)(void *);
    void *(*_newHipMods)(void *);
    void *(*_GetLeftAnkleTF)(void *);
    void *(*_GetRightAnkleTF)(void *);
    void *(*_GetLeftToeTF)(void *);
    void *(*_GetRightToeTF)(void *);
    void *(*_getLeftHandTF)(void *);
    void *(*_getRightHandTF)(void *);
    void *(*_getLeftForeArmTF)(void *);
    void *(*_getRightForeArmTF)(void *);
};

game_sdk_t *game_sdk = new game_sdk_t();

void game_sdk_t::init()
{
    this->get_IsCatapultFalling = (bool (*)(void *))getRealOffset(oxo("0x104947B18"));
    this->OnStopCatapultFalling = (void (*)(void *))getRealOffset(oxo("0x1049DC1C8"));
    this->get_AttackableCenterWS = (Vector3(*)(void*))getRealOffset(oxo("0x10492F598"));
    this->PlayerWeaponOnHand = (void*(*)(void*))getRealOffset(oxo("0x10492FBA4"));
    this->CameraPosition = (Vector3(*)(void*))getRealOffset(oxo("0x105899AB0"));
    this->PlayerTakeDamage = (void*(*)(void*,void*,void*,void*,uint))getRealOffset(oxo("0x1049951C8"));
    this->PlayerNetworkStartWholeBodyFiring = (void(*)(void*,void*))getRealOffset(oxo("0x104AF2E18"));
    this->PlayerNetworkStopFire = (void(*)(void*,void*))getRealOffset(oxo("0x104AC9ABC"));
    this->GameFacadeCurrentLocalPlayer = (void*(*)())getRealOffset(oxo("0x100FE57AC"));
    this->PlayerHeadPosition = (Vector3(*)(void*))getRealOffset(oxo("0x1049AF530"));
    this->spofNick = (void(*)(void*, monoString*))getRealOffset(oxo("0x104930348"));
    this->GetHp = (int (*)(void *))getRealOffset(oxo("0x10499719C"));
    this->Component_GetTransform = (void *(*)(void *))getRealOffset(oxo("0x105850A8C"));
    this->get_position = (Vector3(*)(void *))getRealOffset(oxo("0x105899A80"));
    this->GetForward = (Vector3(*)(void *))getRealOffset(oxo("0x10589A430"));
    this->Curent_Match = (void *(*)())getRealOffset(oxo("0x100FE52DC"));
    this->GetLocalPlayer = (void *(*)(void *))getRealOffset(oxo("0x101B14DA8"));
    this->GetHeadPositions = (void *(*)(void *))getRealOffset(oxo("0x1049AF530"));
    this->get_position = (Vector3(*)(void *))getRealOffset(oxo("0x105899A80"));
    this->Component_GetTransform = (void *(*)(void *))getRealOffset(oxo("0x105850A8C"));
    this->get_camera = (void *(*)())getRealOffset(oxo("0x10584E620"));
    this->WorldToScreenPoint = (Vector3(*)(void *, Vector3))getRealOffset(oxo("0x10584DF68"));
    this->get_isVisible = (bool (*)(void *))getRealOffset(oxo("0x104938678"));
    this->get_isLocalTeam = (bool (*)(void *))getRealOffset(oxo("0x10494E65C"));
    this->get_IsDieing = (bool (*)(void *))getRealOffset(oxo("0x10491076C"));
    this->get_MaxHP = (int (*)(void *))getRealOffset(oxo("0x104997244"));
    this->GetForward = (Vector3(*)(void *))getRealOffset(oxo("0x10589A430"));
    this->set_aim = (void (*)(void *, Quaternion))getRealOffset(oxo("0x104934BE0"));
    this->get_IsSighting = (bool (*)(void *))getRealOffset(oxo("0x104929520"));
    this->get_IsFiring = (bool (*)(void *))getRealOffset(oxo("0x10492946C"));
    this->name = (monoString * (*)(void *player)) getRealOffset(oxo("0x1049302E8"));
    this->_GetHeadPositions = (void *(*)(void *))getRealOffset(oxo("0x1049AF530"));
    this->_newHipMods = (void *(*)(void *))getRealOffset(oxo("0x1049AF680"));
    this->_GetLeftAnkleTF = (void *(*)(void *))getRealOffset(oxo("0x1049AF9B4"));
    this->_GetRightAnkleTF = (void *(*)(void *))getRealOffset(oxo("0x1049AFA58"));
    this->_GetLeftToeTF = (void *(*)(void *))getRealOffset(oxo("0x1049AFAFC"));
    this->_GetRightToeTF = (void *(*)(void *))getRealOffset(oxo("0x1049AFBA0"));
    this->_getLeftHandTF = (void *(*)(void *))getRealOffset(oxo("0x104933F3C"));
    this->_getRightHandTF = (void *(*)(void *))getRealOffset(oxo("0x104933FE8"));
    this->_getLeftForeArmTF = (void *(*)(void *))getRealOffset(oxo("0x10493408C"));
    this->_getRightForeArmTF = (void *(*)(void *))getRealOffset(oxo("0x104934130"));
}

namespace Camera$$WorldToScreen
{
    ImVec2 Regular(Vector3 pos)
    {
        auto cam = game_sdk->get_camera();
        if (!cam)
            return {0, 0};
        Vector3 worldPoint = game_sdk->WorldToScreenPoint(cam, pos);
        Vector3 location;
        int ScreenWidth = ImGui::GetIO().DisplaySize.x;
        int ScreenHeight = ImGui::GetIO().DisplaySize.y;
        location.x = ScreenWidth * worldPoint.x;
        location.y = ScreenHeight - worldPoint.y * ScreenHeight;
        location.z = worldPoint.z;
        return {location.x, location.y};
    }

    ImVec2 Checker(Vector3 pos, bool &checker)
    {
        auto cam = game_sdk->get_camera();
        if (!cam)
            return {0, 0};
        Vector3 worldPoint = game_sdk->WorldToScreenPoint(cam, pos);
        Vector3 location;
        int ScreenWidth = ImGui::GetIO().DisplaySize.x;
        int ScreenHeight = ImGui::GetIO().DisplaySize.y;
        location.x = ScreenWidth * worldPoint.x;
        location.y = ScreenHeight - worldPoint.y * ScreenHeight;
        location.z = worldPoint.z;
        checker = location.z > 1;
        return {location.x, location.y};
    }
}

bool IsValidTarget(void* enemy, void* localPlayer) {
    return enemy && 
           !game_sdk->get_IsDieing(enemy) && 
           game_sdk->get_isVisible(enemy) && 
           !game_sdk->get_isLocalTeam(enemy);
}

Vector3 GetBonePosition(void *player, void *(*transformGetter)(void *))
{
    if (!player || !transformGetter)
        return Vector3();
    void *transform = transformGetter(player);
    return transform ? game_sdk->get_position(game_sdk->Component_GetTransform(transform)) : Vector3();
}

Vector3 getPosition(void *transform)
{
    return game_sdk->get_position(game_sdk->Component_GetTransform(transform));
}

static Vector3 get_AttackableCenterWS(void* player) {
    return game_sdk->get_AttackableCenterWS(player);
}

static void* PlayerWeaponOnHand(void* Player) {
    return game_sdk->PlayerWeaponOnHand(Player);
}

static Vector3 CameraPosition(void* Player) {
    return game_sdk->CameraPosition(Player);
}

static void PlayerNetworkStartWholeBodyFiring(void* Player, void* WeaponOnHand) {
    game_sdk->PlayerNetworkStartWholeBodyFiring(Player, WeaponOnHand);
}

static void PlayerNetworkStopFire(void* Player, void* WeaponOnHand) {
    game_sdk->PlayerNetworkStopFire(Player, WeaponOnHand);
}

void* damagerWeaponDynamicInfo = (void*)getRealOffset(ENCRYPTOFFSET("0x1003DFA84"));

static void* GameFacadeCurrentLocalPlayer() {
    return game_sdk->GameFacadeCurrentLocalPlayer();
}

static Vector3 PlayerHeadPosition(void* Player) {
    return game_sdk->PlayerHeadPosition(Player);
}

static monoString* U3DStr(const char* str) {
    monoString* (*String_CreateString)(void* _this, const char* str) = (monoString*(*)(void*, const char*))getRealOffset(0x1059DCFA4);
    return String_CreateString(NULL, str);
}

static void spofNick(void* players) {
    game_sdk->spofNick(players, U3DStr("[FF33CC] [99FF00]Nexora [7FFF00]FF [CC34BA] [FF0000] [00FFFF][99FF00]"));
}

static void* Current_Local_Player() {
    return game_sdk->GameFacadeCurrentLocalPlayer();
}

static Vector3 GetHeadPosition(void *player)
{
    return game_sdk->get_position(game_sdk->GetHeadPositions(player));
}

static Vector3 GetNeckPosition(void *player) {
    return GetBonePosition(player, game_sdk->_GetHeadPositions);
}

static Vector3 GetChestPosition(void *player) {
    return GetBonePosition(player, game_sdk->_newHipMods);
}

static Vector3 CameraMain(void *player)
{
    return game_sdk->get_position(*(void **)((uint64_t)player + oxo("0x2B0")));
}

Quaternion GetRotationToTheLocation(Vector3 Target, float Height, Vector3 MyEnemy)
{
    return Quaternion::LookRotation((Target + Vector3(0, Height, 0)) - MyEnemy, Vector3(0, 1, 0));
}

#include "Helper/Ext.h"

class tanghinh
{
public:
    static Vector3 Transform_GetPosition(void *player)
    {
        Vector3 out = Vector3::zero();
        void (*_Transform_GetPosition)(void *transform, Vector3 *out) = (void (*)(void *, Vector3 *))getRealOffset(oxo("0x105899AB0"));
        _Transform_GetPosition(player, &out);
        return out;
    }

    static void Transform_SetPosition(void *player, Vvector3 inn) {
        void (*_Transform_SetPosition)(void *transform, Vvector3 in) = (void (*)(void *, Vvector3))getRealOffset(ENCRYPTOFFSET("0x105899B54"));
        _Transform_SetPosition(player, inn);
    }

    static void* PlayerTakeDamage(void* Player, void* DamageInfo, void* DamagerWeaponDynamicInfo, void* CheckParams, uint DamagerVehicleID) {
        void*(*TakeDamage)(void*,void*,void*,void*,uint) = (void*(*)(void*,void*,void*,void*,uint))getRealOffset(ENCRYPTOFFSET("0x1001BC018"));
        return TakeDamage(Player,DamageInfo,DamagerWeaponDynamicInfo,CheckParams,DamagerVehicleID);
    }

    static void *Player_GetHeadCollider(void *player)
    {
        void *(*_Player_GetHeadCollider)(void *players) = (void *(*)(void *))getRealOffset(oxo("0x104933544"));
        return _Player_GetHeadCollider(player);
    }

    static bool Physics_Raycast(Vector3 camLocation, Vector3 headLocation, unsigned int LayerID, void *collider)
    {
        bool (*_Physics_Raycast)(Vector3 camLocation, Vector3 headLocation, unsigned int LayerID, void *collider) = (bool (*)(Vector3, Vector3, unsigned int, void *))getRealOffset(oxo("0x1048FA8E4"));
        return _Physics_Raycast(camLocation, headLocation, LayerID, collider);
    }

    static bool isVisible(void *enemy)
    {
        if (enemy != NULL)
        {
            void *hitObj = NULL;
            auto Camera = Transform_GetPosition(game_sdk->Component_GetTransform(game_sdk->get_camera()));
            auto Target = Transform_GetPosition(game_sdk->Component_GetTransform(Player_GetHeadCollider(enemy)));
            return !Physics_Raycast(Camera, Target, 12, &hitObj);
        }
        return false;
    }
};


void PlayerTakeDamage(void* ClosestEnemy) {
    if (ClosestEnemy != nullptr && game_sdk->get_isVisible(ClosestEnemy) && clock() > Save::AimDelay) {
        Save::AimDelay = clock() + Save::AimFPS;

        void* match = game_sdk->Curent_Match();
        if (!match) return;

        void* LocalPlayer = game_sdk->GetLocalPlayer(match);
        if (LocalPlayer != NULL) {

            void* WeaponHand = GetWeaponOnHand1(LocalPlayer);
            if (WeaponHand == nullptr) return;

            void* HitInfo = *(void**)((uintptr_t)LocalPlayer + 0x970);
            if (HitInfo == nullptr) return;

            auto PlayerID2 = GetplayerID(LocalPlayer);

            auto baseDamage = GetDamage(WeaponHand);

            int WeaponID = GetWeapon(WeaponHand);

            Vector3 localLocation = GetHeadPosition(LocalPlayer);
            Vector3 enemyLocation = GetHeadPosition(ClosestEnemy);

            void* damagerWeaponDynamicInfo = reinterpret_cast<void*>(getRealOffset(0x1003DFA84));

            void *damagerDynamicInfo;
            if (!SowDamage) {
                damagerDynamicInfo = damagerWeaponDynamicInfo;
            } else {
                damagerDynamicInfo = nullptr;
            }

            if (WeaponID == -1 || baseDamage == 0) return;

            void* PlayerAttributes = *(void**)((uint64_t)LocalPlayer + 0x618);
            if (!PlayerAttributes) return;

            void* DamageModule = *(void**)((uint64_t)PlayerAttributes + 0x2A0);
            if (!DamageModule) return;

            void* DamageInfo = *(void**)((uint64_t)DamageModule + 0x10);
            if (!DamageInfo) return;

            
            *(int*)((char*)DamageInfo + 0x14) = 1;
            *(void**)((char*)DamageInfo + 0x40) = WeaponHand;
            *(int*)((char*)DamageInfo + 0x10) = baseDamage;
            *(COW_GamePlay_IHAAMHPPLMG_o*)((char*)DamageInfo + 0x28) = PlayerID2;

            
            void* headCollider = get_HeadCollider(ClosestEnemy);
            if (headCollider == nullptr) return;

            void* hitGameObject = get_gameObject(headCollider);
            if (hitGameObject == nullptr) return;

            
            *(void**)((char*)HitInfo + 0x18) = hitGameObject;
            *(void**)((char*)HitInfo + 0x20) = headCollider;
            *(Vector3*)((char*)HitInfo + 0x30) = enemyLocation;
            *(int*)((char*)HitInfo + 0x64) = 1;

            
            auto targetPosition = GKHECDLGAJA(LocalPlayer, HitInfo);
            if (targetPosition == nullptr) return;

            monoList<float*>* CheckParametros = LCLHHHKFCFP(WeaponHand, targetPosition, headCollider, false, DamageInfo);
            if (CheckParametros == nullptr) return;

            StartWholeBodyFiring(LocalPlayer, WeaponHand);
            TakeDamage(ClosestEnemy, baseDamage, PlayerID2, DamageInfo,
                       WeaponID, localLocation, enemyLocation, CheckParametros, damagerDynamicInfo, 0);
            StartFiring(LocalPlayer, WeaponHand);
            StopFire1(LocalPlayer, WeaponHand);

            GDKLMFLNNGM++;

            if (GDKLMFLNNGM > 1 && autochangeweapon) { 
                POFFNNMOOBM = !POFFNNMOOBM; 
                GDKLMFLNNGM = 0; 
            }
        }
    }
}




static clock_t lastWeaponChangeTime = 0;
static int changeInterval = 3000000; 

void ProcessAutoTroca() {
    if (!Vars.AutoTroca) return;

    void* match = game_sdk->Curent_Match();
    if (!match) return;

    void* LocalPlayer = game_sdk->GetLocalPlayer(match);
    if (!LocalPlayer) return;


    clock_t currentTime = clock();
    if (currentTime - lastWeaponChangeTime < changeInterval) return;

    bool enemyVisible = false;
    Dictionary<uint8_t*, void**>* players = *(Dictionary<uint8_t*, void**>**)((long)match + 0xC8);
    
    if (players && players->getValues()) {
        for (int i = 0; i < players->getNumValues(); i++) {
            void* enemy = players->getValues()[i];
            if (!enemy || enemy == LocalPlayer || game_sdk->get_isLocalTeam(enemy)) continue;
            if (game_sdk->get_IsDieing(enemy)) continue;
            
            if (tanghinh::isVisible(enemy)) {
                enemyVisible = true;
                break;
            }
        }
    }

    if (enemyVisible) {
        sID = !sID;
        SwapWeapon(LocalPlayer, sID, true);
        lastWeaponChangeTime = currentTime;
    }
}


void DrawSkeleton(void *player, ImDrawList *drawList) {
    if (!player || !drawList)
        return;
    bool isPlayerVisible = tanghinh::isVisible(player);
    bool isPlayerDead = game_sdk->get_IsDieing(player);

    Vector3 headPos = GetBonePosition(player, game_sdk->_GetHeadPositions);
    Vector3 hipPos = GetBonePosition(player, game_sdk->_newHipMods);
    Vector3 leftAnklePos = GetBonePosition(player, game_sdk->_GetLeftAnkleTF);
    Vector3 rightAnklePos = GetBonePosition(player, game_sdk->_GetRightAnkleTF);
    Vector3 leftToePos = GetBonePosition(player, game_sdk->_GetLeftToeTF);
    Vector3 rightToePos = GetBonePosition(player, game_sdk->_GetRightToeTF);
    Vector3 leftHandPos = GetBonePosition(player, game_sdk->_getLeftHandTF);
    Vector3 rightHandPos = GetBonePosition(player, game_sdk->_getRightHandTF);
    Vector3 leftForeArmPos = GetBonePosition(player, game_sdk->_getLeftForeArmTF);
    Vector3 rightForeArmPos = GetBonePosition(player, game_sdk->_getRightForeArmTF);
    bool visible;
    ImVec2 headScreen = Camera$$WorldToScreen::Checker(headPos, visible);
    if (!visible)
        return;
    ImVec2 hipScreen = Camera$$WorldToScreen::Regular(hipPos);
    ImVec2 leftAnkleScreen = Camera$$WorldToScreen::Regular(leftAnklePos);
    ImVec2 rightAnkleScreen = Camera$$WorldToScreen::Regular(rightAnklePos);
    ImVec2 leftToeScreen = Camera$$WorldToScreen::Regular(leftToePos);
    ImVec2 rightToeScreen = Camera$$WorldToScreen::Regular(rightToePos);
    ImVec2 leftHandScreen = Camera$$WorldToScreen::Regular(leftHandPos);
    ImVec2 rightHandScreen = Camera$$WorldToScreen::Regular(rightHandPos);
    ImVec2 leftForeArmScreen = Camera$$WorldToScreen::Regular(leftForeArmPos);
    ImVec2 rightForeArmScreen = Camera$$WorldToScreen::Regular(rightForeArmPos);
    float thickness = 1.0f;
    ImColor color = isPlayerDead ? ImColor(espi) : isPlayerVisible ? ImColor(espv) : ImColor(espi);

    drawList->AddCircle(headScreen, 2.0f, color, 12, thickness);
    drawList->AddLine(headScreen, hipScreen, color, thickness);
    drawList->AddLine(headScreen, leftForeArmScreen, color, thickness);
    drawList->AddLine(headScreen, rightForeArmScreen, color, thickness);
    drawList->AddLine(leftForeArmScreen, leftHandScreen, color, thickness);
    drawList->AddLine(rightForeArmScreen, rightHandScreen, color, thickness);
    drawList->AddLine(hipScreen, leftAnkleScreen, color, thickness);
    drawList->AddLine(hipScreen, rightAnkleScreen, color, thickness);
    drawList->AddLine(leftAnkleScreen, leftToeScreen, color, thickness);
    drawList->AddLine(rightAnkleScreen, rightToeScreen, color, thickness);
}

bool isFov(Vector3 vec1, Vector3 vec2, int radius) {
    float dx = vec1.x - vec2.x;
    float dy = vec1.y - vec2.y;
    return (dx * dx + dy * dy) <= (radius * radius);
}

void *GetClosestEnemy() {
    try {
        float shortestDistance = 250.0f;
        void *closestEnemy = NULL;
        void *get_MatchGame = game_sdk->Curent_Match();
        if (!get_MatchGame)
            return NULL;
        void *LocalPlayer = game_sdk->GetLocalPlayer(get_MatchGame);
        if (!LocalPlayer || !game_sdk->Component_GetTransform(LocalPlayer))
            return NULL;
        if (!Vars.Aimbot && !Vars.Enable)
            return NULL;
        Dictionary<uint8_t *, void **> *players = *(Dictionary<uint8_t *, void **> **)((long)get_MatchGame + oxo("0xC8"));
        if (!players || !players->getValues())
            return NULL;

        Vector3 LocalPlayerPos = getPosition(LocalPlayer);
        ImVec2 center = ImVec2(ImGui::GetIO().DisplaySize.x / 2, ImGui::GetIO().DisplaySize.y / 2);

        for (int u = 0; u < players->getNumValues(); u++) {
            void *Player = players->getValues()[u];
            if (!Player || Player == LocalPlayer || !game_sdk->get_MaxHP(Player) || game_sdk->get_isLocalTeam(Player))
                continue;

            if (Vars.IgnoreKnocked && game_sdk->get_IsDieing(Player))
                continue;
            if (Vars.VisibleCheck && !tanghinh::isVisible(Player))
                continue;

            Vector3 PlayerPos = GetHeadPosition(Player);
            float distance = Vector3::Distance(LocalPlayerPos, PlayerPos);
            if (distance >= 300)
                continue;

            ImVec2 enemyScreenPos = Camera$$WorldToScreen::Regular(PlayerPos);
            bool isValidTarget = isFov(Vector3(enemyScreenPos.x, enemyScreenPos.y, 0), Vector3(center.x, center.y, 0), Vars.AimFov);

            if (isValidTarget && distance < shortestDistance) {
                shortestDistance = distance;
                closestEnemy = Player;
            }
        }
        return closestEnemy;
    } catch (...) {
        return NULL;
    }
}

void ProcessAimKill() {
    if (!Vars.aimkill) return;

    void* CurrentMatch = game_sdk->Curent_Match();
    if (!CurrentMatch) return;

    void* LocalPlayer = game_sdk->GetLocalPlayer(CurrentMatch);
    if (!LocalPlayer || !game_sdk->Component_GetTransform(LocalPlayer)) return;
    if (game_sdk->get_IsDieing(LocalPlayer)) return;

    Dictionary<uint8_t*, void**>* players = *(Dictionary<uint8_t*, void**>**)((long)CurrentMatch + 0xC8);
    if (!players || !players->getValues()) return;

    static void* targetEnemy = nullptr;
    static float lastTargetChangeTime = 0.0f;
    static float lastDamageTime = 0.0f;
    float currentTime = ImGui::GetTime();
    
    if (currentTime - lastDamageTime < 0.5f) return;

    float closestDistance = FLT_MAX;
    void* closestEnemy = nullptr;

    if (targetEnemy && (currentTime - lastTargetChangeTime >= 2.0f || !IsValidTarget(targetEnemy, LocalPlayer))) {
        targetEnemy = nullptr;
    }

    
    if (targetEnemy && IsValidTarget(targetEnemy, LocalPlayer)) {
        Vector3 enemyPos = GetHeadPosition(targetEnemy);
        Vector3 playerPos = CameraMain(LocalPlayer);
        float distance = Vector3::Distance(enemyPos, playerPos);
        
        if (distance <= Vars.targetDistance && tanghinh::isVisible(targetEnemy)) {
            closestEnemy = targetEnemy;
        } else {
            targetEnemy = nullptr;
            lastTargetChangeTime = 0.0f;
        }
    }

    if (!closestEnemy) {
        for (int i = 0; i < players->getNumValues(); i++) {
            void* enemy = players->getValues()[i];
            
            if (!IsValidTarget(enemy, LocalPlayer)) continue;
            
            Vector3 enemyPos = GetHeadPosition(enemy);
            Vector3 playerPos = CameraMain(LocalPlayer);
            float distance = Vector3::Distance(enemyPos, playerPos);
            
            if (distance >= 5.0f && distance <= Vars.targetDistance && distance < closestDistance && 
                tanghinh::isVisible(enemy)) {
                closestDistance = distance;
                closestEnemy = enemy;
            }
        }
    }


    if (closestEnemy && game_sdk->GetHp(closestEnemy) > 0) {
        targetEnemy = closestEnemy;
        lastTargetChangeTime = currentTime;
        

        if (Vars.Aimbot) {
            Vector3 EnemyLocation = GetHeadPosition(closestEnemy);
            Vector3 PlayerLocation = CameraMain(LocalPlayer);
            if (EnemyLocation != Vector3::zero() && PlayerLocation != Vector3::zero()) {
                Quaternion PlayerLook = GetRotationToTheLocation(EnemyLocation, 0.1f, PlayerLocation);
                game_sdk->set_aim(LocalPlayer, PlayerLook);
            }
        }
        

        PlayerTakeDamage(closestEnemy);
        lastDamageTime = currentTime;
        

        if (game_sdk->GetHp(closestEnemy) <= 0) {
            targetEnemy = nullptr; 
        }
    } else {
        targetEnemy = nullptr;
    }
}


static void* Camera_main() {
    void* (*_Camera_main)(void*) = (void* (*)(void*))getRealOffset(ENCRYPTOFFSET("0x10584E620"));
    return _Camera_main(nullptr);
}

static void* GetRuntimeMainCameraTransform() {
    void* (*_GetRuntimeMainCameraTransform)(void*) = (void* (*)(void*))getRealOffset(ENCRYPTOFFSET("0x10492F444"));
    return _GetRuntimeMainCameraTransform(nullptr);
}

static Quaternion GetRotation(void* player) {
    Quaternion (*_GetRotation)(void* players) = (Quaternion(*)(void *))getRealOffset(ENCRYPTOFFSET("0x105899D58"));
    return _GetRotation(player);
}

static void* get_WeaponData(void* player) {
    void* (*_get_WeaponData)(void*) = (void* (*)(void*))getRealOffset(ENCRYPTOFFSET("0x1012FEAB0"));
    return _get_WeaponData(player);
}

static std::unordered_map<void*, float> Telegogo_enemyOriginalY;
static float Telegogo_originalCameraY = 0.0f;
static Vvector3 Telegogo_originalPosition;
static bool Telegogo_needsRestore = false;

static std::unordered_map<void *, float> enemyOriginalY;
static float localOriginalY = 0.0f;
static bool cameraAdjusted = false;

static bool isSmoothTeleportActive = false;
static Vector3 smoothTeleportTarget;
static float smoothTeleportSpeed = 5.0f;
static float smoothTeleportProgress = 0.0f;

static bool isTeleported = false;
static Vector3 originalPosition;
static float teleportTime = 0.0f;

static float telekillproCooldown = 0.0f;
static bool telekillproActive = true;

static std::unordered_map<void*, bool> teleportedEnemies;
static float telekillCooldown = 0.0f;
static bool isOnCooldown = false;

static std::unordered_map<void*, float> Guppy_originalYPositions;
static bool Guppy_cameraAdjusted = false;
static bool Guppy_needsRestore = false;
const float GUPPY_UNDERGROUND_DEPTH = 5.0f;
static bool phaseCompleted = false;

static bool wasMirrorModeActive = false;
static bool isUnderground = false;
static bool bCameraUnderground = false;  
static float fOriginalCameraY = 0.0f;  
const float fUndergroundDepth = 5.0f;

static bool bFlyActive = false;
static float fFlySpeed = 5.0f;
static Vector3 vOriginalPosition;
static float GetFrameTime() { return ImGui::GetIO().DeltaTime; }


void ProcessMasskill() {
    if (!Vars.Masskill) return;

    void* match = game_sdk->Curent_Match();
    if (!match) return;

    void* localPlayer = game_sdk->GetLocalPlayer(match);
    if (!localPlayer) return;

    Vector3 playerPos = tanghinh::Transform_GetPosition(game_sdk->Component_GetTransform(localPlayer));

    auto* players = *(Dictionary<uint8_t*, void**>**)((uintptr_t)match + 0xC8);
    if (!players || !players->getValues()) return;

    for (int i = 0; i < players->getNumValues(); i++) {
        void* enemy = players->getValues()[i];
        if (!enemy || enemy == localPlayer) continue;
        if (game_sdk->get_isLocalTeam(enemy)) continue;

        Vector3 enemyPos = tanghinh::Transform_GetPosition(game_sdk->Component_GetTransform(enemy));
        
        float distance = sqrt(
            pow(playerPos.x - enemyPos.x, 2) + 
            pow(playerPos.y - enemyPos.y, 2) + 
            pow(playerPos.z - enemyPos.z, 2)
        );

        if (distance <= 16.0f) {
            Vvector3 killPos = {
                playerPos.x + Vars.TeleportOffset,
                playerPos.y + Vars.TeleportOffset,
                playerPos.z + Vars.TeleportOffset
            };
            tanghinh::Transform_SetPosition(game_sdk->Component_GetTransform(enemy), killPos);
        }
    }
}

void ProcessTelegogo() {
    if (!Vars.Telegogo) {
        if (Telegogo_needsRestore) {
            void* match = game_sdk->Curent_Match();
            if (match) {
                auto* players = *(Dictionary<uint8_t*, void**>**)((uintptr_t)match + 0xC8);
                if (players && players->getValues()) {
                    for (int i = 0; i < players->getNumValues(); i++) {
                        void* enemy = players->getValues()[i];
                        if (!enemy) continue;
                        
                        void* enemyTF = game_sdk->Component_GetTransform(enemy);
                        if (enemyTF && Telegogo_enemyOriginalY.find(enemy) != Telegogo_enemyOriginalY.end()) {
                            Vector3 enemyPos = tanghinh::Transform_GetPosition(enemyTF);
                            enemyPos.y = Telegogo_enemyOriginalY[enemy];
                            tanghinh::Transform_SetPosition(enemyTF, ToVvector3(enemyPos));
                        }
                    }
                }
            }
            Telegogo_enemyOriginalY.clear();
            Telegogo_needsRestore = false;
        }
        return;
    }

    void* match = game_sdk->Curent_Match();
    if (!match) return;

    void* localPlayer = game_sdk->GetLocalPlayer(match);
    if (!localPlayer || !game_sdk->Component_GetTransform(localPlayer)) return;

    static float timer = 0.0f;
    
    void* playerTF = game_sdk->Component_GetTransform(localPlayer);
    void* camera = game_sdk->get_camera();
    void* camTF = camera ? game_sdk->Component_GetTransform(camera) : nullptr;
    
    if (timer == 0.0f) {
        Telegogo_originalPosition = ToVvector3(tanghinh::Transform_GetPosition(playerTF));
        
        if (camTF) {
            Vector3 camPos = tanghinh::Transform_GetPosition(camTF);
            Telegogo_originalCameraY = camPos.y;
        }
        
        auto* players = *(Dictionary<uint8_t*, void**>**)((uintptr_t)match + 0xC8);
        if (players && players->getValues()) {
            for (int i = 0; i < players->getNumValues(); i++) {
                void* enemy = players->getValues()[i];
                if (!enemy || enemy == localPlayer) continue;
                
                void* enemyTF = game_sdk->Component_GetTransform(enemy);
                if (enemyTF) {
                    Vector3 enemyPos = tanghinh::Transform_GetPosition(enemyTF);
                    Telegogo_enemyOriginalY[enemy] = enemyPos.y;
                }
            }
        }
        Telegogo_needsRestore = true;
        phaseCompleted = false;
    }

    timer += ImGui::GetIO().DeltaTime;

    if (timer <= 0.5f) {
        if (camTF) {
            Vector3 camPos = tanghinh::Transform_GetPosition(camTF);
            camPos.y = Telegogo_originalCameraY - 3.0f;
            tanghinh::Transform_SetPosition(camTF, ToVvector3(camPos));
        }
        
        auto* players = *(Dictionary<uint8_t*, void**>**)((uintptr_t)match + 0xC8);
        if (players && players->getValues()) {
            for (int i = 0; i < players->getNumValues(); i++) {
                void* enemy = players->getValues()[i];
                if (!enemy || enemy == localPlayer) continue;
                
                void* enemyTF = game_sdk->Component_GetTransform(enemy);
                if (enemyTF && Telegogo_enemyOriginalY.find(enemy) != Telegogo_enemyOriginalY.end()) {
                    Vector3 enemyPos = tanghinh::Transform_GetPosition(enemyTF);
                    enemyPos.y = Telegogo_enemyOriginalY[enemy] - 2.0f;
                    tanghinh::Transform_SetPosition(enemyTF, ToVvector3(enemyPos));
                }
            }
        }
        
        isUnderground = true;
        phaseCompleted = false;
    } 
    else if (timer <= 1.0f) {
        if (camTF) {
            Vector3 camPos = tanghinh::Transform_GetPosition(camTF);
            camPos.y = Telegogo_originalCameraY;
            tanghinh::Transform_SetPosition(camTF, ToVvector3(camPos));
        }
        
        auto* players = *(Dictionary<uint8_t*, void**>**)((uintptr_t)match + 0xC8);
        if (players && players->getValues()) {
            for (int i = 0; i < players->getNumValues(); i++) {
                void* enemy = players->getValues()[i];
                if (!enemy || enemy == localPlayer) continue;
                
                void* enemyTF = game_sdk->Component_GetTransform(enemy);
                if (enemyTF && Telegogo_enemyOriginalY.find(enemy) != Telegogo_enemyOriginalY.end()) {
                    Vector3 enemyPos = tanghinh::Transform_GetPosition(enemyTF);
                    enemyPos.y = Telegogo_enemyOriginalY[enemy];
                    tanghinh::Transform_SetPosition(enemyTF, ToVvector3(enemyPos));
                }
            }
        }
        
        isUnderground = false;
        phaseCompleted = true;
    }
    else {
        timer = 0.0f;
    }
}

void ProcessTeleEnmy() {
    if (!Vars.TeleEnmy) return;

    void* match = game_sdk->Curent_Match();
    if (!match) return;

    void* localPlayer = game_sdk->GetLocalPlayer(match);
    if (!localPlayer) return;

    auto* players = *(Dictionary<uint8_t*, void**>**)((uintptr_t)match + 0xC8);
    if (!players || !players->getValues()) return;

    void* playerTF = game_sdk->Component_GetTransform(localPlayer);
    if (!playerTF) return;

    Vector3 playerPos = tanghinh::Transform_GetPosition(playerTF);
    Vector3 playerForward = game_sdk->GetForward(playerTF);

    for (int i = 0; i < players->getNumValues(); i++) {
        void* enemy = players->getValues()[i];
        
        if (!enemy || enemy == localPlayer || game_sdk->get_isLocalTeam(enemy)) continue;
        if (game_sdk->get_IsDieing(enemy)) continue;

        void* enemyTF = game_sdk->Component_GetTransform(enemy);
        if (!enemyTF) continue;

        Vector3 enemyPos = tanghinh::Transform_GetPosition(enemyTF);
        
        float dx = playerPos.x - enemyPos.x;
        float dz = playerPos.z - enemyPos.z;
        float distance = sqrt(dx*dx + dz*dz);

        if (distance >= 1.0f && distance <= Vars.TeleEnmyDistance) {
            float sideOffset = 0.8f;
            Vector3 sidePos = {
                playerPos.x + (playerForward.z * sideOffset),
                enemyPos.y,
                playerPos.z - (playerForward.x * sideOffset)
            };

            Vector3 currentEnemyPos = tanghinh::Transform_GetPosition(enemyTF);
            Vector3 smoothedPos = {
                currentEnemyPos.x + (sidePos.x - currentEnemyPos.x) * 0.5f,
                sidePos.y,
                currentEnemyPos.z + (sidePos.z - currentEnemyPos.z) * 0.5f
            };

            Vvector3 newPos = {
                smoothedPos.x,
                smoothedPos.y,
                smoothedPos.z
            };
            tanghinh::Transform_SetPosition(enemyTF, newPos);
        }
    }
}

void ProcessSmoothHorizontalTeleport() {
    if (!isSmoothTeleportActive) return;

    void* match = game_sdk->Curent_Match();
    if (!match) return;

    void* localPlayer = game_sdk->GetLocalPlayer(match);
    if (!localPlayer || !game_sdk->Component_GetTransform(localPlayer)) return;

    void* playerTF = game_sdk->Component_GetTransform(localPlayer);
    Vector3 currentPos = tanghinh::Transform_GetPosition(playerTF);

    smoothTeleportProgress += ImGui::GetIO().DeltaTime * smoothTeleportSpeed;
    
    Vector3 newPos;
    if (smoothTeleportProgress >= 1.0f) {
        newPos = smoothTeleportTarget;
        isSmoothTeleportActive = false;
    } else {
        newPos = Vector3::Lerp(currentPos, smoothTeleportTarget, smoothTeleportProgress);
    }

    tanghinh::Transform_SetPosition(playerTF, Vvector3{newPos.x, newPos.y, newPos.z});

    float remainingDistance = Vector3::Distance(newPos, smoothTeleportTarget);
    if (remainingDistance < 0.1f) {
        isSmoothTeleportActive = false;
    }
}

void InstantHorizontalTeleport() {
    void* match = game_sdk->Curent_Match();
    if (!match) return;

    void* localPlayer = game_sdk->GetLocalPlayer(match);
    if (!localPlayer || !game_sdk->Component_GetTransform(localPlayer)) return;

    void* closestEnemy = nullptr;
    float closestDistance = FLT_MAX;

    auto* players = *(Dictionary<uint8_t*, void**>**)((uintptr_t)match + 0xC8);
    if (!players || !players->getValues()) return;

    Vector3 playerPos = tanghinh::Transform_GetPosition(game_sdk->Component_GetTransform(localPlayer));

    for (int i = 0; i < players->getNumValues(); i++) {
        void* enemy = players->getValues()[i];
        if (!enemy || enemy == localPlayer) continue;
        if (game_sdk->get_isLocalTeam(enemy)) continue;
        if (game_sdk->get_IsDieing(enemy)) continue;

        Vector3 enemyPos = tanghinh::Transform_GetPosition(game_sdk->Component_GetTransform(enemy));
        float distance = Vector3::Distance(playerPos, enemyPos);

        if (distance < closestDistance) {
            closestDistance = distance;
            closestEnemy = enemy;
        }
    }

    if (closestEnemy) {
        Vector3 enemyPos = tanghinh::Transform_GetPosition(game_sdk->Component_GetTransform(closestEnemy));
        
        Vvector3 newPos = {
            enemyPos.x,
            playerPos.y,
            enemyPos.z
        };
        
        tanghinh::Transform_SetPosition(game_sdk->Component_GetTransform(localPlayer), newPos);
    }
}

void ProcessTelekill() {
    if (!Vars.Telekill) return;

    void* match = game_sdk->Curent_Match();
    if (!match) return;

    void* localPlayer = game_sdk->GetLocalPlayer(match);
    if (!localPlayer || !game_sdk->Component_GetTransform(localPlayer)) return;

    auto* players = *(Dictionary<uint8_t*, void**>**)((uintptr_t)match + 0xC8);
    if (!players || !players->getValues()) return;

    for (int i = 0; i < players->getNumValues(); i++) {
        void* enemy = players->getValues()[i];
        if (!enemy || enemy == localPlayer) continue;
        if (game_sdk->get_isLocalTeam(enemy)) continue;
        if (game_sdk->get_IsDieing(enemy)) continue;

        Vector3 enemyPos = tanghinh::Transform_GetPosition(game_sdk->Component_GetTransform(enemy));
        Vector3 playerPos = tanghinh::Transform_GetPosition(game_sdk->Component_GetTransform(localPlayer));
        
        Vvector3 newPos = {
            enemyPos.x + Vars.TeleportOffset,
            playerPos.y,
            enemyPos.z + Vars.TeleportOffset
        };
        
        tanghinh::Transform_SetPosition(game_sdk->Component_GetTransform(localPlayer), newPos);

        Vars.Telekill = false;
    }
}

bool ShouldAimNow(void* localPlayer, int aimWhen) {
    switch(aimWhen) {
        case 0: return true;
        case 1: return game_sdk->get_IsFiring(localPlayer);
        case 2: return game_sdk->get_IsSighting(localPlayer);
        default: return false;
    }
}

void ProcessAimbot() {
    if (!Vars.Aimbot) return;

    void* CurrentMatch = game_sdk->Curent_Match();
    if (!CurrentMatch) return;

    void* LocalPlayer = game_sdk->GetLocalPlayer(CurrentMatch);
    if (!LocalPlayer || !game_sdk->Component_GetTransform(LocalPlayer)) return;
    if (game_sdk->get_IsDieing(LocalPlayer)) return;

    static void* targetEnemy = nullptr;
    static float lastTargetChangeTime = 0.0f;
    float currentTime = ImGui::GetTime();

    if (targetEnemy && (currentTime - lastTargetChangeTime >= 4.0f || !IsValidTarget(targetEnemy, LocalPlayer))) {
        targetEnemy = nullptr;
    }

    if (!targetEnemy) {
        targetEnemy = GetClosestEnemy();
        if (targetEnemy) {
            lastTargetChangeTime = currentTime;
        }
    }

    if (targetEnemy && IsValidTarget(targetEnemy, LocalPlayer) && ShouldAimNow(LocalPlayer, Vars.AimWhen)) {
        Vector3 EnemyLocation = GetHeadPosition(targetEnemy);
        Vector3 PlayerLocation = CameraMain(LocalPlayer);
        
        if (EnemyLocation != Vector3::zero() && PlayerLocation != Vector3::zero()) {
            Quaternion PlayerLook = GetRotationToTheLocation(EnemyLocation, 0.1f, PlayerLocation);
            game_sdk->set_aim(LocalPlayer, PlayerLook);
            
            if (Vars.aimkill) {
                PlayerTakeDamage(targetEnemy);
            }
        }
    }
}


void get_players() {
    ImDrawList *draw_list = ImGui::GetBackgroundDrawList();
    int numberOfPlayersAround = 0;
    
    if (!draw_list)
        return;
    if (!Vars.Enable)
        return;

    try {

        ProcessAimbot();
        ProcessAimKill();
        ProcessAutoTroca();
        ProcessTeleEnmy();
        ProcessMasskill();
        ProcessTelekill();
        ProcessTelegogo();
        ProcessSmoothHorizontalTeleport();
        
        void *current_Match = game_sdk->Curent_Match();
        if (!current_Match)
            return;

        void *local_player = game_sdk->GetLocalPlayer(current_Match);
        if (!local_player)
            return;

        Dictionary<uint8_t *, void **> *players = *(Dictionary<uint8_t *, void **> **)((long)current_Match + 0xC8);
        if (!players || !players->getValues())
            return;

        void *camera = game_sdk->get_camera();
        if (!camera)
            return;

        for (int u = 0; u < players->getNumValues(); u++) {
            void *closestEnemy = players->getValues()[u];
            if (!closestEnemy || 
                !game_sdk->Component_GetTransform(closestEnemy) || 
                closestEnemy == local_player || 
                !game_sdk->get_MaxHP(closestEnemy) || 
                game_sdk->get_isLocalTeam(closestEnemy)) {
                continue;
            }
            numberOfPlayersAround++;

            Vector3 pos = getPosition(closestEnemy);
            Vector3 pos2 = getPosition(local_player);
            float distance = Vector3::Distance(pos, pos2);
            if (distance > 200.0f)
                continue;

            bool isEnemyDead = game_sdk->get_IsDieing(closestEnemy);
            bool isEnemyVisible = tanghinh::isVisible(closestEnemy);

            bool w2sc;
            ImVec2 top_pos = Camera$$WorldToScreen::Regular(pos + Vector3(0, 1.6, 0));
            ImVec2 bot_pos = Camera$$WorldToScreen::Regular(pos);
            ImVec2 pos_3 = Camera$$WorldToScreen::Checker(pos, w2sc);
            auto pmtXtop = top_pos.x;
            auto pmtXbottom = bot_pos.x;
            if (top_pos.x > bot_pos.x) {
                pmtXtop = bot_pos.x;
                pmtXbottom = top_pos.x;
            }
            Camera$$WorldToScreen::Checker(pos + Vector3(0, 0.75f, 0), w2sc);
            float calculatedPosition = fabs((top_pos.y - bot_pos.y) * (0.0092f / 0.019f) / 2);

            ImRect rect(
                ImVec2(pmtXtop - calculatedPosition, top_pos.y),
                ImVec2(pmtXbottom + calculatedPosition, bot_pos.y));
            const auto &viewpos = game_sdk->get_position(game_sdk->Component_GetTransform(game_sdk->get_camera()));

            if (w2sc) {

                if (Vars.lines) {
                    float centerX = ImGui::GetIO().DisplaySize.x / 2.0f;
                    ImVec2 start;
                    if (Vars.LineStyle == 0) {
                        start = ImVec2(centerX, 15.0f);
                    }
                    else {
                        start = ImVec2(centerX, ImGui::GetIO().DisplaySize.y - 15.0f);
                    }
                    ImVec2 end = ImVec2(rect.GetCenter().x, rect.Min.y);
                    DrawLine(draw_list, start, end, 1.0f, isEnemyDead, isEnemyVisible);
                }


                if (Vars.Box) {
                    ImColor boxColor = isEnemyDead ? ImColor(espi) : isEnemyVisible ? ImColor(espv) : ImColor(espi);

                    if (Vars.BoxStyle == 0) {
                        draw_list->AddRect(rect.Min, rect.Max, boxColor, 0.0f, 0, 1.0f);
                    }
                    else if (Vars.BoxStyle == 1) {
                        DrawCornerBox(draw_list, rect.Min, rect.Max, boxColor, 1.0f);
                    }
                    else if (Vars.BoxStyle == 2) {
                        DrawRoundBox(draw_list, rect.Min, rect.Max, boxColor, 1.0f);
                    }

                    if (Vars.Outline) {
                        draw_list->AddRect(rect.Min - ImVec2(1, 1), rect.Max + ImVec2(1, 1), ImColor(0, 0, 0));
                        draw_list->AddRect(rect.Min + ImVec2(1, 1), rect.Max - ImVec2(1, 1), ImColor(0, 0, 0));
                    }
                }


                if (Vars.Health) {
                    auto health = game_sdk->GetHp(closestEnemy);
                    auto maxhealth = game_sdk->get_MaxHP(closestEnemy);

                    float health_multiplier = (float)health / (float)maxhealth;
                    if (health_multiplier < 0) health_multiplier = 0;
                    if (health_multiplier > 1) health_multiplier = 1;

                    float health_bar_pos;

                    if (Vars.HealthPos == 0) {
                        health_bar_pos = rect.Min.x - 4;
                    }
                    else {
                        health_bar_pos = rect.Max.x + 4;
                    }

                    DrawHealthBar(
                        draw_list,
                        ImVec2(health_bar_pos, rect.Min.y - 1),
                        ImVec2(health_bar_pos, rect.Max.y),
                        health_multiplier,
                        3.0f,
                        isEnemyDead
                    );
                }


                if (Vars.Name) {
                    auto pname = game_sdk->name(closestEnemy);
                    std::string names = "null";
                    if (pname)
                        names = pname->toCPPString();

                    std::transform(names.begin(), names.end(), names.begin(), ::tolower);
                    std::string name = names;

                    ImVec2 text_size = verdana_smol->CalcTextSizeA(8, FLT_MAX, 0, names.c_str());
                    ImVec2 name_pos = {
                        rect.Min.x + (rect.GetWidth() / 2) - text_size.x / 2,
                        rect.Min.y - 2 - text_size.y
                    };

                    ImDrawList* draw = ImGui::GetForegroundDrawList();

                    if (Vars.NameStyle == 1) { 
                        ImVec2 bg_min = name_pos - ImVec2(2, 2);
                        ImVec2 bg_max = name_pos + text_size + ImVec2(2, 2);
                        draw->AddRectFilled(bg_min, bg_max, ImColor(0, 0, 0, 150), 3.0f);
                    }

                    draw->AddText(
                        verdana_smol,
                        8,
                        name_pos,
                        ImColor(nameColor),
                        name.c_str()
                    );
                }


                if (Vars.Distance) {
                    std::string distancestr = fmt::format("{}M", static_cast<int>(distance));
                    ImVec2 distance_pos = {
                        rect.Max.x + 4,
                        rect.Min.y};
                    AddText(verdana_smol, 8, false, false, distance_pos, ImColor(distanceColor), distancestr.c_str());
                }


                if (Vars.skeleton) {
                    DrawSkeleton(closestEnemy, draw_list);
                }
            }

            if (Vars.OOF) {
                if ((pos_3.x < 0 || pos_3.x > ImGui::GetIO().DisplaySize.x) || 
                    (pos_3.y < 0 || pos_3.y > ImGui::GetIO().DisplaySize.y) || !w2sc) {
                    
                    constexpr int maxpixels = 150;
                    int pixels = maxpixels;
                    if (w2sc) {
                        if (pos_3.x < 0)
                            pixels = std::clamp((int)-pos_3.x, 0, (int)maxpixels);
                        if (pos_3.y < 0)
                            pixels = std::clamp((int)-pos_3.y, 0, (int)maxpixels);

                        if (pos_3.x > ImGui::GetIO().DisplaySize.x)
                            pixels = std::clamp((int)pos_3.x - (int)ImGui::GetIO().DisplaySize.x, 0, (int)maxpixels);
                        if (pos_3.y > ImGui::GetIO().DisplaySize.y)
                            pixels = std::clamp((int)pos_3.y - (int)ImGui::GetIO().DisplaySize.y, 0, (int)maxpixels);
                    }

                    float opacity = (float)pixels / (float)maxpixels;

                    float size = 3.5f;
                    Vector3 viewdir = game_sdk->GetForward(game_sdk->Component_GetTransform(game_sdk->get_camera()));
                    Vector3 targetdir = Vector3::Normalized(pos - viewpos);

                    float viewangle = atan2(viewdir.z, viewdir.x) * 57.2958f;
                    float targetangle = atan2(targetdir.z, targetdir.x) * 57.2958f;

                    if (viewangle < 0)
                        viewangle += 360;
                    if (targetangle < 0)
                        targetangle += 360;

                    float angle = targetangle - viewangle;

                    while (angle < 0)
                        angle += 360;
                    while (angle > 360)
                        angle -= 360;

                    angle = 360 - angle;
                    angle -= 90;

                }
            }
        }

        if (Vars.counts) {
            ImVec2 numberPosition(ImGui::GetIO().DisplaySize.x / 2.0f, 12);
            std::string countText = "Inimigos: " + std::to_string(numberOfPlayersAround);
            ImVec2 textSize = verdana_smol->CalcTextSizeA(25.0f, FLT_MAX, 0, countText.c_str());
            ImVec2 textPos(
                numberPosition.x - textSize.x / 2.0f,
                numberPosition.y
            );

            draw_list->AddText(verdana_smol, 25.0f, textPos, ImColor(255, 255, 255, 255), countText.c_str());
        }

    } catch (...) {
        return;
    }
}

void aimbot() {
    if (!Vars.Aimbot) return;

    ImVec2 center = ImVec2(ImGui::GetIO().DisplaySize.x / 2, ImGui::GetIO().DisplaySize.y / 2);
    ImDrawList* draw_list = ImGui::GetBackgroundDrawList();
    if (!draw_list) return;

    if (Vars.isAimFov) {
        if (Vars.fovaimglow) {
            drawcircleglow(draw_list, center, Vars.AimFov, 
                          ImColor(Vars.fovLineColor[0], Vars.fovLineColor[1], 
                          Vars.fovLineColor[2], Vars.fovLineColor[3]), 
                          999, 1, 12);
        } else {
            draw_list->AddCircle(center, Vars.AimFov, 
                                ImColor(Vars.fovLineColor[0], Vars.fovLineColor[1], 
                                Vars.fovLineColor[2], Vars.fovLineColor[3]), 100);
        }
    }

    void* Match = game_sdk->Curent_Match();
    if (!Match) return;

    void* LocalPlayer = game_sdk->GetLocalPlayer(Match);
    if (!LocalPlayer) return;

    void* playertarget = GetClosestEnemy();
    if (!playertarget) return;

    ImVec2 EnemyLocation = Camera$$WorldToScreen::Regular(GetHeadPosition(playertarget));
    drawlineglow(draw_list, ImVec2(center.x, center.y), EnemyLocation, 
                ImColor(255, 255, 255), 1, 3);
}