////SmallBasePatrol.sqf////
private ["_BlkList"];

			_taskName = _this select 2;


Modifier = _this select 0;

			_LastSpot = _this select 1;
	
		if (Modifier > 0) then {	
	[_taskName, "SUCCEEDED"] call BIS_fnc_taskSetState;
	
					///_BlkList = [_LastSpot, 200];///
						_BlkList = [];
						
						
								}else {_BlkList = [];};
								
								
								
								

			_CompArray = ["Compositions\SmallBase.sqf","Compositions\CampBase.sqf","Compositions\WeaponsLabBase.sqf"];
			_Comp = _CompArray select Modifier;

					
			
			
	_spot = [[5707.44,7296.02,0], 20,4000, 20, 0,0.05, 0, _BlkList,[2080.65,5607.45,0]] call BIS_fnc_findSafePos;
	
	
	
				
				_markersArray = ["markername11","markername12","markername13"];
				_marker = _markersArray select Modifier;
		
		_markerName = createMarker [_marker, _spot]; 
			_markerName setMarkerType "hd_dot";
 
 MIL = [_spot,180,call (compile (preprocessFileLineNumbers _Comp))] call BIS_fnc_ObjectsMapper; 
 
 	if (Modifier == 2) then { 
																																																													
						[8,_spot]execVM "OpenDoor.sqf";
						
						
																	};
 
					
						_taskArray = ["taskSBP","taskSBP2","taskSBP3"];
						CTask = _taskArray select Modifier;
										
							_Details = ["Locate Officer","Find Camp","Find Lab"];
							_Titles = ["Extract Information on secret weapons program","Find Way inside lab","Shut down weapons lab Use the passcode in the briefing entry we need to collect a sample from one of the devices" ];			
									_title = _Titles select Modifier;		
									_detail = _Details select Modifier;	
									
   [West, CTask, [_title,_detail,_markerName], _spot, "ASSIGNED"] call BIS_fnc_taskCreate;
 
 
		
					
					
							sleep 6;
							
							
		
					
		
		
		
		_UnitArray = ["O_mas_gue_Rebel_LAT_F","O_mas_gue_Rebel_AR_F","O_mas_gue_Rebel_M_F","O_mas_gue_Rebel_OFF_F","O_mas_gue_Rebel_LITE_F","O_mas_gue_Rebel_MEDIC_F"];	
		
					_UnitsNoArray = [5,10,15];
						_UnitsNo = _UnitsNoArray select Modifier;
							_UnitModifierArray = [2,6,10];
								_UnitModifier = _UnitModifierArray select Modifier;
					
					for [{_i = 0}, {_i < _UnitsNo}, {_i = _i + 1}] do {
					
											hintSilent str _i;
					
								sleep 1;
					
							_EGrp = createGroup East;	
								
							_TYP = selectRandom _UnitArray;
					
								_UN = _EGrp createUnit [_TYP, _spot, [], 10, "NONE"];
											
									  _animPool = ["SIT_LOW","KNEEL","SIT_LOW","KNEEL","LEAN","WATCH","WATCH1","WATCH2"];
  
											_selAnimPool = selectRandom _animPool;
													
																		
  if (_i > _UnitModifier)then { [_UN,_selAnimPool , "FULL"] call BIS_fnc_ambientAnimCombat; }else {[_EGrp,_spot, 8, [] ] call BIS_fnc_taskPatrol;};		
					
																		}; 
																		
											_HVTGrp = createGroup East;
											
											_OfficerArray = ["O_officer_F","O_GEN_Commander_F","O_G_officer_F"];
											
													Officer = _OfficerArray select Modifier;
											
												UNHVT = _HVTGrp createUnit [Officer, _spot, [], 10, "NONE"];
												
												_EVHINDX = UNHVT addEventHandler ["Killed", {
																
																						if (Modifier == 0)then {[1,_spot,CTask]execVM "SmallBasePatrol.sqf";};
																						if (Modifier == 1)then {[2,_spot,CTask]execVM "SmallBasePatrol.sqf";};
																						if (Modifier == 2)then {hint "Over";};	///dont think i need this one///						
																											
																											
																									
																									
																									}];
																									
																									

																		
																		
																		
																		
																		
																		
																		