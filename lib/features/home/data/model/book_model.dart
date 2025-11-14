import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
  BookModel({
    required this.saleInfo,
    required this.searchInfo,
    required this.kind,
    required this.volumeInfo,
    required this.etag,
    required this.id,
    required this.accessInfo,
    required this.selfLink,
  });

  SaleInfo saleInfo;
  SearchInfo searchInfo;
  String kind;
  VolumeInfo volumeInfo;
  String etag;
  String id;
  AccessInfo accessInfo;
  String selfLink;

  factory BookModel.fromJson(Map<dynamic, dynamic> json) => BookModel(
    saleInfo: SaleInfo.fromJson(json["saleInfo"]),
    searchInfo: SearchInfo.fromJson(json["searchInfo"]),
    kind: json["kind"],
    volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
    etag: json["etag"],
    id: json["id"],
    accessInfo: AccessInfo.fromJson(json["accessInfo"]),
    selfLink: json["selfLink"],
  );

  Map<dynamic, dynamic> toJson() => {
    "saleInfo": saleInfo.toJson(),
    "searchInfo": searchInfo.toJson(),
    "kind": kind,
    "volumeInfo": volumeInfo.toJson(),
    "etag": etag,
    "id": id,
    "accessInfo": accessInfo.toJson(),
    "selfLink": selfLink,
  };
}

class AccessInfo {
  AccessInfo({
    required this.accessViewStatus,
    required this.country,
    required this.viewability,
    required this.pdf,
    required this.webReaderLink,
    required this.epub,
    required this.publicDomain,
    required this.quoteSharingAllowed,
    required this.embeddable,
    required this.textToSpeechPermission,
  });

  String accessViewStatus;
  String country;
  String viewability;
  Pdf pdf;
  String webReaderLink;
  Epub epub;
  bool publicDomain;
  bool quoteSharingAllowed;
  bool embeddable;
  String textToSpeechPermission;

  factory AccessInfo.fromJson(Map<dynamic, dynamic> json) => AccessInfo(
    accessViewStatus: json["accessViewStatus"],
    country: json["country"],
    viewability: json["viewability"],
    pdf: Pdf.fromJson(json["pdf"]),
    webReaderLink: json["webReaderLink"],
    epub: Epub.fromJson(json["epub"]),
    publicDomain: json["publicDomain"],
    quoteSharingAllowed: json["quoteSharingAllowed"],
    embeddable: json["embeddable"],
    textToSpeechPermission: json["textToSpeechPermission"],
  );

  Map<dynamic, dynamic> toJson() => {
    "accessViewStatus": accessViewStatus,
    "country": country,
    "viewability": viewability,
    "pdf": pdf.toJson(),
    "webReaderLink": webReaderLink,
    "epub": epub.toJson(),
    "publicDomain": publicDomain,
    "quoteSharingAllowed": quoteSharingAllowed,
    "embeddable": embeddable,
    "textToSpeechPermission": textToSpeechPermission,
  };
}

class Epub {
  Epub({required this.isAvailable});

  bool isAvailable;

  factory Epub.fromJson(Map<dynamic, dynamic> json) =>
      Epub(isAvailable: json["isAvailable"]);

  Map<dynamic, dynamic> toJson() => {"isAvailable": isAvailable};
}

class Pdf {
  Pdf({required this.isAvailable, required this.acsTokenLink});

  bool isAvailable;
  String acsTokenLink;

  factory Pdf.fromJson(Map<dynamic, dynamic> json) =>
      Pdf(isAvailable: json["isAvailable"], acsTokenLink: json["acsTokenLink"]);

  Map<dynamic, dynamic> toJson() => {
    "isAvailable": isAvailable,
    "acsTokenLink": acsTokenLink,
  };
}

class SaleInfo {
  SaleInfo({
    required this.country,
    required this.isEbook,
    required this.saleability,
  });

  String country;
  bool isEbook;
  String saleability;

  factory SaleInfo.fromJson(Map<dynamic, dynamic> json) => SaleInfo(
    country: json["country"],
    isEbook: json["isEbook"],
    saleability: json["saleability"],
  );

  Map<dynamic, dynamic> toJson() => {
    "country": country,
    "isEbook": isEbook,
    "saleability": saleability,
  };
}

class SearchInfo {
  SearchInfo({required this.textSnippet});

  String textSnippet;

  factory SearchInfo.fromJson(Map<dynamic, dynamic> json) =>
      SearchInfo(textSnippet: json["textSnippet"]);

  Map<dynamic, dynamic> toJson() => {"textSnippet": textSnippet};
}

