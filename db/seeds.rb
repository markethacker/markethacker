# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create({uid: "20151024001", name: "test01", pass: "123456"})
product = Product.create({pid: "6920202888883", name: "RedBull", price: 6.00, desc: "This is a Red Bull"})
order = Order.create({oid: "2015102400001", user: user, status: false, amount: 12.00})
order_detail = OrderDetail.create({order: order, product: product, count: 2, price: 6.00})