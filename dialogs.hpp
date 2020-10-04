

class jWs_KeypadDialog
{
	idd = 11104;
	movingEnabled = true;
	
	class controls
	{

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Gamer, v1.063, #Zucyzi)
////////////////////////////////////////////////////////

class rscPicture1BKGD: RscPicture
{
	idc = 20;
	text = "MetalBK.jpg";
	colorText[] = {1,1,1,1};
	x = 0.406106 * safezoneW + safezoneX;
	y = 0.301966 * safezoneH + safezoneY;
	w = 0.105631 * safezoneW;
	h = 0.264046 * safezoneH;
};



class rscFrame1: RscFrame
{
	idc = 1800;
	x = 0.406106 * safezoneW + safezoneX;
	y = 0.301966 * safezoneH + safezoneY;
	w = 0.105631 * safezoneW;
	h = 0.264046 * safezoneH;
};
class rscBttn1: RscButton
{
	idc = 1600;
	text = "1"; //--- ToDo: Localize;
	x = 0.417843 * safezoneW + safezoneX;
	y = 0.389981 * safezoneH + safezoneY;
	w = 0.0234735 * safezoneW;
	h = 0.0660115 * safezoneH;
	action = [1] execVM "OpenDoor.sqf";
};
	

class rscBttn2: RscButton
{
	idc = 1601;
	text = "2"; //--- ToDo: Localize;
	x = 0.447185 * safezoneW + safezoneX;
	y = 0.389981 * safezoneH + safezoneY;
	w = 0.0234735 * safezoneW;
	h = 0.0660115 * safezoneH;
	action = [2] execVM "OpenDoor.sqf";
};
class rscBttn3: RscButton
{
	idc = 1602;
	text = "3"; //--- ToDo: Localize;
	x = 0.476526 * safezoneW + safezoneX;
	y = 0.389981 * safezoneH + safezoneY;
	w = 0.0234735 * safezoneW;
	h = 0.0660115 * safezoneH;
	action = [3] execVM "OpenDoor.sqf";
};
class rscBttn4: RscButton
{
	idc = 1603;
	text = "4"; //--- ToDo: Localize;
	x = 0.417843 * safezoneW + safezoneX;
	y = 0.477996 * safezoneH + safezoneY;
	w = 0.0234735 * safezoneW;
	h = 0.0660115 * safezoneH;
	action = [4] execVM "OpenDoor.sqf";
};
class rscBttn5: RscButton
{
	idc = 1604;
	text = "5"; //--- ToDo: Localize;
	x = 0.447185 * safezoneW + safezoneX;
	y = 0.477996 * safezoneH + safezoneY;
	w = 0.0234735 * safezoneW;
	h = 0.0660115 * safezoneH;
	action = [5] execVM "OpenDoor.sqf";
};
class rscBttn6: RscButton
{
	idc = 1605;
	text = "6"; //--- ToDo: Localize;
	x = 0.476526 * safezoneW + safezoneX;
	y = 0.477996 * safezoneH + safezoneY;
	w = 0.0234735 * safezoneW;
	h = 0.0660115 * safezoneH;
	action = [6] execVM "OpenDoor.sqf";
};
class rscText0: RscText
{
	idc = 1000;
	text = "0"; //--- ToDo: Localize;
	x = 0.423711 * safezoneW + safezoneX;
	y = 0.312968 * safezoneH + safezoneY;
	w = 0.0176051 * safezoneW;
	h = 0.0550095 * safezoneH;
	
};
class rscText1: RscText
{
	idc = 1001;
	text = "0"; //--- ToDo: Localize;
	x = 0.447185 * safezoneW + safezoneX;
	y = 0.312968 * safezoneH + safezoneY;
	w = 0.0176051 * safezoneW;
	h = 0.0550095 * safezoneH;
	
};

class rscTextInfo: RscText
{
	idc = 10011;
	text = "Keep Closed"; //--- ToDo: Localize;
	x = 0.424185 * safezoneW + safezoneX;
	y = 0.339998 * safezoneH + safezoneY;
	w = 0.1176051 * safezoneW;
	h = 0.0550095 * safezoneH;
	
};

class rscText2: RscText
{
	idc = 1002;
	text = "0"; //--- ToDo: Localize;
	x = 0.470658 * safezoneW + safezoneX;
	y = 0.312968 * safezoneH + safezoneY;
	w = 0.0176051 * safezoneW;
	h = 0.0550095 * safezoneH;
	
};
class rscExit1: RscButton
{
	idc = 1606;
	text = "x"; //--- ToDo: Localize;
	x = 0.488263 * safezoneW + safezoneX;
	y = 0.301966 * safezoneH + safezoneY;
	w = 0.0176051 * safezoneW;
	h = 0.0110019 * safezoneH;
	action = closeDialog 0;
};
class rscBttnOp1: RscButton
{
	idc = 1607;
	text = "Keep Door Open"; //--- ToDo: Localize;
	x = 0.406106 * safezoneW + safezoneX;
	y = 0.577013 * safezoneH + safezoneY;
	w = 0.105631 * safezoneW;
	h = 0.0220038 * safezoneH;
	action = [7] execVM "OpenDoor.sqf";
};


////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

		};
			};










