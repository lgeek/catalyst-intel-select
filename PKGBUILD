# Maintainer: <cosmin at linux-geek d0t org>

pkgname=catalyst-intel-select
pkgver=1
pkgrel=1
pkgdesc="Systemd service which automatically switches between Intel and AMD graphics drivers"
url="http://github.com/lgeek/catalyst-intel-select"
arch=('x86_64' 'i686')
license=('BSD')
depends=('catalyst-test-compat' 'xf86-video-intel' 'systemd')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install='catalyst-intel-select.install'
source=("catalyst-intel-select.service"
        "catalyst-intel-select.sh")
md5sums=('97fd3a02a8efffcce074614bddf738d3'
         'c9e4201167c543c1dd44a7b78e8c08ca')

package() {
  install -d "$pkgdir/usr/lib/systemd/system/"
  install -m 644 catalyst-intel-select.service "$pkgdir/usr/lib/systemd/system/"
  install -d "$pkgdir/usr/bin/"
  install -m 755 catalyst-intel-select.sh "$pkgdir/usr/bin/"
}
