// To parse this JSON data, do
//
//     final googleBooks = googleBooksFromJson(jsonString);

import 'dart:convert';

GoogleBooks googleBooksFromJson(String str) => GoogleBooks.fromJson(json.decode(str));

//String googleBooksToJson(GoogleBooks data) => json.encode(data.toJson());

class GoogleBooks {
    String? kind;
    int? totalItems;
    List<Item>? items;

    GoogleBooks({
        required this.kind,
        required this.totalItems,
        required this.items,
    });

    factory GoogleBooks.fromJson(Map<String, dynamic> json) => GoogleBooks(
        kind: json["kind"],
        totalItems: json["totalItems"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );
/*
      Map<String, dynamic> toJson() => {
        "kind": kind,
        "totalItems": totalItems,
        "items": List<dynamic>.from(items?.map((x) => x.toJson())),
    };*/


}

class Item {
    Kind kind;
    String id;
    String etag;
    String selfLink;
    VolumeInfo volumeInfo;
    SaleInfo saleInfo;
    AccessInfo accessInfo;
    SearchInfo? searchInfo;

    Item({
        required this.kind,
        required this.id,
        required this.etag,
        required this.selfLink,
        required this.volumeInfo,
        required this.saleInfo,
        required this.accessInfo,
        this.searchInfo,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: kindValues.map[json["kind"]]!,
        id: json["id"],
        etag: json["etag"],
        selfLink: json["selfLink"],
        volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
        saleInfo: SaleInfo.fromJson(json["saleInfo"]),
        accessInfo: AccessInfo.fromJson(json["accessInfo"]),
        searchInfo: json["searchInfo"] == null ? null : SearchInfo.fromJson(json["searchInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "kind": kindValues.reverse[kind],
        "id": id,
        "etag": etag,
        "selfLink": selfLink,
        "volumeInfo": volumeInfo.toJson(),
        "saleInfo": saleInfo.toJson(),
        "accessInfo": accessInfo.toJson(),
        "searchInfo": searchInfo?.toJson(),
    };
}

class AccessInfo {
    Country country;
    Viewability viewability;
    bool embeddable;
    bool publicDomain;
    TextToSpeechPermission textToSpeechPermission;
    Epub epub;
    Pdf pdf;
    String webReaderLink;
    AccessViewStatus accessViewStatus;
    bool quoteSharingAllowed;

    AccessInfo({
        required this.country,
        required this.viewability,
        required this.embeddable,
        required this.publicDomain,
        required this.textToSpeechPermission,
        required this.epub,
        required this.pdf,
        required this.webReaderLink,
        required this.accessViewStatus,
        required this.quoteSharingAllowed,
    });

    factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
        country: countryValues.map[json["country"]]!,
        viewability: viewabilityValues.map[json["viewability"]]!,
        embeddable: json["embeddable"],
        publicDomain: json["publicDomain"],
        textToSpeechPermission: textToSpeechPermissionValues.map[json["textToSpeechPermission"]]!,
        epub: Epub.fromJson(json["epub"]),
        pdf: Pdf.fromJson(json["pdf"]),
        webReaderLink: json["webReaderLink"],
        accessViewStatus: accessViewStatusValues.map[json["accessViewStatus"]]!,
        quoteSharingAllowed: json["quoteSharingAllowed"],
    );

    Map<String, dynamic> toJson() => {
        "country": countryValues.reverse[country],
        "viewability": viewabilityValues.reverse[viewability],
        "embeddable": embeddable,
        "publicDomain": publicDomain,
        "textToSpeechPermission": textToSpeechPermissionValues.reverse[textToSpeechPermission],
        "epub": epub.toJson(),
        "pdf": pdf.toJson(),
        "webReaderLink": webReaderLink,
        "accessViewStatus": accessViewStatusValues.reverse[accessViewStatus],
        "quoteSharingAllowed": quoteSharingAllowed,
    };
}

enum AccessViewStatus {
    FULL_PUBLIC_DOMAIN,
    NONE,
    SAMPLE
}

final accessViewStatusValues = EnumValues({
    "FULL_PUBLIC_DOMAIN": AccessViewStatus.FULL_PUBLIC_DOMAIN,
    "NONE": AccessViewStatus.NONE,
    "SAMPLE": AccessViewStatus.SAMPLE
});

enum Country {
    CO
}

final countryValues = EnumValues({
    "CO": Country.CO
});

class Epub {
    bool isAvailable;
    String? acsTokenLink;
    String? downloadLink;

    Epub({
        required this.isAvailable,
        this.acsTokenLink,
        this.downloadLink,
    });

    factory Epub.fromJson(Map<String, dynamic> json) => Epub(
        isAvailable: json["isAvailable"],
        acsTokenLink: json["acsTokenLink"],
        downloadLink: json["downloadLink"],
    );

    Map<String, dynamic> toJson() => {
        "isAvailable": isAvailable,
        "acsTokenLink": acsTokenLink,
        "downloadLink": downloadLink,
    };
}

class Pdf {
    bool isAvailable;
    String? acsTokenLink;

    Pdf({
        required this.isAvailable,
        this.acsTokenLink,
    });

    factory Pdf.fromJson(Map<String, dynamic> json) => Pdf(
        isAvailable: json["isAvailable"],
        acsTokenLink: json["acsTokenLink"],
    );

    Map<String, dynamic> toJson() => {
        "isAvailable": isAvailable,
        "acsTokenLink": acsTokenLink,
    };
}

enum TextToSpeechPermission {
    ALLOWED
}

final textToSpeechPermissionValues = EnumValues({
    "ALLOWED": TextToSpeechPermission.ALLOWED
});

enum Viewability {
    ALL_PAGES,
    NO_PAGES,
    PARTIAL
}

final viewabilityValues = EnumValues({
    "ALL_PAGES": Viewability.ALL_PAGES,
    "NO_PAGES": Viewability.NO_PAGES,
    "PARTIAL": Viewability.PARTIAL
});

enum Kind {
    BOOKS_VOLUME
}

final kindValues = EnumValues({
    "books#volume": Kind.BOOKS_VOLUME
});

class SaleInfo {
    Country country;
    Saleability saleability;
    bool isEbook;
    SaleInfoListPrice? listPrice;
    SaleInfoListPrice? retailPrice;
    String? buyLink;
    List<Offer>? offers;

    SaleInfo({
        required this.country,
        required this.saleability,
        required this.isEbook,
        this.listPrice,
        this.retailPrice,
        this.buyLink,
        this.offers,
    });

    factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: countryValues.map[json["country"]]!,
        saleability: saleabilityValues.map[json["saleability"]]!,
        isEbook: json["isEbook"],
        listPrice: json["listPrice"] == null ? null : SaleInfoListPrice.fromJson(json["listPrice"]),
        retailPrice: json["retailPrice"] == null ? null : SaleInfoListPrice.fromJson(json["retailPrice"]),
        buyLink: json["buyLink"],
        offers: json["offers"] == null ? [] : List<Offer>.from(json["offers"]!.map((x) => Offer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "country": countryValues.reverse[country],
        "saleability": saleabilityValues.reverse[saleability],
        "isEbook": isEbook,
        "listPrice": listPrice?.toJson(),
        "retailPrice": retailPrice?.toJson(),
        "buyLink": buyLink,
        "offers": offers == null ? [] : List<dynamic>.from(offers!.map((x) => x.toJson())),
    };
}

class SaleInfoListPrice {
    int amount;
    String currencyCode;

    SaleInfoListPrice({
        required this.amount,
        required this.currencyCode,
    });

    factory SaleInfoListPrice.fromJson(Map<String, dynamic> json) => SaleInfoListPrice(
        amount: json["amount"],
        currencyCode: json["currencyCode"],
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
        "currencyCode": currencyCode,
    };
}

class Offer {
    int finskyOfferType;
    OfferListPrice listPrice;
    OfferListPrice retailPrice;

    Offer({
        required this.finskyOfferType,
        required this.listPrice,
        required this.retailPrice,
    });

    factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        finskyOfferType: json["finskyOfferType"],
        listPrice: OfferListPrice.fromJson(json["listPrice"]),
        retailPrice: OfferListPrice.fromJson(json["retailPrice"]),
    );

    Map<String, dynamic> toJson() => {
        "finskyOfferType": finskyOfferType,
        "listPrice": listPrice.toJson(),
        "retailPrice": retailPrice.toJson(),
    };
}

class OfferListPrice {
    int amountInMicros;
    String currencyCode;

    OfferListPrice({
        required this.amountInMicros,
        required this.currencyCode,
    });

    factory OfferListPrice.fromJson(Map<String, dynamic> json) => OfferListPrice(
        amountInMicros: json["amountInMicros"],
        currencyCode: json["currencyCode"],
    );

    Map<String, dynamic> toJson() => {
        "amountInMicros": amountInMicros,
        "currencyCode": currencyCode,
    };
}

enum Saleability {
    FOR_SALE,
    FREE,
    NOT_FOR_SALE
}

final saleabilityValues = EnumValues({
    "FOR_SALE": Saleability.FOR_SALE,
    "FREE": Saleability.FREE,
    "NOT_FOR_SALE": Saleability.NOT_FOR_SALE
});

class SearchInfo {
    String textSnippet;

    SearchInfo({
        required this.textSnippet,
    });

    factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
        textSnippet: json["textSnippet"],
    );

    Map<String, dynamic> toJson() => {
        "textSnippet": textSnippet,
    };
}

class VolumeInfo {
    String title;
    String? subtitle;
    List<String>? authors;
    String? publisher;
    String publishedDate;
    String? description;
    List<IndustryIdentifier> industryIdentifiers;
    ReadingModes readingModes;
    int? pageCount;
    PrintType printType;
    List<String>? categories;
    MaturityRating maturityRating;
    bool allowAnonLogging;
    String contentVersion;
    PanelizationSummary? panelizationSummary;
    ImageLinks? imageLinks;
    Language language;
    String previewLink;
    String infoLink;
    String canonicalVolumeLink;
    int? averageRating;
    int? ratingsCount;

