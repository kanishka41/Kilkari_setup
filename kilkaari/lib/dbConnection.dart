import 'dart:developer';

import 'package:kilkaari/we_women/models/blogPost.dart';
import 'package:mongo_dart/mongo_dart.dart';

final DB_CONNECTION_URL =
    "mongodb+srv://women:women@cluster0.zimpg2o.mongodb.net/?retryWrites=true&w=majority";
final USER_COLLECTION = "BlogPost";

class dbConnection {
  static var db, userConnection;
  static connect() async {
    db = await Db.create(DB_CONNECTION_URL);
    db.open();
    inspect(db);
    print("???????????????????DB?????????????????????????");

    userConnection = db.collection(USER_COLLECTION);
  }

  static Future<List<Map<String, dynamic>>> getPosts() async {
    final arrPosts = await userConnection.find().toList();
    print("Got the data");
    print(arrPosts);
    return arrPosts;
  }

  static insertPost(Post post) async {
    try {
      var result = await userConnection.insertOne(post.toMap());
      print("Everything great , working fine now , inserted everything");

      print(result.toString());
    } catch (e) {
      log(e.toString(), error: e);
      print(e);
      print("Something went wrong, Kuch toh gadbad hai daya ");
    }
  }

  static updateLikeCount(String postId, int newLikeCount) async {
    try {
      var result = await userConnection.updateOne(
        where.eq('id', postId),
        modify.set('likeCount', newLikeCount),
      );
      print("Like count modified successfullt");
    } catch (e) {
      log(e.toString(), error: e);
      print("Failed to update like count");
      print(e);
    }
  }
}