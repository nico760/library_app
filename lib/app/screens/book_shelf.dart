import 'package:flutter/material.dart';
import 'package:library_app_test/app/widgets/book_cont.dart';
import 'package:library_app_test/app/widgets/card_start.dart';
import 'package:library_app_test/app/widgets/texform_custom.dart';
import '../api/api_service.dart';
import '../api/list_book_safe.dart';

class BookShelf extends StatefulWidget {
  const BookShelf({super.key,});

  @override
  BookShelfState createState() => BookShelfState();
}

class BookShelfState extends State<BookShelf> {
  final TextEditingController _keywordController = TextEditingController();
  late Future<GoogleBooksNullSafe> _posts;
  String keyword = 'technology';
  final _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _posts = _apiService.fetchPosts(keyword);
  }

  void _keywordSearch(String controller) {
    setState(() { 
      keyword = controller;
    _posts = _apiService.fetchPosts(keyword);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 160, 236),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: 
          FutureBuilder<GoogleBooksNullSafe>(
            future: _posts,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const CardStart(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:8.0),
                                    child: TextCustom(controller: _keywordController),
                                  )
                                ),
                                Container(
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.transparent
                                  ),
                                    child: 
                                      GestureDetector(
                                        onTap: (){_keywordSearch(_keywordController.text);},
                                        child: const
                                        Icon(Icons.search, color: Colors.purple, size: 30,)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            const Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Books', 
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),),
                            ),
                                ),
                            const SizedBox(height: 5,),
                            SizedBox(
                              height: 300,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  final post = snapshot.data!;
                                  return BookContainer(
                                    index: index,
                                    bookInfo: post);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
    );
  }
}