# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_PN="github.com/${PN}/${PN}"

EGO_VENDOR=(
	"github.com/AudriusButkevicius/go-nat-pmp 452c97607362b2ab5a7839b8d1704f0396b640ca"
	"github.com/AudriusButkevicius/pfilter c55ef6137fc6f075801eac099cc2687ede0f101d"
	"github.com/AudriusButkevicius/recli v0.0.5"
	"github.com/bkaradzic/go-lz4 7224d8d8f27ef618c0a95f1ae69dbb0488abc33a"
	"github.com/calmh/du v1.0.1"
	"github.com/calmh/xdr v1.1.0"
	"github.com/ccding/go-stun be486d185f3dfcb2dbf8429332da50a0da7f95a6"
	"github.com/certifi/gocertifi d2eda712971317d7dd278bc2a52acda7e945f97e"
	"github.com/chmduquesne/rollinghash a60f8e7142b536ea61bb5d84014171189eeaaa81"
	"github.com/d4l3k/messagediff v1.2.1"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/flynn-archive/go-shlex 3f9db97f856818214da2e1057f8ad84803971cff"
	"github.com/getsentry/raven-go v0.2.0"
	"github.com/gobwas/glob 51eb1ee00b6d931c66d229ceeb7c31b985563420"
	"github.com/gogo/protobuf v1.2.1"
	"github.com/golang/groupcache 84a468cf14b4376def5d68c722b139b881c450a4"
	"github.com/golang/snappy 553a641470496b2327abcac10b36396bd98e45c9"
	"github.com/jackpal/gateway 5795ac81146e01d3fab7bcf21c043c3d6a32b006"
	"github.com/kballard/go-shellquote cd60e84ee657ff3dc51de0b4f55dd299a3e136f2"
	"github.com/kr/pretty v0.1.0"
	"github.com/lib/pq v1.1.1"
	"github.com/mattn/go-isatty v0.0.7"
	"github.com/minio/sha256-simd cc1980cb03383b1d46f518232672584432d7532d"
	"github.com/onsi/ginkgo v1.8.0"
	"github.com/onsi/gomega v1.5.0"
	"github.com/oschwald/geoip2-golang v1.3.0"
	"github.com/oschwald/maxminddb-golang 26fe5ace1c706491c2936119e1dc69c1a9c04d7f"
	"github.com/petermattis/goid 3db12ebb2a599ba4a96bea1c17b61c2f78a40e02"
	"github.com/pkg/errors v0.8.1"
# dropped	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/prometheus/client_golang v0.9.4"
	"github.com/rcrowley/go-metrics e181e095bae94582363434144c61a9653aff6e50"
	"github.com/sasha-s/go-deadlock v0.2.0"
# dropped	"github.com/stretchr/testify v1.2.2"
	"github.com/syncthing/notify 4e389ea6c0d84e6195eb585ffaf62c8c143306ae"
	"github.com/syndtr/goleveldb c3a204f8e96543bb0cc090385c001078f184fc46"
	"github.com/thejerf/suture v3.0.2"
	"github.com/urfave/cli v1.20.0"
	"github.com/vitrun/qart bf64b92db6b05651d6c25a3dabf2d543b360c0aa"
	"github.com/lucas-clemente/quic-go v0.11.2"
	"github.com/cheekybits/genny v1.0.0"
	"github.com/marten-seemann/qtls v0.2.3"
	"github.com/maruel/panicparse v1.2.1"
	"golang.org/x/crypto 5c40567a22f818bd14a1ea7245dad9f8ef0691aa github.com/golang/crypto"
	"golang.org/x/net 351d144fa1fc0bd934e2408202be0c29f25e35a0 github.com/golang/net"
	"golang.org/x/sys 5ed2794edfdc1c54dfb61d619c5944285f35d444 github.com/golang/sys"
	"golang.org/x/text v0.3.2 github.com/golang/text"
	"golang.org/x/time 6dc17368e09b0e8634d71cac8168d853e869a0c7 github.com/golang/time"
	"gopkg.in/asn1-ber.v1 379148ca0225df7a432012b8df0355c2a2063ac0 github.com/go-asn1-ber/asn1-ber"
	"gopkg.in/check.v1 788fd78401277ebd861206a03c884797c6ec5541 github.com/go-check/check"
	"gopkg.in/ldap.v2 v2.5.1 github.com/go-ldap/ldap"
	"gopkg.in/yaml.v2 v2.2.2 github.com/go-yaml/yaml"
	# These are only used by the test suite but conditional vendoring is messy
	"github.com/beorn7/perks 3a771d992973f24aa725d07868b467d1ddfceafb"
	"github.com/golang/protobuf v1.3.1"
	"github.com/matttproud/golang_protobuf_extensions v1.0.1"
	"github.com/prometheus/client_model fd36f4220a901265f90734c3183c5f0c91daa0b8"
	"github.com/prometheus/common v0.4.1"
	"github.com/prometheus/procfs 8f55e607908ea781ad9d08521730d73e047d9ac4"
)
	#"github.com/prometheus/procfs v0.0.2"

