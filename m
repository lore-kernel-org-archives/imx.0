Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4EE3F7ABE;
	Thu, 28 May 2026 15:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983553; cv=none; b=VpGHDDmk3F2STnaNQRTj/Mit2dS0RQqss7UmlLBrohqQ5A2rtEmm/N6AnFk41RRBSwlQmI4HB3VBCH/oHsr+91Qugd97mfLWOpHPelZYVaFqQNTWZK6S3/zAg7nIb4v3djRHz2zNfP7g7sm/F0LdNiJdPZdRJyk4BnhnjWVip+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983553; c=relaxed/simple;
	bh=1A5sQQm5yPZlD4k43B44WY8eUObkS+y7s5behHVPZcg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rOp3tsIXMEPvYB7SfOQrpTzGDmUZnWqBvbTDyxWdmQist8GSist50tUZkGmbdJDANFwSKM9Ib1Z/xfkuZFW1bFae+cUl/oJ5CQVbpksnEmeB/4gWrRVMSuYUntdWLycC0RIEZ4lTBVmog67Vn7amJAoOYehAUzZVf//DrLKmUeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ArfZPjK+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ArfZPjK+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E911F000E9;
	Thu, 28 May 2026 15:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779983552;
	bh=ha+hQbUqX3NVhcDutcMGgJqcDxKUfTWgk2F+7Ar4kwI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ArfZPjK+JUJtK4B7Q+fdBrgQbhMoalfBaoLlSAcmu9/GX1RPuCMKkkyiObRxEwKzT
	 V9wanZHni2z6cXKb7aGAhzBXpX9xo84r7uA/iZ0K9YKSmIGtRSsiE+w4qO3POMHX+S
	 NlQ8BvfE0BE7XriqLqgcADECjE/TguEYR8viJ3SodZsDkA3EFsUFf7Sb6O/xUTvaup
	 ywZHVbZDY1zJVzqdG3gHyvaPsxydiTVi/9Rer/xdxT7JlaIlFoxYcmquePYe0f3gsz
	 siXYUKK2S8tHZ7O/viS3fxfqs7pON1nCsiVmxB+aGpCBgNQe+bOQXde/cMHN3wwiTD
	 eCkj8vCu8P45Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/1] arm64: dts: imx95-var-dart-sonata: add CAN
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260528152948.15209-1-stefano.r@variscite.com>
References: <20260528152948.15209-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 15:52:31 +0000
Message-Id: <20260528155232.02E911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Usage of `gpio1` for SPI chip select may cause a system hang due t=
o hardware firewall (TRDC) constraints.
- [Medium] Unused GPIO pin configuration in `pinctrl_can` due to missing `m=
icrochip,rx-int-gpios` property.
--

commit e57666610a0736f42a6e5698658a6a90dad0dada
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx95-var-dart-sonata: add CAN controller

This commit adds the MCP251xFD CAN controller to the Sonata carrier board
device tree. It updates the LPSPI7 chip selects and configures the
necessary pins and interrupts for the CAN node.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/ar=
ch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
> index 0f3d2e488f4a9..62133b40d64b2 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
> @@ -280,7 +280,8 @@ st33ktpm2xi2c: tpm@2e {
>  &lpspi7 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_lpspi7>;
> -	cs-gpios =3D <&gpio2 4 GPIO_ACTIVE_LOW>;
> +	cs-gpios =3D <&gpio2 4 GPIO_ACTIVE_LOW>,
> +		   <&gpio1 7 GPIO_ACTIVE_LOW>;

[Severity: High]
Does this direct gpio1 access risk triggering a hardware firewall violation?

On i.MX95, gpio1 is located in the AONMIX domain. The device tree include
arch/arm64/boot/dts/freescale/imx95.dtsi documents that gpio1 is under
the exclusive control of the System Manager.

Referencing it in cs-gpios causes the SPI core to use the standard MMIO-bas=
ed
gpio-mxc driver to access the controller directly. If the firewall
configuration isn't relaxed for the Non-Secure Linux domain on this board,
toggling this pin may result in an SError and kernel panic during boot.

[ ... ]

> @@ -306,6 +307,18 @@ ads7846: touchscreen@0 {
>  		ti,settle-delay-usec =3D /bits/ 16 <150>;
>  		ti,keep-vref-on;
>  	};
> +
> +	/* CAN controller */
> +	can0: can@1 {
> +		compatible =3D "microchip,mcp251xfd";
> +		reg =3D <1>;
> +		clocks =3D <&clk_osc_can0>;
> +		interrupt-parent =3D <&gpio5>;
> +		interrupts =3D <15 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_can>;
> +		spi-max-frequency =3D <12000000>;
> +	};
>  };

[ ... ]

> @@ -442,6 +455,13 @@ IMX95_PAD_GPIO_IO37__GPIO5_IO_BIT17				0x31e
>  		>;
>  	};
> =20
> +	pinctrl_can: cangrp {
> +		fsl,pins =3D <
> +			IMX95_PAD_GPIO_IO35__GPIO5_IO_BIT15				0x31e
> +			IMX95_PAD_GPIO_IO22__GPIO2_IO_BIT22				0x31e

[Severity: Medium]
Is IMX95_PAD_GPIO_IO22__GPIO2_IO_BIT22 intended to be used as a secondary
RX interrupt for the CAN controller?

It is configured here as an input, identical to the primary interrupt on
gpio5. However, the can0 node does not reference it.

If this pin is meant to act as the dedicated INT1 interrupt for the
MCP251xFD, the can0 node might be missing the microchip,rx-int-gpios
property. Without it, the driver falls back to single-interrupt mode,
which requires extra register reads to determine the interrupt source, and
leaves this pin's state unmanaged.

> +		>;
> +	};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528152948.1520=
9-1-stefano.r@variscite.com?part=3D1
