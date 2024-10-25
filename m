Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9231173F
	for <imx@lists.linux.dev>; Fri, 25 Oct 2024 14:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729864846; cv=none; b=F1xOV3x5G+V4VdWqiXWJrBxzkSzlbbLowsmo+GxEzj0HCQd5WUbdVu1ApepVQJb34MjntKGlaGBuH4mr783Lqg8h7S3CMyvywKrXfz4bD4y4C/1fAPSr1wCG9yE5/Ulmj37CRbuqJyHEFeDeV8w+rqfE42GO0bs8y+/y45gVy9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729864846; c=relaxed/simple;
	bh=+EPu0ng0mX46bmmhsOflGiTyDoqp0PK+j6PCVyQQKFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ngRVZaAtyP6i5WXZ6sJtnNwlQ6jZmlC/iWpLuU/sxeRAOP/xftSmwwkJPQTVNq3Rt4J0aNWAnZQOnPLPm0sNlhCTrwjVIlEQb10Rc76msUXiKBhtz5OcPPBMGivLo76kZTurSRGU+pnHqn8ZzF5qsC8PQOtKYr16WnL9K1hXSkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Bwi4vhIQ; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Uui/qTuk reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Bwi4vhIQ";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Uui/qTuk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1729864842; x=1761400842;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D34ZQYAA4Xy1RlM6CHhSVEaUwrAOhpkBAO+draaH9ns=;
  b=Bwi4vhIQdMoBcZFh36J00Y3w8R+cSnw6cwGSnsUyALrKhKZULQygBVm4
   4FqPi/8ihLFNjm6UrDXQrdCUpWD6j3wqtJVlXlz6Jn9F/VVAKutQjZZ6y
   zmQFTbVDK1IN7fUQ9W+v41zXrH8rF9Gtge5Rz+Yqd+YfMeq8GIbhhA1Qp
   Zx1R3SmL4NTfNugEn+lJh4ZP4mKLk82rNaKm1lijH8OFwjvOB5UjnApd7
   c4AE1FfNOnoR03CW7G4JiolZ4+kpq+xk01eUvJSTioCRcjJBPFycHI1Bo
   KTianVNnJUm7U8R5bXbJ4HIn/N0BhpVnEd23d97/G34QNLmHBr12byxSd
   A==;
X-CSE-ConnectionGUID: RJyKPL4TQG2I7atbNc+ajg==
X-CSE-MsgGUID: TkxXlj06TlWhC036/duQ9Q==
X-IronPort-AV: E=Sophos;i="6.11,231,1725314400"; 
   d="scan'208";a="39677654"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Oct 2024 16:00:40 +0200
X-CheckPoint: {671BA488-1-21611FC3-DAD22B0C}
X-MAIL-CPID: 4622FD0EE2930BE343E156A47A186DF3_4
X-Control-Analysis: str=0001.0A682F1A.671BA487.0021,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6297B1644A4;
	Fri, 25 Oct 2024 16:00:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1729864835;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=D34ZQYAA4Xy1RlM6CHhSVEaUwrAOhpkBAO+draaH9ns=;
	b=Uui/qTukAHJ7VFZhUcAlQ+OVdccdApCQQcklWBFNMNz1WGm7oXncKjOxbu7Baidju+3IqA
	53U8ocywj33gbEYU3/JQsNkduuC5UBPIM0ZrkXDFsb7r/rKT32rpt+iBkk0HEBwJG3fXMv
	MK6xfnWgo6wUGHhRTKkG21FIvzsH76vQfdp0ckeQyxQSU9EPGAlWtChUw7tsp738Mxm6pX
	+98C+aJJ67rL6U2G7Nsf1nEPL8CFYWx1XRf5YmZ+JiA4DuM6ld3uhoWcv51PN/fh8D+nAM
	fNdDhwwJBFAwZzhvGiIYYof375B5oisxCpL4y/fQ8oK3drHPa7cV+de9//SVlQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, "open list:TQ SYSTEMS BOARD & DRIVER SUPPORT" <linux@ew.tq-group.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mn-tqma8mqnl-mba8mx-usbot: fix coexistence of output-low and output-high in GPIO