inherit golang-vcs-snapshot systemd user xdg-utils

DESCRIPTION="Open Source Continuous File Synchronization"
HOMEPAGE="https://syncthing.net"
MY_PV=${PV//rc/rc.}
SRC_URI="https://${EGO_PN}/archive/v${MY_PV//_/-}.tar.gz -> ${P}.tar.gz
	${EGO_VENDOR_URI}"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="cli selinux tools"

BDEPEND=">=dev-lang/go-1.12"
RDEPEND="selinux? ( sec-policy/selinux-syncthing )"

REQUIRED_USE="cli? ( tools )"

DOCS=( README.md AUTHORS CONTRIBUTING.md )

pkg_setup() {
	enewgroup ${PN}
	enewuser ${PN} -1 -1 /var/lib/${PN} ${PN}

	if use tools ; then
		# separate user for the relay server
		enewgroup strelaysrv
		enewuser strelaysrv -1 -1 /var/lib/strelaysrv strelaysrv
		# and his home folder
		keepdir /var/lib/strelaysrv
		fowners strelaysrv:strelaysrv /var/lib/strelaysrv
	fi
}

src_prepare() {
	# Bug #679280
	xdg_environment_reset

	default
	sed -i \
		's|^ExecStart=.*|ExecStart=/usr/libexec/syncthing/strelaysrv|' \
		src/${EGO_PN}/cmd/strelaysrv/etc/linux-systemd/strelaysrv.service \
		|| die
}

src_compile() {
	export GOPATH="${S}:$(get_golibdir_gopath)"
	cd src/${EGO_PN} || die
	go run build.go -version "v${MY_PV//_/-}" -no-upgrade install $(usex tools "all" "") || die "build failed"
}

src_test() {
	cd src/${EGO_PN} || die
	go run build.go test || die "test failed"
}

src_install() {
	pushd src/${EGO_PN} >& /dev/null || die
	doman man/*.[157]
	einstalldocs

	dobin bin/syncthing
	use cli && dobin bin/stcli
	if use tools ; then
		exeinto /usr/libexec/syncthing
		local exe
		for exe in bin/* ; do
			[[ "${exe}" == "bin/syncthing" ]] && continue
			use cli && [[ "${exe}" == "bin/stcli" ]] && continue
			doexe "${exe}"
		done
	fi
	popd >& /dev/null || die

	# openrc and systemd service files
	systemd_dounit src/${EGO_PN}/etc/linux-systemd/system/${PN}{@,-resume}.service
	systemd_douserunit src/${EGO_PN}/etc/linux-systemd/user/${PN}.service
	newconfd "${FILESDIR}/${PN}.confd" ${PN}
	newinitd "${FILESDIR}/${PN}.initd" ${PN}

	keepdir /var/{lib,log}/${PN}
	fowners ${PN}:${PN} /var/{lib,log}/${PN}
	insinto /etc/logrotate.d
	newins "${FILESDIR}/${PN}.logrotate" ${PN}

	if use tools ; then
		# openrc and systemd service files
		systemd_dounit src/${EGO_PN}/cmd/strelaysrv/etc/linux-systemd/strelaysrv.service
		newconfd "${FILESDIR}/strelaysrv.confd" strelaysrv
		newinitd "${FILESDIR}/strelaysrv.initd" strelaysrv

		insinto /etc/logrotate.d
		newins "${FILESDIR}/strelaysrv.logrotate" strelaysrv
	fi
}
pkg_postinst() {
	# check if user syncthing-relaysrv exists
	# if yes, warn that it has been moved to strelaysrv
	if [[ -n "$(egetent passwd syncthing-relaysrv 2>/dev/null)" ]]; then
		ewarn
		ewarn "The user and group for the relay server have been changed"
		ewarn "from syncthing-relaysrv to strelaysrv"
		ewarn "The old user and group are not deleted automatically. Delete them by running:"
		ewarn " userdel -r syncthing-relaysrv"
		ewarn " groupdel syncthing-relaysrv"
	fi

	elog "If you want to run Syncthing for more than one user, you can:"
	elog
	elog "In case you're using OpenRC:"
	elog "Create a symlink to the syncthing init script called"
	elog "syncthing.<username> - like so:"
	elog "\t# ln -s syncthing /etc/init.d/syncthing.johndoe"
	elog "and start/rc-update it instead of 'standard' one"
	elog
	elog "In case you're using SystemD:"
	elog "Just start (and 'enable', for autostarting) service like:"
	elog "\troot@localhost # systemctl start ${PN}@johndoe"
	elog "for 'system' users (like portage), or remote servers. Alternatively"
	elog "\tjohn@localhost \$ systemctl --user start ${PN}"
	elog "for local users with sessions covered by logind"
}
