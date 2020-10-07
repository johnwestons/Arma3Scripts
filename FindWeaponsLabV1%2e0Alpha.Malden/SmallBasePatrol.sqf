////SmallBasePatrol.sqf////
private ["_Blk"];



			_taskName = _this select 2;


			Modifier = _this select 0;

			_LastSpot = _this select 1;

				
			
		if (Modifier > 0) then {	
	[_taskName, "SUCCEEDED"] call BIS_fnc_taskSetState;
								
															
								};
								
								
								
								

			_CompArray = ["Compositions\SmallBase.sqf","Compositions\CampBase.sqf","Compositions\WeaponsLabBase.sqf"];
			_Comp = _CompArray select Modifier;

		_loop = true;			
while {_loop}do {			
	SBPspot = [[6671.67,4596.17], 20,4800, 15, 0,0.08, 0, [BLKList],[2080.65,5607.45,0]] call BIS_fnc_findSafePos;
				
			_ListNo = 0;
	
		{ _MarkerPos = getMarkerPos _x;    
							_Dis = _MarkerPos distance SBPspot;
								if( _Dis < 600)then {_ListNo = _ListNo + 1;};                       }forEach BLKList;

							if (_ListNo <= 0)then {_loop = false;};	
							
							hint Format ["%1",BLKList];
							sleep 1;
								
	};
	
	
		_blkListMarkers = ["BLKmarker2","BLKmarker3","BLKmarker4"];
	
	_Bmarker = _blkListMarkers select Modifier;
		
		_markerName = createMarker [_Bmarker, SBPspot]; 
					_markerName setMarkerShape "RECTANGLE";
					_markerName	setMarkerSize [600, 600];					
					_markerName setMarkerAlpha 0.2;
					  BLKList pushback _markerName;
					
	
				
 
 MIL = [SBPspot,180,call (compile (preprocessFileLineNumbers _Comp))] call BIS_fnc_ObjectsMapper; 
 
 	if (Modifier == 2) then { 
																																																													
						[8,SBPspot]execVM "OpenDoor.sqf";
						
						
																	};
 
					
						_taskArray = ["taskSBP","taskSBP2","taskSBP3"];
						CTask = _taskArray select Modifier;
										
							_Details = ["Locate Officer","Find Camp","Find Lab"];
							_Titles = ["Extract Information on secret weapons program Find officer and search his belongings for information","Find Way inside lab","Shut down weapons lab Use the passcode in the briefing entry we need to collect a sample from one of the devices Optional Destroy both devices and take any CIV scientists into custody" ];			
									_title = _Titles select Modifier;		
									_detail = _Details select Modifier;	
									
   [West, CTask, [_title,_detail,_markerName], SBPspot, "ASSIGNED"] call BIS_fnc_taskCreate;
 
 					
							sleep 1;
							
								
		
		_UnitArray = ["O_Soldier_SL_F","O_Soldier_F","O_Soldier_LAT_F","O_soldier_M_F","O_Soldier_AR_F","O_medic_F","O_Soldier_TL_F","O_Soldier_A_F"];	
		
					_UnitsNoArray = [5,10,15];
						_UnitsNo = _UnitsNoArray select Modifier;
							_UnitModifierArray = [2,6,10];
								_UnitModifier = _UnitModifierArray select Modifier;
					
					for [{_i = 0}, {_i < _UnitsNo}, {_i = _i + 1}] do {
					
											hintSilent str _i;
					
								sleep 1;
					
							_EGrp = createGroup East;	
								
							_TYP = selectRandom _UnitArray;
					
								_UN = _EGrp createUnit [_TYP, SBPspot, [], 10, "NONE"];
											
									  _animPool = ["SIT_LOW","KNEEL","SIT_LOW","KNEEL","LEAN","WATCH","WATCH1","WATCH2"];
  
											_selAnimPool = selectRandom _animPool;
													
																		
  if (_i > _UnitModifier)then { [_UN,_selAnimPool , "FULL"] call BIS_fnc_ambientAnimCombat; }else {[_EGrp,SBPspot, 8, [] ] call BIS_fnc_taskPatrol;};		
					
																		}; 
																		
											_HVTGrp = createGroup East;
											
											_OfficerArray = ["O_officer_F","O_officer_F","O_officer_F"];
											
													Officer = _OfficerArray select Modifier;
											
												UNHVT = _HVTGrp createUnit [Officer, SBPspot, [], 10, "NONE"];
												
								if(Modifier == 2) then {
								
												_CivGrp = createGroup civilian;
								
															_Civ1 = _CivGrp createUnit ["C_man_w_worker_F", SBPspot, [], 10, "NONE"];
																_Civ2 = _CivGrp createUnit ["C_man_w_worker_F", SBPspot, [], 10, "NONE"];
								
																			};				
												
												
												if (Modifier == 1)then { 
												
																			_TBLspot = SBPspot getPos [10, 180];
																			
																		_TBL = createVehicle ["Land_CampingTable_F",_TBLspot,[], 0, "NONE"];
																																
																		
																			_LTP = createVehicle ["Land_Laptop_device_F", _TBLspot, [],0, "NONE"];
																									_Nudge = getPos _TBL;
																										_Nudge set [2,0.8];
																										_LTP setPos _Nudge;
																						
																							[_LTP,_TBL] call BIS_fnc_attachToRelative; 
																									
																				_LPad = _LTP addAction ["Search for Intel", { [2,SBPspot,CTask]execVM "SmallBasePatrol.sqf"; }]; 
																									
																									
																										};
												
												
												////make take EH apply to the whole side or player group ////
												
															if (Modifier == 0)then {  
																	
																	UNHVT addItem "ACE_Cellphone";
															
															{TakeEH = _x addEventHandler ["Take", {	params ["_unit", "_container", "_item"]; hint Format ["%1",_item]; if (_item == "ACE_Cellphone") then {[1,SBPspot,CTask]execVM "SmallBasePatrol.sqf"; {_x removeEventHandler ["Take", 0];}forEach (units (group _unit)); }; }];} forEach (units (group player));
																																																				
																										};			
																					


													UNHVT addEventHandler ["FiredNear", {
															params ["_unit", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"];
																							
																						_handle = [_unit] spawn {_guy = _this select 0; _guy removeEventHandler ["FiredNear", 0]; sleep 20;   if (alive _guy) then { hint "Alarm Raised";  [SBPspot,1] execVM "SpawnAI.sqf"; }else{ hint "No Alarm"; };   };	
																											
																									
																									
																									}];



																					
												
												_EVHINDX = UNHVT addEventHandler ["Killed", {
																
																						if (Modifier == 0)then { hint "HVT1 is Dead";};
																						if (Modifier == 1)then { hint "HVT2 is Dead"; };
																						if (Modifier == 2)then {hint "Over";};							
																											
																											
																									
																									
																									}];
																									
																									

																		
																		
																		
																		
																		
																		
																		