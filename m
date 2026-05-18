Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5033C1F37;
	Mon, 18 May 2026 06:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779086795; cv=none; b=AEZWbfKxERVxO253sdKSQl8AlbG1hxYLPT1bn0GU6zC90nuMujoVGGJkIEpS4+cDxwnKWcPUFoJX6gukshHfUK+I3ymSPhxax1p+JKs+bMEDlbIe5E7TGlYSteUXqMStpcCJN2ZkSuSAEpNWcH9P4NP7UAvwd1eIvxRmxxR6jZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779086795; c=relaxed/simple;
	bh=nyUvwxOERFiKlrwpt376CsF/RFVPO90hyYEOTpqZkSI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PLtVdNgFLpckTs6jJfcUE76eHEDucl/1YMlcKqwH/5LY1Dj4ixJgPvMl+3qTbi0vbr162I7jwxUGsDZKHCfP6r6q8PqTAjujjoQO2dpbOysJgKT2Ms5xkuwEWll/LktSdLF7KmNfwleBcSAIh1nA/z7cZgou8SPCqJRssZNpShY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3RLYH4+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3RLYH4+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F5FC2BCB7;
	Mon, 18 May 2026 06:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779086794;
	bh=nyUvwxOERFiKlrwpt376CsF/RFVPO90hyYEOTpqZkSI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=I3RLYH4+iHTTxBCDBtgF1Rn+vLlbLcxMk5dw6Hq22zJLF/pDsJzeyJLRg6i7OPbJ6
	 Q5Yg2QN6jiLK6I4VUz5OuBSll+v8SmAdzsfbsOBFfgHm/FEZhCB7vm190n+6AHCfip
	 yONHyKV9ya1yUf5QvxuHqa9gdUnDKZQkKGZEpqM+YUDiV8MyBD5Zo1JZbcOFqJ7Hxl
	 A9QlpRweUeUANOip/LM8cOKIGPafqrxCBDJV5w7ytPHbgw5PycNMfVbTpG0o6H3tXe
	 6RZfkPNaZGyAH6QY5Egb40ZbXHXN5aFI+BT2qy7TaHRef0A3y8X8x3tH5fLkZVTP29
	 m1JnzQS9U7PCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: s32g: add PIT support for s32g2 and
 s32g3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260518063547.2890353-2-khristineandreea.barbulescu@oss.nxp.com>
References: <20260518063547.2890353-2-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 06:46:33 +0000
Message-Id: <20260518064634.86F5FC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added device tree nodes `pit0` and `pit1` are named `pit@=
...` instead of the generic name `timer@...`.
--

commit 296fdf97d8d5f42b2426eda4d41b0132d74ccbbd
Author: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.c=
om>

arm64: dts: s32g: add PIT support for s32g2 and s32g3

This commit adds device tree nodes for the Periodic Interrupt Timer (PIT0 a=
nd
PIT1) blocks on the NXP S32G2 and S32G3 SoCs.

> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g2.dtsi
> index 51d00dac12deb..57ff97e445075 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
[ ... ]
> @@ -417,6 +417,15 @@ edma0: dma-controller@40144000 {
>  			clock-names =3D "dmamux0", "dmamux1";
>  		};
> =20
> +		pit0: pit@40188000 {

This isn't a bug, but should these nodes use the generic name timer instead=
 of
pit? The Devicetree Specification recommends using generic names that refle=
ct
the primary function of the device rather than specific IP block acronyms.

> +			compatible =3D "nxp,s32g2-pit";
> +			reg =3D <0x40188000 0x3000>;
> +			interrupts =3D <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clks 61>;
> +			clock-names =3D "pit";
> +			status =3D "disabled";
> +		};
> +
[ ... ]
> @@ -622,6 +631,15 @@ edma1: dma-controller@40244000 {
>  			clock-names =3D "dmamux0", "dmamux1";
>  		};
> =20
> +		pit1: pit@40288000 {

Could this node also be named timer@40288000 for the same reason?

> +			compatible =3D "nxp,s32g2-pit";
> +			reg =3D <0x40288000 0x3000>;
> +			interrupts =3D <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clks 61>;
> +			clock-names =3D "pit";
> +			status =3D "disabled";
> +		};
[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g3.dtsi
> index e314f3c7d61d0..efe5398e12403 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
[ ... ]
> @@ -475,6 +475,15 @@ edma0: dma-controller@40144000 {
>  			clock-names =3D "dmamux0", "dmamux1";
>  		};
> =20
> +		pit0: pit@40188000 {

And similarly, could this node be updated to timer@40188000?

> +			compatible =3D "nxp,s32g3-pit", "nxp,s32g2-pit";
> +			reg =3D <0x40188000 0x3000>;
> +			interrupts =3D <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clks 61>;
> +			clock-names =3D "pit";
> +			status =3D "disabled";
> +		};
> +
[ ... ]
> @@ -693,6 +702,15 @@ edma1: dma-controller@40244000 {
>  			clock-names =3D "dmamux0", "dmamux1";
>  		};
> =20
> +		pit1: pit@40288000 {

And timer@40288000 here?

> +			compatible =3D "nxp,s32g3-pit", "nxp,s32g2-pit";
> +			reg =3D <0x40288000 0x3000>;
> +			interrupts =3D <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clks 61>;
> +			clock-names =3D "pit";
> +			status =3D "disabled";
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518063547.2890=
353-2-khristineandreea.barbulescu@oss.nxp.com?part=3D1
