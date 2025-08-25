# fortran-wringer-tests

## Overview

"Fortran isn't dead, it just smells funny."

This is a collection of non-portable Fortran usage, standard-conformant
and otherwise.

This directory holds a collection of some Fortran test programs that
I have accumulated during the development of the f18 Fortran compiler
(also known as "LLVM Flang").
I wrote these programs when my reading of the Fortran 2018 standard
was not clear or when I encountered some language extensions in
real codes.

The comments about results from the various Fortran compilers to which
I have access are not meant to imply that there are bugs or any
deficiencies in any of these compilers, just that the results that
I observed varied quite a bit.

It is likely that some or all of these compilers have evolved since
I collected these results; please be sure to verify them against
their most recent releases before doing anything with this data.

Please submit updated results, comments about standard conformance,
and more weird Fortran usage tests as pull requests to this
repository.

## Results

Rather than identifying the various compilers with their particular
results for each test, I report here the number of distinct behaviors
(modulo insignificant differences) exhibited by the compilers that
I've tested.
These behaviors are denoted like `2+1+1`: this example signifies that I
observed three distinct behaviors for a test, and that two compiler
behaved the same, and two others each had their own distinct behavior.
(The first number usually counts the number of compilers that exhibit
what I believe to be the correct behavior, but that is often unclear.)

