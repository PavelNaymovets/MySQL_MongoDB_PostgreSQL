#Запрос 1. Топ 5 популярных кухонь New-York.

db.restaurants.aggregate([{$group:{_id: '$cuisine', count: {$sum:1}}}, {$sort:{count:-1}}, {$limit:5}])

#Результат.

{ _id: 'American ', count: 6183 }
{ _id: 'Chinese', count: 2418 }
{ _id: 'Café/Coffee/Tea', count: 1214 }
{ _id: 'Pizza', count: 1163 }
{ _id: 'Italian', count: 1069 }

#Запрос 2. Сколько пиццерий в Queens.

db.restaurants.aggregate([{$match:{$and: [{borough: "Queens"},{cuisine: 'Pizza'}]}},{$group:{_id: '$cuisine', count: {$sum:1}}}])

#Результат.

{ _id: 'Pizza', count: 277 }

#Запрос 3. Количество ресторанов с китайской кухней с оценкой 'A' в Staten Island по оценкам посетителей.

db.restaurants.aggregate([{$match:{$and: [{borough: 'Staten Island'}, {cuisine: 'Chinese'}, {"grades.grade": 'A'}]}},{$group:{_id: '$cuisine', count: {$sum:1}}}])

#Результат.

{ _id: 'Chinese', count: 79 }

Количество ресторанов с китайской кухней с оценкой 'B' в Staten Island по оценкам посетителей.

db.restaurants.aggregate([{$match:{$and: [{borough: 'Staten Island'}, {cuisine: 'Chinese'}, {"grades.grade": 'B'}]}},{$group:{_id: '$cuisine', count: {$sum:1}}}])

#Результат.

{ _id: 'Chinese', count: 39 }

Количество ресторанов с китайской кухней с оценкой 'C' в Staten Island по оценкам посетителей.

db.restaurants.aggregate([{$match:{$and: [{borough: 'Staten Island'}, {cuisine: 'Chinese'}, {"grades.grade": 'C'}]}},{$group:{_id: '$cuisine', count: {$sum:1}}}])

#Результат.

{ _id: 'Chinese', count: 10 }

#Запрос 4. Рестораны с китайской кухней с оценкой 'A' в Staten Island по оценкам посетителей топ 5.

db.restaurants.find({$and: [{borough: 'Staten Island'}, {cuisine: 'Chinese'}, {"grades.grade": 'A'}]}, {name:1, _id:0, cuisine:1}).limit(5)

#Результат.

{ cuisine: 'Chinese', name: 'Chen\'S Chinese' }
{ cuisine: 'Chinese', name: 'Island Taste' }
{ cuisine: 'Chinese', name: 'Master Wok' }
{ cuisine: 'Chinese', name: 'Happy Fortune Ii' }
{ cuisine: 'Chinese', name: 'Jade Island Restaurant' }