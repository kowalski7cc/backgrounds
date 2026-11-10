pkgname=kowalski7cc-backgrounds
pkgver=6.0.0
pkgrel=1
pkgdesc="This package contains desktop backgrounds for the Kowalski Dragon theme. Pulls in themes for GNOME desktop."
arch=('any')
url="https://github.com/kowalski7cc/backgrounds"
license=('CC-BY-NC-ND-4.0')
makedepends=(librsvg)

build() {
    cd ..
    make
}

package() {
    cd ..
    make install DESTDIR="$pkgdir"
}
