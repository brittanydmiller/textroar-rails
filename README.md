##TextRoar
=====
### Phone voting app for audience interaction at events.

MVP

  1. Event Organizer creates an account and sets up a poll with a single question and multiple options.
    a. one vote per number?
    b. how long to accept votes?
  
  2. Event Organizer delivers "database phone number", poll question, option IDs, (and optional passphrase?) to voters.

  3. Voters texts poll # w/ vote

  4. App replies to voter asking how they would like to verify their vote --  with location verify link or with ticket number.

  5. Voter clicks link in SMS, which opens web app page with huge "Verify Location" button, or "Seat Number" button, which they click. (And possibly click "Allow this app to know my location")

  6. Voter's phone submits phone number and GPS location or ticket number to web app (and DB).
  
  7. Texts flow into DB of votes and are parsed/validated.
    a. If a phone number has voted multiple times, the earliest timestamp wins (OR they are thrown out?)
    b. Alternately, make a request to Twilio DB for texts occuring between start_time and end_time, capture these in Ruby, and store into Rails DB for safekeeping

  8. Web app tallies results

  9. Web app outputs results to a view accessible to logged-in poll creator.