Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189DF3C09FF;
	Wed, 15 Jul 2026 07:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099912; cv=none; b=fTPwVzNb7RjrRJ4D+KCYB3C7ju1e9lhS6J93mu2lAR42Vk7tR9y8AJxCV3s7kQOHVOYb8bhnVM+OClyN8A7g05JjL5mrJNaGFuRiFv9b9h6ChywYaRZzhklxPOsvaGD5NEV38demf+1WNbcDOqbXoTPNnU0swVyGZ2ThQbdGZaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099912; c=relaxed/simple;
	bh=NZUP0LLs9ErER9blah/mRelTPAcBw+4VWR6Zg/IzRWg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nTOAE26WTqAHhxVkqWlmOwjOy3h1tl3FRgArnZu6qFlIKa9icGEjhcdVFztTqhie8HPS5tadcBqp5N8MA/I7ksKi6z0fuONYT6r92MIdFNDoz/XSw+rfgJ3dtRrX+dRJltEuVvycU99xYQSafiW0ERFe5M8PClU37kAWM+aHZdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=He90+xfG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="He90+xfG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB05D1F000E9;
	Wed, 15 Jul 2026 07:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784099909;
	bh=ZKutYLlgtncCXKqO8gzIKyEPaNeILtw+B9PYjAFRAfw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=He90+xfG0PXiaIffokqf3o2tK1k2Xm1e/DNAMziY3jnGoAZjEj5AcAROtsnBc623Q
	 JF2pS3hcy5neyeVVfBIf+gWzY46lU8ZhdDE00T5/D4DuFELgY8ISO93wbnc5zd4FfZ
	 Gx8wd3wXUgymvO9Id0BUHZN0WrgE8Or4X6+fY1EaQBlj+hTeMYuCjK5q00S6FztacJ
	 ehyKcT1CBmJUIVzAn42XAZl7k1uIlIbs68MDsIRB4Yv3UDSVvZbn1ApgCXe8STZsir
	 XwNGSM6nIKSlY1iLC1OHGe/QzQTXjeNgSP3TCTONHV5WC6gVKngWqlbjK+1BC1YtgS
	 l0queD8jBsoRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: imx943-evk: Add CM7 and CM33S nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260715-imx-rproc-dts-v1-3-d02b583c507b@nxp.com>
References: <20260715-imx-rproc-dts-v1-0-d02b583c507b@nxp.com>
 <20260715-imx-rproc-dts-v1-3-d02b583c507b@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 07:18:28 +0000
Message-Id: <20260715071828.DB05D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing reserved memory regions for remoteproc firmware, breaking =
DDR firmware loading.
--

--- Patch [3]: [PATCH 3/4] arm64: dts: imx943-evk: Add CM7 and CM33S nodes =
---
commit a58e64cf15c23fbbaba6ea1a5241a2bcdda233ef
Author: Peng Fan <peng.fan@nxp.com>

arm64: dts: imx943-evk: Add CM7 and CM33S nodes

This commit adds remoteproc nodes for Cortex-M7 (CM7-0, CM7-1) and Cortex-M=
33S
cores on the imx943-evk. It enables mailbox units and defines reserved memo=
ry
regions for vrings, resource tables, and shared DMA pools.

> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx943-evk.dts
> index 674410e541cba..da7bfbd52e312 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -133,6 +133,36 @@ reg_audio_pwr: regulator-wm8962-pwr {
>  		enable-active-high;
>  	};
> =20
> +	remoteproc-cm70 {
> +		compatible =3D "fsl,imx94-cm70";
> +		mbox-names =3D "tx", "rx", "rxdb";
> +		mboxes =3D <&mu11 0 1
> +			  &mu11 1 1
> +			  &mu11 3 1>;
> +		memory-region =3D <&cm70_vdevbuffer>, <&cm70_vdev0vring0>, <&cm70_vdev=
0vring1>,
> +				<&cm70_vdev1vring0>, <&cm70_vdev1vring1>, <&cm70_rsc_table>;

[Severity: High]
The commit message mentions adding reserved memory regions for firmware, but
are those regions missing from this memory-region list?

Without the firmware memory region defined, imx_rproc_da_to_va() will fail =
to
translate DDR addresses, which aborts firmware loading for segments destined
for DDR.

> +	};
> +
> +	remoteproc-cm71 {
> +		compatible =3D "fsl,imx94-cm71";
> +		mbox-names =3D "tx", "rx", "rxdb";
> +		mboxes =3D <&mu13 0 1
> +			  &mu13 1 1
> +			  &mu13 3 1>;
> +		memory-region =3D <&cm71_vdevbuffer>, <&cm71_vdev0vring0>, <&cm71_vdev=
0vring1>,
> +				<&cm71_vdev1vring0>, <&cm71_vdev1vring1>, <&cm71_rsc_table>;

[Severity: High]
Is the firmware memory region missing here as well?

> +	};
> +
> +	remoteproc-cm33s {
> +		compatible =3D "fsl,imx94-cm33s";
> +		mbox-names =3D "tx", "rx", "rxdb";
> +		mboxes =3D <&mu15 0 1
> +			  &mu15 1 1
> +			  &mu15 3 1>;
> +		memory-region =3D <&cm33s_vdevbuffer>, <&cm33s_vdev0vring0>, <&cm33s_v=
dev0vring1>,
> +				<&cm33s_vdev1vring0>, <&cm33s_vdev1vring1>, <&cm33s_rsc_table>;

[Severity: High]
And similarly, is the firmware memory region missing for the CM33S core?

> +	};
> +
>  	reserved-memory {
>  		ranges;
>  		#address-cells =3D <2>;
> @@ -145,6 +175,99 @@ linux,cma {
>  			size =3D <0 0x10000000>;
>  			linux,cma-default;
>  		};
> +
> +		cm33s_vdev0vring0: vdev0vring0@20800000 {

[Severity: High]
Does this block omit the actual firmware memory regions?

The reserved memory declarations define vrings, resource tables, and shared=
 DMA
pools, but the firmware memory regions themselves seem to be completely mis=
sing.

There appears to be a 32MB gap in the DDR addresses (e.g., 0x80000000 to
0x81FFFFFF before cm70_vdev0vring0 at 0x82000000), which suggests the firmw=
are
regions might have been unintentionally dropped.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-imx-rproc-=
dts-v1-0-d02b583c507b@nxp.com?part=3D3
