import 'dart:convert';

class GoogleBooksNullSafe {
    String? kind;
    int? totalItems;
    List<Item>? items;

    GoogleBooksNullSafe({
        this.kind,
        this.totalItems,
        this.items,
    });

    factory GoogleBooksNullSafe.fromRawJson(String str) => GoogleBooksNullSafe.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GoogleBooksNullSafe.fromJson(Map<String, dynamic> json) => GoogleBooksNullSafe(
        kind: json["kind"],
        totalItems: json["totalItems"],
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "totalItems": totalItems,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    };
}

class Item {
    Kind? kind;
    String? id;
    String? etag;
    String? selfLink;
    VolumeInfo? volumeInfo;
    SaleInfo? saleInfo;
    AccessInfo? accessInfo;
    SearchInfo? searchInfo;

    Item({
        this.kind,
        this.id,
        this.etag,
        this.selfLink,
        this.volumeInfo,
        this.saleInfo,
        this.accessInfo,
        this.searchInfo,
    });

    factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: kindValues.map[json["kind"]]!,
        id: json["id"],
        etag: json["etag"],
        selfLink: json["selfLink"],
        volumeInfo: json["volumeInfo"] == null ? null : VolumeInfo.fromJson(json["volumeInfo"]),
        saleInfo: json["saleInfo"] == null ? null : SaleInfo.fromJson(json["saleInfo"]),
        accessInfo: json["accessInfo"] == null ? null : AccessInfo.fromJson(json["accessInfo"]),
        searchInfo: json["searchInfo"] == null ? null : SearchInfo.fromJson(json["searchInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "kind": kindValues.reverse[kind],
        "id": id,
        "etag": etag,
        "selfLink": selfLink,
        "volumeInfo": volumeInfo?.toJson(),
        "saleInfo": saleInfo?.toJson(),
        "accessInfo": accessInfo?.toJson(),
        "searchInfo": searchInfo?.toJson(),
    };
}

class AccessInfo {
    Country? country;
    Viewability? viewability;
    bool? embeddable;
    bool? publicDomain;
    TextToSpeechPermission? textToSpeechPermission;
    Epub? epub;
    Pdf? pdf;
    String? webReaderLink;
    AccessViewStatus? accessViewStatus;
    bool? quoteSharingAllowed;

    AccessInfo({
        this.country,
        this.viewability,
        this.embeddable,
        this.publicDomain,
        this.textToSpeechPermission,
        this.epub,
        this.pdf,
        this.webReaderLink,
        this.accessViewStatus,
        this.quoteSharingAllowed,
    });

    factory AccessInfo.fromRawJson(String str) => AccessInfo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
        country: countryValues.map[json["country"]]!,
        viewability: viewabilityValues.map[json["viewability"]]!,
        embeddable: json["embeddable"],
        publicDomain: json["publicDomain"],
        textToSpeechPermission: textToSpeechPermissionValues.map[json["textToSpeechPermission"]]!,
        epub: json["epub"] == null ? null : Epub.fromJson(json["epub"]),
        pdf: json["pdf"] == null ? null : Pdf.fromJson(json["pdf"]),
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
        "epub": epub?.toJson(),
        "pdf": pdf?.toJson(),
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
    bool? isAvailable;
    String? downloadLink;
    String? acsTokenLink;

    Epub({
        this.isAvailable,
        this.downloadLink,
        this.acsTokenLink,
    });

    factory Epub.fromRawJson(String str) => Epub.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Epub.fromJson(Map<String, dynamic> json) => Epub(
        isAvailable: json["isAvailable"],
        downloadLink: json["downloadLink"],
        acsTokenLink: json["acsTokenLink"],
    );

    Map<String, dynamic> toJson() => {
        "isAvailable": isAvailable,
        "downloadLink": downloadLink,
        "acsTokenLink": acsTokenLink,
    };
}

class Pdf {
    bool? isAvailable;
    String? acsTokenLink;

    Pdf({
        this.isAvailable,
        this.acsTokenLink,
    });

    factory Pdf.fromRawJson(String str) => Pdf.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

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
    Country? country;
    Saleability? saleability;
    bool? isEbook;
    String? buyLink;
    SaleInfoListPrice? listPrice;
    SaleInfoListPrice? retailPrice;
    List<Offer>? offers;

    SaleInfo({
        this.country,
        this.saleability,
        this.isEbook,
        this.buyLink,
        this.listPrice,
        this.retailPrice,
        this.offers,
    });

    factory SaleInfo.fromRawJson(String str) => SaleInfo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: countryValues.map[json["country"]]!,
        saleability: saleabilityValues.map[json["saleability"]]!,
        isEbook: json["isEbook"],
        buyLink: json["buyLink"],
        listPrice: json["listPrice"] == null ? null : SaleInfoListPrice.fromJson(json["listPrice"]),
        retailPrice: json["retailPrice"] == null ? null : SaleInfoListPrice.fromJson(json["retailPrice"]),
        offers: json["offers"] == null ? [] : List<Offer>.from(json["offers"]!.map((x) => Offer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "country": countryValues.reverse[country],
        "saleability": saleabilityValues.reverse[saleability],
        "isEbook": isEbook,
        "buyLink": buyLink,
        "listPrice": listPrice?.toJson(),
        "retailPrice": retailPrice?.toJson(),
        "offers": offers == null ? [] : List<dynamic>.from(offers!.map((x) => x.toJson())),
    };
}

class SaleInfoListPrice {
    int? amount;
    String? currencyCode;

