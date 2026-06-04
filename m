Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117043A3E72;
	Thu,  4 Jun 2026 02:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780540278; cv=none; b=b0QAz+GS6vBhGLV7FG/HsAPlC1F8zUOTNvSwnOdoeBgqBQMZ/QOiNgqKupjLa4QOLnXku50YYi3IOaimDbJdUASOP/uHsEpO5V0A1Zw/tkew5CuFAr5txhYEiKSLwgQH+oMg6rpjDhlbLJ8HPFjKIfMdrKCRz/PXSxbQrCWWsLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780540278; c=relaxed/simple;
	bh=XObjbK30ogcOrtRoHbgRSgylo8bxHwR4jXvNswZ3Sv4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o/GlS+Br8E6nfCp7ELMC3A5eL4I1r/r0p+SbZnN7IgHo4/+VmoY0YowLs7Ejq1CfOgBvfuXd4USATlHjaF9oURfScuxZHyWBebykoE5551eR2ShSw+9RH+OMIPqbBXZCa8DAls86cUNMAcjdTivOQq9Z4WY2ElxkTbJ+rx1mtis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9DwHvez; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9DwHvez"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA981F00893;
	Thu,  4 Jun 2026 02:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780540276;
	bh=v7m8T3B3xs5vDvtKuPhQ1LQ2/+3RLF2epXWRl2F9ldc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e9DwHvez/NufEpXssEHW2o4TgMfULgM1H3isymw4opFopTVlfQ67bdB0v5o2VWiGV
	 CVT1rG2c05Yl2O/VO16LtdGbFtXm/6s0ufYG6gIPsxsHzcv9+I3Vx8HqRsx1vUnwuJ
	 BhJZ3XBb0wZ0Qudr87kVXwLOoe3hMobvLnlqf4KDuxuc/kk7TcnEYmjUuGfrd3AaCn
	 UstI88mmKgqZF0DRDlYT3XZgd1pP4O18Ks1BE4oti8uzKuXENjXeGLbVzcW4DEh+gj
	 rDnqyXu+ygLHhxwVjlIf/8SvMOVriShi8gZ8pBqHeAfzdZWoo6TEpOGaXnCehjG72+
	 2YsA/c1iK/4UQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] arm64: dts: imx94: Add Root Port node and PERST
 property
Reply-To: sashiko-reviews@lists.linux.dev
To: hongxing.zhu@oss.nxp.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260604022420.120294-1-hongxing.zhu@oss.nxp.com>
References: <20260604022420.120294-1-hongxing.zhu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 02:31:16 +0000
Message-Id: <20260604023116.6AA981F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added Root Port PERST# properties incorrectly use `res=
et-gpio` instead of `reset-gpios`, causing the PCI core to silently ignore =
them, violating DT schema, and falling back to the deprecated legacy bindin=
g.
--

commit 10fdcd113cd4d5825e1430558167b9577d3cf633
Author: Richard Zhu <hongxing.zhu@oss.nxp.com>

arm64: dts: imx94: Add Root Port node and PERST property

This commit adds Root Port nodes to the i.MX943 PCIe controllers and attemp=
ts
to migrate the PERST reset property from the host bridge to these new Root
Port nodes.

> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx943-evk.dts
> index 7cfd424689507..ed3abd3e76e56 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -1034,12 +1034,17 @@ &pcie0 {

[ ... ]

> +	/* This property is deprecated, use reset-gpios from the Root Port node=
. */
>  	reset-gpio =3D <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
>  	vpcie3v3aux-supply =3D <&reg_m2_wlan>;
>  	supports-clkreq;
>  	status =3D "okay";
>  };
> =20
> +&pcie0_port0 {
> +	reset-gpio =3D <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
> +};

[Severity: Medium]
The commit message mentions adding the reset-gpios property, but is it
intended to use reset-gpio here instead?

The Linux PCI core function pci_host_common_parse_perst() explicitly parses
the Root Port's reset GPIO using of_property_present(np, "reset-gpios"),
which strictly checks for the plural form.

Because of this typo, will the Root Port's PERST GPIO be ignored, causing
the driver to fall back to imx_pcie_parse_legacy_binding() to parse the
deprecated legacy property left on the Host Bridge node? This appears to
defeat the migration effort and violate the PCI bus DT schema.

> =20
>  &pcie0_ep {

[ ... ]

> @@ -1058,12 +1063,17 @@ &pcie1 {

[ ... ]

> +	/* This property is deprecated, use reset-gpios from the Root Port node=
. */
>  	reset-gpio =3D <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
>  	vpcie3v3aux-supply =3D <&reg_slot_pwr>;
>  	supports-clkreq;
>  	status =3D "okay";
>  };
> =20
> +&pcie1_port0 {
> +	reset-gpio =3D <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
> +};

[Severity: Medium]
Does this also suffer from the same typo as the pcie0_port0 node?

Using reset-gpio instead of reset-gpios will likely cause this property
to be similarly ignored by the PCI core's Root Port parser.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604022420.1202=
94-1-hongxing.zhu@oss.nxp.com?part=3D1
