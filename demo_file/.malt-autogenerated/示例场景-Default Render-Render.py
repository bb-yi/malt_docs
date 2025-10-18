

_SceneLighting_0011_parameters = {
    'IN' : {},
    'OUT' : {},
}
_SceneLighting_0011_parameters["IN"]["Scene"] = IN["Scene"]
_SceneLighting_0011_parameters["IN"]["Point Resolution"] = PARAMETERS["_SceneLighting_0011"]["Point Resolution"]
_SceneLighting_0011_parameters["IN"]["Spot Resolution"] = PARAMETERS["_SceneLighting_0011"]["Spot Resolution"]
_SceneLighting_0011_parameters["IN"]["Sun Resolution"] = PARAMETERS["_SceneLighting_0011"]["Sun Resolution"]
_SceneLighting_0011_parameters["IN"]["Sun Max Distance"] = PARAMETERS["_SceneLighting_0011"]["Sun Max Distance"]
_SceneLighting_0011_parameters["IN"]["Sun CSM Count"] = PARAMETERS["_SceneLighting_0011"]["Sun CSM Count"]
_SceneLighting_0011_parameters["IN"]["Sun CSM Distribution"] = PARAMETERS["_SceneLighting_0011"]["Sun CSM Distribution"]
_SceneLighting_0011_parameters["OUT"]["Scene"] = None
run_node("_SceneLighting_0011", "SceneLighting", _SceneLighting_0011_parameters)


_RenderLayers1_parameters = {
    'IN' : {},
    'OUT' : {},
}
_RenderLayers1_parameters["IN"]["Scene"] = _SceneLighting_0011_parameters["OUT"]["Scene"]
_RenderLayers1_parameters["IN"]["Transparent Layers"] = PARAMETERS["_RenderLayers1"]["Transparent Layers"]
_RenderLayers1_parameters["OUT"]["Color"] = None
_RenderLayers1_parameters["PASS_GRAPH"] = PARAMETERS["_RenderLayers1"]["PASS_GRAPH"]
_RenderLayers1_parameters["CUSTOM_IO"] = PARAMETERS["_RenderLayers1"]["CUSTOM_IO"]
run_node("_RenderLayers1", "RenderLayers", _RenderLayers1_parameters)


_ScreenPass1_parameters = {
    'IN' : {},
    'OUT' : {},
}
_ScreenPass1_parameters["IN"]["Color"] = _RenderLayers1_parameters["OUT"]["Color"]
_ScreenPass1_parameters["OUT"]["Color"] = None
_ScreenPass1_parameters["PASS_MATERIAL"] = PARAMETERS["_ScreenPass1"]["PASS_MATERIAL"]
_ScreenPass1_parameters["CUSTOM_IO"] = PARAMETERS["_ScreenPass1"]["CUSTOM_IO"]
run_node("_ScreenPass1", "ScreenPass", _ScreenPass1_parameters)


_SuperSamplingAA1_parameters = {
    'IN' : {},
    'OUT' : {},
}
_SuperSamplingAA1_parameters["IN"]["Color"] = _ScreenPass1_parameters["OUT"]["Color"]
_SuperSamplingAA1_parameters["OUT"]["Color"] = None
run_node("_SuperSamplingAA1", "SuperSamplingAA", _SuperSamplingAA1_parameters)

OUT["Color"] = _SuperSamplingAA1_parameters["OUT"]["Color"]
OUT["Depth"] = PARAMETERS["_Render_Output1"]["Depth"]
