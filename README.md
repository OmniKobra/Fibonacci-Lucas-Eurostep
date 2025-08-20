# Fibonacci–Lucas Eurostep

An identity rule for generating Fibonacci and Lucas numbers without relying on the classical two-term recurrence.  
The **Fibonacci–Lucas Eurostep (FLE)** “sidesteps” the usual dependency on `F(n-1)` by using a forward-only approach that involves halving and summation principles. To get the next fibonacci number: get the sum of the current Fibonacci and Lucas numbers then divide it by 2.
The result always yields an even number and provides the next fibonacci number after being halved.

The rules are:
- Fn​+1 = (Fn + Ln) / 2
- Fn + Ln -> Always Even
- Ln = 2Fn+1 - Fn
- Fn = 2Fn+1 - Ln

---

## 🚀 Features
- A recurrence relation: **The Fibonacci–Lucas Eurostep Identity**
- Forward-only Fibonacci progression (no need for `F(n-1)`)
- Connections to Lucas numbers via halving the sum of Fn + Ln
- Simple, elegant formulas with proofs and examples

---

## 📖 Usage

### Clone the repository
```bash
git clone https://github.com/OmniKobra/Fibonacci-Lucas-Eurostep
cd Fibonacci-Lucas-Eurostep
```

### Run examples
If you have Dart installed, you can test the identity by passing the max number of sequence entries you want to test with:
```bash
dart bin/fib_lucas.dart 10
```
Otherwise, you can download the executable binary file from the releases section and run it using any terminal with:
```bash
fib_lucas 10
```
---

## 🤝 Contributing
Contributions, ideas, and extensions are very welcome!  
If you find bugs, want to improve documentation, or extend this work, feel free to open an **issue** or a **pull request**.

Please follow the standard [fork-and-pull](https://guides.github.com/activities/forking/) model when contributing.

---

## 💜 Support & Donations
If this project inspires you or saves you time, consider supporting its development:

- **Bitcoin (BTC):** `bc1qrnmu5ps8rmcda9sjfz3u8vdtqwexhe6999we7l`  
- **Ethereum (ETH):** `0x4e9E00ad4086Fd573e693A49221f75A85D733200`  

Your support helps keep the Fibonacci–Lucas Eurostep research alive and growing! 🌱

---
