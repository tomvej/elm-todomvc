# Server start
* `npm install`
* `npm start`
* started on localhost:8080
 
# API

 ## Example entity
 ```
 {
   "id": "f7a67fb0-76bd-11e7-be2e-8fe734dbe800",
   "text": "text",
   "completed": true,
   "createdDate": 1501594393387,
   "completedDate": 1501594873717
 }
 ```   

 ## GET /todos
 returns all todos
 
 ## POST /todos
 body `{"text":"..."}`
 
 creates todo with given text, then returns it
 
 ## GET /todos/completed
 returns all completed todos
  
 ## GET /todos/incompleted
 returns all uncompleted todos
 
 ## POST /todos/{id}
 body `{"text":"..."}`
 
 updates text of given TODO
 
 ## DELETE /todos/{id}
 deletes given todo
  
 ## POST /todos/{id}/complete
 completes given todo, then returns modified todo
 
 ## POST /todos/{id}/incomplete
 incompletes given todo, then returns modified todo