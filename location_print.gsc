//MOB OF THE DEAD REMAKE
//INITIAL MAIN FILE 
//TO START OFF
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_hud_message;
#include maps\mp\ombies\_zm_stats;
#include maps\mp\zombies\_zm_buildables;
#include maps\mp\zm_transit_sq;
#include maps\mp\zm_transit_distance_tracking;
#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\zombies\_zm_utility;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\gametypes_zm\_hud_message;
#include maps\mp\zombies\_zm_weapons;
#include maps\mp\zombies\_zm_net;
#include maps\mp\zombies\_zm_unitrigger;
#include maps\mp\zm_alcatraz_utility;
#include maps\mp\zombies\_zm_afterlife;
#include maps\mp\zm_prison;
#include maps\mp\zombies\_zm;
#include maps\mp\gametypes_zm\_spawning;
#include maps\mp\zombies\_load;
#include maps\mp\zombies\_zm_clone;
#include maps\mp\zombies\_zm_ai_basic;
#include maps\mp\animscripts\shared;
#include maps\mp\zombies\_zm_audio;
#include maps\mp\zombies\_zm_zonemgr;
#include maps\mp\zm_alcatraz_travel;
#include maps\mp\gametypes_zm\_zm_gametype;
#include maps\mp\zombies\_zm_equipment;
#include maps\mp\zombies\_zm_perk_electric_cherry;
#include maps\mp\zombies\_zm_perks;
#include maps\mp\_visionset_mgr;
#include maps\mp\zombies\_zm_laststand;
#include maps\mp\gametypes_zm\_hud;
#include maps\mp\zombies\_zm_powerups;
#include maps\mp\zm_transit;

main()
{
    //replacefunc( maps\mp\zm_alcatraz_utility::player_lightning_manager, ::register_level_specific_client_fields_new );
}
register_level_specific_client_fields_new()
{
    //self setclientfieldtoplayer( "toggle_lightning", 0 );
    self.b_lightning = 0;
}
init()
{
    //replacefunc( maps\mp\zm_alcatraz_utility::player_lightning_manager, ::register_level_specific_client_fields_new );
    populate_xmodelList();
    level.player_out_of_playable_area_monitor = 0;
    flag_wait( "initial_blackscreen_passed" );
    setdvar( "g_ai", false );
    setdvar( "sv_cheats", true );
    level.players[ 0 ] setclientdvar( "r_lighttweaksunlight", 18 );
    level thread inspect_xmodels();
    level thread print_org( level.players[ 0 ] );

    level.devmode = true;
    level thread connecting_players_thread();
    level thread dev_stuff();
}

connecting_players_thread()
{
    level endon( "end_game" );
    while( true )
    {
        level waittill( "connected", p );
        //p thread prison_visuals_2025();
    }
}

dev_stuff()
{
    wait 1;
    if( !level.devmode )
    {
        return;
    }
    setdvar( "g_ai", false );
    setdvar( "sv_cheats", true );
    level.players[ 0 ] thread highrise_visuals_2025();
}
highrise_visuals_2025()
{
    level endon( "end_game" );
    self endon( "disconnect" );

    self setclientdvar( "r_lighttweaksunlight", ( 0.5, 0.4, 0.4 ) );
    self setclientdvar( "r_sky_intensity_factor0", 3.8 );
    self setclientdvar( "r_sky_intensity_factor1", 3.8 );
    self setclientdvar( "r_skycolortemp", 4000 );
    self setclientdvar( "r_skyTransition", 0 );
    self setclientdvar( "r_filmusetweaks", true );
    self setclientdvar( "vc_fsm", "1 1 1 1" );
    self.score += 50000;
    self enableInvulnerability();
}
print_org( who )
{
    level endon( "end_game" );
    iprintln( "FOGGY RAINY DAY TIME OVERGROWN MOD NAME PLACEHOLDER" );
    while( true )
    {
        wait 1;
        iprintln( "^5" + who.origin );
    }
}