Date: Fri, 25 Oct 2024 16:00:33 +0200
Message-ID: <2005735.usQuhbGJ8B@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAMuHMdW-tXFYSfTerb-eYmmbJHYN9xNyiGMPoeGArmDnAajUmg@mail.gmail.com>
References: <20241023210313.1390767-1-Frank.Li@nxp.com> <CAMuHMdW-tXFYSfTerb-eYmmbJHYN9xNyiGMPoeGArmDnAajUmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Last-TLS-Session-Version: TLSv1.3

Hi Geert,

Am Freitag, 25. Oktober 2024, 15:52:58 CEST schrieb Geert Uytterhoeven:
> Hi Frank,
>=20
> On Wed, Oct 23, 2024 at 11:07=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrot=
e:
> > Fix the issue where both 'output-low' and 'output-high' exist under GPIO
> > hog nodes  (rst_usb_hub_hog and sel_usb_hub_hog) when applying device
> > tree overlays. Since /delete-property/ is not supported in the overlays,
> > setting 'output-low' results in both properties being present. The
> > workaround is to disable these hogs and create new ones with 'output-lo=
w'
> > as needed.
> >
> > Fix below CHECK_DTBS warning:
> > arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: sel-u=
sb-hub-hog:
> >    {'output-low': True, 'gpio-hog': True, 'gpios': [[1, 0]], 'output-hi=
gh': True, 'phandle': 108, '$nodename': ['sel-usb-hub-hog']}
> >        is valid under each of {'required': ['output-low']}, {'required'=
: ['output-high']
> >
> > Fixes: 3f6fc30abebc ("arm64: dts: imx8mn: tqma8mqnl-mba8mx: Add USB DR =
overlay")
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Alex:
> >         I have not hardware to run it. I check dtb output is correct.
> > ---
> >  .../imx8mn-tqma8mqnl-mba8mx-usbotg.dtso       | 29 +++++++++++++++++--
> >  1 file changed, 27 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbo=
tg.dtso b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtso
> > index 96db07fc9bece..1f2a0fe70a0a2 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtso
> > +++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtso
> > @@ -29,12 +29,37 @@ usb_dr_connector: endpoint {
> >         };
> >  };
> >
> > +/*
> > + * rst_usb_hub_hog and sel_usb_hub_hog have property 'output-high',
> > + * dt overlay don't support /delete-property/. Both 'output-low' and
> > + * 'output-high' will be exist under hog nodes if overlay file set
> > + * 'output-low'. Workaround is disable these hog and create new hog wi=
th
> > + * 'output-low'.
> > + */
> > +
> >  &rst_usb_hub_hog {
> > -       output-low;
> > +       status =3D "disabled";
> > +};
> > +
> > +&expander0 {
> > +       rst-usb-low-hub-hog {
> > +               gpio-hog;
> > +               gpios =3D <13 0>;
> > +               output-low;
> > +               line-name =3D "RST_USB_HUB#";
> > +       };
> >  };
> >
> >  &sel_usb_hub_hog {
> > -       output-low;
> > +       status =3D "disabled";
> > +};
> > +
> > +&gpio2 {
> > +       sel-usb-low-hub-hog {
> > +               gpio-hog;
> > +               gpios =3D <1 GPIO_ACTIVE_HIGH>;
> > +               output-low;
> > +       };
> >  };
> >
> >  &usbotg1 {
>=20
> Note that after this, there is still
>=20
>     /delete-property/ disable-over-current;
>=20
> left, which does not actually remove the property.

This is true, I noticed myself. As this patch does not concern about
disable-over-current, it still is an improvement.

Unfortunately there is currently no way to fix this right now. This is a
boolean property, which is impossible to remove in overlays.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


