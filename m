Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C9047B42C;
	Tue, 14 Jul 2026 14:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038751; cv=none; b=j1D2pX6eQ+KgfM3soIe9OVRg+xD4Vd8U3itSpUzp7kn7lCB6Wj+3BhdUPD/njgGsmPWqYz2KYJ4nsiegSiGtgSD2v+cVZYILZHiHTEJA/wT237kt1P6V1bXefWR5+N/IW05QDn/xnFjx0FzgOzPD5teXB0zIT8aEebNs61PZTvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038751; c=relaxed/simple;
	bh=tasiHCO64DNXmjTE1ICMlCBRH96dYzjrM11Hr1FAk84=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P8IIdpLdYzmokXg7IdxgsTlPp4Dg532jSznP219XfI7TK5UanAs3S55ItvMnaOsu0wxqBPHjYX9ZW2ov0NJnNBnxBh0Wlgs2d/NAeUVCnu8XVbFXIq/o5JPdZiaBhngEStzNX63Ppg//X6qVxbgfJndD1yjjVQnI+gAFt2QUA/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aKZQUjI9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aKZQUjI9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA19F1F00A3A;
	Tue, 14 Jul 2026 14:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784038750;
	bh=h2iitN2zi/9/j5nQKZuCRLaLp5HnuY9hb/tcCDK7UDA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aKZQUjI97AonlhQv4Ctzq6Ro+4z1BUcjttf/YceC5MRWmT7w55E9oxuQXtPrqUXlM
	 TagnhY/yA9k1YAhaeRzNFFb//lpsddgtwjyBWWEyRUNd09TZIhIMjYnNfDM1MRUVLZ
	 9cRnmnQ+UYK03cToMeLcT7Eiig2wAYigi6YnUFfNCHwUqGo6/jLBy45LPSEynh2X2Q
	 9+pWT7TwJyadmjYZLWLDZG/oPQtUtHvau9VkmhX6j4IgJOF+4bMEMIzK4WQiZ9hXXh
	 yNGt4DTLU4LPdIuGMOygmZ7oFrRw4d0ekbcNM0vN115+QBwEfyi1q5ZSKY/vTzHhH3
	 vW2bvne9qOCSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: imx8-ss-dma: Add lcdif support for
 i.MX8QXP and i.MX8DXL
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260714-dxl_lcdif-v1-4-6761a8a6592b@nxp.com>
References: <20260714-dxl_lcdif-v1-0-6761a8a6592b@nxp.com>
 <20260714-dxl_lcdif-v1-4-6761a8a6592b@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 14:19:09 +0000
Message-Id: <20260714141909.EA19F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing mandatory 'port' node in adma_lcdif device tree node
--

--- Patch [4]: [PATCH 4/6] arm64: dts: imx8-ss-dma: Add lcdif support for i=
.MX8QXP and i.MX8DXL ---
commit d68882cf2077caac27f3b49fce6a1c236c79be4a
Author: Frank Li <Frank.Li@nxp.com>

arm64: dts: imx8-ss-dma: Add lcdif support for i.MX8QXP and i.MX8DXL

This commit adds lcdif device tree nodes for the i.MX8QXP and i.MX8DXL
platforms.

> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi b/arch/arm64/=
boot/dts/freescale/imx8-ss-dma.dtsi
> --- a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi

[ ... ]

> @@ -149,6 +149,24 @@ lpuart3: serial@5a090000 {
>  		status =3D "disabled";
>  	};
> =20
> +	adma_lcdif: lcdif@5a180000 {
> +		compatible =3D "fsl,imx8qxp-lcdif", "fsl,imx6sx-lcdif";
> +		reg =3D <0x5a180000 0x10000>;
> +		clocks =3D <&lcd_clk_lpcg IMX_LPCG_CLK_0>,
> +			 <&lcd_clk_lpcg IMX_LPCG_CLK_4>,
> +			 <&clk IMX_SC_R_LCD_0 IMX_SC_PM_CLK_MISC0>;
> +		clock-names =3D "pix", "axi", "disp_axi";
> +		assigned-clocks =3D <&clk IMX_SC_R_LCD_0 IMX_SC_PM_CLK_PER>,
> +				  <&clk IMX_SC_R_LCD_0 IMX_SC_PM_CLK_MISC0>,
> +				  <&clk IMX_SC_R_ELCDIF_PLL IMX_SC_PM_CLK_PLL>;
> +		assigned-clock-parents =3D <&clk IMX_SC_R_ELCDIF_PLL IMX_SC_PM_CLK_PLL=
>,
> +					 <&clk IMX_SC_R_LCD_0 IMX_SC_PM_CLK_BYPASS>;
> +		assigned-clock-rates =3D <0>, <24000000>, <804000000>;
> +		interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +		power-domains =3D <&pd IMX_SC_R_LCD_0>;
> +		status =3D "disabled";
> +	};

[Severity: Low]
Will this trigger a dtbs_check warning due to a missing port node?

Looking at the fsl,lcdif.yaml binding schema, it appears a port node is
strictly required for any compatible other than fsl,imx28-lcdif. Since
dtbs_check validates all nodes against the schema even when their status is
disabled, will omitting the port node here introduce a new validation
warning indicating that port is a required property?

Could this node include an empty port node, or should the schema be updated
to make the port property optional for disabled nodes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-dxl_lcdif-=
v1-0-6761a8a6592b@nxp.com?part=3D4
