Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793549234;
	b=RTvyrBReWjC+SbUxjv5jAVtxeg125M8q5sIq2fF/Thaippp3zr/gnVPJ36VsIv0cKbau
	 3jaQUHcfTY5wQ96m2i5M/PQYbjg+WNMTflCHvLWL2QtoyBITbnuv1FcawTOJnOpv/Xf/2
	 zebgOeWxFP07VkBg0ymb0QMadgb4tVAp+dJJS6iif+zUsIYDcXUK59fDfmWXU2GPMicXv
	 bh9f8Pu+VAZaBqKXOVlRWrlXdzXsg8hNlQgHxQhJ6+agjt8zqsJAEHB9D4LD176f1oOk5
	 XtDwj4cBYTR1udMqUQo5+EKK7tldiCKFfoiQK1ObEA3QAdEJz/V4nCb4+OVRZn1/v0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793549234;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qTWC7cLVxT5v+aZKVoIayJSRyiBlClOUjyL7BBx8H7A=;
	b=oE0ZN2S66fLcJzYHO+rk+3XREs98tMYbIR8hO3OxjSe7bMjg/zj1B3zltCgp7Xft9yqK
	 eNwoT9OxE1PI7NYA1jVVVuPpLlL2ouIMXGQzfCV8KxFibqS576gyTXgmxpfibAhSfJo20
	 OittnW8kquz4g7DfxfR6Akl2uTmcCkZzH2PBghJx7bIyzu7zdDCVXXpjfI/i/nC3T55zc
	 47+jHp+c5zthIIrfm6EKhNh+fc4+Cuk2/P/moXZi3ZOu85vEexxzHxjU88LsCMR4Ut2ED
	 hHiYPtx2rgHFa1GqweAkozcByjYJsRiwlNV5PTKut/mJkSiTDY3SmXeTdvUUjDhvfRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b5WCFi8z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABCB606A325;
	Sun,  1 Nov 2026 16:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b5WCFi8z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C9F1F000C1;
	Sun,  1 Nov 2026 16:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793549233;
	bh=qTWC7cLVxT5v+aZKVoIayJSRyiBlClOUjyL7BBx8H7A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b5WCFi8zkm2nTO6SNyngl9ctyrxetZ3yxWLzSFmn7769TzoB3/r+9JwSXcO6+ULAN
	 9qmEYwSgwS13vsSu6GMrcN8mKYUWVwr+M0wYNWbXY6kqqSVxJNjddSX+UG/4DyUQXr
	 qEMXAqeUZQtoxl2MtGvTCKiBuqzOMdjwgb8UIqsmqCZF3nfTiMKmHRH1HJwVX5hMd2
	 fXVRCG2d2UNu4W3kcMkvOI+SWp4WK5hevMgsJNVu0ucbF3ykobgo1ytHdxPVoDu6xr
	 2Xc9Fb7CO7WrBDT9NNFCXmgBRft9KbdSFeuXuQgVQHtixbvx1q3ZbqB/0ftly3FaLP
	 B9b9B5f2tE8HA==
Message-ID: <sashiko-outbox-192493@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: freescale: lx2160a-nbxv3: fix 1588 and id
 line names
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261101-for-upstream-nbxv3-dts-line-names-v1-1-7c8eecb2da9f@free.fr>
References: <20261101-for-upstream-nbxv3-dts-line-names-v1-1-7c8eecb2da9f@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 16:07:12 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] arm64: dts: freescale: incomplete changelog and unexplained changes
--

commit 2208a7074ab4d2a50b39680ab1785ee7073ca209
Author: Vincent Jardin <vjardin@free.fr>

arm64: dts: freescale: lx2160a-nbxv3: fix 1588 and id line names

This commit updates gpio-line-names in gpio3 and gpio@74 in
fsl-lx2160a-nbxv3.dtsi and removes comments above pltrst-hog and gpio@74.

