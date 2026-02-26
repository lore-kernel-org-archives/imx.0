Received: from mx-relay60-hz1.antispameurope.com (mx-relay60-hz1.antispameurope.com [94.100.133.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B3A38F948
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 08:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.230
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772095988; cv=pass; b=hfZYjhfbIpdHVAyDtqSSvEQiIA7wiEXjUZuRn4ARcSq4yvFCEhYtakelA1PpaK+b7CVC2O+eNBnf5nOLNelNs2BkFlnkG8eHTyCEqNwIyXNUBh/n815WSEvtQRtoIL0OAMhPe9lssZIE9bHn1+oVF6y0qYPG91D//V7exCgqILI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772095988; c=relaxed/simple;
	bh=uimvKOO39GkZdBj9POB5Xa7eFoV+1pJ5ljpxLfXiy5w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f0KCSlFC0jXt2izZeU+SJUV8rPoz4OSAZwAhTJL2+wnfmmcXZKWmEH/7Dhyb55v4QRHY6GovuiVFpQZmTlQUk2noieR20q7LnbYM5TdCmS8PMeFytYvNkt8L9I1YZUy46Gn7LTrDrYsPy++Q0F3IYwVBtkKq8W9GtnkQDk8v8vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=EzHhc7Rh; arc=pass smtp.client-ip=94.100.133.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="EzHhc7Rh"
ARC-Authentication-Results: i=1; mx-gate60-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=pZA7AsIzdwCY7ab6l8jLMqVVu0K3dmUt9FW8oclhVyw=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772095951;
 b=KMSjJ8eSHFFhAI6XV6qJrwjpEKi6M5tK7GrZoLBU1/XYiObk9AIir+pALxmEcQmauzsDOEXQ
 +rFqSAsFVGnwqQJQEAw9I3TLeVONP9gY3xEboIEKsGgVcCyMOLgR9sYK7ehVqnNqqa0EvDCLsdQ
 WDj0rv/NKBU5XqMRmqBr47/D35FNUEnK+2j5XwKcl02b5Ad6wAj4UJNUdW5CkiaN+1MQZt0c6vu
 pm5KlfJz5I1FrvmWEX8P9uYqusklj32wdmMs/A7O3PQieC0+V/CoEdEgvcs2yUgbLhxbe3dnPTr
 PVii/kGhZsSy2ctWYdIBX3wMSNYZsPMXjd7FJRU1ck92Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772095951;
 b=Isyizm/9/5lbJ1HLf7onSbZ2tfbT9SCfF9+wWB7MlYL+3fdXJha7otl3dpNdflY5ZrB5yfGh
 1V36MqYB3iNd/DFH8ezzmITe4byKjexFGtS1uaNJey1FCnm+Gz+ISB1FIBWy8euZd9862MVbDnt
 J300AAfx1czkU2rTxLL/vVDfEAPrQkiSuJ+S6IMr4EoGOC4cS+uhsvtQ6B9OeWNKk3X2vslWFU6
 9JjyZVdIuVyFYXGTWKyY2hL648bv+uewSy/e0jP5Y5per9VMyKL/jH3RK3aYEil2Ufafxzd62r4
 qR2sq5GiEkmOVPE55CRGzjoFRWS/vc5dTDic2j7NiAAcQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay60-hz1.antispameurope.com;
 Thu, 26 Feb 2026 09:52:31 +0100
Received: from [192.168.153.128] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: nora.schiffer@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 419F65A0F0A;
	Thu, 26 Feb 2026 09:52:23 +0100 (CET)
Message-ID: <ccc6e9665ec8d432a5729fb18a757bb76cd95d9e.camel@ew.tq-group.com>
Subject: Re: [PATCH] arm64: dts: freescale: imx8mp-tqma8mpql-mba8mp-ras314:
 fix UART1 RTS/CTS muxing
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,  linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux@ew.tq-group.com,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 26 Feb 2026 09:52:22 +0100
In-Reply-To: <aZ8YFYbRIHlcmWk3@lizhi-Precision-Tower-5810>
References: <20260225083419.5639-1-nora.schiffer@ew.tq-group.com>
	 <aZ8YFYbRIHlcmWk3@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-cloud-security-sender:nora.schiffer@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: nora.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay60-hz1.antispameurope.com with 4fM4w80B2Yz28yMP
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:daeffe5ef58851175bcfb2fcf892fa20
X-cloud-security:scantime:1.389
DKIM-Signature: a=rsa-sha256;
 bh=pZA7AsIzdwCY7ab6l8jLMqVVu0K3dmUt9FW8oclhVyw=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772095950; v=1;
 b=EzHhc7RhArXl9cIPb4yYbpw2HGCyC/vPjRt0bonbDXBK8aCJN/z9TTvsiTNtO7BVVfH0i93U
 qbRYiMBlS6FLpIcJEl8f98Da2gqzvN9YfMbn4N3WBRwx5XUNDz6l9dMPQhnhHawYVjeTXzIHJVR
 rTIFrrYWp/GmbVfzJ/LKL2yjltRWW+Ilxs8LP5ADCMVdQjQ/ro5jm1qbMUUQgKhmbbKod6mkmaa
 3u1TcDHvOI1UmXgBoe5iZF3TUChnHFMADJp1cA5FV0BCnr2IVN5J0KCTkgoc0uvLYVhd27EQLEX
 FKZmLcYBYHINkF26KcYIgJjcJCyGP9C/7mEYW66h8tLnA==

On Wed, 2026-02-25 at 10:41 -0500, Frank Li wrote:
> On Wed, Feb 25, 2026 at 09:34:18AM +0100, Nora Schiffer wrote:
> > The pinmuxing for UART1 was mixing DCE and DTE modes, which cannot work=
.
> > Consistently use DCE mode.
> >=20
> > This switches the RTS and CTS pins, which is fine for this board, as
> > UART1 is routed to a pin header.
>=20
> Is below commit better?
>=20
> UART1 operates in DCE mode, but the RTS/CTS pins were incorrectly
> configured using the DTE pinmux setting.
>=20
> Correct the pinmux to match DCE mode, which does not affect existing
> functionality because UART1 signals are routed to a pin header.

Hi Frank,

your commit message sounds better, do you want me to send a v2?

Best,
Nora



>=20
> Frank
> >=20
> > Fixes: ddabb3ce3f90 ("arm64: dts: freescale: add TQMa8MPQL on MBa8MP-RA=
S314")
> > Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> > ---
> >  .../boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts     | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras3=
14.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
> > index b7f69c92b7748..1665a5030b993 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
> > @@ -848,8 +848,8 @@ pinctrl_tlv320aic3x04: tlv320aic3x04grp {
> >  	pinctrl_uart1: uart1grp {
> >  		fsl,pins =3D <MX8MP_IOMUXC_SAI2_RXFS__UART1_DCE_TX	0x14>,
> >  			   <MX8MP_IOMUXC_SAI2_RXC__UART1_DCE_RX		0x14>,
> > -			   <MX8MP_IOMUXC_SAI2_RXD0__UART1_DTE_CTS	0x14>,
> > -			   <MX8MP_IOMUXC_SAI2_TXFS__UART1_DTE_RTS	0x14>;
> > +			   <MX8MP_IOMUXC_SAI2_RXD0__UART1_DCE_RTS	0x14>,
> > +			   <MX8MP_IOMUXC_SAI2_TXFS__UART1_DCE_CTS	0x14>;
> >  	};
> >=20
> >  	pinctrl_uart1_gpio: uart1gpiogrp {
> > --
> > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, =
Germany
> > Amtsgericht M=C3=BCnchen, HRB 105018
> > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan=
 Schneider
> > https://www.tq-group.com/
> >=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/