| test | observed behaviors | notes |
| ---- | ------------------ | ----- |
| acos-iface.f90 | 4+3 | |
| allocatable-result.f90 | 2+5 | |
| ambig-generic.f90 | 2+5 | |
| ambiguous-generic.f90 | 5+2 | |
| associate-alias.f90 | 6+1 | |
| associated-null.f90 | 4+3 | |
| assumed-ptr-dummy.f90 | 3+1+1+2 | 2 compilers crashed |
| assumed-rank-null.f90 | 4+1+1+1 | |
| bad-null-actual.f90 | 4+1+1+1 | 1 compiler crash |
| bare-L.f90 | 6+1 | |
| big-input.f90 | 3+2+1+1+1 | |
| bindc-charlen.f90 | 3+3+1 | 1 compiler crash |
| child-io-eor.f90 | 1+2+1+1+1+1 | |
| combined-generic.f90 | 4+3 | |
| comma-terminated-field.f90 | 4+3| |
| common-spec.f90 | 5+2 | |
| complex-ctor.f90 | 4+3 | |
| complex-part.f90 | 5+1+1 | |
| construct-names.f90 | 5+2 | |
| data-in-block.f90 | 3+3+1 | |
| dealloc-in-defined-asst.f90 | 1+1+1+1+2 runtime crashes | |
| doubled-operators.f | 5+2 | |
| dummy-dio.f90 | 2+2+1+1+1 | |
| fd-misinfo01.f90 | 7 | |
| fd-misinfo02.f90 | 4+2+1 | |
| final-array-2.f90 | 1+2+1+1+1+1 | 1 runtime crash |
| final-array.f90 | 2+3+1+1 | 1 runtime crash |
| final-out.f90 | 1+1+3+2 | |
| final-spec.f90 | 3+1+1+1+1 | |
| final-vs-io.f90 | 2+1+1+1+1+1 | |
| func-as-subr.f90 | 1+2+1+1+1+1 | 2 compiler crashes |
| func-as-var.f90 | 3+4 | |
| func-result-len.f90 | 2+1+1+1+1+1 | |
| func-type-redef.f90 | 4+3 | |
| func-type-scope.f90 | 3+2+1+1 | |
| host-assoc-decl.f90 | 1+3+3 | |
| host-assoc-type.f90 | 4+1+2 | |
| huge.f90 | 3+1+3 | |
| implicit-intrinsic.f90 | 3+4 | |
| implied-async.f90 | 2+1+4 | |
| import-only-dio.f90 | 2+2+1+2 | |
| impossible-output.f90 | 2+2+2+1 | |
| include.f90 | 1+6 | |
| infinite-chars.f90 | 3+1+3 | 3 compilers crash |
| inquire-closed.f90 | 5+2 | |
| inquire-dir.f90 | 6+1 | |
| inquire-mid.f90 | 1+1+1+1+1+1+1 | |
| inquire-position.f90 | 4+1+1+1 | 1 runtime crash |
| internal-overrun.f90 | 5+1+1 | |
| int-overflow-read.f90 | 4+1+1+1 | |
| invisible-dio.f90 | 4+1+1+1 | |
| kinds-decls.f90 | 5+2 | |
| legacy-fmt.f90 | 5+1+1 | |
| list-copy.f90 | 4+3 | |
| list-directed-defined-output-spacing.f90 | 3+1+1+1 | |
| logical.f90 | 4+2+1 | |
| main-return.f90 | 4+3 | |
| maxmin-absent.f90 | 5+2 | |
| maxmin-nan.f90 | 1+1+1+1+1+1+1 | |
| mixed-generic.f90 | 4+3 | |
| modify-do.f90 | 3+3+1 | |
| mod-name-conflict.f90 | 2+1+4 | |
| modulo-huge-tiny.f90 | 3+2+1+1 | |
| multi-generic.f90 | 4+2+1 | |
| namelist-host-assoc.f90 | 3+2+2 | |
| namelist-skip.f90 | 6+1 | |
| namelist-tricky.f90 | 4+2+1 | |
| nan-arith-if.f90 | 3+4+1 | |
| negation-in-exponent.f90 | 4+2+1 | |
| nl-rename.f90 | 4+3 | |
| no-iface-procedure.f90 | 4+3 | |
| non-specific.f90 | 3+4 | |
| null-alloc-actual.f90 | 3+2+2 | |
| null-allocatable.f90 | 3+2+1 | |
| null-opd.f90 | 3+1+1+1+1 | 1 compiler crash |
| optional-max.f90 | 1+1+2+1+1 | |
| opt-ptr.f90 | 2+5 | |
| override.f90 | 3+3+1 | 1 compiler crash, 3 clearly wrong |
| pad-no-short-record.f90 | 2+1+1+1+1+1 | 1 runtime crash |
| parent-comp-name.f90 | 6+2 | |
| poly-ac.f90 | 5+1+1+1 | |
| poly-defined-assign.f90 | 2+2+1+1+1 | |
| polymorphic-actual.f90 | 2+3+2 | |
| poly-transfer.f90 | 3+4 | |
| poly-value.f90 | 3+4 | |
| print-namelist.f90 | 7+1 | |
| private-kind.f90 | 4+2+1 | 1 compiler crash |
| protected-ptr-lhs.f90 | 5+2 | |
| ptr-comp-init.f90 | 3+1+2+1 | 1 compiler crash |
| read-overflow.f90 | 4+3 | |
| ref-in-decl.f90 | 2+2+3 | |
| rounding-final.f90 | 1+2+1+2 | |
| signed-zero-max-min.f90 | 2+1+2+1+1 | |
| slice-init.f90 | 2+1+1+2+1| |
| source-mold-lbound.f90 | 4+2+1 | |
| spacing.f90 | 5+1+1 | |
| specifics.f90 | 4+2+1 | |
| stmt-func-confusion.f90 | 2+1+1+3 | |
| tiny-spacing.f90 | 2+1+4 | |
| transfer-boz.f90 | 2+3+1+1 | |
| tricky-finals.f90 | 1+1+3+1+1 | |
| type.f90 | 5+2 | |
| vect-subs-data.f90 | 4+1+1+1 | 1 compiler crash |
| weird-common.f90 | 4+2+1 | |
| where-realloc.f90 | 3+3+1 | 3 runtime crashes |

## Writing Portable Fortran

As one can observe from how various Fortran compilers handle these
examples, Fortran is not a perfectly portable programming language.
One can write code that perfectly conforms with the standard yet
doesn't work correctly with any compiler; and one can write code
that behaves identically with every compiler and is yet utterly
non-conforming.
It's kind of a mess, really, and someday I will write up why
I think things are the way that they are.

For now, here are some tips to help you write code that should
be easier to port between implementations of the language.

### Use `IMPLICIT NONE`

Implicit typing may not be a good idea in the first place, but
it's even more fraught now that the language has nested scopes and
forward references to derived types.
Using `IMPLICIT NONE` avoids many of the portability pitfalls.

### Avoid dark corners of the language

Even where the standard is fairly clear and free of contradiction,
compiler developers don't always implement it correctly.

* Avoid defining generics in extended derived types with specific
  procedures that aren't distinguishable from specific procedures
  in a base type's corresponding generic.

* Don't use the same name for a generic interface and a subprogram,
  especially when the subprogram is not a specific procedure of the
  generic interface.

