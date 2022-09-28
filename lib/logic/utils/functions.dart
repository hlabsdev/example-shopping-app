import 'dart:ui';

import 'package:assigame_market/logic/managers/managers.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class FunctionUtils {
  /*static Future<bool> saveAssurance(List<AssuranceModel> allAssurance) async {
    if (allAssurance != null) {
      //enregistrement des assurances
      LocalAssuranceRepository localAssuranceRepository =
          LocalAssuranceRepository();
      if (allAssurance.length > 0) {
        int nbreTotal = allAssurance.length;
        for (int i = 0; i < nbreTotal; i++) {
          LocalAssuranceEntity localAssuranceEntity =
              LocalAssuranceEntity.fromMap(allAssurance[i].toMap());

          //verifier si cette assurance existe deja
          localAssuranceRepository
              .existAssurance(localAssuranceEntity.apiId)
              .then((response) {
            if (response.length > 0) {
              localAssuranceEntity.idAssurance = response[0].idAssurance;
              localAssuranceRepository.update(
                  localAssuranceEntity, response[0].idAssurance);
            } else {
              localAssuranceEntity.idAssurance = 0;
              localAssuranceRepository.save(localAssuranceEntity);
            }
          });
        }
      }
    }
  }*/

  static Color colorFromHex(String? hexColor) {
    final hexCode = hexColor!.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  static Color? getColorFromHex(String? hexColor) {
    hexColor = hexColor!.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }

  static MaterialColor createMaterialColor(String hexColor) {
    Color color = colorFromHex(hexColor);
    List strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  static String convertFormat(String timestamp) {
    var _alltabDate = timestamp.split(' ');
    var _tabDate = _alltabDate[0].split('/');
    if (_tabDate.length == 3) {
      return "${_tabDate[2]}-${_tabDate[1]}-${_tabDate[0]}";
    } else {
      return "2020-01-01";
    }
  }

  static int concatDate(String timestamp) {
    var _alltabDate = timestamp.split(' ');
    var _tabDate = _alltabDate[0].split('/');
    if (_tabDate.length == 3) {
      return int.parse("${_tabDate[2]}${_tabDate[1]}${_tabDate[0]}");
    } else {
      return 0;
    }
  }

  static String convertFormatDate(String? dateRecup) {
    if (dateRecup != null || dateRecup != "") {
      var alltabDate = dateRecup!.split(' ');
      var tabDate = alltabDate[0].split('-');
      if (tabDate.length == 3) {
        return "${tabDate[2]} ${convertirMois(tabDate[1])} ${tabDate[0]}";
      } else {
        return "01 janvier 2019";
      }
    } else {
      return "01 janvier 2019";
    }
  }

  ///@Hlabs: This convert month num to month name
  static String convertirMois(String mois) {
    String convertirMois = "";
    switch (int.parse(mois)) {
      case 1:
        convertirMois = 'Janvier';
        break;
      case 2:
        convertirMois = 'Février';
        break;
      case 3:
        convertirMois = 'Mars';
        break;
      case 4:
        convertirMois = 'Avril';
        break;
      case 5:
        convertirMois = 'Mai';
        break;
      case 6:
        convertirMois = 'Juin';
        break;
      case 7:
        convertirMois = 'Juilllet';
        break;
      case 8:
        convertirMois = 'Aout';
        break;
      case 9:
        convertirMois = 'Septembre';
        break;
      case 10:
        convertirMois = 'Octobre';
        break;
      case 11:
        convertirMois = 'Novembre';
        break;
      case 12:
        convertirMois = 'Décembre';
        break;
    }

    return convertirMois;
  }

  ///@Hlabs: Get the locale from preferences
  static getLangText(context, String lang) {
    switch (lang) {
      case 'fr':
        return AppLang.of(context)!.fr;
      case 'en':
        return AppLang.of(context)!.en;
    }
  }

  ///@Hlabs: This return the local langauge from string
  static getLocaleLang(String? lang) {
    String country;
    switch (lang) {
      case 'fr':
        country = 'FR';
        break;
      case 'en':
        country = 'US';
        break;
      default:
        country = 'US';
    }
    return Locale(lang ?? 'en', country);
  }

/*End*/
}
