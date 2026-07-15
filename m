Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C1E446C0E;
	Wed, 15 Jul 2026 18:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784141313; cv=none; b=FBi7W04nMcdIEnYtMuE1cG99lHvvnoF+LcWdu2likbuOvM8+mEgd9xb47S7V0NpKDG9QISldNhlcpksbh4fSnNz7qZSu8+go0O+nf2hmCvmE+wP0yfJIMOhzNb1eqFXVxoPQPdM4iGkgC5wdTPZWWwOG8wMhXiuklAZvo1Rq3tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784141313; c=relaxed/simple;
	bh=UrfT1JDfCewfcZdCpt7DgNSLlJZGCsi6WrbtWp+F360=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fJXpAJMoRIQNW48jTMrsksF0Axh6ZC1iqvkp4MUYV/XNL/iMR16a/tRQDV8ezRLYyd79SHBBkYxwoJqW5s45JKeHNRtDU0/amf4TrUSriZcTAk/8KyugX8hq1yibPUeZo2+Npr3jklf5N34yxzk9/8G2AOwMiTgrO0jJ3uDcAKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m7k/pHZE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7k/pHZE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1F91F000E9;
	Wed, 15 Jul 2026 18:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784141309;
	bh=aZUp5fesUF+4hvRNUbQFNXrqlCbH4FNJFJImBwGf/uc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m7k/pHZEmgFcQBvZQQbdjgUpHcTSmjSuyegUVIXCskZPj+6IJTh9kYE5P+cmTEZCV
	 UuecMLUnCThCP070edOjkHIqD0Eoc5/0gkR829sQYW3y3Kdjzc+KWFXYW1eq2UcF4a
	 daP9K8F6u9C0ggwEWZsdvB3P1uL73F53hTfRtu6+FKNo+dfjXTDaNjgpAb3i1HW/1/
	 5eXkttFCiGpdPWEQ0Co76mEHSbkv9Hs3EJmDIfghmyN+Gi5IGN4sZiq35tvy2jgLRp
	 0YesnHEW8kWHGWuo2HZKlfnMtRwC2bwdvcjxgsOpHPzyQe9OW8+PjidMFm2PVKi5p8
	 2agZoaX60L/2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/7] arm64: dts: imx8-ss-dma: Add lcdif support for
 i.MX8QXP and i.MX8DXL
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260715-dxl_lcdif-v2-4-da797562636e@nxp.com>
References: <20260715-dxl_lcdif-v2-0-da797562636e@nxp.com>
 <20260715-dxl_lcdif-v2-4-da797562636e@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 18:48:28 +0000
Message-Id: <20260715184829.6B1F91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing required 'port' node in the adma_lcdif device tree definiti=
on.
--

--- Patch [4]: [PATCH v2 4/7] arm64: dts: imx8-ss-dma: Add lcdif support fo=
r i.MX8QXP and i.MX8DXL ---
commit 2f2508e8acf644f753c462595da01a137845e813
Author: Frank Li <Frank.Li@nxp.com>

arm64: dts: imx8-ss-dma: Add lcdif support for i.MX8QXP and i.MX8DXL

This commit adds LCD interface (lcdif) device tree support for the i.MX8QXP
and i.MX8DXL platforms.

> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi b/arch/arm64/=
boot/dts/freescale/imx8-ss-dma.dtsi
> index 4de78f870c05c..87082c3fa9338 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi

[ ... ]

> @@ -149,6 +149,24 @@ lpuart3: serial@5a090000 {
>  		status =3D "disabled";
>  	};
> =20
> +	adma_lcdif: lcdif@5a180000 {
> +		compatible =3D "fsl,imx8qxp-lcdif", "fsl,imx6sx-lcdif";

[Severity: Low]
Does this adma_lcdif node need a port sub-node to be defined here?=20

The fsl,lcdif.yaml device tree binding schema explicitly requires a port no=
de
for all compatibles except fsl,imx28-lcdif. Omitting it will result in a
validation warning during make dtbs_check against any board configuration
that includes imx8-ss-dma.dtsi without adding the port node in the
board-specific file.

> +		reg =3D <0x5a180000 0x10000>;
> +		clocks =3D <&lcd_clk_lpcg IMX_LPCG_CLK_0>,

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-dxl_lcdif-=
v2-0-da797562636e@nxp.com?part=3D4
