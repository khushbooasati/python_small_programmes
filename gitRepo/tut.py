import os
from twilio.rest import Client


# Find your Account SID and Auth Token at twilio.com/console
# and set the environment variables. See http://twil.io/secure
# account_sid = os.environ['TWILIO_ACCOUNT_SID']
account_sid = 'ACa80f15f19ac34c3b782f62581040f049'
# auth_token = os.environ['TWILIO_AUTH_TOKEN']
auth_token = 'eb32d780eac2c2cf6891a1b62faea3bc'
client = Client(account_sid, auth_token)

message = client.messages \
                .create(
                     body="Join Earth's mightiest heroes. Like Kevin Bacon.",
                     from_='+16084969727',
                     to='+916265302610'
                 )

print(message.sid)