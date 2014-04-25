pkgname=gxxxx
pkgver=1.0.0
pkgrel=1
pkgdesc="GNU gxxxx"
arch=('i686' 'x86_64')
url="http://gnu.org/software/${pkgname}"
license=('GPL')
source=(http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.bz2{,.sig}
        ${pkgname}-musl.patch)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 -i "${srcdir}/${pkgname}-musl.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --build=$CHOST --prefix= \
    --disable-shared --disable-nls
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make check
}
  
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
