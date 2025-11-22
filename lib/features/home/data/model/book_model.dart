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
    saleInfo: SaleInfo.fromJson(json["saleInfo"] ?? {}),
    searchInfo: SearchInfo.fromJson(json["searchInfo"] ?? {}),
    kind: json["kind"] ?? '',
    volumeInfo: VolumeInfo.fromJson(json["volumeInfo"] ?? {}),
    etag: json["etag"] ?? '',
    id: json["id"] ?? '',
    accessInfo: AccessInfo.fromJson(json["accessInfo"] ?? {}),
    selfLink: json["selfLink"] ?? '',
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
    this.accessViewStatus = '',
    this.country = '',
    this.viewability = '',
    Pdf? pdf,
    this.webReaderLink = '',
    Epub? epub,
    this.publicDomain = false,
    this.quoteSharingAllowed = false,
    this.embeddable = false,
    this.textToSpeechPermission = '',
  })  : pdf = pdf ?? Pdf(),
        epub = epub ?? Epub();

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
    accessViewStatus: json["accessViewStatus"] ?? '',
    country: json["country"] ?? '',
    viewability: json["viewability"] ?? '',
    pdf: Pdf.fromJson(json["pdf"] ?? {}),
    webReaderLink: json["webReaderLink"] ?? '',
    epub: Epub.fromJson(json["epub"] ?? {}),
    publicDomain: json["publicDomain"] ?? false,
    quoteSharingAllowed: json["quoteSharingAllowed"] ?? false,
    embeddable: json["embeddable"] ?? false,
    textToSpeechPermission: json["textToSpeechPermission"] ?? '',
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
  Epub({this.isAvailable = false});
  bool isAvailable;
  factory Epub.fromJson(Map<dynamic, dynamic> json) => Epub(isAvailable: json["isAvailable"] ?? false);
  Map<dynamic, dynamic> toJson() => {"isAvailable": isAvailable};
}

class Pdf {
  Pdf({this.isAvailable = false, this.acsTokenLink = ''});
  bool isAvailable;
  String acsTokenLink;
  factory Pdf.fromJson(Map<dynamic, dynamic> json) => Pdf(
    isAvailable: json["isAvailable"] ?? false,
    acsTokenLink: json["acsTokenLink"] ?? '',
  );
  Map<dynamic, dynamic> toJson() => {
    "isAvailable": isAvailable,
    "acsTokenLink": acsTokenLink,
  };
}

class SaleInfo {
  SaleInfo({
    this.country = '',
    this.isEbook = false,
    this.saleability = '',
  });
  String country;
  bool isEbook;
  String saleability;
  factory SaleInfo.fromJson(Map<dynamic, dynamic> json) => SaleInfo(
    country: json["country"] ?? '',
    isEbook: json["isEbook"] ?? false,
    saleability: json["saleability"] ?? '',
  );
  Map<dynamic, dynamic> toJson() => {
    "country": country,
    "isEbook": isEbook,
    "saleability": saleability,
  };
}

class SearchInfo {
  SearchInfo({this.textSnippet = ''});
  String textSnippet;
  factory SearchInfo.fromJson(Map<dynamic, dynamic> json) => SearchInfo(
    textSnippet: json["textSnippet"] ?? '',
  );
  Map<dynamic, dynamic> toJson() => {"textSnippet": textSnippet};
}

