Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34912F9DA1;
	Thu, 21 May 2026 17:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779384622; cv=none; b=mlUlERWSgRzlEn30cuCP06yIZmoWjkcSiOxoTkyoVCB8uVBm1YcSiYd31dcsN3gdXrBudMpewIWHf/cDWarjBEqaU/wiMViUfb/kwAeiqsxfZQJA2m05rSXwDzuKs8u6HK3gWnkLiuZkH5OdRnWnoT6iq1eLJ5ofDEx3LvFxvgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779384622; c=relaxed/simple;
	bh=OlNqmeui+cpmy8Iowi2tl+N6zKfaammDMIENaa21R5U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I6lkiLstTFHynLggBzbtV/LZR3VUSzcwkzUj7pw41zx4zHqtMV9VOuqzZESMxgi316ztADu7siYaKMWeia+jTHHCWdiKoTI7mSa8B3EdiPhuvVLF/uTdQXFhrxSiA0kcGFKBSOdKu4LZX3sQ6UkLoZxBfYIeGX4H9aEPFRy5BPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUhSTBYm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUhSTBYm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A03E1F000E9;
	Thu, 21 May 2026 17:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779384620;
	bh=X2bg+L3XfdpbesakUz3ZHBqtrMvx+hp8jzQJ8KVvhxk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TUhSTBYmHOJ5i5rCparJkisWlcmdBVf0xmCe1JZZSoWyJz/8AF0sVQ/VGpqipMH8+
	 0Jy9Fsv2zTJxRsGzAgd/kj1SgNvb0VCK2s8+SnAITy7IrhXO41CqJ1KSx1NqdHy5B/
	 DmoDJYj6jWuwaeF+q+5n27P8K3M/EpZ4felVopi5yZYeLBNLpQOLKzd0rMh9IZEQVd
	 edDkuwm2ZJo1sxjRxZmFl8pOZIX52eIgAeeFD9wgia6+KoDV/o5GFzkANB61SENcum
	 jDZkIUhMTC3nec/sI3fXndav/Tq9f8zHsOXm325FSYTLYLDdYi3K17zZpDTKFS1lrh
	 Zsi/s9kmzPv7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] arm64: dts: freescale: add Aquila iMX95 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Franz Schnyder" <fra.schnyder@gmail.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260521-add-aquila-imx95-v4-2-5a7f86c824f5@toradex.com>
References: <20260521-add-aquila-imx95-v4-2-5a7f86c824f5@toradex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 17:30:19 +0000
Message-Id: <20260521173020.0A03E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The DisplayPort connector references a disabled DisplayPort brid=
ge, leaving dangling references and rendering the connector non-functional =
while wasting power.
- [Medium] The dedicated power supply regulator for the disabled DSI-to-DP =
bridge is incorrectly marked as always-on, wasting power.
--

commit 3392fc6b669bcc9dccbd369d342a80d81c494ed6
Author: Jo=C3=A3o Paulo Gon=C3=A7alves <joao.goncalves@toradex.com>

arm64: dts: freescale: add Aquila iMX95 support

This commit adds support for the Toradex Aquila iMX95 computer-on-module
and its corresponding development carrier board.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx=
95
Link: https://www.toradex.com/products/carrier-board/aquila-development-boa=
rd-kit

> diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts b/arch/ar=
m64/boot/dts/freescale/imx95-aquila-dev.dts
> new file mode 100644
> index 0000000000000..3df17700b632f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
> @@ -0,0 +1,389 @@
[ ... ]
> +	aliases {
> +		eeprom1 =3D &carrier_eeprom;
> +	};
> +
> +	dp_1_connector: dp0-connector {
> +		compatible =3D "dp-connector";
> +		dp-pwr-supply =3D <&reg_dp_3p3v>;
> +		type =3D "full-size";
> +
> +		port {
> +			dp_1_connector_in: endpoint {
> +				remote-endpoint =3D <&dsi2dp_out>;
> +			};
> +		};
> +	};

[Severity: Medium]
Since som_dsi2dp_bridge is disabled by default in imx95-aquila.dtsi and not
explicitly enabled in this device tree, does this connector node leave
dangling references?

Without status =3D "disabled" on this node, the display-connector driver wi=
ll
probe successfully and unconditionally enable its dp-pwr-supply (reg_dp_3p3=
v),
wasting power on the carrier board for an unusable interface.

Should this connector be disabled by default or have the bridge enabled her=
e?

> diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64=
/boot/dts/freescale/imx95-aquila.dtsi
> new file mode 100644
> index 0000000000000..69dc962a24a1d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
> @@ -0,0 +1,1160 @@
[ ... ]
> +	reg_dp_1p2v: regulator-dp-1p2v {
> +		compatible =3D "regulator-fixed";
> +		/* CTRL_DP_BRIDGE_EN */
> +		gpios =3D <&som_gpio_expander_0 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +		regulator-max-microvolt =3D <1200000>;
> +		regulator-min-microvolt =3D <1200000>;
> +		regulator-name =3D "On-module +V1.2_DP";
> +		vin-supply =3D <&reg_1p8v>;
> +	};

[Severity: Medium]
Since this regulator is a dedicated power supply for som_dsi2dp_bridge which
is marked as status =3D "disabled" below, is it necessary to have the
regulator-always-on property here?

The always-on property bypasses the driver and forces the regulator core to
unconditionally assert the CTRL_DP_BRIDGE_EN GPIO at boot, continuously
powering the bridge chip on the module even when disabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-add-aquila=
-imx95-v4-0-5a7f86c824f5@toradex.com?part=3D2
