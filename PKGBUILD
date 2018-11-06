# Maintainer: Josef Erben <firstname at lastname dot io>

pkgname=memb
pkgver=0.0.1
pkgrel=1
pkgdesc="A tool to manage a local knowledge base"
url="https://github.com/jerben/memb"
arch=('any')
license=('MIT')
depends=('grep')
source=("https://github.com/jerben/memb/archive/$pkgver.tar.gz")
sha256sums=('a9fc26bb8a6bbcced1fdfea45ddf2babfc93dd9965e9ceaafd2e1e850d00d8aa')

check() {
  cd "${pkgname}-${pkgver}"
  ./memb_test
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm0755 memb "${pkgdir}/usr/bin/memb"
}

# vim:set ts=2 sw=2 et:
