void *DamageInfo = nullptr;
void DamageInfoHook(void* Player){
 DamageInfo = Player;
}

void StartAimKill(void* targetVivo) 
{ 
    if (playertakedamage) 
    { 
        void *LocalPlayer = get_CurrentLocalPlayer(); 
        if (LocalPlayer != NULL) { 
            void *weaponOnHand = GetWeaponOnHand(LocalPlayer); 
            if (weaponOnHand != nullptr) 
            { 
                //LOGI("weaponOnHand"); 
                static bool s_Il2CppMethodIntialized; 
                if (!s_Il2CppMethodIntialized) 
                { 
                    ((void (*)(void *,void*))getRealOffset(0x104B1A97C))(weaponOnHand, *(void**)((uint64_t)LocalPlayer + 0xBC0)); 
                    ((void* (*)(void *))getRealOffset(0x105F5521C))(LocalPlayer); 
                    s_Il2CppMethodIntialized = true; 
                } 
 
                void* targetEnemy = nullptr; 
                targetEnemy = targetVivo; 
 
                if (targetEnemy != nullptr) 
                { 
 
                    void *ObjectPool = *(void **)((uintptr_t)LocalPlayer + 0xBC0); 
                    if(ObjectPool != nullptr) 
                    { 
                        ((void (*)(void *,void*))getRealOffset(0x1060F4708))(LocalPlayer, weaponOnHand); 
                        auto weaponDataID = *(uint32_t*)((uint64_t)*(void**)((uint64_t)weaponOnHand + 0x90) + 0x10); 
                        auto baseDamage = GetDamage(weaponOnHand); 
                        auto playerID = GetplayerID(LocalPlayer); 
                        auto DamageS2c = (message_CHDLJFJCPFN_o *)((void* (*)(void *))getRealOffset(0x105F5521C))(LocalPlayer); 
                        if (DamageS2c) 
                        { 

 
                                if (DamageInfo) 
                                { 
                                   get_StartFiring(LocalPlayer, weaponOnHand); 
                                    *(int*)((char*)DamageInfo + 0x10) = baseDamage; 
                                    *(int*)((char*)DamageInfo + 0x14) = 1; 
                                    *(void**)((char*)DamageInfo + 0x40) = weaponOnHand; 
                                    *(int*)((char*)DamageInfo + 0x48) = weaponDataID; 
                                    *(COW_GamePlay_IHAAMHPPLMG_o *)((char*)DamageInfo + 0x28) = playerID; 
                                    void *JEEIBOEGGPD = *(void**)((uint64_t)LocalPlayer + 0xBC0); 
                                    *(void**)((uint64_t)JEEIBOEGGPD + string2Offset(OBFUSCATE("0x18"))) = get_gameObject(get_HeadCollider(targetEnemy)); 
                                    *(void**)((uint64_t)JEEIBOEGGPD + string2Offset(OBFUSCATE("0x20"))) = get_HeadCollider(targetEnemy); 
                                    *(int*)((uint64_t)JEEIBOEGGPD + 0x64) = 1; 
                                    monoList<float *> *CheckParametros = LCLHHHKFCFP(GetWeaponOnHand(LocalPlayer),GKHECDLGAJA(LocalPlayer,*(void**)((uint64_t)LocalPlayer + 0xBC0)),get_HeadCollider(targetEnemy),false,DamageInfo); 
 
                                    Player_TakeDamage(targetEnemy, baseDamage, playerID, DamageInfo, weaponDataID, GetHeadPosition(LocalPlayer), GetHeadPosition(targetEnemy), CheckParametros, CheckParametros, 0); 
                                } 
                            } 
                        } 
                    } 
                } 
            } 
        } 
    } 
    return; 
}