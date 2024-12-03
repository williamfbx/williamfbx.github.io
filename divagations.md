---
layout: about
image:
description:
hide_description: true
---

# Divagations

> **Divagations**: *Noun*. A departure from the subject or course.

### Philosophy

I mainly use this page to share resources that I find useful but is often overlooked in the undergraduate educational curriculum.

### Coherent Proof Writing

Proof writing is an art. However, it is seldom taught in the undergraduate mathematics curriculum. 
It takes a lot of practice to improve upon writing coherent proofs. A very useful technique taught by Prof. Arun Ram (my Metric and Hilbert Spaces instructor) is called 
**Proof Machine**. I found it to be extremely helpful in my exposition. In Prof. Ram's words:

> To prove 'If A then B', ***Assume*** the ifs and ***To show*** the thens, and that’s about all there is to it. The rest is just practice.

You can find Prof. Ram's notes on Proof Machine [here](http://math.soimeme.org/~arunram/Teaching/2022MetricHilbert/ProofMachine220630.pdf).

### Universal Approximation Theorem for Neural Networks

Almost every undergraduate student majoring in CS is taking courses that teach NNs, CNNs, deep learning, gradient descent, etc. Most courses only teach implementation, few and far between do they teach the maths behind it (probably because it requires learning about compactness and function spaces... see below). The reason why neural networks work is because of the **Universal Approximation Theorem** (see [Wikipedia](https://en.wikipedia.org/wiki/Universal_approximation_theorem) and [intuition](http://neuralnetworksanddeeplearning.com/chap4.html)). A readable proof for undergraduates well-versed in mathematics can be found [here](https://link.springer.com/content/pdf/10.1007/BF02551274.pdf) (for the case of continuous functions) attributable to Prof. Cybenko. Proofs for Lebesgue integrable functions exist, but have been too dense (no pun intended) for me to parse.  

By the way, since backprop is used ubiquitously in training NNs, [here](https://www2.math.uconn.edu/~stein/virtual/Notes/Calculus/chainrule.pdf) is a short proof of the Chain Rule. The case of compositions of multiple functions (i.e. nesting) is trivial by induction.

### Why are Gaussians used for Kalman Filters and SLAM?

Because of the Central Limit Theorem. Yet robotics courses almost never prove this important theorem. A proof can be found [here](https://drive.google.com/file/d/1UIVYpoxBY5y4s5Yi0N652k-vH8_XZG1I/view?usp=sharing) (pp. 207 to 208).

### Computer Science from a Mathematician's Perspective

> The solution to every coding problem exists in the power set $${\{0,1\}^\mathbb{N}}$$.

And then the mathematician would shout hurrah and call it a day knowning that a solution exists (because who needs constructive proofs anyways?).

### Construction of the Complex Numbers from Reals from Rationals from Integers from Naturals from Sets

This meme sums it pretty well:

![Screenshot](/assets/img/custom_img/numbers.png){:style="width: 70%; height: auto;"}

In all seriousness, the real numbers is ubiquitous in its usage. Yet so few analysis courses teach how to construct it from scratch (i.e. ZFC set theory). 
It is in my belief that any competent student majoring in pure mathematics should construct it (or at least know how to) once in their undergraduate course of studies. 
I found [this](https://www.math.uni-konstanz.de/~krapp/research/Constructions_of_the_real_numbers.pdf) online resouce by Dr. Sebastian Krapp very useful. 
The construction of the natural numbers can be done through induction on empty sets (see [von Neumann ordinals](http://mathfoundations.lti.cs.cmu.edu/class2/naturals.html)). 
The extension to the complex numbers is trivial (see [Hamilton’s construction](https://drive.google.com/file/d/1e7SCssLHt4uuYQly8Wq9tRMhGeVm4Bup/view?usp=sharing) (p. 2))

### Bra-Ket Notation in Quantum Mechanics

We often use this for granted. Yet the reasoning behind why it works is often left unexplained in introductory (sometimes even graduate) QM courses. 
The reason why Bra-Ket works is because of the [Riesz Representation Theorem](https://fiveable.me/spectral-theory/unit-2/riesz-representation-theorem/study-guide/J3MuZ0kpur4LRRF1). A proof sketch can be found [here](https://drive.google.com/file/d/1_1w1yW45vHlwM31FHOFXmR8kRdYdDqNs/view?usp=sharing) (pp. 20 to 23).

### Compactness and Completeness

This photo basically sums up compactness. It generalizes the fundamental theorems of [Bolzano–Weierstrass](https://en.wikipedia.org/wiki/Bolzano%E2%80%93Weierstrass_theorem) and [Heine–Borel](https://en.wikipedia.org/wiki/Heine%E2%80%93Borel_theorem), which is almost always taught in an undergraduate analysis course.

![Screenshot](/assets/img/custom_img/compactness.jpg){:style="width: 70%; height: auto;"}

### Capital Asset Pricing Model

There are SOOOO many assumptions for the CAPM. I find this unreasonable. It can be condensed into assumptions on markets and assumptions on investors:
- Assumptions on markets:
    - Markets are in equilibrium: prices of assets adjust so that aggregate demand for each asset equals its supply.
    - Frictionless markets
        - Neutral transaction costs and taxes
        - No institutional restrictions on assets trade
        - Divisible assets
    - Unlimited risk-free borrowing and lending
    - Competitive asset markets (investors are price takers)
- Assumptions on investors:
    - All investors behave according to a single-period investment horizon
    - All investors select their portfolios according to a mean-variance objective
    - All investors have homogeneous beliefs

Nevertheless, these assumptions can be used to prove the CAPM, a good derivation can be found [here](https://drive.google.com/file/d/1gbv3ZoOk4xjkWeXXp60EGy-oGWkRsZG2/view?usp=sharing) (pp. 40 to 43). Interestingly, it was an economics class that I first encountered a proof, not a finance class...

### Utility Theory

Economists do things way better. There are only 4 assumptions for the utility representation theorem:
- Completeness
- Transitivity
- Monotonicity
- Continuity (some authors replace this with Convexity)

> **Utility Representation Theorem (Von Neumann–Morgenstern)**: If preferences ≽ satisfy completeness, transitivity, monotonicity and continuity, then there exists a utility function u(**x**) that represents ≽.

Wikipedia offers a [proof sketch](https://en.wikipedia.org/wiki/Von_Neumann%E2%80%93Morgenstern_utility_theorem), [this](https://drive.google.com/file/d/1v0S8P6yJV9gHPdDgVA6n6DvUoBBjqGV7/view?usp=sharing) resource also offers a proof (pp. 16 to 18).