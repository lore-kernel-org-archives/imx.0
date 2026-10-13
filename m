Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B294E36C9;
	Tue, 13 Oct 2026 11:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890997; cv=none; b=Sn58hVO8IGdQa+et18fkehoqIaZurMjRYnnVmUfjHbwA6OGm16myYfhT0OVxCFMc6ObdpTuaqt/OLMoePNGR6U3831FGQlfQRDZbfggaOqvO3zmuTVOpjcByCWoni9nguRGMdfbkUhvTtkPaLdBJmmtWRYcIbnMWYTQ9kCzUd+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890997; c=relaxed/simple;
	bh=bHaRHBzr9vYzN0OxH/XkBTGm3Jclt56DR+mfMHziyOw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=k/gOcm2m10Tz+MDaP5TtyT04NVACYLe22dyxkdv2hueKGjDylW+sg+e4d0/E303enwQb00nAOTK7B+FGSyVGfiKPb1GLJNgLLExr9Gxz4n4RRZfr+cy1+Fdsu4p3nHJxq5gFmYTDztKDMrckqgjaxzaPlgrul8cAw67SGBmM5zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZIM3pzWH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZIM3pzWH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91301F000FF;
	Tue, 13 Oct 2026 11:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791890996;
	bh=vD6tXUZ0PJiUIUFf3AtKlJJxHo5XXK8AE2SuPoYzLEQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZIM3pzWHrAGpz9o1fHWHKyYjtDuOF78vh+O34kaHMziuATPyCNFsL+vWgvYgkZBpz
	 afPozNANYOxdJbb7tgpLb9TfV0HG4IKjOA99oTvwSp2mYBv6dH/FMVMacDyJtVpvNY
	 oS7XYEU4Y4GpsbhmADuJz7q8Rbvsn+BhvcYz+ZGiPAloR8UXptGGOk/c5x3swy/G1v
	 WXw8jG8etBGJ6NVZM5wl+pC2qypffPjywdPXQ5l7CPGl6QDfMSvTp8lBLSR5yzOm96
	 LcfMW6agHBAp47r/AC0oUtvphS8MhTQrRTq0MbTEXsubzknk1DyutCJ+QJlb0HT75M
	 /Iq1YxLefHAdw==
Message-ID: <sashiko-outbox-169627@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: imx8qxp: Add display controller
 subsystem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261013111737.998282-3-alexander.stein@ew.tq-group.com>
References: <20261013111737.998282-1-alexander.stein@ew.tq-group.com>
 <20261013111737.998282-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 11:29:55 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] arm64: dts: Missing power-domains and compatible override for dc=
0_irqsteer
--

commit ae70e9d2f5935bf44872ed0bd30be554653b06e0
Author: Liu Ying <victor.liu@nxp.com>

arm64: dts: imx8qxp: Add display controller subsystem

Add display controller subsystem in i.MX8qxp SoC.

> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi b/arch/arm64/=
boot/dts/freescale/imx8-ss-dc0.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
[ ... ]
> +dc0_subsys: bus@56000000 {
[ ... ]
> +	dc0_irqsteer: interrupt-controller@56000000 {
> +		compatible =3D "fsl,imx-irqsteer";
> +		reg =3D <0x56000000 0x1000>;
> +		interrupt-controller;
> +		interrupt-parent =3D <&gic>;
> +		#interrupt-cells =3D <1>;
[ ... ]
> +		clocks =3D <&dc0_lis_lpcg IMX_LPCG_CLK_4>;
> +		clock-names =3D "ipg";
> +		fsl,channel =3D <0>;
> +		fsl,num-irqs =3D <512>;
> +	};

[Severity: Medium]
Is the dc0_irqsteer node missing a power-domains property?

If it lacks power-domains =3D <&pd IMX_SC_R_DC_0>;, could this trigger a bus
fault (SError) during boot or suspend/resume cycles if the irqsteer driver
accesses its registers when the IMX_SC_R_DC_0 power domain is off?

> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi b/arch/arm6=
4/boot/dts/freescale/imx8qxp-ss-dc.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
> @@ -0,0 +1,236 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +&dc0 {
> +	compatible =3D "fsl,imx8qxp-dc";
> +};

[Severity: Medium]
Should there be an override for &dc0_irqsteer in this file to set its
SoC-specific compatible string?

For example, setting compatible =3D "fsl,imx8qxp-irqsteer", "fsl,imx-irqste=
er";
here would ensure the node matches correctly. Omitting the SoC-specific
compatible string might mask the missing power domain violation from
dtbs_check and prevent SoC-specific driver quirks from applying.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013111737.9982=
82-1-alexander.stein@ew.tq-group.com?part=3D2
