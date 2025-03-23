import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SocialPostsProvider with ChangeNotifier {
  final List<dynamic> _posts = [];
  bool _isLoading = true;
  int _offset = 0;
  final int _limit = 30;
  bool _hasMorePosts = true;

  List<dynamic> get posts => _posts;
  bool get isLoading => _isLoading;
  bool get hasMorePosts => _hasMorePosts;

  Future<void> fetchPosts({bool isRefresh = false}) async {
    if (isRefresh) {
      _posts.clear();
      _offset = 0;
      _hasMorePosts = true;
    }

    if (_hasMorePosts) {
      try {
        _isLoading = true;
        notifyListeners();

        var fetchedPosts = [
          {
            "postID": 4,
            "content":
                "This app keeps me on track with my therapy! 💪 #BoneHealth",
            "timestamp": "2024-08-19T19:03:48.000Z",
            "userID": 1,
            "firstName": "Pramudi",
            "lastName": "Nethmini",
            "like_count": 1,
            "liked": true,
            "imageIds": [],
            "profilePictureId": 4
          },
          {
            "postID": 3,
            "content":
                "Living with osteoporosis has been challenging, but this app has made it easier to follow my physiotherapy routine. The video guides and progress tracking keep me motivated every day! 💙 #BoneHealth #StayStrong",
            "timestamp": "2024-08-17T07:33:43.000Z",
            "userID": 2,
            "firstName": "Thilini",
            "lastName": "Pushpawela",
            "like_count": 2,
            "liked": true,
            "imageIds": [],
            "profilePictureId": null
          },
          {
            "postID": 2,
            "content": "Feeling stronger every day! 🦴💙 #StayActive",
            "timestamp": "2024-08-08T19:53:48.000Z",
            "userID": 1,
            "firstName": "Pramudi",
            "lastName": "Nethmini",
            "like_count": 3,
            "liked": true,
            "imageIds": [],
            "profilePictureId": 4
          },
          {
            "postID": 1,
            "content": "Helpful tips and videos! 🎥✨ #StayStrong",
            "timestamp": "2024-08-08T18:30:52.000Z",
            "userID": 1,
            "firstName": "Thilini",
            "lastName": "Pushpawela",
            "like_count": 0,
            "liked": false,
            "imageIds": [],
            "profilePictureId": 4
          }
        ];
        // var fetchedPosts = await SocialPlatformService()
        //     .fetchPosts(offset: _offset, limit: _limit);

        if (fetchedPosts.isNotEmpty) {
          _posts.addAll(fetchedPosts);
          _offset += _limit;
        } else {
          _hasMorePosts = false;
        }
      } catch (e) {
        Logger().e('Error fetching posts: $e');
      } finally {
        _isLoading = false;
        notifyListeners();
      }
    }
  }
}
