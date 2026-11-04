Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778583;
	b=hRLTzOP6R3izD8nUe+WkauDaMsW9qTFDrotCx/FqJzlzVwsp3XOSqibFP3JHIb/NgezA
	 VfHHy5EXfTOfUM0HqQYALahBAEToC0k5oX8UpFcA3qEbGB+1ciOeR6dwU8lSK3/zO3sh6
	 qR7NX0OuXa5wOslE2LnV2WxPbnJBX0uVtju79WUqrtcVwbwyYQYcZLqM81//s27q//eCy
	 JqjI/dV8H+WlZ7N+zYah+LxcXfGda0tfqGvAnOy30+Rl3QUpYQC9AEZTuouo0+ub9QkPW
	 31IhIvdM0m3yHqp4nWR0UAQoyuLu0ZuUvUBe8J/NSSdZ4RNaj+PnfkI3Ay6aJHWu6Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778583;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BvzsxMGcK4tTsF2KyG4cJZiZC64v+zY1zq5hd6NpPIQ=;
	b=h3PNmzM3hwPzU5qRnWreXk27hyoI4D9USGq2dXyU71rltWSB9ipaS+JIqt6zXp8ZanVk
	 8tCQneq7U3+RnwR/9ezSBuS+IrqGf2hDhPduNBG+lvDm2YI+aiONhuhKmIcesu8BE0LPz
	 8e32/eruHONf0ZSIaFTcqeDeq6zvLPltko8VYXeLwm3r4wCc/bLGEwHy9QIVc1dZRnTDt
	 CR0J2mVFwju3te8qVlBm1GnRdXIyFShQ14LAEw7WLmNy+QoO+KC8JCpGDVUSqN+pxBium
	 Bt9cpCofyDhFw30oN+vospJ1LIdLYkfsP2S1WigGIN4XqZMgpF3sYuEQPyBfNVmNdFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D3g96b+T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A59606A31B;
	Wed,  4 Nov 2026 07:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D3g96b+T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA6F71F000C1;
	Wed,  4 Nov 2026 07:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793778583;
	bh=BvzsxMGcK4tTsF2KyG4cJZiZC64v+zY1zq5hd6NpPIQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D3g96b+TYuTqThRgwcQ7AtnTsQDvEVUpbmShCBHOXD6pSw/TfD3Y1aqrlBd5Dfkt3
	 VOBJNPsvJ7fJHdKL7YAEwBmoSWtclq9Rjd9nl0Boe6yqtvJ4G92aKTkY6hbxUjRYIs
	 /LQSA1uEUMqWNNqggC91UvvUhS0UIst32dNhQtvwj2wQ2lR88/h4CcwIk6GvXYiNxQ
	 pId9GKQ190k1NCNCBb2X0lrA4hNVlp37MZGRUoYhe46E3PRA3m6kSgGGmhOZjjirnz
	 Zrbhqy2mj9Pe728yx9SUq/wMMcdgsyScTt3NVDTuqzOjDBu880eGx4Tf8wMGSBFUiX
	 ZnRR9PSC9lTlg==
Message-ID: <sashiko-outbox-196825@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/10] dts: imx: Use minimum NAND ECC strength on BSH
 boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haoning Cheng" <Haoning.CHENG@cn.bosch.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261104-add-bsh-smm-m2-v1-2-369f0a77e021@cn.bosch.com>
References: <20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com>
 <20261104-add-bsh-smm-m2-v1-2-369f0a77e021@cn.bosch.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 07:49:42 +0000
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

commit 8322a44ab1436f5d874adef6cee6881bf71a02c7
Author: Michael Trimarchi <michael@amarulasolutions.com>

dts: imx: Use minimum NAND ECC strength on BSH boards

This commit enables the fsl,use-minimum-ecc property on the GPMI NAND
controllers for the BSH SMM-M2 and SMM-S2 boards.

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
Does adding fsl,use-minimum-ecc to these existing board device trees cause =
an
incompatible on-flash ECC layout regression for already-provisioned devices?

In drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c, gpmi_nand_probe() calls
common_nfc_set_geometry() to configure the BCH layout:

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
geo->ecc_strength across the OOB area via get_ecc_strength(). With
fsl,use-minimum-ecc enabled, it instead calls set_geometry_by_ecc_info()
using the NAND chip's minimum required ECC strength and step size, changing
geo->ecc_strength, geo->page_size, geo->block_mark_byte_offset, and
geo->block_mark_bit_offset.

As a result, any NAND partitions written using the previous device tree will
fail to read with -EBADMSG ECC errors. Could the commit message explain why
this change is needed (for example, to match the ECC layout expected by the
bootloader or ROM) and why breaking compatibility with existing on-flash
layouts on these boards is acceptable?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-add-bsh-sm=
m-m2-v1-0-369f0a77e021@cn.bosch.com?part=3D2
