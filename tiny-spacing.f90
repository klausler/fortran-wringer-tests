! SPACING(very small values)
print '(E30.20)', tiny(0.)
print '(E30.20)', spacing(tiny(0.))
print '(E30.20)', spacing(spacing(tiny(0.)))
print '(E30.20)', foo(tiny(0.)) ! prevent folding
print '(E30.20)', foo(foo(tiny(0.))) ! prevent folding
end

real function foo(x)
  foo = spacing(x)
end
