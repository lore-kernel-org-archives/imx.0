Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A70266581;
	Thu, 16 Jul 2026 06:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784183037; cv=none; b=XEIaLY4J1qg/v7sOHB6WHZkxA3bMzzbOQ6iyjY/RnV57AS/tbIDRldd4RGPOWGWWEnvUetlIG9oOGWwFBQsKWCXyUjNDi3/r2wuM7aX24LAfr+hL7W05ozG7SXYXteTp2MSKl+hR7EoZI7RFeEYp2xk//q3GwjpG2CzRQWJzUlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784183037; c=relaxed/simple;
	bh=kjeNY9ffHru+thH6rbWr3PIt9OlxPctWOcSFAHUw0b0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eMh3gqlFL7lY6XaQcJ6bfDgPljYjfGLelPmH+Xn2C/AI/jMuk+ople8SLGcAucObppxHTrSJTy8Hrcezx/R3mUsNyeMW36PU+kXeoVfJrqS4MD1b/3vJG0sT6a+KErMnAXSZJNDTDvQXNARoXMPzNCEkbZHo6GL/JVHKuzSdPGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DBlg45Km; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DBlg45Km"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C23D1F00A3A;
	Thu, 16 Jul 2026 06:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784183035;
	bh=ETn+EA3YgNuLgLXINfOE3oUs7s3Ol7K8ENMkm0MDCHk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DBlg45Km+RZEunflYYqNb1RfjrA2JVh7JVodJqb+yzAkBK1aIBnm+mKj4OsgdjbOB
	 8Jv7+lBnRw3N/6s38iaPnPt7VNkQTf7EdJWZEW0gQQbara1shGKx0znbl4jq03O+20
	 w0xaH8YRf0gQRm3fGHDRQpyB8mFwPWypzN0J48aLeDJxnqdGm8wq4hCj7iAGeVRM3I
	 fLbeNGelvLZyAod21VZwJJFsoLYZqSCkWQ+AGhWmNUx1x5qXlMzapbHN7uYAuAXKbA
	 Fa1CUeXQOuiU9m1tBn0ZfKla9Xbluk+WyH4klhiOmS/YZwa+MYhAT2+WEvkVBunfbT
	 1RzbZmn3w3tyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/6] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs
 for Data Modul i.MX8M Mini and Plus eDM SBC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260716055751.279033-6-marex@nabladev.com>
References: <20260716055751.279033-1-marex@nabladev.com>
 <20260716055751.279033-6-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 06:23:50 +0000
Message-Id: <20260716062354.9C23D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Incorrect GPIO interrupt pin mapped for PCA9554 IO Expander on i.M=
X8MP
- [High] Broken RS485 UART configuration and pinmux RTS conflict on i.MX8MP
- [Medium] Device Tree node collision and duplicate unit address for SAI5 c=
lock controller
- [Low] Missing PWM Beeper feature implementation contrary to commit message
--

--- Patch [6]: [PATCH v5 6/6] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DT=
Os for Data Modul i.MX8M Mini and Plus eDM SBC ---
commit 44a6d32ca342c6e20d4887379001b4de1904a3f8
Author: Marek Vasut <marex@nabladev.com>

arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.MX8M Mini =
and Plus eDM SBC

Add DT overlay for feature connector expansion module eDM-MOD-iMX8Mm-FIO1-A=
udio
providing additional UARTs, CAN, PWM Beeper, I2C, SPI, GPIO breakout and
SGTL5000 codec. This adapter can be optionally populated onto the eDM SBC.

> providing additional UARTs, CAN, PWM Beeper, I2C, SPI, GPIO breakout and
> SGTL5000 codec.

[Severity: Low]
The commit message states that the overlay provides a PWM Beeper, but I do =
not
see a pwm-beeper compatible node or PWM configuration added in these new fi=
les.

Is this feature missing from the patch, or should the commit message be
updated?

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-fio1-audio.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-d=
ata-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi
> new file mode 100644
> index 0000000000000..c622213c12747
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm=
-mod-imx8mm-fio1-audio.dtsi

[ ... ]

> +	gpio_feature: io-expander@20 {
> +		compatible =3D "nxp,pca9554";
> +		reg =3D <0x20>;
> +		#gpio-cells =3D <2>;
> +		gpio-controller;
> +		#interrupt-cells =3D <2>;
> +		interrupt-controller;
> +		interrupt-parent =3D <&gpio5>;
> +		interrupts =3D <4 IRQ_TYPE_LEVEL_LOW>;

[Severity: High]
This hardcodes the PCA9554 interrupt to &gpio5 4 for both platforms. While =
this
routes correctly on i.MX8MM, doesn't the i.MX8MP SOM route this external
connector pin to &gpio1 8?

Since the i.MX8MP dtso doesn't override these properties, will the IO expan=
der
listen on the wrong pin and miss interrupts on the i.MX8MP?

[ ... ]

> +&uart2 {	/* RS422 J12 */
> +	linux,rs485-enabled-at-boot-time;
> +	uart-has-rtscts;
> +	status =3D "okay";
> +};

[Severity: High]
Applying the RS485 properties to &uart2 works for i.MX8MM, but doesn't i.MX=
8MP
use &uart1 for its RS485 port?

Could this leave &uart1 unconfigured on i.MX8MP while applying invalid
properties to &uart2?

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-fio1-audio.dtso b/arch/arm64/boot/dts/freescale/imx8mm-d=
ata-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
> new file mode 100644
> index 0000000000000..4a02bd026ac16
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm=
-mod-imx8mm-fio1-audio.dtso

[ ... ]

> +&spba2 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	sai5clk: clock-controller@30050000 {	/* SAI5 */

[Severity: Medium]
Is it intentional to create a new clock-controller node here?

This unit address overlaps with the existing sai@30050000 node in the base
i.MX8MM dtsi. Because the node names differ, dtc will create two duplicate
nodes, which can cause an -EBUSY resource conflict during probe.

Should this modify the existing &sai5 node instead?

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-fio1-audio.dtso b/arch/arm64/boot/dts/freescale/imx8mp-d=
ata-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
> new file mode 100644
> index 0000000000000..90c2dd1e67248
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm=
-mod-imx8mm-fio1-audio.dtso

[ ... ]

> +	uart1-grp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_SD1_CLK__UART1_DCE_TX		0x49
> +			MX8MP_IOMUXC_SD1_CMD__UART1_DCE_RX		0x49
> +			MX8MP_IOMUXC_SD1_DATA1__UART1_DCE_CTS		0x49
> +		>;
> +	};

[Severity: High]
The base i.MX8MP board uses SAI2_RXD0 for the UART1_DCE_RTS pin. Since this
audio overlay reclaims SAI2_RXD0 for audio, it drops the RTS pin from this
uart1-grp.

Without the RTS pin to control transceiver direction, will the RS485 hardwa=
re
on i.MX8MP still be functional?

[ ... ]

> +&spba5 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	sai5clk: clock-controller@30c50000 {

[Severity: Medium]
Similar to the i.MX8MM overlay, this creates a new node that overlaps with =
the
existing sai@30c50000 node in the i.MX8MP base tree.

Could this cause duplicate nodes to be generated and lead to resource confl=
icts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716055751.2790=
33-1-marex@nabladev.com?part=3D6
