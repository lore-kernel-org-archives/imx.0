Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7674E483BEB;
	Tue,  4 Aug 2026 17:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785864020; cv=none; b=G4yjxNxjMrM5orjVwlvTI/XuqLPuScEvOYcEZ/e9rSmZ5KmIZdZARnurg3Y0xWuuFrsBxFkHD/i2xU+YegNuFB47vYw9hoeuFG31L3e/c0tNABwvY3SCDg/v0BOOc6AiC19NXdv8QzYrR38M74dx7iKCAxpiz1y/I71pUEya4E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785864020; c=relaxed/simple;
	bh=yn9q/LQUUuTE73/CA/xqzXBtHuQ1kZpXfDRBwehXd/g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rsld9qNpCpKlAEqKasbrQaHDpnMzYGtArf7ZBObSbPM8kFPlazBKhzSGkSHgUs2iUN0Cluj24GirD3JYwbqTOXWF6rwy/dlJGsyLUj11AalCylvtAVUgugyl9b+WaTVFILZwzh+BIkOdoh41vLkxERX/ybG+XB1K5ClJ5p1/toM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSrJ+a2E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSrJ+a2E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3C51F000E9;
	Tue,  4 Aug 2026 17:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785864011;
	bh=WESL2TVF/PZW3BVZnHuChAg7+wBXDd2q5pCQuz/jxwk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DSrJ+a2E1VlK1dUrQ2ZWCxanePat7CgyrhEWJdC0K0GUaBjAveBWZX3G9hgG07Jo0
	 H7gErs/goS48nvx4qpUAAAaP1DLUfLX8Y4yKBfEV3F7FThRVfnadZBYevETiiiJCiu
	 7UjevMW3Njfc5OWv3SLR9fD0vtoXwoHy6NECnxrc84tFPzfa/OmRyN2EO0DFj3KKPB
	 eSzoXiQGi8KiOO9Ud4A8GltmdH1C++p6VuptmIJQf4DVNfdnuB22eI2qah+HIoYhGo
	 iuPWypbjIsIfBK4ABBz6bNzXvTN/iCmIEM9JiwMJAhSYkhq+KdNNdSblKL+UQ+yzfS
	 KNfH3XW+m7UFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 6/7] arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for
 Data Modul i.MX8M Mini and Plus eDM SBC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260804162310.24374-6-marex@nabladev.com>
References: <20260804162310.24374-1-marex@nabladev.com>
 <20260804162310.24374-6-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 17:20:10 +0000
Message-Id: <20260804172010.CD3C51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Device Tree node collision and hardware I2C address conflict for i=
o-expander@20 on i.MX8MP.
- [High] Incorrect UART role configuration for RS485 on i.MX8MP.
--

--- Patch [6]: [PATCH v9 6/7] arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for=
 Data Modul i.MX8M Mini and Plus eDM SBC ---
commit a7ddf5cabeef2078bf36b166e42e85f54f0b7289
Author: Marek Vasut <marex@nabladev.com>

arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for Data Modul i.MX8M Mini and Pl=
us eDM SBC

This commit adds a Device Tree overlay for the eDM-MOD-iMX8Mm-FIO1 feature
connector expansion module. The adapter provides additional interfaces like
UARTs, CAN, PWM Beeper, I2C, SPI, and GPIO, and can be optionally populated
onto the eDM SBC.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-fio1.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-mo=
dul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi
> new file mode 100644
> index 0000000000000..905db21d57c21
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm=
-mod-imx8mm-fio1.dtsi

[ ... ]

> +&i2c_feature {	/* Feature connector I2C */
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	gpio_feature: io-expander@20 {
> +		compatible =3D "nxp,pca9554";
> +		reg =3D <0x20>;

[Severity: High]
Does this cause a device tree node collision on the i.MX8MP?

When this shared FIO1 overlay is applied to the i.MX8MP baseboard, it
appears this will overwrite the statically defined gpiolvds: io-expander@20
node on the &i2c2 bus (aliased as &i2c_feature).

This would replace the LVDS GPIO line names and interrupt configurations wi=
th
the FIO1 configurations, potentially breaking the LVDS expander controls.

Also, does physically connecting the FIO1 expansion board to the i.MX8MP SBC
cause a hardware I2C address collision at 0x20 on i2c2?

[ ... ]

> +&uart1 {	/* J500/J501 */
> +	status =3D "okay";
> +};
> +
> +&uart2 {	/* RS485 J302/J303 */
> +	linux,rs485-enabled-at-boot-time;
> +	uart-has-rtscts;
> +	status =3D "okay";
> +};

[Severity: High]
Are these UART role configurations correct for both i.MX8MM and i.MX8MP?

The shared overlay hardcodes &uart2 as RS485 and &uart1 as standard UART,
which is correct for i.MX8MM. However, the i.MX8MP baseboard appears to
rely on &uart1 for RS485 and &uart2 for standard UART.

Applying this shared overlay to i.MX8MP might improperly enable RS485 on
&uart2, causing it to try to toggle RTS as RS485 transmit enable (breaking
hardware flow control), while leaving the actual RS485 port (&uart1)
misconfigured.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804162310.2437=
4-1-marex@nabladev.com?part=3D6
