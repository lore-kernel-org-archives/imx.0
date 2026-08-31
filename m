Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069153D8107;
	Mon, 31 Aug 2026 23:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788217844; cv=none; b=fIvMK+pRlaRDGy2VLVVMx8ECSXM8GisplK8n1mLFlXn+Bs6mx0Ml8I/a2S08g41xMq5kMDWzhva5yVlxkwZl1yWPkNi2pxb0k+9fjKtgIbpoXKyhtbwMOqBbBzUUnZb1kQ9mnIBPGiFdnIdY5H0C1NjYtlhA1VEIByD8M3QfQXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788217844; c=relaxed/simple;
	bh=xl7LbIGRBsuDrwie13653oun67iC8enxhMPEldnEQLM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kXHn2i+xc5u6+ejXyNhXxanLVN0rxuPpJgLv1x+1OqCWHpFdjlm2tFazu24BXkPRRATFPSMfJQ408J8N3uXpYMRzybh5b5/ch6HBFHDiBZP7zzcG0gzFbPOyUlpwirK7dN9mscFxUYX1xDt314d6FaF4uaz+lv62NWzfI+jjVxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=btaJLjeQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="btaJLjeQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59BBF1F000E9;
	Mon, 31 Aug 2026 23:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788217842;
	bh=UuB7C8cgSm9clnhGnd02TCPdT42Hq2aOMmvhvKCHVsE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=btaJLjeQQa11Gmf8MfMDPpywd8OYxn9uVEFOUZ8xX4HNahj3pB2E34ll9KY9CS6pM
	 JgLwPnR5OzpQVtFO088krheh8iKFtddtfm48ex4mChSTgDyLvVnlcqrv8GDQFEnNAy
	 Paypick5xd8k+1kB9YJV5LJ8UheuvhMVE0se2+2bjfzJ9DOJq9GPEWMxHBeK9rAypQ
	 r1YGrHy3d4hkNxnMx8RgbKrIWBxcmFe5SJwpsy+k6fkcDS4GksHVm0ASBLlA2/eeAj
	 BoHl/rpqsOCvJDmYF8vspd9P2dpY1gAAHQ5V+7gvoGK85C3eQuwL+6HfQnqlQtaWbj
	 D2Wbl6SaUy7ag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <7a3aa8bc7d4613998904db4fbbae03d213c6c30d.1788184274.git.stefano.r@variscite.com>
References: <cover.1788184274.git.stefano.r@variscite.com>
 <7a3aa8bc7d4613998904db4fbbae03d213c6c30d.1788184274.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 23:10:41 +0000
Message-Id: <20260831231042.59BBF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `wm8904` codec references an unconfigured and incorrect cloc=
k (`IMX7D_AUDIO_MCLK_ROOT_DIV`) instead of the actual physical clock provid=
ing its MCLK.
--

commit 1b158b02c4e2ef7937d25acb3234a66676fd29b6
Author: Stefano Radaelli <stefano.r@variscite.com>
Subject: ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support

This commit adds device tree support for the Variscite VAR-SOM-MX7 system
on module. It introduces the common SoM description along with support for
eMMC, NAND, WM8731, WM8904, and the V2 hardware revision.

Link: https://variscite.com/system-on-module-som/i-mx-7/var-som-mx7/

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8904.dtsi b/arch/a=
rm/boot/dts/nxp/imx/imx7d-var-som-wm8904.dtsi
> new file mode 100644
> index 0000000000000..b56f3680edcff
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8904.dtsi
[ ... ]
> @@ -0,0 +1,118 @@
[ ... ]
> +&i2c2 {
> +	wm8904: audio-codec@1a {
> +		compatible =3D "wlf,wm8904";
> +		reg =3D <0x1a>;
> +		#sound-dai-cells =3D <0>;
> +		clocks =3D <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;

[Severity: Medium]
Does this code assign the wrong clock to the wm8904 codec's mclk?

The codec is configured to use IMX7D_AUDIO_MCLK_ROOT_DIV, but shouldn't this
point to the clock actually driving the MCLK pad (such as
IMX7D_SAI1_ROOT_CLK)?

If the driver queries the frequency of this incorrect clock tree node (which
defaults to 24MHz) instead of the actual 12.288MHz rate driven by the SAI1
pad, it may miscalculate its internal PLL/FLL configuration.=20

Could this result in incorrect audio playback speeds or a failure to lock
the FLL when the audio subsystem initializes?

> +		clock-names =3D "mclk";
> +		AVDD-supply =3D <&vgen6_reg>;
> +		CPVDD-supply =3D <&vgen6_reg>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788184274.gi=
t.stefano.r@variscite.com?part=3D2
