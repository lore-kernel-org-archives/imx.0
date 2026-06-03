Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977DC26738C;
	Wed,  3 Jun 2026 10:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481161; cv=none; b=tAKuZf2sGCh3Fwi/rLd/VDMse0il1Zl2PJ8XqW7IgTtBJfKETJxXG4RApxIx+T6WRCkdV6iXCPiuGpa3W+7b81npVMug1jwP+N6OWuEwIS/EPLNR21FTVORsjLgXE+flcZWE/k0VLdRXpJtuDu0A/7lyukIX7X1XMK6TKqErEPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481161; c=relaxed/simple;
	bh=6HjbUT9bsljwmSLXkP40sQEsNLLDgsJcLkMB7Nnlo8o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u4I8nqHAeLy5TaXNgWmuCuayFg05HDgtSfPJ1eJOTr43RW1G2WLBUWkGk/pZqSURHvTieF0qDNv2HhFMIvO7N/ZvnfIkE/gIQ6qPdLgjipXVf+XyXhVFtww8W+3a3APsuUuteJlgzW72qQ8IaTT5ubY1xrcl6QM4ItS57xprzXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yi3xzra+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yi3xzra+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7E21F00893;
	Wed,  3 Jun 2026 10:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780481160;
	bh=vApJdtU702bBFrXzOILMTcWi7/tOUDGXtSppt97x8Os=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yi3xzra+KZppRd7RWW3urhqQGIp4IkGqfBKIxt8P7jrXzudpfo+ERBymrm+Bm2Tim
	 E+ymT3yW2wxpvUeNvzR4Nzl7smZKbsAyryQQx88ejax6bC+PhfISJOwYqxlNxNmDu3
	 NjvT7WtNAoFrUqVW4clAQTupo6b1v2h1fGMhNfZWQPQU+ROJCqySao+c0vUZOWMTLb
	 5Bfx5qZkU2LfbSPHaFT4dUmK/yzos6TwZK1xhfpp94h8YuddIoqiG0q8WhweYtBEZR
	 tldMLe0hPJSYeTAqO2OagSyila+KHrtB0hLCDe1m2vi6dCYzDmtj4SP3EllB0LNn6R
	 JnGtuOf//LlMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] arm64: dts: freescale: add initial device tree
 for TQMa8MPQS with i.MX8MP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260603093621.2504490-2-alexander.stein@ew.tq-group.com>
References: <20260603093621.2504490-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 10:05:59 +0000
Message-Id: <20260603100559.6E7E21F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect `reset-gpios` polarity on `dp_bridge` will permanently d=
isable the device.
- [Medium] Missing `interrupts` property for the DisplayPort bridge despite=
 hardware routing.
--

commit ec4a92e3f2baae5d65ed787df020c8a40c851231
Author: Paul Gerber <paul.gerber@tq-group.com>

arm64: dts: freescale: add initial device tree for TQMa8MPQS with i.MX8MP

This adds support for TQMa8MPQS module on MB-SMARC-2 board.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs.dtsi b/arch/a=
rm64/boot/dts/freescale/imx8mp-tqma8mpqs.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs.dtsi

[ ... ]

> +&i2c3 {
> +	clock-frequency =3D <384000>;
> +	pinctrl-names =3D "default", "gpio";
> +	pinctrl-0 =3D <&pinctrl_i2c3>;
> +	pinctrl-1 =3D <&pinctrl_i2c3_gpio>;
> +	scl-gpios =3D <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios =3D <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status =3D "okay";
> +
> +	dp_bridge: dp-bridge@f {
> +		compatible =3D "toshiba,tc9595", "toshiba,tc358767";
> +		reg =3D <0xf>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_tc9595>;
> +		clock-names =3D "ref";
> +		clocks =3D <&clk_dp>;

[Severity: Medium]
Is this node missing the interrupt properties for the Hot Plug Detect signa=
l?

The pinctrl node pinctrl_tc9595 configures GPIO5_IO21 (DP_HPD_INT), but
without the interrupt-parent and interrupts properties here, the tc358767
driver won't be able to request the hardware IRQ.

Will this cause the driver to silently fall back to 10-second software
polling for HPD and link training events instead of using the hardware
interrupt?

> +		reset-gpios =3D <&expander0 4 GPIO_ACTIVE_HIGH>;

[Severity: High]
Will this reset-gpios polarity leave the device permanently held in reset?

The tc358767 driver initializes the reset GPIO to logical 0, pulses it to
logical 1 to assert, and returns it to logical 0 to deassert. Since this
is specified as GPIO_ACTIVE_HIGH, the final logical 0 maps to a physical
LOW signal.

If this pin controls the bridge's Enable or active-low Reset, won't holding
it physically LOW leave the bridge permanently disabled? Does this need to =
be
GPIO_ACTIVE_LOW so the driver's logical 0 maps to a physical HIGH instead?

> +		toshiba,hpd-pin =3D <0>;
> +		status =3D "disabled";
> +
> +		ports {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603093621.2504=
490-1-alexander.stein@ew.tq-group.com?part=3D2
