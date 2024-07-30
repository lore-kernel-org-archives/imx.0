Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1F0192B7E
	for <imx@lists.linux.dev>; Tue, 30 Jul 2024 07:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722325896; cv=none; b=L7MKB30sxSGAPgom7rGIaRC6HCkqmBw519nzMeHwLhEixyGzb9tHLER5E799CQGbpvVDs821XBqLl9ZG0JjGvQDHdh2q99rDNV2Ylw8GkxYpiAajd8HNf7g46rO0C5XrMtd726FaYWXvXbXfVJpKvlZe3t8qU7YyPVRikf8uhFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722325896; c=relaxed/simple;
	bh=UG5WMBUA4OYVMeeEpBB6RKqHmwAMJbKUTbNJZrchjVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i+pxRPUzyYCnp0GDo/D6vF9PsPS2ujlAOGHvO1nPWv27PRS8PvJRmtpPbeYmAn0ls9A+yy6LIwnUHi3nFw4wTqTBTMlU+UlMxUKxJXgXL6n3gyZ4u+mCCx4sFIKsrIiczYKqrB+1PT4i92fdu/fE0cGgt9nTUTwl31PBqOHW2Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Zfjr/kpq; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=o/W7PHNZ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Zfjr/kpq";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="o/W7PHNZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1722325892; x=1753861892;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4EFhy66mb2EN5Xg6Nodx0UoD7jYf664PaudI15ViaSI=;
  b=Zfjr/kpqCDku63Z90NMZRhDzqQJ8mhPQ3PJ7CQSQpdiFy+St3wwmPgDl
   /E5Q6fSqB9vDG6ve4NI4uj99BejhbfYAWefhBIXMQGoOPjFzmngn2U8kn
   arkGOhvYVPTXx3UaCLKC/5+nQS2ISyPB3E3Fvh9zOBIREZS9/fxnkvLVB
   5OV7A0Hh57Klni/hvb3N3wq8Rqgk8Thw/niW7xrjp9rrZR/hKYfp5Glkp
   j/vwSvV1XqooiMiPJeZVnA0CAaL3ZV5FTxO1GpiwVyf9A77Y51T7EFw+o
   m8YtfJbFGf577RcOLuy3q4VUSz5TXImLcnqbtfa1L9ZYFBrV3Q2bbc5mI
   Q==;
X-CSE-ConnectionGUID: fGX8/Tf4RF6A9OI8eUv2xQ==
X-CSE-MsgGUID: DbIpd4ZkRgiQdzWtPw3XNw==
X-IronPort-AV: E=Sophos;i="6.09,248,1716242400"; 
   d="scan'208";a="38140493"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 Jul 2024 09:51:30 +0200
X-CheckPoint: {66A89B82-11-2D4D5AC2-F2EAEA09}
X-MAIL-CPID: 8507E70011AE48B9C1D51CE44F20DD35_3
X-Control-Analysis: str=0001.0A782F1E.66A89B82.0148,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51443167BE9;
	Tue, 30 Jul 2024 09:51:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1722325886;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4EFhy66mb2EN5Xg6Nodx0UoD7jYf664PaudI15ViaSI=;
	b=o/W7PHNZz/wnnj+4OjAeR7xhptF0tks0684Pr4Qvvl1a3fPcJ4GnKPj8rvDboL1MnZcXqO
	XieU6y/F6DsGmxHRNwqBW7400W/mQkpbW81I+3kh3Ks7qNDiTPgL/Ea1znoJ551vBk4UFb
	JMjFfD6axGZTohCgJQHRk3cOS+BhZkzz8v73ZDL3h/vVaPWVJm0+2thWI6EfrSUGkVCaHe
	ynFdugcIq/0Ct0HP5E56enI8+DPBqqGAheJHLRvM6Ap8mw8T3bG2vlGLEK1k020pTFiHTB
	fnzXneARZMf8Jvg1+bj5d7FULrAaTHlWWdC+d2XpZp2CJgRXP9cd5LMfRaRkVQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Clark Wang <xiaoning.wang@nxp.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: imx8-ss-dma: enable dma support for lpspi
Date: Tue, 30 Jul 2024 09:51:25 +0200
Message-ID: <6166407.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <d3f4dce4-9d44-4bf6-816f-e4f8ddaa0932@kernel.org>
References: <20240729094511.159467-1-alexander.stein@ew.tq-group.com> <2840074.mvXUDI8C0e@steina-w> <d3f4dce4-9d44-4bf6-816f-e4f8ddaa0932@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Dienstag, 30. Juli 2024, 09:37:53 CEST schrieb Krzysztof Kozlowski:
> On 30/07/2024 09:30, Alexander Stein wrote:
> > Hi Krzysztof,
> >=20
> > Am Montag, 29. Juli 2024, 17:10:48 CEST schrieb Krzysztof Kozlowski:
> >> On 29/07/2024 11:45, Alexander Stein wrote:
> >>> From: Clark Wang <xiaoning.wang@nxp.com>
> >>>
> >>> Add DMA configurations for LPSPI nodes on i.MX8QX/QM/DXL.
> >>>
> >>> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> >>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >>> ---
> >>> Using the DMA configuration bits from downstream kernel.
> >>> Tested on TQMa8XxS.
> >>>
> >>>  arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi | 8 ++++++++
> >>>  1 file changed, 8 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi b/arch/ar=
m64/boot/dts/freescale/imx8-ss-dma.dtsi
> >>> index 1ee9496c988c5..8ae5f065b4180 100644
> >>> --- a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
> >>> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
> >>> @@ -34,6 +34,8 @@ lpspi0: spi@5a000000 {
> >>>  		assigned-clocks =3D <&clk IMX_SC_R_SPI_0 IMX_SC_PM_CLK_PER>;
> >>>  		assigned-clock-rates =3D <60000000>;
> >>>  		power-domains =3D <&pd IMX_SC_R_SPI_0>;
> >>> +		dma-names =3D "tx","rx";
> >>
> >> Missing spaces. Unexpected order, unless that's the coding style for i=
mx.
> >=20
> > Ack for the space, will correct. But the order is defined that way in
> > Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
>=20
> Bindings do not define the order of properties. The coding style does
> and usually we expect property-x followed by property-x-names.

Ah, you were talking about order of properties, not order of property
values, my bad. Unfortunately imx (and also layerscape) is inconsistent,
having both ways :(
I'll go for you suggestion, this seems also to be the order used mostly.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


