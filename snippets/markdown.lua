return {
  s({ trig = 'link', name = 'Insert link' }, {
    t '[',
    i(1, 'title'),
    t '](',
    i(2, 'link'),
    t ')',
  }),
  s({ trig = 'caption', name = 'Insert captions' }, {
    t '<sub>',
    i(1, 'caption'),
    t '</sub>',
  }),
  s({ trig = 'checkbox', name = 'Insert checkbox' }, {
    t '- [ ] ',
  }),
}
