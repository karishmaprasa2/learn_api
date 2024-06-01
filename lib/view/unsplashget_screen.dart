import 'package:flutter/material.dart';

import '../controll/unsplash_api.dart';

class UnsplashgetScreen extends StatelessWidget {
  const UnsplashgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xf69809057),
          title: Text("Unsplashget"),
        ),
        body:RefreshIndicator(child:  FutureBuilder(future: UnsplashApi().getData(), builder: (context, snapshot) {
          var userdata=snapshot.data;
          return Center(
              child: ListView.builder(
                itemCount: userdata?.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Container(

                          child: Image.network("${userdata?[index].user?.profileImage?.large}"),
                        ),
                        Text("${userdata?[index].user?.name}"),
                        Text("${userdata?[index].user?.firstName}"),
                        Text("${userdata?[index].user?.username}"),
                        Text("${userdata?[index].user?.bio}"),
                        Text("${userdata?[index].user?.acceptedTos}"),
                        Text("${userdata?[index].user?.social}"),
                      ],
                    ),
                  );
                },)

          );
        },),
          onRefresh: () {
            return  UnsplashApi().getData();
          },)

    );
  }
}
