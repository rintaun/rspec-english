# rspec-english
Better English for RSpec descriptions

## Description
rspec-english aims to modify how RSpec builds descriptions of specs/tests in
order to make them read like more natural English.

Specifically, `context` example groupings are modified to be placed _after_
the test description in the full description output, such that the following
code would read "RSpec outputs real English when rspec-english is available":

```ruby
describe RSpec do
    context 'when rspec-english is available' do
        it 'outputs real English' do
            RSpec.english.should be_true
            end
        end
    end
end
```

## Motivation
RSpec `context` groups are usually adverbial clauses, e.g. 'with ...' or 'when
...'. Following RSpec's standard description generation, these are placed
directly after the subject of the sentence (i.e. the description of the
preceeding `describe` groups). However, in standard English, these clauses are
nearly always placed either at the *beginning* of the sentence, if emphasis is
desired, or, more commonly, at the *end* of the sentence.

## Known Defects
1. Currently `describe` blocks nested within a `context` are still placed
   before the test description. I have not yet decided if this is desirable or
   not.
2. It is possible for some nested contexts to come out still reading as
   less-than-standard English. They are normally ordered as _manner_, _place_,
   and then _time_, but the string will be generated in order of nesting, not
   in their natural English order.

## Future
I would like to rewrite this so that it takes into account a rudimentary model
of a normal English sentence, in order to fix defect 2, above. Other
suggestions are, of course, welcome.
