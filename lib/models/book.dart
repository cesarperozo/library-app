import 'dart:convert';

class Book {
  Book({
    required this.key,
    required this.type,
    required this.seed,
    required this.title,
    required this.titleSuggest,
    required this.editionCount,
    required this.editionKey,
    this.firstPublishYear,
    this.isbn,
    this.numberOfPagesMedian,
    this.publishPlace,
    required this.lastModifiedI,
    required this.ebookCountI,
    required this.hasFulltext,
    this.publicScanB,
    this.iaCollectionS,
    this.lendingEditionS,
    this.lendingIdentifierS,
    this.printdisabledS,
    this.coverEditionKey,
    this.coverI,
    this.publisher,
    this.language,
    this.authorKey,
    this.authorName,
    this.authorAlternativeName,
    this.person,
    this.place,
    this.subject,
    this.time,
    this.idAlibrisId,
    this.idAmazon,
    this.idCanadianNationalLibraryArchive,
    this.idDepsitoLegal,
    this.idGoodreads,
    this.idGoogle,
    this.idLibrarything,
    this.idOverdrive,
    this.idPaperbackSwap,
    this.idWikidata,
    this.iaLoadedId,
    this.iaBoxId,
    this.personKey,
    this.placeKey,
    this.timeFacet,
    this.personFacet,
    this.subjectFacet,
    required this.version,
    this.placeFacet,
    this.lccSort,
    this.authorFacet,
    this.subjectKey,
    this.ddcSort,
    this.timeKey,
    this.firstSentence,
    this.idAmazonCaAsin,
    this.idAmazonCoUkAsin,
    this.idAmazonDeAsin,
    this.idAmazonItAsin,
    this.idBcid,
    this.idBritishNationalBibliography,
    this.idNla,
  });

