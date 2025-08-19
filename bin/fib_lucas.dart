// save as fib_lucas.dart
// ignore_for_file: non_constant_identifier_names

import 'dart:io';

Map<BigInt, BigInt> fibonacci = {};
Map<BigInt, BigInt> lucas = {};

Map<BigInt, BigInt> fibonacciUpTo(BigInt n) {
  if (n < BigInt.zero) {
    throw ArgumentError("n must be non-negative");
  }

  Map<BigInt, BigInt> fib = {};
  BigInt a = BigInt.zero; // Fibonacci(0)
  BigInt b = BigInt.one; // Fibonacci(1)

  for (BigInt i = BigInt.zero; i < n; i += BigInt.one) {
    fib[i + BigInt.one] = a;
    BigInt next = a + b;
    a = b;
    b = next;
  }
  return fib;
}

Map<BigInt, BigInt> lucasUpTo(BigInt n) {
  if (n < BigInt.zero) {
    throw ArgumentError("n must be non-negative");
  }

  Map<BigInt, BigInt> lucas = {};
  BigInt a = BigInt.two; // Lucas(0) = 2
  BigInt b = BigInt.one; // Lucas(1) = 1

  for (BigInt i = BigInt.zero; i < n; i += BigInt.one) {
    lucas[i + BigInt.one] = a;
    BigInt next = a + b;
    a = b;
    b = next;
  }
  return lucas;
}

BigInt rule(BigInt fn, BigInt ln) => (fn + ln) ~/ BigInt.from(2);

bool checkRule(BigInt fn, BigInt ln, BigInt fn_plus_one, BigInt idx) {
  final rl = rule(fn, ln);
  final ruleApplies = rl == fn_plus_one;
  final ruleString = ruleApplies ? "YES" : "NO";
  final sum = fn + ln;
  print(
    "Entry #$idx\n\nFn = $fn\nLn = $ln\nFn + Ln = $sum\n(Fn + Ln) / 2 = $rl\nFn+1 = $fn_plus_one\n\nRule Applies? $ruleString\nSum Is Even? ${sum.isEven.toString().toUpperCase()}",
  );
  print("-" * 64);
  return ruleApplies && sum.isEven;
}

void checkRuleForEntries(BigInt upto) {
  BigInt true_count = BigInt.zero;
  for (BigInt i = BigInt.one; i <= upto; i += BigInt.one) {
    if (i == upto) {
      fibonacci[i + BigInt.one] = fibonacci[i]! + fibonacci[i - BigInt.one]!;
    }
    bool check_rule = checkRule(
      fibonacci[i]!,
      lucas[i]!,
      fibonacci[i + BigInt.one]!,
      i,
    );
    if (check_rule) {
      true_count += BigInt.one;
    }
  }
  print("The rule applies to $true_count / $upto entries!");
  if (true_count == upto) {
    print("All entries satisfy the rule.");
  }
}

void main(List<String> args) {
  print(
    '\nThis script works as a prover for the Fibonacci-Lucas Eurostep.\nIt uncovers a deeper relationship between the Fibonacci and Lucas numbers at the same index.\nRule 1: Their sum is always even.\nRule 2: Halving their sum yields the next Fibonacci number without needing the previous fibonacci number.\n\n> Usage for source code files: "dart fib_lucas.dart <n>"\n> Usage for executable file: "fib_lucas <n>"\n! Examples: "dart fib_lucas.dart 10" or "fib_lucas 10"\n',
  );
  if (args.isEmpty) {
    exit(1);
  }

  try {
    BigInt n = BigInt.parse(args[0]);
    if (n > BigInt.zero) {
      print("*" * 64);
      print("Fibonacci up to index $n:");
      fibonacci = fibonacciUpTo(n);
      for (BigInt i = BigInt.one; i <= n; i += BigInt.one) {
        print("${fibonacci[i]}  ");
      }
      print("*" * 64);
      print("Lucas up to index $n:");
      lucas = lucasUpTo(n);
      for (BigInt i = BigInt.one; i <= n; i += BigInt.one) {
        print("${lucas[i]}  ");
      }
      print("*" * 64);
      checkRuleForEntries(n);
    } else {
      print("Please enter an argument greater than zero.");
    }
  } catch (e) {
    print(e);
    print("Error: Please provide a valid integer argument.");
    exit(1);
  }
}
