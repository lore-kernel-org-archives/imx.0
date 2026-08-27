Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE7647DD6E;
	Thu, 27 Aug 2026 15:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787843751; cv=none; b=exsN3Z2gwKGCiC6tXL6zsVx/lwAAQT1dGwK1ECbOfTL8w0dcmPyO9Pkx0t2YuVaERqcf3y/6wcYprkZ85413ct3yfYfNIb9+0rrnubdArqejQfXzKHj9Qwwo0cT/o9AyF/4uG/zlGBNBVy9RzbwQNvOMDBXuN12Wpjo391YltHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787843751; c=relaxed/simple;
	bh=cUY5CXSbGIvMW909gb33jMcaN6TptRGmzOEaugxdDIo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q0N4vGsNCJBeFM9cStpWoWDN716LtV/2/L7G5xj2McnR9W7aPELLbvyhiuv1C8stEXEZ0M68S07EKDE3I5vU697yLLx/JNgcR3IoQfsXWr4Sn9AyRy3K6m3rBq1wPgiFgY3+1cFDrG/92czpAUw2Zt3/bECp84x0svev2J2qGKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TG7bbtv6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TG7bbtv6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8815F1F000E9;
	Thu, 27 Aug 2026 15:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787843749;
	bh=wBaJTco11+byy26lZH/BhENVctn1J0KH2tTGVnXkrGc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TG7bbtv6/5IPzzRIR82qLJvygrapSlDdZb+DLmBm/z7rEFJuQVT8a1TsrjqNIH2GQ
	 ffYZIOnkxLoAnNnxvyIVXaZOHVRsp/8/RaYU44mdOEqO4mqu3RVZow/zFehArjZZW/
	 uiKVhndCorIZUrHQjGXBubWfaHTjnRQd4n2LZFcudpyf1VsmLDZDAbVi4Qhoo6NvNX
	 3x50LPQArfAvgWmMSBGSpbEzhwdGlltUGO9G2TfmPPDSSiYacKtVgj1brQvh0PqYSg
	 VgYJTyAjGOJ+quZiQk+78kCFYMO5F9yvK5SDu8KzNlOHDNDiBDV7SXfyHaBE2V/Boi
	 0/ZCoQVqUG+xg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Laurentiu Mihalcea" <laurentiumihalcea111@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260827150657.1657-3-laurentiumihalcea111@gmail.com>
References: <20260827150657.1657-1-laurentiumihalcea111@gmail.com>
 <20260827150657.1657-3-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 15:15:49 +0000
Message-Id: <20260827151549.8815F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing USB configuration despite commit message claims.
- [Low] Usage of deprecated 'gpio' property in fixed-regulator
--

commit 5ca41dda85cf11b2d0c2fcf857ba3ebeca18e3d8
Author: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

arm64: dts: freescale: add MR-NAVQ95 basic board support

Add basic support for NXP's MR-NAVQ95 board. This includes features like 64=
GB
eMMC, up to 16GB LPDDR5, USB and RJ45 ports.

>     * based on i.MX95 19x19 SoC
>     * 64GB eMMC
>     * up to 16GB of LPDDR5 memory
>     * 1 x USB 2.0 TypeC
>     * 1 x USB 3.0 TypeC
>     * 1 x RJ45 port with RTL8211 PHY

[Severity: Medium]
The commit message explicitly lists '1 x USB 2.0 TypeC' and '1 x USB 3.0
TypeC' as hardware features of the board, but the device tree does not appe=
ar
to enable any USB controllers (like &usb2, &usb3) or define Type-C connecto=
rs.

Are these nodes missing from the device tree, or should the commit message =
be
updated to reflect the current level of implementation?

> diff --git a/arch/arm64/boot/dts/freescale/imx95-navq.dts b/arch/arm64/bo=
ot/dts/freescale/imx95-navq.dts
> new file mode 100644
> index 0000000000000..7458e77dc2ae5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-navq.dts
[ ... ]
> +	reg_usdhc2_vmmc: regulator-usdhc2 {
> +		compatible =3D "regulator-fixed";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_reg_usdhc2_vmmc>;
> +		regulator-name =3D "VDD_SD2_3V3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&gpio3 7 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Could this use the plural "gpios" property instead? While the singular "gpi=
o"
is still parsed by the gpiolib fallback logic, it is deprecated for new
devicetree submissions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827150657.1657=
-1-laurentiumihalcea111@gmail.com?part=3D2
