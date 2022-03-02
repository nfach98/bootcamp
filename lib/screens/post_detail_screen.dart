import 'package:bootcamp/models/post_model.dart';
import 'package:bootcamp/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostDetailScreen extends StatefulWidget {
  final int id;

  const PostDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<PostProvider>(context, listen: false).getPost(id: widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (context, provider, _) {
        PostModel? post = provider.post;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Post detail"),
          ),
          body: post == null
            ? Container()
            : Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    post.body ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
        );
      }
    );
  }
}
