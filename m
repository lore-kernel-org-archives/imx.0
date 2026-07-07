Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15BC3AB5BB;
	Tue,  7 Jul 2026 06:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407598; cv=none; b=ffU/XXrKasG9MGA2JIRYCkrO74GWFk2Hpu0H3XioszeBKjdBn8DYYZIdO8jkv8VEJXxGk9NcwpPPtGNKd87pWfePCGx07EJHCyZDxm2BVtDOx/f88jPNldhNtdhB4lnAEMkHsEtm5n+WqNvTs3EJruCllp+s6JuqmE4vSPQJTPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407598; c=relaxed/simple;
	bh=uMHHbvJAGDZBA3IaCwkr7iCzbEAMYpWj1HxqUjDDCjA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lDHijpIcf72XtnXKhjR1IPqmnnVi0bVdz+QJbuhZENN3x/jkrjHbOx0kkpXI6mg5XkCzfnkQ2GyKdxMRG1t8ro6dly0QCLJGT9/kXS7EkrrKasd17uKNw4MLacxLYHVeL9HOVJjbTYQltEgOfKtFVY8psbPeIX0nvBF6IvmGpwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZrfHRQU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZrfHRQU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124121F000E9;
	Tue,  7 Jul 2026 06:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783407596;
	bh=BneG9+UKQIlZyzv/lIZGSrOlsQXMCcRZrLEy1oMVc9w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KZrfHRQUOanKNIlwLUyBljRMCPIWEnnOhtWcBC67/1C4sMFs6yc+DmUB/9RXkiF20
	 KRcpaRbpZfVax1EV1oGoazMHZyG+mmO6ca4XATBPR7SsgNCKcgQNBtagDUcjaGTNfn
	 lJD+w5ff8mHdAQ6QwfsiPJQXZXQAiUddZawFS+Y1ZVwAPp5oGXKNmpLFqnDB6kJtkf
	 tKOp20JTIDlJfmZx0RIQ6Q5NmtyJPsoh8+wdgPkXtQ4GdmhvEvP3W+odjf5uSQxHoA
	 xgkFKf9evt651Xcvo5LKkG3M349s2CvOtU0Hw5yzWmrP24k4sFL3FYpE8PAkB0ES5T
	 WiwwkCrW/4Mzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/1] arm64: dts: add tqma9596la-mba95xxca
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260707062506.949806-1-alexander.stein@ew.tq-group.com>
References: <20260707062506.949806-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 06:59:55 +0000
Message-Id: <20260707065956.124121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Conflicting GPIO assignments for M.2 Key-E SDIO Reset between the =
`wifi-connector` device node and a leftover `gpio-hog`.
- [High] The fan supply regulator `reg_pwm_fan` is never enabled, leaving t=
he fan unpowered.
--

--- Patch [1]: [PATCH v7 1/1] arm64: dts: add tqma9596la-mba95xxca ---
commit c06cc8eb19eb4a69fc0547caa6773b503beae3a7
Author: Markus Niebel <Markus.Niebel@ew.tq-group.com>

arm64: dts: add tqma9596la-mba95xxca
   =20
This patch adds support for the TQMa95xxLA modules on the MBa95xxCA carrier
board. It introduces a common device tree include for the module and a spec=
ific
device tree for the carrier board.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts=
 b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> new file mode 100644
> index 0000000000000..db2fd6991d112
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
[ ... ]
> +	wifi-connector {
> +		compatible =3D "pcie-m2-e-connector";
> +		vpcie3v3-supply =3D <&reg_v3v3_mb>;
> +		vpcie1v8-supply =3D <&reg_v1v8_mb>;
> +		i2c-parent =3D <&lpi2c2>;
> +		w-disable1-gpios =3D <&expander2 9 GPIO_ACTIVE_LOW>;
> +		w-disable2-gpios =3D <&expander2 10 GPIO_ACTIVE_LOW>;
> +		/* UART_WAKE is connected to SM */
> +		/* SDIO_WAKE is connected to SM */
> +		sdio-reset-gpios =3D <&expander3 2 GPIO_ACTIVE_LOW>;
> +	};

[Severity: High]
Does this sdio-reset-gpios assignment conflict with the gpio-hog on the same
line?

The wifi-connector node requests expander3 line 2 here, but later in the fi=
le,
m2-keye-sdio-rst-hog hogs the exact same GPIO line. Won't this conflict cau=
se
the wifi-connector driver to fail probing with -EBUSY?

[ ... ]
> +	fan_controller: fan-controller@2f {
> +		compatible =3D "microchip,emc2301", "microchip,emc2305";
> +		reg =3D <0x2f>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		#pwm-cells =3D <3>;
> +		status =3D "okay";
> +
> +		fan: fan@0 {
> +			reg =3D <0x0>;
> +			pwms =3D <&fan_controller 40000 PWM_POLARITY_INVERTED 1>;
> +			#cooling-cells =3D <2>;
> +			fan-supply =3D <&reg_pwm_fan>;
> +		};
> +	};

[Severity: High]
Will the reg_pwm_fan regulator ever be enabled?

The emc2305 driver does not parse or request the fan-supply property from
child nodes. Since reg_pwm_fan is not marked regulator-always-on earlier in
this file, does this leave the fan unpowered?

[ ... ]
> +	/* D41 OUT 1V8 */
> +	expander3: gpio@76 {
> +		compatible =3D "ti,tca9539";
> +		reg =3D <0x76>;
> +		vcc-supply =3D <&reg_v1v8_mb>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +
> +		gpio-line-names =3D
> +			/* 00 */ "ENET1_RESET#", "ENET2_RESET#",
> +			/* 02 */ "M2_KEYE_SDIO_RST#", "M2_KEYE_DEV_WLAN_WAKE#",
> +			/* 04 */ "M2_KEYE_DEV_BT_WAKE", "M2_KEYB_W_DISABLE2#",
> +			/* 06 */ "M2_KEYB_RST#", "M2_KEYB_FULL_CARD_PWR_OFF#",
> +			/* 08 */ "M2_KEYB_DPR", "CAM0_PWR#",
> +			/* 10 */ "CAM1_PWR#", "CAM0_RST#",
> +			/* 12 */ "CAM1_RST#", "CAM0_TRIGGER",
> +			/* 14 */ "CAM1_TRIGGER", "FAN_PWR_EN";
> +
> +		m2-keye-sdio-rst-hog {
> +			gpio-hog;
> +			gpios =3D <2 GPIO_ACTIVE_LOW>;
> +			output-low;
> +			line-name =3D "M2_KEYE_SDIO_RST#";
> +		};

[Severity: High]
This appears to be the leftover hog that conflicts with the wifi-connector
node above. Should this hog be removed to allow the driver to request the
GPIO?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707062506.9498=
06-1-alexander.stein@ew.tq-group.com?part=3D1
