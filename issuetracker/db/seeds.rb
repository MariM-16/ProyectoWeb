# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Usuarios
u = Roll.create(roll:"User")
e = Roll.create(roll:"Executive")
s = Roll.create(roll:"Supervisor")
a = Roll.create(roll:"Admin")

u1 = User.create(email:"maria@gmail.com", first_name:"Maria", last_name: "Marin", phone:"99999", roll:u)
u2 = User.create(email:"santiago@gmail.com", first_name:"Santiago", last_name:"Diaz", phone:"8888", roll:u)
u3 = User.create(email:"calvarez@gmail.com", first_name:"Claudio", last_name: "Alvarez", phone:"2314", roll:u)

e1 = User.create(email: "juan@gmail.com", first_name:"Juan", last_name:"Perez", phone:"12345", roll:e)
e2 = User.create(email: "claudio@gmail.com", first_name:"Claudio", last_name:"Lopez", phone:"12222", roll:e)

s1 = User.create(email: "daniela@gmail.com", first_name:"Daniela", last_name:"Torres", phone:"124234", roll:s)

a1 = User.create(email:"luis@gmail.com", first_name:"Luis", last_name:"Gutierrez", phone:"343534", roll:a)

#Tickets

t1 = Ticket.create(user_id:1, executive_id:4, title:"Tecnic Support", description:"the internet is not running", category: nil, creation_date:"2022-10-24 23:30", resolution_date: nil, limit_date: "2022-10-26 23:30", priority:'High', state:"open", tags:nil, docs: false, key_resolution: nil )
t2 = Ticket.create(user_id:1, executive_id:5, title:"Help", description:"Please Help with my notebook", category: nil, creation_date:"2022-12-23 21:30", resolution_date: nil, limit_date: "2022-12-25 21:30", priority:'Low', state:"open", tags:nil, docs: false, key_resolution: nil )
t3 = Ticket.create(user_id:2, executive_id:4, title:"Tecnic ", description:"the internet is not running", category: nil, creation_date:"2022-05-10 10:30", resolution_date: nil, limit_date: "2022-05-12 10:30", priority:'Half', state:"close", tags:nil, docs: false, key_resolution: nil)
t4 = Ticket.create(user_id:2, executive_id:5, title:"Tecnic Support", description:"the internet is not running", category: nil, creation_date:"2022-04-20 13:30", resolution_date: nil, limit_date: "2022-04-22 13:30", priority:'High', state:"close", tags:nil, docs: false, key_resolution: nil)
t5 = Ticket.create(user_id:2, executive_id:4, title:"Tecnic Support", description:"the internet is not running", category: nil, creation_date:"2022-01-24 22:30", resolution_date: nil, limit_date: "2022-01-26 22:30", priority:nil, state:"open", tags:nil, docs: false, key_resolution: nil )
t6 = Ticket.create(user_id:3, executive_id:4, title:"Support", description:"the internet is not running", category: nil, creation_date:"2022-01-18 22:30", resolution_date: nil, limit_date: "2022-01-20 22:30", priority:nil, state:"close", tags:nil, docs: false, key_resolution: nil)
t7 = Ticket.create(user_id:3, executive_id:4, title:"Support", description:"the internet is not running", category: nil, creation_date:"2022-01-17 22:30", resolution_date: nil, limit_date: "2022-01-19 22:30", priority:nil, state:"close", tags:nil, docs: false, key_resolution: nil)

#Responses

r1=Response.create(user_id:4, ticket_id:1, response:"Solution", response_date:"2022-10-24 23:30")
r2=Response.create(user_id:4, ticket_id:1, response:"Problem", response_date:"2022-10-25 10:30")
r3=Response.create(user_id:4, ticket_id:1, response:"Ready", response_date:"2022-10-25 11:30")
r4=Response.create(user_id:5, ticket_id:2, response:"Internet", response_date:"2022-12-24 23:30")
r5=Response.create(user_id:5, ticket_id:2, response:"Finish", response_date:"2022-12-25 20:30")


#Comments

c1 = Comment.create(ticket_id:1, user_id:4, comment:"User angry", comment_date:"2022-10-24 23:50")
c2 = Comment.create(ticket_id:1, user_id:4, comment:"Internet with problems", comment_date:"2022-10-25 13:10")
c3 = Comment.create(ticket_id:1, user_id:4, comment:"Ready", comment_date:"2022-10-25 15:10")

c4 = Comment.create(ticket_id:2, user_id:5, comment:"Process", comment_date:"2022-12-24 23:50")
c5 = Comment.create(ticket_id:3, user_id:4, comment:"Not solutions", comment_date:"2022-05-10 23:50")
c6 = Comment.create(ticket_id:4, user_id:5, comment:"Problems ready ", comment_date:"2022-04-21 23:50")

#Performances

p1 = Performance.create(user_id:1, executive_id:4, evaluation:1, ticket_id:1)
p2 = Performance.create(user_id:1, executive_id:5, evaluation:2, ticket_id:1)
p3 = Performance.create(user_id:2, executive_id:4, evaluation:3, ticket_id:4)
p4 = Performance.create(user_id:2, executive_id:5, evaluation:4, ticket_id:3)
p5 = Performance.create(user_id:2, executive_id:4, evaluation:5, ticket_id:4)
p6 = Performance.create(user_id:2, executive_id:4, evaluation:5, ticket_id:2)




