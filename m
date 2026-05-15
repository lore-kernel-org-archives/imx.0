Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B095A47887F;
	Fri, 15 May 2026 11:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844798; cv=none; b=HmFQ5HceEZAWaHCQmjZ+0xCpF9uPZe4+SpmN/FNUPowvjEq8Du8pXDNVQaSbw3pCkLNto65jTM19JyP3vh8Nr1eSmFolvz2DztlfSCuHYVIb6OYc5ynfxFkv0r6BAdITUhmt9ZtehO4gniQwyi7BW8P5/MOXAX15u2bZC5JC1/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844798; c=relaxed/simple;
	bh=IW8xaqT5tRomWWYj+Hg02oe1gCWLajIYfCPhaENxwXE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jvNtxaqKHwh3aQ1fBPZlpw8TzEKvGCQmRIUwBzD35x+lL9G0jh1Hzau39ZRrQNSqZODNa1ClibR1GCH00M6OuU+lZhXmNoCcO3U4gG8R+ZU94AQ32Et0eS5noEkgCRlflgU3H1rwnkYpdQAYEeGdx+/TecOfQ/btqGa0jsDPtIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uXwXBNl0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uXwXBNl0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A02EC2BCB0;
	Fri, 15 May 2026 11:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778844798;
	bh=IW8xaqT5tRomWWYj+Hg02oe1gCWLajIYfCPhaENxwXE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=uXwXBNl0+1L/9fle97JALcfVqogfKQ3vDco3hJ6eBXbDEtV7x7Ir5chwkjD8AO4ZT
	 NUorR1GAUwTyZW8a1ZoQzQlBPOLiqmTvJ8t6BJyO5k6Ky2SBrSR93pBWmKQooGJjy5
	 o3zYi9ghPzUihCK1sNmvz8GJwXFBlTH5QcvvKq7+wt1g7y5w+ujhUIp4A4+dAPnczC
	 HR4FZfSuL5NDsrNT6Kg7UjU9dac7KTxpAMsJxhYIxTpdtyq6CZy1jeXHXe2FR6on2h
	 ib0LRUzWasKee32uHOsa9UjcUFcR5QVsdBeWLaSLdBZyqBRx+OUeLEU/ZaNH4pyzzY
	 +L8NlUy0fQENQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: imx8mq-evk: Enable MIPI CSI and dual
 OV5640 cameras
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robby Cai" <robby.cai@nxp.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260515111143.2980956-1-robby.cai@nxp.com>
References: <20260515111143.2980956-1-robby.cai@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 11:33:17 +0000
Message-Id: <20260515113318.2A02EC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The proposed device tree configuration intends to use software res=
et by omitting `reset-gpios`, but the upstream OV5640 driver skips the soft=
ware reset sequence if `powerdown-gpios` is present.
--

commit d18d0c4c95f98f3312c777b828bf09c413169ce3
Author: Robby Cai <robby.cai@nxp.com>

arm64: dts: imx8mq-evk: Enable MIPI CSI and dual OV5640 cameras

Enable the MIPI CSI bridges and corresponding CSI-2 host interfaces
on the i.MX8MQ EVK, and add two OV5640 camera sensors.

> Both OV5640 sensors share a single reset GPIO on this board,
> which prevents independent hardware reset when both cameras
> are enabled. As a result, the reset line is kept deasserted
> via a GPIO hog, and sensor reset is performed via software.

Will the software reset actually occur if powerdown-gpios is provided?

Looking at the ov5640 driver's power up sequence, the software reset is
skipped if the powerdown gpio is present:

drivers/media/i2c/ov5640.c:ov5640_powerup_sequence() {
	if (sensor->pwdn_gpio) {
		gpiod_set_value_cansleep(sensor->reset_gpio, 1);
		...
		gpiod_set_value_cansleep(sensor->reset_gpio, 0);
	} else {
		/* software reset */
		ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
				 OV5640_REG_SYS_CTRL0_SW_RST);
		...
	}
}

Since the device tree nodes define powerdown-gpios, does this mean the
driver will skip the software reset branch entirely?

> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx8mq-evk.dts
> index d48f901487d49..2311a05b88c50 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts

[ ... ]

> @@ -330,12 +367,101 @@ vgen6_reg: vgen6 {
>  			};
>  		};
>  	};
> +
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

Since the reset gpio is omitted here and is kept deasserted by a hog
elsewhere, does providing powerdown-gpios result in both hardware
and software resets being bypassed?

> +		DOVDD-supply =3D <&sw4_reg>;
> +		AVDD-supply =3D <&reg_2v8>;
> +		DVDD-supply =3D <&reg_1v5>;
> +
> +		port {
> +			camera2_ep: endpoint {
> +				remote-endpoint =3D <&mipi_csi2_in_ep>;
> +				clock-lanes =3D <0>;
> +				data-lanes =3D <1 2>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c2 {
> +	clock-frequency =3D <100000>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_i2c2>;
> +	status =3D "okay";
> +
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

Could this regression also prevent initialization on the second camera
for the same reason?

> +		DOVDD-supply =3D <&sw4_reg>;
> +		AVDD-supply =3D <&reg_2v8>;
> +		DVDD-supply =3D <&reg_1v5>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515111143.2980=
956-1-robby.cai@nxp.com?part=3D1
