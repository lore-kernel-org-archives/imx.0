Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CA3407569;
	Fri, 10 Jul 2026 10:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678578; cv=none; b=d6LTulkLw7R5KDo6WxaGfhdDVJI0+mZP7akv2dBUKKYEWNhVIwlDAR3nn7+aPmljHELF8S0WZXlqccf9JpzdBl2ZsigByidpDnMWD0JJGoe9DgoNUqG/D1wgfCPsUDCyVqzK+7W0U9xYqSO6fJig8uvOB88e5nH+S/uWxk4OLG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678578; c=relaxed/simple;
	bh=EyqF24iOZYtWZjOJgnx8OT+71xFyD4Ht9rZafcpiAL0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=igsOkIGugWom3qHnBIjcZJwe3AOvkaVDv5x1tuRzc+/4z6z07xAFzdsL+lgPSJgq7qZnPOwVgLea4mNOAJDPL0lxHJvMpC9BbCyBJpl9pPLD57Z5t6Bf53mwJvpPSDdDrzKaI36rQCci7/MW4GiFPn8bVeMzsLTq924KIsEPCks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MxFUQdv8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MxFUQdv8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8A01F000E9;
	Fri, 10 Jul 2026 10:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783678575;
	bh=huh4VRGHm/umRjzuUfaVM6GrmgapkYdqAJHpkL2D394=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MxFUQdv82PjGOgAKlmijqBlJcEaTeSBmA8XElPutvU95zfQ0p0G2IL2kReFx9h53e
	 cEcTISwKfFjWkPLGnewwCKUHm1Hi5rB6ZNu78YjC51LQrTwYptW1Xe/axuU66lrUY1
	 sGohIbX2VkEGOuMfx+KG0Um6CJhj2PZz3rHsLGAP2RVEOn0AnuYkC9azJJgFLkrTke
	 uLNBeuyzvg1xTBsZYtARpm93XAjeCsL6ZAp56es4crB2YeCj1yt7yFn81ApmaRkchl
	 vSn10KDjZe1L5MOiivzR/UGW6+LxX1WLY5fNwq8QEP4jxr2Fm1j7/cgHVVWMK9Ylb6
	 atQcErryM4IVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: imx91-9x9-qsb: add CAN support overlay file
Reply-To: sashiko-reviews@lists.linux.dev
To: haibo.chen@oss.nxp.com
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260710-dts-imx91-can1-v1-1-c78c9c378e8d@nxp.com>
References: <20260710-dts-imx91-can1-v1-1-c78c9c378e8d@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 10:16:14 +0000
Message-Id: <20260710101614.BA8A01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree overlay references an undefined phandle `<&can_fun>=
` and omits the `pinctrl-gpiomux` node described in the commit message, cau=
sing a build failure.
--

--- Patch [1]: [PATCH] arm64: dts: imx91-9x9-qsb: add CAN support overlay f=
ile ---
commit ba3a1378093445c34dbdd034a8296e7aaebdd0da
Author: Haibo Chen <haibo.chen@nxp.com>

arm64: dts: imx91-9x9-qsb: add CAN support overlay file

This commit adds a device tree overlay to enable CAN1 support on the
i.MX91 9x9 QSB board. It configures the TJA1057GT/3 PHY and sets up
the CAN1 pins.

> diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb-can1.dtso b/arch=
/arm64/boot/dts/freescale/imx91-9x9-qsb-can1.dtso
> new file mode 100644
> index 0000000000000..b8343d653e511
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb-can1.dtso

[ ... ]

> +&flexcan1 {
> +	phys =3D <&flexcan_phy>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_flexcan1>, <&can_fun>;

[Severity: Low]
Does this overlay build successfully? The device tree overlay references
the can_fun phandle, but it does not appear to be defined here or in the
base device tree.

The commit message mentions a pinctrl-gpiomux node for can_fun, but it seems
to be missing from the patch. When the Makefile applies this overlay, will
fdtoverlay fail due to the unresolved reference?

> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-dts-imx91-=
can1-v1-1-c78c9c378e8d@nxp.com?part=3D1
