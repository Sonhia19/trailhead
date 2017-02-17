public with sharing class StringArrayTest {
    public StringArrayTest() {
        
    }

    public static List<String> generateStringArray (Integer parameter){
        
        List<String> text = new List<String>();
        
        for (Integer i = 0 ; i < parameter ; i++){
            text.add('Test ' + i);
        }

        return text;
    }
}