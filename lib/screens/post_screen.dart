import 'package:bootcamp/models/post_model.dart';
import 'package:bootcamp/providers/post_provider.dart';
import 'package:bootcamp/screens/post_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<PostProvider>(context, listen: false).getPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (context, provider, _) {
        List<PostModel> posts = provider.posts;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Posts"),
          ),
          body: ListView.separated(
            itemCount: posts.length,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  if (posts[index].id != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => PostDetailScreen(id: posts[index].id!))
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        posts[index].title ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        posts[index].body ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, index) => const SizedBox(height: 12),
          ),
        );
      }
    );
  }
}
