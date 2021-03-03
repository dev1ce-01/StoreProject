using System;
using System.Collections.Generic;
using System.Text;
using Twilio;
using Twilio.Rest.Api.V2010.Account;

namespace ConnectionLesson.Services
{
  public class TwillioMessageSender
  {
    public string MobileNumber { get;set;}
    public string SendMessage()
    { 
    var random = new Random();
    string codeTelephone = Convert.ToString(random.Next(1000, 100000));

    string accountSid = ("AC158ee0f159e5c5b155a0c817ec95d1c0");
    string authToken = ("bddc833e75d81ba952baf1edc03aa9bf");

    TwilioClient.Init(accountSid, authToken);

    var message = MessageResource.Create(
            body: codeTelephone,
            from: new Twilio.Types.PhoneNumber("+12059473455"),
            to: new Twilio.Types.PhoneNumber($"+{MobileNumber}")
        );
    return codeTelephone;

    }
  }
}
