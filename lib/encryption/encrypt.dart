// import 'dart:core';
// import 'dart:math';
//
// class enkrip {
//
//   getEnkripsi(chrASCII, rnd, g, p, y, pesan) {
//     var gamma;
//     var delta;
//     for (var i = 0; i < pesan.length; i++) {
//       var m = BigInt.from(chrASCII);
//       var k = BigInt.from(rnd);
//       gamma = g.modPow(k, p);
//       delta = y.pow(int.parse(k.toString())).multiply(m).mod(p);
//     }
//     return gamma.toString() + " " + delta.toString() + " ";
//   }
//   getBilanganAcak(pesan, p) {
//     List <int> listNumber = [];
//     var pp = int.parse(p) - 2;
//     var random = Random.secure();
//     var nilairandom = random.nextInt(2000);
//     for (var i = 0; i < pesan.length; i++) {
//       var rand = int.parse((pp.toString() * nilairandom));
//       listNumber.add(rand);
//     }
//     return listNumber;
//   }
//     getCharASCII(pesan) {
//       List <int> listChar = [];
//       for (var i = 0; i < pesan.length; i++)
//       {
//         var chr = pesan.charAt(i);
//         var inn = chr.codeUnitAt(0);
//         listChar.add(inn);
//       }
//       return listChar;
//     }
// }
