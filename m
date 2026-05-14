Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23487315793;
	Thu, 14 May 2026 16:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778776286; cv=none; b=mA/8z09PT9BxF6+ItcA40DBF/7UJcKkvJqi6lTwSu+w1zQu1tyvFhHoBvxz/nXAMWPxB7C0C6N3eCCDe/lZwdA+7FFBBtdQ90aP1LuJ0mOoVhJMU1yQ4J+ptwZ4FXZ+t1HgxkTtknpA+AJrTWgQGzLM/pxrqGmVewCjSbTLhjxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778776286; c=relaxed/simple;
	bh=0stSFu0s1YnDyV7OtMVCQp+xixn1WNarNpIxatHVQDs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IkNhVNmM/SAblR8I2+QfnhqMkBHZEo5Rs5+pVj0XQHvqucst9YJVdZuSbXQn5KeAXLkJmti/12QcjvLuLiS6Aypzsz/IwzqgPtFANHlQ1wLhFGIp0dRLSU3rOFGDmgEISlFlAQ0ywbq6q3cvUjDmsjPCdolINIx40zHQL5pzEL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHkS9sXn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHkS9sXn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69609C2BCB3;
	Thu, 14 May 2026 16:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778776285;
	bh=0stSFu0s1YnDyV7OtMVCQp+xixn1WNarNpIxatHVQDs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=BHkS9sXnAgKTcRsJDmI0Zs9AYmvM4cCDBjDY3sY7/917CyJYs0p04jsYSHv3lxsPD
	 9DrQmgMFIuVjyI44lANulfUT41ibdXA5T3VQKkZCsfA4UIiHa+ybZQkw5zS4xOlUot
	 cfiX2PwVAAvbrvtztS6InfSknzsFCCtRUN0lqRlCL7H3S6NUA0p0ehu17c5oNd09Jf
	 Cq9Njhw89o/FjSV55BcYLzZojs+7oP5bj3UHx75CZSI0MYP0cirpY6w06trU2JmROm
	 GdzfzxZTCdBMu5UyVEk1I4g6MC1AfmrNkVHMPifJL9eSW0hKEmJSfd6bMraeifITAO
	 zdnPSUOrzbuUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: s32g: add PIT support for s32g2 and
 s32g3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>
Cc: imx@lists.linux.dev, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260514070605.996462-2-khristineandreea.barbulescu@oss.nxp.com>
References: <20260514070605.996462-2-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 16:31:24 +0000
Message-Id: <20260514163125.69609C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The Device Tree nodes for the PIT timers are named using the specif=
ic IP block name (`pit@...`) instead of the standard generic name (`timer@.=
..`).
--

commit 427ff80913e8247c6a4011dd8722ce9a6b67e322
Author: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.c=
om>

arm64: dts: s32g: add PIT support for s32g2 and s32g3

This commit adds Device Tree nodes for the Programmable Interrupt Timer
(PIT0 and PIT1) blocks on S32G2 and S32G3 SoCs.

> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g2.dtsi
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi

[ ... ]

> @@ -417,6 +417,15 @@ edma0: dma-controller@40144000 {
>  			clock-names =3D "dmamux0", "dmamux1";
>  		};
> =20
> +		pit0: pit@40188000 {

This isn't a bug, but according to the Devicetree Specification (Section
2.2.2 "Generic Names Recommendation"), node names should reflect the
generic function of the device rather than the specific IP block.

Could this node, as well as the pit1 node and the equivalent nodes in
s32g3.dtsi, be named timer@... instead of pit@... to follow standard
Device Tree conventions?

> +			compatible =3D "nxp,s32g2-pit";
> +			reg =3D <0x40188000 0x3000>;
> +			interrupts =3D <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clks 61>;
> +			clock-names =3D "pit";
> +			status =3D "disabled";
> +		};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514070605.9964=
62-1-khristineandreea.barbulescu@oss.nxp.com?part=3D1