>     arm64: dts: freescale: lx2160a-nbxv3: fix 1588 and id line names
>
>     Let's properly support 1588 on this board and fix the names.
>
>     Fixes: 565b6713a460 ("arm64: dts: freescale: add Nodebox v3 CPU Modul=
e")
>     Signed-off-by: Vincent Jardin <vjardin@free.fr>
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi b/arch/=
arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
> index 9c5588a75cdd4..5591ae262707c 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
> @@ -169,7 +169,6 @@ &gpio1 {
> =20
>  	status =3D "okay";
> =20
> -	/* Platform reset, no consumer node: released at boot */
>  	pltrst-hog {
>  		gpio-hog;
>  		gpios =3D <29 GPIO_ACTIVE_LOW>;
> @@ -206,9 +205,9 @@ &gpio3 {
>  		"altfn:ec1-rxd1", "altfn:ec1-rxd0",
>  		"altfn:ec1-rx-clk", "altfn:ec1-rx-dv",
>  		"", "",
> -		"ptp-refclk-in",
> +		"altfn:tsec1588-clk-out",
>  		"", "", "", "", "", "", "", "",
> -		"u1700-zl30733-pps-out",
> +		"altfn:tsec1588-trig-in1",
>  		"",
>  		"ethsw-mdio-en",
>  		"usb1-oc#",	/* USB1_PWRFAULT and USB2_PWRFAULT pads: one wired-OR net =
*/
> @@ -247,21 +246,20 @@ eeprom@52 {
>  		pagesize =3D <32>;
>  	};
> =20
> -	/* Board ID straps */
>  	gpio@74 {
>  		compatible =3D "ti,tca9539";
>  		reg =3D <0x74>;
>  		#gpio-cells =3D <2>;
>  		gpio-controller;
>  		gpio-line-names =3D
> -			"boardid-0x0001", "boardid-0x0002",
> -			"boardid-0x0004", "boardid-0x0008",
> -			"boardid-0x0010", "boardid-0x0020",
> -			"boardid-0x0040", "boardid-0x0080",
> -			"boardid-0x0100", "boardid-0x0200",
> -			"boardid-0x0400", "boardid-0x0800",
> -			"boardid-0x1000", "boardid-0x2000",
> -			"boardid-0x4000", "boardid-0x8000";
> +			"boardid-0x01", "boardid-0x02",
> +			"boardid-0x04", "boardid-0x08",
> +			"boardid-0x10", "boardid-0x20",
> +			"boardid-0x40", "boardid-0x80",
> +			"test-mode-tp1500",
> +			"gnd-p11", "gnd-p12", "gnd-p13",
> +			"gnd-p14", "gnd-p15", "gnd-p16",
> +			"gnd-p17";
>  	};

[Severity: Low]
This isn't a bug, but could the commit message be expanded to accurately
describe these changes and their rationale?

First, the commit message states "Let's properly support 1588 on this board
and fix the names", whereas the patch only updates informational
gpio-line-names strings in gpio3 from ptp-refclk-in and u1700-zl30733-pps-o=
ut
to altfn:tsec1588-clk-out and altfn:tsec1588-trig-in1 without configuring
clocks, pinmux, or 1588 hardware nodes.

Second, the changelog does not explain why those gpio3 entries are relabeled
with the altfn: prefix (for instance, whether the RCW muxes those pads to
TSEC 1588 alternate functions rather than GPIOs), or why the TCA9539
expander at gpio@74 is changed from 16 board ID straps (boardid-0x0001
through boardid-0x8000) to an 8-bit board ID (boardid-0x01 through
boardid-0x80) plus test-mode-tp1500 and grounded pins gnd-p11 through
gnd-p17.

Finally, was removing the comment above pltrst-hog in gpio1 intentional, as
it appears unrelated to 1588 or board ID line names?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-for-upstre=
am-nbxv3-dts-line-names-v1-1-7c8eecb2da9f@free.fr?part=3D1
