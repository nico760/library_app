import 'package:flutter/material.dart';
import '../api/list_book_safe.dart';
class BookContainer extends StatelessWidget {
  const BookContainer({super.key,
    required this.bookInfo,
    required this.index,
  });

  final GoogleBooksNullSafe bookInfo;
  final int index; 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 280,
        child: Column(
            children: [
              Text(
                (bookInfo.items?[index].volumeInfo?.title ?? ''),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontWeight: FontWeight.bold),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          ),
              const SizedBox(height: 5,),
              Container(
                      margin: const EdgeInsets.all(15),
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 8,
                              offset: const Offset(2, 2))
                                  ],
                        borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(bookInfo.items?[index].volumeInfo?.imageLinks?.smallThumbnail 
                            ?? '' //operador elvis
                              ),
                            fit: BoxFit.contain),                       
                            ),
              ),
              
            ],
          ),
      ),
    );
  }
}

