Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A8A37FF62;
	Fri, 19 Jun 2026 11:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781869032; cv=none; b=bnB/Ief3AaQcrV1YigDprHiyTte3L6RyEZAEYoQTGO/4wG3v8AtL+4T02PNgeJj1Utb+IJlfRkSe1ENDYTkaa4moQq18N62Rd5BKiZ1NHuuv3DAdKZgzqZXhBRjoJBmpX3FgzVBPska48+8XeE39NLKqCvU9SX9eTPja9LwcBUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781869032; c=relaxed/simple;
	bh=1jWdG8yYsG7m9Nyw4OJMEONygH+p7LCh9C0HTjIt4b8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=heCUurfYKeTxS7JXwSyb31Z+Xy+3VIVKIT8vIqE9oYYL2RyaFjQzZ9SkQyjduc8cL2tR+AlnNdS9WOVYtk/u32Jl2Z5p0jFO+k4sizl8IXuxQEXAgTipViQPnKJGerQ4hUsvewE6p6botbff3CUP5KP3I9rI+0eMP2FwhY4qV0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RDKb/q8j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RDKb/q8j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A44BC1F000E9;
	Fri, 19 Jun 2026 11:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781869031;
	bh=oNeKPDWx/iU1jAs2fN6dHHmiQlUjyul3ARr2EHtoDSc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RDKb/q8jyrDpFPE0g8yBZwwD20nJXkzZlPTgCJW1mOREo83tEN1grLSAdxXu1EPec
	 W2bEemew24R8Kw6EeLsxLY9423uEMJsYl3bSEKZg34qj/0yeLl/9QE9cvPz+n6861D
	 cXTRwRgYQOeJMfX+/avZP/w2QphJdHNXVsKgKTuqD7R7w7/euZoUDaR2DtFmeYVBk6
	 npbjdzOXlvjMBbnv1Ej618KTn20JsAEx7sQhWvT8WrxJ0om0fEK92HGEG+DJ+q2WDT
	 sI6CQZTLunNCencFNavvPjoVxGjoXyNwBM1ALz+pW7VCTLrXN158/xuoh02rc4tVYs
	 A2oQJeNrBMW0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/1] arm64: dts: add tqma9596la-mba95xxca
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: wsa+renesas@sang-engineering.com, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260619112434.1121610-1-alexander.stein@ew.tq-group.com>
References: <20260619112434.1121610-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 11:37:10 +0000
Message-Id: <20260619113710.A44BC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Duplicate and incorrect GPIO hog line name `M2_KEYB_WDISABLE1#` =
in `expander3`.
- [Low] Incorrect regulator referenced for `expander2` `vcc-supply`.
- [Low] Typos in pinctrl node names for retimer and typec groups.
--

commit fb001fddc405cd85f401d1d2351baf577241c535
Author: Markus Niebel <Markus.Niebel@ew.tq-group.com>

arm64: dts: add tqma9596la-mba95xxca

This commit adds device tree support for the TQMa95xxLA modules on the
MBa95xxCA carrier board. It configures PCIe, clocks, reset GPIOs, and adds
GPIO hogs for the M.2 slots.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts=
 b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> new file mode 100644
> index 0000000000000..4b49f6cf731da
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts

[ ... ]

> +	/* D40 OUT 3V3 */
> +	expander2: gpio@75 {
> +		compatible =3D "ti,tca9539";
> +		reg =3D <0x75>;
> +		vcc-supply =3D <&reg_3v3>;

[Severity: Low]
Does this point to the SoM regulator instead of the intended mainboard
regulator? Since expander2 is a mainboard component, shouldn't this referen=
ce
<&reg_v3v3_mb>?

> +		gpio-controller;
> +		#gpio-cells =3D <2>;

[ ... ]

> +	/* D41 OUT 1V8 */
> +	expander3: gpio@76 {
> +		compatible =3D "ti,tca9539";
> +		reg =3D <0x76>;

[ ... ]

> +		m2-keyb-wdisable2-hog {
> +			gpio-hog;
> +			gpios =3D <5 GPIO_ACTIVE_LOW>;
> +			output-low;
> +			line-name =3D "M2_KEYB_WDISABLE1#";

[Severity: Medium]
Does this duplicate the line-name used in expander2 for
m2-keyb-wdisable1-hog? This could cause a naming collision in gpiolib. Shou=
ld
this be named "M2_KEYB_WDISABLE2#" instead?

> +		};

[ ... ]

> +	pinctrl_retimer: retirmergrp {

[Severity: Low]
This isn't a bug, but there's a typo in the node name (retirmergrp instead
of retimergrp).

> +		fsl,pins =3D <IMX95_PAD_GPIO_IO29__GPIO2_IO_BIT29			0x1100>;
> +	};

[ ... ]

> +	pinctrl_typec: typcegrp {

[Severity: Low]
This isn't a bug, but there's a typo in the node name (typcegrp instead
of typecgrp).

> +		fsl,pins =3D <IMX95_PAD_GPIO_IO28__GPIO2_IO_BIT28			0x1100>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619112434.1121=
610-1-alexander.stein@ew.tq-group.com?part=3D1