* Child I/O is non-advancing by definition, but most compilers get
  this wrong.
  If you expect child I/O to read or write multiple records, use explicit
  formats with `/` record advancement in a format.

* Avoid commas in numeric input with explicit formats.

* Avoid defining procedures, dummy procedures, or procedure pointers using
  the names of elemental intrinsics as interfaces (`procedure(acos) p`)

* Don't assume that an allocatable function result is an allocatable
  after the function returns -- it's not, but some compilers allow
  you to associate it with an allocatable dummy argument.
  Others treat the value of a function returning an array as having
  non-default bounds, if it was allocatable and allocated with
  non-default lower bounds.

* If you reference an intrinsic function in a declaration in a module
  that doesn't have default `PRIVATE` accessibility, e.g. `x = cos(0.)`,
  and the intrinsic function's name doesn't appear on an explicit
  `INTRINSIC` statement, some compilers will export the intrinsic's
  name and others will not.

* The `ASYNCHRONOUS` attribute can be implied for an object in
  a scope simply by using that object in a data transfer statement
  with `ASYNCHRONOUS='YES'`.  Many compilers get this wrong,
  so use explicit `ASYNCHRONOUS` attribute statements.

* When the procedure name in a `PROCEDURE` declaration statement
  is the name of the enclosing procedure, or the name of another
  procedure whose characteristics depend indirectly on the enclosing
  procedure, prepare to observe your compiler crash or emit
  a bizarre error message.

* Most compilers allow one to intermix functions and subroutines as
  specific procedures in a generic interface; it's unambiguous,
  and sometimes accidental when generic interfaces are merged
  via `USE` association.
  But it's not conformant, and some compilers reject this usage.

* Don't use a module's name for anything else in the module.

* If the left-hand side and right-hand side of an assignment statement
  have distinct derived types, and they both define a generic
  `ASSIGNMENT(=)` that matches these two types, hope that your
  compiler emits an error even though this usage apparently conforms.
  (This is especially non-portable when the left-hand side is an
  unlimited polymorphic object.)

* `PROCEDURE()` with no type or interface name is supposed to
  work as a dummy procedure or procedure pointer that can handle
  either a function or a subroutine, so long as it isn't referenced.
  Many compilers assume that it means a subroutine, or just can't
  deal with it, so the older `EXTERNAL` attribute is more portable.

* What's the dynamic type of an array constructor containing
  polymorphic entities but no explicit type?  It depends on
  your compiler.

### Take care with newer features

* Some compilers treat `ASSOCIATE` names like dummy arguments and
  assume that they don't alias.  They can.
  Use multiple nested `ASSOCIATE` constructs rather than one with
  multiple selectors.
* Don't try to interoperate character data with C code unless
  the length is exactly one.
* The `%RE` and `%IM` syntax references components of complex
  variables.
  Some compilers just treat them as if they were expressions
  equivalent to `REAL()` and `AIMAG()` intrinsic function
  references.
  The distinction matters when `%RE` and `%IM` references are
  associated with `REAL` dummy arguments.
  Exactly one compiler correctly implements a pointer initialization
  target that applies `%RE` or `%IM` to an array slice.
* Does a `BLOCK` construct provide a nested scope for construct
  names like `foo: do j=1,n`?
  It depends on your compiler, so avoid duplicating names
  outside and inside the `BLOCK`.
* The standard clearly defines a function returning an object
  pointer as being a valid variable, but only a couple compilers
  allow you to use a reference to such a function as the left-hand
  side of an assignment statement.
  Many older compilers treat these as attempted statement function
  definitions.
* The standard clearly defines a `PRIVATE` type-bound procedure
  to have special semantics when overridden by an extended type
  outside the module; in short, those overrides can't affect
  the bindings that are used in the module.
  Only half of the compilers tested get this right, and the
  bug is very hard to figure out with the others, so it's
  best to make the TBP `NON_OVERRIDABLE` in the base type or
  in the module's extensions of a private base type.
* A `PROTECTED` pointer can't appear as the left-hand side of a
  pointer assignment statement outside its module.
  It should work, however, as the left-hand side of a non-pointer
  assignment statement.
  Some very popular compilers emit a bogus error message instead.
* Default initialization of pointer components to actual targets
  other than `NULL()` works with only very few compilers.
