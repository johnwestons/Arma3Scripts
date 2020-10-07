////OpenDoor.sqf/////

private "_spot";
		
			_CuNumber = _this select 0;
			
			
	if(_CuNumber > 7)then {		
			
			_passArray = [[2,4,6],[6,4,1],[3,5,5],[1,3,4],[6,1,3],[2,4,1]];	
													password = selectRandom _passArray;
															pass = str password;
			
			player createDiaryRecord ["Diary", ["Password", pass], taskNull, "", false];
			
			
						indexSet = 0;		
						 
						 	attempt = [0,0,0]; 	
							Ajar = true;
			
			
    _spotOrig =  _this select 1;
	
				_loop = true;
	
		while {_loop} do {
		_spot = [_spotOrig, 30,75, 3, 0,0.05, 0, [],[2080.65,5607.45,0]] call BIS_fnc_findSafePos;
		
			_isEmpty = !(_spot isFlatEmpty [10, -1, 0.2, 10,0, false, objNull] isEqualTo []);
			
								///hint Format ["%1",_isEmpty];///
								
								if(_isEmpty)then {_loop = false;};
										 
											
			
														};
			
			
			_markerName = createMarker ["markername", _spot];
				_markerName setMarkerType "hd_dot";
			
			
				  house1 = createVehicle ["Land_i_House_Small_02_V1_F",_spot, [], 5, "NONE"];
			
					_Nbuilding = house1;
			    			
	_Nbuilding setVariable["bis_disabled_Door_1",1,true];
							
							_exit = _Nbuilding buildingExit 0;
								
						
							///_VecDirArray = [[0,1,0],[1,0,0],[0,-1,0],[-1,0,0]];///
						
						_houseDir = getDir _Nbuilding;
							
							
					_TabSpot = _exit getPos [-4.113, (_houseDir - 90)]; 
					_TabSpot2 = _exit getPos [-4.661, (_houseDir - 90)];
						
							_DeviceSpot = _exit getPos [-12, (_houseDir - 90)];	

						
						_TabSpot set [2,1.6];
						_TabSpot2 set [2,1.6];
						
					
			tab1 = createVehicle ["Land_Tablet_02_F",_TabSpot, [], 0, "CAN_COLLIDE"];
						tab1 setVectorDirAndUp [[0,0,-1], [-1,0,0]];
			tab2 = createVehicle ["Land_Tablet_02_F",_TabSpot2, [], 0, "CAN_COLLIDE"];
						tab2 setVectorDirAndUp [[0,0,-1], [1,0,0]];			
						
				dev =  createVehicle ["Land_Device_assembled_F",_DeviceSpot, [], 0, "NONE"];		
						dev setDir (_houseDir - 90);
						
						ADDev = dev addAction ["Retrieve Sample", { ["taskSBP3", "SUCCEEDED"] call BIS_fnc_taskSetState; dev removeAction 0;  _markerName = createMarker ["RTBMarker", [1527.67,4618.92,0]]; 
																											_markerName setMarkerType "hd_dot";
																											[West, "RTB", ["Take the sample to base","",_markerName], [1527.67,4618.92,0], "ASSIGNED"] call BIS_fnc_taskCreate;   }];
						
						
						
						VD = [0,0,-1];
						VU = [1,0,0];
								////[1,-1.8,0]	/////																																											
								
		[tab1,_Nbuilding] call BIS_fnc_attachToRelative; 
			
			tab1 addAction ["KeyPad", {createDialog "jWs_KeypadDialog";  }]; 
													
				AD1 = tab1 addAction ["KeyPadRotate>", {VURotate = (VU select 1) + 1; VUADJ = VU set [1,VURotate]; hintSilent str VU; tab1 setVectorDirAndUp [[0,0,-1], VU];}];														
					AD2 =	tab1 addAction ["KeyPadRotate>>>", {VURotate2 = (VU select 0) + 1; VUADJ = VU set [0,VURotate2]; hintSilent str VU; tab1 setVectorDirAndUp [[0,0,-1], VU];}];			
								
					AD3 = tab1 addAction ["KeyPadRotateBack<", {VURotateBack = (VU select 1) - 1; VUADJ = VU set [1,VURotateBack]; hintSilent str VU; tab1 setVectorDirAndUp [[0,0,-1], VU];}];												
				AD4 = tab1 addAction ["KeyPadRotateBack<<<", {VURotateBack2 = (VU select 0) - 1; VUADJ = VU set [0,VURotateBack2]; hintSilent str VU; tab1 setVectorDirAndUp [[0,0,-1], VU];}];	
			
	AD5 = tab1 addAction ["Accept Pos", { {tab1 removeAction _x;}forEach [1,2,3,4,5];}];


[tab2,_Nbuilding] call BIS_fnc_attachToRelative; 
			
			tab2 addAction ["Open", {house1 animate ["Door_1_rot", 1, 0.5];  tab2 setObjectTexture [0,"bootscreen.paa"]; sleep 5;  tab2 setObjectTexture [0,"a3\structures_f_heli\items\electronics\data\tablet_screen_co.paa"]; house1 animate ["Door_1_rot", 0, 0.5];}]; 
													
				AD11 = tab2 addAction ["KeyPad Rotate>", {VURotate = (VU select 1) + 1; VUADJ = VU set [1,VURotate]; hintSilent str VU; tab2 setVectorDirAndUp [[0,0,-1], VU];}];														
					AD22 =	tab2 addAction ["KeyPad Rotate>>>", {VURotate2 = (VU select 0) + 1; VUADJ = VU set [0,VURotate2]; hintSilent str VU; tab2 setVectorDirAndUp [[0,0,-1], VU];}];			
								
					AD33 = tab2 addAction ["KeyPadRotateBack<", {VURotateBack = (VU select 1) - 1; VUADJ = VU set [1,VURotateBack]; hintSilent str VU; tab2 setVectorDirAndUp [[0,0,-1], VU];}];												
				AD43 = tab2 addAction ["KeyPadRotateBack<<<", {VURotateBack2 = (VU select 0) - 1; VUADJ = VU set [0,VURotateBack2]; hintSilent str VU; tab2 setVectorDirAndUp [[0,0,-1], VU];}];	
			
	AD55 = tab2 addAction ["Accept Pos", { {tab2 removeAction _x;}forEach [1,2,3,4,5];}];		
			
			
											};
				
				
				
			if(_CuNumber < 7)then {
			
			indexSet = indexSet + 1;
			
			if (indexSet > 2)then {indexSet = 0;};
			
			
			
				attempt set [indexSet, _CuNumber];  
				
				sleep 0.5;
				
				hint format ["%1",attempt];
				
							
							
							_IDC = [1000,1001,1002];
							_SelIDC = _IDC select indexSet;
		
							_CuNumberString = str _CuNumber;
		
				ctrlSetText [_SelIDC, _CuNumberString];
				
				
	if(password isEqualTo attempt)then 
									{
						
								house1 animate ["Door_1_rot", 1, 0.5];
								
									sleep 0.2;
											
											attempt = [0,0,0];
												
												sleep 0.5;
										
											tab1 setObjectTexture [0,"bootscreen.paa"];
											tab2 setObjectTexture [0,"bootscreen.paa"];
										
												_IDC = [1000,1001,1002];
													{ctrlSetText [_x, "0"];} forEach _IDC;
										
										
							if (Ajar)then {
										
									sleep 5; 
										tab1 setObjectTexture [0,"a3\structures_f_heli\items\electronics\data\tablet_screen_co.paa"];
										tab2 setObjectTexture [0,"a3\structures_f_heli\items\electronics\data\tablet_screen_co.paa"];
											house1 animate ["Door_1_rot", 0, 0.3];		
																			};
						
										
						
						
										};
				
				
																
																
																
																};
																
																
															if(_CuNumber == 7)then {	
																
																if (Ajar)then {Ajar = false; ctrlSetText [1607, "Keep Door Closed"]; 
																ctrlSetText [10011, "Proped Open"]; 
																					}else 
																		{Ajar = true; ctrlSetText [1607, "Prop Door Open"]; ctrlSetText [10011, "Closed"];};
																
																					};							
																
																
				
				
				