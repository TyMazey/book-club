# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Author.destroy_all
dante = Author.create(name: 'Dante Alighieri')
j_milton = Author.create(name: 'John Milton')
john_s = Author.create(name: 'John Steinbeck')
g_orewell = Author.create(name: 'George Orwell')
w_rawls = Author.create(name: 'Wilson Rawls')
harper_l = Author.create(name: 'Harper Lee')
a_huxly = Author.create(name: 'Aldous Huxley')
o_scott = Author.create(name: ' Orson Scott Card')
a_burgess = Author.create(name: 'Anthony Burgess')
p_coelho = Author.create(name: 'Paulo Coelho')
t_pratchett = Author.create(name: 'Terry Pratchett')
n_gaimen = Author.create(name: 'Neil Gaiman')

Book.destroy_all
Book.create(title: 'The Divine Comedy', pages: 352, year_published: 1320, thumbnail: 'https://prodimage.images-bn.com/pimages/9781435162082_p0_v2_s550x406.jpg', authors: [dante])
Book.create(title: 'Paradise Lost', pages: 453, year_published: 1667, thumbnail: 'https://images-na.ssl-images-amazon.com/images/I/915bZ41fJxL.jpg', authors: [j_milton])
Book.create(title: 'Grapes of Wrath', pages: 464, year_published: 1939, thumbnail: 'https://www.abc.net.au/radionational/image/4574960-3x4-340x453.jpg', authors: [john_s])
Book.create(title: '1984', pages: 328, year_published: 1984, thumbnail: 'https://dynamic.indigoimages.ca/books/1782127755.jpg?altimages=false&scaleup=true&maxheight=515&width=380&quality=85&sale=84&lang=en', authors: [g_orewell])
Book.create(title: 'Where the Red Fern Grows', pages: 245, year_published: 1961, thumbnail: 'http://www.setonbooks.com/sempics/P-EN09-1510941.JPG', authors: [w_rawls])
Book.create(title: 'To Kill a Mocking Bird', pages: 281, year_published: 1960, thumbnail: 'https://www.scholastic.com/content5/media/products/89/9780446310789_mres.jpg', authors: [harper_l])
Book.create(title: 'Of Mice and Men', pages: 187, year_published: 1937, thumbnail: 'https://prodimage.images-bn.com/pimages/9780142000670_p0_v1_s550x406.jpg', authors: [john_s])
Book.create(title: 'Animal Farm', pages: 112, year_published: 1945, thumbnail: 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/1410/9780141036137.jpg', authors: [g_orewell])
Book.create(title: 'Brave New World', pages: 311, year_published: 1932, thumbnail: 'https://images-na.ssl-images-amazon.com/images/I/41l%2B4UobkRL._SX325_BO1,204,203,200_.jpg', authors: [a_huxly])
Book.create(title: 'Enders Game', pages: 324, year_published: 1985, thumbnail: 'https://images.gr-assets.com/books/1528385187l/901.jpg', authors: [o_scott])
Book.create(title: 'A Clockwork Orange', pages: 192, year_published: 1962, thumbnail: 'https://covers.openlibrary.org/w/id/7883937-L.jpg', authors: [a_burgess])
Book.create(title: 'The Alchemist', pages: 163, year_published: 1988, thumbnail: 'https://img.clasf.co.za/2017/04/25/The-Alchemist-Hardcover-Pocket-edition-20170425111014.jpg', authors: [p_coelho])
Book.create(title: 'Good Omens', pages: 288, year_published: 1990, thumbnail: 'https://bookfightpod.files.wordpress.com/2015/07/gaiman.jpg', authors: [t_pratchett, n_gaimen])
