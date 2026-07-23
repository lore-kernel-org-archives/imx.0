Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E00D1F4181;
	Thu, 23 Jul 2026 07:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784791517; cv=none; b=k3pCC+WNa/iFX2vsYizHzEv45YRmJD4MD7uFk6Do/hVoGTw/NSg1KSfuxnc5UXSNfrxdCXdqceN1SYzBe1TvlSapEq1GL3FjA9jH1brAL0UFWr/mS3BxPrVpyOIyy5S3krkB1JVMdx3NMvU/eA+srAPevQgg08x9xJ1nsJ/dGI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784791517; c=relaxed/simple;
	bh=uFgVhRaWZwsLFlY0H5HZXuMWdn7i+N2PWgqfwCk6wMA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BL2+5npLknEfBdaUKT45VuSdgl0+6DRmxXEIX4HQsICZGWvsr855tlvN6Y8pOLNdyNvhUXo6nLh0KqPlK8vHWAEX1VF49O68d+hYstgnvFrLi5nYv8cdAJmszvJ4pL/l5qlDcasr8mxiX2nvubt0i81dNcYlFuHXPGHnhJtKZMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ore4WLTG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ore4WLTG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 713B51F000E9;
	Thu, 23 Jul 2026 07:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784791515;
	bh=PkojvKi0n1Y0dt2OmkKwjijlmwlhFzuu1C3U3MWMpc8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ore4WLTGzlCWsBA5lhgO9Atk0IywIicrGcTsOLiqQX3EO9w8qmOXRHqwODLnL3fnl
	 bDakwMpMqYmpW1WM45okYQaCPou/3GHy2slIoD8AtOqPQ7+ie6b2Eot3sRw1eyD6Hm
	 KUTTpeN4Uwa+aR9jag2Nw3nbBjMjf0htqA8Vh7YhzF8YNrYtK96nQn+rS5ZbRITDkv
	 FDMDK7T67LWOqWDI2vReKNT+RU6KHGzmkjzbXtWUeypjPJtIDir4eeRIit3tsAt7Fo
	 IrcB/QTW0kippRlcvStG29rvZ8mCvt+fZgViLC9capJPcT32+GGxgUptjcaTDfamYf
	 6VakEdNc6v8wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: imx93: Add i.MX93 Wireless FRDM
 board support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Guo" <qijian.guo@nxp.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260723-imx93w_frdm-v2-3-b108a76b2e40@nxp.com>
References: <20260723-imx93w_frdm-v2-0-b108a76b2e40@nxp.com>
 <20260723-imx93w_frdm-v2-3-b108a76b2e40@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 07:25:14 +0000
Message-Id: <20260723072515.713B51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The device tree fails to configure the Bluetooth reset and wake =
pins documented in the commit message, leaving the inherited Bluetooth node=
 broken.
- [Low] The commit message contains a copy-paste error in its hardware diff=
erences table headers.
--

--- Patch [3]: [PATCH v2 3/3] arm64: dts: imx93: Add i.MX93 Wireless FRDM b=
oard support ---
commit 92706a692f2e24d9485918053962b1a10410a0ca
Author: Joseph Guo <qijian.guo@nxp.com>

arm64: dts: imx93: Add i.MX93 Wireless FRDM board support

This adds support for the i.MX93 Wireless FRDM board, reusing the
imx93-11x11-frdm-common.dtsi with board-specific changes. It updates pin
connections and functionality differences, mainly for WIFI/BT and I2C3.

> Pin connection differences:
> Function  Signal name   i.MX93W EVK             i.MX93 EVK

[Severity: Low]
This isn't a bug, but there's a copy-paste error in the table headers.
Should these be FRDM-IMX93W and FRDM-IMX93 instead of EVK?

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx93w-frdm.dts b/arch/arm64/b=
oot/dts/freescale/imx93w-frdm.dts
> new file mode 100644
> index 0000000000000..766e942fe6638
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93w-frdm.dts
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include "imx93w.dtsi"
> +#include "imx93-11x11-frdm-common.dtsi"
> +
> +/ {
> +	model =3D "NXP i.MX93W FRDM board";
> +	compatible =3D "fsl,imx93-wireless-frdm", "fsl,imx93";
> +};
> +
> +&iomuxc {
> +	pinctrl_lpi2c3: lpi2c3grp {
> +		fsl,pins =3D <
> +			MX93_PAD_GPIO_IO00__LPI2C3_SDA			0x40000b9e
> +			MX93_PAD_GPIO_IO01__LPI2C3_SCL			0x40000b9e
> +		>;
> +	};
> +};

[Severity: Medium]
Does this board-specific device tree need to include node overrides for
&bluetooth to configure the reset and wake pins documented in the commit
message?

The commit message notes that IND_RST_NB uses GPIO_IO28 (which was freed up
by rerouting I2C3), but there is no &bluetooth node override assigning it to
reset-gpios. Could this leave the inherited Bluetooth peripheral in reset
and broken?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-imx93w_frd=
m-v2-0-b108a76b2e40@nxp.com?part=3D3
