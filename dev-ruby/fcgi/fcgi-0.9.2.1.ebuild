# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_EXTRADOC="README.rdoc README.signals"

inherit multilib ruby-fakegem

DESCRIPTION="FastCGI library for Ruby"
HOMEPAGE="https://rubygems.org/gems/fcgi/"

KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
LICENSE="MIT"

DEPEND+=" dev-libs/fcgi"
RDEPEND+=" dev-libs/fcgi"

IUSE=""
SLOT="0"

each_ruby_configure() {
	${RUBY} -C ext/fcgi extconf.rb
}

each_ruby_compile() {
	emake -C ext/fcgi
	cp ext/fcgi/fcgi$(get_modname) lib
}
