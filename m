Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08122F3C3D;
	Thu, 13 Aug 2026 14:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786630613; cv=none; b=DkDr93TxA0Ts5KpAOKlRgnIuNiv3FGZQVr7O1akJg1I7r519KIFM+GmIpTQYyO8JwllGEp54dszqDGodnEAQHTSvzhdciLZqrBEYvuMfAcV1l9OkFu1nq1OKZq/RPOQWXBBa47x7kV4vnMemZ6H/9nkn9utLYj8mXDzyCidQrmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786630613; c=relaxed/simple;
	bh=658axMGY3vsvYdjNcOU/t2KT0eoGy2po0oWWjRJN/7Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K0duFex1PZhHUKX5oBLeqQrzBLvLCMzbES8ozzYbkjqjF2e0cChQ/1w1cA1rrzC6WTu1E6tlRd8Av9udWbhfVQuis3OWG78t/iS6LZZInoti1X7HWOb9kC6cxe3xnX3nSRPzsrRw7OHUm1pBIQ/02dALhghUulHjXFfN4YrRGXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lXbWL+lk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lXbWL+lk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE92D1F000E9;
	Thu, 13 Aug 2026 14:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786630612;
	bh=Tsnbkio/x4potGdcfuFjdN+gr312Jn2rZuVkRTjkJuI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lXbWL+lkLBG1gF37YOgLIWBqOqVzt19ov+cO8QIptSynW/adFftjObHdHTtfD0jJg
	 5lo/+0+zau1K6m14TorYRZFgBVLqZ6VWbeBzT04YS9W65Du48sW3uVCmL0hiy34w/d
	 wpSa6TmRuveQyLAw42A9HKrpST6xgUUl6vdmnNfcDt8VqHr1VqPxEcm5oX8QC/+3LV
	 EsEit0H/xG4U4+x7PfGcaGruYmb++uoHKeLdiitfmDd+a16WAoZBSoCRnENbUWX4LF
	 Ci5ftt9pFcyVEOqYGTeVdcQyGpJ6Kq+MMnRgHdovuBUgnANLfW8nA4SggnDMyQPCk9
	 wZi3Y02yLQQNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] ARM: dts: vf: add Iris carrier board support for
 Colibri VF50 and VF61
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mehmet Fide" <mehmet.fide@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260813140600.1824949-5-mehmet.fide@gmail.com>
References: <20260813140600.1824949-1-mehmet.fide@gmail.com>
 <20260813140600.1824949-5-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 14:16:51 +0000
Message-Id: <20260813141651.DE92D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `&gpio2` node unconditionally overwrites `pinctrl-0`, destro=
ying the base GPIO configuration inherited from `vf-colibri.dtsi`.
- [Medium] The commit message claims to describe PWM support for the carrie=
r board, but the PWM nodes are completely missing from the device tree addi=
tions.
--

--- Patch [4]: [PATCH v3 4/4] ARM: dts: vf: add Iris carrier board support =
for Colibri VF50 and VF61 ---
commit 30782cd9b9ebbf78c0851af32f14e744e591610e
Author: Mehmet Fide <mehmet.fide@screeningeagle.com>

ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61

The Iris is a small off-the-shelf carrier board for the Colibri family. Thi=
s=20
adds the device tree descriptions for the board's peripherals.

> The Iris is a small off-the-shelf carrier board for the Colibri
> family. Describe what the board itself provides: Ethernet, one USB
> host and one OTG port, the pin header UARTs, i2c with the carrier
> RTC on it, PWM, SPI and the microSD slot. The host port gets its

[Severity: Medium]
The commit message mentions adding support for PWM, but it appears the &pwm0
and &pwm1 nodes were not enabled in the device tree additions. Are the PWM
controller nodes missing from this patch?

> diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi b/arch/arm/boo=
t/dts/nxp/vf/vf-colibri-iris.dtsi
> new file mode 100644
> index 0000000000000..bbd0dd76c33c0
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi

[ ... ]

> +&gpio2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_iris_uart25_tx_on>;

[Severity: Medium]
Does this unconditionally overwrite the pinctrl-0 configuration inherited f=
rom
vf-colibri.dtsi?

It seems this would drop the base configuration (like pinctrl_gpio_ext) ins=
tead
of appending to it, which might leave the EXT_IO_0..2 pins in an indetermin=
ate=20
mux and bias state. Could this be changed to append to the existing pinctrl=
-0=20
list?

> +
> +	uart25-tx-on-hog {
> +		gpio-hog;
> +		gpios =3D <2 GPIO_ACTIVE_HIGH>;	/* SODIMM 104 */
> +		output-high;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813140600.1824=
949-1-mehmet.fide@gmail.com?part=3D4
