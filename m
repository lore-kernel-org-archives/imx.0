Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C596BFC0
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 08:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723537890; cv=none; b=HW2b+cMwb4lEdDPIM/v61yOIZ71aT7NqFP3mc5D8uW94tBv66QWNPmRDxHQKhMn9b4MkSMaprx0s3LNF8CPR9yc3+LD/0jTIrUa76CiofwPxxYuqBtyrkEd6tUQ+ms1XgCzdVq4/zYdnHvX1LqBNFEwm3KKmjU+7CTHt/W3DIJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723537890; c=relaxed/simple;
	bh=gldw+DiDr5iS9ZgOdol9tXarwFVcFW7Ftsi+2CgB1zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pNI7RcZ08KhK90rG+F26zPvcHnZPp2klGDhgK88Po5zuwiVdfoIXgTE0Pb9dAViilQfAfzxzzwzV7AUCMhiWunJKQWD5WF/RYrT3rP8NdxLsZwtxRuWa/vq6cZEnbUHp5nITIvNtjjPKk0SU9agsn+5eOE3fgtsFYNg+nC3Srcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=YZAEO5pR; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=KVWwciHK reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="YZAEO5pR";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="KVWwciHK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723537888; x=1755073888;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/gSS4FWxArLqtuvaFntrSND4VCRY2RsJR/0/oPqlccc=;
  b=YZAEO5pRJUDH4HeiC7OQlj9yA2hsbfzuEvi8yktx4MAR6QSIDnzn4Zjm
   wW3K1I2j2w4inu8Y6E5WER9xhGk7pIp2Gff59JGvM5Y1VpnZbDJwoMSiy
   OXt9/XY8hQA0JdFG9tebDisCI2Ajfwz2t4VjbwfSTSj8OsCGJDMoq3VnF
   R2h6CpxK80GtFZ/D+Hp40ukr5psGNDjphXxYMwa31t1Rf89x1ts9vJPhI
   qm3DTqHqs+WcWTX96BtEs4FwfKXe+NQhNE0XgNQY7YpiRFGXikMszBJgJ
   pj6Umwe6e01A3ijj0jrHH5PpIb7+NXr805zO++6lTKnsZKywDacSOcM5e
   w==;
X-CSE-ConnectionGUID: RDAHVKHPTwqW0pdZUdjliA==
X-CSE-MsgGUID: 1LOifm1nQeittBFXilAwUA==
X-IronPort-AV: E=Sophos;i="6.09,285,1716242400"; 
   d="scan'208";a="38378869"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 13 Aug 2024 10:31:26 +0200
X-CheckPoint: {66BB19DE-9-45EF2B36-F6E28480}
X-MAIL-CPID: 87F3E735B4307D28F80B5C2167AC0A0C_0
X-Control-Analysis: str=0001.0A782F1D.66BB19DE.00BD,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 363F716A307;
	Tue, 13 Aug 2024 10:31:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723537882;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/gSS4FWxArLqtuvaFntrSND4VCRY2RsJR/0/oPqlccc=;
	b=KVWwciHKjp9lw+jPzH99xSqqXVfobpu8Dvzr1MH3HLP9AaWRxu6LY9vjFUyY1e5zVRPCet
	aokkY66RT8HNFUKnmfVNdJBpnkIxiXO+sJOaL9ljjUW/6h0Ftm47Jl5ITlB0bkafCLCkza
	mI9IgeEHeDrzrzQJr1K0k1NF1Wu6rKH5dyeqM5kWJOeP+6L3ucRkAuRQTS1ewv8hJcL+NC
	d9lLaQ5WD2FFu7oKzNJSrkhJ4bCqX1VCegw/+LC9sG9/5dC5rQyaYzEmOioN1yxW+lpv6B
	Ia4CvzUfu1DiqX946w8kO6/SWH4aqAktDa/DYmyJth4u/vDpbZBPrXQQf5adVw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Gregor Herburger <gregor.herburger@ew.tq-group.com>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux@ew.tq-group.com, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 06/17] arm64: dts: layerscape: remove undocument big-endian in watchdog
Date: Tue, 13 Aug 2024 10:31:23 +0200
Message-ID: <7700102.EvYhyI6sBW@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240813-imx_warning-v1-6-3494426aea09@nxp.com>
References: <20240813-imx_warning-v1-0-3494426aea09@nxp.com> <20240813-imx_warning-v1-6-3494426aea09@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Dienstag, 13. August 2024, 06:35:01 CEST schrieb Frank Li:
> Remove undocument property big-endian in watchdog.
> drivers/watchdog/imx2_wdt.c also never parser it.
>=20
> Fix below wanring:
> arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: watchdog@2ad0000:
> 	Unevaluated properties are not allowed ('big-endian' was unexpected)
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi | 1 -
>  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 1 -
>  2 files changed, 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/=
boot/dts/freescale/fsl-ls1012a.dtsi
> index a3c57da63a01b..b84512bc4c881 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> @@ -430,7 +430,6 @@ wdog0: watchdog@2ad0000 {
>  			reg =3D <0x0 0x2ad0000 0x0 0x10000>;
>  			interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks =3D <&clockgen QORIQ_CLK_PLATFORM_PLL QORIQ_CLK_PLL_DIV(1)>;
> -			big-endian;

RM LS1012A Rev3 10/2020 lists WDOG1 (2ad_0000) as big-endian.

>  		};
> =20
>  		sai1: sai@2b50000 {
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/=
boot/dts/freescale/fsl-ls1043a.dtsi
> index c0e3e8fa1e794..5837f1b15dccb 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
> @@ -776,7 +776,6 @@ wdog0: watchdog@2ad0000 {
>  			interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks =3D <&clockgen QORIQ_CLK_PLATFORM_PLL
>  					    QORIQ_CLK_PLL_DIV(1)>;
> -			big-endian;

RM LS1043A Rev6 07/2020 lists WDOG1 (2ad_0000) as big-endian.

What about ls1021a? According to RM this is also big-endian.
regmap_get_val_endian() parses this property and regmap is used
by drivers/watchdog/imx2_wdt.c

Best regards,
Alexander


>  		};
> =20
>  		edma0: dma-controller@2c00000 {
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


