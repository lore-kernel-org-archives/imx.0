Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E272371873;
	Tue, 14 Jul 2026 14:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038581; cv=none; b=rpCfiGmpVpTnFTQ9EV7+07gldi78slnwN7xJ/hsz3cKRhDiVAazvAGWVGAYO8hXJv3WlMGlzyaVrufud8CznxsKK0bvuZnTYwmmdcIwiAXGhCwSQ2KNJb0m5lZ6hrWQ7KZlA4BjbB9nrnVgSi6K9ukkrldCRyX0H86tcFioD3VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038581; c=relaxed/simple;
	bh=I1F+k0/Ovc5VE6IAlEeHYCbNgycCUS0XXyO+te2mD5Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IT4/KSIhRYo6RZ+dN74D9WGZlw0lOI04kgl61JhideST5ngxhu8oC4qDiIQ6zKRXCBvrunsiUD7ZUZUIXnyXbZfbXmQQGphtO681O3AMYxlwdcLcfiKrJMR63t9nhZj879fM6F75Sre4ODdJUPOD1KdYn8sgbWL2vzgGgvAJwHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/ZYIeaW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/ZYIeaW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83751F000E9;
	Tue, 14 Jul 2026 14:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784038580;
	bh=lLVrfoXMGq8pQDepO4QNRhRo81VpqIrrZ3kRASH402U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D/ZYIeaWRZWR4oAvKCnt02vHGBIjNcsyER1J6y938lEN+U3kd1U2L7WRvtfYpIkqZ
	 Qk7tg+7us4IIe7oC/teKqx9equ+SFw7sbblwdlwQDQmfbKsi2qZsYb5h4bYMws5fyo
	 Q7u2uNbjCjghHyFoQTFM2WQY2WPyaSEDvLF1FO3qmML8WL8lqh0wxOPK/nFRzDhzEv
	 Vjn9EJWvYXAI39LvWeaVuTMVna8X6y7Dtb4qu30h7q/qZ52dydtv20r8l/ROiTwtMR
	 PySGrs/+qyi8a+EC/cBoRzNjidkbBsYn+SZyMLUxm0rAQ5lJ/nN8DdP6nVX0WJaz3p
	 qMsjdCYvVQnDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: imx8dxl-evk: add lcdif overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260714-dxl_lcdif-v1-6-6761a8a6592b@nxp.com>
References: <20260714-dxl_lcdif-v1-0-6761a8a6592b@nxp.com>
 <20260714-dxl_lcdif-v1-6-6761a8a6592b@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 14:16:19 +0000
Message-Id: <20260714141619.B83751F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Overwriting `fsl,pins` in `pinctrl_hog` drops required system pin =
configurations, breaking GPIO expander interrupts.
--

--- Patch [6]: [PATCH 6/6] arm64: dts: imx8dxl-evk: add lcdif overlay ---
commit 85ecae823587c53fd00cdb23710f7c3efd6f900e
Author: Frank Li <Frank.Li@nxp.com>

arm64: dts: imx8dxl-evk: add lcdif overlay

This commit adds device tree overlay support for the waiken,101wx001 LCD
panel on the imx8dxl-evk. It adds the overlay to the Makefile and
introduces the new .dtso file that disables conflicting peripherals and
reconfigures pinmuxes for LCDIF.

> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk-lcdif.dtso b/arch/=
arm64/boot/dts/freescale/imx8dxl-evk-lcdif.dtso
> new file mode 100644
> index 0000000000000..c0e573fb5f915
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk-lcdif.dtso
[ ... ]
> +&iomuxc {
> +	pinctrl_hog: hoggrp {
> +		fsl,pins =3D <
> +			IMX8DXL_COMP_CTL_GPIO_1V8_3V3_GPIORHB_PAD  0x000514a0
> +		>;
> +	};
> +};

[Severity: High]
Does this unintentionally overwrite the base device tree's fsl,pins array f=
or
pinctrl_hog?

Because device tree overlays replace array properties instead of merging
them, redefining fsl,pins in pinctrl_hog to resolve a pin conflict will drop
the other pins defined in the base tree's 4-pin array.

Specifically, this deletes the mux configurations for
IMX8DXL_COMP_CTL_GPIO_1V8_3V3_GPIORHK_PAD and
IMX8DXL_SNVS_TAMPER_OUT1_LSIO_GPIO2_IO05_IN.

Since LSIO_GPIO2_IO05 serves as the interrupt line for the pca6416_3 I2C GP=
IO
expander, will dropping this configuration break all interrupts routed thro=
ugh
the expander?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-dxl_lcdif-=
v1-0-6761a8a6592b@nxp.com?part=3D6
