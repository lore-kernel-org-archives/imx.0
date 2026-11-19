Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084630;
	b=JKHoCowjKjRHrAsR//ogIzkNrI0ii4aQJp1ZsSt2g5+0xK7wjgb9oroLc4KsSMWJAO6X
	 kJ7j81wGrGkO7THyfAROZvsosdoUHL0uGTbRSPYMAB9REvxu9+SFoTjq0e3C4jorkFKBt
	 CDxKv0yVPsPfpmscZJPSiRyi8CwEuAUx9JHxjqeoWiaqrHkigmR97EyzjW9wXcPXg8KiS
	 80PY0HdAx9Y97Ug+Gxxt2hkA7vwpHFKw4oQZQO1dj1Cv+h9aauhrecSe2kQtz02GxCWM4
	 1Z+RXvxVuyqIYwwidVdwvT8thTnWZs+A82ey+4ZUZhzwVpATy5CmHkMrI5rskIKY/Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084630;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lgru1Gk8n5I20r6M7MuPJKGRJqFhrO56ji/Yo6ZHYgc=;
	b=4SN/bPbhP4t0/EJYQE4OHO7atJ4Vy4klVRWO8GgYUtnNEwafDLDgiqAPE2yP7mz+MtU0
	 zeiO2I+0O9opoooOCC2a0RElPjFK1cEk5TQYCFcf7ftQxD6ig32prpkzut4k7XAIgIhWS
	 iworXEDmj/cVzzdnwoSSYNHsl/eJNkI+EJ6T5NnKLy1C2mUY7/arZ2DJNj4KreJjlKBzO
	 R5hKryb6LG8CQFCMEPia++RhAQptAKWkbK6vD79sir0pG9lxba5T/6tD6tffCYL/68XRe
	 H3zvAd9z9hkTYHrVTlAzQsRd5mBfOvT0kIcC9vHl1P3LQpt4qaSuXDNVC57+fjANNvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gG4zAM6Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF52D606A320;
	Thu, 19 Nov 2026 10:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gG4zAM6Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13FCD1F000C5;
	Thu, 19 Nov 2026 10:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795084629;
	bh=lgru1Gk8n5I20r6M7MuPJKGRJqFhrO56ji/Yo6ZHYgc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gG4zAM6Qu9vIQMPURw0MF1+eVvLVONhnW85wgThJFADQfcA9pm9aQ37mzWSGwdu/x
	 UejCR8x+o7XS0A5FG59MsjwO0+Je0sJVqI1UxsgxUPPQWhCoBKoqQxbhUxIaiQsjOb
	 isBbsV0PE5S4ThKlRShhQLkFeIIEYtub9dudnG+baZMthvXi9hDJ2cSGz68Jw8W0bb
	 re15Pr+frjCKa0o9nGYKRHDGKRlkoZlViC0Ve7jOCREM2Zk5bFmQvMRPffEIvd42su
	 NHGRtHWT1BkADd/2Fq64NFwebj6fbouFIM89Y1m87ijBjViROLBiRrzpBWUptEghoG
	 1kDzeygzzifxQ==
Message-ID: <sashiko-outbox-222965@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: dts: imx6qdl-mba6: Add EEPROM nvmem cell for all
 board information
Reply-To: sashiko-reviews@lists.linux.dev
To: "Max Merchel" <Max.Merchel@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261119102531.2995127-1-Max.Merchel@ew.tq-group.com>
References: <20261119102531.2995127-1-Max.Merchel@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 10:37:08 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ARM: dts: imx6qdl-mba6: duplicate @20 unit-address in
  nvmem-layout
--

commit b5a0ac272fe3356ca3f0ff5cbf739f7f5d760dab
Author: Max Merchel <Max.Merchel@ew.tq-group.com>

ARM: dts: imx6qdl-mba6: Add EEPROM nvmem cell for all board information

This commit adds an EEPROM fixed-layout nvmem cell at offset 0x20 covering
board information on MBa6a and MBa6b carrier boards.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi b/arch/arm/boot=
/dts/nxp/imx/imx6qdl-mba6a.dtsi
> index aca320ee8f476..9b199b277c220 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi
> @@ -29,6 +29,10 @@ nvmem-layout {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
> =20
> +			board_info: board-info@20 {
> +				reg =3D <0x20 0x60>;
> +			};
> +
>  			mba_mac_address: mac-address@20 {
>  				reg =3D <0x20 0x6>;
>  			};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi b/arch/arm/boot=
/dts/nxp/imx/imx6qdl-mba6b.dtsi
> index c7bbd6195fef1..517913abbc66d 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi
> @@ -39,6 +39,10 @@ nvmem-layout {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
> =20
> +			board_info: board-info@20 {
> +				reg =3D <0x20 0x60>;
> +			};
> +
>  			mba_mac_address: mac-address@20 {
>  				reg =3D <0x20 0x6>;
>  			};

[Severity: Low]
Does adding board-info@20 alongside mac-address@20 under the same
nvmem-layout parent in both dtsi files cause duplicate unit-address dtc
warnings?

Because both enabled sibling nodes share the @20 unit-address and overlap
at offset 0x20, building the MBa6x DTBs with W=3D1 or W=3D2 triggers
unique_unit_address_if_enabled and unique_unit_address warnings.  Could the
fields be defined as non-overlapping cells at their respective offsets, or
exposed through a dedicated nvmem layout?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119102531.2995=
127-1-Max.Merchel@ew.tq-group.com?part=3D1
