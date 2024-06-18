Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934DDFC0E
	for <imx@lists.linux.dev>; Tue, 18 Jun 2024 06:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718691352; cv=none; b=P7FRfWOt9IQ67MegfBM9ON1hs65GXpV2tC1PN/ZqcNTu5+KwSl+Dcahn9+1XqSiI2tPdpNoYaxgvdwMxGP7aChFECBfKeK5Io9wb+J0Koa1qrKOlcO4bgj3UJkfPmoPojdLYgiw/ARhMZHhmq5q9ygPSjPANMNZdoElJZOaG/t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718691352; c=relaxed/simple;
	bh=NYu7HmNaUXvKxLQBShfSo7YY2rt3DR0kHagqqDYAtfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eiCeEAtNwC6/QtmP/5qo9d5WSrQswOXNPucHm4zNCJd3IZjbR4ryQfIUFFA4Ml8FzJzdOLdGyq8gIP4ZOOJAHHoLFQtR6g3/KdJXmgLW0KlHMKt075u7IRSi8iG4uhTrPdYmZPXQ6v6XsO6dgKf4/72Nix89jm2oJCPEpZ59jsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=YoN3t/kY; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=aay66l+r reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="YoN3t/kY";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="aay66l+r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1718691347; x=1750227347;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j0CT5+u8v+Tt5ly5F8d6KLAmQFfq4ACni1Ma8+3IMes=;
  b=YoN3t/kYSdV/TAnOOuJFoPREVrLOtU4a/g46wFWtOz2vnBCQQxewq43Q
   hYJ+wqKG3njbniRsMRHVysTIj+7WO2NYjAcOT8bB3/ePlCoTkwmuMdPwP
   UbEqfz3DNnOSCVyXgj3ioCr7I1k8wsRvgnFlZ/7kzK86/QGJg22Zrh03B
   awBudcGQYFFyW5rqfW4MH9OAwrR3Vqh3C12QhcNPKrXkhvG0k1QzXxRH1
   OrwBNI2HaPM2jIVT9PJY2AQqCiLEcX5TvBcUi9NIVdsw3/iSP2eFsBUoa
   tEZDJtl5BWKVffqqURu1eb4GR/55oJhsVPzg40R0q1WL5RME/XsUyB8TV
   Q==;
X-CSE-ConnectionGUID: uSJ4tK8CTSuWQAuRdEbI8A==
X-CSE-MsgGUID: h3c3S3bTTlqWutSMcG/7qw==
X-IronPort-AV: E=Sophos;i="6.08,246,1712613600"; 
   d="scan'208";a="37439566"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 18 Jun 2024 08:15:45 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 70990165E7E;
	Tue, 18 Jun 2024 08:15:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1718691340;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j0CT5+u8v+Tt5ly5F8d6KLAmQFfq4ACni1Ma8+3IMes=;
	b=aay66l+rtmKWsmSR8PlojeyltfrnzJEs4Ojsh0PwJU1Qw0Hd5biwloAj5kYTFP2wfInCif
	BSBRBzYq3NOP+iO3toNNNhJYaV3VHGieJsAvCWePli5t/fhKDFz3A5oj3sZRgVIreHYBxT
	E6esHFpiFfZyenRu+WLY5jjs/ksYP5Cqng1DVM8nbpIn+asucWmCziml3AG762nLFoaMqf
	CpXiTMOZ7D/pYCG7+UhbxxcIk0/HU+X/Y5lJ0HEGhX5N4Ys6Vm7jScokiYloabfnjoD96h
	WKpPjzf/f/cKL7XSca6KYLQZ2e9Wfp9Zfwiom7UOneetaC6M6rR2zjn8LyNrBA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-arm-kernel@lists.infradead.org, Adam Ford <aford173@gmail.com>
