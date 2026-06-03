Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B26310651;
	Wed,  3 Jun 2026 13:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492989; cv=none; b=JIPWoiZ5OtRHgCG/O7mxs9JI+in29lFoc+tZMign2V9udb4H30jC8gfg/cTz9YiKAG9S1g/qv5vLSsnmoZSdRn8PT880iUAW1HUPncbyCZjAp0n7Kump63a8nygISOF5t61JG+aqF0QAx6/jOOfRiZaIirVOelcwY52TrMdTJjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492989; c=relaxed/simple;
	bh=+yF+tHbRfxzgu5n+5xF1YEHJp/6nbh+4/qITnXQIvd8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S+kIfx4Ug20d2oLSjnixWrf3wt18YSwHtPoW1JojMlP1LpHlZSqdS6YKicDe5ImfApAQDkW7TCc5wbIaHVYBehA18pcg7vSxOgQdhsqU1mzeH30nSGEfu1zNrhgctEZEsVN6z19L1v+LhihLMhfpDHLzuySeTHepp2vf7tWo3/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iD0jlQ0c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iD0jlQ0c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF7C1F00893;
	Wed,  3 Jun 2026 13:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780492988;
	bh=vEiDIIK40s/ysumqK6J++thBI87bU8a9yEVddcam5c4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iD0jlQ0cAQ7BVrAP/zrtHYk2DWJtyvMigquUvZcxahKtH5s2JdM/3I9uRVdVEmFsX
	 65CwbksyHHzqoA1LdUU/8PZEzY5JnImlJ3r0qBGCAGHkHCg7+Ibb6hOrnR4jttZHOA
	 NzNn2iI2h6g0VYcsZjHl9INZFJ7OX1oNNB2hj/LUVYqmUuC53zEjajVS4g07/evOqI
	 MJfo9hTftgk2QhQLdjm6I5XJIzkU6znmV4tCej64WvccFGVWekUG9RBLA83Ro1rJZ6
	 CCMaQKfMa35AzyOWakWicDNGS9V6ZnNPRzfACFDPq+AezH/C+0vBok0knCtHVWW1Am
	 bYEdcczvIRh1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/12] arm64: dts: imx8mp-var-som-symphony: enable
 PCIe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <9a937fa5f65dd23515d4e32f8a9cdbe5a674c9a7.1780492180.git.stefano.r@variscite.com>
References: <9a937fa5f65dd23515d4e32f8a9cdbe5a674c9a7.1780492180.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 13:23:06 +0000
Message-Id: <20260603132307.AAF7C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing PERST# reset signal configuration for the PCIe slot.
--

commit 2705091bb2c968ad6e44f8cd4b794c2f5e63b41c
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx8mp-var-som-symphony: enable PCIe
   =20
This commit adds the PCIe reference clock and enables the PCIe controller
and PHY nodes on the i.MX8MP Symphony carrier board.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/=
arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> index 9500c9bf0f421..a928dc2d9adce 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts

[ ... ]

> @@ -146,6 +152,17 @@ rtc@68 {
>  	};
>  };
> =20
> +&pcie {
> +	status =3D "okay";
> +};

[Severity: High]
Will this configuration successfully enumerate PCIe endpoints on the Sympho=
ny
carrier board without the reset-gpios property?

The Symphony baseboard typically routes the PCIe slot's PERST# signal to pin
1 of the pcal6408 I2C GPIO expander (as seen on the shared imx8mm symphony
board layout). Without configuring reset-gpios =3D <&pcal6408 1 GPIO_ACTIVE=
_LOW>;
here, the host driver in drivers/pci/controller/dwc/pci-imx6.c might not be
able to fetch and de-assert the reset signal.

Could this leave connected PCIe endpoint devices held in hardware reset?

> +
> +&pcie_phy {
> +	clocks =3D <&pcie0_refclk>;
> +	clock-names =3D "ref";
> +	fsl,refclk-pad-mode =3D <IMX8_PCIE_REFCLK_PAD_INPUT>;
> +	status =3D "okay";
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780492180.gi=
t.stefano.r@variscite.com?part=3D6
