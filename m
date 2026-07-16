Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65AB26738C;
	Thu, 16 Jul 2026 06:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784182419; cv=none; b=r/9LoUYgfad1jdDdbPvAdg+wnqPWgSl+OiSx3bps+w+fCBrqbQ1HkONMOoQzd/PzxjxHedsh/zTK9dedouCZ7eT3F2mGZcwffC8iQoiT9yYIxF9bbtV45aaAwpAHqTEtBtd1zDk16oy6zyrvxjdUtiZqLrPmT7SgEWaUML8Md3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784182419; c=relaxed/simple;
	bh=/MRXxWIRdHtoIUCGxso6s740vZJV8uYTVGeUd4V99oM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iI6abWeYXcYfsfXCzVlJOfG0BEvMYq/3WUlvo5CYgeHuOGXrmwYM5xMnGk+iWHSNOxCeIsBDm1vamjm6me/WbJqrv+KzuGTHSOYVpjnulE43gLNYPRYCs9ypYPDj2y3GCgVWQx+6Ksvax2VFZRdRKhL42v+2IHk450OJUXQRZ4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZr9u2o5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZr9u2o5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 179F61F000E9;
	Thu, 16 Jul 2026 06:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784182418;
	bh=p48mZrj9SGmjyp+clytkulBFyEgCdsVBVHKJJbjliQk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZZr9u2o5WWwmX1xoB13h8CaMiPg4DxZliyuCbPdLjtmNu7+u7pxe2jU472p6Z+1ML
	 8zvFrizH6V8Vkyo5/5rUp7qfYS4qGaRzWNOEhLnAj5tIyEJmBdqH/VNcN1qzA27h4n
	 KFuuEMtyRPz/GMzQ2IdZGWZPWtFmAJyRm3eeu9gYATwmwUTwXHa6DcSGxf8nTQIC4L
	 cB3iQLM5VMe26SYaBxujSIXcJJGzZBKeIl4roLQ+nMHnzDhWG22mhzAMVsiHwZFKBX
	 BTcw0DNYkS49q67kHnkBVleG83P4ykrjuYHUvicQK4GJEh17GCWJUIpIIxEIMw7fNJ
	 amzK9mTO2m7CQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/6] arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for
 Data Modul i.MX8M Mini and Plus eDM SBC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260716055751.279033-5-marex@nabladev.com>
References: <20260716055751.279033-1-marex@nabladev.com>
 <20260716055751.279033-5-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 06:13:37 +0000
Message-Id: <20260716061338.179F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Device Tree node collision and potential I2C address conflict on `=
io-expander@20`.
--

--- Patch [5]: [PATCH v5 5/6] arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for=
 Data Modul i.MX8M Mini and Plus eDM SBC ---
commit b8816aeaca7378ddfdc8544c5eb07a316a35281c
Author: Marek Vasut <marex@nabladev.com>
Subject: arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for Data Modul i.MX8M Mi=
ni and Plus eDM SBC

This patch adds a Device Tree overlay for the eDM-MOD-iMX8Mm-FIO1 feature=20
connector expansion module. It provides additional UARTs, CAN, PWM Beeper,=
=20
I2C, SPI, and GPIO breakout for the Data Modul i.MX8M Mini and Plus eDM SBC.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-fio1.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-mo=
dul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi
> new file mode 100644
> index 0000000000000..7851ca73ccd8e
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
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_gpio_expander>;
> +		reg =3D <0x20>;

[Severity: High]
Will this overlay conflict with the baseboard when applied to the i.MX8MP?

The i.MX8MP baseboard (arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-=
sbc.dts)
unconditionally defines an LVDS IO expander on the same I2C bus:

	gpiolvds: io-expander@20 {
		compatible =3D "nxp,pca9554";
		reg =3D <0x20>;
		...
	};

When this overlay is applied, won't gpio_feature: io-expander@20 merge into
gpiolvds: io-expander@20 and silently overwrite properties like gpio-line-n=
ames
and interrupt assignments, breaking both configurations?

Additionally, if both the baseboard LVDS PCA9554 and the FIO1 expansion
module PCA9554 are physically present, will they cause a hardware collision=
=20
on the I2C bus at address 0x20 and fail to probe?

> +		#gpio-cells =3D <2>;
> +		gpio-controller;
> +		#interrupt-cells =3D <2>;
> +		interrupt-controller;
> +		interrupt-parent =3D <&gpio4>;
> +		interrupts =3D <27 IRQ_TYPE_LEVEL_LOW>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716055751.2790=
33-1-marex@nabladev.com?part=3D5
