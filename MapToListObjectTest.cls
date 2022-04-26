@isTest
private class MapToListObjectTest {
    @isTest static void conversionCheck() {
        List<String> testInput = new String[]{'COPPER', 'PLATINUM', 'PEBBLE', 'STONE', 'DIAMOND'};
        Map<String, Object> input = new Map<String, Object>();
        Map<String, Object> output = new Map<String, Object>();
        Map<String, Object> options = new Map<String, Object>();
        String methodName = 'convertListString';
        
        input.put('stringArray', testInput);
        MapToListObject TestClass = new MapToListObject();
        TestClass.invokeMethod(methodName, input, output, options);
        List<Map<String, Object>> result = (List<Map<String, Object>>) output.get('listStrObj');
        
        system.debug('result ------> ' + result);
        system.debug('output ------> ' + output);
        
        system.assertEquals('COPPER', result[0].get('label'));
        system.assertEquals('COPPER', result[0].get('value'));
        system.assertEquals('PEBBLE', result[2].get('label'));
        system.assertEquals('PEBBLE', result[2].get('value'));
        system.assertEquals('DIAMOND', result[4].get('label'));
        system.assertEquals('DIAMOND', result[4].get('value'));
    }
}
