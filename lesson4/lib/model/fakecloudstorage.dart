class Book{
  int id; // unique auto generated
  String title;
  double price;
  String author;
  String description;
  String imageURL;

  static int idGen = 0;

  Book({
    this.title, this.price, this.author, this.description, this.imageURL
  }){
    id = idGen++;
  }
}

class MyCloud{
  static var booksDB = <Book>[
    Book(
      title:'Intro to flutter',
      author: 'Bill',
      price: 29.95,
      description: 'This is a fun book',
      imageURL: 'https://images-na.ssl-images-amazon.com/images/I/41aJnFuCBWL._SX331_BO1,204,203,200_.jpg'
    ),
    Book(
      title:'Intro to flutter1',
      author: 'Bill1',
      price: 29.96,
      description: 'This is a fun book1',
      imageURL: 'https://images-na.ssl-images-amazon.com/images/I/51u8ZRDCVoL._SX330_BO1,204,203,200_.jpg'
    ),
    Book(
      title:'Intro to flutter2',
      author: 'Bill2',
      price: 29.97,
      description: 'This is a fun book2',
      imageURL: 'https://images-na.ssl-images-amazon.com/images/I/51uzRQaw-FL._AC_SR201,266_.jpg'
    ),
    Book(
      title:'Intro to flutter3',
      author: 'Bill3',
      price: 29.98,
      description: 'This is a fun book3',
      imageURL: 'https://images-na.ssl-images-amazon.com/images/I/818hhP%2B6r0L.__SL440_PJku-sticker-v7,TopRight,0,-44AC_SR201,266_OU1_.jpg'
    ),
    Book(
      title:'Intro to flutter4',
      author: 'Bill4',
      price: 29.99,
      description: 'This is a fun book4',
      imageURL: 'https://images-na.ssl-images-amazon.com/images/I/818hhP%2B6r0L.__SL440_PJku-sticker-v7,TopRight,0,-44AC_SR201,266_OU1_.jpg'
    ),Book(
      title:'Intro to flutter5',
      author: 'Bill5',
      price: 29.00,
      description: 'This is a fun book5',
      imageURL: 'https://images-na.ssl-images-amazon.com/images/I/818hhP%2B6r0L.__SL440_PJku-sticker-v7,TopRight,0,-44AC_SR201,266_OU1_.jpg'
    ),
    Book(
      title:'Intro to flutter6',
      author: 'Bill6',
      price: 29.01,
      description: 'This is a fun book6',
      imageURL: 'https://images-na.ssl-images-amazon.com/images/I/818hhP%2B6r0L.__SL440_PJku-sticker-v7,TopRight,0,-44AC_SR201,266_OU1_.jpg'
    ),
    Book(
      title:'Intro to flutter7',
      author: 'Bill7',
      price: 29.95,
      description: 'This is a fun book7',
      imageURL: 'https://images-na.ssl-images-amazon.com/images/I/41aJnFuCBWL._SX331_BO1,204,203,200_.jpg'
    ),
    Book(
      title:'Intro to flutter8',
      author: 'Bill8',
      price: 29.96,
      description: 'This is a fun book8',
      imageURL: 'https://images-na.ssl-images-amazon.com/images/I/51u8ZRDCVoL._SX330_BO1,204,203,200_.jpg'
    ),
    Book(
      title:'Intro to flutter9',
      author: 'Bill9',
      price: 29.97,
      description: 'This is a fun book9',
      imageURL: 'https://images-na.ssl-images-amazon.com/images/I/51uzRQaw-FL._AC_SR201,266_.jpg'
    ),
    Book(
      title:'Intro to flutter10',
      author: 'Bill10',
      price: 29.98,
      description: 'This is a fun book10',
      imageURL: 'https://images-na.ssl-images-amazon.com/images/I/818hhP%2B6r0L.__SL440_PJku-sticker-v7,TopRight,0,-44AC_SR201,266_OU1_.jpg'
    ),
    Book(
      title:'Intro to flutter11',
      author: 'Bill11',
      price: 29.99,
      description: 'This is a fun book11',
      imageURL: 'https://images-na.ssl-images-amazon.com/images/I/818hhP%2B6r0L.__SL440_PJku-sticker-v7,TopRight,0,-44AC_SR201,266_OU1_.jpg'
    ),Book(
      title:'Intro to flutter12',
      author: 'Bill12',
      price: 29.00,
      description: 'This is a fun book12',
      imageURL: 'https://images-na.ssl-images-amazon.com/images/I/818hhP%2B6r0L.__SL440_PJku-sticker-v7,TopRight,0,-44AC_SR201,266_OU1_.jpg'
    ),
    Book(
      title:'Intro to flutter13',
      author: 'Bill13',
      price: 29.01,
      description: 'This is a fun book13',
      imageURL: 'https://images-na.ssl-images-amazon.com/images/I/818hhP%2B6r0L.__SL440_PJku-sticker-v7,TopRight,0,-44AC_SR201,266_OU1_.jpg'
    ),
    Book(
      title:'Intro to flutter14',
      author: 'Bill14',
      price: 29.00,
      description: 'This is a fun book14',
      imageURL: 'https://images-na.ssl-images-amazon.com/images/I/818hhP%2B6r0L.__SL440_PJku-sticker-v7,TopRight,0,-44AC_SR201,266_OU1_.jpg'
    ),
    Book(
      title:'Intro to flutter15',
      author: 'Bill15',
      price: 29.01,
      description: 'This is a fun book15',
      imageURL: 'https://images-na.ssl-images-amazon.com/images/I/818hhP%2B6r0L.__SL440_PJku-sticker-v7,TopRight,0,-44AC_SR201,266_OU1_.jpg'
    ),
  ];
}