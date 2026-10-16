Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA2E40B109;
	Fri, 16 Oct 2026 20:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181933; cv=none; b=bJwOGUrH6yWdpTEhRj6ROFyXI4D7Zsa6HuqPedfqtbH5tKIUWq7cO8LcQAnMS5/NiW2qRkpGXV2tO/rWN6oXFdg0/Nj1qIkoJQb2qM9dJSkWD+rJ4IOeQ6UoCvMnkZ2odLfYhgiaA6vBBR0aaO6MnWYomF5/R11hnyuJkQtjxag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181933; c=relaxed/simple;
	bh=1B1ej6X099roilERBi+YWq+vy0abdU7RceiOoAuQYmY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=U1OP/2tTzX4TN9ztLkNQAqM0XAJuWnDfRlcwJnZJXiL5EwaeYRot+TAyYcj5ONvpvz6Fcs3ckDNaZXVD/HF+/LrmktXk+G7pRdwq5U9HFjpj/Qjlm0w4N09fY5J0hOAD8v7HM2nWJ16+kCCV2HAD+swWzYjgeJwUaC0K5Cajr/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPA7Dr04; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPA7Dr04"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678DD1F000C5;
	Fri, 16 Oct 2026 20:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792181925;
	bh=ciIrD9qA9+7gsXNW9FF54lAFKsEbb4sS8vCJEvM2bG8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oPA7Dr04sh00yqAH0uAFSJLMxCJ/OW6evb4RNw/yWKU2Vi71woZrmC8b+/A21Dibh
	 y+BquO0NiN4vGKU50WQCuCo+F1z8YdBS6lUuUk0vCgFqSVyv79Os3SwQ7xF9Mqjr2A
	 wHhArk94bsgQgOF0KTkGEFtJ2wI9Psbm8CxHo63MZH69zH1ztKwiKD5+zoxhErJz9m
	 j1DTR6Qoo9+BstRQqFPxCIeBPtBp8J2wO/DCXN778UDsdEhWccTfvS2Dhx3n2mVCic
	 QqoKv9Zy/6mKDXaVwSAqsB5Oa93xVlB9RYmE5qWNDpgxq4dBF4WtfEFmdtRnn16FT0
	 c2mEFmwoLlniQ==
Message-ID: <sashiko-outbox-174907@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/14] ARM: dts: imx6sx-sdb-mqs: remove empty pinctrl-0
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261016-arm_dts_cleanup2-v1-14-3a0cab9fd784@nxp.com>
References: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
 <20261016-arm_dts_cleanup2-v1-14-3a0cab9fd784@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 20:18:44 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ARM: dts: imx6sx-sdb-mqs: inherited sai1 pinctrl-0 conflicts with =
audmux
--

commit 7833db678f76ab4ca49bd301d79848b89980d394
Author: Frank Li <Frank.Li@nxp.com>

ARM: dts: imx6sx-sdb-mqs: remove empty pinctrl-0

This commit removes the empty pinctrl-0 property from the sai1 node in
imx6sx-sdb-mqs.dts to resolve a dtbs_check schema validation warning.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dts b/arch/arm/boot=
/dts/nxp/imx/imx6sx-sdb-mqs.dts
> index a4ab2d3e960c4..82ae475a018e1 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dts
> @@ -33,7 +33,6 @@ &mqs {
>  };
> =20
>  &sai1 {
> -	pinctrl-0 =3D <>;
>  	status =3D "okay";
>  };
> =20

[Severity: High]
Does removing pinctrl-0 =3D <>; here without using /delete-property/ cause
&sai1 to inherit pinctrl-0 =3D <&pinctrl_sai1>; from imx6sx-sdb.dtsi and
conflict with &audmux at probe time?

imx6sx-sdb-mqs.dts includes imx6sx-sdb.dts, which includes imx6sx-sdb.dtsi
where &sai1 and &audmux are defined as:

arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi:
    &audmux {
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_audmux>;
        status =3D "okay";
    };
    ...
    &sai1 {
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_sai1>;
        status =3D "disabled";
    };

In imx6sx-sdb.dtsi, pinctrl_audmux and pinctrl_sai1 configure the same five
CSI pads:

    pinctrl_audmux: audmuxgrp {
        fsl,pins =3D <
            MX6SX_PAD_CSI_DATA00__AUDMUX_AUD6_TXC   0x130b0
            MX6SX_PAD_CSI_DATA01__AUDMUX_AUD6_TXFS  0x130b0
            MX6SX_PAD_CSI_HSYNC__AUDMUX_AUD6_TXD    0x120b0
            MX6SX_PAD_CSI_VSYNC__AUDMUX_AUD6_RXD    0x130b0
            MX6SX_PAD_CSI_PIXCLK__AUDMUX_MCLK       0x130b0
        >;
    };
    ...
    pinctrl_sai1: sai1grp {
        fsl,pins =3D <
            MX6SX_PAD_CSI_DATA00__SAI1_TX_BCLK      0x130b0
            MX6SX_PAD_CSI_DATA01__SAI1_TX_SYNC      0x130b0
            MX6SX_PAD_CSI_HSYNC__SAI1_TX_DATA_0     0x120b0
            MX6SX_PAD_CSI_VSYNC__SAI1_RX_DATA_0     0x130b0
            MX6SX_PAD_CSI_PIXCLK__AUDMUX_MCLK       0x130b0
        >;
    };

In MQS mode, sai1 routes audio internally to the MQS block (&mqs, which uses
pinctrl_mqs on SD2_CLK and SD2_CMD) rather than using external SAI1 pins.
Commit 73691f21e211 ("ARM: dts: imx6sx-sdb: Add MQS support") originally set
pinctrl-0 =3D <>; in imx6sx-sdb-mqs.dts to override pinctrl-0 =3D <&pinctrl=
_sai1>;
from imx6sx-sdb.dtsi while leaving &audmux enabled.

When pinctrl-0 =3D <>; is simply removed, &sai1 retains pinctrl-0 =3D <&pin=
ctrl_sai1>;
from imx6sx-sdb.dtsi while both &audmux and &sai1 have status =3D "okay",
causing pinctrl_bind_pins() -> pin_request() to fail with -EINVAL when the
second device probes.

Should this use /delete-property/ pinctrl-0; (and /delete-property/
pinctrl-names;) instead so that the inherited pinctrl properties are removed
from &sai1?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-arm_dts_cl=
eanup2-v1-0-3a0cab9fd784@nxp.com?part=3D14
