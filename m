Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFAD3CFF62;
	Mon, 13 Jul 2026 11:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943447; cv=none; b=oaToJeJl2jfrqRkPkiXSPTAegflfRYhGtT2x8y+qeXbgqF8RiBVX7Qdc6AN+srW0FpiN2B8N934iIN1Vsh0yF3OiJhOsUJ3QTLTJ7lV/jj3o0x97J2hkuM895H9baEuiU/8z3ScHeSylLrw8B5g4LHHI1Mr5E+o0UYpwpLEqKs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943447; c=relaxed/simple;
	bh=11UeDmBsuBqRYggVnD3ev5amPkLRJsMORlSHbCjOfhA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a/EpPeDJWrB3n77gwyXda9Uahx8mkNL+20WELrEaSEkt62gKCS7d+305q2gPRLNfsKQwIRfRuX7LyZ27HvTGhdiX0dZ4pR5c5/eSBg5jLH8Ho3YbAXgRRbt21+zZX1dkc1A14Xd39iHj2OLF1tTHzXLbzFsnXtlc2bKA3+/fy4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDkVdYxW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDkVdYxW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 213F31F000E9;
	Mon, 13 Jul 2026 11:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783943441;
	bh=1mbN8eNdjVr7o4rWULavtp/pnpgSU4r8lLn5jDBY1Cw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cDkVdYxWlqxQH0HI4NFi2PZYCZ46/+js/bM6xYBpdpuh6EKJw+54/mvjUWBEnXK3Q
	 GXiVRsUFQXWeDRetkC9aS7mumcL4pwwG11CdJnF2g4++SdLHBUudDHfq0wNUbrOZ1/
	 Sw5f7B+9n0FD0DUCe1lgSeMp5v+FewPlEqRNnAwIxj01v5Q17obvxcJU5USJM+l7g1
	 fi5LZE3DdS+RVgV5DFb1bAEwHIvm8OkokgUc9hXMsfEucsSWJOa8IkD9C3qHAf121O
	 6CKofwhMbvDCKcNnFFtu9EXZHFZYCqq1unyLGGmbXlSrH5IQ3kDA6cWEbx2XJmfVDR
	 CpB8/PNgsqDQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/18] arm64: dts: ti: k3-j784s4-j742s2-main-common:
 Add multiple channels for CSI2RX DMA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yemike Abhilash Chandra" <y-abhilashchandra@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260713113423.2310443-5-y-abhilashchandra@ti.com>
References: <20260713113423.2310443-1-y-abhilashchandra@ti.com>
 <20260713113423.2310443-5-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 11:50:40 +0000
Message-Id: <20260713115041.213F31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] DMA channel leak on probe failure due to incorrect PM status check.
- [High] DMA channels are leaked on module removal if the device is active.
- [High] Missing pm_runtime_disable() on probe error paths.
- [High] DMA channel leak on error path in ti_csi2rx_runtime_resume().
- [High] DMA drain transaction is instantly aborted during system suspend.
--

--- Patch [4]: [PATCH v2 04/18] arm64: dts: ti: k3-j784s4-j742s2-main-commo=
n: Add multiple channels for CSI2RX DMA ---
commit ebceec6da92de871c7ab51be87cc009f8c4d7c16
Author: Vaishnav Achath <vaishnav.a@ti.com>

arm64: dts: ti: k3-j784s4-j742s2-main-common: Add multiple channels for CSI=
2RX DMA

This commit expands the CSI2RX SHIM layer configuration in the device tree
to support up to 8 DMA channel contexts. This change enables multistream
support for CSI2RX by adding the necessary DMA mappings.

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

[Severity: High]
This is a pre-existing issue, but expanding the channel count makes a=20
multi-iteration failure during initialization more likely.

If ti_csi2rx_init_ctx() fails for a later context in ti_csi2rx_probe(), it=
=20
jumps to err_ctx to clean up previously successful contexts. However,=20
pm_runtime_set_active() has not been called yet, so the device is=20
considered suspended:

drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:ti_csi2rx_cleanup_ctx=
() {
    ...
    if (!pm_runtime_status_suspended(ctx->csi->dev))
        dma_release_channel(ctx->dma.chan);
    ...
}

Will this skip the DMA release and leak the successfully requested channels?

[Severity: High]
This is a pre-existing issue, but does a partial failure during runtime=20
resume also cause a permanent leak of previously allocated DMA channels?

drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:ti_csi2rx_runtime_res=
ume() {
    ...
    for (unsigned int i =3D 0; i < csi->num_ctx; i++) {
        ret =3D ti_csi2rx_init_dma(&csi->ctx[i]);
        if (ret)
            return ret;
    }
    ...
}

If ti_csi2rx_init_dma() fails for a later context, it returns immediately=20
without freeing the channels allocated for previous contexts. Since the nex=
t=20
resume attempt will re-allocate new channels, do the old channels become=20
permanently leaked?

[Severity: High]
This is a pre-existing issue, but does module removal also leak all 8=20
channels if the device is active?

drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:ti_csi2rx_remove() {
    ...
    if (!pm_runtime_status_suspended(&pdev->dev))
        pm_runtime_set_suspended(&pdev->dev);
    ...
}

This forcefully manipulates the internal PM state to suspended without=20
invoking the runtime_suspend callback. When ti_csi2rx_cleanup_ctx() is=20
called immediately afterward, it sees the newly set suspended state and=20
skips calling dma_release_channel(). Can this be avoided so channels are=20
properly released?

[Severity: High]
This is a pre-existing issue, but do the probe error paths leave the PM=20
state unbalanced?

pm_runtime_enable() is called earlier in probe, but pm_runtime_disable()=20
appears to be missing on the error paths:

drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:ti_csi2rx_probe() {
    ...
err_notifier:
    ti_csi2rx_cleanup_notifier(csi);
err_ctx:
    while (i--)
        ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
    ...
}

If ti_csi2rx_notifier_register() or subsequent initialization steps fail,=20
the driver returns an error but leaves the device improperly registered wit=
h=20
the PM framework. Should a pm_runtime_disable() be added here?

[Severity: High]
This is a pre-existing issue, but is the asynchronous DMA drain transaction=
=20
instantly aborted during system suspend?

drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:ti_csi2rx_suspend() {
    ...
    /* Drain DMA */
    ti_csi2rx_drain_dma(ctx);

    /* Terminate DMA */
    ret =3D dmaengine_terminate_sync(ctx->dma.chan);
    ...
}

The driver submits an asynchronous DMA drain transaction via=20
ti_csi2rx_drain_dma(), but immediately calls dmaengine_terminate_sync()=20
without waiting for it to complete. Does this synchronously terminate the=20
drain transfer before it can execute, potentially leaving stale data in the=
=20
hardware FIFO?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713113423.2310=
443-1-y-abhilashchandra@ti.com?part=3D4
