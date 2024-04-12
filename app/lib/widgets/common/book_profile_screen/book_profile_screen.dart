import 'package:app/constants/screen_constants.dart';
import 'package:app/widgets/common/book_profile_screen/gender_card.dart';
import 'package:flutter/material.dart';

import '../../../models/book.dart';

class BookProfileScreen extends StatelessWidget {
  const BookProfileScreen({super.key, required this.book});

  final Book book;

  List<String> _trimGenres({required List<Genre> genreList}) {
    int lenght = genreList.length >= 3 ? 3 : genreList.length;
    List<String> auxNames = [];
    for (int index = 0; index < lenght; index++) {
      auxNames.add(genreList[index].name);
    }
    return auxNames;
  }

  @override
  Widget build(BuildContext context) {
    List<String> genreNames = _trimGenres(genreList: book.genreList);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Book Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(book.cover),
            SizedBox(height: ScreenConstants.height * 0.02),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenConstants.width * 0.1),
              child: Text(
                book.title,
                style: TextStyle(fontSize: ScreenConstants.width * 0.07),
              ),
            ),
            SizedBox(height: ScreenConstants.height * 0.02),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenConstants.width * 0.1),
              child: Text(
                book.authorList.join(", "),
                style: TextStyle(fontSize: ScreenConstants.width * 0.05),
              ),
            ),
            SizedBox(height: ScreenConstants.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                ...genreNames.map((name) => GenreCard(genre: name)),
                Icon(
                  IconData(book.icon, fontFamily: 'MaterialIcons'),
                  color: Colors.amber,
                ),
              ],
            ),
            SizedBox(height: ScreenConstants.height * 0.02),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.amber,
                    side: BorderSide(color: Colors.amber),
                  ),
                  child: Text('Comprar'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.amber,
                    side: BorderSide(color: Colors.amber),
                  ),
                  child: Text('Listas'),
                ),
              ],
            ),
            SizedBox(height: ScreenConstants.height * 0.02),
            Padding(
              padding:
              EdgeInsets.fromLTRB(ScreenConstants.width * 0.05, 0, ScreenConstants.width * 0.05, ScreenConstants.height * 0.05),
              child: Text(
                book.description,
                style: TextStyle(fontSize: ScreenConstants.width * 0.05),
              ),
            ),
          ],
        ),
      ),
    );
  }
}