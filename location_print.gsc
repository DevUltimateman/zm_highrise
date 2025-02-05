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
    replacefunc( maps\mp\zm_alcatraz_utility::player_lightning_manager, ::register_level_specific_client_fields_new );
}
register_level_specific_client_fields_new()
{
    self setclientfieldtoplayer( "toggle_lightning", 0 );
    self.b_lightning = 0;
}
init()
{
    replacefunc( maps\mp\zm_alcatraz_utility::player_lightning_manager, ::register_level_specific_client_fields_new );
    populate_xmodelList();
    level.player_out_of_playable_area_monitor = 0;
    flag_wait( "initial_blackscreen_passed" );
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
    level.players[ 0 ] thread prison_visuals_2025();
}
prison_visuals_2025()
{
    level endon( "end_game" );
    self endon( "disconnect" );

    self setclientdvar( "r_lighttweaksunlight", ( 0.4, 0.4, 0.4 ) );
    self setclientdvar( "r_sky_intensity_factor0", 3.8 );
    self setclientdvar( "r_sky_intensity_factor1", 3.8 );
    self setclientdvar( "r_skycolortemp", 8500 );
    self setclientdvar( "r_filmusetweaks", true );
    self setclientdvar( "vc_fsm", "1 1 1 1" );
}
print_org( who )
{
    level endon( "end_game" );
    while( true )
    {
        wait 1;
        iprintln( "^5" + who.origin );
    }
}

populate_xmodelList()
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
    iprintln( "ADS + USE = XMODEL LIST UP" );
    iprintln( "ADS + MELEE = XMODEL LIST DOWN" );
    iprintln( "USE + MELEE = XMODEL SETS  TAG_ORIGIN MODEL" );
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
