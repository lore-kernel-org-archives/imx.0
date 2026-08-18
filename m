Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904503793A9;
	Tue, 18 Aug 2026 03:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787022835; cv=none; b=sEwE/JCDVH3Mi8TT8LmA+1FakgI74ROhq9Z2o98yHUSOMH1j3ZefmoO/YISgVE3AjTGwMX3kftHHvTDlSV4X0zqsODRvU8Y+0gSftQKpvRJBR7xJfZExOM0P5HakZDuK6FUgxWr4OlcXkdu1l3tCY5/q/Nio5RdQ9EffrVePHpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787022835; c=relaxed/simple;
	bh=Ixatjh+/g1Xy1kzTLyTbFhOZmJeeiBuf9FHHl1W67c4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U9SM9+lvcftIhmzYRZ6JKKhnsH2/zIJX2EVl1URCnqL/i8D01cTSiOryKAE+n68tyHK5ys2eMgea+WzkZm1qKN8ijHVgv/zsCyPp18JWC8YLzcPN7gxV0Y+oVcg2Eca/JOBo7w2EZC8ZfcVowbaovxbYJQHKpUrFDiSvwLvX2eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GqO35LoO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GqO35LoO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E8D1F000E9;
	Tue, 18 Aug 2026 03:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787022823;
	bh=FFx8JZ7byNEpDEqX6h/NFoYib/7h4jIAqPa2NLF6ct4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GqO35LoOJhzl4u/y4/iWn65ylkF43/XKxANhIwTFVJZa8w9UV8VeHMaeOvqU8qi3d
	 UmJK9BQx+mZ67yngeVQOaXjxn0GWF/RWyr188XyFfbaltCrRyBD8ux11PDyHCht8E3
	 jTS73OCDS3lIGi/d19UUHy4s8yyySvCBNfuJTeYvZqUx1mDXotARnzweAdR2Z5u4ym
	 f5sj0L1luafElvVL4kmmUFzhyUPJKh3oZ1oEtczuUHi3sl3c9oMNKs9pg6cPSv//fi
	 NxgfOUlB0a/4+H3SoP7Nmgfvn6PXWQPl9zrjmjy0F1kw8HqaUfzdWG0HR3BrGG7tni
	 V4IT9BthRQJuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/17] arm64: dts: imx93-14x14-evk: Add board muxes
 to select between FlexCAN1 and MQS1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chancel Liu" <chancel.liu@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260818030211.3141710-7-chancel.liu@oss.nxp.com>
References: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
 <20260818030211.3141710-7-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 03:13:42 +0000
Message-Id: <20260818031342.D8E8D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The amplifier enable GPIO for MQS1 is incorrectly modeled as a m=
ultiplexer to hijack the pinctrl subsystem.
--

--- Patch [6]: [PATCH v2 06/17] arm64: dts: imx93-14x14-evk: Add board muxe=
s to select between FlexCAN1 and MQS1 ---
commit cd0b6d22bf4426d5f5510c7f3a258a4b50405fb8
Author: Chancel Liu <chancel.liu@nxp.com>

arm64: dts: imx93-14x14-evk: Add board muxes to select between FlexCAN1 and=
 MQS1

FlexCAN1 has pin conflict with MQS1. Add GPIO-controlled board muxes to
route shared signals between FlexCAN1 and MQS1.

> diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm=
64/boot/dts/freescale/imx93-14x14-evk.dts
> index ec78c03f4788b..6dcfbca65cbd5 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
> @@ -37,6 +37,36 @@ chosen {
>  		stdout-path =3D &lpuart1;
>  	};
> =20
[ ... ]
> +	mqs1_amp_en_mux: mux-controller-1 {
> +		compatible =3D "gpio-mux";
> +		#mux-control-cells =3D <0>;
> +		#mux-state-cells =3D <1>;
> +		mux-gpios =3D <&pcal6524_2 1 GPIO_ACTIVE_HIGH>;
> +	};

[Severity: Medium]
Is it appropriate to use the gpio-mux binding to control an amplifier enable
pin?

Device Tree generally describes the hardware structure. A hardware multiple=
xer
routes signals between inputs and outputs, whereas an amplifier enable pin =
is
usually a binary control.

Would it be better to model this with an audio-amplifier or regulator-fixed
node so that standard power management can dynamically toggle the amplifier
during audio playback and suspend, rather than statically evaluating it as a
mux state?

> +
> +	pinctrl-gpiomux {
> +		compatible =3D "pinctrl-multiplexer";
> +
[ ... ]
> +		mqs1_amp_en: mqs1-amp-en-grp {
> +			mux-states =3D <&mqs1_amp_en_mux 1>;
> +		};

[Severity: Medium]
Does modeling the amplifier enable as a pinctrl multiplexer state bypass the
expected power management abstractions?

It appears this uses the pinctrl subsystem to assert a basic power enable G=
PIO,
which might prevent the system from turning off the amplifier when not in u=
se.

> +
> +		mqs1_fun: mqs1-grp {
> +			mux-states =3D <&can1_mqs1_mux 1>;
> +		};
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818030211.3141=
710-1-chancel.liu@oss.nxp.com?part=3D6
