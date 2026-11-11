Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794431057;
	b=mVPVzwg/VZcuOUgz7jc/jjT2PQGNsBTuqE9XXq6ZqgL8/elNMKXxCeiCbarmceQvtDkx
	 qQG+/LQwVPugoH8faXzrcWY2XQs++O/JGAaMWuS9QnTSRRmJc0obfcqWjhzgpEknWW6yL
	 j0TViHQL5YJbT7/EwYF7LnjHrwSHefd/CIwg/kHi9y786bVOQ8TvshcQT9iOwuWTWAC5R
	 RDWC6aeUuRqTr6iROUntDJQgc49aedDVqQORjYqM1qUuOX7BNIFiRtC/Bpu7+2+TDU7Fh
	 nz2/+wfoQJgPAshLsF/hUeI1JQos2R1WD5Mk04o0qr3nliaypfyOfYdnl2RhmwZ6FuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794431057;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ib28zzmysKeagKhCpTqFO2Ytr9Wswk4FF1xM0sAQX78=;
	b=ckoOZN+6QnKzrwxNuBAO7MZSMdEwfcU8HNx5ZQe2X6d4UN7umR75KppbK9fSltCexPPE
	 ElPBrB7ogzzUhZU8tIThjeSdxfdkZ1sMrlKCL21v0PDPKJOLBq96WbWyopq+G24HDnI7D
	 BazQSesiSgs6UtdjEw8rmJke5mvwWmP49XD8/lrGImaEdmyCa3wOQaDdrJDX9mTxAmfGg
	 3WSZ1ukfQwCdtHTMSXmStIIDBD+gftBpaA52mlQyfZRJZLtxvAw15TCnCZOzmjqrpZAlm
	 UMi55ta6j3zfpFgq/Uvx8E/hhUeCDT4FQULx+34v7P7/fSvGGLq8+jfkgXrW8Do16lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ac5Nvvgs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0B0606A326;
	Wed, 11 Nov 2026 21:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ac5Nvvgs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9268F1F00A05;
	Wed, 11 Nov 2026 21:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794431056;
	bh=ib28zzmysKeagKhCpTqFO2Ytr9Wswk4FF1xM0sAQX78=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ac5NvvgsN1Ccgs+laNnQIyiQqThkWe5RM6e/ZGyyZHLeACXzAj9N8emVMikBD/Sok
	 5a20lI4/n7mnAyqn0oPOBGeaJ/TSx2c0Brf38JZwgULobYLe8d4ISyKHtsGJHSTtAt
	 /t2LNqriTREUdv/VJ2jeji2yw7rLBB9fptwyT7Jtvfm9BxSQLMQCgi20HhyOgPd3U9
	 sEpI3I64vUSBCpl7apKncFHah13uB6d/MfdWiT/HQPLTyNIRvjuWQGAIQkfI38+zxv
	 2yLNCCJ+jLwYTH1eooDd3pBjzvvkqhW3QQlUEuQESzzlYxNt9OGW5Acxkd/FylbR1l
	 NDLcFvrImD9Fw==
Message-ID: <sashiko-outbox-209686@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: freescale: Add support for Variscite
 VAR-SMARC-MX8M-PLUS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <b76a07664068aa8cdeada3f44b3b1c4fa56cc887.1794420001.git.stefano.r@variscite.com>
References: <cover.1794420001.git.stefano.r@variscite.com>
 <b76a07664068aa8cdeada3f44b3b1c4fa56cc887.1794420001.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 21:04:16 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] arm64: dts: freescale: invalid vddio-supply on imx8mp-var-smarc
  PHY nodes
- [Low] arm64: dts: freescale: invalid 11536000 Hz clock rate on sai3
  node
--

commit c95e5618fc5c11cbd6b4b895fc99908ac72c78a0
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: freescale: Add support for Variscite VAR-SMARC-MX8M-PLUS

This commit adds the common device tree include file for the Variscite
VAR-SMARC-MX8M-PLUS system on module.

Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8m-plus/var-sm=
arc-mx8m-plus/

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-smarc.dtsi b/arch/a=
rm64/boot/dts/freescale/imx8mp-var-smarc.dtsi
> new file mode 100644
> index 0000000000000..139815cfd5f8c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-smarc.dtsi
> @@ -0,0 +1,640 @@

[ ... ]

> +	reg_phy0_vddio: regulator-phy0-vddio {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vddio_phy0_1v8";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +	};
> +
> +	reg_phy1_vddio: regulator-phy1-vddio {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vddio_phy1_1v8";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +	};

[ ... ]

> +		ethphy0: ethernet-phy@4 {
> +			compatible =3D "ethernet-phy-ieee802.3-c22";
> +			reg =3D <4>;
> +			reset-gpios =3D <&pcal6416 6 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <10000>;
> +			reset-deassert-us =3D <100000>;
> +			vddio-supply =3D <&reg_phy0_vddio>;
> +			ti,min-output-impedance;
> +			enet-phy-lane-no-swap;
> +		};
> +
> +		ethphy1: ethernet-phy@5 {
> +			compatible =3D "ethernet-phy-ieee802.3-c22";
> +			reg =3D <5>;
> +			reset-gpios =3D <&pcal6416 7 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <10000>;
> +			reset-deassert-us =3D <20000>;
> +			vddio-supply =3D <&reg_phy1_vddio>;
> +			ti,min-output-impedance;
> +			enet-phy-lane-no-swap;
> +		};

[Severity: Low]
Are vddio-supply, reg_phy0_vddio and reg_phy1_vddio valid for ethphy0 and
ethphy1?

Neither Documentation/devicetree/bindings/net/ti,dp83867.yaml (indicated
by ti,min-output-impedance) nor drivers/net/phy/dp83867.c defines or
requests vddio-supply, so the property fails schema validation and leaves
both fixed regulators unused.  Even if a SOM variant populates an AR8031
PHY, at8031_register_regulators() matches a child node named
vddio-regulator under the PHY node to configure its internal 1.8V RGMII
regulator, so pointing vddio-supply at top-level fixed regulators will not
program the AR8031 internal regulator either.

[ ... ]

> +&sai3 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_sai3>;
> +	assigned-clocks =3D <&clk IMX8MP_CLK_SAI3>;
> +	assigned-clock-parents =3D <&clk IMX8MP_AUDIO_PLL1_OUT>;
> +	assigned-clock-rates =3D <11536000>;

[Severity: Low]
Should assigned-clock-rates on sai3 be 12288000 instead of 11536000?

IMX8MP_AUDIO_PLL1_OUT runs at 393216000 Hz (32 * 12288000 Hz), so
requesting 11536000 Hz selects a /34 divider and outputs 11565176 Hz on
IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1.  Because clocks is only specified on
wm8904_smarc and not on smarc_codec_dai, simple-audio-card does not
reprogram MCLK during hw_params, and wm8904_set_sysclk() sees 11565176 Hz
instead of 12288000 Hz and falls back to its internal FLL rather than
using MCLK directly for 48 kHz audio.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794420001.gi=
t.stefano.r@variscite.com?part=3D2
