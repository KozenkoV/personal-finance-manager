CATEGORY_1 = Category.create!(name: 'Продукти харчування', description: 'Витрати на продукти')
CATEGORY_2 = Category.create!(name: 'Харчування', description: 'Витрати на обіди, сніданки в закладах громадського харчування')
CATEGORY_3 = Category.create!(name: 'Відпочинок', description: 'Витрати на гулянки, туризм')

Transaction.create!(transaction_type: 'Витрата', total: 45.00, description: 'Акрополь', category: CATEGORY_2)
Transaction.create!(transaction_type: 'Продукти харчування', total: 200.00, description: 'Продукти', category: CATEGORY_1)
Transaction.create!(transaction_type: 'Витрата', total: 50.00, description: 'Обід в Коморі', category: CATEGORY_2)