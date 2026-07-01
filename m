Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFBB3EA97E;
	Wed,  1 Jul 2026 08:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895502; cv=none; b=L7/gfpLkeOwwh7m+UgMsa1cigZ3lN6wETejzop1ElfderU5aVHlMYdc5SSoz/9QfHs4/IW1ikSl40S6+sXAD4zxf1SdWV7blwngjMET76Tkwb+v67Xc7gllhmQjA/kignrVbFWcx9eETctOJgWNDlZL/PxuOwbj1IGnlVnH8lBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895502; c=relaxed/simple;
	bh=GC8QAIxrt0LSwhZktWa2RaSNGPdZzdF5sT9WQCMTBC8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O1fuasKfjHc9giCXY0vLyhWHExqfzz2+LbRWRSU8FQ4kH1d9bOoVrzArrClP6TFxqrYu4P/hizxzDxkGzu9sfWf3w7Yv+BpR/obdty/KwZMCw8slXnd4UrNF7gS4UodjXwap1U6ElFE5ejYQ/me/TRjAvCLv+bG0Gd0szvG7ehE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O2MoZLir; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O2MoZLir"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7351F00A3A;
	Wed,  1 Jul 2026 08:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782895501;
	bh=B9O1FfwfOGxuhO1XNaDk5FHpRsvFW/TF2WbDzvyyT9o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O2MoZLirwR/igytQGAbm2goB2KiPZ4YktDBNXQMEwlRpLN6rf1AEDcd0oMT/6KqLi
	 LxXIRuvz6kTBtEeJq/RedBclMv09gyDOLqlIV6i8J0RAQe1Frc/0sUxxzJkoC8JvSS
	 RUxrOyOSzn5wEnbXyhfTkMkZcAWv8xd1v/clmbcRATvdBQzVkbRV2ipWxu5W0QEEK8
	 lWnb6CFB8FpgX4e2qRBTDPg8+/KB01yV0oXEfEV2x8QfHAB1RXwuRzcVmirXUPbScu
	 Whmf9g8jATEA+hKC4Z9y+XWAA+/uPHNJKtFDRJzbvUkpYEblOY6xCspyHyOSBUWC1L
	 yt7LYZDf1pEFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: imx8mp-skov: support new 7inch panel
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Steffen Trumtrar" <s.trumtrar@pengutronix.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-2-d74f7e3f8293@pengutronix.de>
References: <20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-0-d74f7e3f8293@pengutronix.de>
 <20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-2-d74f7e3f8293@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 08:45:00 +0000
Message-Id: <20260701084500.AC7351F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] DT Schema Validation Failure: missing fallback compatible string fo=
r touchscreen.
- [Low] Documentation error in LVDS clock calculation comment.
- [Low] Makefile Ordering Violation.
--

commit 3b909b83ea0bf98186df799556b414671ad39311
Author: Steffen Trumtrar <s.trumtrar@pengutronix.de>

arm64: dts: imx8mp-skov: support new 7inch panel board
   =20
This board is similar to the already upstream
imx8mp-skov-revc-tian-g07017.dts but uses a different 7" panel with a
different touch controller.

> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts=
/freescale/Makefile
> index 8ddaab127ab9c..efca29735b2cb 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile

[ ... ]

> @@ -435,6 +435,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-skov-revb-mi1010ai=
t-1cp1.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-skov-revc-bd500.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-skov-revc-hdmi.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-skov-revc-tian-g07017.dtb
> +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-skov-revc-jutouch-jt070tm041.dtb

[Severity: Low]
This isn't a bug, but should this new entry be sorted alphabetically?
Placing jutouch after tian breaks the expected ordering in the Makefile.

>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-skov-revc-jutouch-jt101tm023.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-toradex-smarc-dev.dtb

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070=
tm041.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm0=
41.dts
> new file mode 100644
> index 0000000000000..56374f1e67663
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.d=
ts

[ ... ]

> +&i2c2 {
> +	clock-frequency =3D <100000>;
> +	status =3D "okay";
> +
> +	touchscreen@2a {
> +		compatible =3D "eeti,exc81w32";

[Severity: Low]
Does this compatible string also require the fallback string eeti,exc80h84
to pass dtbs_check validation? The schema for the eeti,exc3000 touchscreen
typically expects both strings to be present.

> +		reg =3D <0x2a>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_touchscreen>;

[ ... ]

> +&lvds_bridge {
> +	assigned-clocks =3D <&clk IMX8MP_CLK_MEDIA_LDB>,
> +				 <&clk IMX8MP_VIDEO_PLL1>;
> +	assigned-clock-parents =3D <&clk IMX8MP_VIDEO_PLL1_OUT>;
> +	/* IMX8MP_VIDEO_PLL1 =3D IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */

[Severity: Low]
This isn't a bug, but is the * 2 multiplier in this comment correct?

With the single-link pixel clock of 51.2 MHz for this panel and the assigned
rate of 358400000 Hz, the calculation appears to be exactly 51.2 MHz * 7.
Including the * 2 multiplier would result in 716.8 MHz instead.

> +	assigned-clock-rates =3D <0>, <358400000>;
> +	status =3D "okay";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-v7-0-topic=
-imx8mp-skov-dts-jutouch-7inch-v3-0-d74f7e3f8293@pengutronix.de?part=3D2
