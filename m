Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336635;
	b=fPsLt3hib3pFu2PX9hmzIjNQ9D2qhtiLdhFJFyyQdOQM7LwYd9UXWQ+znoFlsbhGd448
	 Mg51OYYVcQRGtzatemDm51rlTY9ZTfcYjjVb39Lgv0hcWhbm7absxU/gC6/mgiPtHlI3A
	 +VDxs/eMkhJ3k2jUKwH83D4Dbxi2XwTobUzbvjLdUydd/sua+J091NMb10379dI6VkOHV
	 2jExCBCy8crJxaCYC5HK06FixVCbztWlgvWAmSKi39bkHYAVzo9rN8F5Z+ayWk8qpJ5ob
	 ukE69DTu8qBBGXtj5JD0TVjE8+GAPhG0qnJPNAx0WWht1B6BDedOC6HWaNWUSWn5bbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336635;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gKKMKFJ8jd9w9selKiKzD90QbdySenwaAWwxAS6B4nc=;
	b=bdZoyjYV5HxSkxAiKz40p0uT8KRzVL7SlJvI/R2gxAG0lJfPgeGGQQfgewfSyvIm9Ax9
	 DIe2NboPzoKDaNK2TAY9ZdPIQFSkl/sJ6nKvu0JiFGMJUvO/R61x4/DSVeu57uhQds1La
	 RKe36BlS4/3WIajYIdEJ3HEG8Eul5KU/6TYreZJejCEmp+F7eQOzzQRcA7J9xdUDCXv/2
	 vlbJwbCC9uWR3DjCC8QKzt0ZJtxDjBH3rBEzJVOEwgH/AZIN9k2Jy24vkxsyRPfjiEpKn
	 86ZPEFM40p7oP+z9Qm44WDR9MztdW/vjhx/bKlbbwhGXlhzZwaFqTvKFMIRwsnbWrFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IXyo75oZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B5F606A32E;
	Tue, 10 Nov 2026 18:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IXyo75oZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540A21F008A1;
	Tue, 10 Nov 2026 18:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794336634;
	bh=gKKMKFJ8jd9w9selKiKzD90QbdySenwaAWwxAS6B4nc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IXyo75oZklgtjFS/Iksrs1AuFbEk9BfOs4xR456swKIBK5nEkoWpPvJr4XMxHXcN8
	 Ae7vNieK7zAP7quhlGFs6ySSmskcoif5+okK7aCMk6rLji669mnwtZohZQ6PkBW8El
	 kxrl12HO/ilCVTUWHli/cqAPxiVEQNSHgvDSjTMxf0lVfTxei8PVbTJFf3gAWfmOLF
	 2cjE9tnVknHOj9Pmy8yoaTn9f2n/Y02tRw7MU+1M3cWQy3UA6xj0BfbHKO6kTGg5GA
	 rcxf6iNOFGJUUCRCGhi/8IgSOO9tLKpJuw2r8ykmuJOczBdUQJ/Vq437zGu7HUtxoR
	 eHeYOSB1Umdag==
Message-ID: <sashiko-outbox-207610@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] arm64: dts: freescale: Add support for Variscite
 VAR-SMARC-MX8M-PLUS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <b76a07664068aa8cdeada3f44b3b1c4fa56cc887.1794334398.git.stefano.r@variscite.com>
References: <cover.1794334398.git.stefano.r@variscite.com>
 <b76a07664068aa8cdeada3f44b3b1c4fa56cc887.1794334398.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 18:50:32 +0000
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
- [Low] arm64: dts: freescale: invalid 11536000 Hz clock rate on sai3
  node
- [Low] arm64: dts: freescale: unused vddio-supply on TI DP83867 PHY
  nodes
--

commit 50d8452ea2f7f3e97972d70c5d7ed45e6dc9ead0
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: freescale: Add support for Variscite VAR-SMARC-MX8M-PLUS

This commit adds the common device tree include for the Variscite
VAR-SMARC-MX8M-PLUS system on module.

Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8m-plus/var-sm=
arc-mx8m-plus/

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-smarc.dtsi b/arch/a=
rm64/boot/dts/freescale/imx8mp-var-smarc.dtsi
> new file mode 100644
> index 0000000000000..139815cfd5f8c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-smarc.dtsi
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
> +&eqos {
[ ... ]
> +	mdio {
> +		compatible =3D "snps,dwmac-mdio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
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
> +	};
> +};

[Severity: Low]
Are vddio-supply, reg_phy0_vddio and reg_phy1_vddio needed on ethphy0 and
ethphy1?

Neither Documentation/devicetree/bindings/net/ti,dp83867.yaml nor
Documentation/devicetree/bindings/net/ethernet-phy.yaml defines
vddio-supply, so it fails schema validation under ti,dp83867.yaml's
unevaluatedProperties: false rule.  Neither the DP83867 driver nor the PHY
core requests vddio-supply, leaving reg_phy0_vddio and reg_phy1_vddio
unclaimed to be disabled as unused regulators at late_initcall.

[ ... ]
> +&sai3 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_sai3>;
> +	assigned-clocks =3D <&clk IMX8MP_CLK_SAI3>;
> +	assigned-clock-parents =3D <&clk IMX8MP_AUDIO_PLL1_OUT>;
> +	assigned-clock-rates =3D <11536000>;

[Severity: Low]
Should assigned-clock-rates on &sai3 be 12288000 instead of 11536000?

IMX8MP_AUDIO_PLL1_OUT runs at 393216000 Hz (32 * 12288000 Hz).  Requesting
11536000 Hz selects a /34 divider (11565176 Hz), which is not a 256 * fs
multiple for any standard audio rate.  Because clocks is specified on
wm8904_smarc rather than on the simple-audio-card,codec subnode,
simple_util_parse_clk() leaves simple_dai->clk unset and never updates the
MCLK rate in hw_params, so wm8904_set_sysclk() sees 11565176 Hz !=3D
12288000 Hz at 48 kHz and has to fall back to the internal FLL instead of
using MCLK directly.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794334398.gi=
t.stefano.r@variscite.com?part=3D2
