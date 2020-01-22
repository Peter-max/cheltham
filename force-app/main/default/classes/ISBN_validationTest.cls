@isTest
Private class ISBN_validationTest {
    
    @isTest
    Static void CheckDigitGeneratorTest(){
        Integer number_Of_Trial = 300;
        
        List<List<String>> listOfInvalidISBN = ISBNUtility.createInvalidISBNFormat(number_Of_Trial);
        List<List<String>> listOfValidISBN = ISBNUtility.createValidISBNFormat(number_Of_Trial);
        
        for(List<String> invalidISBN :listOfInvalidISBN){
            System.assertNotEquals(invalidISBN[1] ,ISBN_validation.CheckDigitGenerator(invalidISBN[0]),
                                  'Generated check digits and the actual check digit should NOT match');
        }
        for(List<String> validISBN :listOfValidISBN){
           System.assertEquals(validISBN[1] ,ISBN_validation.CheckDigitGenerator(validISBN[0]),
                               'Generated check digits and the actual check digit should match');
        }
    }
    
    @isTest
    Static void ValidatorTest(){
        Final Integer number_Of_Trials = 300;
        
        // Check Books with Wrongformatted ISBNs
        List<Book__c> listOfBooksWithWrongFormattedISBNs = BookWithISBNUtility.createBookWithWrongFormattedISBN(number_Of_Trials);
        try{
            ISBN_validation.ISBNFormatChecker(listOfBooksWithWrongFormattedISBNs);
        }
        catch(Exception customException){
            System.assert(customException.getMessage() == 'ISBN is a 13 or 10 digit code. Please enter 13 or 10 digits only',
                          'ISBN should have an incorrect ISBN format');
        }
        
        // Check Books with invalid ISBNs
        List<Book__c> listOfBooksWithInvalidISBNs = BookWithISBNUtility.createBookWithInvalidISBN(number_Of_Trials);
        try{
            ISBN_validation.ISBNFormatChecker(listOfBooksWithInvalidISBNs);
        }
        catch(Exception customException){
            System.assert(customException.getMessage() == 'This is not a valid ISBN', 'ISBN should be invalid');
        }
        
        // Check Books with valid ISBNs
        List<Book__c> listOfBooksWithValidISBNs = BookWithISBNUtility.createBookWithValidISBN(number_Of_Trials);
        try{
            ISBN_validation.ISBNFormatChecker(listOfBooksWithValidISBNs);
        }
        catch(Exception customException){
            System.assert(customException.getMessage() != Null, 'This should be a valid ISBN');
        }
    }
    
    @isTest
    static void checkNumberOfTrials(){
        System.assertEquals(NULL, ISBNUtility.createInvalidISBNFormat(0));
        System.assertEquals(NULL, ISBNUtility.createValidISBNFormat(0));
        System.assertEquals(NULL, ISBNUtility.createWrongISBNFormat(0));
    }
}