public class ISBNUtility {
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    Private static Final List<String> AllSpecialCharaters = new  List<String>{'!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '_', '+', '=', '{','}',
        '[', ']', '|', '\\', ':', ';', '"', ' \' ', ',', '.', '?', '/', '<', '>', '`', '~', ' '};
    Private static Final List<String> Alphabet = new List<String>{'A','a','B','b','C','c','D','d','E','e','F','f','G','g','H','h','I','i','J','j','K',
            'k','L','l','M','m','N','n','O','o','P','p','Q','q','R','r','S','s','T','t','U','u','V','v','W','w','X','x','Y','y','Z','z'};
                
    Private Static Final List<Integer> ThirteenISBN_weights = new List<Integer>{1,3,1,3,1,3,1,3,1,3,1,3};
    Private Static Final List<Integer> TenISBN_weights = new List<Integer>{10,9,8,7,6,5,4,3,2};
            
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    
    public static List<String> createWrongISBNFormat(Integer number_Of_Trials){
        if(number_Of_Trials < 1){
            System.debug('Please enter positive number for number of trials');
            return Null;
        }
        else{
            List<String> listOfWrongFormattedISBNs = new List<String>();
            listOfWrongFormattedISBNs.add('');
            
            String newISBN;
            
            for(Integer count = 1; count < number_Of_Trials; count++){
                newISBN = '';
                for(Integer ISBNLength = 0; ISBNLength < math.round(math.random()*12); ISBNLength++){
                    switch on math.round(2*math.random()){
                        // Add a letter
                        when 0 {
                            newISBN += Alphabet[(Integer) math.abs(math.random()*Alphabet.size() -1)];
                        }
                        // Add a special characters
                        when 1{
                            newISBN += AllSpecialCharaters[(Integer) math.abs(math.random()*AllSpecialCharaters.size() -1)];
                        }
                        // Add an integer
                        when 2{
                            newISBN += String.valueOf(math.round(9*math.random()));
                        }
                    }
                }
                listOfWrongFormattedISBNs.add(newISBN + 'T');
            }
            return listOfWrongFormattedISBNs;
        }
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public static List<List<String>> createInvalidISBNFormat(Integer number_Of_Trials){
        if(number_Of_Trials < 1){
            System.debug('Please enter positive number for number of trials');
            return Null;
        }
        else{
            List<List<String>> listOfInvalidFormattedISBNs = new List<List<String>>();
            
            String newISBN;
            Integer digit;
            String checkDigit;
            Integer sumOfDigits;
            
            for(Integer count = 0; count < number_Of_Trials; count++){
                newISBN = '';
                switch on math.round(math.random()){
                    // Create a 10 digit ISBN
                    when 0{
                        sumOfDigits = 0;
                        for(Integer ISBNLength = 0; ISBNLength < TenISBN_weights.size(); ISBNLength++){
                            digit = math.round(9*math.random());
                            sumOfDigits += digit*TenISBN_weights[ISBNLength];
                            newISBN += String.valueOf(digit);
                        }
                        // Creating an incorrect check digit
                        if(math.mod(sumOfDigits,11)  == 0){
                            checkDigit = 'X';
                            newISBN += checkDigit;
                        }
                        else{
                            checkDigit = String.valueOf(math.mod(11 - math.mod(sumOfDigits +1,11), 11));
                            newISBN += checkDigit;
                        }
                    }
                    // Create a 13 digit ISBN
                    when 1{
                        sumOfDigits = 0;
                        for(Integer ISBNLength = 0; ISBNLength < ThirteenISBN_weights.size(); ISBNLength++){
                            digit = math.round(9*math.random());
                            sumOfDigits += digit*ThirteenISBN_weights[ISBNLength];
                            newISBN += String.valueOf(digit);
                        }
                        
                        // Creating an incorrect ISBN
                        checkDigit = String.valueOf(math.mod(sumOfDigits+ 1,10)) ;
                        newISBN += checkDigit; 
                    }
                }
                listOfInvalidFormattedISBNs.add(new List<String>{newISBN, checkDigit});
            }
            return listOfInvalidFormattedISBNs;
        }
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public static List<List<String>> createValidISBNFormat(Integer number_Of_Trials){
        if(number_Of_Trials < 1){
            System.debug('Please enter positive number for number of trials');
            return Null;
        }
        else{
            List<List<String>> listOfValidFormattedISBNs = new List<List<String>>();
            
            String newISBN;
            Integer digit;
            String checkDigit;
            Integer sumOfDigits;
            
            for(Integer count = 0; count < number_Of_Trials; count++){
                newISBN = '';
                switch on math.round(math.random()){
                    // Create a 10 digit ISBN
                    when 0{
                        sumOfDigits = 0;
                        for(Integer ISBNLength = 0; ISBNLength < TenISBN_weights.size(); ISBNLength++){
                            digit = math.round(9*math.random());
                            sumOfDigits += digit * TenISBN_weights[ISBNLength];
                            newISBN += String.valueOf(digit);
                        }
                        // Recoding the check digit
                        if(math.mod(sumOfDigits,11)  == 1){
                            checkDigit = 'X';
                        }
                        else{
                            checkDigit = String.valueOf(math.mod(11 - math.mod(sumOfDigits,11), 11));
                        }
                        newISBN += checkDigit;
                    }
                    // Create a 13 digit ISBN
                    when 1{
                        sumOfDigits = 0;
                        for(Integer ISBNLength = 0; ISBNLength < ThirteenISBN_weights.size(); ISBNLength++){
                            digit = math.round(9*math.random());
                            sumOfDigits += digit *ThirteenISBN_weights[ISBNLength];
                            newISBN += String.valueOf(digit);
                        }
                        // Recoding the correct check digit
                        checkDigit = String.valueOf(math.mod(10 - math.mod(sumOfDigits, 10) , 10));
                        
                        // Creating the correct ISBN
                        newISBN += checkDigit ; 
                    }
                }
                listOfValidFormattedISBNs.add(new List<String>{newISBN, checkDigit});
            }
            return listOfValidFormattedISBNs;
        }
    }
}