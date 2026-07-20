Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7866280331;
	Mon, 20 Jul 2026 06:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784530552; cv=none; b=TxQLFvH5/XhIikgVjnIhtb4xrZN0JQSQM5YT40XjQG5Nyv5+v2dQDBTBbKk6gjsjP5+YY5P+BjRlJPtSlFfN/W8hcLPqEoTzwl9qxClIA7s3vh1VGX6S6XRYayLhWlcINAc9i0lMXlLSUhgjYHnhM8QFzhuNu7p+6Zl8FMgymYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784530552; c=relaxed/simple;
	bh=rnlZavZvyDtZNKaH223vUkDdyr3IdrOYR1cWUj9CV2c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Kx7/jZ6p5XGh2JMYfClM5ufrM+S/vlYULFKF1pFAphv72E/buBLDXQmlcFh7vfaO3WklfQfd0hjVaM0W7mDYmwiUpXE1pWEkD65epcI488e0a6kX66vy6wpNhRhbYhUUaj4bgfSx954rslMU54xKABwkU/OAYILCQDNDTtEenMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZobiZROV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZobiZROV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24301F000E9;
	Mon, 20 Jul 2026 06:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784530550;
	bh=uZXZHP/69MNKb1zNw+vI0rcSrRyT5pVKqGqP5IeZzBE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZobiZROVL7oY6sDhh6i86RogpmTHVhrIl8yfFGuirHOY0hu9lrrDfZaAoF5d0uJs1
	 5XXBnAH2xt2VgfptfIpkQdtugVT3+LvhNgpU63+XNDEAr48YayxAXmzSZX0iaAF+dh
	 yDf+scwL5a7bTO4MwMNv5GUOBfVrqXKMuP/xBXu9WZl01xpzpz6eF85P9fWtn7+er4
	 z7h9nC02SBOnmeYpxEHDWou51+K1jKfs0sER60SukcHw148MBTvPpT8Qm/xXhyTaBV
	 +3yJCI6tEHxj6row1PWyswGsw8R+FSPH+0KWrGpKM2SLz3+ctrgWef7yz6CTvlg5cW
	 27i6mtTaJe20A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add i.MX952 FRDM Board
 support device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Guo" <qijian.guo@nxp.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260720-imx952_frdm-v1-2-6d145eaaa5c4@nxp.com>
References: <20260720-imx952_frdm-v1-0-6d145eaaa5c4@nxp.com>
 <20260720-imx952_frdm-v1-2-6d145eaaa5c4@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 06:55:49 +0000
Message-Id: <20260720065549.C24301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Shared GPIO requested exclusively by two CAN transceivers causes p=
robe failure for the second transceiver.
- [Low] Use of undocumented, downstream-only device tree property `fsl,cd-g=
pio-wakeup-disable`.
--

--- Patch [2]: [PATCH 2/2] arm64: dts: freescale: add i.MX952 FRDM Board su=
pport device tree ---
commit 8bbcb28d08a05e0f4c57023333492b4e023f7caf
Author: Joseph Guo <qijian.guo@nxp.com>

arm64: dts: freescale: add i.MX952 FRDM Board support device tree

Add basic device tree support for i.MX952 FRDM Board. The board-common hard=
ware
description is placed in imx952-frdm.dtsi so that it can be shared with fut=
ure
i.MX952-based FRDM derivative boards.

> diff --git a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi b/arch/arm64/=
boot/dts/freescale/imx952-frdm.dtsi
> new file mode 100644
> index 0000000000000..b9ef6bec2bd5a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> @@ -0,0 +1,727 @@
[ ... ]
> +	flexcan2_phy: can-phy0 {
> +		compatible =3D "nxp,tja1051";
> +		#phy-cells =3D <0>;
> +		max-bitrate =3D <8000000>;
> +		silent-gpios =3D <&pcal6416 6 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	flexcan3_phy: can-phy1 {
> +		compatible =3D "nxp,tja1051";
> +		#phy-cells =3D <0>;
> +		max-bitrate =3D <8000000>;
> +		silent-gpios =3D <&pcal6416 6 GPIO_ACTIVE_HIGH>;

[Severity: High]
Does this cause a probe failure for the second transceiver?

The first PHY node successfully requests this GPIO line, taking exclusive
ownership. Because the phy-can-transceiver driver uses standard exclusive
requests (without GPIOD_FLAGS_BIT_NONEXCLUSIVE), the second request for the
exact same GPIO line fails with -EBUSY.=20

This prevents the flexcan3_phy and the flexcan3 controller from probing and
functioning.

> +	};
[ ... ]
> +&usdhc2 {
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&gpio3 0 GPIO_ACTIVE_LOW>;
> +	pinctrl-0 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-3 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz", "sleep";
> +	vmmc-supply =3D <&reg_usdhc2_vmmc>;
> +	fsl,cd-gpio-wakeup-disable;

[Severity: Low]
Is this out-of-tree vendor property invalid in the upstream kernel?

The property fsl,cd-gpio-wakeup-disable does not exist in any upstream devi=
ce
tree bindings (such as fsl-imx-esdhc.yaml) and is not handled by any driver
code in the upstream Linux tree. This acts as dead code and will trigger
`make dtbs_check` validation warnings.

> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-imx952_frd=
m-v1-0-6d145eaaa5c4@nxp.com?part=3D2