    SaleInfoListPrice({
        this.amount,
        this.currencyCode,
    });

    factory SaleInfoListPrice.fromRawJson(String str) => SaleInfoListPrice.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

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
    int? finskyOfferType;
    OfferListPrice? listPrice;
    OfferListPrice? retailPrice;

    Offer({
        this.finskyOfferType,
        this.listPrice,
        this.retailPrice,
    });

    factory Offer.fromRawJson(String str) => Offer.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        finskyOfferType: json["finskyOfferType"],
        listPrice: json["listPrice"] == null ? null : OfferListPrice.fromJson(json["listPrice"]),
        retailPrice: json["retailPrice"] == null ? null : OfferListPrice.fromJson(json["retailPrice"]),
    );

    Map<String, dynamic> toJson() => {
        "finskyOfferType": finskyOfferType,
        "listPrice": listPrice?.toJson(),
        "retailPrice": retailPrice?.toJson(),
    };
}

class OfferListPrice {
    int? amountInMicros;
    String? currencyCode;

    OfferListPrice({
        this.amountInMicros,
        this.currencyCode,
    });

    factory OfferListPrice.fromRawJson(String str) => OfferListPrice.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

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
    String? textSnippet;

    SearchInfo({
        this.textSnippet,
    });

    factory SearchInfo.fromRawJson(String str) => SearchInfo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
        textSnippet: json["textSnippet"],
    );

    Map<String, dynamic> toJson() => {
        "textSnippet": textSnippet,
    };
}

class VolumeInfo {
    String? title;
    String? subtitle;
    List<String>? authors;
    String? publishedDate;
    List<IndustryIdentifier>? industryIdentifiers;
    ReadingModes? readingModes;
    int? pageCount;
    PrintType? printType;
    List<String>? categories;
    MaturityRating? maturityRating;
    bool? allowAnonLogging;
    String? contentVersion;
    PanelizationSummary? panelizationSummary;
    ImageLinks? imageLinks;
    Language? language;
    String? previewLink;
    String? infoLink;
    String? canonicalVolumeLink;
    String? description;
    String? publisher;
    int? averageRating;
    int? ratingsCount;

    VolumeInfo({
        this.title,
        this.subtitle,
        this.authors,
        this.publishedDate,
        this.industryIdentifiers,
        this.readingModes,
        this.pageCount,
        this.printType,
        this.categories,
        this.maturityRating,
        this.allowAnonLogging,
        this.contentVersion,
        this.panelizationSummary,
        this.imageLinks,
        this.language,
        this.previewLink,
        this.infoLink,
        this.canonicalVolumeLink,
        this.description,
        this.publisher,
        this.averageRating,
        this.ratingsCount,
    });

    factory VolumeInfo.fromRawJson(String str) => VolumeInfo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"],
        subtitle: json["subtitle"],
        authors: json["authors"] == null ? [] : List<String>.from(json["authors"]!.map((x) => x)),
        publishedDate: json["publishedDate"],
        industryIdentifiers: json["industryIdentifiers"] == null ? [] : List<IndustryIdentifier>.from(json["industryIdentifiers"]!.map((x) => IndustryIdentifier.fromJson(x))),
        readingModes: json["readingModes"] == null ? null : ReadingModes.fromJson(json["readingModes"]),
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
        description: json["description"],
        publisher: json["publisher"],
        averageRating: json["averageRating"],
        ratingsCount: json["ratingsCount"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "authors": authors == null ? [] : List<dynamic>.from(authors!.map((x) => x)),
        "publishedDate": publishedDate,
        "industryIdentifiers": industryIdentifiers == null ? [] : List<dynamic>.from(industryIdentifiers!.map((x) => x.toJson())),
        "readingModes": readingModes?.toJson(),
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
        "description": description,
        "publisher": publisher,
        "averageRating": averageRating,
        "ratingsCount": ratingsCount,
    };
}

class ImageLinks {
    String? smallThumbnail;
    String? thumbnail;

    ImageLinks({
        this.smallThumbnail,
        this.thumbnail,
    });

    factory ImageLinks.fromRawJson(String str) => ImageLinks.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

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
    Type? type;
    String? identifier;

    IndustryIdentifier({
        this.type,
        this.identifier,
    });

    factory IndustryIdentifier.fromRawJson(String str) => IndustryIdentifier.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

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
    bool? containsEpubBubbles;
    bool? containsImageBubbles;

    PanelizationSummary({
        this.containsEpubBubbles,
        this.containsImageBubbles,
    });

    factory PanelizationSummary.fromRawJson(String str) => PanelizationSummary.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

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
    bool? text;
    bool? image;

    ReadingModes({
        this.text,
        this.image,
    });

    factory ReadingModes.fromRawJson(String str) => ReadingModes.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

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
