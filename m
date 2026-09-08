Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B2748F014;
	Tue,  8 Sep 2026 22:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905176; cv=none; b=e7U0f8OHejn6sfxkpU2VZSAyUmftTv4gKzRnZ+1j74trZMNGVzDEohN7Fe8XfuJSIXl/JVR+YoE8ecAlwqB+/QMrt0yCIW3q+Ei22NFREACNCJDQw9abT4eGf4hBX+2lLsD9tvbL09O7PAOKR8xnxUX3MlWq7X0ztvmSf3ssRPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905176; c=relaxed/simple;
	bh=Av3kkS5oLU6sQkS8YfG/n02RrJ7xVCtUZvuOyf93H5k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S/kML0Y3Z1ajGidhksDhD6G+7nLpZUQtF42hDQWhLZ0c0Dz3+ndW4v1NJaXYXiY3RQPz88xfH3p9W2D+72TYButuhK/iBqBwy3h+G8qSn79/WEGS9qF5pJ9IRom0+et/WPV6KXHCv/vvJf2+a0YMpRE5E/XnRGCtDq7e8YafO4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QAZH9pcb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QAZH9pcb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E641F00A3A;
	Tue,  8 Sep 2026 22:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905174;
	bh=MCCOO0Ig5UrQDdNY7DSQQHHrTzvZGtioV6BxK+4pQNs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QAZH9pcbPu/BngtWjjytul+Sq+39WISfO4+j+JlycpGRo0ocGvmm4WAoMOxBCT34j
	 8KOA47odpS6o+IUHILnFi8cI46h3hOl/v7vpNdJIIRWvwBGIwSqXYWkYGys/NK7HE/
	 7w36nyVe47OOGzWX5huN9WNYmZAb1P3U3w1V1co1yHYeNvVCyyvsTftF+WSVA8I+FB
	 rLLa4ATjXu8tMNu/sbvlOxJvfOx46i7bcZzT47b/s7M15efyu+1A6CDsM81ioa0+gV
	 B/f16dV/vAMOh7IatfLlKOAebabLr/HsHIc07udOgG2DL2RYnFr+Mysy0Aw/cOaXbs
	 TSDLXP44U6ghw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mn: Add display DT overlays for the ifm
 VHIP4 EvalBoard
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260908215409.32993-1-marex@nabladev.com>
References: <20260908215409.32993-1-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 22:06:14 +0000
Message-Id: <20260908220614.88E641F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The 1.8V regulator `reg_adv_1v8` is incorrectly configured to ou=
tput 3.3V, violating hardware requirements for the ADV7535.
- [Medium] The `hdmi-transmitter@3d` node (ADV7535) is missing `clocks` and=
 `clock-names` properties to link the defined `cec_clock`, breaking CEC sup=
port.
--

commit fdacb0c2eecf5c57dea7a716eb4e6d3417011685
Author: Fedor Ross <fedor.ross@ifm.com>

arm64: dts: imx8mn: Add display DT overlays for the ifm VHIP4 EvalBoard

This commit adds display DT overlays for the ifm VHIP4 EvalBoard v1, adding
support for the Displaytech DT050BTFT-PTS panel and the NXP ADV7533 DSI-to-=
HDMI
adapter. It supports different DSI lane counts to allow testing multiple
configurations.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-over=
lay-nxp-adv7533-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-eval=
board-v1-overlay-nxp-adv7533-hdmi.dtso
> new file mode 100644
> index 0000000000000..e1a7aa6806c48
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-nxp=
-adv7533-hdmi.dtso
[ ... ]
> +	reg_adv_1v8: regulator-adv-1v8 {
> +		compatible =3D "regulator-fixed";
> +		regulator-always-on;
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
                                           ^^^^^^^

[Severity: Medium]
Is the voltage configuration correct here? The reg_adv_1v8 node appears to
represent a 1.8V power supply used by the ADV7535, but its voltage limits
are set to 3.3V. This misinforms the regulator core about the hardware
voltage.

> +		regulator-name =3D "ADV-1V8";
> +	};
[ ... ]
> +&i2c3 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	status =3D "okay";
> +
> +	hdmi-transmitter@3d {
> +		compatible =3D "adi,adv7535";
> +		reg =3D <0x3d>, <0x3e>, <0x3c>, <0x3f>;
> +		reg-names =3D "main", "edid", "cec", "packet";
> +		a2vdd-supply =3D <&reg_adv_1v8>;
> +		adi,dsi-lanes =3D <4>;
                 ^^^^^^^^^^^^^^^^^^^

[Severity: Medium]
Is there a missing clock reference for the CEC block? A cec_clock is defined
earlier in the file but is not linked here.

Without clocks and clock-names properties linking to cec_clock, the DRM bri=
dge
core will fail to find it when calling devm_clk_get(dev, "cec"), which retu=
rns
-ENOENT. This causes adv7511_cec_init() to abort, leaving CEC uninitialized.

> +		avdd-supply =3D <&reg_adv_1v8>;
> +		dvdd-supply =3D <&reg_adv_1v8>;
> +		pvdd-supply =3D <&reg_adv_1v8>;
> +		v3p3-supply =3D <&reg_adv_3v3>;
> +		status =3D "okay";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908215409.3299=
3-1-marex@nabladev.com?part=3D1