class VolumeInfo {
  VolumeInfo({
    List<IndustryIdentifier>? industryIdentifiers,
    this.pageCount = 0,
    this.printType = '',
    ReadingModes? readingModes,
    this.previewLink = '',
    this.canonicalVolumeLink = '',
    this.description = '',
    this.language = '',
    this.title = '',
    ImageLinks? imageLinks,
    PanelizationSummary? panelizationSummary,
    this.publisher = '',
    this.publishedDate = '',
    List<String>? categories,
    this.maturityRating = '',
    this.allowAnonLogging = false,
    this.contentVersion = '',
    List<String>? authors,
    this.infoLink = '',
  })  : industryIdentifiers = industryIdentifiers ?? [],
        readingModes = readingModes ?? ReadingModes(),
        imageLinks = imageLinks ?? ImageLinks(),
        panelizationSummary = panelizationSummary ?? PanelizationSummary(),
        categories = categories ?? [],
        authors = authors ?? [];

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
    industryIdentifiers: (json["industryIdentifiers"] as List?)
        ?.map((x) => IndustryIdentifier.fromJson(x))
        .toList() ??
        [],
    pageCount: json["pageCount"] ?? 0,
    printType: json["printType"] ?? '',
    readingModes: ReadingModes.fromJson(json["readingModes"] ?? {}),
    previewLink: json["previewLink"] ?? '',
    canonicalVolumeLink: json["canonicalVolumeLink"] ?? '',
    description: json["description"] ?? '',
    language: json["language"] ?? '',
    title: json["title"] ?? '',
    imageLinks: ImageLinks.fromJson(json["imageLinks"] ?? {}),
    panelizationSummary:
    PanelizationSummary.fromJson(json["panelizationSummary"] ?? {}),
    publisher: json["publisher"] ?? '',
    publishedDate: json["publishedDate"] ?? '',
    categories: (json["categories"] as List?)?.map((x) => x.toString()).toList() ?? [],
    maturityRating: json["maturityRating"] ?? '',
    allowAnonLogging: json["allowAnonLogging"] ?? false,
    contentVersion: json["contentVersion"] ?? '',
    authors: (json["authors"] as List?)?.map((x) => x.toString()).toList() ?? [],
    infoLink: json["infoLink"] ?? '',
  );

  Map<dynamic, dynamic> toJson() => {
    "industryIdentifiers": industryIdentifiers.map((x) => x.toJson()).toList(),
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
    "categories": categories,
    "maturityRating": maturityRating,
    "allowAnonLogging": allowAnonLogging,
    "contentVersion": contentVersion,
    "authors": authors,
    "infoLink": infoLink,
  };
}

class ImageLinks {
  ImageLinks({this.thumbnail = '', this.smallThumbnail = ''});
  String thumbnail;
  String smallThumbnail;
  factory ImageLinks.fromJson(Map<dynamic, dynamic> json) => ImageLinks(
    thumbnail: json["thumbnail"] ?? '',
    smallThumbnail: json["smallThumbnail"] ?? '',
  );
  Map<dynamic, dynamic> toJson() => {"thumbnail": thumbnail, "smallThumbnail": smallThumbnail};
}

class IndustryIdentifier {
  IndustryIdentifier({this.identifier = '', this.type = ''});
  String identifier;
  String type;
  factory IndustryIdentifier.fromJson(Map<dynamic, dynamic> json) => IndustryIdentifier(
    identifier: json["identifier"] ?? '',
    type: json["type"] ?? '',
  );
  Map<dynamic, dynamic> toJson() => {"identifier": identifier, "type": type};
}

class PanelizationSummary {
  PanelizationSummary({this.containsImageBubbles = false, this.containsEpubBubbles = false});
  bool containsImageBubbles;
  bool containsEpubBubbles;
  factory PanelizationSummary.fromJson(Map<dynamic, dynamic> json) => PanelizationSummary(
    containsImageBubbles: json["containsImageBubbles"] ?? false,
    containsEpubBubbles: json["containsEpubBubbles"] ?? false,
  );
  Map<dynamic, dynamic> toJson() => {
    "containsImageBubbles": containsImageBubbles,
    "containsEpubBubbles": containsEpubBubbles,
  };
}

class ReadingModes {
  ReadingModes({this.image = false, this.text = false});
  bool image;
  bool text;
  factory ReadingModes.fromJson(Map<dynamic, dynamic> json) => ReadingModes(
    image: json["image"] ?? false,
    text: json["text"] ?? false,
  );
  Map<dynamic, dynamic> toJson() => {"image": image, "text": text};
}
