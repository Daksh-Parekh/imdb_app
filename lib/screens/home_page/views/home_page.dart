import 'package:flutter/material.dart';
import 'package:imdb_app/main.dart';
import 'package:imdb_app/screens/home_page/model/home_model.dart';
import 'package:imdb_app/screens/home_page/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override
  // void initState() {
  //   context.read<HomeProvider>().APICalling();
  //   // TODO: implement initState
  //   super.initState();
  // }
  late HomeProvider hRead, hWatch;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    hRead = context.read<HomeProvider>();
    hWatch = context.watch<HomeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onSubmitted: (value) {
                hRead.APICalling(searchController.text);
              },
              decoration: InputDecoration(
                hintText: "Enter Movies Name",
                hintStyle: TextStyle(color: Colors.grey.shade800),
                border: const OutlineInputBorder(),
                // enabled: true,
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: hWatch.edgesList.length,
                itemBuilder: (context, index) {
                  Edges dataShort = hWatch
                      .dataModel!.dataMainSearch!.mainModels!.edge![index];
                  return Container(
                    margin: EdgeInsets.all(10),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          '${dataShort.nodes?.entityModel!.imgModels!.imgUrl}',
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${hWatch.dataModel!.dataMainSearch!.mainModels!.edge![index].nodes!.entityModel!.titleTextModel!.text}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
