Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97E543F08A
	for <imx@lists.linux.dev>; Sun, 19 Jul 2026 19:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784490691; cv=none; b=bXRfdQedCyGGFT1HOHYE2Q22Woxm6uz3q+weU5y6FP6GI74NUqJi/ifo/AFHmtsXH855vTBJRbLzCQX972c2yCayPo/RhTarXXMg2fGpA0crXM7YlE6330Wgl/0tZM/63aYAKaaztz/CcDJv2L9CJkZegESQyJh7IVJVUL5Y7/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784490691; c=relaxed/simple;
	bh=TvH8Vglfof6fk5Mvhq3EWjbWTE14WF44sfrCqTzcl7o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U+kSpqT8qoZ6qchxt1qETBT17iOKN3gQQXnT71TsG76UyKQNuFUN+zVUKJib1Lp0yxLf1LTYAu3L8VyI3c1Zva7JwMC2/wcr9Xxn7R8LzDhba6d+VmkwytDjgY6oABShohFGAGZdJFLh10MuT1l5hH6XbUkXiE9I1A+VKQbB1cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bss8GD+O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bss8GD+O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F451F00A3A;
	Sun, 19 Jul 2026 19:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784490689;
	bh=+eDYk+YAGomOEwbv5cf/MyD1g+QQaE6zc1va2uJlMTc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bss8GD+O4oz27twFApUNe++Au+q/yE8JJ43Ajr2cM1kWBNeP2O21VoXv8PQyEgPuG
	 eos9VEWxVqv7kOkQ7RPallrjAMM5OP53VDlQDLS7pfXAGZJEmBa6EQY/2kYPKvIcKH
	 LKzB+V/P+jCSIAZyfTB0er7bUROPi7hdxPyM3aM7M67AFsNetmGzolVR3/vqGTOQRE
	 bcrQ2hruxHHklpSeihsM3YRLuNidqov2DoSp1cR0pGcpkO/5915pjr2HMrqkKfGg52
	 bWEAg2AZCF9n3iftDvD6fp+DK//GckSoPjlgGVJLN6PV513CMUGPio4k5O6zNQ973L
	 TtENQ698HrjjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] EDAC: fsl_ddr: manage mci lifetime via devres to
 fix remove UAF
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260719194009.117532-3-rosenp@gmail.com>
References: <20260719194009.117532-1-rosenp@gmail.com>
 <20260719194009.117532-3-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 19:51:29 +0000
Message-Id: <20260719195129.65F451F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] NULL Pointer Dereference / Kernel Panic in probe error path.

Pre-existing issues:
- [High] Use-After-Free during driver removal due to shared IRQ line.
--

--- Patch [2]: [PATCH 2/2] EDAC: fsl_ddr: manage mci lifetime via devres to=
 fix remove UAF ---
commit 15d5e252fe89541dc42e690006d7c3334debe7af
Author: Rosen Penev <rosenp@gmail.com>

EDAC: fsl_ddr: manage mci lifetime via devres to fix remove UAF

fsl_mc_err_probe() requests the shared interrupt with devm_request_irq(),
passing mci as the handler context. At removal fsl_mc_err_remove() calls
edac_mc_free(mci) explicitly, but the devm-requested IRQ is only torn
down by devres afterwards. Between edac_mc_free() and the IRQ release,
another device sharing the line can fire and fsl_mc_isr() will
dereference the freed mci and its pdata.

Register an edac_mc_free() callback via devm_add_action_or_reset() right
after edac_mc_alloc(), so mci is owned by devres and freed only after the
devm IRQ is released (devres runs actions in LIFO order).

> diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
> index 7fb789e97074b..5eec7fe17adda 100644
> --- a/drivers/edac/fsl_ddr_edac.c
> +++ b/drivers/edac/fsl_ddr_edac.c

[ ... ]

> @@ -653,8 +660,6 @@ int fsl_mc_err_probe(struct platform_device *op)
>  	ddr_out32(pdata, FSL_MC_ERR_DISABLE,
>  		  pdata->orig_ddr_err_disable);

[Severity: High]
Could this error path trigger a kernel panic if initialization fails early?

If early initialization fails (like of_address_to_resource,
devm_request_mem_region, or devm_ioremap), the code jumps to the err label
while pdata->mc_vbase is still NULL.

ddr_out32() then calls ddr_reg_addr():

drivers/edac/fsl_ddr_edac.c:ddr_reg_addr() {
    ...
    return pdata->mc_vbase + off;
}

This will attempt to write to an unmapped low address. This regression was
introduced by the immediately preceding patch in this series (EDAC: fsl_ddr:
restore MC error registers on probe failure) and appears to remain unfixed
here.

>  	ddr_out32(pdata, FSL_MC_ERR_SBE, pdata->orig_ddr_err_sbe);
> -	devres_release_group(&op->dev, fsl_mc_err_probe);
> -	edac_mc_free(mci);
>  	return res;
>  }
> =20
> @@ -675,5 +680,4 @@ void fsl_mc_err_remove(struct platform_device *op)
> =20
> =20
>  	edac_mc_del_mc(&op->dev);
> -	edac_mc_free(mci);
>  }

[Severity: High]
This is a pre-existing issue, but does mpc85xx_edac.c have the identical
shared IRQ use-after-free during driver removal?

This patch fixes the issue in fsl_ddr_edac.c, but looking at
mpc85xx_l2_err_probe() and mpc85xx_pci_err_probe(), they also request a
shared IRQ handler via devm_request_irq() with IRQF_SHARED.

During remove(), the EDAC device structures are freed explicitly:

drivers/edac/mpc85xx_edac.c:mpc85xx_l2_err_remove() {
    ...
    edac_device_free_ctl_info(edac_dev);
}

drivers/edac/mpc85xx_edac.c:mpc85xx_pci_err_remove() {
    ...
    edac_pci_free_ctl_info(pci);
}

However, the devres-managed IRQ is not released until after remove() return=
s.
If an interrupt fires on the shared line in this window, the ISR executes
and dereferences the already freed EDAC structure.

Could a similar devres-managed lifetime fix be applied to these sister
drivers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719194009.1175=
32-1-rosenp@gmail.com?part=3D2
