Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D36A371D10;
	Fri, 19 Jun 2026 10:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781864168; cv=none; b=Zqyx0QQHqXw+2rXll5SYSLlPWVtF2yEn2PYGy0JvHS09QJSutjcz5izq9sy7/5o16nOzHxgJVSfWver2ZppjoMhIxSwJiShrfIyH//SPg4GZ3SjUvoBqreczAZlVZ/T6z0xR/9ipJMUbFERIPaTTB//ygpJOGV53/58d+fKG4LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781864168; c=relaxed/simple;
	bh=4u5eWcXUr8klnjD2kI151oO5aH+6uQxQpnxnW8xaxpc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P3vWjdpMGmCeXSpvBTNJmlH5FisW54J2BiQm2qY+SyuT8oUHtXu2hZNPEUljDMtmpRMzB3kKbOhNDbdR9i2lLkeHgRG94PveQjA0Kmy8lIwl1j/Bt56ThSVCBv6Zge5gWS4exQhaouhGMVee3Gl0K9N/YiYW/WFimVe4Va8sv6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PSUnBQJx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PSUnBQJx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0BC81F000E9;
	Fri, 19 Jun 2026 10:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781864164;
	bh=y7TtmI5QGk3KSn27n86DgAP2chB0E5IgJY7kvxKmGPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PSUnBQJxSFP5sVueqqObJ8Eli+bRqMvhdXIOwi1yuEqgSpwk/t12KXGItgc5RcylP
	 heluM27jNj11SVusn9cWiljTmlL4+eIrHGCuP15QBR/upExxoZM6tV4JtfRMtLXl5o
	 XTmElfcxZMmt15rijaLi/2P35YTqvaFEs7krppAPHmbvCSn2vlM/a19+4PSoBAdQ1V
	 /WmPLpG1uzsg6v+NWuQB9balaXbC2qGW4MsIyzMbW7xEhUo39GLgXsvsTQ3Ki/K2Vo
	 XKsahifM9FRH04rXl6dYQJZGoWLihh1B/XDj3q1CQgsXpRpr2sst9fBjL/bmI8FuGB
	 E1xyzjl0Kgy+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] arm64: dts: imx8mq-evk: Add OV5640 camera
 support via overlays
Reply-To: sashiko-reviews@lists.linux.dev
To: robby.cai@oss.nxp.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260619100532.3779934-2-robby.cai@oss.nxp.com>
References: <20260619100532.3779934-1-robby.cai@oss.nxp.com>
 <20260619100532.3779934-2-robby.cai@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 10:16:03 +0000
Message-Id: <20260619101603.C0BC81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Dual camera setup fails due to shared reset GPIO exclusivity causi=
ng `-EBUSY` and unexpected hardware resets.
- [Medium] Overlay-specific pinmux configurations and unconditional hogs po=
llute the base device tree.
--

commit d401c57ae9a7ef9c71733905b73812d521acf9a9
Author: Robby Cai <robby.cai@nxp.com>

arm64: dts: imx8mq-evk: Add OV5640 camera support via overlays

This patch adds device tree overlays for single and dual OV5640 camera
setups on the i.MX8MQ EVK board. It configures media pipelines for CSI1
and CSI2, noting that both sensors share a common reset GPIO and MCLK
source.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk-ov5640-csi1.dtso b/=
arch/arm64/boot/dts/freescale/imx8mq-evk-ov5640-csi1.dtso
> new file mode 100644
> index 0000000000000..1e9931802cdc4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk-ov5640-csi1.dtso

[ ... ]

> +	camera@3c {
> +		compatible =3D "ovti,ov5640";
> +		reg =3D <0x3c>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_camera1_pwdn>;
> +		clocks =3D <&clk IMX8MQ_CLK_CLKO2>;
> +		clock-names =3D "xclk";
> +		assigned-clocks =3D <&clk IMX8MQ_CLK_CLKO2>;
> +		assigned-clock-parents =3D <&clk IMX8MQ_SYS2_PLL_200M>;
> +		assigned-clock-rates =3D <20000000>;
> +		powerdown-gpios =3D <&gpio1 3 GPIO_ACTIVE_HIGH>;
> +		reset-gpios =3D <&gpio1 6 GPIO_ACTIVE_LOW>;

[Severity: High]
Is it safe to assign this reset GPIO (&gpio1 6) when it is also assigned
identically in the CSI2 overlay?

Since the GPIO framework enforces exclusive access, won't the second camera
to probe fail with -EBUSY?

Additionally, when ov5640_powerup_sequence() toggles this shared reset line
during power-on, couldn't this silently hard-reset the other active camera
and break its stream?

> +		DOVDD-supply =3D <&sw4_reg>;
> +		AVDD-supply =3D <&reg_2v8>;
> +		DVDD-supply =3D <&reg_1v5>;

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk-ov5640-csi2.dtso b/=
arch/arm64/boot/dts/freescale/imx8mq-evk-ov5640-csi2.dtso
> new file mode 100644
> index 0000000000000..fd247b3b59825
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk-ov5640-csi2.dtso

[ ... ]

> +	camera@3c {
> +		compatible =3D "ovti,ov5640";
> +		reg =3D <0x3c>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_camera2_pwdn>;
> +		clocks =3D <&clk IMX8MQ_CLK_CLKO2>;
> +		clock-names =3D "xclk";
> +		assigned-clocks =3D <&clk IMX8MQ_CLK_CLKO2>;
> +		assigned-clock-parents =3D <&clk IMX8MQ_SYS2_PLL_200M>;
> +		assigned-clock-rates =3D <20000000>;
> +		powerdown-gpios =3D <&gpio1 5 GPIO_ACTIVE_HIGH>;
> +		reset-gpios =3D <&gpio1 6 GPIO_ACTIVE_LOW>;

[Severity: High]
This assigns the exact same reset GPIO (&gpio1 6) as the CSI1 overlay,
which can cause probe contention and hardware state corruption as described
above.

> +		DOVDD-supply =3D <&sw4_reg>;
> +		AVDD-supply =3D <&reg_2v8>;
> +		DVDD-supply =3D <&reg_1v5>;

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx8mq-evk.dts
> index d48f901487d49..1260bb1d9069b 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts

[ ... ]

> @@ -532,12 +546,34 @@ &wdog1 {
>  };
> =20
>  &iomuxc {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_mclk>, <&pinctrl_camera_reset>;

[Severity: Medium]
Does unconditionally hogging these camera-specific pins in the base device
tree unnecessarily consume GPIOs when the optional camera overlays are not
applied?

>  	pinctrl_buck2: vddarmgrp {
>  		fsl,pins =3D <
>  			MX8MQ_IOMUXC_GPIO1_IO13_GPIO1_IO13		0x19
>  		>;
>  	};
> =20
> +	pinctrl_camera1_pwdn: camera1pwdngrp {

[Severity: Medium]
Could defining these overlay-specific pin groups in the base device tree,
rather than isolating them within their respective overlays, break the
modularity of the device tree overlays?

> +		fsl,pins =3D <
> +			MX8MQ_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x19
> +		>;
> +	};
> +
> +	pinctrl_camera2_pwdn: camera2pwdngrp {
> +		fsl,pins =3D <
> +			MX8MQ_IOMUXC_GPIO1_IO05_GPIO1_IO5		0x19
> +		>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619100532.3779=
934-1-robby.cai@oss.nxp.com?part=3D1
