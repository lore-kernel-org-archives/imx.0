Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CBB371065;
	Thu, 11 Jun 2026 07:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164753; cv=none; b=iVuoPkZslD9SbQkiQ7bgKDHO9MbD8xAC0zZL4XfavsTGIwrNB0LVQunuFJyI3l4LOPjH459RT9GUvQLdueUPC5JpM2/Z3ViNL5VCe/GuObKygrcq0IiFHZ6uKyCKW5OdoaIdkXUroiWl2Xt8sxwDRhtNog0gnJ5UZ4AYAtqKcPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164753; c=relaxed/simple;
	bh=sjwnPL4FlgueGCT5QoKqiahVrhEuYKmA0r1My4jx34c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GdbHi8zblklH2StRGsUMyluexq42vR9oSAd1aAC3V/EmRc57AYve4JZIX40yhyj9hsnUalanDnWJQ40AephzXTD9sEFS9emnmG7F0ur67wRkIauhvnuc1zrcoVKIJUvcSlSbgUAdaG/Eu4J+14Lxt799KAtBlj+BUGQQvorBQgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRuxSVm3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRuxSVm3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB011F00893;
	Thu, 11 Jun 2026 07:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781164752;
	bh=C3AZ8o2HUdh7PC0h6Ws5LV32kq4gzjgfYRKxWl0KUus=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kRuxSVm3ha76kOo8h/c0ikcanFSstCSogEkE/y4xLdI60K9hhdADRQFo+HyCdd8dM
	 bWcjMwfEc8wbeiuvWkh7Ap4tkPx3PYRKYG7doSteaPvc1qZ45mUTw+rr26tugvxGUh
	 vLa9nvHwPEIOoTz8kndnFRERyUewopsfBJdead+XzJe8qAlbhnH4ype6taKiOMDeuE
	 PjxykFUJ2wc9KNQ49ZRCLgXG/Rx/XFPcBd6V/CVsbox9al42rhNI5QJkp6BZcPcTU3
	 /5eessU8ACK12D3pYh6O5LNoazYczdQ3TwFiLlBk/yQIuUHYKXTmGcDUuwk/0Lq2fQ
	 jIMGAjNs7V+/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] arm64: dts: imx94: Add Root Port node and PERST
 property
Reply-To: sashiko-reviews@lists.linux.dev
To: hongxing.zhu@oss.nxp.com
Cc: conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260611075057.2892593-1-hongxing.zhu@oss.nxp.com>
References: <20260611075057.2892593-1-hongxing.zhu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 07:59:11 +0000
Message-Id: <20260611075911.AAB011F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Moving `vpcie3v3aux-supply` from the Host Bridge node to the Root =
Port node causes the PCIe controller driver to fail to find and enable the =
auxiliary power supply.
--

commit 881f61760fe4035aacb7e254c5a7890c62c2bcbf
Author: Richard Zhu <hongxing.zhu@nxp.com>

arm64: dts: imx94: Add Root Port node and PERST property

This commit moves the reset-gpios property to the new Root Port node as
recommended. It also moves the vpcie3v3aux-supply properties from the Host
Bridge nodes to the newly created Root Port nodes.

> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx943-evk.dts
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -1034,12 +1034,15 @@ &pcie0 {
>  		 <&pcie_ref_clk>;
>  	clock-names =3D "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
>  		      "ref", "extref";
> -	reset-gpio =3D <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
> -	vpcie3v3aux-supply =3D <&reg_m2_wlan>;
>  	supports-clkreq;
>  	status =3D "okay";
>  };
> =20
> +&pcie0_port0 {
> +	reset-gpios =3D <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
> +	vpcie3v3aux-supply =3D <&reg_m2_wlan>;

[Severity: High]
Does moving the vpcie3v3aux-supply property here break the auxiliary power
regulator initialization for this controller?

Looking at imx_pcie_probe() in drivers/pci/controller/dwc/pci-imx6.c, the
driver retrieves the regulator directly from the host bridge device node:

	imx_pcie->vpcie_aux =3D devm_regulator_get_optional(&pdev->dev, "vpcie3v3a=
ux");

Since the pci-imx6 driver hasn't been updated to look for the supply in the
Root Port child node, will devm_regulator_get_optional() now fail to find it
and leave the 3.3V auxiliary regulators disabled during PCIe initialization?

> +};
> +

[ ... ]

> @@ -1058,12 +1061,15 @@ &pcie1 {
>  		 <&pcie_ref_clk>;
>  	clock-names =3D "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
>  		      "ref", "extref";
> -	reset-gpio =3D <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
> -	vpcie3v3aux-supply =3D <&reg_slot_pwr>;
>  	supports-clkreq;
>  	status =3D "okay";
>  };
> =20
> +&pcie1_port0 {
> +	reset-gpios =3D <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
> +	vpcie3v3aux-supply =3D <&reg_slot_pwr>;

[Severity: High]
Will this similarly cause the regulator for the second PCIe controller to
remain disabled, as the pci-imx6 driver will still search the parent &pcie1
node for the vpcie3v3aux supply?

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611075057.2892=
593-1-hongxing.zhu@oss.nxp.com?part=3D1
