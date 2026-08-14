Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86363CB559;
	Fri, 14 Aug 2026 07:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692706; cv=none; b=A6op8IwJ60SlyQyfIIS06uenmfo/6Qlq13sJvL/fhka/lv6wb9C/gP+MpmyEUWKhyNQ4/4iDlyHEnUiYhh1wCfki4BdfzFvJQsFXpHgfg/gQV/UJEVCBggch2CMpsibldrHiCEd/Qznyzob8Z8eTpGnAmDcesanmT6Y01GNSsUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692706; c=relaxed/simple;
	bh=cUk/40Y0B07k5Bw6wDs35pg1hE+4zKcg4XVzi8pU7s8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zr0lGDPzVsDz4ZS/RSML8e57m53d9cTwQcF3pulqa/daqWn8XfLr/5rL6recLcwDmt3VQeAfaov1igATnndeCf/eJu3Rz9jofJQilO+g6RHEspBN7/ZBtVHu51fzKzIeJiQHOF5MXgdtZU+wNU4UR0vQ+H+09pnVC2ZX9tY6KZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKJGRRmR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKJGRRmR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7891F000E9;
	Fri, 14 Aug 2026 07:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692697;
	bh=w49rFdbKjKqhVd4J0L2ZcR59ZpPJYhqbLkSNtK+T5jo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jKJGRRmRomzKl4lQGIr+B5yNnuV9pNhf56ERBuaRALSYaB7Yw2/JGocg1FIHNTMwg
	 W/A8QEZ7JbKm6QTteirf/IvweOvWHmCsxyqqdl8Ad4yi9qKKaVg3TL/LgGLLgylp/3
	 qDewqhVF25oySWFxBvc74bRktA1LJyjxthh0s+aVzTkIu9hgJBNdPUNlhGBKwAqj2F
	 pbVpNNai2U4D6lsOs+XKONOvZkkG4SPVaG7gvlTrdSO+KJSvX/kKBTYnnalcdHReeE
	 VutVYgjBUsk6u3kADFYxmPLAwV6uwmD37SgPrR7sdT8YD7oeQYnK3ZD9JhhC5dCzSy
	 9fkruKffKpKZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/17] arm64: dts: imx93-14x14-evk: Add board muxes to
 select between FlexCAN1 and MQS1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chancel Liu" <chancel.liu@oss.nxp.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260814072022.4064009-7-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
 <20260814072022.4064009-7-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 07:31:36 +0000
Message-Id: <20260814073137.4C7891F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete device tree wiring for board muxes. The newly added p=
inctrl mux states (`can1_fun`, `mqs1_fun`, `mqs1_amp_en`) are defined but n=
ever referenced by any consumer device node (such as `flexcan1`), rendering=
 the board mux configuration functionally dead code.
--

--- Patch [6]: [PATCH 06/17] arm64: dts: imx93-14x14-evk: Add board muxes t=
o select between FlexCAN1 and MQS1 ---
commit adc8546ef31dc705c01516aa1b8dc15eb6eaa575
Author: Chancel Liu <chancel.liu@nxp.com>

arm64: dts: imx93-14x14-evk: Add board muxes to select between FlexCAN1 and=
 MQS1

This commit adds GPIO-controlled board muxes to resolve a pin conflict
between FlexCAN1 and MQS1 on the imx93-14x14-evk board. It defines the
mux controllers and their corresponding pinctrl states.

> diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm=
64/boot/dts/freescale/imx93-14x14-evk.dts
> index ec78c03f4788b..502237fab3324 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
[ ... ]
> +	pinctrl-gpiomux {
> +		compatible =3D "pinctrl-multiplexer";
> +
> +		can1_fun: can1-grp {
> +			mux-states =3D <&can1_mqs1_mux 0>;
> +		};
> +
> +		mqs1_amp_en: mqs1-amp-en-grp {
> +			mux-states =3D <&mqs1_amp_en_mux 1>;
> +		};
> +
> +		mqs1_fun: mqs1-grp {
> +			mux-states =3D <&can1_mqs1_mux 1>;
> +		};
> +	};

[Severity: Medium]
Are these new pinctrl mux states missing references from their consumer dev=
ice
nodes?

The can1_fun, mqs1_amp_en, and mqs1_fun states are defined here, but they
don't appear to be referenced by the flexcan1 or mqs1 device nodes.

For example, if the active flexcan1 device node doesn't include <&can1_fun>
in its pinctrl-0 list, won't this configuration remain unapplied and fail to
resolve the hardware routing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814072022.4064=
009-1-chancel.liu@oss.nxp.com?part=3D6
