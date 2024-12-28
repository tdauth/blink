globals
//globals from Blink:
constant boolean LIBRARY_Blink=true
//endglobals from Blink
    // User-defined
timer udg_Timer= null
timerdialog udg_TimerWindow= null
player udg_Hunter= null
unit array udg_Hero
force udg_Captured= null
integer udg_PlayerCount= 0
integer array udg_PlayerWins
leaderboard udg_Leaderboard= null
force udg_Players= null
group udg_Heroes= null
integer udg_Rounds= 0

    // Generated
trigger gg_trg_Initialization= null
trigger gg_trg_Blink_Point= null
trigger gg_trg_Blink_Target= null
trigger gg_trg_Start= null
unit gg_unit_E000_0001= null
unit gg_unit_E000_0002= null
unit gg_unit_E000_0003= null
unit gg_unit_E000_0004= null
unit gg_unit_E000_0005= null
unit gg_unit_E000_0006= null
trigger gg_trg_Hunt_Starts= null
trigger gg_trg_Hunt_Delay= null
trigger gg_trg_Hunt_Ends_Time= null
trigger gg_trg_Hunt_Update= null
trigger gg_trg_Hunt_Ends_Win= null
trigger gg_trg_Hunt_Ends= null
trigger gg_trg_Player_Leaves= null
trigger gg_trg_Hunt_AI_Update= null


//JASSHelper struct globals:

endglobals


//library Blink:

function CaptureEffect takes unit whichUnit returns nothing
    local effect e= AddSpecialEffectTarget("Doodads\\Cinematic\\Lightningbolt\\Lightningbolt.mdl", whichUnit, "origin")
    call TriggerSleepAction(2.0)
    call DestroyEffect(e)
    set e=null
endfunction


//library Blink ends
//===========================================================================
// 
// Blink 1.0
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Map Author: Baradé
// 
//===========================================================================

//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************


function InitGlobals takes nothing returns nothing
    local integer i= 0
    set udg_Timer=CreateTimer()
    set udg_Captured=CreateForce()
    set udg_PlayerCount=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_PlayerWins[i]=0
        set i=i + 1
    endloop

    set udg_Players=CreateForce()
    set udg_Heroes=CreateGroup()
    set udg_Rounds=0
endfunction

//***************************************************************************
//*
//*  Custom Script Code
//*
//***************************************************************************
//***************************************************************************
//*  Blink

//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************

//===========================================================================
function CreateUnitsForPlayer0 takes nothing returns nothing
    local player p= Player(0)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set gg_unit_E000_0001=BlzCreateUnitWithSkin(p, 'E000', 1744.2, - 2261.5, 128.390, 'E000')
endfunction

//===========================================================================
function CreateUnitsForPlayer1 takes nothing returns nothing
    local player p= Player(1)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set gg_unit_E000_0002=BlzCreateUnitWithSkin(p, 'E000', 2040.7, - 2260.4, 19.886, 'E000')
endfunction

//===========================================================================
function CreateUnitsForPlayer2 takes nothing returns nothing
    local player p= Player(2)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set gg_unit_E000_0003=BlzCreateUnitWithSkin(p, 'E000', 2297.3, - 2274.0, 227.050, 'E000')
endfunction

//===========================================================================
function CreateUnitsForPlayer3 takes nothing returns nothing
    local player p= Player(3)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set gg_unit_E000_0004=BlzCreateUnitWithSkin(p, 'E000', 1749.8, - 2464.1, 263.153, 'E000')
endfunction

//===========================================================================
function CreateUnitsForPlayer4 takes nothing returns nothing
    local player p= Player(4)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set gg_unit_E000_0005=BlzCreateUnitWithSkin(p, 'E000', 2045.0, - 2452.3, 354.155, 'E000')
endfunction

//===========================================================================
function CreateUnitsForPlayer5 takes nothing returns nothing
    local player p= Player(5)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set gg_unit_E000_0006=BlzCreateUnitWithSkin(p, 'E000', 2301.1, - 2448.4, 258.571, 'E000')
endfunction

//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
endfunction

//===========================================================================
function CreatePlayerUnits takes nothing returns nothing
    call CreateUnitsForPlayer0()
    call CreateUnitsForPlayer1()
    call CreateUnitsForPlayer2()
    call CreateUnitsForPlayer3()
    call CreateUnitsForPlayer4()
    call CreateUnitsForPlayer5()
