import 'package:flutter/material.dart';

class FeedPost {
  String author;
  List<String> images;
  String description;
  List<String> likes;
  List<Comment> comments;

  FeedPost({
    @required this.author,
    @required this.images,
    @required this.description,
    this.comments,
    this.likes

  });

  int amountOfLikes() {
    return likes == null ? 0: likes.length;
  }

  int amountOfComments() {
    return comments == null? 0: comments.length;
  }
}

class Comment {
  String author;
  String text;

  Comment({this.author, this.text});
}