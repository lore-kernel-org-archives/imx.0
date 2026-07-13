Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2163F1AC5;
	Mon, 13 Jul 2026 11:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943383; cv=none; b=soPvGh4xfgFg7ZChUpXcwgjkr8oS4VYsvMeJ+6piabsCx/cIhEw6IoMhfGyAMlw8+wFnsIBVBctKqpOtk25Qvfjfki0+CTgQ9rfxlVboIjnZjChekYfWtm5TARELhGAs5oBrsg+K47okTzl2xguz7+Pqxd8rBqsnOxD+jDJu2+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943383; c=relaxed/simple;
	bh=GkozHKXSoZ2wR4ajkOEpfTb8oDAva7gjkLxRXsGjVIs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NezK3THfGfc0+wf6ootvUhsa3vk6GBeUCle81IPzWeYNFebFvU2tssE0thSlvViYB9XYuD41ZYLTwl+8ZyazOx/3mUdM6grOfIE0IsIX3CeGrhh1bSjFs/Tb2n9XyM65HB1IKo2cmTWVXx4SBztqrfuQ0tallR7BayG5Gx6TXeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E5CsO/dT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E5CsO/dT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604271F000E9;
	Mon, 13 Jul 2026 11:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783943369;
	bh=gQOXD74tuqTS6+S4RPt0AHk03HPSQzTbz8kAhaFB66E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E5CsO/dTqEl6BYv2VYDMCN5VQhf8mLD4mwCn0QCuWo1SLkI3bVgRRRBovY6SGcZ3U
	 PFoWYWsbzn1i6mWTGBTQvf71vP3YA7jXmo5um4N9mN9OWk6lllPgL5VQ7//ulfKI3i
	 aKIT8BDhypgCDLOJ1yzwA8zRusHfgj7nFZjuLJn8Ix7IghKqlq3tFJDiVus/myQ/zb
	 hioPPGftvZGjSqmlNzlRXts3r/6UtCFhii/+N1ZYd6K3C6XMpXvrfJL0zEZc85hL+W
	 pE45QYrFZNAuIwSRyLk9qz+vCqoO3SVI6YeP67iGGbBCHZq1K2G5evsdxunfmd1uUE
	 3r9ggmeDf2hyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/18] arm64: dts: ti: k3-am62p-j722s: Add multiple
 channels for CSI2RX DMA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yemike Abhilash Chandra" <y-abhilashchandra@ti.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260713113423.2310443-6-y-abhilashchandra@ti.com>
References: <20260713113423.2310443-1-y-abhilashchandra@ti.com>
 <20260713113423.2310443-6-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 11:49:28 +0000
Message-Id: <20260713114929.604271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Incomplete multistream implementation for J722S SoC: missing DMA=
 channels for CSI2RX instances 1, 2, and 3.

Pre-existing issues:
- [High] The driver j721e-csi2rx.c leaks DMA channels on probe error, remov=
e, and runtime_resume.
--

--- Patch [5]: [PATCH v2 05/18] arm64: dts: ti: k3-am62p-j722s: Add multipl=
e channels for CSI2RX DMA ---
commit 57c14c001a8a9799dd013f93cc44d67678cdb58d
Author: Vaishnav Achath <vaishnav.a@ti.com>

arm64: dts: ti: k3-am62p-j722s: Add multiple channels for CSI2RX DMA
   =20
J721E CSI2RX SHIM layer can support up to 32 DMA channel contexts. This pat=
ch
adds additional DMA channels to enable multistream support for CSI2RX.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arc=
h/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> index f130c7cb998d7..ecb537b96fcaa 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> @@ -1053,8 +1053,10 @@ ti_csi2rx0: ticsi2rx@30102000 {
>  		ranges;
>  		#address-cells =3D <2>;
>  		#size-cells =3D <2>;
> -		dmas =3D <&main_bcdma_csi 0 0x5000 0>;
> -		dma-names =3D "rx0";
> +		dmas =3D <&main_bcdma_csi 0 0x5000 0>, <&main_bcdma_csi 0 0x5001 0>,
> +		       <&main_bcdma_csi 0 0x5002 0>, <&main_bcdma_csi 0 0x5003 0>,
> +		       <&main_bcdma_csi 0 0x5004 0>, <&main_bcdma_csi 0 0x5005 0>;
> +		dma-names =3D "rx0", "rx1", "rx2", "rx3", "rx4", "rx5";

[Severity: High]
This isn't a bug introduced by this patch, but increasing the number of DMA
channels here heavily amplifies a channel leak in the j721e-csi2rx.c driver.

When probe fails after channels are requested, ti_csi2rx_cleanup_ctx() chec=
ks
the PM runtime status:

drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:ti_csi2rx_cleanup_ctx=
() {
        if (!pm_runtime_status_suspended(ctx->csi->dev))
                dma_release_channel(ctx->dma.chan);
}

Since the PM status is default suspended during a probe failure, the channe=
ls
are never released.

Similarly, during driver removal, the driver calls pm_runtime_set_suspended=
()
before cleaning up contexts, causing the same leak for active devices:

drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:ti_csi2rx_remove() {
        if (!pm_runtime_status_suspended(&pdev->dev))
                pm_runtime_set_suspended(&pdev->dev);

        for (unsigned int i =3D 0; i < csi->num_ctx; i++)
                ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
}

Finally, by increasing the context count to 6 here, this activates a mid-lo=
op
failure path in ti_csi2rx_runtime_resume() that was impossible with 1 chann=
el:

drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:ti_csi2rx_runtime_res=
ume() {
        for (unsigned int i =3D 0; i < csi->num_ctx; i++) {
                ret =3D ti_csi2rx_init_dma(&csi->ctx[i]);
                if (ret)
                        return ret;
        }
}

If ti_csi2rx_init_dma() fails at i=3D1, does this return without releasing =
the
channel successfully requested at i=3D0? Would it be possible to address th=
ese
leaks in the driver prior to or alongside expanding the channel counts in
the DT?

[Severity: Medium]
Are there missing multistream DMA channel definitions for the other CSI2RX
instances?

The J722S SoC has four identical instances (ti_csi2rx0 through ti_csi2rx3).
While this updates ti_csi2rx0 in k3-am62p-j722s-common-main.dtsi, the other
instances in k3-j722s-main.dtsi appear to still only have one DMA context:

arch/arm64/boot/dts/ti/k3-j722s-main.dtsi:ti_csi2rx1() {
        ...
        dmas =3D <&main_bcdma_csi 0 0x5100 0>;
        dma-names =3D "rx0";
        ...
}

If a user connects a multistream camera to CSI ports 1, 2, or 3, will they
be prevented from using multistream capture because rx1 through rx5 are not
defined? Should instances 1 through 3 be updated to match ti_csi2rx0?

>  		power-domains =3D <&k3_pds 182 TI_SCI_PD_EXCLUSIVE>;
>  		status =3D "disabled";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713113423.2310=
443-1-y-abhilashchandra@ti.com?part=3D5