* Don't expect F'2003 automatic (re)allocation of allocatables
  to work on the left-hand side of an assignment in the context
  of a `WHERE` statement or construct.

### Take care with older features

* Don't define dummy procedures or procedure pointers as
  assumed-length character functions.
* Don't omit a field width for an `L` edit descriptor in a format.
* Does a `DATA` statement itself constitute a declaration?
  It depends on the compiler, and it matters when the `DATA`
  statement appears in a `BLOCK`.
  Avoid trouble with `IMPLICIT NONE` and an explicit type declaration
  before `DATA`.
* A statement function definition can be ambiguous -- is it a
  statement function definition, an assignment to an array element,
  or an assignment to the result of a function that returns a
  pointer?  It depends on the context, and compilers differ
  quite a bit.
  If you must use statement functions, try to precede their definitions
  with explicit type declarations.
* Avoid using a BOZ literal as the source of `TRANSFER()`.
* A `COMMON` block name is allowed to be the same as other entities
  in the same scope, but doing so can raise a bogus error with
  many compilers.
* Defined assignment is useful, and allocatable data components are
  also useful.  But if you combine them, you can easily write code
  that is nonportable or works in startling ways on some compilers.
  Intrinsic assignment requires deallocation of all allocatable
  subobjects on the left-hand side, whether there's defined assignments
  defined for their containers or not.  When defining derived types
  whose components use defined assignment, it's best to defined
  assignment for their containers as well.

### IEEE arithmetic
* `HUGE()` and `TINY()` are broken with IEEE floating-point, which
  is now universal.  Some language features are defined in terms
  of `HUGE()` and `TINY()` and don't work portably with infinity
  or subnormal values; this includes directed rounding in
  formats (`RP`, `RD`, &c.).
  Many compilers can't even format the value of `HUGE(1.d0)`
  accurately.
* `SPACING()` is not portable when applied to small values like
  `TINY()` or subnormals.
* Avoid using IEEE NaNs and infinities as arguments to
  `MAXVAL`, `MINVAL`, `MAXLOC`, and `MINLOC`.
* Don't use arithmetic `IF` statements with NaNs.
  (Or anything else, really; but expect non-portable behavior in
  old code when they encounter unordered values.)
* Reading an overflow value with formatted input with `ERR=`
  will return an infinity and fail to signal an error with
  many compilers.
* The standard requires that the rounding mode be restored to its
  original value before returning from a function or subroutine
  that modifies the rounding mode.
  Only a few compilers support this behavior, so portable code
  should probably restore the rounding mode "manually".
* Signed zero values aren't portable operands to `MAX` or `MIN`;
  few compilers return the same results.

### Avoid compiler bugs with `NULL()`

* Use `ASSOCIATED(p)` rather than `.NOT. ASSOCIATED(p, NULL())`.
* Use `NULLIFY(p)` rather than `p => NULL()`.
* Avoid `NULL()` in structure constructors for allocatable and
  pointer components; use default component initialization for
  pointers instead.
* Don't depend on `NULL()` having a well defined rank.
* Avoid associating `NULL()` with a dummy procedure pointer.
* Avoid associating `NULL()` with a dummy allocatable
* Avoid using `NULL()` as an operand to a defined operator
  with pointer dummy arguments, it's rarely supported.

### Generic interfaces

The language requires that every *possible* reference to a generic
interface be resolvable to exactly one of its specific procedures
at compilation time, while also admitting that the analysis necessary
for proving distinguishability isn't always possible.
Some compilers don't enforce this rule, and just ensure that every
particular reference to a generic interface does in fact match exactly
one of its specifics.
Other compilers do enforce this requirement, since it allows you to
write a generic in a library module and know that your clients won't
encounter mysterious errors when they call it.
And other compilers seek a middle ground, fully enforcing the rule
in most cases, but allowing exceptions (sometimes with warnings)
for the cases that can't be proven distinguishable at compilation
time, or for generics formed by merging definitions from multiple
modules via `USE` association.

Also, avoid using procedure pointers and dummy procedures
in generic interfaces, especially for defined I/O.
It's well defined, but rarely implemented correctly.

### Forward references in nested subprograms and `BLOCK`

When you use a name in a specification statement and define that
name in a later declaration, you can run into trouble if that
name is also declared in the enclosing module or host procedure.
You can even run into trouble if that name is *not* declared in
the enclosing scope when your compiler has no good interpretation
other than assuming an implicit declaration in the host.
Try to declare each name before using it for anything.

