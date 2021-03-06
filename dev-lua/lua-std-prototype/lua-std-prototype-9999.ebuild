# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

VCS="git"
GITHUB_A="lua-stdlib"
GITHUB_PN="${PN#lua-std-}"

inherit lua

DESCRIPTION="Prototype Oriented Programming with Lua"
HOMEPAGE="https://github.com/lua-stdlib/prototype"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="doc"

HTML_DOCS=(doc/.)
DOCS=(README.md NEWS.md)

lua_add_bdepend "doc? ( dev-lua/ldoc )"
lua_add_rdepend "dev-lua/lua-std-normalize"

each_lua_compile() {
	if [[ "${PV}" == "9999" ]]; then
		ver="git:$(git rev-parse --short @):${LUA_IMPL}"
	fi
	lua_default
}

each_lua_install() {
	dolua lib/std
}
