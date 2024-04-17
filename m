Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB867EF1C
	for <imx@lists.linux.dev>; Wed, 17 Apr 2024 09:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713345137; cv=none; b=uMjPCp5l+r5cCTM6wif5HbhJVKGaaO6Igp/+TVx16nX0lEhAeriaVxHik6wB2fApgP69aoUClW/calDzMeWvS7flp6lH8LgCv5wczTPYs6J1iohBwrMKN3DzMVrllCX838DvNiYOBrhHJXr6E8+rQW+49qFwFHzYw4dT2eRytms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713345137; c=relaxed/simple;
	bh=s+oA79rozNKbEdCS8EDNeATMYSzbbJ1tGkLt+Y+RLnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iMYouF8fMAYsJjlJg2PiZzQETITntrULt+S/gmh6Colk5WbCc6GKSDLO6EkvsNnj6ee4XlKFa06i0/Pyd/K9stw1CSy7AAV4kS84/EHFch8HRNUJdcbiac6HpU4+tYptqTSpXqz7HSvSwq80TxndBfOFske9AbtHdZK/AKLt+Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=GT8A1lfV; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=q/UG8DAU reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="GT8A1lfV";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="q/UG8DAU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1713345133; x=1744881133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lF4tmDu4GI9aEs4Mh8KJn0WdInCsh2CXUX6g0XK0ZGM=;
  b=GT8A1lfVLVQeora8EyMtZf/eBu9T2N/R1zxccLZI7j0bGwCmW/InRpzV
   ++0p97Sjb2dhSPbDbbNEXeyJie6LABQtGdg38KDVv34ZSKGAbx+UY2OPe
   u8SqBF6GZdoUyxcdH0w9w+WU8N5XZ/klsE6U/Z+Af7aOFa1Yp82upIwaU
   hYisIJm4Q60BOpcAMhSgOrxCtq0W9WIMP+g/0hMDgMY278xcdOpk2/6oY
   DK4vtCECHzYEgYHjjFzxpiz3dIezJhwrOLMsvoopmHl3aZihyGojRnZ62
   MoLqfOug+6m6Xz7T+R7T95LXIu/cwYoGaUVGjqw9pEYdAc05bGbVjrZlI
   w==;
X-IronPort-AV: E=Sophos;i="6.07,208,1708383600"; 
   d="scan'208";a="36462618"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 17 Apr 2024 11:12:10 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5DD97175E76;
	Wed, 17 Apr 2024 11:12:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1713345126;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lF4tmDu4GI9aEs4Mh8KJn0WdInCsh2CXUX6g0XK0ZGM=;
	b=q/UG8DAUHWYjq8aFI9lw09UJZzhLoumjoboCuCKudXiDrE44Z8d3zqyH4v8HNjJDZg0brZ
	Ri6vtJnkLSwpqk4RI81pPVBmkYZnE/4sG5skRVhCat/wBJSSfAlmaicWWq3PPItaardZo3
	ulePIBWXWlaZHlN3SoQMd8zKkNXSJyOmncaSi276iYNwI6KXitTNMb57Cha3C9FYheVc/J
	7k2ERb/fzSvtHNn95kjHBDxAHqgBaGUHwhGYAekDElsq6IdiPnTKSLR5I5apDDQ45fVML1
	RWvHhkNJu6x6AANS8c4GkHa94+txcxCs7ZrGMzzTVxdq1owRiD4DpHhXTrP1kg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Paul Elder <paul.elder@ideasonboard.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Align both CSI2 pixel clock
Date: Wed, 17 Apr 2024 11:12:04 +0200
Message-ID: <2327389.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240416141914.9375-1-marex@denx.de>
References: <20240416141914.9375-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Dienstag, 16. April 2024, 16:19:10 CEST schrieb Marek Vasut:
> Configure both CSI2 assigned-clock-rates the same way.
> There does not seem to be any reason for keeping the
> two CSI2 pixel clock set to different frequencies.
>=20
> This also reduces first CSI2 clock from overdrive mode
> frequency which is 500 MHz down below the regular mode
> frequency of 400 MHz.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

Apparently there is no difference when using imx415 (3840x2160) sensor.
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Paul Elder <paul.elder@ideasonboard.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: Align both clock to 266 MHz and update commit message
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index 1bb96e96639f2..7883f5c056f4e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1667,7 +1667,7 @@ mipi_csi_0: csi@32e40000 {
>  						  <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF>;
>  				assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_1000M>,
>  							 <&clk IMX8MP_CLK_24M>;
> -				assigned-clock-rates =3D <500000000>;
> +				assigned-clock-rates =3D <266000000>;
>  				power-domains =3D <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
>  				status =3D "disabled";
> =20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