Cc: aford@beaconembedded.com, marex@denx.de, Adam Ford <aford173@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp: Fix pgc_mlmix location
Date: Tue, 18 Jun 2024 08:15:41 +0200
Message-ID: <5814494.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240617223952.1899201-1-aford173@gmail.com>
References: <20240617223952.1899201-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Adam,

Am Dienstag, 18. Juni 2024, 00:39:51 CEST schrieb Adam Ford:
> The pgc_mlmix shows a power-domain@24, but the reg value is
> IMX8MP_POWER_DOMAIN_MLMIX which is set to 4.
>=20
> The stuff after the @ symbol should match the stuff referenced
> by 'reg' so reorder the pgc_mlmix so it to appear as power-domain@4.

Taking a look this mismatch seems to be also true for:
* IMX8MP_POWER_DOMAIN_VPUMIX
* IMX8MP_POWER_DOMAIN_VPU_G1
* IMX8MP_POWER_DOMAIN_VPU_G2
* IMX8MP_POWER_DOMAIN_VPU_VC8000E

Would you mind fixing them as well?

Despite that, for this patch:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Thanks and best regards,
Alexander

> Fixes: 834464c8504c ("arm64: dts: imx8mp: add mlmix power domain")
> Fixes: 4bedc468b725 ("arm64: dts: imx8mp: Add NPU Node")
>=20
> Signed-off-by: Adam Ford <aford173@gmail.com>
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index b92abb5a5c53..3576d2b89b43 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -789,6 +789,23 @@ pgc_usb2_phy: power-domain@3 {
>  						reg =3D <IMX8MP_POWER_DOMAIN_USB2_PHY>;
>  					};
> =20
> +					pgc_mlmix: power-domain@4 {
> +						#power-domain-cells =3D <0>;
> +						reg =3D <IMX8MP_POWER_DOMAIN_MLMIX>;
> +						clocks =3D <&clk IMX8MP_CLK_ML_AXI>,
> +							 <&clk IMX8MP_CLK_ML_AHB>,
> +							 <&clk IMX8MP_CLK_NPU_ROOT>;
> +						assigned-clocks =3D <&clk IMX8MP_CLK_ML_CORE>,
> +								  <&clk IMX8MP_CLK_ML_AXI>,
> +								  <&clk IMX8MP_CLK_ML_AHB>;
> +						assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL1_800M>,
> +									 <&clk IMX8MP_SYS_PLL1_800M>,
> +									 <&clk IMX8MP_SYS_PLL1_800M>;
> +						assigned-clock-rates =3D <800000000>,
> +								       <800000000>,
> +								       <300000000>;
> +					};
> +
>  					pgc_audio: power-domain@5 {
>  						#power-domain-cells =3D <0>;
>  						reg =3D <IMX8MP_POWER_DOMAIN_AUDIOMIX>;
> @@ -900,23 +917,6 @@ pgc_vpu_vc8000e: power-domain@22 {
>  						reg =3D <IMX8MP_POWER_DOMAIN_VPU_VC8000E>;
>  						clocks =3D <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
>  					};
> -
> -					pgc_mlmix: power-domain@24 {
> -						#power-domain-cells =3D <0>;
> -						reg =3D <IMX8MP_POWER_DOMAIN_MLMIX>;
> -						clocks =3D <&clk IMX8MP_CLK_ML_AXI>,
> -							 <&clk IMX8MP_CLK_ML_AHB>,
> -							 <&clk IMX8MP_CLK_NPU_ROOT>;
> -						assigned-clocks =3D <&clk IMX8MP_CLK_ML_CORE>,
> -								  <&clk IMX8MP_CLK_ML_AXI>,
> -								  <&clk IMX8MP_CLK_ML_AHB>;
> -						assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL1_800M>,
> -									 <&clk IMX8MP_SYS_PLL1_800M>,
> -									 <&clk IMX8MP_SYS_PLL1_800M>;
> -						assigned-clock-rates =3D <800000000>,
> -								       <800000000>,
> -								       <300000000>;
> -					};
>  				};
>  			};
>  		};
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


