Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167829;
	b=o8PwPf+E05sV2rUBEfLrKHXbWPTFOyGdFrTmEdmwi29PFVQBN2mp1Bxf5c35/lEHaklt
	 ucZZU/mq4C8P+TdD4mt9oUM1ZkAP3GR8x30zlG0lbRfA5Uv5dFOWkHtKDFHEkeZawsX1G
	 Q/d5p1dO7VA8CeyfasM92aRWYgDkasVdTXDuzgIsT+mNf8AbAerJvnBZOwv+E6CJw7ZCx
	 DXhRQipJukkmOvpEjhjOJ/3EMJ/L9Dmjnj/V7bsrLR8sBK5b+u8UsSC/11jmS6RoByhVH
	 79tBgt+Aly079PHVpKK8uyZ5z9ZEvDwGXxSQvzKvIc0CCD8b9MmHhHV0yF20w4+9N6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167829;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GeCtzp2xoImZ0E0jQSKhDwxA/F4ssL7yrY8e3r4L1SU=;
	b=VsQ/cwsnCbXt74Mlb6Na+GxDBIY7X4kB6oxF6WQiC2E7z1ZOeNaAW7X+XxQEPbBA5uwd
	 YF3P6BwJKVAPuGscS+wL3t2EdeZPrWOCUJv8a/4IH2oRSkPQ/Ome6LjeNoSpGIrsxdowi
	 d4mYd5hVpzfM27wefgdeKV2yO1JfwldBNHk1roZILB+kA7OUzb3Em9CzLfb7zhNCm4tua
	 sklVUbU0oh2zhNPig7yo3PFF1YZ3XZqCH+EI2dN8vE36zvp+vPOspiSwEGDIs3NyiYD+m
	 T3tzA9cAxg7p3n5VqYfHQzx7RnMFqvoxElSRf2zPcVa7OmIE1c8QZnTeiwhsctOxSUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hPqyTvSE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3937E606A325;
	Fri, 20 Nov 2026 09:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hPqyTvSE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A9C21F000C6;
	Fri, 20 Nov 2026 09:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795167828;
	bh=GeCtzp2xoImZ0E0jQSKhDwxA/F4ssL7yrY8e3r4L1SU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hPqyTvSErmOWwfZlhZotI9IwFsMS8pqJuFyKVcffoMoYiAMWhJSdOgWikELSwAegw
	 EzWKybW6hJi9nwQSbNNGHPZuAiz6116gnXPg+JaXdLXkwPTyFvA4HXjNnz4G6RglUW
	 CkFES390EAgqfUdBNZGFDn9x68FP8k1Ns12i9IojZ+6AIYvjuWQv3OgM9oXvwoRzy3
	 qAdF/pjoT8UcfXM3sot2DmmWoSCpVyyUg9qV1G4reEGCyLDJYXNBbByk+gJI5IBW/J
	 PMOic3tFkVK8qNCe3gtkSxyDqvHIncmeuURs7qhUczTrpxcSUuulUxqP/AZ5nOcRUp
	 2BI5QKxdNzwHA==
Message-ID: <sashiko-outbox-224871@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: freescale: imx93-11x11-frdm: use 8-bit
 eMMC bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Freimut Diener" <f.diener@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261120-imx93-frdm-fixes-v1-3-78dde22a56fe@pengutronix.de>
References: <20261120-imx93-frdm-fixes-v1-0-78dde22a56fe@pengutronix.de>
 <20261120-imx93-frdm-fixes-v1-3-78dde22a56fe@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 09:43:47 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: freescale: imx93-11x11-frdm sets 8-bit bus-width
  on 4-bit usdhc3
--

commit 1b60016bb1be48a6e2b6b1dfc5d19ef5de2490d6
Author: Freimut Diener <f.diener@pengutronix.de>

arm64: dts: freescale: imx93-11x11-frdm: use 8-bit eMMC bus

This commit changes the bus-width property of the usdhc3 node in
imx93-11x11-frdm.dts from 4 to 8.

> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/ar=
m64/boot/dts/freescale/imx93-11x11-frdm.dts
> index fbe3543e1ee8c..af674f3f48364 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> @@ -75,7 +75,7 @@ &sai1 {
>  };
> =20
>  &usdhc3 {
> -	bus-width =3D <4>;
> +	bus-width =3D <8>;
>  	keep-power-in-suspend;
>  	mmc-pwrseq =3D <&usdhc3_pwrseq>;
>  	non-removable;

[Severity: Medium]
Should usdhc3 really have an 8-bit bus width here?

On the FRDM-i.MX93, the 8-bit eMMC is connected to usdhc1, which already
has bus-width =3D <8> in
arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi.  usdhc3
(428b0000.mmc) is connected to the 4-bit Wi-Fi SDIO interface of the
IW612 module, and both pinctrl_usdhc3 and the i.MX93 SoC itself
(arch/arm64/boot/dts/freescale/imx93-pinfunc.h) only have four data lines
(USDHC3_DATA0 through USDHC3_DATA3).

428b0000.mmc logs the HS400 warning in mmc_validate_host_caps() because
usdhc3 is missing the no-mmc property (unlike usdhc2 in
imx93-11x11-frdm-common.dtsi).  Keeping bus-width =3D <4> and adding no-mmc
(and no-sd) on usdhc3 would match the hardware and avoid the warning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-imx93-frdm=
-fixes-v1-0-78dde22a56fe@pengutronix.de?part=3D3
