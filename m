Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187B239150B;
	Tue,  1 Sep 2026 13:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269243; cv=none; b=NHNaPyftYrdcOSN5CT9KjQYtbBFuczTSezAhbB7btu7xk4dc1IpMa5/2+xZtrF/wUkUfc6dS24UrDzwwEowJdul1uN50ZRD8emSFmCSInUu0xgiAg46hyVkoZ//MTeGUW2XGFc/XfLySTR+JKfgp1UsDTTkN3mAP+ap62EKDifg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269243; c=relaxed/simple;
	bh=1aENMMtS+yY88LLuNj0Qn62W0zAkd4AindTr7A0JI5s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IgMzgaowYqI08Cd1Q6HEa2L5OZ0tsK4Fk7gxXZdyaow0maiTtkAqmu9Mwuz5t9kfHdIKvGDVHrCrQySgUk5aey7pgAkdXFehkjBa5MyU6cIUnNAy8inftW1+qjTZOzXpUKRHeeHmNP82NPORPI2zZWRhBthxYpjt9xHg7sCEEgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/IuEOmM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/IuEOmM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9559B1F000E9;
	Tue,  1 Sep 2026 13:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788269242;
	bh=O6HV4xFAa84CVnA74FBEsf7VVtXXNQ8bsi88HkIE9bA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A/IuEOmMLNDlm7xyHCH1pmH+fHir/67POSXt2QiQe1SWhdBKdPOD7u5I+1ugIv6Rb
	 QOc07a91e/juYLTq/bLjEXS708gvWIF9QOjsYRpdCOpZ9N6nRSjkH9LCO49FBYgfea
	 pj0Wgq0psMWMh5iEsn6zKpdsKJkHNRsvC6dndJwBMTxlgCWTmi6P+TX1m4sAh0MxEm
	 toO3YDtlRQvec+CK3r7T0LFLKltLlcGfenlPAaSVoBKKBoxZB8EWZBL8e74kPrWKLo
	 Em+gg4deVQ1ALjCK1RS89lzfpoUMyCLelBzbyRZB72kFi3NrHIOrz15jYM7JUyMCSy
	 gCNEcZ7NEo8Cw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Laurentiu Mihalcea" <laurentiumihalcea111@gmail.com>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260901131918.1189-3-laurentiumihalcea111@gmail.com>
References: <20260901131918.1189-1-laurentiumihalcea111@gmail.com>
 <20260901131918.1189-3-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 13:27:21 +0000
Message-Id: <20260901132721.9559B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing memory node in device tree
- [Medium] Missing USB controller and Type-C implementation
--

commit 3130a84e68bcdc800ca07e4c01ec3d00e67a37c4
Author: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

arm64: dts: freescale: add MR-NAVQ95 basic board support

This commit adds basic device tree support for the NXP MR-NAVQ95 board
based on the i.MX95 SoC. It defines initial aliases, chosen nodes,
regulators, and various pin configurations.

>    Add basic support for NXP's MR-NAVQ95 board. This board is designed for
>    robotics applications (e.g. drones, rovers, humanoids, etc..) and has =
the
>    following hardware feats (list is not exhaustive):
>   =20
>    * based on i.MX95 19x19 SoC
>    * 64GB eMMC
>    * up to 16GB of LPDDR5 memory
>    * 1 x USB 2.0 TypeC
>    * 1 x USB 3.0 TypeC
>    * 1 x RJ45 port with RTL8211 PHY

[Severity: Medium]
The commit message claims hardware features of 1 x USB 2.0 TypeC and 1 x US=
B 3.0
TypeC, but looking at the device tree file, it completely omits any USB nod=
es
or Type-C definitions. Will this leave the USB ports non-functional in Linu=
x,
and should they be added to match the hardware description?

> diff --git a/arch/arm64/boot/dts/freescale/imx95-navq.dts b/arch/arm64/bo=
ot/dts/freescale/imx95-navq.dts
> new file mode 100644
> index 0000000000000..1366dc2d2bfa4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-navq.dts
> @@ -0,0 +1,222 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include "imx95.dtsi"
> +
> +/ {
> +	model =3D "NXP MR-NAVQ95";
> +	compatible =3D "fsl,imx95-navq", "fsl,imx95";
> +
> +	aliases {

[Severity: Medium]
Should there be a memory node defined here at the root level (e.g.,
memory@80000000)? Omitting the memory node breaks standard DT conventions f=
or
root nodes and can cause boot failures if the bootloader expects an existing
node to update and does not dynamically inject it from scratch.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901131918.1189=
-1-laurentiumihalcea111@gmail.com?part=3D2