endfunction

//===========================================================================
function CreateAllUnits takes nothing returns nothing
    call CreatePlayerBuildings()
    call CreatePlayerUnits()
endfunction

//***************************************************************************
//*
//*  Triggers
//*
//***************************************************************************

//===========================================================================
// Trigger: Initialization
//===========================================================================
function Trig_Initialization_Actions takes nothing returns nothing
    call MeleeStartingVisibility()
    call MeleeStartingHeroLimit()
    call FogEnableOff()
    call FogMaskEnableOff()
    set udg_Hero[1]=gg_unit_E000_0001
    set udg_Hero[2]=gg_unit_E000_0002
    set udg_Hero[3]=gg_unit_E000_0003
    set udg_Hero[4]=gg_unit_E000_0004
    set udg_Hero[5]=gg_unit_E000_0005
    set udg_Hero[6]=gg_unit_E000_0006
endfunction

//===========================================================================
function InitTrig_Initialization takes nothing returns nothing
    set gg_trg_Initialization=CreateTrigger()
    call TriggerAddAction(gg_trg_Initialization, function Trig_Initialization_Actions)
endfunction

//===========================================================================
// Trigger: Blink Point
//===========================================================================
function Trig_Blink_Point_Func002C takes nothing returns boolean
    if ( ( GetIssuedOrderIdBJ() == String2OrderIdBJ("move") ) ) then
        return true
    endif
    if ( ( GetIssuedOrderIdBJ() == String2OrderIdBJ("smart") ) ) then
        return true
    endif
    return false
endfunction

function Trig_Blink_Point_Conditions takes nothing returns boolean
    if ( not Trig_Blink_Point_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_Blink_Point_Actions takes nothing returns nothing
    call IssuePointOrderLocBJ(GetTriggerUnit(), "blink", GetOrderPointLoc())
endfunction

//===========================================================================
function InitTrig_Blink_Point takes nothing returns nothing
    set gg_trg_Blink_Point=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Blink_Point, EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER)
    call TriggerAddCondition(gg_trg_Blink_Point, Condition(function Trig_Blink_Point_Conditions))
    call TriggerAddAction(gg_trg_Blink_Point, function Trig_Blink_Point_Actions)
endfunction

//===========================================================================
// Trigger: Blink Target
//===========================================================================
function Trig_Blink_Target_Conditions takes nothing returns boolean
    if ( not ( GetIssuedOrderIdBJ() == String2OrderIdBJ("smart") ) ) then
        return false
    endif
    return true
endfunction

function Trig_Blink_Target_Func001C takes nothing returns boolean
    if ( not ( GetOrderTargetUnit() != null ) ) then
        return false
    endif
    return true
endfunction

function Trig_Blink_Target_Actions takes nothing returns nothing
    if ( Trig_Blink_Target_Func001C() ) then
        call IssuePointOrderLocBJ(GetTriggerUnit(), "blink", GetUnitLoc(GetOrderTargetUnit()))
    else
        call DoNothing()
    endif
endfunction

//===========================================================================
function InitTrig_Blink_Target takes nothing returns nothing
    set gg_trg_Blink_Target=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Blink_Target, EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER)
    call TriggerAddCondition(gg_trg_Blink_Target, Condition(function Trig_Blink_Target_Conditions))
    call TriggerAddAction(gg_trg_Blink_Target, function Trig_Blink_Target_Actions)
endfunction

//===========================================================================
// Trigger: Start
//===========================================================================
function Trig_Start_Func004Func001C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(GetEnumPlayer()) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_Start_Func004A takes nothing returns nothing
    if ( Trig_Start_Func004Func001C() ) then
        call ForceAddPlayerSimple(GetEnumPlayer(), udg_Players)
        set udg_PlayerCount=( udg_PlayerCount + 1 )
        call LeaderboardAddItemBJ(GetEnumPlayer(), udg_Leaderboard, GetPlayerName(GetEnumPlayer()), 0)
        call SelectUnitForPlayerSingle(udg_Hero[GetConvertedPlayerId(GetEnumPlayer())], GetEnumPlayer())
    else
        call DoNothing()
    endif
endfunction

