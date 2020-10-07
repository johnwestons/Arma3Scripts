///SpawnAI.sqf///


			_ObjPos = _this select 0;

			_SideMod = _this select 1;
			
			
		private ["_Heli1","_Hpilot"];


	_UnitArrayB = ["B_Soldier_F","B_soldier_AR_F"];	
		
		_UnitArrayO = ["O_Soldier_SL_F","O_Soldier_F","O_Soldier_LAT_F","O_soldier_M_F","O_Soldier_AR_F","O_medic_F","O_Soldier_TL_F","O_Soldier_A_F"];
		
	_UnitArrayI = ["I_soldier_F","I_Soldier_M_F"];
			
		_UnitArrayCom = [_UnitArrayB,_UnitArrayO , _UnitArrayI];
		
				_UArraySel = _UnitArrayCom select _SideMod;
		
		_spotArray = [[123.785,254.31,0],[12750.8,189.872,0],[12729.4,12733.8,0]];
					_spot = _spotArray select _SideMod;
		
			_SideArray = [West,East,resistance];
				_SelSide = _SideArray select _SideMod;
		
			_HeliArray = ["B_Heli_Transport_01_F","O_Heli_Light_02_unarmed_F","I_Heli_light_03_unarmed_F"];
						_SelHeli = _HeliArray select _SideMod;
		
		_HPilotArray = ["B_Helipilot_F","O_helipilot_F","I_helipilot_F"];
					_HPilotSel = _HPilotArray select _SideMod;
		
				_SelGrp = createGroup _SelSide;
		

						_HeliGrp = createGroup _SelSide;
													
                       _Heli1 = createVehicle [_SelHeli, _spot, [], 10, "FLY"];
							_Hpilot = _HeliGrp createUnit [_HPilotSel, _spot,[], 20, "NONE"];			
								_Hpilot moveInDriver _Heli1;


										///// spawning units////
			for [{_i = 0}, {_i < 6}, {_i = _i + 1}] do { 
		
				_UnitType = selectRandom _UArraySel;
		
         _CurrentUnit = _SelGrp createUnit [_UnitType, _spot, [], 5, "NONE"];
		 
									_CurrentUnit moveInCargo _Heli1;
																};
																
										///// end spawning units////		
						
								_wp1Location = _ObjPos getPos [300, 180];
					LZspot = [_wp1Location, 5,100, 5, 0,0.2, 0, [],[2080.65,5607.45,0]] call BIS_fnc_findSafePos;

					_markerName = createMarker ["marker", LZspot]; 
						_markerName setMarkerType "hd_dot";
					
					
								_HPad1 = createVehicle ["Land_HelipadEmpty_F", LZspot, [], 2, "NONE"];
								
								_HPilot doMove LZspot;
								
							_wp1 =_HeliGrp addWaypoint [LZspot, 50];
								
								_wp1 setWaypointType "TR UNLOAD";


										_loop = true;

									while {_loop} do {
													
												sleep 2;

												_Fcrew = fullCrew [_Heli1, "CARGO"];														
													_UnitCount = count _Fcrew;				
														hint format [" %1  units",_UnitCount];

												if(_UnitCount <= 0)then {_loop = false;};			
														

															};
										

													sleep 1;	

									_Hpilot doMove [125.625,8075.61,0];
												
																			
						[_ObjPos,_SelGrp] execVM "SimpleMove.sqf";
								
											
											while {true} do {

															sleep 2;	

													_HeliPos = getPos _Heli1;
													
													_dis = _HeliPos distance [125.625,8075.61,0];
																
																if (_dis <= 200) exitWith {deleteVehicle _Hpilot;  deleteVehicle _Heli1;  hint "Heli deleted";};

																	};


										sleep 3; 
											hint "Outside Of Scope";



											

												