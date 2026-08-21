Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E05F3C2774;
	Fri, 21 Aug 2026 12:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315690; cv=none; b=Z1qiNHxX0pisPcxju2FPsN15p3id6H+PIsdZBFKy7J0vxL1xXT7c7qFJQEL/eVVU49A1Ow4aNPsZLaeSc9u0pg3nh7kABCAuyaVOAH8IrrtmTqtLEoQ33dzkZBsiE06lJXDNsDADHYSHUm0IAsGcb4o8jylo3J97SdhqL/AMZVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315690; c=relaxed/simple;
	bh=2kkKHBkv88IKU+xYcF4WPa4D6oErpPyRc/r+4J+1E/Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q0r+KH6Ti+KeKsiVgZhwa5DO4n4pZl3NiWNNW0CjPVWiSUAbZBUU5BgCbhMnKqgOEdRPnWsYm2HLKIZbVzpECQN6ZhEFVHitBFRx7S7GJs1EG8xu9Vn5qzPK2ZaySjMjvEXzM9k6qaWK6UXmiY7GITpThNO/xsA93PR2OqALZMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cIC/lNBv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cIC/lNBv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67271F00A3A;
	Fri, 21 Aug 2026 12:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787315689;
	bh=7AFkhrMCThyIII9/q9rulOXS6WokpvNvCXDBg9oxukc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cIC/lNBvl8Xmx/GpOhS9FclS86DpwvrYQf9wwzljsCfUVO1U0EgjA4aHnqTOQcCrE
	 KvgRUtPPaRgrQ70A5Id14V5r3Ng21aYPK5rOF3giyZyTXovK89bL5f4AEyoUNYTFny
	 WuAIEfIaNgwVvXNQrk+TAs/O88MZiIcdkm+MM3BlnH2iuaET9AQB9u4Jat4EqggF0z
	 NThlonjJoFtgQQl2yqscQm4UGs0w3QUHy7b5q9BoonaVEM/iQ6ovY4XiXGPedN5fDS
	 xxWY9Oar1nYXOpDp1374e93YJl+VfKiSQyDL5G6UCmwwKKhkxayhEz+iIf4gJbKKhZ
	 YR8bcHFhiYGYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] ARM: dts: imx7d: add Variscite MX7CustomBoard
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <af43fd35a6ccbcf633966a9b18f21832e8f44366.1787314780.git.stefano.r@variscite.com>
References: <cover.1787314780.git.stefano.r@variscite.com>
 <af43fd35a6ccbcf633966a9b18f21832e8f44366.1787314780.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 12:34:48 +0000
Message-Id: <20260821123448.A67271F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The V2 hardware revision variants with the WM8731 codec are miss=
ing, despite the commit message claiming to support them.

Pre-existing issues:
- [Medium] The `assigned-clock-rates` property is defined twice in the `&sa=
i1` node.
--

--- Patch [3]: [PATCH v1 3/3] ARM: dts: imx7d: add Variscite MX7CustomBoard=
 support ---
commit 453bab576a5d3f561e4803a647eb9654e584d623
Author: Stefano Radaelli <stefano.r@variscite.com>

ARM: dts: imx7d: add Variscite MX7CustomBoard support

Add device tree support for the Variscite MX7CustomBoard carrier board with
the VAR-SOM-MX7 system on module. This includes supported board configurati=
ons
for both VAR-SOM-MX7 hardware revisions (eMMC, NAND, and WM8731 variants),
and adds the resulting DTBs to the i.MX7D device tree Makefile.

Link: https://www.variscite.com/carrier-boards/var-mx7customboard/

> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/i=
mx/Makefile
> index 1a2539fa19b44..37da667f9ffb0 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -444,6 +444,12 @@ dtb-$(CONFIG_SOC_IMX7D) +=3D \
>  	imx7d-sdb-reva.dtb \
>  	imx7d-sdb-sht11.dtb \
>  	imx7d-smegw01.dtb \
> +	imx7d-var-som-emmc-mx7customboard.dtb \
> +	imx7d-var-som-emmc-wm8731-mx7customboard.dtb \
> +	imx7d-var-som-nand-mx7customboard.dtb \
> +	imx7d-var-som-nand-wm8731-mx7customboard.dtb \
> +	imx7d-var-som-v2-emmc-mx7customboard.dtb \
> +	imx7d-var-som-v2-nand-mx7customboard.dtb \

[Severity: Medium]
Are the V2 hardware revision variants with the WM8731 codec missing here?

The commit message states that configurations for both hardware revisions
include the WM8731 variants, but it seems there are no dtb targets (nor
source dts files) added for V2 with WM8731.

[ ... ]

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7custo=
mboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customb=
oard.dts
> new file mode 100644
> index 0000000000000..94c4b1fa5d6c3
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.=
dts
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * VAR-MX7CustomBoard for VAR-SOM-MX7 with eMMC and WM8731
> + *
> + * Link: https://variscite.com/carrier-boards/var-mx7customboard/
> + *
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
> + *
> + */
> +
> +/dts-v1/;
> +
> +#include "imx7d-var-som.dtsi"
> +#include "imx7d-var-som-emmc.dtsi"
> +#include "imx7d-var-som-wm8731.dtsi"

[Severity: Medium]
This is a pre-existing issue, but does the included imx7d-var-som-wm8731.dt=
si
file define the assigned-clock-rates property twice?

Looking at &sai1 in arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi:

&sai1 {
	assigned-clock-rates =3D <0>, <36864000>;
	assigned-clocks =3D <&clks IMX7D_AUDIO_MCLK_ROOT_SRC>,
			  <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;
	assigned-clock-parents =3D <&clks IMX7D_PLL_AUDIO_POST_DIV>;
	assigned-clock-rates =3D <0>, <12288000>;
	/delete-property/ fsl,sai-mclk-direction-output;
};

The assigned-clock-rates property is defined twice, which causes a device
tree compiler warning and ambiguity about which clock rates are intended.

Could this lead to incorrect clock configuration and non-working audio
when this file is included?

> +#include "imx7d-var-som-mx7customboard.dtsi"
> +
> +/ {
> +	model =3D "Variscite VAR-SOM-MX7 with eMMC & WM8731 on VAR-MX7CustomBoa=
rd";
> +	compatible =3D "variscite,var-som-imx7d-emmc-wm8731-mx7customboard",
> +		     "variscite,var-som-imx7d",
> +		     "fsl,imx7d";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787314780.gi=
t.stefano.r@variscite.com?part=3D3
