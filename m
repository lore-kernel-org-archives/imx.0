Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482F53CF204;
	Mon, 13 Jul 2026 11:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943345; cv=none; b=ioompa0HkGOGIUOouqjE5CDRMkz3m9hTLPQ+NKJFVol6EbQvcw+f8laKMgWaiwXEJHzyjV0QUutJHc+r0CTLBAqmMsBfKJ+s6TA71Bo/8QUCjVqgUXvSYjncw4RKsrDHWvRXPUgMFYJ/irCM3YMmGCrTbgF6vVdoP0o8Z3DGNzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943345; c=relaxed/simple;
	bh=/GHgKaLMSepUlUtABXEPugFYnK7CDX4o8YHlPfyVyL4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=enmfDILcYsqXEK8kRZcoyccKxr5OdCBPNztHJr+TIu8NIKi9VCQSxrJAJiOiURoZNaloSZBiV/QbacHXHK4uFuGHKuQpyoopoJcf4Npc3QrKfKcSGxgg3bHngdiRtB0onH60rge4dsjCAkViKjz30vqMxQUJLLhqKdJe33/bugA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H/wV8tt+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/wV8tt+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD6E1F00A3A;
	Mon, 13 Jul 2026 11:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783943333;
	bh=b5Nvv0eGx1ZXkJpLZCB89jF/tRDgJe4Mbg7ugS9ScTY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H/wV8tt+ksuvEMRqF53/b1Ifpnvilf/hfppNvgTpGF+O829LiTdb1PLks8eQhlRY7
	 DqPWu4NJwbgNT5i94iSs1Vsl662PPHckjK9T6JbKEw8UY0moGHWGeuBjkmLVL4jAcZ
	 H6z/AWlkgPtjKaCid7nqbpuaBX3r8bnqauvsMymHqKiACjMIN90bH89dfXw2wmGwel
	 6Uobzq4nIJTLPRfE3qpBhEnmv/6iRY65AfIzVk5XecM9o85ZPyHafScBt87QAzI/mF
	 bwBfEswMFrYy1gsEwI0RMWsRZkDsR4PNqK/dBno7FBvKce1vmDj0X/564muj5ZWGeY
	 TXYccL7f6H2iQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/18] arm64: dts: ti: k3-j721s2-main: Add multiple
 channels for CSI2RX DMA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yemike Abhilash Chandra" <y-abhilashchandra@ti.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <20260713113423.2310443-4-y-abhilashchandra@ti.com>
References: <20260713113423.2310443-1-y-abhilashchandra@ti.com>
 <20260713113423.2310443-4-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 11:48:52 +0000
Message-Id: <20260713114853.3CD6E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Leakage of allocated DMA channels during driver probe error paths =
due to flawed PM runtime status check.
- [High] Missing `pm_runtime_disable()` in the `ti_csi2rx_probe` error path.
- [High] Leakage of successfully requested DMA channels on partial `runtime=
_resume` failures.
- [High] Unreachable stream validation error check silently ignores missing=
 streams.
--

--- Patch [3]: [PATCH v2 03/18] arm64: dts: ti: k3-j721s2-main: Add multipl=
e channels for CSI2RX DMA ---
commit aa226bddd4872f73702e34f1bec61a88480652a0
Author: Vaishnav Achath <vaishnav.a@ti.com>

arm64: dts: ti: k3-j721s2-main: Add multiple channels for CSI2RX DMA

This commit adds additional DMA channels to the J721E CSI2RX SHIM layer
device tree node. It enables multistream support by expanding the dmas
and dma-names properties to handle up to 8 channels per node.

> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot=
/dts/ti/k3-j721s2-main.dtsi
> index 5cac119e4292a..f4b8713873b17 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> @@ -1239,8 +1239,11 @@ ti_csi2rx0: ticsi2rx@4500000 {
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
This isn't a bug introduced by this patch, but scaling up the number of
channels in the device tree makes a DMA channel leak regression worse on
probe errors in the driver.

If ti_csi2rx_probe() in drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx=
.c
fails midway through initializing these new contexts, it cleans up here:

err_ctx:
        while (i--)
                ti_csi2rx_cleanup_ctx(&csi->ctx[i]);

However, ti_csi2rx_cleanup_ctx() has this check:

        if (!pm_runtime_status_suspended(ctx->csi->dev))
                dma_release_channel(ctx->dma.chan);

Since pm_runtime_set_active() hasn't been called yet during early probe,
the device is still in its default RPM_SUSPENDED state. Will this cause
the DMA channels to be permanently leaked when probe fails?

[Severity: High]
This is another pre-existing issue, but the addition of multiple DMA channe=
ls
also increases the impact of a leak during runtime resume:

drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:ti_csi2rx_runtime_res=
ume()
        for (unsigned int i =3D 0; i < csi->num_ctx; i++) {
                ret =3D ti_csi2rx_init_dma(&csi->ctx[i]);
                if (ret)
                        return ret;
        }

If ti_csi2rx_init_dma() fails for a later channel (e.g., rx4), the function
returns immediately without an error unwind path. Do the channels
successfully requested in earlier iterations get stranded indefinitely since
runtime_suspend won't be called?

[Severity: High]
This is a pre-existing issue in the probe error path that leaves a dangling
PM configuration:

drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:ti_csi2rx_probe()
err_notifier:
        ti_csi2rx_cleanup_notifier(csi);
err_ctx:
        while (i--)
                ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
        ti_csi2rx_cleanup_v4l2(csi);
err_dma_chan:
        dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
                          csi->drain.paddr);
        return ret;

This path executes after pm_runtime_enable(csi->dev) has been called. Should
pm_runtime_disable() be called here before returning to unroll the PM
enablement?

[Severity: High]
This is a pre-existing issue, but it breaks stream validation for multistre=
am
setups.

In ti_csi2rx_get_vc_and_dt(), the loop searches for a matching stream:

drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:ti_csi2rx_get_vc_and_=
dt()
        for (j =3D 0; j < fd.num_entries; j++) {
                ...
                        /* Return error if no matching stream found */
                        if (j =3D=3D fd.num_entries)
                                return -EINVAL;
        }

Since the if statement is completely inside the for-loop where
j < fd.num_entries, it is mathematically impossible for the condition to
evaluate to true. Could the driver silently proceed with incorrect
hardware configurations if a requested stream is missing?

>  		power-domains =3D <&k3_pds 38 TI_SCI_PD_EXCLUSIVE>;
>  		status =3D "disabled";

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713113423.2310=
443-1-y-abhilashchandra@ti.com?part=3D3
