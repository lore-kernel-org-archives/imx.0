Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF9547887B;
	Thu, 13 Aug 2026 13:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786629120; cv=none; b=D0pQNUrLQdG39TpZUjQTr9vmAJylEkfpYi64nxmTp4h7Hp1wEsA6jg/6ub/K5Y5u3OqsDqH17uOCmbZ6Bv91jX7aNt0SgXqFs4v/O2XVKUWiHai1gX5T3MMYG/5wSXNVSWwqrmUp0o9z2/jZCuLkV2MMB1oxtchCrxa73PnqAaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786629120; c=relaxed/simple;
	bh=nVYPRpNyTopP3Tk0sEbdhGNYs535UwDrsPHxZ5tsE9g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aPqAYfEKf9AOilMFBCVlsoA6hYsFWJ/4Bhxu4ZcsR8jGW2UImccWHY5MblRZ5BAumnGk5/YzQjQN1sbhKRuGRmjsvaKOG4kBNgj0XYsu2jUrFdaIPRqZR74YY/mQojFHeMF+lxw/UkYitbeWiA3rB+QbMW1Y46aAkklNNBPLT8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WkRGwkP7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WkRGwkP7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778871F000E9;
	Thu, 13 Aug 2026 13:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786629118;
	bh=z/bFvN+qD/cbOvPbIzNjI2g6p+GwcXKQbHK1n/xp3kA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WkRGwkP7NzkgifJcvpNJVi0R0hQUpdxeZraCtfMn0s4obfGaf5qj7VGPIq8GoYL1s
	 YFGbYk3S/sOUbzOGUZlFoNgN7+KT/clDys7Z9WaeVogNq4GHLcfFQnzEZdawHfxIr+
	 lpYUbQ+PB+uMlq0/2qd5r76ED6Zgkz62utueDHVBcFTuwhsKqRAdEnF/qGFI73oas2
	 V/2rH5/TvlTzp5u6zYthCmZV3XkT4WfBWmZbrRdF0LvzmKsaHSphWJtTsmq1rap2XO
	 PIlzAJQ0D4T8C0B7uvrj3pbnGyFDCIj0BFQBHYXOUUXYddIg10uJUF/K9CDnDhQA4a
	 nNhkVyVG955wQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 Capacitive Touch Display 10.1" LVDS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Leonardo Costa" <leoreis.costa@gmail.com>
Cc: conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260813133335.1941580-2-leoreis.costa@gmail.com>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-2-leoreis.costa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 13:51:58 +0000
Message-Id: <20260813135158.778871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The panel node name 'panel-lvds-native' does not comply with the de=
vicetree bindings for simple panels.
--

--- Patch [1]: [PATCH 1/6] arm64: dts: freescale: imx8mp-verdin: Add Torade=
x Capacitive Touch Display 10.1" LVDS ---
commit 9fa4254322a01ecfb1f9a0941237ecac9d2bf3f1
Author: Leonardo Costa <leonardo.costa@toradex.com>

arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display =
10.1" LVDS

This commit adds a device tree overlay for the Toradex Capacitive Touch
Display 10.1" LVDS on Verdin iMX8M Plus carrier boards. It integrates the
LogicTechno LCD panel and an Atmel MaxTouch capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitiv=
e-touch-display-101inch-lvds

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-=
10inch-lvds.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-to=
uch-10inch-lvds.dtso
> new file mode 100644
> index 0000000000000..9079c6284dfae
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-=
lvds.dtso
> @@ -0,0 +1,95 @@

[ ... ]

> +&{/} {
> +	panel-lvds-native {

[Severity: Low]
Does this node name comply with the generic panel devicetree binding schema?

The bindings generally require panel node names to match the regular
expression ^panel(@[0-9a-f]+)?$. Using panel-lvds-native might trigger a
schema validation warning when running make dtbs_check.=20

Would it be better to name this node simply panel?

> +		compatible =3D "logictechno,lt170410-2whc";
> +		backlight =3D <&backlight>;
> +		power-supply =3D <&reg_3p3v>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813133335.1941=
580-1-leoreis.costa@gmail.com?part=3D1
