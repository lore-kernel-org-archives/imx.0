Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8EA3F1ABE;
	Tue, 19 May 2026 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779192312; cv=none; b=uVILZioNedGUzUSR1gzSZ9bfgeEBIPP8xI5SacryANn7UoHkC6TzoU8oiFH5YQCdq7GlaixbQlKVgm70x2dhSrWb237wcd2rUTHAJuLhlBITAU1dM+zlQPjf1s9GaoV1MoxK8mTqgRhkIXFJc7Eoj13kNFKOxzQbCFWsbe7H2rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779192312; c=relaxed/simple;
	bh=olUzPpsBrLxSZhP0MDNfwmCwBg+SPAPq90oOw52FViM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H29S0MCt9pZJ8YNGnDxL1udUCcBI5oVxCWosI3oKcQawF2mjPtJRgvdTeaYMljvEB6inbiRCUxJaOAzg4MRomkyaB6/TEuCYgk3EHferLUZMwtpXA1QyVX1FtGtqJ66rGdh/p8eFagS9+41ZTnyApyXZZU4IJZ+hqupRtkGyWn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eTHArOr/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eTHArOr/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59D6C2BCB3;
	Tue, 19 May 2026 12:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779192312;
	bh=olUzPpsBrLxSZhP0MDNfwmCwBg+SPAPq90oOw52FViM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=eTHArOr/DQmMe8RrQvsJ9zWYX69Osh63JEGRvSqFUM3ggmpYZ2f7MPa4NvVJudT5/
	 3i3NziZBaOCb+jEhwRJeTJqzP6682+cdKnh3s4ytEWJrAtcvZg5kkWSQEDOaHaYqes
	 ttHbnP21eEAdZQSgWUnqM9WSODTQMkQM9vOy28StDmabI8eaFzmaSt+Np4GDh4hQtd
	 uIrscmYbZ+EyHJ3UgtY3VzPMA80S8+/6i4VThimDcT7ijFzV9jGO3xThdRUeRs3k6J
	 8NHEEIwAXcLL2WnDubTJvuJQhF5kzkYmpNevHIc1MtRdqzzSw+Yfb5RuQo4rtryoQv
	 RGm+YdrCvNmjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: imx91-11x11-evk: add reset gpios for
 ethernet PHYs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joy Zou" <joy.zou@nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260519-b4-imx91-qsb-opt-v1-4-9b416d2dc224@nxp.com>
References: <20260519-b4-imx91-qsb-opt-v1-4-9b416d2dc224@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 12:05:11 +0000
Message-Id: <20260519120511.C59D6C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `compatible` string with PHY ID in ethernet-phy nodes caus=
es silent probe failure when using reset-gpios.
--

commit 3c4c46607dcfd2582ce8a02581310d0901a9d667
Author: Joy Zou <joy.zou@nxp.com>

arm64: dts: imx91-11x11-evk: add reset gpios for ethernet PHYs

This commit adds reset GPIO properties for the ethernet PHYs using
an I2C GPIO expander. This allows the PHYs on both the EQOS and FEC
interfaces to be reset during initialization.

> diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm=
64/boot/dts/freescale/imx91-11x11-evk.dts
> --- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
[ ... ]
> @@ -198,6 +198,9 @@ mdio {
> =20
>  		ethphy1: ethernet-phy@1 {
>  			reg =3D <1>;
> +			reset-gpios =3D <&pcal6524 15 GPIO_ACTIVE_LOW>;

Will this cause a silent probe failure if the PHY is held in reset at boot?

Because there is no explicit compatible string with the PHY ID (for example,
compatible =3D "ethernet-phy-idXXXX.YYYY"), the MDIO core must auto-detect
the PHY by reading its ID registers over the MDIO bus.

If the PHY is currently held in reset, the MDIO read will fail and return
0xFFFF. This causes get_phy_device() to return -ENODEV before the device
is created.

Since the device instantiation is skipped, the reset-gpios are never reques=
ted
or deasserted, and the I2C expander probe deferral mechanism is bypassed,
leaving the ethernet interface permanently disabled.

Should these PHY nodes explicitly include the PHY ID in the compatible prop=
erty
to bypass the hardware ID read, allowing the kernel to wait for the I2C
expander to be ready and properly deassert the reset?

> +			reset-assert-us =3D <10000>;
> +			reset-deassert-us =3D <80000>;
>  			realtek,clkout-disable;
>  		};
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-b4-imx91-q=
sb-opt-v1-0-9b416d2dc224@nxp.com?part=3D4