class VolumeInfo {
  VolumeInfo({
    required this.industryIdentifiers,
    required this.pageCount,
    required this.printType,
    required this.readingModes,
    required this.previewLink,
    required this.canonicalVolumeLink,
    required this.description,
    required this.language,
    required this.title,
    required this.imageLinks,
    required this.panelizationSummary,
    required this.publisher,
    required this.publishedDate,
    required this.categories,
    required this.maturityRating,
    required this.allowAnonLogging,
    required this.contentVersion,
    required this.authors,
    required this.infoLink,
  });

  List<IndustryIdentifier> industryIdentifiers;
  int pageCount;
  String printType;
  ReadingModes readingModes;
  String previewLink;
  String canonicalVolumeLink;
  String description;
  String language;
  String title;
  ImageLinks imageLinks;
  PanelizationSummary panelizationSummary;
  String publisher;
  String publishedDate;
  List<String> categories;
  String maturityRating;
  bool allowAnonLogging;
  String contentVersion;
  List<String> authors;
  String infoLink;

  factory VolumeInfo.fromJson(Map<dynamic, dynamic> json) => VolumeInfo(
    industryIdentifiers: List<IndustryIdentifier>.from(
      json["industryIdentifiers"].map((x) => IndustryIdentifier.fromJson(x)),
    ),
    pageCount: json["pageCount"],
    printType: json["printType"],
    readingModes: ReadingModes.fromJson(json["readingModes"]),
    previewLink: json["previewLink"],
    canonicalVolumeLink: json["canonicalVolumeLink"],
    description: json["description"],
    language: json["language"],
    title: json["title"],
    imageLinks: ImageLinks.fromJson(json["imageLinks"]),
    panelizationSummary: PanelizationSummary.fromJson(
      json["panelizationSummary"],
    ),
    publisher: json["publisher"],
    publishedDate: json["publishedDate"],
    categories: List<String>.from(json["categories"].map((x) => x)),
    maturityRating: json["maturityRating"],
    allowAnonLogging: json["allowAnonLogging"],
    contentVersion: json["contentVersion"],
    authors: List<String>.from(json["authors"].map((x) => x)),
    infoLink: json["infoLink"],
  );

  Map<dynamic, dynamic> toJson() => {
    "industryIdentifiers": List<dynamic>.from(
      industryIdentifiers.map((x) => x.toJson()),
    ),
    "pageCount": pageCount,
    "printType": printType,
    "readingModes": readingModes.toJson(),
    "previewLink": previewLink,
    "canonicalVolumeLink": canonicalVolumeLink,
    "description": description,
    "language": language,
    "title": title,
    "imageLinks": imageLinks.toJson(),
    "panelizationSummary": panelizationSummary.toJson(),
    "publisher": publisher,
    "publishedDate": publishedDate,
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "maturityRating": maturityRating,
    "allowAnonLogging": allowAnonLogging,
    "contentVersion": contentVersion,
    "authors": List<dynamic>.from(authors.map((x) => x)),
    "infoLink": infoLink,
  };
}

class ImageLinks {
  ImageLinks({required this.thumbnail, required this.smallThumbnail});

  String thumbnail;
  String smallThumbnail;

  factory ImageLinks.fromJson(Map<dynamic, dynamic> json) => ImageLinks(
    thumbnail: json["thumbnail"],
    smallThumbnail: json["smallThumbnail"],
  );

  Map<dynamic, dynamic> toJson() => {
    "thumbnail": thumbnail,
    "smallThumbnail": smallThumbnail,
  };
}

class IndustryIdentifier {
  IndustryIdentifier({required this.identifier, required this.type});
  String identifier;
  String type;

  factory IndustryIdentifier.fromJson(Map<dynamic, dynamic> json) =>
      IndustryIdentifier(identifier: json["identifier"], type: json["type"]);

  Map<dynamic, dynamic> toJson() => {"identifier": identifier, "type": type};
}

class PanelizationSummary {
  PanelizationSummary({
    required this.containsImageBubbles,
    required this.containsEpubBubbles,
  });

  bool containsImageBubbles;
  bool containsEpubBubbles;

  factory PanelizationSummary.fromJson(Map<dynamic, dynamic> json) =>
      PanelizationSummary(
        containsImageBubbles: json["containsImageBubbles"],
        containsEpubBubbles: json["containsEpubBubbles"],
      );

  Map<dynamic, dynamic> toJson() => {
    "containsImageBubbles": containsImageBubbles,
    "containsEpubBubbles": containsEpubBubbles,
  };
}

class ReadingModes {
  ReadingModes({required this.image, required this.text});

  bool image;
  bool text;

  factory ReadingModes.fromJson(Map<dynamic, dynamic> json) =>
      ReadingModes(image: json["image"], text: json["text"]);

  Map<dynamic, dynamic> toJson() => {"image": image, "text": text};
}
