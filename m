Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C077C34F27B;
	Tue, 26 May 2026 09:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786697; cv=none; b=Dv3BD7asIYgNsK0ImAYV+zGy9YjCLZW7Wt3QvjgjkasxRFs8prA7WH/tyc/Tc+sRfr54qJET/R+y6Z6J66tKvltxjHrXrQTa1kdaWHImA+tsS9cCVuwq2mHMfPy3H5zje4Vv/mTMlrI5cXdadj3uYloAZlVABIQy9oM1bVvOIm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786697; c=relaxed/simple;
	bh=SW7KeJNiQusFQ/pQgB/dBi5RWho0Zrrl8+GM6+8Z7mM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RoOhad+M81Udqt3KFBmS4T5FQwvfSFoW+FVCr9lJzWVhjQNmmsqVrIjUBqZAwIFP/4c3GcUNTJgCcc2S6GL1xQ8zrOHqXoJR/QADG+w6VdF2kWm0frgyQu3Dpbg2ZctQaT3inlfXe+6txua8X7UomiT81WA6dW1hvOj+fOgcHI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iaYCo0Dq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iaYCo0Dq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4161F000E9;
	Tue, 26 May 2026 09:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779786696;
	bh=ayM4bBwu39VrJ1etxfyHUOCYJiIzN3g4ARE+wvaIF6E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iaYCo0DqYyYvN9oQVCsiq0MRZw6sBaA41tuMeduNRZ727T3LpdVSxZpxGMcRstRxz
	 is9zpkUbpgyOpcI/A0hswGRHPVBuyFy4l8TKjx7khnjXd6OwqYjUlFKB1p09br+QLT
	 aRGvdcfkUIX/EW8wHmmYvp8oOgEzeNGyYhtZSvr6JiA6tiagyvg9L5akgjPINTgeqX
	 A9cPoI3B62IBxd8vWXy2DvcFBBM/AqaJaHSqFrKYDMdXRICJb7y0IQVZek6r42tpNg
	 YNfeVD4my7Oh1hCKfDGp4r2bH+o/ztqtad9Hwyh1gaEB4pUwqJmVapu3z7VzpTfAO+
	 ZT5ea6iex4EQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/3] dt-bindings: clock: imx95-blk-ctl: Allow child
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guoniu Zhou" <guoniu.zhou@oss.nxp.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <20260526-csi_formatter-v9-1-ca3d8c334c39@oss.nxp.com>
References: <20260526-csi_formatter-v9-1-ca3d8c334c39@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 09:11:35 +0000
Message-Id: <20260526091136.2C4161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The dt-binding fails to allow the `ranges` (and potentially `dma=
-ranges`) property, causing schema validation to reject valid device tree n=
odes that map child device registers.
- [Low] Child node `patternProperties` definition lacks the required `addit=
ionalProperties` or `unevaluatedProperties` directive.

Pre-existing issues:
- [Critical] The imx95_bc driver completely lacks a `.remove` callback and =
fails to clean up non-managed resources, leading to critical resource leaks=
, use-after-free bugs on unbind, and an APB clock leak.
--

commit 726604ca3bd356c1af7395b3121524ccf63624b9
Author: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

dt-bindings: clock: imx95-blk-ctl: Allow child nodes

This commit adds #address-cells, #size-cells, and a patternProperties block
to the imx95-blk-ctl binding. This allows child device nodes to have their
own bindings, matching the driver's use of devm_of_platform_populate().

> Add support for child nodes in the imx95-blk-ctl binding to match
> the driver implementation which calls devm_of_platform_populate().

[Severity: Critical]
This is a pre-existing issue, but does the imx95_bc driver completely lack a
.remove callback?

While looking at the driver implementation mentioned here, it appears it
relies on non-managed APIs (clk_hw_register_mux, clk_hw_register_divider,
of_clk_add_hw_provider) to register clocks but lacks a way to unregister th=
em
on unbind.

Since the clk_hw_data and associated strings are allocated via devm_kzalloc=
(),
they would be freed on unbind, potentially leaving the clock framework with
pointers to freed structures. Can this result in a use-after-free?

Additionally, when !bc->pdata is true, the probe function leaves bc->clk_apb
enabled without any cleanup mechanism. Does this cause a clock leak on unbi=
nd?

> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.ya=
ml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index 27403b4c52d62..33ad1c15cc9c8 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -39,6 +39,17 @@ properties:
>        ID in its "clocks" phandle cell. See
>        include/dt-bindings/clock/nxp,imx95-clock.h
> =20
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1

[Severity: Medium]
Since this binding now allows child nodes with #address-cells and #size-cel=
ls,
does the parent node also need to allow the ranges property?

Without ranges: true in the properties block, device trees that correctly
define ranges to translate memory-mapped child registers into the CPU addre=
ss
space might be rejected by dt_binding_check due to the top-level
additionalProperties: false restriction.

> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    type: object
> +    description: Child nodes with their own bindings

[Severity: Low]
Does this child node definition need an additionalProperties or
unevaluatedProperties directive?

Device tree schema guidelines typically require all type: object nodes to
explicitly declare one of these. Omitting it might trigger meta-schema
warnings during make dt_binding_check.

> +
>  required:
>    - compatible
>    - reg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-csi_format=
ter-v9-0-ca3d8c334c39@oss.nxp.com?part=3D1
