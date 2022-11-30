import 'dart:io';
import 'dart:math';

void main() {
  var passtype;
  print("___________PasswordGenerator___________");
  print("Password Type:\n [1] Weak\n [2] Medium\n [3] Strong\n [4] Others\n");
  stdout.write("Enter pasword type:\t");
  String? temp = stdin.readLineSync();
  if (temp != null) {
    passtype = int.parse(temp);
  }

  passwordGen pass = new passwordGen(passtype);
  pass.generate();
  pass.shuffleGen();
}

class passwordGen {
  var passtype;
  int nums = 0;

  String pass = "q";
  int upper = 0, lower = 0, num = 0, spe = 0;
  passwordGen(int newpasswordGen) {
    this.passtype = newpasswordGen;
  }

  void generate() {
    if (passtype == 1) {
      int n = 5;
      int count = (n / 3).toInt();
      int rem = (n.remainder(3));
      upper = count;
      lower = count;
      num = count;
      spe = rem;
      nums = n;
    } else if (passtype == 2) {
      int n = 15;
      int count = (n / 3).toInt();
      int rem = (n.remainder(3));
      upper = count;
      lower = count;
      num = count;
      spe = rem;
      nums = n;
    } else if (passtype == 3) {
      int n = 25;
      int count = (n / 3).toInt();
      int rem = (n.remainder(3));
      upper = count;
      lower = count;
      num = count;
      spe = rem;
      nums = n;
    } else if (passtype == 4) {
      int n = 0;
      stdout.write("Enter password length:\t");
      String? temp = stdin.readLineSync();
      if (temp != null) {
        n = int.parse(temp);
      }
      int count = (n / 3).toInt();
      int rem = (n.remainder(3));
      upper = count;
      lower = count;
      num = count;
      spe = rem;
      nums = n;
    } else {
      print("Invalid Input");
    }
    var alp = [
      "q",
      "w",
      "e",
      "r",
      "t",
      "y",
      "u",
      "i",
      "o",
      "p",
      "a",
      "s",
      "d",
      "f",
      "g",
      "h",
      "j",
      "k",
      "l",
      "z",
      "x",
      "c",
      "v",
      "b",
      "n",
      "m"
    ];
    var numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
    var special = [
      "@",
      "#",
      "=",
      "+",
      "!",
      "£",
      "%",
      "&",
      "?",
      "[",
      "]",
      "(",
      ")",
      "{",
      "}"
    ];

    var ran = new Random();
    for (int i = 0; i < upper; i++) {
      pass = pass + alp[ran.nextInt(25)];
    }
    for (int i = 0; i < lower; i++) {
      pass = pass + (alp[ran.nextInt(25)]).toUpperCase();
    }
    for (int i = 0; i < num; i++) {
      pass = pass + numbers[ran.nextInt(9)];
    }
    for (int i = 0; i < spe; i++) {
      pass = pass + special[ran.nextInt(14)];
    }
    pass = pass.substring(1);
  }

  void shuffleGen() {
    String newpass = "q";
    var passlist = pass.split("");
    passlist.shuffle();
    for (int x = 0; x < nums; x++) {
      newpass = newpass + passlist[x];
    }
    pass = newpass;
    pass = pass.substring(1);
    print("*********************************************\n");
    print("Your Password:\t $pass");
  }
}
