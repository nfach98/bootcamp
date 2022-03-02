import 'package:bootcamp/models/post_model.dart';
import 'package:bootcamp/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  TextEditingController searchController = TextEditingController();

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
            title: TextField(
              controller: searchController,
              keyboardType: const TextInputType.numberWithOptions(
                signed: false,
                decimal: false
              ),
              style: const TextStyle(
                color: Colors.white
              ),
              decoration: InputDecoration(
                hintText: "Search by id",
                hintStyle: const TextStyle(
                  color: Colors.white38
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    if (searchController.text.isNotEmpty) {
                      searchController.clear();
                      Provider.of<PostProvider>(context, listen: false).getPosts();
                    }
                  },
                  splashRadius: 16,
                  icon: const Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  try {
                    int id = int.parse(value);
                    Provider.of<PostProvider>(context, listen: false).getPost(id: id);
                  }
                  catch(e) {
                    print("Not a number");
                  }
                }
                else {
                  Provider.of<PostProvider>(context, listen: false).getPosts();
                }
              },
            ),
          ),
          body: ListView.separated(
            itemCount: posts.length,
            itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${posts[index].id ?? ""} - ${posts[index].title ?? ""}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    posts[index].body ?? "",
                  ),
                ],
              ),
            ),
            separatorBuilder: (_, index) => const SizedBox(height: 12),
          ),
        );
      }
    );
  }
}
