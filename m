Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4842175A88;
	Tue, 30 Jun 2026 10:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814870; cv=none; b=SMQQgQhb3USfS56RPfnf1n6iyqwSGDoDzO1haOXWUefZ4tCnGLBLx3OZ1M96bjyyOxZ8OoTvu2MKFP5pAN8L6x6jsIndhjhpfw/RHWtFzYeFNtYdkhbdouGWY54C81gt3ccMUqlWrtY2in98CgJJBDGWZOk7mnfDYLJi3+wh5PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814870; c=relaxed/simple;
	bh=Ze3p65S0J4T9Et2Zf0vTwCHMiKP5g0eXFKhCWNlqt70=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Svjz+aJ1WiFFhfdupzV+cbsMQ+A3/xlmBP/SBXjrrFVritXH01T+T+hGVPiXiTddqV9LLbQoBEKSg52txnjweQgNJgyKZV2a9g5sZmXLce4TMv1SaHaoS5Dyru8vLL/IJ1m0cyAJedrUaCXJOvv5h6cqtCeSx+GowsCOBp3Iym8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OecS+R6K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OecS+R6K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108461F000E9;
	Tue, 30 Jun 2026 10:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782814869;
	bh=t+gXZ250ySliolo18rcwG9oY/wKGHhldTqXM11kaWGg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OecS+R6KFRZxAfJ/jyh4PDAhkASHseV1o5mLByepKPUtmbyUVfNPZkWa5V7V2SuwX
	 Tyl1mDQqqO5FZcJA4tSFnAdLrszNiaT+UTLH7SBUTZa0AbQfPIW5BPDXy5Z4Ftf4PO
	 1/UVSFMJF4f86FIt95SO6Xj5OQ3n3ha/IXi1dGzioXMk1NzUkhQWycivTrJXkbVCsz
	 Emkd8Ydv/BMSVbzK5GczC3jDUnnLh/O14ii76Km3c+NZIGH6t7k+r1TgCL5LCMkB7U
	 kErlQ79iMwWr1ereLmp0P6aHVYxHHaiGHO/G2Q4Oqkn9P6DQPcehMWZ5NZrXnGOtAj
	 gRf4kyVpIITWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] arm64: dts: imx8qm-var-som: Add support for
 Variscite Symphony board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <2cdbea18bba7c9e05addd24390e54063216bcf88.1782812572.git.stefano.r@variscite.com>
References: <cover.1782812572.git.stefano.r@variscite.com>
 <2cdbea18bba7c9e05addd24390e54063216bcf88.1782812572.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 10:21:08 +0000
Message-Id: <20260630102109.108461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The PTN5150 USB Type-C controller's interrupt is incorrectly confi=
gured as active-high (`IRQ_TYPE_LEVEL_HIGH`), which will cause an interrupt=
 storm.
- [Medium] The SPI chip select GPIO is configured as active-high by mistake=
, breaking standard SPI devices.
--

commit 640b696a79494ebf66cec9e81eee16f6d3d56651
Author: Stefano Radaelli <stefano.r@variscite.com>
Date:   Tue Jun 30 09:46:56 2026 +0000

arm64: dts: imx8qm-var-som: Add support for Variscite Symphony board

Add device tree support for the Variscite Symphony carrier board with
the VAR-SOM-MX8 QuadMax system on module.

Link: https://variscite.com/carrier-boards/symphony-board/

> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts b/=
arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts

[ ... ]

> +&i2c1 {
> +	clock-frequency =3D <100000>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_i2c1>;
> +	status =3D "okay";
> +
> +	pca9534: gpio@20 {
> +		compatible =3D "nxp,pca9534";
> +		reg =3D <0x20>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_pca9534>;
> +		interrupt-parent =3D <&lsio_gpio1>;
> +		interrupts =3D <24 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	/* USB Type-C Controller */
> +	typec_ptn5150: typec@3d {
> +		compatible =3D "nxp,ptn5150";
> +		reg =3D <0x3d>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_ptn5150>;
> +		interrupt-parent =3D <&lsio_gpio3>;
> +		interrupts =3D <11 IRQ_TYPE_LEVEL_HIGH>;

[Severity: High]
Will this active-high interrupt polarity cause an interrupt storm at boot?

The PTN5150 hardware pin INTB is open-drain and active-low, which means it
idles high. By configuring the interrupt trigger as IRQ_TYPE_LEVEL_HIGH,
the kernel expects an active-high signal. Since the idle state is high, the
interrupt will fire continuously as long as it is idle.

Other Variscite Symphony board DTs correctly configure this identical
component's interrupt as IRQ_TYPE_LEVEL_LOW.

> +
> +		port {
> +			typec_dr_sw: endpoint {
> +				remote-endpoint =3D <&usb3_drd_sw>;
> +			};
> +		};
> +	};
> +};

[ ... ]

> +&lpspi1 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_lpspi1>;
> +	cs-gpios =3D <&lsio_gpio3 24 0>;

[Severity: Medium]
Does this active-high chip select polarity break standard SPI devices
attached to the bus?

Standard SPI chip selects are active-low, expecting the line to go low to
select the peripheral. By setting the cs-gpios polarity to 0
(GPIO_ACTIVE_HIGH), the SPI subsystem will drive the pin logically true
(physically HIGH) when asserting CS, and physically LOW when idle.

This means an attached standard SPI device will be continuously selected
when idle, leading to bus contention. While gpiolib contains a legacy
quirk to rewrite this if a statically defined active-low child node is
present at parse time, this quirk will not protect dynamically added
devices.

Should this be updated to use GPIO_ACTIVE_LOW to match standard SPI
behavior?

> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782812572.gi=
t.stefano.r@variscite.com?part=3D3
