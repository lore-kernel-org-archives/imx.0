Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8865F356777;
	Tue, 12 May 2026 23:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778627121; cv=none; b=mAaxk9IaJy9VzX0lD/erSE6MImLKQN+k0tKBbqRZqSFsmlpdfwRDCJRaaeWVv7oTrKiKwBbxuhOZiLnZX2NUdLKvxe/3Y900xSkK8ldK3/WsLN3SkFsLxQKLwlad1Q9I3fBvyEac86wye+bfdkILo+MfaqT83ZW6wAqyE0pjpCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778627121; c=relaxed/simple;
	bh=DK+7J33A7910JwFbWH+4GGnFPn1eunMdNSYAga957Wc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qR6AOJnqT8ZzBIbV+h6eN1gwzf/FmOfOH11eKzGJF9egDCEqywjBcSxb4a6xz0nb1j1ByA+z7kTBcZg5MTMxgnfJcnyilsXS/QhekUkHBp0buLFJTfACoxCtKKVZSs1zGe3A7+e40Unfy8Br+qhgIwZ6YS/8tmx8WKCplRvuf+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uS/BZoI9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uS/BZoI9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC642C2BCB0;
	Tue, 12 May 2026 23:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778627121;
	bh=DK+7J33A7910JwFbWH+4GGnFPn1eunMdNSYAga957Wc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=uS/BZoI95weEa3jFke426A2uK1R5djKpOfX8wMEuherRV/dHrfraU+ecpYeCtBPq4
	 ze3SArqdAwAWHpE9VCL1CHHfgJSjXR98spoJY1YTTgsb3kjtnKisqI6DSNmzrkN6iN
	 N82Wtqzbli52S3rH1GqjXbU+t4Ztt1cOGTJyeV7GvkylGlLEjajKM1XGqj32Ft2Sm5
	 NVuR2toZfXEO4wP+tMhtz/Osr2EwQmH4bflyXuYXO5lQ09AUargBQUqpJx1MxUFKJ+
	 oTYPEJnozoauTTV5FF7m+g/PvUu/yHSnrD2ihCbUPUqvczvJQys98/z9X9Giw+aCmc
	 H1aF/MuFYyPpQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: imx8dxl: Add SolidRun SoM and
 HummingBoard
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511-imx8dxl-sr-som-v4-2-64381b3bf80d@solid-run.com>
References: <20260511-imx8dxl-sr-som-v4-2-64381b3bf80d@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 23:05:19 +0000
Message-Id: <20260512230520.CC642C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] USB OTG1 port is configured as peripheral but breaks out to a Type=
-A host connector.
- [High] Inconsistent and incorrect pad configurations for I2C2 and I2C3 GP=
IO recovery pins.
- [Medium] The 'reset-duration-us' property in the 'usb-device@1' node is u=
ndocumented, unparsed by any kernel driver, and will fail schema validation.
- [Low] Mismatch in the number of 100Base-T1 add-on ports between commit me=
ssage and device tree.
--

commit f382c89d7dfc4938b73c73c681a3544f6363435e
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: imx8dxl: Add SolidRun SoM and HummingBoard

This commit adds support for the SolidRun i.MX8DXL System-on-Module and its
HummingBoard Telematics carrier board. It configures various hardware
interfaces including ethernet, CAN, USB, a cellular modem, and I2C sensors.

> The multi-interface add-on board connector provides additional
> interfaces (4x 100Base-T1, 2x SGMII, USB 2.0 shared with the cellular
> modem, CAN, MDIO, SPI, UART, PCIe, I2C, and GPIO).

This isn't a bug, but there is a mismatch between the commit message and the
device tree. The message mentions 4x 100Base-T1 interfaces, but the code
defines 5 disabled ports (port@5 through port@9) and 5 corresponding PHYs
for the add-on connector. Could the commit message be updated to match the
implemented ports?

> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-hummingboard-telematic=
s.dts b/arch/arm64/boot/dts/freescale/imx8dxl-hummingboard-telematics.dts
> new file mode 100644
> index 0000000000000..7e822cbd7a528
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl-hummingboard-telematics.dts

[ ... ]

> +&usbotg1 {
> +	vbus-supply =3D <&vbus1>;
> +};

Since the base SoM device tree sets dr_mode to peripheral, and the carrier
board does not override it to host or otg, will this controller remain in
peripheral mode?

Because this port breaks out to a USB Type-A connector on the evaluation ki=
t,
leaving it as a peripheral means it will not drive the VBUS regulator to
power attached devices. Should this be explicitly set to host mode here on
the carrier board?

[ ... ]

> +/* cellular modem */
> +&usbotg2 {

[ ... ]

> +	usb-device@1 {
> +		compatible =3D "usb2c7c,125";
> +		reg =3D <1>;
> +		reset-duration-us =3D <150000>;

Is this reset-duration-us property supported by any upstream driver or
documented in the device tree bindings?

Because it appears to be unparsed by any kernel driver, will its inclusion
cause schema validation warnings during the binding check?

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi b/arch/arm=
64/boot/dts/freescale/imx8dxl-sr-som.dtsi
> new file mode 100644
> index 0000000000000..93a0eb4d7f770
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi

[ ... ]

> +	i2c2_gpio_pins: pinctrl-i2c2-gpio-grp {
> +		fsl,pins =3D <
> +			/* io with pull-up and weak drive */
> +			IMX8DXL_SPI1_SCK_LSIO_GPIO3_IO00		0x00000021
> +			/* io with pull-up, weak drive, open-drain */
> +			IMX8DXL_SPI1_SDO_LSIO_GPIO3_IO01		0x02000021
> +		>;
> +	};

Do these GPIO values configure the pads correctly for I2C bus recovery?

The comments mention io with pull-up, but 0x00000021 and 0x02000021 both
lack the pull-up enable bits present in the active I2C configuration.

Additionally, does using 0x00000021 for SDA leave the open-drain bit unset?
Both lines generally must be open-drain during I2C bus recovery. If SDA is
actively driven high via push-pull while a stuck slave device pulls the line
low, can this cause an electrical short circuit on the bus?

[ ... ]

> +	i2c3_gpio_pins: pinctrl-i2c3-gpio-grp {
> +		fsl,pins =3D <
> +			/* io with pull-up and weak drive */
> +			IMX8DXL_SPI1_CS0_LSIO_GPIO3_IO03		0x00000021
> +			/* io with pull-up, weak drive, open-drain */
> +			IMX8DXL_SPI1_SDI_LSIO_GPIO3_IO02		0x02000021
> +		>;
> +	};

Does the same configuration issue apply to these I2C3 recovery pins as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-imx8dxl-sr=
-som-v4-0-64381b3bf80d@solid-run.com?part=3D2
