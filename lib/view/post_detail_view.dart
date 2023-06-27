import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:intl/intl.dart';
import 'package:ninjanews/utils/generics/generics.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({super.key, required this.post});

  final Map<String, dynamic> post;

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    String dateString = widget.post['date'];
    DateTime date = DateTime.parse(dateString);

    String formattedDate = DateFormat('dd MMMM yyyy', 'tr').format(date);

    return Scaffold(
      backgroundColor: Generics.ninjaDarkBackground,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Hero(
                      tag: "thumbnail${widget.post['id']}",
                      child: Image.network(
                        widget.post['jetpack_featured_media_url'],
                        height: 300.0,
                        width: size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 64.0, left: 24.0, right: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Generics.ninjaDarkBackground
                                    .withOpacity(0.5),
                              ),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Color(Generics.ninjaNewsYellow),
                                size: 20,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color:
                                  Generics.ninjaDarkBackground.withOpacity(0.5),
                            ),
                            child: Icon(
                              Icons.bookmark_outline,
                              color: Color(Generics.ninjaNewsYellow),
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Hero(
                          tag: 'title${widget.post['id']}',
                          child: Material(
                            type: MaterialType.transparency,
                            child: Container(
                              padding: EdgeInsets.only(left: 18.0, top: 18.0),
                              width: size.width / 1.3,
                              child: HtmlWidget(
                                widget.post['title']['rendered'],
                                textStyle: Generics.ninjaTitleTextStyle,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            //TODO: Favorilere ekleme/çıkarma metodu yazılacak.
                          },
                          child: Container(
                            height: 34.0,
                            width: 68.0,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Generics.ninjaGray.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Generics.ninjaRed,
                                  size: 18.0,
                                ),
                                Text(
                                  "480",
                                  style: Generics.ninjaSubtitleTextStyle,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Generics.ninjaGray,
                      height: 32.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(Generics.ninjaNewsYellow),
                            radius: 24,
                          ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          Expanded(
                            child: Text(
                              'Eyüp Furkan Tüylü',
                              style: Generics.ninjaSubtitleTextStyle,
                            ),
                          ),
                          Text(
                            formattedDate.toString(),
                            style: Generics.ninjaSubtitleTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Generics.ninjaGray,
                      height: 32.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: HtmlWidget(
                        widget.post['content']['rendered'],
                        textStyle: Generics.ninjaNormalTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // TODO: Login Olduysa Yorum yapabilir
          1 == 0
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(1.0),
                          Colors.black.withOpacity(0.9),
                          Colors.black.withOpacity(0.8),
                        ],
                      ),
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                              color: Color(Generics.ninjaNewsYellow),
                            ),
                            decoration: InputDecoration(
                              hintText: 'Yorum yap...',
                              hintStyle: TextStyle(
                                  color: Color(Generics.ninjaNewsYellow)),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(Generics.ninjaNewsYellow),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        ElevatedButton(
                          onPressed: () {
                            //TODO: Yorum yap butonuna tıklandığında yapılacak işlemler
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(Generics.ninjaNewsYellow),
                          ),
                          child: Text(
                            'Gönder',
                            style: TextStyle(color: Generics.ninjaTextBlack),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
