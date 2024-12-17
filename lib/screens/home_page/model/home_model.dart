import 'dart:developer';

class DataModel {
  MainModel? dataMainSearch;

  DataModel({this.dataMainSearch});

  factory DataModel.mapToModel(Map m1) {
    return DataModel(dataMainSearch: MainModel.mapToModel(m1['data']));
  }
}

class MainModel {
  MainSearchModel? mainModels;
  MainModel({this.mainModels});

  factory MainModel.mapToModel(Map m5) {
    return MainModel(
      mainModels: MainSearchModel.mapToModel(m5['mainSearch']),
    );
  }
}

class MainSearchModel {
  List<Edges>? edge = [];

  MainSearchModel({this.edge});

  factory MainSearchModel.mapToModel(Map m4) {
    List<dynamic> e1 = m4['edges'];
    return MainSearchModel(
        edge: e1
            .map(
              (e) => Edges.mapToModel(e as Map),
            )
            .toList());
  }
}

class Edges {
  Node? nodes;
  Edges({this.nodes});
  factory Edges.mapToModel(Map m3) {
    return Edges(nodes: Node.mapToModel(m3['node']));
  }
}

class Node {
  Enitity? entityModel;

  Node({this.entityModel});

  factory Node.mapToModel(Map m2) {
    return Node(
      entityModel: Enitity.mapToModel(
        m2['entity'],
      ),
    );
  }
}

class Enitity {
  String? typeName;
  TitleText? titleTextModel;
  ReleaseDateModel? releaseDay;
  ImageModel? imgModels;

  Enitity(
      {this.typeName, this.titleTextModel, this.releaseDay, this.imgModels});

  factory Enitity.mapToModel(Map m1) {
    return Enitity(
      typeName: m1['__typename'],
      titleTextModel: TitleText.mapToModel(m1['titleText']),
      releaseDay: ReleaseDateModel.mapToModel(m1['releaseDate']),
      imgModels: ImageModel.mapToModel(m1['primaryImage']),
    );
  }
}

class TitleText {
  String? text;

  TitleText({this.text});

  factory TitleText.mapToModel(Map m6) {
    return TitleText(
      text: m6['text'],
    );
  }
}

class ReleaseDateModel {
  int? date, month, year;

  ReleaseDateModel({this.date, this.month, this.year});

  factory ReleaseDateModel.mapToModel(Map m7) {
    return ReleaseDateModel(
        year: m7['year'], month: m7['month'], date: m7['day']);
  }
}

class ImageModel {
  String? imgUrl;

  ImageModel({this.imgUrl});

  factory ImageModel.mapToModel(Map m8) {
    return ImageModel(imgUrl: m8['url']);
  }
}
