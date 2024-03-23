return {
	s('boilerplate', {
    t({ '#include <iostream>', '' }),
    t({ '', '' }),
    t({ 'using namespace std;', '' }),
    t({ '', '' }),
    t({ 'int main(void) {', '' }),
    t('\t'), i(1), t({ '', '' }),
    t({ '\treturn 0;', '' }),
    t('}'),
  })
}, {}