    VolumeInfo({
        required this.title,
        this.subtitle,
        this.authors,
        this.publisher,
        required this.publishedDate,
        this.description,
        required this.industryIdentifiers,
        required this.readingModes,
        this.pageCount,
        required this.printType,
        this.categories,
        required this.maturityRating,
        required this.allowAnonLogging,
        required this.contentVersion,
        this.panelizationSummary,
        this.imageLinks,
        required this.language,
        required this.previewLink,
        required this.infoLink,
        required this.canonicalVolumeLink,
        this.averageRating,
        this.ratingsCount,
    });

    factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"],
        subtitle: json["subtitle"],
        authors: json["authors"] == null ? [] : List<String>.from(json["authors"]!.map((x) => x)),
        publisher: json["publisher"],
        publishedDate: json["publishedDate"],
        description: json["description"],
        industryIdentifiers: List<IndustryIdentifier>.from(json["industryIdentifiers"].map((x) => IndustryIdentifier.fromJson(x))),
        readingModes: ReadingModes.fromJson(json["readingModes"]),
        pageCount: json["pageCount"],
        printType: printTypeValues.map[json["printType"]]!,
        categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((x) => x)),
        maturityRating: maturityRatingValues.map[json["maturityRating"]]!,
        allowAnonLogging: json["allowAnonLogging"],
        contentVersion: json["contentVersion"],
        panelizationSummary: json["panelizationSummary"] == null ? null : PanelizationSummary.fromJson(json["panelizationSummary"]),
        imageLinks: json["imageLinks"] == null ? null : ImageLinks.fromJson(json["imageLinks"]),
        language: languageValues.map[json["language"]]!,
        previewLink: json["previewLink"],
        infoLink: json["infoLink"],
        canonicalVolumeLink: json["canonicalVolumeLink"],
        averageRating: json["averageRating"],
        ratingsCount: json["ratingsCount"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "authors": authors == null ? [] : List<dynamic>.from(authors!.map((x) => x)),
        "publisher": publisher,
        "publishedDate": publishedDate,
        "description": description,
        "industryIdentifiers": List<dynamic>.from(industryIdentifiers.map((x) => x.toJson())),
        "readingModes": readingModes.toJson(),
        "pageCount": pageCount,
        "printType": printTypeValues.reverse[printType],
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
        "maturityRating": maturityRatingValues.reverse[maturityRating],
        "allowAnonLogging": allowAnonLogging,
        "contentVersion": contentVersion,
        "panelizationSummary": panelizationSummary?.toJson(),
        "imageLinks": imageLinks?.toJson(),
        "language": languageValues.reverse[language],
        "previewLink": previewLink,
        "infoLink": infoLink,
        "canonicalVolumeLink": canonicalVolumeLink,
        "averageRating": averageRating,
        "ratingsCount": ratingsCount,
    };
}

class ImageLinks {
    String smallThumbnail;
    String thumbnail;

