class Book {

  String documentId; //firestore doc id
  String title;
  String author;
  int pubyear;
  String imageUrl;
  String review;
  String createdBy;
  DateTime lastUpdatedAt; // created or revised
  List<dynamic> sharedWith;

  Book({
    this.title,
    this.author,
    this.pubyear,
    this.imageUrl,
    this.review,
    this.createdBy,
    this.lastUpdatedAt,
    this.sharedWith,
  });

  Map<String, dynamic> serialize(){
    return <String, dynamic>{
      TITLE: title,
      AUTHOR: author,
      PUBYEAR: pubyear,
      IMAGEURL: imageUrl,
      REVIEW: review,
      CREATEDBY: createdBy,
      LASTUPDATEDAT: lastUpdatedAt,
      SHAREDWITH: sharedWith,
    };
  }

  Book.empty(){
    this.title = '';
    this.author = '';
    this.pubyear = 2000;
    this.imageUrl = '';
    this.review = '';
    this.createdBy = '';
    this.sharedWith = <dynamic>[];
  }

  Book.clone(Book b){
    this.documentId = b.documentId;
    this.title = b.title;
    this.author = b.author;
    this.pubyear = b.pubyear;
    this.imageUrl = b.imageUrl;
    this.review = b.review;
    this.createdBy = b.createdBy;
    this.lastUpdatedAt = b.lastUpdatedAt;
    this.sharedWith = <dynamic>[]..addAll(b.sharedWith);
  }


  static Book deserialize(Map<String, dynamic> data, String docId){
    var book = Book(
      title: data[Book.TITLE],
      author: data[Book.AUTHOR],
      pubyear: data[Book.PUBYEAR],
      imageUrl: data[Book.IMAGEURL],
      review: data[Book.REVIEW],
      createdBy: data[Book.CREATEDBY],
      sharedWith: data[Book.SHAREDWITH],
    );
    if(data[Book.LASTUPDATEDAT] != null){
      book.lastUpdatedAt = DateTime.fromMillisecondsSinceEpoch(
        data[Book.LASTUPDATEDAT].millisecondsSinceEpoch
      );
    }
    book.documentId = docId;
    return book;
  }

  

  static const BOOKCOLLECTION = 'books';
  static const TITLE = 'title';
  static const AUTHOR = 'author';
  static const PUBYEAR = 'pubyear';
  static const IMAGEURL = 'imageUrl';
  static const REVIEW = 'review';
  static const CREATEDBY = 'createdBy';
  static const LASTUPDATEDAT = 'lastUpdatedAt';
  static const SHAREDWITH = 'sharedWith';
  

}