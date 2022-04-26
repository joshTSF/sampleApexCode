global class MapToListObject implements vlocity_cmt.VlocityOpenInterface {
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
