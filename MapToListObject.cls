// "MapToListObject" custom class extending / implementing Vlocity's open interface method
// required if looking to call custom Apex class method from an IP / DR / Omniscript / Flexcard
global class MapToListObject implements vlocity_cmt.VlocityOpenInterface {
	// "invokeMethod" must be included along with the order and type of parameters
	// "convertListString" method is custom implementation
	// "inputMap" parameter is what is received when invoking Apex class method "convertListString". This comes from "Input map" or "Send JSON path"
	// "outMap" parameter is the response sent by the custom Apex class method
    global Boolean invokeMethod(String methodName, Map<String, Object> inputMap, Map<String, Object> outMap, Map<String, Object> options) {
        Boolean result = false;
            
        try {
            if(methodName == 'convertListString') {
            	convertListString(inputMap, outMap);
	            result = true;
            }
        } catch(Exception e) {
            system.debug('Calling: ' + methodName + ' caused error: ' + e.getMessage());
        }
        
        return result;
    }
    
	// custom class method, takes both the "inputMap" and "outMap" parameters
	// returns nothing, modifies the "outMap" parameter to include a "listStrObj" node in the response object
    private static void convertListString (Map<String, Object> inputMap, Map<String, Object> outMap) {
        // typecasting to List<Object> because it doesn't like List<String>, then typecast Object to String in for loop
        List<Object> stringArray = (List<Object>) inputMap.get('stringArray');
        List<Map<String, Object>> listStringObj = new List<Map<String, Object>>();

        for(Object objData : stringArray) {
            String strData = (String) objData;
            Map<String, Object> option = new Map<String, Object>();
            
            option.put('label', strData);
            option.put('value', strData);
            listStringObj.add(option);
        }
        
        outMap.put('listStrObj', listStringObj);
    }
}
