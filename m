Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793846916;
	b=arsnQ8/GbSs8WLiXZNBvTM3HwKe2dMZ5GBLTO+e8uXMj08zPED2lUaLLkD93sOTnvsU/
	 4TeAkKF8sngAgBoScDyxB09R8Emp0Q85FPnSnPB8/amf7xCwhfa8mBkAK563ajFEkSNmW
	 aDpZ6pi9Fmkcj4BRb1wwcrppzy+5WapbM0KqezeKa9wNn6zcWWfP46vml0g1ta0ZUMcNv
	 +GtFmuPegNR1HHFt1QhwaUlakUpW/i/h8cXgVDI7S3bL5YLpcqSuJErxC3/hxPI7zJKbH
	 /I4mO9mbiNvvVqzG77k7PjAooN53k3YDStDLuJpz9LLfmnVTscv1OzR/DDWAmIH05vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846916;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9ARYZxzPbEx1hRafQOl0riUD8QrxKDwB72vNOxrx1hw=;
	b=NybEl6aetWX/IO436/ybhMJ7e0kUHZa0jH/TkFy8TJn3f7okzAxpmp6Ff0mv21+zgMPl
	 Rs/YsKDHmbVGX8hhFVAMpIZx/kKiKGePHjqc2C28f7dH5M58Qxd6/0LCO21AwI1ieMNiU
	 uYfbjGaHNeB95s6OTm2tjfg7LJDBdvAE0G5oGv4rbQGnK0uYmAyq95bCPTgvZ3nZk+2mN
	 fWO1ctJ3azlq2Yn7q0ZaJ1GWK9pyFBRs8C+U5YjkR4LA1kOREwzu+nOiYOBTdIohGkTgA
	 Gg8HsvYurcnUluuGqcYrPld6oKPp1EiFLxsjtr25VxrfD0hEZ1Kwex38n17efGfgajg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RXbAxG8d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C960606A329;
	Thu,  5 Nov 2026 02:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RXbAxG8d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46071F000C1;
	Thu,  5 Nov 2026 02:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793846915;
	bh=9ARYZxzPbEx1hRafQOl0riUD8QrxKDwB72vNOxrx1hw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RXbAxG8dEhRe4XTSz6RPGJy103ZbV4BxYbIfIxQKwA5tBA/p9fGgDwCjEexh5e8qb
	 UPeaMoJVpGmk52d/Pt8W36ZpFRfiSwNPoHM1K+SaCkiiVkOxN7clHyRD2wdwttG1R6
	 BXcL0tyS6otHwkazgiFPV3U9MDedIS7/hQRLj2cXo43HbIsc9cBO5bI6vgG5M0YXU6
	 9VXWRh0XJblkRR3N47NtMPPXFpHfq4gssjB09Y+wB4A9cFSWJJhAHRIZIHMz6Mdoyt
	 1BynhWII/ktHStwb5eKs722CchtBauQP5Ie1ctVs8iRswt+PaXY3zVmBrw4cqck+qA
	 KzuGWyl3jjhpw==
Message-ID: <sashiko-outbox-198484@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/8] dts: imx: Use minimum NAND ECC strength on BSH
 boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haoning Cheng" <Haoning.CHENG@cn.bosch.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261105-add-bsh-smm-m2-v2-2-fb5ffc7da486@cn.bosch.com>
References: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
 <20261105-add-bsh-smm-m2-v2-2-fb5ffc7da486@cn.bosch.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 02:48:34 +0000
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
- [Medium] ARM: dts: imx: unjustified incompatible NAND ECC layout change o=
n BSH boards
--

commit 18a50759ffc5f62c90affe97ba8849157120079d
Author: Michael Trimarchi <michael@amarulasolutions.com>

dts: imx: Use minimum NAND ECC strength on BSH boards

This commit enables the fsl,use-minimum-ecc property on the GPMI NAND
controller nodes for the BSH SMM-M2 and SMM-S2 boards.

>     dts: imx: Use minimum NAND ECC strength on BSH boards
>    =20
>     Configure the GPMI NAND controllers on the BSH SMM-M2 and SMM-S2
>     to use the minimum ECC strength required by the NAND flash.
>    =20
>     Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
>     Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
>=20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/=
boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> index 2d9f495660c9a..aac211a9f9ebd 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> @@ -26,6 +26,7 @@ &gpmi {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_gpmi_nand>;
>  	nand-on-flash-bbt;
> +	fsl,use-minimum-ecc;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts b/arch/a=
rm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
> index 11a1ba5bfdb7e..df11f81ac50c1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
> @@ -21,6 +21,7 @@ memory@40000000 {
>  &gpmi {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_gpmi_nand>;
> +	fsl,use-minimum-ecc;

[Severity: Medium]
As reported by Sashiko on v1 [1], both imx6ulz-bsh-smm-m2.dts and
imx8mn-bsh-smm-s2.dts have been in-tree since 2021 without
fsl,use-minimum-ecc.

In drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c, gpmi_nand_probe() calls
common_nfc_set_geometry() to configure the BCH hardware:

	use_minimun_ecc =3D of_property_read_bool(this->dev->of_node,
						"fsl,use-minimum-ecc");

	/* use legacy bch geometry settings by default*/
	if ((!use_minimun_ecc && mtd->oobsize < 1024) ||
	    !(requirements->strength > 0 && requirements->step_size > 0)) {
		dev_dbg(this->dev, "use legacy bch geometry\n");
		err =3D legacy_set_geometry(this);
		if (!err)
			return 0;
	}

Without fsl,use-minimum-ecc (when mtd->oobsize < 1024),
common_nfc_set_geometry() calls legacy_set_geometry(), which maximizes
geo->ecc_strength across the available OOB area via get_ecc_strength().
Adding fsl,use-minimum-ecc bypasses legacy_set_geometry() and instead calls
set_geometry_by_ecc_info() to use the NAND chip's minimum required ECC
strength and step size.

Because the GPMI BCH controller interleaves metadata, data chunks, and ECC
parity bits across the physical page and computes geo->page_size,
geo->block_mark_byte_offset, and geo->block_mark_bit_offset from
geo->ecc_strength and geo->gf_len, switching from legacy_set_geometry() to
set_geometry_by_ecc_info() alters the physical on-flash page layout.

Won't this change cause a regression on existing boards where NAND
partitions, UBI volumes, or on-flash bad block tables formatted under the
previous device tree become unreadable with -EBADMSG ECC errors? Could the
commit message also explain why this incompatible layout change is needed
(for example, to match the ECC geometry used by U-Boot or the BootROM) and
how existing flashed devices are affected?

[1] https://lore.kernel.org/r/20261104-add-bsh-smm-m2-v1-2-369f0a77e021@cn.=
bosch.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-add-bsh-sm=
m-m2-v2-0-fb5ffc7da486@cn.bosch.com?part=3D2
