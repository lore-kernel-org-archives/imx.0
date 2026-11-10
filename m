Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=161.97.139.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303298;
	b=OvTujFp+9J9/TBGGx9cy2zbw1cB7Upj96kNIyJPWe8jP0VVH2kH39h7YI9zUSABX2bWE
	 0sLeQB7eYCG/FL07CjIiJ0nVJB4Fy9uO1WqBoyUANXjr/z2KEa9fj+fJ8eANgBBAORFp2
	 o2PPIA0nC5PKmkVVvW8cT7uvuatu3xFvJOwgdYhijoBpGl1uu91UTdXXnVG3nQOTlQzAh
	 ia+TjonBd5KRzEtdjb9nGJTdJZ398eeqGTmknsNAgO8I4vr2gqPyTMcx6BgQzPMkEqrZv
	 jkd37tjLfhDxRmNtDpgKtnA9sf9Q6Kpr/piNuP+Nn5F8/hCzSMMtrNScoJZMl5i7Oww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303298;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=5/I/TK2BRl2LnMysxk0s70GG7ZihlSvhoUVTH7m/jhE=;
	b=UckJo8teqkjQ0zWpB6D2ZGd1466AKzrc5NXsNDy1YyITHaZVHKU6Xld2hpuxqL+lsePD
	 4vYVqTGR8m4UqGqUfSn4KJnFAhvox+2pC3GVsCYA/fVuIWYNePxwEE3jYGl1+ZzRPXtm3
	 8OFS4GKQKxb6UTMhlUl6WeVDKz9ghr3vCFItwxMER0StS3ekTWwi5IEk/c9fXeBCK1I1u
	 ddngL2Ja3PVZN/lGh4sHGfClFkKoh2rAVN/an4VRoOodC9zHXkXMk9v7aD5vDYHnv9Wr0
	 5xpavxM3klD0uoHVK2MwjLih06r32mEpkn0Jf2Qz2fsZHF+4DEpl39pn2Jikynerh3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=jAsrU0jx;
	arc=none smtp.remote-ip=161.97.139.27
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51EA606C66C
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 09:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C51EA606C66C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=jAsrU0jx
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1xQiFe-00000002sKi-0nVm
	for imx@lists.linux.dev;
	Tue, 10 Nov 2026 10:34:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=5/I/TK2BRl2LnMysxk0s70GG7ZihlSvhoUVTH7m/jhE=; t=1794303290; x=1795512890; 
	b=jAsrU0jxdT4bhi/7kOnKpXwLM2lKEBnWxAgbxAMqAtOai2IzRK+iFuKWUSqXJ8tp9Ddl2joSYt0
	gz0xJdCt+YP7zAGoWTs12zApfKVGLGA9UPX/KiJSc8890Px/DAXYfhCx2d5EN3AIT++/s0WIu2BRz
	awH74//H7JMUWGsL8P3Eht6ijOJXzeWpEho8sN5K0sCemmKXGNprrCTKfrHKnlsFDeP3/KZ9FWchs
	et/IGUjG/8apqXfHT0DROwxc/3y7oqtPQAFGtR/5PeMWY/wxpioZhDpv1v/ssDWvT90QO5lZ7CMg4
	XlF+NYRs+AD5FXGOha9XdV5sKc31R+4VNIyg==;
Date: Tue, 10 Nov 2026 10:34:05 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Alistair <alistair@alistair23.me>
Cc: Pablo Mazzini <pmazzini@gmail.com>, Frank Li <Frank.Li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] ARM: dts: imx: keep the SY7636A VCOM on
Message-ID: <20261110103405.5e0384bb@kemnade.info>
In-Reply-To: <54130686e08db48928484e226f48dc31a8c5ee29.camel@alistair23.me>
References: <20261026003918.155321-1-pmazzini@gmail.com>
	<20261026003918.155321-2-pmazzini@gmail.com>
	<20261026083058.04173f10@kemnade.info>
	<54130686e08db48928484e226f48dc31a8c5ee29.camel@alistair23.me>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Nov 2026 15:23:03 +1000
Alistair <alistair@alistair23.me> wrote:

> On Mon, 2026-10-26 at 08:30 +0100, Andreas Kemnade wrote:
> > On Mon, 26 Oct 2026 00:39:12 +0000
> > Pablo Mazzini <pmazzini@gmail.com> wrote:
> >  =20
> > > The SY7636A hwmon driver turns VCOM on at probe. The reMarkable 2,
> > > Kobo
> > > Libra H2O and Tolino Vision 5 have had the rails on so far. Mark
> > > VCOM
> > > always-on before the driver stops doing it.
> > >=20
> > > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > > ---
> > > =C2=A0arch/arm/boot/dts/nxp/imx/e70k02.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> > > =C2=A0arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts | 1 +
> > > =C2=A02 files changed, 2 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > > b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > > index dc7ff108aa85..bd9c6c6fa117 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > > @@ -154,6 +154,7 @@ sy7636: pmic@62 {
> > > =C2=A0		regulators {
> > > =C2=A0			reg_epdpmic: vcom {
> > > =C2=A0				regulator-name =3D "vcom";
> > > +				regulator-always-on;
> > > =C2=A0			};
> > > =C2=A0		};
> > > =C2=A0	}; =20
> > No, please not. That regulator is in practice used with a not yet
> > upstreamed
> > driver for the EPDC on that platform used to deal with the current
> > kernels
> > fp9931 / tps65185 drivers. So it is very welcome to have it not
> > always turned
> > on.
> >=20
> >  =20
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > > b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > > index ff9d50942884..6cf5603c0752 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > > @@ -327,6 +327,7 @@ sy7636a: pmic@62 {
> > > =C2=A0		regulators {
> > > =C2=A0			reg_epdpmic: vcom {
> > > =C2=A0				regulator-name =3D "vcom";
> > > +				regulator-always-on;
> > > =C2=A0				regulator-boot-on;
> > > =C2=A0			};
> > > =C2=A0		}; =20
> >=20
> >=20
> > Here the situation is a bit different. If I remember correctly, there
> > is some special EPD logic in userspace on top of some ordinary kernel
> > display driver. But thesse things are missing is devicetree?! But =20
>=20
> Yeah, the kernel just exposes a framebuffer and a special secret sauce
> userspace program writes to that.

Looking at that processor. It seems to have an EPDC like the i.MX6 has.
Looking even further. The Kobo factory kernel for i.MX6SLL devices specifies
fsl,imx7d-epdc as compatible for that.
So if your display is just connected to that EPDC, then you could probably
wire up things on top of my EPDC driver with DRM interface.

So you still too need to run your own fork for the display?=20

>=20
> > that might need to learn to deal with regulator enabling/disabling.
> >=20
> > Regulator always on is probably not desired here, either. =20
>=20
> Yeah, I **think** we don't need that
>=20
You just need to add logic to enable/disable the regulator (if it is not
wired up yet). But it is nothing from the perspective of mainline to worry
about.

Regards,
Andreas
