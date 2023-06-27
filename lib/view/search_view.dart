import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:ninjanews/view/post_detail_view.dart';

import '../repository/post_repository.dart';
import '../utils/generics/generics.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchQuery = '';
  List<dynamic> searchResults = [];

  void searchPosts() async {
    // PostRepository.searchApi() metodunu kullanarak API'ye istek atın
    var response = await PostRepository().searchApi(searchQuery);
    setState(() {
      searchResults = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  style: TextStyle(
                    color: Color(Generics.ninjaNewsYellow),
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Ara',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(Generics.ninjaNewsYellow),
                ),
                onPressed: () async {
                  searchPosts();
                },
                child: Icon(Icons.search),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (BuildContext context, int index) {
                final result = searchResults[index];
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PostDetail(
                        post: searchResults[index],
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(Generics.ninjaNewsYellow),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Hero(
                            tag: "thumbnail${searchResults[index]['id']}",
                            child: Image.network(
                              result['jetpack_featured_media_url'],
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(1.0),
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.4),
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Hero(
                                tag: 'title${searchResults[index]['id']}',
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: HtmlWidget(
                                    result['title']['rendered'],
                                    textStyle: Generics.ninjaTitleTextStyle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
