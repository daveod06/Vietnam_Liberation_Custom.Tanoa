params ["_target", "_caller", "_actionId", "_arguments"];

// add handler for Airdrop supply drop crate
_dropEventHandlerIndex = _caller addEventHandler ["Fired",Tooth_fnc_airdrop];
[_caller,"Will throw smoke when ready for the drop."] remoteExec ["sideChat",0,false];

//missionNamespace setVariable ["dropEventHandlerIndex", _dropEventHandlerIndex];
//publicVariable "dropEventHandlerIndex";

_null = [_caller,_dropEventHandlerIndex] spawn
{
    _player = _this select 0;
    _dropEventHandlerIndex = _this select 1;
    while {true} do
    {
        scopeName "removeFiredEHLoop";
        if ((missionNameSpace getVariable ["Tooth_airdrop",false])) then
        {
            // delete event handler
            //_dropEventHandlerIndex = (missionNameSpace getVariable ["dropEventHandlerIndex",0]);
            _player removeEventHandler ["Fired",_dropEventHandlerIndex];
            breakout "removeFiredEHLoop";
        };
        sleep 5.0;
    };
};
