////SimpleMove.sqf////

private ["_spot","_Grp"];

		hint "Moving";


		sleep 1;

		_spot = _this select 0; ///pos of the onj///
		_Grp = _this select 1;	///group ////	
	
		while{true} do {
		
		_Grp move _spot;

	(units _Grp) doMove _spot;

						sleep 10;
						
            	};


