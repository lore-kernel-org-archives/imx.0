Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CBE44F564;
	Fri,  9 Oct 2026 19:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791575371; cv=none; b=c0v6t6qCzvyoIgK6qRKpJdnTRNoGwkJ4EsZiLfqlWl9r/FIxQ1sikU//g5YtanvBS2nSQy9Ecl2CaFJLr02MxMnPAzbsnLHZCr+K0hc4i/SBhSnw8t9ZPQnmelm4OB4FiRX6Dnc7tE9MRMlJW98dDkC5RjQRCVrk7y8E4OUNeAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791575371; c=relaxed/simple;
	bh=dgngywEBVHvAWH2my/Gvtg1m1TKfqMBoo5XoShQKhJM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=cf6ouZx8ufYWiNlfdDwQnEuoWAHluJYQ4OHYajuDLw8LLvnwi5RM0v8SBnDiwbsb7kxlB7q0eEEIyAU4V+w5BoWGnZeSQ4OQlE+4FT8d7F5OKyuxinEsU1ZbLGfVqvVI9kiyndknJByCo7pctq04nvUzuVsqunPDLmkuHVkDSuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJ1POv3f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJ1POv3f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE13E1F000FF;
	Fri,  9 Oct 2026 19:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791575365;
	bh=51j7XQSpGVADgH2JbKRQSIMIeQ8Qrvhy6krzVGg/6fw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UJ1POv3fplSNg4WPh0u/MV26AW6P7/Mlh7PFDnpSUeIf5yHLdQUxTlrynBcbc167X
	 pzJgaoRkuRZpfeQa2NU4dLJyZoNMj6S5rRSHsC28PqUX424UciThJquzroMFMDcpGZ
	 TfcAfqaPSMLqvXPWQMQRHJo3xPrf6+YIMsUnJibXnJC95V6JMSP0S6SUSD3N5Sr1Cr
	 GDZLfl4+z1OIS2Rjroaf1aXmY++DyJTr9W/qjlzIPOcyllPfY1c060t6jyOUWmq6HI
	 91chlSwcfKSh2lVaHH9EAHkNnyyiDuYJ0Fm3tSCkgzVkGON0+2Y1DPuRq5gHW+mF8h
	 Wc4nNbnYsCS7w==
Message-ID: <sashiko-outbox-166012@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/13] ARM: dts: imx6ul: Extend VAR-SOM-6UL and add
 DART-6UL files
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <e11cdc950e41b502e5449830d5f6a82568fc043a.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
 <e11cdc950e41b502e5449830d5f6a82568fc043a.1791487179.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 19:49:24 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: net: micrel: boolean property assigned integer value <=
1>
--

commit 7e70ac71fa47849af4ee0ecb85b6da2be68dfac5
Author: Stefano Radaelli <stefano.r@variscite.com>

ARM: dts: imx6ul: Extend VAR-SOM-6UL and add DART-6UL files

Add the DART-6UL module description and wrappers for i.MX6UL,
i.MX6ULL and i.MX6ULZ, plus an i.MX6ULZ wrapper for VAR-SOM-6UL.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi b/arc=
h/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi
> new file mode 100644
> index 0000000000000..f7190f6d50b59
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi

[ ... ]

> +&fec1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_enet1>, <&pinctrl_enet1_gpio>, <&pinctrl_enet1_=
mdio>;
> +	phy-mode =3D "rmii";
> +	phy-handle =3D <&ethphy0>;
> +	status =3D "okay";
> +
> +	mdio {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		ethphy0: ethernet-phy@1 {
> +			compatible =3D "ethernet-phy-ieee802.3-c22";
> +			reg =3D <1>;
> +			clocks =3D <&rmii_ref_clk>;
> +			clock-names =3D "rmii-ref";
> +			reset-gpios =3D <&gpio5 0 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <10000>;
> +			reset-deassert-us =3D <100000>;
> +			micrel,rmii-reference-clock-select-25-mhz =3D <1>;

[Severity: Low]
Does this assignment cause a dtbs_check schema violation?

The micrel,rmii-reference-clock-select-25-mhz property is defined as a bool=
ean
in the dt-binding schema. Assigning it an integer value like <1> will trigg=
er
a warning during Device Tree compile validation.

Could this be specified simply by its presence without an assigned value,
such as: micrel,rmii-reference-clock-select-25-mhz; ?

> +			micrel,led-mode =3D <1>;
> +		};
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791487179.gi=
t.stefano.r@variscite.com?part=3D6
