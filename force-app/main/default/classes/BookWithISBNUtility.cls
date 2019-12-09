public class BookWithISBNUtility {
    
    public static List<Book__c> createBookWithWrongFormattedISBN(Integer number_Of_Trials){
        List<String> listOfWrongFormattedISBNs = ISBNUtility.createWrongISBNFormat(number_Of_Trials);
        List<Book__c> listOfBooks = new List<Book__c>();
        
        for(String singleISBN :listOfWrongFormattedISBNs){
            listOfBooks.add(new Book__c(ISBN__c = singleISBN));
        }
        return listOfBooks;
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public static List<Book__c> createBookWithInvalidISBN(Integer number_Of_Trials){
        List<List<String>> listOfInvalidISBNs = ISBNUtility.createInvalidISBNFormat(number_Of_Trials);
        List<Book__c> listOfBooks = new List<Book__c>();
        
        for(List<String> singleISBN :listOfInvalidISBNs){
            listOfBooks.add(new Book__c(ISBN__c = singleISBN[0]));
        }
        return listOfBooks;
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public static List<Book__c> createBookWithValidISBN(Integer number_Of_Trials){
        List<List<String>> listOfValidISBNs = ISBNUtility.createValidISBNFormat(number_Of_Trials);
        List<Book__c> listOfBooks = new List<Book__c>();
        
        for(List<String> singleISBN :listOfValidISBNs){
            listOfBooks.add(new Book__c(ISBN__c = singleISBN[0]));
        }
        return listOfBooks;
    }
}