function Trig_Start_Func005Func001C takes nothing returns boolean
    if ( not ( IsPlayerInForce(ConvertedPlayer(GetForLoopIndexA()), udg_Players) == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_Start_Func006Func001A takes nothing returns nothing
    call CustomDefeatBJ(GetEnumPlayer(), "TRIGSTR_024")
endfunction

function Trig_Start_Func006C takes nothing returns boolean
    if ( not ( udg_PlayerCount > 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Start_Actions takes nothing returns nothing
    call CreateLeaderboardBJ(GetPlayersAll(), "TRIGSTR_023")
    set udg_Leaderboard=GetLastCreatedLeaderboard()
    call LeaderboardSetLabelBJ(udg_Leaderboard, ( "Score (" + ( I2S(udg_Rounds) + " rounds played)" ) ))
    call ForForce(GetPlayersAll(), function Trig_Start_Func004A)
    set bj_forLoopAIndex=1
    set bj_forLoopAIndexEnd=6
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if ( Trig_Start_Func005Func001C() ) then
            call RemoveUnit(udg_Hero[GetForLoopIndexA()])
            set udg_Hero[GetForLoopIndexA()]=null
        else
            call GroupAddUnitSimple(udg_Hero[GetForLoopIndexA()], udg_Heroes)
        endif
        set bj_forLoopAIndex=bj_forLoopAIndex + 1
    endloop
    if ( Trig_Start_Func006C() ) then
        call ConditionalTriggerExecute(gg_trg_Hunt_Delay)
    else
        call ForForce(udg_Players, function Trig_Start_Func006Func001A)
    endif
endfunction

//===========================================================================
function InitTrig_Start takes nothing returns nothing
    set gg_trg_Start=CreateTrigger()
    call TriggerRegisterTimerEventSingle(gg_trg_Start, 0.00)
    call TriggerAddAction(gg_trg_Start, function Trig_Start_Actions)
endfunction

//===========================================================================
// Trigger: Player Leaves
//===========================================================================
function Trig_Player_Leaves_Actions takes nothing returns nothing
    set udg_PlayerCount=( udg_PlayerCount - 1 )
    call ForceRemovePlayerSimple(GetTriggerPlayer(), udg_Players)
    call GroupRemoveUnitSimple(udg_Hero[GetForLoopIndexA()], udg_Heroes)
endfunction

//===========================================================================
function InitTrig_Player_Leaves takes nothing returns nothing
    set gg_trg_Player_Leaves=CreateTrigger()
    call TriggerRegisterPlayerEventLeave(gg_trg_Player_Leaves, Player(0))
    call TriggerRegisterPlayerEventLeave(gg_trg_Player_Leaves, Player(1))
    call TriggerRegisterPlayerEventLeave(gg_trg_Player_Leaves, Player(2))
    call TriggerRegisterPlayerEventLeave(gg_trg_Player_Leaves, Player(3))
    call TriggerRegisterPlayerEventLeave(gg_trg_Player_Leaves, Player(4))
    call TriggerRegisterPlayerEventLeave(gg_trg_Player_Leaves, Player(5))
    call TriggerAddAction(gg_trg_Player_Leaves, function Trig_Player_Leaves_Actions)
endfunction

//===========================================================================
// Trigger: Hunt AI Update
//===========================================================================
function Trig_Hunt_AI_Update_Func001Func001Func002C takes nothing returns boolean
    if ( not ( udg_Hunter == GetEnumPlayer() ) ) then
        return false
    endif
    return true
endfunction

function Trig_Hunt_AI_Update_Func001Func001C takes nothing returns boolean
    if ( not ( GetPlayerController(GetEnumPlayer()) == MAP_CONTROL_COMPUTER ) ) then
        return false
    endif
    return true
endfunction

function Trig_Hunt_AI_Update_Func001A takes nothing returns nothing
    if ( Trig_Hunt_AI_Update_Func001Func001C() ) then
        if ( Trig_Hunt_AI_Update_Func001Func001Func002C() ) then
            call IssuePointOrderLocBJ(udg_Hero[GetConvertedPlayerId(GetEnumPlayer())], "blink", GetRandomLocInRect(GetPlayableMapRect()))
        else
            call IssuePointOrderLocBJ(udg_Hero[GetConvertedPlayerId(GetEnumPlayer())], "blink", GetRandomLocInRect(GetPlayableMapRect()))
        endif
    else
        call DoNothing()
    endif
endfunction

function Trig_Hunt_AI_Update_Actions takes nothing returns nothing
    call ForForce(udg_Players, function Trig_Hunt_AI_Update_Func001A)
endfunction

//===========================================================================
function InitTrig_Hunt_AI_Update takes nothing returns nothing
    set gg_trg_Hunt_AI_Update=CreateTrigger()
    call DisableTrigger(gg_trg_Hunt_AI_Update)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Hunt_AI_Update, 2)
    call TriggerAddAction(gg_trg_Hunt_AI_Update, function Trig_Hunt_AI_Update_Actions)
endfunction

//===========================================================================
// Trigger: Hunt Update
//===========================================================================
function Trig_Hunt_Update_Func002001003001 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_HERO) == true )
endfunction

function Trig_Hunt_Update_Func002001003002001 takes nothing returns boolean
    return ( GetOwningPlayer(GetFilterUnit()) != udg_Hunter )
endfunction

function Trig_Hunt_Update_Func002001003002002001 takes nothing returns boolean
    return ( IsPlayerInForce(GetOwningPlayer(GetFilterUnit()), udg_Captured) == false )
endfunction

function Trig_Hunt_Update_Func002001003002002002 takes nothing returns boolean
    return ( true == true )
endfunction

function Trig_Hunt_Update_Func002001003002002 takes nothing returns boolean
    return GetBooleanAnd((IsPlayerInForce(GetOwningPlayer(GetFilterUnit()), udg_Captured) == false), (true == true)) // INLINED!!
endfunction

function Trig_Hunt_Update_Func002001003002 takes nothing returns boolean
    return GetBooleanAnd((GetOwningPlayer(GetFilterUnit()) != udg_Hunter), (GetBooleanAnd((IsPlayerInForce(GetOwningPlayer(GetFilterUnit()), udg_Captured) == false), (true == true)))) // INLINED!!
endfunction

function Trig_Hunt_Update_Func002001003 takes nothing returns boolean
    return GetBooleanAnd((IsUnitType(GetFilterUnit(), UNIT_TYPE_HERO) == true), (GetBooleanAnd((GetOwningPlayer(GetFilterUnit()) != udg_Hunter), (GetBooleanAnd((IsPlayerInForce(GetOwningPlayer(GetFilterUnit()), udg_Captured) == false), (true == true)))))) // INLINED!!
endfunction

function Trig_Hunt_Update_Func002Func005C takes nothing returns boolean
    if ( not ( CountPlayersInForceBJ(udg_Captured) >= ( udg_PlayerCount - 1 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_Hunt_Update_Func002A takes nothing returns nothing
    call PauseUnitBJ(true, GetEnumUnit())
    call ForceAddPlayerSimple(GetOwningPlayer(GetEnumUnit()), udg_Captured)
    call LeaderboardSetPlayerItemLabelBJ(GetOwningPlayer(GetEnumUnit()), udg_Leaderboard, ( GetPlayerName(GetOwningPlayer(GetEnumUnit())) + " (Captured)" ))
    call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_FAILED, ( GetPlayerName(GetOwningPlayer(GetEnumUnit())) + " was captured!" ))
    if ( Trig_Hunt_Update_Func002Func005C() ) then
        call ConditionalTriggerExecute(gg_trg_Hunt_Ends_Win)
    else
        call DoNothing()
    endif
    call CaptureEffect(GetEnumUnit())
endfunction

function Trig_Hunt_Update_Actions takes nothing returns nothing
    set bj_wantDestroyGroup=true
    call ForGroupBJ(GetUnitsInRangeOfLocMatching(128.00, GetUnitLoc(udg_Hero[GetConvertedPlayerId(udg_Hunter)]), Condition(function Trig_Hunt_Update_Func002001003)), function Trig_Hunt_Update_Func002A)
endfunction

//===========================================================================
function InitTrig_Hunt_Update takes nothing returns nothing
    set gg_trg_Hunt_Update=CreateTrigger()
    call DisableTrigger(gg_trg_Hunt_Update)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Hunt_Update, 0.03)
    call TriggerAddAction(gg_trg_Hunt_Update, function Trig_Hunt_Update_Actions)
endfunction

//===========================================================================
// Trigger: Hunt Starts
//===========================================================================
function Trig_Hunt_Starts_Actions takes nothing returns nothing
    call DisableTrigger(GetTriggeringTrigger())
    // Delay to not trigger this event again.
    call PolledWait(1.00)
    call ForceClear(udg_Captured)
    call DestroyTimerDialogBJ(udg_TimerWindow)
    call StartTimerBJ(udg_Timer, false, 60.00)
    call CreateTimerDialogBJ(GetLastCreatedTimerBJ(), "TRIGSTR_019")
    set udg_TimerWindow=GetLastCreatedTimerDialogBJ()
    call TimerDialogDisplayBJ(true, GetLastCreatedTimerDialogBJ())
    call EnableTrigger(gg_trg_Hunt_Ends_Time)
    call EnableTrigger(gg_trg_Hunt_Update)
    call EnableTrigger(gg_trg_Hunt_AI_Update)
    call ConditionalTriggerExecute(gg_trg_Hunt_AI_Update)
endfunction

//===========================================================================
function InitTrig_Hunt_Starts takes nothing returns nothing
    set gg_trg_Hunt_Starts=CreateTrigger()
    call DisableTrigger(gg_trg_Hunt_Starts)
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Hunt_Starts, udg_Timer)
    call TriggerAddAction(gg_trg_Hunt_Starts, function Trig_Hunt_Starts_Actions)
endfunction

//===========================================================================
// Trigger: Hunt Ends
//===========================================================================
function Trig_Hunt_Ends_Func008A takes nothing returns nothing
    call LeaderboardSetPlayerItemLabelBJ(GetEnumPlayer(), udg_Leaderboard, GetPlayerName(GetEnumPlayer()))
endfunction

function Trig_Hunt_Ends_Actions takes nothing returns nothing
    call DisableTrigger(gg_trg_Hunt_Update)
    call DisableTrigger(gg_trg_Hunt_Ends_Time)
    call DisableTrigger(gg_trg_Hunt_AI_Update)
    call PauseTimerBJ(true, udg_Timer)
    call DestroyTimerDialogBJ(udg_TimerWindow)
    set udg_Rounds=( udg_Rounds + 1 )
    call LeaderboardSetLabelBJ(udg_Leaderboard, ( "Score (" + ( I2S(udg_Rounds) + " rounds played)" ) ))
    call ForForce(GetPlayersAll(), function Trig_Hunt_Ends_Func008A)
    call ConditionalTriggerExecute(gg_trg_Hunt_Delay)
endfunction

//===========================================================================
function InitTrig_Hunt_Ends takes nothing returns nothing
    set gg_trg_Hunt_Ends=CreateTrigger()
    call TriggerAddAction(gg_trg_Hunt_Ends, function Trig_Hunt_Ends_Actions)
endfunction

//===========================================================================
// Trigger: Hunt Ends Time
//===========================================================================
function Trig_Hunt_Ends_Time_Actions takes nothing returns nothing
    call DisableTrigger(GetTriggeringTrigger())
    call DisplayTextToForce(GetPlayersAll(), "TRIGSTR_022")
    call ConditionalTriggerExecute(gg_trg_Hunt_Ends)
endfunction

//===========================================================================
function InitTrig_Hunt_Ends_Time takes nothing returns nothing
    set gg_trg_Hunt_Ends_Time=CreateTrigger()
    call DisableTrigger(gg_trg_Hunt_Ends_Time)
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Hunt_Ends_Time, udg_Timer)
    call TriggerAddAction(gg_trg_Hunt_Ends_Time, function Trig_Hunt_Ends_Time_Actions)
