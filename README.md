PDT Overview :
------------
* Payment Data Transfer (PDT) is a secure method to retrieve the details about a PayPal transaction so that you can 
  display them to your customer. It is used in combination with Website Payments Standard, so that after a customer 
  returns to your website after paying on the PayPal site, they can instantly view a confirmation message with the 
  details of the transaction.

PDT How to run?
--------------
* Enable PDT for your PayPal account.
  * Log in to your PayPal account.
  * Click the Profile subtab.
  * Click the My Selling Tools button in the left column.
  * Find the Selling online section and click Update in the Website preferences row.
  * Under Auto Return for Website Payments, click the On radio button.
  * For the Return URL, enter the URL on your site that will receive the transaction ID posted by 
    PayPal after a customer payment.
  * Under Payment Data Transfer, click the On radio button.
  * Click Save.
  * Find the Selling online section and click Update in the Website preferences row again.
  * Scroll down to the Payment Data Transfer section of the page and take note of your PDT identity token.
* Create a button. The PayPal buttons consist of a form which has a number of hidden key/value pairs and a submit button.
  You can find info on how to make those in their Website Payments Standard Integration Guide.
* A transactionId will be returned in the returnURL.
* POST request back to PayPal with TransactionId and PDT identity token as specified in scripts above in different language.  
* Check the response. The first variable is 'SUCCESS' followed by PDT variables. if it is a failure, the 
 first variable will be a 'FAIL'. 
    
PDT Reference :
--------------
* You can refer PDT at [https://www.x.com/developers/paypal/documentation-tools/paypal-code-samples#paymentdatatransfer]