  String key;
  String type;
  List<String> seed;
  String title;
  String titleSuggest;
  int editionCount;
  List<String>? editionKey;
  int? firstPublishYear;
  List<String>? isbn;
  int? numberOfPagesMedian;
  List<String>? publishPlace;
  int lastModifiedI;
  int ebookCountI;
  bool hasFulltext;
  bool? publicScanB;
  String? iaCollectionS;
  String? lendingEditionS;
  String? lendingIdentifierS;
  String? printdisabledS;
  String? coverEditionKey;
  int? coverI;
  List<String>? publisher;
  List<String>? language;
  List<String>? authorKey;
  List<String>? authorName;
  List<String>? authorAlternativeName;
  List<String>? person;
  List<String>? place;
  List<String>? subject;
  List<String>? time;
  List<String>? idAlibrisId;
  List<String>? idAmazon;
  List<String>? idCanadianNationalLibraryArchive;
  List<String>? idDepsitoLegal;
  List<String>? idGoodreads;
  List<String>? idGoogle;
  List<String>? idLibrarything;
  List<String>? idOverdrive;
  List<String>? idPaperbackSwap;
  List<String>? idWikidata;
  List<String>? iaLoadedId;
  List<String>? iaBoxId;
  List<String>? personKey;
  List<String>? placeKey;
  List<String>? timeFacet;
  List<String>? personFacet;
  List<String>? subjectFacet;
  double version;
  List<String>? placeFacet;
  String? lccSort;
  List<String>? authorFacet;
  List<String>? subjectKey;
  String? ddcSort;
  List<String>? timeKey;
  List<String>? firstSentence;
  List<String>? idAmazonCaAsin;
  List<String>? idAmazonCoUkAsin;
  List<String>? idAmazonDeAsin;
  List<String>? idAmazonItAsin;
  List<String>? idBcid;
  List<String>? idBritishNationalBibliography;
  List<String>? idNla;
  get coverImg {
    if (isbn?[0] != null) {
      return 'https://covers.openlibrary.org/b/isbn/${isbn?[0]}-M.jpg';
    }

    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  get fullBackdropPathImg {
    if (isbn?[1] != null) {
      return 'https://covers.openlibrary.org/b/isbn/${isbn?[0]}-L.jpg';
    }

    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  factory Book.fromJson(String str) => Book.fromMap(json.decode(str));

  factory Book.fromMap(Map<String, dynamic> json) => Book(
        key: json["key"],
        type: json["type"],
        seed: List<String>.from(json["seed"].map((x) => x)),
        title: json["title"],
        titleSuggest: json["title_suggest"],
        editionCount: json["edition_count"],
        editionKey: json["edition_key"] == null
            ? null
            : List<String>.from(json["edition_key"].map((x) => x)),
        firstPublishYear: json["first_publish_year"],
        isbn: json["isbn"] == null
            ? null
            : List<String>.from(json["isbn"].map((x) => x)),
        numberOfPagesMedian: json["number_of_pages_median"] == null
            ? null
            : json["number_of_pages_median"],
        publishPlace: json["publish_place"] == null
            ? null
            : List<String>.from(json["publish_place"].map((x) => x)),
        lastModifiedI: json["last_modified_i"],
        ebookCountI: json["ebook_count_i"],
        hasFulltext: json["has_fulltext"],
        publicScanB:
            json["public_scan_b"] == null ? null : json["public_scan_b"],
        iaCollectionS:
            json["ia_collection_s"] == null ? null : json["ia_collection_s"],
        lendingEditionS: json["lending_edition_s"] == null
            ? null
            : json["lending_edition_s"],
        lendingIdentifierS: json["lending_identifier_s"] == null
            ? null
            : json["lending_identifier_s"],
        printdisabledS:
            json["printdisabled_s"] == null ? null : json["printdisabled_s"],
        coverEditionKey: json["cover_edition_key"] == null
            ? null
            : json["cover_edition_key"],
        coverI: json["cover_i"] == null ? null : json["cover_i"],
        publisher: json["publisher"] == null
            ? null
            : List<String>.from(json["publisher"].map((x) => x)),
        language: json["language"] == null
            ? null
            : List<String>.from(json["language"].map((x) => x)),
        authorKey: json["author_key"] == null
            ? null
            : List<String>.from(json["author_key"].map((x) => x)),
        authorName: json["author_name"] == null
            ? null
            : List<String>.from(json["author_name"].map((x) => x)),
        authorAlternativeName: json["author_alternative_name"] == null
            ? null
            : List<String>.from(json["author_alternative_name"].map((x) => x)),
        person: json["person"] == null
            ? null
            : List<String>.from(json["person"].map((x) => x)),
        place: json["place"] == null
            ? null
            : List<String>.from(json["place"].map((x) => x)),
        subject: json["subject"] == null
            ? null
            : List<String>.from(json["subject"].map((x) => x)),
        time: json["time"] == null
            ? null
            : List<String>.from(json["time"].map((x) => x)),
        idAlibrisId: json["id_alibris_id"] == null
            ? null
            : List<String>.from(json["id_alibris_id"].map((x) => x)),
        idAmazon: json["id_amazon"] == null
            ? null
            : List<String>.from(json["id_amazon"].map((x) => x)),
        idCanadianNationalLibraryArchive:
            json["id_canadian_national_library_archive"] == null
                ? null
                : List<String>.from(
                    json["id_canadian_national_library_archive"].map((x) => x)),
        idDepsitoLegal: json["id_depósito_legal"] == null
            ? null
            : List<String>.from(json["id_depósito_legal"].map((x) => x)),
        idGoodreads: json["id_goodreads"] == null
            ? null
            : List<String>.from(json["id_goodreads"].map((x) => x)),
        idGoogle: json["id_google"] == null
            ? null
            : List<String>.from(json["id_google"].map((x) => x)),
        idLibrarything: json["id_librarything"] == null
            ? null
            : List<String>.from(json["id_librarything"].map((x) => x)),
        idOverdrive: json["id_overdrive"] == null
            ? null
            : List<String>.from(json["id_overdrive"].map((x) => x)),
        idPaperbackSwap: json["id_paperback_swap"] == null
            ? null
            : List<String>.from(json["id_paperback_swap"].map((x) => x)),
        idWikidata: json["id_wikidata"] == null
            ? null
            : List<String>.from(json["id_wikidata"].map((x) => x)),
        iaLoadedId: json["ia_loaded_id"] == null
            ? null
            : List<String>.from(json["ia_loaded_id"].map((x) => x)),
        iaBoxId: json["ia_box_id"] == null
            ? null
            : List<String>.from(json["ia_box_id"].map((x) => x)),
        personKey: json["person_key"] == null
            ? null
            : List<String>.from(json["person_key"].map((x) => x)),
        placeKey: json["place_key"] == null
            ? null
            : List<String>.from(json["place_key"].map((x) => x)),
        timeFacet: json["time_facet"] == null
            ? null
            : List<String>.from(json["time_facet"].map((x) => x)),
        personFacet: json["person_facet"] == null
            ? null
            : List<String>.from(json["person_facet"].map((x) => x)),
        subjectFacet: json["subject_facet"] == null
            ? null
            : List<String>.from(json["subject_facet"].map((x) => x)),
        version: json["_version_"].toDouble(),
        placeFacet: json["place_facet"] == null
            ? null
            : List<String>.from(json["place_facet"].map((x) => x)),
        lccSort: json["lcc_sort"] == null ? null : json["lcc_sort"],
        authorFacet: json["author_facet"] == null
            ? null
            : List<String>.from(json["author_facet"].map((x) => x)),
        subjectKey: json["subject_key"] == null
            ? null
            : List<String>.from(json["subject_key"].map((x) => x)),
        ddcSort: json["ddc_sort"] == null ? null : json["ddc_sort"],
        timeKey: json["time_key"] == null
            ? null
            : List<String>.from(json["time_key"].map((x) => x)),
        firstSentence: json["first_sentence"] == null
            ? null
            : List<String>.from(json["first_sentence"].map((x) => x)),
        idAmazonCaAsin: json["id_amazon_ca_asin"] == null
            ? null
            : List<String>.from(json["id_amazon_ca_asin"].map((x) => x)),
        idAmazonCoUkAsin: json["id_amazon_co_uk_asin"] == null
            ? null
            : List<String>.from(json["id_amazon_co_uk_asin"].map((x) => x)),
        idAmazonDeAsin: json["id_amazon_de_asin"] == null
            ? null
            : List<String>.from(json["id_amazon_de_asin"].map((x) => x)),
        idAmazonItAsin: json["id_amazon_it_asin"] == null
            ? null
            : List<String>.from(json["id_amazon_it_asin"].map((x) => x)),
        idBcid: json["id_bcid"] == null
            ? null
            : List<String>.from(json["id_bcid"].map((x) => x)),
        idBritishNationalBibliography:
            json["id_british_national_bibliography"] == null
                ? null
                : List<String>.from(
                    json["id_british_national_bibliography"].map((x) => x)),
        idNla: json["id_nla"] == null
            ? null
            : List<String>.from(json["id_nla"].map((x) => x)),
      );
}
