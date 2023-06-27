import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:ninjanews/repository/post_repository.dart';
import 'package:ninjanews/utils/generics/generics.dart';
import 'package:ninjanews/view/post_detail_view.dart';

class BultenWidget extends StatelessWidget {
  BultenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // İsteğin tamamlanmasını beklerken yüklenme durumunu gösterin
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // İsteğin bir hatayla tamamlandığında hatayı gösterin
            return Text('Hata: ${snapshot.error}');
          } else if (snapshot.hasData) {
            // İsteğin başarıyla tamamlandığında veriyi işleyin
            var data = snapshot.data;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PostDetail(post: data[index]),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Generics.ninjaDarkBackground,
                            border: Border.all(
                              width: 0.1,
                              color: Generics.ninjaGray,
                            ),
                          ),
                          margin: const EdgeInsets.all(16.0),
                          child: ListTile(
                            leading: Hero(
                              tag: "thumbnail${data[index]['id']}",
                              child: Container(
                                color: Color(Generics.ninjaNewsYellow),
                                height: 250.0,
                                width: 100.0,
                                child: Image.network(
                                  data[index]['jetpack_featured_media_url'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: Hero(
                              tag: 'title${data[index]['id']}',
                              child: Material(
                                type: MaterialType.transparency,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  child: HtmlWidget(
                                    data[index]['title']['rendered'],
                                    textStyle: Generics.ninjaTitleTextStyle,
                                  ),
                                ),
                              ),
                            ),
                            subtitle: Text.rich(
                              TextSpan(children: [
                                TextSpan(text: data[index]['date'])
                              ]),
                              style: Generics.ninjaSubtitleTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            // Başlangıç durumunda veya boş veri durumunda gösterilecek widget
            return Text('Veri bulunamadı');
          }
        },
        future: PostRepository().bultenApi(),
      ),
    );
  }
}
