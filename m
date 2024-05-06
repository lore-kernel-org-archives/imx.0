Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6222A3D967
	for <imx@lists.linux.dev>; Mon,  6 May 2024 06:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714976404; cv=none; b=XUTC7IRv/knmUO8D+S7AZlX7urhQLyomLOlM/yIhgWiLXPp5BEo5TjHMj0BA6umG5ZBOc3iVKFKqLuPfOwnjg9X2oliODJep17/eYy2TmtO9BEc9B5rII2USUqDFocvQOkRcijI6y/M0N3vMuHzNuezIhWwA0zZtMES+ePDo1II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714976404; c=relaxed/simple;
	bh=I/wYklHMETTJKHKgZfkpBUzfaIGJUfOcJA7j1rii/1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dKBHx0/OGq2fAml4gRusuJYj90DVUkE8928xGt9B17lS6TSfQDDhTRtxbix5olvh9uVaBln3+42mqd3vREXCejqcW3KLLGEDcLWpFFDUzbWTJ7m8DdCX4aVnGXvi6eOHlBRg8DNuYe35YvFggI55DWxtekjE70mhmu4w9rgtMVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=n4oPdWiD; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Y4yZYrGR reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="n4oPdWiD";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Y4yZYrGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1714976400; x=1746512400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2KOgeH5FtSg96AKSLg0bxhcztOJxyjb2Q/p7HPjcZGc=;
  b=n4oPdWiDvTF+OsyBnIeB+4Kbt8p8dePd/xemYXpJUFWFa69NeN1Sh6GC
   B9t4QUJLjJ9wxRlzvpaykc9ZRUmq1SeofBEwiWgjv5TqHyNuyOAOEkeMn
   4lKBVl0liiO5J5M7z9nrcX6GUg8RQYPMJE/t3hGsYO+yOfo1DCdBj/39c
   dqjYwLmKiK2KovkP3NzGyYJIxt8PoD/5/fWJ2C9XkQtkLxnrZNECdo51P
   rWhMKz9uJpssjCsR4QZvhfx4EaXmfAHowaKncuTnqO3/qlTrW0JRfC/3/
   Ewm/FB5WZhlmEbu6xJrusCLOtQp1dp59APzewA5bwon6u3OgP0beO3fIL
   g==;
X-CSE-ConnectionGUID: BB0jHhSwRgCSyHDG/5irEA==
X-CSE-MsgGUID: oQ9oM6zfT2u9m2bUD3KvsQ==
X-IronPort-AV: E=Sophos;i="6.07,257,1708383600"; 
   d="scan'208";a="36751950"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 06 May 2024 08:19:57 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 251651700C1;
	Mon,  6 May 2024 08:19:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1714976393;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2KOgeH5FtSg96AKSLg0bxhcztOJxyjb2Q/p7HPjcZGc=;
	b=Y4yZYrGR7Ldui6BZLOhiY3mvMYE8Mm24INnUdDW6l/9e8Q6RlUgXpky8mIok5F+BUmqhsK
	USI5Z6XlxvmDNXkYDYOHRkpsr7An23Hlb8s3Robrkr/BTaeTvA36mJDvQ3sYiB2XImlhjb
	WGmgVXciYXsHQopREcC0VeDvWxA0jfDb45POgcPWL4fiOHrUFrEhxEtTrPAH8pC98egL6K
	5K/Yoaj2XLjeyjTWfK/FQNxbakvaB3e8nmzdffRhSS+TbdWGrpGks7JvKHn4PhyKjTNEl4
	AshfFmN3zZuZ7EKiASvwjqFyoa49tz7+Ej6VHcJdqRAkexXEb2cGB9p2b3bedw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Elder <paul.elder@ideasonboard.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Align both CSI2 pixel clock
Date: Mon, 06 May 2024 08:19:57 +0200
Message-ID: <5784573.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240503134557.GC13904@pendragon.ideasonboard.com>
References: <20240416141914.9375-1-marex@denx.de> <3311352.aeNJFYEL58@steina-w> <20240503134557.GC13904@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Freitag, 3. Mai 2024, 15:45:57 CEST schrieb Laurent Pinchart:
> On Fri, May 03, 2024 at 02:58:19PM +0200, Alexander Stein wrote:
> > Am Mittwoch, 17. April 2024, 11:12:04 CEST schrieb Alexander Stein:
> > > Am Dienstag, 16. April 2024, 16:19:10 CEST schrieb Marek Vasut:
> > > > Configure both CSI2 assigned-clock-rates the same way.
> > > > There does not seem to be any reason for keeping the
> > > > two CSI2 pixel clock set to different frequencies.
> > > >=20
> > > > This also reduces first CSI2 clock from overdrive mode
> > > > frequency which is 500 MHz down below the regular mode
> > > > frequency of 400 MHz.
> > > >=20
> > > > Signed-off-by: Marek Vasut <marex@denx.de>
> > >=20
> > > Apparently there is no difference when using imx415 (3840x2160) senso=
r.
> >=20
> > Just for the records: While this change does not affect imx415 (3840x21=
60)
> > processing, reducing clock-frequency as well (v3) imx415 does not work.
> > So I assume that for this image size a higher than default frequency is
> > required.
>=20
> For the time being I expect sensor overlays to override the default
> clock setup.

Yep, that's what I did in the end.

> Ideally the clock frequencies should be configured
> automatically at runtime by the CSI-2 RX driver.

Ideally, yes. In this case it depends on whether it is MIPI-CSI 1 in normal
or overdrive mode, if it is MIPI-CSI 2 or if both cameras a run
simultaneously. I wonder if it really worth to add that much infrastructure
for a use case which is essentially fixed setup.

Best regards,
Alexander

> > > Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > >=20
> > > > ---
> > > > Cc: Conor Dooley <conor+dt@kernel.org>
> > > > Cc: Fabio Estevam <festevam@gmail.com>
> > > > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Cc: Paul Elder <paul.elder@ideasonboard.com>
> > > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > > Cc: Rob Herring <robh@kernel.org>
> > > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > > Cc: devicetree@vger.kernel.org
> > > > Cc: imx@lists.linux.dev
> > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > ---
> > > > V2: Align both clock to 266 MHz and update commit message
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64=
/boot/dts/freescale/imx8mp.dtsi
> > > > index 1bb96e96639f2..7883f5c056f4e 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > @@ -1667,7 +1667,7 @@ mipi_csi_0: csi@32e40000 {
> > > >  						  <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF>;
> > > >  				assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_1000M>,
> > > >  							 <&clk IMX8MP_CLK_24M>;
> > > > -				assigned-clock-rates =3D <500000000>;
> > > > +				assigned-clock-rates =3D <266000000>;
> > > >  				power-domains =3D <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI=
2_1>;
> > > >  				status =3D "disabled";
> > > > =20
> > > >=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