endfunction

//===========================================================================
// Trigger: Hunt Ends Win
//===========================================================================
function Trig_Hunt_Ends_Win_Actions takes nothing returns nothing
    call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_COMPLETED, "TRIGSTR_020")
    set udg_PlayerWins[GetConvertedPlayerId(udg_Hunter)]=( udg_PlayerWins[GetConvertedPlayerId(udg_Hunter)] + 1 )
    call LeaderboardSetPlayerItemValueBJ(udg_Hunter, udg_Leaderboard, udg_PlayerWins[GetConvertedPlayerId(udg_Hunter)])
    call LeaderboardSortItemsBJ(udg_Leaderboard, bj_SORTTYPE_SORTBYVALUE, false)
    call ConditionalTriggerExecute(gg_trg_Hunt_Ends)
endfunction

//===========================================================================
function InitTrig_Hunt_Ends_Win takes nothing returns nothing
    set gg_trg_Hunt_Ends_Win=CreateTrigger()
    call TriggerAddAction(gg_trg_Hunt_Ends_Win, function Trig_Hunt_Ends_Win_Actions)
endfunction

//===========================================================================
// Trigger: Hunt Delay
//===========================================================================
function Trig_Hunt_Delay_Func009A takes nothing returns nothing
    call PauseUnitBJ(false, GetEnumUnit())
    call SetUnitPositionLocFacingBJ(GetEnumUnit(), GetPlayerStartLocationLoc(GetOwningPlayer(GetEnumUnit())), 270.00)
