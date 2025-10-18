

_PrePass1_parameters = {
    'IN' : {},
    'OUT' : {},
}
_PrePass1_parameters["IN"]["Scene"] = IN["Scene"]
_PrePass1_parameters["OUT"]["Scene"] = None
_PrePass1_parameters["OUT"]["Normal Depth"] = None
_PrePass1_parameters["OUT"]["ID"] = None
_PrePass1_parameters["CUSTOM_IO"] = PARAMETERS["_PrePass1"]["CUSTOM_IO"]
run_node("_PrePass1", "PrePass", _PrePass1_parameters)


_MainPass1_parameters = {
    'IN' : {},
    'OUT' : {},
}
_MainPass1_parameters["IN"]["Scene"] = _PrePass1_parameters["OUT"]["Scene"]
_MainPass1_parameters["IN"]["Normal Depth"] = PARAMETERS["_MainPass1"]["Normal Depth"]
_MainPass1_parameters["IN"]["ID"] = PARAMETERS["_MainPass1"]["ID"]
_MainPass1_parameters["OUT"]["Color"] = None
_MainPass1_parameters["OUT"]["Line Color"] = None
_MainPass1_parameters["OUT"]["Line Width"] = None
_MainPass1_parameters["CUSTOM_IO"] = PARAMETERS["_MainPass1"]["CUSTOM_IO"]
run_node("_MainPass1", "MainPass", _MainPass1_parameters)


_LineRender1_parameters = {
    'IN' : {},
    'OUT' : {},
}
_LineRender1_parameters["IN"]["Color"] = _MainPass1_parameters["OUT"]["Color"]
_LineRender1_parameters["IN"]["Line Color"] = _MainPass1_parameters["OUT"]["Line Color"]
_LineRender1_parameters["IN"]["Line Width"] = _MainPass1_parameters["OUT"]["Line Width"]
_LineRender1_parameters["IN"]["Max Width"] = PARAMETERS["_LineRender1"]["Max Width"]
_LineRender1_parameters["IN"]["Line Scale"] = PARAMETERS["_LineRender1"]["Line Scale"]
_LineRender1_parameters["IN"]["Normal Depth"] = _PrePass1_parameters["OUT"]["Normal Depth"]
_LineRender1_parameters["IN"]["ID"] = _PrePass1_parameters["OUT"]["ID"]
_LineRender1_parameters["OUT"]["Color"] = None
run_node("_LineRender1", "LineRender", _LineRender1_parameters)

OUT["Color"] = _LineRender1_parameters["OUT"]["Color"]
