Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389925;
	b=yQpZ6njmdsnZ01gtqwjEjvo4OIlxDo6hre7oKCHnzsahQt9BsqlBmv7fBS0aacyQr08n
	 zaGactsVmYnrx8kwaMdWtJ0kPkJDUQci/MK86MJHLC5v7etMgaWL3vTWEikK+NNJzESGl
	 X8izxl1WpoFliZ/Sj4sne/1u6CWs20IHJj5M70Qb58RPDB3mcNrSSJwqU98+cPkxDO7At
	 rzjTf2o03dNvRwPSdJINIyhEypsCPi94BP/pV9CSIzowXCcI1W7nJV0j4DIDnK/kTm1/F
	 W4oDrztaAa36ALyfQX2R+XmV1vjT+4WS3lq/Lqr+kuK1sDaP7sdzZzO+Rxs+ZhKl4WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389925;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=evTFQd8KFFfK85qF/XVx3wpXRyON7mQEeVEtW4PbUkQ=;
	b=bAIi2pmVokmAgeE982MpHaqdk2rEcu2FblcMDlDIkpdIZsELrezc7s/3uy/Fnc2RXE0y
	 gBAi8//8qLjCNAoIZsRQ52wCOnVvA6s9DiDUxDxDOM3ZkL2DmCwi+EWifcr42cXSY1Nvp
	 QBeuSuSBeIKHGWd72IkYXoghowjbNA3QAvHIh/um0yjU5jVuVdy7rSom/bHrQG+GeIecf
	 di6046TwUqsyzRpdBL9VexvKWGVOF3GdjIksSkLV0ZZlKpPWsyf7vEq0dBDB6EQz3mEJP
	 S44PKJZHli7ccGWNcHfxupAbAyEszkQx0w2mfITzUkSoZsKOZ8K2+CG/H6CjASMBJnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FPHTJbxD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C52E60A2604;
	Wed, 11 Nov 2026 09:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FPHTJbxD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B221F00A05;
	Wed, 11 Nov 2026 09:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389925;
	bh=evTFQd8KFFfK85qF/XVx3wpXRyON7mQEeVEtW4PbUkQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FPHTJbxD90J8ufz1Ax/ppdE1PrjUP7n8fcruVO/+RR7PvOwEjjVmUOtTlYsWgCKib
	 5hwRA3j157G9w06xYd4auHKCVZSQmwPRacJ8jjGL3bM7V0BleGKxDBTtdwOSibMIpR
	 g0wewuUvKL8TOohrM0IyHHriKliF9vve3HT9lR2dvrxCCc3zSGziItaa934EcbXm7q
	 Ccno+ERhGcLV7XlOjII7gtq90PZucYpyI5eYe5Iv/Yl8zeATXXED+sTZKiRLypzQ48
	 aN8FInxoGvKdQb3Gm7h1q5h58oiiW9/eh/4alD0Z+UukpNyxLZLThRNlXZCpa/m3/n
	 TZRIkphodVV9Q==
Message-ID: <sashiko-outbox-208708@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/8] ARM: dts: imx: Use minimum NAND ECC strength on
 BSH boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haoning Cheng" <Haoning.CHENG@cn.bosch.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261111-add-bsh-smm-m2-v3-2-4abdf10e9a7f@cn.bosch.com>
References: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
 <20261111-add-bsh-smm-m2-v3-2-4abdf10e9a7f@cn.bosch.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 09:38:44 +0000
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
- [Medium] ARM: dts: imx: unjustified incompatible NAND ECC layout
  change on BSH boards
--

commit 1e6153dffd8fb43d1ff6ef7ef9b632628cf01234
Author: Michael Trimarchi <michael@amarulasolutions.com>

ARM: dts: imx: Use minimum NAND ECC strength on BSH boards

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
>  	status =3D "okay";
>  };

[Severity: Medium]
Does adding fsl,use-minimum-ecc to these existing boards break
compatibility with NAND flash already formatted using the mainline device
trees?

In common_nfc_set_geometry(), enabling fsl,use-minimum-ecc switches the
controller from legacy_set_geometry(), which maximizes ECC strength across
the OOB area, to set_geometry_by_ecc_info() using the chip's minimum ECC
requirements.  Because the GPMI BCH layout interleaves data and ECC parity
bits across the page and derives the bad-block marker offsets from the ECC
strength, this changes the physical on-flash layout and makes existing
NAND partitions, UBI volumes, and on-flash bad block tables unreadable
with -EBADMSG.

If this change is intentional (for example, to match the ECC geometry used
by the bootloader and flashing tools), could the commit message explain why
the incompatible layout change is needed and how existing devices are
affected?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-add-bsh-sm=
m-m2-v3-0-4abdf10e9a7f@cn.bosch.com?part=3D2
