using System;
using System.Text.RegularExpressions;


namespace TestProject
{
    public  class Utilities
    {
        
        /*Regular expression for the phone number field validation*/
        public const string regexpression = @"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$";
        
        /*This method implements the Regular expression*/
        private bool IsPhoneNbr(string number)
        {
            if (number != null) return Regex.IsMatch(number, regexpression);
            else return false;
        }


         public string Validate(string _Id, string _FirstName, string _LastName, string _PhoneNumber, string _ZipCode,string _HireDate)
        {
            string _message = "";

            if (String.IsNullOrEmpty(_Id))
            {
                _message = "The Id cannot be empty.";
                return _message;
            }

            if (String.IsNullOrEmpty(_FirstName))
            {
                _message = "The First name cannot be empty.";
                return _message;
            }
            if (String.IsNullOrEmpty(_LastName))
            {
                _message = "The Last name cannot be empty.";
                return _message;
            }

            if (!String.IsNullOrEmpty(_PhoneNumber) && !IsPhoneNbr(_PhoneNumber))
            {
                _message = "The format of Phone Number is incorrect.";
                return _message;
            }
            if (_HireDate == "")
            {
                _message = "The Hire Date cannot be null.";
                return _message;
            }



            return _message;
        }
    }
}