import 'package:flutter/material.dart';
import 'package:planty/models/feed_post_model.dart' as model;
import 'package:planty/models/user_model.dart';

class FeedPost extends StatelessWidget {
  User _user;
  model.FeedPost _feedPost;

  FeedPost(this._user, this._feedPost);


  void showComments(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Container(
        height: 200,
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text("Comments"),
            ),
            Expanded(
              child: _feedPost.amountOfComments() > 0
                  ? ListView.builder(
                itemCount: _feedPost.amountOfComments(),
                itemBuilder: (ctx, i) {
                  return Container(
                    child: Row(
                      children: <Widget>[
                        Text(_feedPost.comments
                            .elementAt(i)
                            .author),
                        SizedBox(
                          width: 10,
                        ),
                        Text(_feedPost.comments
                            .elementAt(i)
                            .text),
                      ],
                    ),
                  );
                },
              )
                  : Center(
                child: Text("No Comments"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                child: GestureDetector(
                  onTap: () {}, //TODO show profile
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        child:
                        _user.profilePicture.isEmpty
                            ? Icon(Icons.person)
                            : Image.network(_user.profilePicture,),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        _feedPost.author,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                _feedPost.images.elementAt(0),
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                height: 300,
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              Row(
                children: <Widget>[
                  Text("Likes: ${_feedPost.amountOfLikes()}"),
                  SizedBox(
                    width: 10,
                  ),
                  Text(_feedPost.description),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("${_feedPost.amountOfComments()} Comments"),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      return showComments(context);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
