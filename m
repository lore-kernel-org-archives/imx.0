Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE8742F70C;
	Mon, 27 Jul 2026 17:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174029; cv=none; b=fmW8ZND6HIRCN3S1Si/XPzXvQFASNZ4dElg/qcsXb20SzwslyOeM3kyhFnwLnCPeeIFBF8Y2ed4YTmH5ZTlcV/+TjW9rz3knduvjbuisIM2tq7GJuS1orcxEDGfMiK33Z0YdzT04IBOMGg8w4TFVvahyUPOk0CnlpUwSTXbjnvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174029; c=relaxed/simple;
	bh=OfyA6PZVaQWAshfczWuLPB1WUaO/OnIoRetDQClVbgQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LeLQJLNOv5/CNJNinvjtZE3R2CLAkhQCFVOS+u3NfNUsKPvc2a4B3Q0zinmdYa2G2IytmuaIrAMfdMNrg4L8mGiZ72EYuIwzJtkP2AR81CrQ5H4KOUq6C+WpcYdd+W/AeAEkIe8QQTRXCu0ygHtA5YbDwNoYhbjtD0CDB2dh1EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jz+lcM3A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jz+lcM3A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA331F000E9;
	Mon, 27 Jul 2026 17:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785174026;
	bh=78g5g4GERQh1+fhJYRmrrE602dK4GP7Gh5jXNWY4E3c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jz+lcM3A7pCJxPC0h6sa7M7w+luB/PLuKF9n0tTGjbbxkDiHZCrqNZmu1rRRxD1ZV
	 xuvPWjKrj5R8Cor4kdE8bjQBGZdWXzG2DmLR51APZli0oQq7Ul0azWdhJKY8zhUqNA
	 MpopU1poA1krUCTG1KguD4s2ZS0DIBozR0Yxfnm0PvPan+ImU+mX43/LRPZFYpsNNl
	 rWIlXpcoLPDmR9YpcINJ3pzi953old6HKWKTKaZi0HWfFHT8P5F7ODOleH0N9an/Pc
	 ZYY5DlYhsQyONmE3pu9QjEpeDcisE6r+4KgpN8LR9YK6HZNs4bJMDS5sTiCD67sQsw
	 T2tH28BlvWBuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/5] arm64: dts: imx8mp-skov: support new 7inch panel
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Steffen Trumtrar" <s.trumtrar@pengutronix.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-5-ca8a0446166a@pengutronix.de>
References: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-0-ca8a0446166a@pengutronix.de>
 <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-5-ca8a0446166a@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 17:40:25 +0000
Message-Id: <20260727174025.EEA331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing device tree binding includes causes build failure.
- [High] Incorrect touchscreen resolution properties (copy-paste logic erro=
r).
- [Medium] Missing #address-cells and #size-cells in &i2c2 node causes comp=
ilation warnings.
--

--- Patch [5]: [PATCH v7 5/5] arm64: dts: imx8mp-skov: support new 7inch pa=
nel board ---
commit 5301893644854d4544c31ab94b72a17eda53338e
Author: Steffen Trumtrar <s.trumtrar@pengutronix.de>

arm64: dts: imx8mp-skov: support new 7inch panel board
   =20
This board is similar to the already upstream
imx8mp-skov-revc-tian-g07017 and imx8mp-skov-revc-jt101tm023 but uses a
different 7" panel with a different touch controller.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070=
tm041.dtso b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm=
041.dtso
> new file mode 100644
> index 0000000000000..f3f43e60a0aa7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.d=
tso
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +/dts-v1/;
> +/plugin/;

[Severity: High]
Does this overlay need dt-bindings includes? The C preprocessor won't expand
IRQ_TYPE_LEVEL_LOW and GPIO_ACTIVE_LOW without
<dt-bindings/interrupt-controller/irq.h> and <dt-bindings/gpio/gpio.h>,
which will cause a syntax error during device tree compilation.

[ ... ]

> +&i2c2 {

[Severity: Medium]
Will this parent node cause dtc warnings during overlay compilation? Since
overlays are compiled in isolation, dtc will fall back to default
#address-cells and #size-cells values, which conflict with the 1-cell reg
property of the child node. Should it explicitly define #address-cells =3D =
<1>;
and #size-cells =3D <0>;?

> +	touchscreen@2a {
> +		compatible =3D "eeti,exc81w32", "eeti,exc80h84";
> +		reg =3D <0x2a>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_touchscreen>;
> +		interrupts-extended =3D <&gpio4 28 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios =3D <&gpio4 29 GPIO_ACTIVE_LOW>;
> +		touchscreen-size-x =3D <1280>;
> +		touchscreen-size-y =3D <800>;

[Severity: High]
Are these resolution properties correct for this panel? The jutouch,jt070tm=
041
7" panel has a native resolution of 1024x600. Setting the maximums to 1280x=
800
will cause miscalibration in userspace, where the touch pointer won't be ab=
le
to reach the edges of the screen.

> +		vdd-supply =3D <&reg_vdd_3v3>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-v7-0-topic=
-imx8mp-skov-dts-jutouch-7inch-v7-0-ca8a0446166a@pengutronix.de?part=3D5
