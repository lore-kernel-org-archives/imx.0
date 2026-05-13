Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB13381AFB
	for <imx@lists.linux.dev>; Wed, 13 May 2026 03:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778641760; cv=none; b=ATvs73ZY5G2wQbjyizSyDfzA06C6xEVLaaG1swULIz7awfmchhJo2/VpqT6Ino01oTg/4xxYB219AiZjNpvlbsJ9B6bDzBP3Ywfl5CGuoczeJkVlurvqwUxaau/899jmg1R1XDdE9CKwzhgMcLbXTejfV6DpkcdhnX2aJn6JZHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778641760; c=relaxed/simple;
	bh=NG8vc/s3epyhQucgEBo0B/xcexpz0CpeI2YOdFfUUxU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qTz1PtyJK00kpXbRZ2SVY7AIdMyVNt3FP65i4cCCPOOxtChs2k5mr3HutqZXc48E9CR65LN0cI9jdsfjW4xvVjysoGyShGHU4xJf/4z/lvVwKkTd3SuqElHfItH6kD84VF/f0iwMCt/gpFgVtQve/lcS67AgZ/X8NAoQNLbYF9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kwo9jjFw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kwo9jjFw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DBFC2BCB0;
	Wed, 13 May 2026 03:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778641760;
	bh=NG8vc/s3epyhQucgEBo0B/xcexpz0CpeI2YOdFfUUxU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Kwo9jjFwT3JjYzioYCr8o5ge52Ca4aTHFSLaAXNi20dsaiA5trKNHTrxOsOgZK7fy
	 Mp0OZL1jbR8KOYNHFkSLuPnSjcgy+jwHC0+wj0SKaclJcp6pVzLm1d371or9F/FzVC
	 BnW7kyihAPqvhdhrJjTTN6ijKp2qyMVxOIc0vGGkbRUwhCTWFl0OXxaeJ7h0JuZqJI
	 vsK93RpQKSoTaKe/tDdydKupLJb81vDrDvU+1InJjWKsXqohRkhSMtn32+9j0C3RtT
	 tzR80CAeOO0+xUUNXRTRgcp9STXfdZwtKB6MaCtIHlCCv3DLZvxqmwrwZy3AkTLwOR
	 PGpmm5TM5n11w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] arm: dts: imx: Add watchdog support for early boot
 stages
Reply-To: sashiko-reviews@lists.linux.dev
To: alice.guo@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260512024850.904551-1-alice.guo@oss.nxp.com>
References: <20260512024850.904551-1-alice.guo@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 03:09:19 +0000
Message-Id: <20260513030920.27DBFC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Hardware IRQ conflict: wdog4 and ddr-pmu share the same interrupt =
in imx94.dtsi.
- [Medium] Missing bootph-all property on the newly added wdog2 node in imx=
7ulp.dtsi.
- [Medium] Undocumented addition of multiple new watchdog hardware nodes.
--

commit 566f5af2df66e555eb4881057449fc8955a46103
Author: Alice Guo <alice.guo@nxp.com>

arm: dts: imx: Add watchdog support for early boot stages

This commit adds the bootph-all property to watchdog nodes across several
i.MX device trees to make them available during U-Boot's early boot phases.
It also introduces several new watchdog nodes to the device trees.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/n=
xp/imx/imx7ulp.dtsi
> index 880b9a4f32b08..5e3e562225e58 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> @@ -297,6 +297,17 @@ smc1: clock-controller@40410000 {
>  			clock-names =3D "divcore", "hsrun_divcore";
>  		};
> =20
> +		wdog2: watchdog@40430000 {
> +			compatible =3D "fsl,imx7ulp-wdt";
> +			reg =3D <0x40430000 0x10000>;
> +			interrupts =3D <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&pcc2 IMX7ULP_CLK_WDG2>;
> +			assigned-clocks =3D <&pcc2 IMX7ULP_CLK_WDG2>;
> +			assigned-clock-parents =3D <&scg1 IMX7ULP_CLK_FIRC_BUS_CLK>;
> +			timeout-sec =3D <40>;
> +			status =3D "disabled";
> +		};

Was the bootph-all property intentionally omitted from this node?

The commit message explicitly states the purpose of the patch is to add
the bootph-all property to watchdog nodes, but it appears to be missing
from this newly added wdog2 node.

Additionally, is adding completely new hardware nodes expected within
this patch?

The commit message notes that the patch adds the bootph-all property
to watchdog nodes, but the diff reveals the patch actually introduces
entirely new watchdog nodes (such as wdog2 in imx7ulp.dtsi, and wdog4
in imx94.dtsi, imx95.dtsi, and imx952.dtsi).

Should the commit message be updated to explicitly document the
addition of these new hardware nodes, or should these additions be split
into a separate preparatory patch?

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/d=
ts/freescale/imx94.dtsi
> index d2f31c8caf6eb..be366af8ac912 100644
> --- a/arch/arm64/boot/dts/freescale/imx94.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> @@ -1220,6 +1220,18 @@ wdog3: watchdog@49220000 {
>  				timeout-sec =3D <40>;
>  				fsl,ext-reset-output;
>  				status =3D "disabled";
> +				bootph-all;
> +			};
> +
> +			wdog4: watchdog@49230000 {
> +				compatible =3D "fsl,imx94-wdt", "fsl,imx93-wdt";
> +				reg =3D <0x49230000 0x10000>;
> +				interrupts =3D <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;

Could this interrupt assignment conflict with existing hardware?

Looking at the same imx94.dtsi file, GIC_SPI 91 is already assigned to the
ddr-pmu node:

		ddr-pmu@4e090dc0 {
			compatible =3D "fsl,imx94-ddr-pmu", "fsl,imx93-ddr-pmu";
			reg =3D <0x0 0x4e090dc0 0x0 0x200>;
			interrupts =3D <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
		};

Sharing a GIC SPI interrupt between independent hardware blocks like a
watchdog and a PMU is an unusual hardware description unless they are
explicitly designed to share IRQ handling.

Does this need to be updated to the correct hardware interrupt to prevent
issues if the watchdog driver is updated to request this IRQ?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512024850.9045=
51-1-alice.guo@oss.nxp.com?part=3D1
