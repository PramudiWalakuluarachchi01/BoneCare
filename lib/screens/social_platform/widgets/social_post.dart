import 'package:bone_care/screens/social_platform/post_image_view_screen.dart';
import 'package:bone_care/screens/social_platform/widgets/comment_section_builder.dart';
import 'package:bone_care/services/social_platform_service.dart';
import 'package:bone_care/utils/navigation/custom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class SocialPost extends StatefulWidget {
  final String postID;
  final List<String> imageUrls;
  final String userName;
  final String caption;
  final String timeStamp;
  final String userProfilePicURL;
  final int likedCount;
  final bool userLikedStatus;

  const SocialPost({
    super.key,
    required this.imageUrls,
    required this.userName,
    required this.caption,
    required this.timeStamp,
    required this.userProfilePicURL,
    required this.postID,
    required this.likedCount,
    required this.userLikedStatus,
  });

  @override
  State<SocialPost> createState() => _SocialPostState();
}

class _SocialPostState extends State<SocialPost> {
  late bool likedStatus;
  late int likedCount;

  @override
  void initState() {
    super.initState();
    likedStatus = widget.userLikedStatus;
    likedCount = widget.likedCount;
  }

  void _toggleLike() async {
    try {
      final newLikedStatus =
          await SocialPlatformService().toggleLike(widget.postID);
      setState(() {
        likedStatus = newLikedStatus;
        likedCount += likedStatus ? 1 : -1;
      });
    } catch (e) {
      Logger().e('Failed to toggle like: $e');
    }
  }

  Widget buildImages() {
    int count = widget.imageUrls.length;
    if (count == 1) {
      return Image.network(widget.imageUrls[0],
          width: double.infinity, fit: BoxFit.cover);
    } else if (count == 3) {
      // Handling 3 images: one on top and two below
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Image.network(widget.imageUrls[0],
                width: double.infinity, height: 200, fit: BoxFit.cover),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 2.5),
                  child: Image.network(widget.imageUrls[1], fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 2.5),
                  child: Image.network(widget.imageUrls[2], fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ],
      );
    } else if (count == 2) {
      return Row(
        children: widget.imageUrls
            .map((url) => Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(1),
                    child: Image.network(url, fit: BoxFit.cover),
                  ),
                ))
            .toList(),
      );
    } else {
      int gridCount = (count > 4) ? 4 : count;
      return GridView.builder(
        shrinkWrap: true,
        physics:
            const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          childAspectRatio: 1.4, // Aspect ratio of each grid cell
          crossAxisSpacing: 5, // Horizontal space between items
          mainAxisSpacing: 5, // Vertical space between items
        ),
        itemCount: gridCount,
        itemBuilder: (context, index) {
          bool isLast = index == gridCount - 1 && count > 4;
          return isLast
              ? Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(widget.imageUrls[index], fit: BoxFit.cover),
                    Container(
                      color: Colors.black45,
                      alignment: Alignment.center,
                      child: Text(
                        '+${count - 3}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              : Image.network(widget.imageUrls[index], fit: BoxFit.cover);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(10, 255, 255, 255),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: widget.userProfilePicURL != ''
                            ? NetworkImage(widget.userProfilePicURL)
                            : const AssetImage(
                                'assets/images/default_profile_icon.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Jura',
                        ),
                      ),
                      Text(
                        DateFormat('dd MMM yyyy')
                            .format(DateTime.parse(widget.timeStamp)),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontFamily: 'Jura',
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // IconButton(
              //   onPressed: () {},
              //   icon: const Icon(
              //     Icons.more_horiz,
              //     size: 32,
              //     color: Colors.white,
              //   ),
              // ),
            ],
          ),
          Text(
            widget.caption,
            style: const TextStyle(
              fontFamily: 'Jura',
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Customnavigation.nextPage2(
                  context, PostImageViewScreen(imageList: widget.imageUrls));
            },
            child: buildImages(),
          ),
          const Divider(),
          likedCount != 0
              ? Text(
                  'Likes: ${likedCount.toString()}',
                  style:
                      const TextStyle(color: Colors.black, fontFamily: 'Jura'),
                )
              : const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: _toggleLike,
                child: Row(
                  children: [
                    Icon(
                      likedStatus
                          ? Icons.thumb_up_alt_rounded
                          : Icons.thumb_up_outlined,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'Like',
                      style: TextStyle(fontFamily: 'Jura', color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () => CommentSectionBuilder().showBottomSheet(
                  context,
                  widget.postID,
                ),
                child: const Row(
                  children: [
                    Icon(
                      CupertinoIcons.chat_bubble_fill,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Comment',
                      style: TextStyle(fontFamily: 'Jura', color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
