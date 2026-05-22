Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57503A7193;
	Fri, 22 May 2026 08:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779438280; cv=none; b=eR2GOJyHMttpytrcBthZ+ui5j3CMpOWiVrNlu9BlU3btgZ4lbG5fAbHqtmBX8vFEfNqLfVHmXGPvHtqvf38ePpTHZX+krCnVYmXrX6wFS1Fe4Vd4/Y4hFvc5ykTAsHOrne5JtB6u/S5kjAXJT78phF9pAWl0MocANg4XOf+8hB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779438280; c=relaxed/simple;
	bh=8DEx7NmYwE23Ftcrup4J3B1ywGsx9s7NzsSenTXCNf0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cGPM4WdEpmFN34CrjPgTn7I1aasRXpy0V7vQu1n5bJ4y2VUZbQZfHyrCKcM68RAHdKX4mxO/HTSpLv9sl7IESv2HLDluA4TuRjMhX/TW00It/8P0IztLHvf9eX+Cl7oAp0Z5i+RstmcfMlOcziDanrlOVyBZySXzxHwGl5HlC6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gatuu+uk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gatuu+uk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011DF1F000E9;
	Fri, 22 May 2026 08:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779438279;
	bh=r/S4UgDdFR7HnaKV8I1G5co+QNGdybntvWVewTPcYec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gatuu+ukW0A451mYKtezCHCmMsqW3FbJEkcFEzi/g6SbniWrFYS6nLag8aTbVsfGj
	 jVUjOPBQyGzRVv2EcJues7bnOmAC5RZ2RA/jLXJL066afJOKyngmBXxu8XkdoSw/gA
	 1svAQJJAAn+RyHnsg3lo6z3oALm3V9pgP6GSHLgeEhboCJdSklE3rjTOeZ8HajGfoZ
	 eU2bes0xyWny9ujpAZWTi2jsfao5xfh69feYfcLRfziPlo/KehEhVDaD67xv9TN7ae
	 jxtr+xH5hY71qXamXiCJtwVqUZ78hV2zbR/RhmAEHIVjHY6Hqxj0e0Uv0fFugXndTM
	 AQ+tVn+6TvZGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: freescale: add initial device tree
 for TQMa8MPQS with i.MX8MP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, wsa+renesas@sang-engineering.com
In-Reply-To: <20260522075656.841745-2-alexander.stein@ew.tq-group.com>
References: <20260522075656.841745-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 08:24:38 +0000
Message-Id: <20260522082439.011DF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Off-by-4 error in `gpio4` line names array assigns GPIO names to a=
ctively driven Ethernet pins
- [Medium] Redundant `gpio-hog` nodes for pins concurrently used as interru=
pts by drivers
- [Medium] Missing `status =3D "okay";` for `pwm2` and `pwm3` will cause ba=
cklight overlays to fail
--

commit 33a28c1f4850f44b57edd7bcc9794f6b7f5401a7
Author: Paul Gerber <paul.gerber@tq-group.com>

arm64: dts: freescale: add initial device tree for TQMa8MPQS with i.MX8MP

This adds support for TQMa8MPQS module on MB-SMARC-2 board.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs.dtsi b/arch/a=
rm64/boot/dts/freescale/imx8mp-tqma8mpqs.dtsi
> new file mode 100644
> index 0000000000000..570dfca3aa024
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs.dtsi

[ ... ]

> +&gpio1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_gpio1>;
> +
> +	gpio-line-names =3D "SLEEP", "BATLOW#", "", "LID",
> +			  "", "GPIO10", "CHARGING#", "CHG_PRSNT#",
> +			  "PMIC_IRQ#", "ESPI_CS1_ALERT#", "USB1_OTG_ID", "USB2_OTG_ID",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "";
> +
> +	pmic_irq_hog: pmic-irq-hog {
> +		gpio-hog;
> +		gpios =3D <8 0>;
> +		input;
> +		line-name =3D "PMIC_IRQ#";
> +	};
> +};

[Severity: Medium]
Is it necessary to define gpio-hog nodes for pins that are already requested
as interrupts by their respective drivers (like the PCA9450C PMIC)?

Since gpio-line-names already correctly names the pin, doesn't hogging an
interrupt line redundantly tie up gpiolib resources and potentially conflict
with driver ownership?

(This question also applies to the enet0-int-hog, enet1-int-hog,
temp-event-hog, and rtc-int-hog nodes defined further below).

[ ... ]

> +&gpio4 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_gpio4>, <&pinctrl_sdp>, <&pinctrl_espi_rst>;
> +
> +	gpio-line-names =3D "RTC_INT#", "GPIO8", "", "",
> +			  "GPIO9", "ESPI_RST#", "", "",
> +			  "", "", "", "",
> +			  "", "", "GBE0_SDP_DIR", "",
> +			  "GPIO7", "", "", "",
> +			  "", "", "", "",
> +			  "", "GPIO0", "GPIO1", "",
> +			  "GPIO2", "GPIO6", "", "";

[Severity: High]
Are GBE0_SDP_DIR and GPIO7 placed at the correct indices in this array?

They are currently at indices 14 and 16, which correspond to GPIO4_IO14 and
GPIO4_IO16. However, these are actively driven Ethernet lines (ENET1_RGMII_=
TD2
and ENET1_RGMII_TX_CTL) as multiplexed in pinctrl_fec.

Could this be an off-by-4 error, and should they instead be at indices 18 a=
nd
20, which are explicitly multiplexed as GPIOs? If exposed to userspace as
GPIOs, could manipulating these active Ethernet TX lines cause hardware
conflicts or disrupt network connectivity?

[ ... ]

> +&pwm2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_pwm2>;
> +};
> +
> +&pwm3 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_pwm3>;
> +};

[Severity: Medium]
Since the backlight_lvds0 and backlight_lvds1 nodes on the baseboard rely on
&pwm3 and &pwm2, should these controllers have status =3D "okay"; added her=
e?

If left disabled (as they are in the SoC dtsi), won't any overlays that ena=
ble
the panels silently fail when the backlight driver cannot acquire the disab=
led
PWM channels?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522075656.8417=
45-1-alexander.stein@ew.tq-group.com?part=3D2