populate_xmodelList_zm_prison()
{
    level.xmodelList = [];
    level.xmodelList[ level.xmodelList.size ] = ( "veh_t6_dlc_zombie_plane_whole" );
    level.xmodelList[ level.xmodelList.size ] = ( "static_zombie_mannequin" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_gg_rd_support" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_gg_rd_support_riser" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_water_tower_leg" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_skull_afterlife" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_gondola" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_candle_med_on" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_bodybag" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_zom_al_tarp_bridge01" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_zom_al_tarp_bridge02_mod" );
    level.xmodelList[ level.xmodelList.size ] = ( "foliage_weed_dandelion" );
    level.xmodelList[ level.xmodelList.size ] = ( "foliage_afr_tall_bush_01a" );
    level.xmodelList[ level.xmodelList.size ] = ( "foliage_afr_grass_sm_01a" );
    level.xmodelList[ level.xmodelList.size ] = ( "dub_rock_02" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_electric_chair" );
    //level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_vista_mountain" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_dock_post" );
    level.xmodelList[ level.xmodelList.size ] = ( "p_jun_dockpost" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_dock_fancy_lamppost" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_lamp_post_on" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_lamp_post" );
    
    level.xmodelList[ level.xmodelList.size ] = ( "p_rus_door_white_frame_double" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_cell_shower_head" );
    level.xmodelList[ level.xmodelList.size ] = ( "p_glo_outdoor_switch" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_rubble_pile_98" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_rubble_trim_128" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_keybox" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_pipe_4_64_rust" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_laundry_bag_pile_64" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_cell_door" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_spawn_cap_64x52x12" );
    level.xmodelList[ level.xmodelList.size ] = ( "p_rus_electricalbox_01" );
    level.xmodelList[ level.xmodelList.size ] = ( "afr_rusty_fence_post_01" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_roof_vent_01_tall" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_electric_box_set_1_tan" );
    level.xmodelList[ level.xmodelList.size ] = ("p6_zm_al_steel_plate"  );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_copypaper_box_open" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_wood_barrel_01" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_horrific_crate_b" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_stl_steel_case" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_infirmary_wheelchair" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_desk_small" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_candle_tall_on" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_medical_poster_01" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_medical_poster_02" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_medical_poster_03" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_medical_poster_04" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_medical_poster_05" );
    level.xmodelList[ level.xmodelList.size ] = ( "p_int_surgical_bonesaw" );
    level.xmodelList[ level.xmodelList.size ] = ( "p_int_surgical_knife" );
    level.xmodelList[ level.xmodelList.size ] = ( "p_int_surgical_tray" );
    level.xmodelList[ level.xmodelList.size ] = ( "p_int_surgical_vial_lg" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_surgery_cart" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_infirmary_or_light_support" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_infirmary_or_light_on" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_room_divider" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_iron_framework_160x160" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_power_station_panels_01" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_power_station_panels_02" );
    level.xmodelList[ level.xmodelList.size ] = ( "p_glo_barbed_wire02" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_acid_trap_tank" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_acid_trap_pipes" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_acid_trap_shower_01" );
    level.xmodelList[ level.xmodelList.size ] = ( "ac_prs_ter_crater_a_2" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_clock_lrg" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_large_generator" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_cell_skylight_frame" );
    level.xmodelList[ level.xmodelList.size ] = ( "c_zom_zombie_hellcatraz_head" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_picture05" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_wall_note_01" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_wall_note_02" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_wall_note_03" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_wall_note_04" );
    level.xmodelList[ level.xmodelList.size ] = ( "dh_support_pulley_wheel_anim" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_light_fixture" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_doorarch_single_basement" );
    level.xmodelList[ level.xmodelList.size ] = ( "paris_sewer_ibeam_large" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_steel_ibeam" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_citadel_basement_arch" );
    level.xmodelList[ level.xmodelList.size ] = ( "intro_construction_rebar_grid_01" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_dock_post" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_bldg_64_pole_01" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_bldg_64_pole_01b" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_crane" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_vista_cottage_01" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_crane_beam" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_dock_rope_01" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_vending_nuke_on" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_vending_three_gun_on" );
    level.xmodelList[ level.xmodelList.size ] = (  "p_jun_cement_mixer" );
    level.xmodelList[ level.xmodelList.size ] = ( "pb_pallet_bags" );
    level.xmodelList[ level.xmodelList.size ] = ( "pb_cement_bag" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_steel_ibeams" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_electrical_insulator" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_gg_bridge_cable" );
    level.xmodelList[ level.xmodelList.size ] = ( "dcburning_commerce_wires3" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_monterey_cypress_01_sway" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_lamp_post" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_monterey_cypress_01_sway" );
    level.xmodelList[ level.xmodelList.size ] = ( "afr_powerpole1" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_powerbreaker" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_anim_zm_al_nixie_cage" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_work_bench" );
    level.xmodelList[ level.xmodelList.size ] = ( "bottle_whisky_01" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_zom_al_tarp_roof01_mod" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_zom_al_tarp_bridge01_mod" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_zom_al_tarp_bridge02_mod" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_zom_al_tarp_bridge03_mod" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_zom_al_tarp_bridge04_mod" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_cell_door_collmap" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_dream_catcher" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_power_station_panels_03_on" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_gondola_frame_light_red" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_gondola_frame_light_green" );
    level.xmodelList[ level.xmodelList.size ] = ( "veh_t6_dlc_zombie_plane_whole" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_infirmary_case" );
    level.xmodelList[ level.xmodelList.size ] = ("veh_t6_dlc_zombie_part_control"  );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_anim_zm_al_citadel_numbers" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_anim_zm_al_magic_box_lock" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_key" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_anim_zm_al_nixie_tubes" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_dream_catcher_off" );
    level.xmodelList[ level.xmodelList.size ] = ( "c_zom_wolf_head" );
    level.xmodelList[ level.xmodelList.size ] = ( "c_zom_guard_body" );
    level.xmodelList[ level.xmodelList.size ] = ( "c_zom_zombie_mask_head" );
    level.xmodelList[ level.xmodelList.size ] = ("c_zom_cellbreaker_fb"  );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_gp_wirespark_med_mod" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_zom_al_key_pulley_mod" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_zom_al_chain_short_hook_mod" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_zom_al_crane_palette_mod" );
    level.xmodelList[ level.xmodelList.size ] = ( "fx_decal_burnt_paper" );
    level.xmodelList[ level.xmodelList.size ] = ( "fx_decal_burnt_paper2" );
    level.xmodelList[ level.xmodelList.size ] = ( "fx_decal_burnt_paper3" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_packasplat_suitcase" );
    level.xmodelList[ level.xmodelList.size ] = ( "static_zombie_mannequin" );
    level.xmodelList[ level.xmodelList.size ] = ( "veh_t6_dlc_zombie_part_fuel" );
    level.xmodelList[ level.xmodelList.size ] = ( "veh_t6_dlc_zombie_part_rigging" );
    level.xmodelList[ level.xmodelList.size ] = ( "accessories_gas_canister_1" );
    level.xmodelList[ level.xmodelList.size ] = ( "t6_wpn_minigun_world" );
    level.xmodelList[ level.xmodelList.size ] = ( "t6_wpn_zmb_tomahawk_world" );
    level.xmodelList[ level.xmodelList.size ] = ( "t6_wpn_hatchet_world_retrieve" );
    level.xmodelList[ level.xmodelList.size ] = ( "skybox_zm_alcatraz" );
    level.xmodelList[ level.xmodelList.size ] = ( "t6_wpn_zmb_meat_world" );
    level.xmodelList[ level.xmodelList.size ] = ( "zombie_firesale" );
    level.xmodelList[ level.xmodelList.size ] = ( "zombie_ammocan" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_anim_zm_al_magic_box_lock_red" );
    level.xmodelList[ level.xmodelList.size ] = ( "t6_wpn_zmb_severedhead_world" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_zom_al_gondola_chains_mod" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_gondola_frame_light_green" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_audio_headset_icon" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_al_skull_afterlife" );
    /*
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    */
    

    for( s = 0; s < level.xmodelList.size; s++ )
    {
        precachemodel( level.xmodelList[ s ] );
    }
}

populate_xmodelList()
{
    level.xmodelList = [];
    //from monsoon
    level.xmodelList[ level.xmodelList.size ] = ( "t5_foliage_groundcover03" ); //doesnt works
    


    level.xmodelList[ level.xmodelList.size ] = ( "t5_foliage_tree_aquilaria01v2_small_no_vines" ); //doesnt
    level.xmodelList[ level.xmodelList.size ] = ( "p6_grass_wild_mixed_med_sway_nogo_clump_256" ); //no
    level.xmodelList[ level.xmodelList.size ] = ( "p6_grass_wild_green_med_sway_nogo_clump_256" ); //no
    level.xmodelList[ level.xmodelList.size ] = ( "ivy_vine_clump_root_sway" ); //yes
    level.xmodelList[ level.xmodelList.size ] = ( "ctl_vine_patch_hang_sway" ); //no
    level.xmodelList[ level.xmodelList.size ] = ( "p_glo_rubble_small_rocks" ); //yes
    level.xmodelList[ level.xmodelList.size ] = ( "p6_asd_charger_panel" ); //good mysterical panel
    level.xmodelList[ level.xmodelList.size ] = ( "ny_harbor_sub_command_center_breaker_05" ); //no
    level.xmodelList[ level.xmodelList.size ] = ( "p6_monitor_table_01_alt" ); //table future lookin one from big ship, maybe use it for player to check quests
    level.xmodelList[ level.xmodelList.size ] = ( "p6_control_panel_02" ); //flat image that changes pictures inside of it
    level.xmodelList[ level.xmodelList.size ] = ( "p6_monitor_med_radar_07" ); //flat static screen
    level.xmodelList[ level.xmodelList.size ] = ( "p6_monsoon_brick_ruins_pile_02" ); //no
    level.xmodelList[ level.xmodelList.size ] = ( "p6_interior_arch_01" ); //no
    level.xmodelList[ level.xmodelList.size ] = ( "p6_monitor_small_radar_10" ); //yes
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_monsoon_wind_crates_mod" ); //no
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_gp_bamboo_mod" ); //yeah good tree
    level.xmodelList[ level.xmodelList.size ] = ( "t5_foliage_canopy_view01_small_static" ); //no
    level.xmodelList[ level.xmodelList.size ] = ( "t5_foliage_treewall_small01" ); //no
    level.xmodelList[ level.xmodelList.size ] = ( "t5_foliage_bush06b_noshadow_static" ); //no

    level.xmodelList[ level.xmodelList.size ] = ( "t5_foliage_bush06b" ); //no
    level.xmodelList[ level.xmodelList.size ] = ( "p6_grass_wild_mixed_med_sway_nogo" ); //no
    level.xmodelList[ level.xmodelList.size ] = ( "p6_afr_plant_fern_01a_clump" ); //no
    level.xmodelList[ level.xmodelList.size ] = ( "p6_tree_angel_oak_moss_cheap_novines" ); //no
    level.xmodelList[ level.xmodelList.size ] = ( "p6_grass_wild_mixed_med_sway_nogo_clump_256" ); //nno
    level.xmodelList[ level.xmodelList.size ] = ( "p6_grass_wild_green_med_sway_nogo_clump_256" ); //no
    level.xmodelList[ level.xmodelList.size ] = ( "t5_foliage_tree_aquilaria01v2_small_no_vines" ); //no
    level.xmodelList[ level.xmodelList.size ] = ( "p6_strangler_fig_tree_no_vines_sway" ); //no
    level.xmodelList[ level.xmodelList.size ] = ( "t5_foliage_tree_bamboo02_monsoon" ); //no//no
    level.xmodelList[ level.xmodelList.size ] = ( "t5_foliage_tree_bamboo02" ); //No
    //level.xmodelList[ level.xmodelList.size ] = ( "" );
    //from angola
    level.xmodelList[ level.xmodelList.size ] = ( "p6_foliage_bush_desert_a" ); //works





    level.xmodelList[ level.xmodelList.size ] = ( "p6_tree_baobab" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_tree_baobab_dry" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_grass_green_tall" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_grass_wild_green_tall" );
    level.xmodelList[ level.xmodelList.size ] = ( "t5_foliage_bush06a_pow" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_grass_green_wild_tall_clump_512" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_grass_green_wild_med_clump_512" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_tree_umbrella_acacia_umbrella_thorn" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_tree_umbrella_acacia_umbrella_thorn_bare" );

    /*
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_bldg_d" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_bldg_b" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_bldg_e" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_bldg_c" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_signage_ver_11" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_signage_ver_04" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_bldg_a_cap" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_signage_hor_01" );
    
    level.xmodelList[ level.xmodelList.size ] = ( "6_zm_hr_vista_signage_ver_07" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_signage_hor_03" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_cloud_layer_02" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_cloud_layer_01" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_stars" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_signage_hor_04" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_signage_hor_09" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_signage_ver_02" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_signage_hor_11" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_signage_ver_05" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_signage_ver_13" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_signage_hor_08" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_signage_ver_06" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_signage_ver_01" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_signage_ver_09" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_signage_ver_03" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_signage_hor_12" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_signage_hor_07" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_signage_hor_05" );
    level.xmodelList[ level.xmodelList.size ] = (  "p6_zm_hr_vista_signage_hor_06");
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_signage_ver_08" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_vista_signage_ver_12" );
    level.xmodelList[ level.xmodelList.size ] = ( "icbm_electricpanel1" );
    level.xmodelList[ level.xmodelList.size ] = ( "p_rus_electricmeter" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_shoe_single_01" );
    level.xmodelList[ level.xmodelList.size ] = ( "sp_b_p_int_shoe_flat" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_light_mall_frame_01" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_light_mall_01_off" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_jewelry_case" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_jewelry_case_doors" );
    level.xmodelList[ level.xmodelList.size ] = ( "ny_manhattan_building_exchange_01_chunk204" );
    level.xmodelList[ level.xmodelList.size ] = ( "ny_manhattan_building_exchange_01_chunk204" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_grn_bldg_ceiling_tile_single" );
    
    level.xmodelList[ level.xmodelList.size ] = ( "mlv/p6_zm_hr_mural_dragon" );
    level.xmodelList[ level.xmodelList.size ] = ( "ch_campfire_largekettle" );
    level.xmodelList[ level.xmodelList.size ] = ( "ch_campfire_hanging_pot" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_janitor_sweeper" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_tv_testpattern" );
    level.xmodelList[ level.xmodelList.size ] = ( "zm_hr_toilet_motel" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_chinese_lantern" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_chinese_lantern_on" );
    level.xmodelList[ level.xmodelList.size ] = ( "p_rus_electricpanel_03" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_key_console" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_elevator_indicator" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_lobby_reception_ottoman" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_lion_statue" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_lion_statue_base" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_mural_skyline" );
    level.xmodelList[ level.xmodelList.size ] = ( "p_rus_electricalbox_02" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_pos_register_support" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_pos_register_screen_dest" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_building_extender_high" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_buildable_sq_electric_box" );
    level.xmodelList[ level.xmodelList.size ] = ( "com_janitor_spraybottle2" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_light_cagelight_orng_on" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_lantern_on" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_sweatshop_light_hangar" );
    level.xmodelList[ level.xmodelList.size ] = ( "p_pent_elevator_indicator_large" );
    level.xmodelList[ level.xmodelList.size ] = ( "afr_refrigerator2" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_painting_ver_03" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_bldg2_rest_pillar01" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_radio_antena" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_radio_antena_crossbar" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_radio_antena_base" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_radio_antena_drum" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_radio_antena_radar_round" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_large_neon_sign_frame" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_large_neon_sign_panel_1" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_large_neon_sign_panel_2" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_large_neon_sign_panel_3" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_light_hotel_wall_on" );
    level.xmodelList[ level.xmodelList.size ] = ( "ch_radiator01" );

    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_med_tower_pipe_holder" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_facade_awning_01" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_tarp_blue" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_blue_balcony_railing" );
    level.xmodelList[ level.xmodelList.size ] = ( "com_janitor_mop" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_railing_rooftop_01" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_doorframe_single_b" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_greenhouse" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_catwalk" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_catwalk_bent" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_watertower_stand" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_watertower_feet" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_watertower_barrel" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_dragon_sign" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_sign_grid" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_sign_support" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_doorframe_double_b" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_building_extender_med" );
    level.xmodelList[ level.xmodelList.size ] = (  "p6_zm_buildable_pswitch_body");

    level.xmodelList[ level.xmodelList.size ] = ( "zombie_teddybear" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_elevator_button" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_work_bench" );
    level.xmodelList[ level.xmodelList.size ] = ( "p_rus_desklamp_wmd_on" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_zom_highrise_tarp1_mod" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_zom_highrise_tarp2_mod" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_zom_highrise_tarp3_mod" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_zom_highrise_curtains1_mod" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_zom_highrise_curtains2_mod" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_zom_highrise_tarp4_mod" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_zom_highrise_tarps_wallpaper_mod" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_zom_highrise_hanging_ad1_mod" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_zom_highrise_carpet_hang2_mod" );
    level.xmodelList[ level.xmodelList.size ] = ( "zombie_vending_nuke_on_lo" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_anim_zm_hr_elevator_freight" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_buildable_pswitch_lever_handed" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_anim_zm_buildable_view_tramplesteam" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_gp_wirespark_long_lrg_mod" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_zom_highrise_rock_slide_mod" );
    
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_zom_highrise_dragon_mod" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_gp_wirespark_med_lrg_mod" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_hr_keycard" );
    level.xmodelList[ level.xmodelList.size ] = ( "p6_zm_keycard" );
    level.xmodelList[ level.xmodelList.size ] = ( "fxanim_zom_highrise_trample_gen_mod" );
    */



    /*
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    
    
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    level.xmodelList[ level.xmodelList.size ] = (  );
    */
    

    for( s = 0; s < level.xmodelList.size; s++ )
    {
        precachemodel( level.xmodelList[ s ] );
    }
}
inspect_xmodels()
{
    level endon( "end_game" );
    wait 2;
    mod = spawn( "script_model", level.players[0].origin );
    mod setmodel( "tag_origin" );
    mod.angles = level.players[ 0 ].angles;
    wait 1;
    iprintln( "xmodel thread spawned" );
    wait 1;
    iprintln( "ADS + ^9[{+activate}] = XMODEL LIST UP" );
    iprintln( "ADS + MELEE = XMODEL LIST DOWN" );
    iprintln( "USE + MELEE = XMODEL SETS  TAG_ORIGIN MODEL" );
    iprintln( "ADS + JUMP = SPAWN AND LEAVE THE MODEL IN MAP" );
    wait 3;
    iprintln( "==/ TEST BUTTON STRING GLYPH /== ");
    wait 1;
    iprintln( "^9[{+activate}] | USE BUTTON" );
    iprintln( "^9[{+ads}] | ADS BUTTON" );
    iprintln( "^9[{+attack}] | ATTACK BUTTON" );
    iprintln( "^9[{+crouch}] | CROUCH BUTTON" );
    wait 3;
    iprintln( "^9[{+jump}] | JUMP BUTTON" );
    iprintln( "^9[{+melee}] | KNIFE BUTTON" );
    iprintln( "^9[{+grenade}] | GRENADE BUTTON" );
    iprintln( "^9[{+tactical}] | TACTICAL BUTTON" );
    wait 1;
    iprintln( "^9[{+actionslot1}] | ACTION SLOT 1 BUTTON" );
    
    //implement removal of as well
    iprintln( "USE + JUMP = DELETE PREVIOUSLY SPAWNED *FOREVER ENTITY*" );
    level.players[ 0 ] thread change_xmodel( mod );
}
change_xmodel( mod )
{
    self endon(  "disconnect" );
    level endon( "end_game" );
    list = level.xmodelList;
    lowest = 0;
    highest = list.size;
    ind = 0;
    mod.origin = self.origin;
    mod.angles = self.angles;
    while( true )
    {
        
        if( self adsButtonPressed() && self JumpButtonPressed() )
        {
            perm = spawn( "script_model", self.origin );
            perm setmodel( list[ ind ] );
            perm.angles = self.angles;
            iprintln( "permament entity: ^5" + list[ind] + " ^7spawned at origin: \n" + self.origin );
            wait 1;
        }
        if( self adsButtonPressed() && self useButtonPressed() )
        {
            ind++;
            if( ind >= highest )
            {
                ind = highest;
            }
            mod setmodel( list[ ind ] );
            mod.origin = self.origin;
            mod.angles = self.angles;
            iprintln( "model set to: ^6 " + list[ ind ] );
            wait 1;
        }
        if( self adsButtonPressed() && self meleeButtonPressed() )
        {
            ind--;
            if( ind <= lowest )
            {
                ind = lowest;
                
            }
            mod setmodel( list[ ind ] );
                mod.origin = self.origin;
                mod.angles = self.angles;
                iprintln( "model set to: ^6 " + list[ ind ] );
            wait 1;
        }
        
        if( self useButtonPressed() && self meleeButtonPressed() )
        {
            mod setmodel( "tag_origin" );
            iprintln( "model set to invisible" );
            wait 1;
        }
        wait 0.1;

    }
}