This is especially a problem with the names of derived types.
Don't use forward references to them unless it's unavoidable
due to cycles of dependence due to components that are pointers
and allocatables.

It's also a serious portability problem when a `NAMELIST` makes
a forward reference and the resolution of the name is ambiguous.
Put your namelist declarations last in the specification part,
since that's always possible.

It's nice to implement a linked list with a `next` component that is
an allocatable of the same derived type, but too many compilers
work only if it's a pointer.

Forward references to dummy arguments from a function result type
in the prefix of a `FUNCTION` statement are especially non-portable;
only one compiler gets that case right.
Forward references to defined types from function prefixes are
resolved by multiple compilers to names in the enclosing scope.

### Avoid lower bounds that aren't 1

* If `a` and `b` are allocatable arrays, and `a` is not allocated
  or has a distinct shape from `b`, then `a = b` (re)allocates
  `a` with the same shape and lower bounds as `b`.
  At least it should do so, but many compilers give `a` lower bounds of 1.

### Finalization

The language allows one to define `FINAL` subroutines that are
elemental or that have explicit rank array dummy arguments.
If you define both, some compilers will call one and others will call
the other.

The order in which `FINAL` subroutines are called is pretty well
defined in the standard, but good luck finding a compiler that
gets it right.
More important, don't assume that any two compilers will use
the same order.
`INTENT(OUT)` dummy argument finalization, the finalization of
function results, and the interactions between finalization and
defined assignment are especially non-portable.

### Other portability pitfalls

* Functions returning procedure pointers to subroutines basically
  don't work with most compilers
* Defined I/O interfaces defined outside derived types are often
  incorrectly available in nested scopes that shouldn't import
  them due to `IMPORT, ONLY:`, or in other scopes using `USE` with
  `ONLY:`.
* Delimited list-directed character output that has to be split across
  multiple output records is risky if split takes place between the
  two repeated quotation marks that are necessary to encode an instance
  of a quotation mark in the character value.
* The standard allows the character literal file name on an `INCLUDE`
  line to have a character kind prefix.  Only one compiler supports it.
* Don't `INQUIRE` on a closed unit number or on a directory.
* Don't `INQUIRE(POSITION=)` on a unit after positioning it with
  `REWIND` or `BACKSPACE`; no two compilers agree on all cases.
* Don't overflow a character array with internal output, even with `ERR=`.
* Don't overrun a character array with internal input, either.
* Avoid using component names in expressions in derived type definitions.
* The rules for emitting spaces between list-directed output items are
  clear in the standard, but you'll see extra spaces and line breaks
  from many compilers.
* The canonical bit patterns used to represent `.FALSE.` and `.TRUE.`
  differ wildly between compilers, as do their interpretations of
  non-canonical values.  A zero word is portably false, and 1 is
  portably true, but all bets are off for other values.
* Don't `RETURN` from the main program; go to its `END` statement.
* Don't modify `DO` loop index variables within the loop.
* What's `MODULO(-HUGE(0.),TINY(0.))` and `MODULO(HUGE(0.),-TINY(0.))`?
  Nobody's really sure.
* In namelist input, avoid a line break between the name of a variable
  and the following `=`, so that the variable name isn't misinterpreted
  as a value for a preceding array.
* If a namelist group contains an object that was renamed during `USE`
  association, some compilers will emit the original name and others
  will emit the new one.
* Don't pass an absent `OPTIONAL`, unallocated allocatable, or
  unassociated pointer as the third or later argument to `MAX`
  or `MIN`; the result is too often bogus or a runtime crash.
* Advancing input with `PAD='NO'` is very non-portable when input
  hits the end of a record.
* Don't pass polymorphic objects to procedures with implicit interfaces.
  Some compilers will end up passing the addresses of temporaries,
  and any modifications will be lost.
  Of course, you should avoid implicit interfaces anyway.
* The standard allows an unlimited polymorphic object to be the mold
  argument of a `TRANSFER()` intrinsic function reference, but
  it doesn't seem to work with any compiler.
* A `VALUE` dummy argument may not work if it's polymorphic.
* You may never need to use a vector subscript in a `DATA` statement's
  designator, which can lead to compiler crashes or bogus errors.
