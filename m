Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7176325491;
	Wed, 20 May 2026 12:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779279402; cv=none; b=a+PnMoMTWQRvU5D6D3QmqAzfveD52LZLHYWFceZcGbCr9lHUIF13DCi5/m6bEJLrMRCuBZHjl98X4Hvx8NltlVeJHXgrX8qcv4upIDr75W5C3Ogm8IgvkFnc5Qcmf1FyOvAc3Kg7ufyPkJMGXES3iT+3YQW3KrjFGFMWdEjtxpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779279402; c=relaxed/simple;
	bh=NGoOU3Z4rOZ1Tcqf+wi74ye+svzH+jA3Vj9YZFQhbJ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BcEED5IZtmBUkfiAZ2IW3E8aCDTC+f/zN4kSzUEfTJ+KPQNygdsVjn6cqMweJ3T1VHuLCv85ZVCUQE03AxyWHxgYYQQb+fYk5dayeyjCBlcnj/ckh1s/ALKWE5DDvh9sYDt135DbaLJBsPtNRaWF4Tuk2ugdJZZNYCL4IiRG11w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpVGGMWu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpVGGMWu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C711F000E9;
	Wed, 20 May 2026 12:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779279399;
	bh=+ZH6Rx+nARLKQ6V4H3k9RxfcHDh6K3AZprg5NAg0PfI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EpVGGMWu6rzsb1NTj6OngVhZ5SZ4N236E+cQOH2+BERKcbfsLpgG8AQ+Ew7gI2qK5
	 9o7mFcdgZxgG8/lMXHcs1POUt2ksosf8EXiujUdfyuyaVgmDKkh8Yg1Kqqf/GOvIEx
	 bWIxQ2YzXu69bo6WUEKoq5KxFef++nmtVYbTUOPxuzM821uExpxeq2+r7gfrMaedag
	 pfo+6osuXLM8qVjyaKkNhiOVA+uaJ4uLFSQv+c+uiKn4Sl1YKx6KSpZfPzhWA5FKvu
	 g5Kt8VbpxrfQL0HTtUTxnKOzWuNjtfqPueDuL6E8xJQuvuSYK23n0/RrLxsR/+MdPT
	 5wC3bzhNYsAVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: freescale: imx95-aquila: Add Clover
 carrier board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Franz Schnyder" <fra.schnyder@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260520-add-aquila-imx95-v2-3-06424a51e33a@toradex.com>
References: <20260520-add-aquila-imx95-v2-3-06424a51e33a@toradex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 12:16:38 +0000
Message-Id: <20260520121639.97C711F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The flexspi1 flash node incorrectly uses Cadence QSPI specific prop=
erties (cdns,*) with an NXP FlexSPI controller.
--

commit 58fa26ce8327e303e6d4b9e4915178ba8d66e5b7
Author: Antoine Gouby <antoine.gouby@toradex.com>

arm64: dts: freescale: imx95-aquila: Add Clover carrier board

This commit adds device tree support for the Aquila i.MX95 SoM mated with
the Clover carrier board. It configures basic interfaces including DP,
Ethernet, CAN, and the FlexSPI controller.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx=
95
Link: https://www.toradex.com/products/carrier-board/clover

> diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts b/arch=
/arm64/boot/dts/freescale/imx95-aquila-clover.dts
> new file mode 100644
> index 0000000000000..021d437763412
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts

[ ... ]

> +/* Aquila QSPI_1 */
> +&flexspi1 {
> +	pinctrl-0 =3D <&pinctrl_flexspi1_4bit>,
> +		    <&pinctrl_qspi_cs1>;
> +
> +	status =3D "okay";
> +
> +	flash@0 {
> +		compatible =3D "jedec,spi-nor";
> +		reg =3D <0x0>;
> +		spi-max-frequency =3D <66000000>;
> +		spi-rx-bus-width =3D <4>;
> +		spi-tx-bus-width =3D <4>;
> +		cdns,read-delay =3D <0>;
> +		cdns,tchsh-ns =3D <3>;
> +		cdns,tsd2d-ns =3D <10>;
> +		cdns,tshsl-ns =3D <30>;
> +		cdns,tslch-ns =3D <8>;

[Severity: Low]
Are these cdns,* properties intended for the NXP FlexSPI controller?

The imx95 SoC utilizes the NXP FlexSPI controller, but these cdns properties
are specific to the Cadence QSPI driver. The NXP FlexSPI driver does not
parse or support any cdns,* properties, so these timing configurations will
be silently ignored by the kernel.

> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520-add-aquila=
-imx95-v2-0-06424a51e33a@toradex.com?part=3D3
