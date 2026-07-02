Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4E23431F8;
	Thu,  2 Jul 2026 09:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985596; cv=none; b=ALGVJB4o2SbfYFluZB/kKtNh4X8oVGau6m9fAq8jjJI7F4yi6NNlBqwGlzQxRqvxFYnJCBvMZqCsEtLQXthEJnWV+Sih7iQyd6yyrbCQ0BRb8MLYlsN7FjZCJKsOUhedfCYIuL3IyRjiPGWTO5OwVX0iaFa9KMb+8WZJLWjWhR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985596; c=relaxed/simple;
	bh=gyd1DnYBjYc2aEb9gh1FybrC7uWKynToGOctNhrPA4E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y7SV2RgKUATTQNFdGQ65o5oYckxCWtRvm6v+kkMogH3ncDvdOm51dL8ieSpwj5Kv135stl9jVru2MvD/HiQ/SkY82fBTUAmPVDvVB6mFYfHtRse9VA0+20GLZ6vL1LfikFASpHa2iuMztIAQ6L3Q/v8ZleWDUpyN9JPRVT5rCMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zn5pmVOU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zn5pmVOU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3FA1F00A3A;
	Thu,  2 Jul 2026 09:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782985594;
	bh=lJkpx0NucCXPso1sxGsRDMtrW6wIhGWlRDuljKI6dyg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zn5pmVOUsGrsFuIlBzo5O5Nu5voaNDV3fN3r5rzMzyo1bMPf4CqEF3i91FlOaR8UM
	 r/h3tmZjmloT1D9SlrYoR0uX287BSlUwXXXOxULGsIo86VJUemkF4HZehGGXReMk8H
	 ziPh/e0TVOzcQcSCMQMBy9llimCrA/557PHslX0wj8BIBZEoUXsk2qwPbxZspzlcep
	 1kfCqN07KYIF8RZ8iV6i040S+yrllWwEX7oJkyqPR7sJPLxOWzf0ewvnX9OzDCZGxd
	 2c6BC+mgOrTFHhP9X0Gi9GbSQLJckZzgKAmi7W5E2QbP02eFCNGi+CNz1SFFTKTpAg
	 zZ5bxYY5JXMBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/18] arm64: dts: ti: k3-j784s4-j742s2-main-common: Add
 multiple channels for CSI2RX DMA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yemike Abhilash Chandra" <y-abhilashchandra@ti.com>
Cc: imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260702093123.1048575-5-y-abhilashchandra@ti.com>
References: <20260702093123.1048575-1-y-abhilashchandra@ti.com>
 <20260702093123.1048575-5-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 09:46:34 +0000
Message-Id: <20260702094634.6C3FA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] DMA channel leak on driver removal and probe failure due to incorr=
ect PM runtime status checks.
--

commit ea67c91b4fdffdca029b973dd9749e310980e700
Author: Vaishnav Achath <vaishnav.a@ti.com>

arm64: dts: ti: k3-j784s4-j742s2-main-common: Add multiple channels for CSI=
2RX DMA

J721E CSI2RX SHIM layer can support up to 32 DMA channel contexts,
Add additional DMA channels to enable multistream support for CSI2RX.

> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/a=
rch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> index c2636e624f18b..4b4545a5af192 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> @@ -811,8 +811,11 @@ ti_csi2rx0: ticsi2rx@4500000 {
>  		ranges;
>  		#address-cells =3D <2>;
>  		#size-cells =3D <2>;
> -		dmas =3D <&main_bcdma_csi 0 0x4940 0>;
> -		dma-names =3D "rx0";
> +		dmas =3D <&main_bcdma_csi 0 0x4940 0>, <&main_bcdma_csi 0 0x4941 0>,
> +		       <&main_bcdma_csi 0 0x4942 0>, <&main_bcdma_csi 0 0x4943 0>,
> +		       <&main_bcdma_csi 0 0x4944 0>, <&main_bcdma_csi 0 0x4945 0>,
> +		       <&main_bcdma_csi 0 0x4946 0>, <&main_bcdma_csi 0 0x4947 0>;
> +		dma-names =3D "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7";
>  		power-domains =3D <&k3_pds 72 TI_SCI_PD_EXCLUSIVE>;
>  		status =3D "disabled";
> =20

[Severity: High]
This isn't a bug introduced by this patch, but adding these multiple channe=
ls
amplifies a pre-existing DMA channel leak in the j721e-csi2rx driver.

When ti_csi2rx_remove() is called or during probe failure, are all of these
allocated DMA channels permanently leaked?

Looking at ti_csi2rx_remove() in
drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c, the device is
explicitly forced into a suspended state before cleaning up the contexts:

	if (!pm_runtime_status_suspended(&pdev->dev))
		pm_runtime_set_suspended(&pdev->dev);

	for (unsigned int i =3D 0; i < csi->num_ctx; i++)
		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);

When ti_csi2rx_cleanup_ctx() is called, it checks the suspend status:

	if (!pm_runtime_status_suspended(ctx->csi->dev))
		dma_release_channel(ctx->dma.chan);

Since the device was suspended just prior to this loop, won't this check
always evaluate to false and skip dma_release_channel() completely?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702093123.1048=
575-1-y-abhilashchandra@ti.com?part=3D4
