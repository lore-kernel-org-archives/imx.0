Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC188495
	for <imx@lists.linux.dev>; Fri,  3 May 2024 12:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714741113; cv=none; b=Z388OP8LWJ0oglT7kWVnrzmsNUegJRDUTlxD591AS91e0hJnM8vxuSCbnyXBWSPkvDGrh/NZhSKPSj5B/dhlImkKlqirQMe4esv2BSclhrK2hRpySkYbU2UzlUtwMue/aFV3ivvp+e4OW7o6GdTbp8lgyNHZcrfC2HTvSJktj9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714741113; c=relaxed/simple;
	bh=YkNGtKSy5REbDya5MJjleMOscfr6ZOuhSMFpINPzqNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mu9cdAK8avMmaZcMwN3fDG7WtE8gmuCs0LgqOmX5F5LFz/wJddG2+2L1A3nJraHXjXKVGIiztb49CjG3k8HHlc6dE9Chh1WQSMDVQzMxPYR7Qk9wS+Qrq9Qs7OklkDonaELnj/DJDVofd9HvwcTdrisz1JzwYvHOrz0iVGODUe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=dU2Xri8i; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=jIQO3pMZ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="dU2Xri8i";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jIQO3pMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1714741110; x=1746277110;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VMoe7SYlALrfWi5S2dB+GJHXhcLLyVr0yLlsMrIAcus=;
  b=dU2Xri8ixewB35ca98WEN9WAvrLnWl0FXHVXPz1EFty3FLjnSP85GNsO
   lPiLxXVCYrE+FiYUnfm76dephadUPfT7mBSGnHhVM/TXhnFS8XEN7dLuO
   5szk4A4GHIMXwmmCL50AFXBq9TvY0hSZPIJk9L1EdM2vx997maC+mU425
   VlEL0+jSsLtVqUeFhJ3WpiS1UpyomIyiajmGsx5qTlKoHsFXnWEZbc7po
   clvoUg0/0RCF7Na/l+vU5xCm6uBxxBdv+mK7pwlsVXydym2uwh1D6TzaL
   mooKHPyALdlzuga9bBId8Jyf4dSZonZZc82SXJDUO4G3rb1WVtBMiIgY1
   w==;
X-IronPort-AV: E=Sophos;i="6.07,251,1708383600"; 
   d="scan'208";a="36736105"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 03 May 2024 14:58:21 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E854D173347;
	Fri,  3 May 2024 14:58:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1714741097;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VMoe7SYlALrfWi5S2dB+GJHXhcLLyVr0yLlsMrIAcus=;
	b=jIQO3pMZb8c00MezK1nZkV4/fjV+Ri8QgIKvKWYAuQ1yBoOnKyBUZ1Axolmy3EIsnY5ThQ
	GcP2eUCkmUs8eL7nJWlbXWMBtVkUsRTIrwhb/LyKjVnjzlcpAEqGJ5onwAcXHYn+oXNbSZ
	XHvercmx57IhmxwPisbVdIC+wT2f9pzZjVkBYCW9AqWAU24AeQ3X9rMX5kFvLvsdGNt61f
	eALqH0AA4/ki/f4v+wrz4nOBIwL/Y4X66r8uGOUxyjgK3rx0ApiJlNQ+gqxoBalEwZUWWe
	rOfkRF7HZ/AD+9tAyDjYrt/vUzrgVDHMWzP0Q9I26CwhQ25H6VjfO/jbD5MZPQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Paul Elder <paul.elder@ideasonboard.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Align both CSI2 pixel clock
Date: Fri, 03 May 2024 14:58:19 +0200
Message-ID: <3311352.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <2327389.ElGaqSPkdT@steina-w>
References: <20240416141914.9375-1-marex@denx.de> <2327389.ElGaqSPkdT@steina-w>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Mittwoch, 17. April 2024, 11:12:04 CEST schrieb Alexander Stein:
> Am Dienstag, 16. April 2024, 16:19:10 CEST schrieb Marek Vasut:
> > Configure both CSI2 assigned-clock-rates the same way.
> > There does not seem to be any reason for keeping the
> > two CSI2 pixel clock set to different frequencies.
> >=20
> > This also reduces first CSI2 clock from overdrive mode
> > frequency which is 500 MHz down below the regular mode
> > frequency of 400 MHz.
> >=20
> > Signed-off-by: Marek Vasut <marex@denx.de>
>=20
> Apparently there is no difference when using imx415 (3840x2160) sensor.

Just for the records: While this change does not affect imx415 (3840x2160)
processing, reducing clock-frequency as well (v3) imx415 does not work.
So I assume that for this image size a higher than default frequency is
required.

Best regards,
Alexander

> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> > ---
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Paul Elder <paul.elder@ideasonboard.com>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: imx@lists.linux.dev
> > Cc: linux-arm-kernel@lists.infradead.org
> > ---
> > V2: Align both clock to 266 MHz and update commit message
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mp.dtsi
> > index 1bb96e96639f2..7883f5c056f4e 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -1667,7 +1667,7 @@ mipi_csi_0: csi@32e40000 {
> >  						  <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF>;
> >  				assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_1000M>,
> >  							 <&clk IMX8MP_CLK_24M>;
> > -				assigned-clock-rates =3D <500000000>;
> > +				assigned-clock-rates =3D <266000000>;
> >  				power-domains =3D <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
> >  				status =3D "disabled";
> > =20
> >=20
>=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