    ImageLinks({
        required this.smallThumbnail,
        required this.thumbnail,
    });

    factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "smallThumbnail": smallThumbnail,
        "thumbnail": thumbnail,
    };
}

class IndustryIdentifier {
    Type type;
    String identifier;

    IndustryIdentifier({
        required this.type,
        required this.identifier,
    });

    factory IndustryIdentifier.fromJson(Map<String, dynamic> json) => IndustryIdentifier(
        type: typeValues.map[json["type"]]!,
        identifier: json["identifier"],
    );

    Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "identifier": identifier,
    };
}

enum Type {
    ISBN_10,
    ISBN_13,
    OTHER
}

final typeValues = EnumValues({
    "ISBN_10": Type.ISBN_10,
    "ISBN_13": Type.ISBN_13,
    "OTHER": Type.OTHER
});

enum Language {
    EN
}

final languageValues = EnumValues({
    "en": Language.EN
});

enum MaturityRating {
    NOT_MATURE
}

final maturityRatingValues = EnumValues({
    "NOT_MATURE": MaturityRating.NOT_MATURE
});

class PanelizationSummary {
    bool containsEpubBubbles;
    bool containsImageBubbles;

    PanelizationSummary({
        required this.containsEpubBubbles,
        required this.containsImageBubbles,
    });

    factory PanelizationSummary.fromJson(Map<String, dynamic> json) => PanelizationSummary(
        containsEpubBubbles: json["containsEpubBubbles"],
        containsImageBubbles: json["containsImageBubbles"],
    );

    Map<String, dynamic> toJson() => {
        "containsEpubBubbles": containsEpubBubbles,
        "containsImageBubbles": containsImageBubbles,
    };
}

enum PrintType {
    BOOK
}

final printTypeValues = EnumValues({
    "BOOK": PrintType.BOOK
});

class ReadingModes {
    bool text;
    bool image;

    ReadingModes({
        required this.text,
        required this.image,
    });

    factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
        text: json["text"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "image": image,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
