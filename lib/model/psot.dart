class Post{
  String id, title , content ,dateWritten,featuredImage;
  int voteUP, voteDown ;
  List<int> voterUp, voterDown;
  int userId, categoryId;

  Post({this.id,
    this.title,
    this.content,
    this.dateWritten,
    this.featuredImage,
    this.voteUP,
    this.voteDown,
    this.voterUp,
    this.voterDown,
    this.userId,
    this.categoryId}
      );
}