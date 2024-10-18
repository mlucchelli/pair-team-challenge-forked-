# Ruby on Rails challenge

You're working for a healthcare startup that is building a platform to facilitate communication between doctors and their patients. A key feature of the system is the ability for doctors to place calls to patients.
A third-party telephony service, similar to Twilio, is available to handle the actual placing of calls. You don’t need to implement the telephony functionality yourself but should make use of this service in your API.

### Problem Statement

You need to design and implement a RESTful API for handling the following use cases:

1. **Initiate a call immediately:** A doctor should be able to initiate a call with a patient on demand.
1. **End ongoing call:** A doctor should be able to stop the ongoing call anytime.
1. **Fetch patient call history:** Retrieve a log of all the calls made between a doctor and a patient.

And receive data from a webhook  
**Update call details:** the 3rd party provider will send a call summary which includes the duration and transcript.

The webhook request contains the following body

```json
{
  "event_type": "call_update",
  "call_id": "6ba3d52e-48b9-4900-845e-edd965109e86",
  "status": "completed",
  "duration": 123,
  "transcript": [
    "Hey there!",
    "Hi!"
  ],
  ...
}
```

---

## Existing REST API

### Get list of Users

#### Request

`GET /users/`

    curl -H 'Accept: application/json' http://localhost:3000/users

#### Response

    HTTP/2 200 OK
    Content-Type: application/json

    {"users":[{"id":"13b9b381-e6ed-459f-b649-5688128eac94","email":"john.9055@pairteam.com",
    "name":"John 9055","phone_number":"(555) 555-9055","created_at":"2024-10-16T15:59:26.296Z",
    "updated_at":"2024-10-16T15:59:26.296Z"}]}

### Create a random User

#### Request

`POST /users/create_random_user`

    curl -H 'Accept: application/json' -X POST  http://localhost:3000/users/create_random_user

#### Response

    HTTP/2 201 Created
    Status: 201 Created
    Content-Type: application/json

    {"id":"13b9b381-e6ed-459f-b649-5688128eac94","email":"john.9055@pairteam.com",
    "name":"John 9055","phone_number":"(555) 555-9055","created_at":"2024-10-16T15:59:26.296Z",
    "updated_at":"2024-10-16T15:59:26.296Z"}