endfunction

function Trig_Hunt_Delay_Actions takes nothing returns nothing
    call DisableTrigger(GetTriggeringTrigger())
    set udg_Hunter=ForcePickRandomPlayer(udg_Players)
    call LeaderboardSetPlayerItemLabelBJ(udg_Hunter, udg_Leaderboard, ( GetPlayerName(udg_Hunter) + " (Hunter)" ))
    call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_WARNING, ( GetPlayerName(udg_Hunter) + " is the hunter! Avoid being captured by the Wisp!" ))
    call StartTimerBJ(udg_Timer, false, 10.00)
    call CreateTimerDialogBJ(GetLastCreatedTimerBJ(), "TRIGSTR_018")
    set udg_TimerWindow=GetLastCreatedTimerDialogBJ()
    call TimerDialogDisplayBJ(true, GetLastCreatedTimerDialogBJ())
    call ForGroupBJ(udg_Heroes, function Trig_Hunt_Delay_Func009A)
    call EnableTrigger(gg_trg_Hunt_Starts)
endfunction

//===========================================================================
function InitTrig_Hunt_Delay takes nothing returns nothing
    set gg_trg_Hunt_Delay=CreateTrigger()
    call TriggerAddAction(gg_trg_Hunt_Delay, function Trig_Hunt_Delay_Actions)
