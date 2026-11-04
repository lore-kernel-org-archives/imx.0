Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778312;
	b=TQA9wiQLmTbdBd6Y0aZBQ4NbXn+oUPpDhsBkQzYYj8+LfOctk2uCRnsUSIdiHqJKUTt1
	 Iai09vS4IDKhyLbEQR3cUVcpWc5V2ktXdQ1Sx/+blVarfBZBdl+C5N2/SorMwnk3Vks6k
	 fQBkiSzjTXXj2qkrSuE+3kZNLv5WNHipbNTTYYcXmXDTtDSb8rEjimAhwXwQW/t6sTg6e
	 nIhO6htqyTXKngfckJASZe5R6hzh66Vs8Eq/jRt+StWKpnoFQhuCZcbMmfZ7bPaw1qsGh
	 RmXZDHnvxKSedhSZUMcYf1R1wmjoZGtHen3fnwnRH913whsW0knSBTEMYjHjCUVx6/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778312;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8y2kXXM0F18zXu60W4wtYhDmW88tNPQqKg6LXtsGAKM=;
	b=jYHLW1FyUP4VfO2R9yJSY2ZKiNvVzMc3ZD4yG6Nt3kBHAGh7DMacPY5XfUiJDcjFslEp
	 dbmT8LQZ5+WoZhjFoxHBnAFh3XgT9fJft97uYrflR1E22Vt+W1p4yS46Fbp2G3/PCD8SL
	 TRJM6W0KZnIO3CbYc7Xxi73pPYL0LDClAVHju2jz0AZQbfQQPMSyRih0bcCK4rya9CYed
	 CzXE046QU5aUe+OEgHx/TILE2UteP3pU5V77RRml8dMwdCS6q3qbKEO4EgiQVOpM09bia
	 cYAu4FkIqyG2sw/sLdkkutvYaSyN7aptEan/F3nKRE7gIbUrlGeIHwYjfgb8n7Z7yEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gSIEm2w8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2013B606A32D;
	Wed,  4 Nov 2026 07:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gSIEm2w8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E4841F000C1;
	Wed,  4 Nov 2026 07:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793778311;
	bh=8y2kXXM0F18zXu60W4wtYhDmW88tNPQqKg6LXtsGAKM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gSIEm2w8f2RNTicp7R71VbVSmK34XAsUVtlOYji74g4QPS5B9t6PJMnBBsvZfasly
	 xvDk1TGm+BaQyT2yETy7DTNV06lpPJctnulcsLn0x36v5Q21y4kNMmRDkEph/6fn7r
	 18rS5ujedEOtVaJRr1InZMEbkmGyyL6O4XqNlIkvfrw+kOnLKjNAeiME8oGmVl3ylc
	 iOakgPOOQ0jayWV+rSpX3CpfJHsCxBcBCTxHsQ5xLr+yDdD09VDfafS3HhMTivpdhw
	 YUuBNQqpB5pwkOPWkkT6jeRXLMxaWf9yk55ngJeqv9TnHV1VztjSCoWbW1q7LHTbT8
	 G1ON5hVs1T9eQ==
Message-ID: <sashiko-outbox-196816@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/10] ARM: dts: imx6ulz: Enable RNGB on BSH SMM-M2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haoning Cheng" <Haoning.CHENG@cn.bosch.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261104-add-bsh-smm-m2-v1-3-369f0a77e021@cn.bosch.com>
References: <20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com>
 <20261104-add-bsh-smm-m2-v1-3-369f0a77e021@cn.bosch.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 07:45:10 +0000
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
- [Low] ARM: dts: imx6ulz: redundant status override on already-enabled rng=
b node
--

commit b4e06771ac0019a530bbaccfe9a26a1cf41ddf74
Author: Leonhard Hesse <leonhard.hesse@bshg.com>

ARM: dts: imx6ulz: Enable RNGB on BSH SMM-M2

This commit adds a status override to enable the rngb node in the BSH SMM-M2
device tree.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/=
boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> index aac211a9f9ebd..39b7ee585860f 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> @@ -30,6 +30,10 @@ &gpmi {
>  	status =3D "okay";
>  };
> =20
> +&rngb {
> +	status =3D "okay";
> +};

[Severity: Low]
Is this status override for &rngb in
arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts needed?

arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts includes imx6ulz.dtsi,
which in turn includes arch/arm/boot/dts/nxp/imx/imx6ull.dtsi where the
rngb node is defined without a status property:

    rngb: rng@2284000 {
        compatible =3D "fsl,imx6ull-rngb", "fsl,imx25-rngb";
        reg =3D <0x02284000 0x4000>;
        interrupts =3D <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
        clocks =3D <&clks IMX6UL_CLK_DUMMY>;
    };

Because neither imx6ull.dtsi nor imx6ulz.dtsi sets status =3D "disabled" on
rngb, __of_device_is_available() in drivers/of/base.c already treats the
node as enabled by default, making this change a functional no-op.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-add-bsh-sm=
m-m2-v1-0-369f0a77e021@cn.bosch.com?part=3D3
