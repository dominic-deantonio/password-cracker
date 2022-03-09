const actual = "ABCDEF";
int attempt = 1;
bool solved = false;
DateTime? started;

void main(List<String> arguments) {
  String allChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890`~!@#\$%^&*()_+[];',./\\{}|:\">?";
  List<String> characters = allChars.split("");

  started = DateTime.now();

  for (int wordLength = 1; wordLength < actual.length + 1; wordLength++) {
    myPrint("Starting $wordLength", wordLength);
    tryEveryCombination(characters, wordLength);
    if (solved) break;
  }
}

// The method that prints all possible strings of length k.
void tryEveryCombination(List<String> set, int length) {
  int n = set.length;
  combineRecursively(set, "", n, length);
}

// The main recursive method to print all possible strings of length k
void combineRecursively(List<String> set, String prefix, int n, int length) {
  // Base case: length is 0,
  // print prefix

  if (solved) return;

  if (length == 0) {
    if (prefix == actual) {
      myPrint("Solved $prefix", length);
      solved = true;
    }
    attempt++;
    return;
  }

  // One by one add all characters from set and recursively call for length equals to length-1
  for (int i = 0; i < n; ++i) {
    // Next character of input added
    String newPrefix = prefix + set[i];

    // length is decreased because we have added a new character
    combineRecursively(set, newPrefix, n, length - 1);
  }
}

void myPrint(String msg, int length) {
  var time = DateTime.now().millisecondsSinceEpoch - started!.millisecondsSinceEpoch;
  print("A: $attempt T: ${time}ms L: $length - $msg");
}