endfunction

//===========================================================================
function InitCustomTriggers takes nothing returns nothing
    call InitTrig_Initialization()
    call InitTrig_Blink_Point()
    call InitTrig_Blink_Target()
    call InitTrig_Start()
    call InitTrig_Player_Leaves()
    call InitTrig_Hunt_AI_Update()
    call InitTrig_Hunt_Update()
    call InitTrig_Hunt_Starts()
    call InitTrig_Hunt_Ends()
    call InitTrig_Hunt_Ends_Time()
    call InitTrig_Hunt_Ends_Win()
    call InitTrig_Hunt_Delay()
endfunction

//===========================================================================
function RunInitializationTriggers takes nothing returns nothing
    call ConditionalTriggerExecute(gg_trg_Initialization)
endfunction

//***************************************************************************
//*
//*  Players
//*
//***************************************************************************

function InitCustomPlayerSlots takes nothing returns nothing

    // Player 0
    call SetPlayerStartLocation(Player(0), 0)
    call ForcePlayerStartLocation(Player(0), 0)
    call SetPlayerColor(Player(0), ConvertPlayerColor(0))
    call SetPlayerRacePreference(Player(0), RACE_PREF_NIGHTELF)
    call SetPlayerRaceSelectable(Player(0), false)
    call SetPlayerController(Player(0), MAP_CONTROL_USER)

    // Player 1
    call SetPlayerStartLocation(Player(1), 1)
    call ForcePlayerStartLocation(Player(1), 1)
    call SetPlayerColor(Player(1), ConvertPlayerColor(1))
    call SetPlayerRacePreference(Player(1), RACE_PREF_NIGHTELF)
    call SetPlayerRaceSelectable(Player(1), false)
    call SetPlayerController(Player(1), MAP_CONTROL_USER)

    // Player 2
    call SetPlayerStartLocation(Player(2), 2)
    call ForcePlayerStartLocation(Player(2), 2)
    call SetPlayerColor(Player(2), ConvertPlayerColor(2))
    call SetPlayerRacePreference(Player(2), RACE_PREF_NIGHTELF)
    call SetPlayerRaceSelectable(Player(2), false)
    call SetPlayerController(Player(2), MAP_CONTROL_USER)

    // Player 3
    call SetPlayerStartLocation(Player(3), 3)
    call ForcePlayerStartLocation(Player(3), 3)
    call SetPlayerColor(Player(3), ConvertPlayerColor(3))
    call SetPlayerRacePreference(Player(3), RACE_PREF_NIGHTELF)
    call SetPlayerRaceSelectable(Player(3), false)
    call SetPlayerController(Player(3), MAP_CONTROL_USER)

    // Player 4
    call SetPlayerStartLocation(Player(4), 4)
    call ForcePlayerStartLocation(Player(4), 4)
    call SetPlayerColor(Player(4), ConvertPlayerColor(4))
    call SetPlayerRacePreference(Player(4), RACE_PREF_NIGHTELF)
    call SetPlayerRaceSelectable(Player(4), false)
    call SetPlayerController(Player(4), MAP_CONTROL_COMPUTER)

    // Player 5
    call SetPlayerStartLocation(Player(5), 5)
    call ForcePlayerStartLocation(Player(5), 5)
    call SetPlayerColor(Player(5), ConvertPlayerColor(5))
    call SetPlayerRacePreference(Player(5), RACE_PREF_NIGHTELF)
    call SetPlayerRaceSelectable(Player(5), false)
    call SetPlayerController(Player(5), MAP_CONTROL_COMPUTER)

