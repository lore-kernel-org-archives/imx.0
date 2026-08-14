Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E6D421230;
	Fri, 14 Aug 2026 07:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692804; cv=none; b=d8nFZA/GLjiZmaa43PE5Q/Eh76RK16gN7x8p7hOcpTsSXbNJhIeSahQPkO6MzH8jvsuUrri4bkB9MMbGKiG3HOYSIJXVxxf5f4crT3trDmJ57b2cc8zakTNDfChbvnDNdmblDHEyF+EqTeby9/CNJILZZtjaxzh/y60f2X+M10o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692804; c=relaxed/simple;
	bh=y0nJPv7Qlo1cs7fZUO3fJLJg2cGEOKekaRwUNgOCjqs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xwa26XlW4YVGlkeYY0ZVK7tsdei/e71sGaJ166eK5PwVs1zjS8VERXVyoYjkZP95zO1jUfd9vg1+VzVSp4O0DAPIeFYNWKdID7Jb7MrQK0i3RV+u9Dj+TR6JiW5sFtBiV2A+Cd1fL+hwrHnG8UAOg2Zzp3mgGg/t3hhcT1OeYR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z6huy+du; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6huy+du"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A691F00A3E;
	Fri, 14 Aug 2026 07:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692798;
	bh=ErwReCyu6U5e9FyNTavwzvqRmC+bLF0k3B3vlPr7bRQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z6huy+dutY48MDQ+9bB3SENrddBY1NKPBhjn8HptA0gwjit+CvMIBeXCKbv3PtadC
	 lsN+bsTD73ZfrHoCzF5RulelUBFzm6vBwSLGvdJQO3sk3UvHQV75/ZmviOpoli4ewx
	 yAPMFMuJWb6VWmRlg79BabIEzVsv5EdTQc9f1ZkL3blrQUjvrvYsaeUIpcAOx7hyP+
	 u9Ydc7cQLBs0HqkcwE5L09sLJE0sdQLL2tvxK0z/IhdAGouMFuCPOhWlZ6Z4UOwkvu
	 YF1ACmcNpccK5fr64VpKbh+xvUodsfXJHMzYEsi9na7Xo9D0J9Yid0HVCztP9ll+BP
	 dVUGd0+30i8KA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/17] arm64: dts: imx93-14x14-evk: Add pinmux and mark
 conflicting devices for MQS1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chancel Liu" <chancel.liu@oss.nxp.com>
Cc: conor+dt@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <20260814072022.4064009-8-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
 <20260814072022.4064009-8-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 07:33:12 +0000
Message-Id: <20260814073317.E8A691F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `&flexcan1` node is missing the `<&can1_fun>` pinctrl state =
to claim the board multiplexer, potentially leaving the physical pins disco=
nnected from the CAN transceiver.
--

--- Patch [7]: [PATCH 07/17] arm64: dts: imx93-14x14-evk: Add pinmux and ma=
rk conflicting devices for MQS1 ---
commit dcb616d828fd4526406432c88e7ade3c33414225
Author: Chancel Liu <chancel.liu@nxp.com>

arm64: dts: imx93-14x14-evk: Add pinmux and mark conflicting devices for MQ=
S1

This commit adds the MQS1 pinctrl group and labels conflicting devices
(BT SCO card and FlexCAN1) so they can be disabled by a shared overlay.

> diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm=
64/boot/dts/freescale/imx93-14x14-evk.dts
> index 502237fab3324..11bb7e52fbb1e 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts

[ ... ]

> @@ -282,7 +282,7 @@ ethphy2: ethernet-phy@2 {
>  	};
>  };
> =20
> -&flexcan1 {
> +mqs1_conflict_dev: &flexcan1 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_flexcan1>;

[Severity: Medium]
Is the &can1_fun pinctrl state missing from the pinctrl-0 list here?

If the MQS1 overlay is applied (setting the mux to state 1) and later
reverted, or if the hardware boots with the multiplexer GPIO high,
flexcan1 will become active but will fail to assert mux state 0.

Without the &can1_fun reference to claim the board multiplexer, the
physical pins may remain disconnected from the CAN transceiver, causing it
to silently fail to communicate on the bus.

>  	xceiver-supply =3D <&reg_can1_stby>;
>  	status =3D "okay";
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814072022.4064=
009-1-chancel.liu@oss.nxp.com?part=3D7
