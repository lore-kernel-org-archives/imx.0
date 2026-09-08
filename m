Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086575540A6;
	Tue,  8 Sep 2026 21:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788904784; cv=none; b=IBm0mjuSbqMWj5A26eD7wAq4jmaA7AyNM4mVLZvrPLekiyvn8TsdQ79SvdKO1mwybB/wDuRAhBVbAVrFrtEIwbmCGNrvHxjvaH0A/HKOVQl8hGIo+ZV2aV3vCKrxjpqRHLpwNi92PiEytGCJxxYsezwh2iBuPJjF9y17EgtegKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788904784; c=relaxed/simple;
	bh=xwkNg+ob/c3KokeOld57iOXYmaf8KK17Vu+pdHK1f54=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tbdL2ptcz2WlJgEuyivtFTKXrtQXjHfsDAMQf3xmsYh+v3gqW0FHN9e/T+M5sgGN1afgdA8RaLC0mPtQkyGFtWvOfHGKV8w6NuRRBLB2DFXxV7zrefnn2WoX26y+A+ML8sj9+NXqcvc1lKQIZ3CucWLFXKvM6UjVBumqYNwIM6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dvDkZnV0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dvDkZnV0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6539C1F00A3A;
	Tue,  8 Sep 2026 21:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788904782;
	bh=OTt7Dt+lYemMz6FmxplGaQLySp2r+VnEJrSG+Ecc12A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dvDkZnV036DkG6og7f0FQrpudX9QloDRNpscNPvWegXxC+wI98x5VPlhn/Hud5RNj
	 5bA/Uar4fMlZ44Wg/MDs2fRJSUD2abD5NDfGgmCr/qEfuBCa/C1JleT+xvxKgRPBgn
	 8GiifRWNNkEftvryegSveDHLRSotuzXj/orNWZz5mcUoHlpCqSQjtoQrm237S6p5ps
	 vY2AbTzRM35eG6OhCXWpCoBDJzo43xazw7Ar3WFlopJ20s+S+Z98c/ZmITofTGEcEb
	 e0k8brkC3g1W0zTIniPPcZlPm7JYVC7w0Az+NZ1Vigsixh1WGxG6X/2/TIIAoMwRRa
	 TQY6z/cK4wTxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mm: imx8mp: Update EEPROM with nWP
 GPIO, label and layout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: robh@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260908215519.33061-1-marex@nabladev.com>
References: <20260908215519.33061-1-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 21:59:41 +0000
Message-Id: <20260908215942.6539C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Devicetree unit address mismatch for `wifi-id` node
--

commit 082793f42f1059431835df44206b8d1014d852b6
Author: Marek Vasut <marex@nabladev.com>

arm64: dts: imx8mm: imx8mp: Update EEPROM with nWP GPIO, label and layout

This commit describes the ID EEPROM nWP GPIO, label, and nvmem layout for
the i.MX8MM and i.MX8MP eDM SBCs.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts =
b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
> index 472c584fb3bd2..92df23e432499 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts

[ ... ]

> +			board-id@100 {
> +				reg =3D <0x100 0x4>;
> +			};
> +
> +			wifi-id@1200 {
> +				reg =3D <0x120 0x4>;
> +			};

[Severity: Low]
Does this unit address mismatch the reg property? The node name uses 1200,
but the base address in the reg property is 120. This will likely cause a
dtc compiler warning for a simple-bus unit address format error.

> +		};
>  	};

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts =
b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
> index cb28cf1cdd23f..dbdf4b8f696f6 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts

[ ... ]

> +			board-id@100 {
> +				reg =3D <0x100 0x4>;
> +			};
> +
> +			wifi-id@1200 {
> +				reg =3D <0x120 0x4>;
> +			};

[Severity: Low]
Is the unit address 1200 a typo here as well? The reg property specifies 120
for the i.MX8MP SBC rev.900, which does not match the node name.

[ ... ]

> +			board-id@100 {
> +				reg =3D <0x100 0x4>;
> +			};
> +
> +			wifi-id@1200 {
> +				reg =3D <0x120 0x4>;
> +			};

[Severity: Low]
Similarly for the i.MX8MP SBC rev.902, should this unit address be updated
to match the 120 specified in the reg property?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908215519.3306=
1-1-marex@nabladev.com?part=3D1