endfunction

function InitCustomTeams takes nothing returns nothing
    // Force: TRIGSTR_012
    call SetPlayerTeam(Player(0), 0)
    call SetPlayerTeam(Player(1), 0)
    call SetPlayerTeam(Player(2), 0)
    call SetPlayerTeam(Player(3), 0)
    call SetPlayerTeam(Player(4), 0)
    call SetPlayerTeam(Player(5), 0)

endfunction

function InitAllyPriorities takes nothing returns nothing

    call SetStartLocPrioCount(0, 2)
    call SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 1, 3, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(1, 3)
    call SetStartLocPrio(1, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 1, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 2, 3, MAP_LOC_PRIO_LOW)

    call SetStartLocPrioCount(2, 1)
    call SetStartLocPrio(2, 0, 1, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(3, 1)
    call SetStartLocPrio(3, 0, 0, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(4, 2)
    call SetStartLocPrio(4, 0, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 1, 3, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(5, 5)
    call SetStartLocPrio(5, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 3, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 4, 4, MAP_LOC_PRIO_HIGH)
endfunction

//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************

//===========================================================================
function main takes nothing returns nothing
    call SetCameraBounds(768.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 3584.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 3328.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 1024.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 768.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 1024.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 3328.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 3584.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    call SetDayNightModels("Environment\\DNC\\DNCDalaran\\DNCDalaranTerrain\\DNCDalaranTerrain.mdl", "Environment\\DNC\\DNCDalaran\\DNCDalaranUnit\\DNCDalaranUnit.mdl")
    call NewSoundEnvironment("Default")
    call SetAmbientDaySound("DalaranDay")
    call SetAmbientNightSound("DalaranNight")
    call SetMapMusic("Music", true, 0)
    call CreateAllUnits()
    call InitBlizzard()


    call InitGlobals()
    call InitCustomTriggers()
    call ConditionalTriggerExecute(gg_trg_Initialization) // INLINED!!

endfunction

//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************

function config takes nothing returns nothing
    call SetMapName("TRIGSTR_001")
    call SetMapDescription("TRIGSTR_003")
    call SetPlayers(6)
    call SetTeams(6)
    call SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)

    call DefineStartLocation(0, 1728.0, - 2240.0)
    call DefineStartLocation(1, 2048.0, - 2240.0)
    call DefineStartLocation(2, 2368.0, - 2240.0)
    call DefineStartLocation(3, 1728.0, - 2496.0)
    call DefineStartLocation(4, 2048.0, - 2496.0)
    call DefineStartLocation(5, 2368.0, - 2496.0)

    // Player setup
    call InitCustomPlayerSlots()
    call InitCustomTeams()
    call InitAllyPriorities()
endfunction




//Struct method generated initializers/callers:
