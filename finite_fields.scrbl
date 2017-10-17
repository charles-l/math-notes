#lang scribble/base
@(require scribble-math)
@(require pict)
@(define (proof . cont)
                    (list
                     (italic "Proof")
                     (nested #:style 'inset cont)))

@(define (generator . s*)
                    (string-append "\\langle " (apply string-append s*) "\\rangle"))

@title{Abstract algebra and finite fields}

@section{Group}

Let @${G} be a set.

Let there be an operation @${* : G \times G \rightarrow G}

If the @${*} operation has associativity, an identity and an inverse, it is a group.

@section{Coset}

Let @${G} be a group and @${H} be a subgroup. Let @${g \in G}

@$${gH = \{gh, h \in H\}} is a left coset.
@$${Hg = \{hg, h \in H\}} is a right coset.

@section{Ring}

A ring is composed of:
@itemlist[@item{a set}
          @item{a @${+} operation (forming an abelien group - a.k.a. a commutative group)}
          @item{a @${*} operation (with associative and distributive properties)}]

@section{Ideal}

An ideal is a subgroup of a ring in addition.

A left ideal is @${RI \subseteq I} (where @${R * I} is defined by @${\forall r \in R, \forall i \in I, r * i \in I})

A right ideal is @${IR \subseteq I} (where @${I * R} is defined by @${\forall i \in I, \forall r \in R, i * r \in I})

@margin-note{Note: If the @${*} operation is commutative, the ideal will be two sided}
A two-side ideal is @${RI \subseteq I} and @${IR \subseteq I}

@bold{Example}

Let @${R} be a ring.

@$${R = \{2k : k \in \mathbb{Z}\} = 2\mathbb{Z}}
@$${I = 6\mathbb{Z} \subseteq 2\mathbb{Z}}
Note @${\forall r \in R, i \in I, r * i} is a multiple of 6 (since @${i} is a multiple of 6).

@$${\Rightarrow ri \in I}
@centered{@${\therefore RI \subseteq I} and @${IR \subseteq I}}

@margin-note{Note: if I is an ideal, then @${RI = I} if @${R} has the multiplicative identity}

@${(R,+)} is an abelian group. @${I} is a subgroup.

Cosets of @${I} are @${a + I} for some @${a \in R}

@bold{These cosets form a group.}

Bear in mind: @${a + I = a^\prime + I} iff @${a - a^\prime \in I}

@proof{
Claim: if @${i \in I} then @${i + I = I} (i.e. @${i + I \subseteq I} and @${I \subseteq i + I})

@$${\forall j \in I, i + j \in I}
@$${\therefore i + I \subseteq I}

And for the opposite direction:

@$${\forall j \in I, i + (j - i) \in i + I}

Because @${(j - i) \in I},

@$${\Rightarrow j \in i + I}
@centered{@${\therefore I \subseteq i + I} [@${*}]}

Which means @${i + I = I}

@centered{If @${a - a^\prime \in I}, then @${a + I = a^\prime + (a - a^\prime) + I}}
@centered{@${= a^\prime + I} (by @${*}) [@${**}]}

@centered{If @${a + I = a^\prime + I}, then @${a + 0 = a^\prime + j} for some @${j \in I}}
@centered{@${a - a^\prime = j \in I} by @${**}}
@centered{@${\therefore a + I = a^\prime + I} iff @${a - a^\prime \in I} ∎}
}

@section{Quotient ring}

The collection of cosets in @${I} is defined by:
@$${R/I = \{a + I : a \in R\}}

Define (where @${a, b \in R}):
@$${(a + I) + (b + I) = (a + b) + I}
@$${(a + I) * (b + I) = ab + I}

@italic{Example}

Consider @${\mathbb{Z}} (a ring) and @${6\mathbb{Z}} (multiples of 6 -- an ideal of @${\mathbb{Z}}), the quotient ring is @${\mathbb{Z}_{6} = \mathbb{Z}/6\mathbb{Z}}

A @bold{Principle ideal} is defined by: @${I = aR, a \in R = @generator{a}} (we say it is generated by A)

id @${a * 0 = 0 \in R}

inverse @${a * b + a * -b = a(b - b) = a * 0 = 0}

@${\Rightarrow a * -b} is the multiplicative inverse of @${a * b} in @${@generator{a}}

@${a * b + a * c = a(b + c) \in @generator{a}}

@${\forall b \in R, b * @generator{a} = baR = a(bR) \subseteq aR = @generator{a}}

@${\therefore R * @generator{a} \subseteq @generator{a}}

---

PID = principle ideal domain

F = field

F[X] is a PID

Commutative, unity, no zero divisor

@proof{
Let @${I} be an ideal of @${F[X]}, @${p(x) \in I} be a lowest degree non-zero polynomial.

Assume @${i(x) \in I} s.t. @${\nexists a(x) \in R} s.t. @${p(x)a(x) = i(x)}

@${i(x) = p(x) * q(x) + r(x)}

Degree of @${r(x)} < degree of @${p(x)}

Note @${i(x) \in I} and @${p(x)q(x) \in I}

@${r(x) = i(x) - p(x)q(x) \in I}

Degree of @${r(x)} can't be lower than the lowest nonzero polynomial in @${I}.

@${\therefore} contraction.
}

@${\mathbb{Z}_{n} = {0, 1, 2, ..., n - 1}} (@${+}, @${*} done mod n)

@${\mathbb{Z}_{n} \cong \mathbb{Z} / n\mathbb{Z}}
@margin-note{Note: @${n \mathbb{Z} = @generator{n}} i.e. the ideal of @${\mathbb{Z}} generated by n}

cosets: @${a + n\mathbb{Z}, a \in \mathbb{Z}} and @${a + n\mathbb{Z}, a + n \mathbb{Z}} if @${a - a^{\prime} \in n \mathbb{Z}}

Ideals can be viewed as partitions:

TODO: add arrows and merge stuff to this picture

@(let* ((first (rectangle 10 100))
          (first-lab (text "Ideal"))
          (combined (vl-append
                     (hc-append
                      (text "R=")
                      first
                      (rectangle 10 100)
                      (rectangle 10 100)
                      (rectangle 10 100)
                      (rectangle 10 100)
                      (rectangle 10 100)
                      (rectangle 10 100)
                      (rectangle 10 100)
                      (rectangle 10 100))
                     first-lab)))
          (pin-line combined first cc-find first-lab cc-find))

Each ideal gets merged into a single element. The first @${I \rightarrow 0}, then @${a + I \rightarrow a}, @${b + I \rightarrow b}, ...

TODO: do example of Z_9

---

Principle ideal domain is a ring with
@itemlist[@item{Commutative multiplication}
          @item{Unity for multiplication}
          @item{No zero divisors}
          @item{Every ideal can be generated by 1 element}]

So every ideal is @${a * R} for a certain @${a}

@${F} is a field. @${F[x] \supseteq F}.

@${F[x]} is a PID since every ideal you can find can be written as @${p(x) * F[x]}

@${F[x, y]} is not a PID

@margin-note{To find a subgroup @${H \subseteq G}, @${H} is a subgroup of G iff @${\forall h_{1}, h_{2} \in H,} @${h_{1}, h_{2}^{-1} \in H}}
@proof{
          @$${I = \{p(x, y) | p(0, 0) = 0\}}
          (i.e. all polynomails without constants)
          @$${q, r \in I}
          @$${q - r \in I}
          @${\forall q(x, y) \in F[x, y], \forall p (x, y) \in I} we want to show @${\nexists p(x, y) \in I} s.t @${\forall q(x, y) \in I, p(x, y)q(x, y) \in I}

          Lowest degree polynomials @${x} or @${y} can't be divided by anything but a constant, but constants aren't in @${I}, so @${F[x, y]} isn't a PID. ∎
}

@bold{Theorem 4.2}
Let @${F} be a field and @${f(x) \in F[x]} be an irreducible polynomial.
Then @${F[x]/@generator{f(x)}} is a field

@proof{
          @${F[x]/@generator{f(x)} \supseteq \{a + @generator{f(x)} : a \in F\} \cong F}
          Multiplicative identity is @${1 + @generator{f(x)}}

          Other axioms hold.

          Now to find the multiplicative inverse such that @${p(x)q(x) = 1 + s(x)f(x)}

          Since then @${(p(x) + @generator{f(x)})(q(x) + @generator{f(x)}) = p(x)q(x) + @generator{f(x)}}

          @${= 1 + s(x)f(x) + @generator{f(x)}}

          Note that @${s(x)f(x) + @generator{f(x)} \in @generator{f(x)}}

          For every coset of @${@generator{f(x)}} we need to find its multiplicative inverse. All cosets are in the form @${p(x) + f(x)} where @${\deg p(x) < \deg f(x)}.

          Note that then @${\gcd(p(x), f(x)) = 1} since @${f(x)} is irreducible.

          By the division algorithm, @${\exists q(x)s(x)} such that @${p(x)q(x) - s(x)f(x) = 1}

          @${\therefore \exists} a multiplicative inverse. ∎
}
