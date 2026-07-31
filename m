Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD35753E0B
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 01:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785461537; cv=none; b=CBlLl0qBNgLlGUcZgOrREAycDJsWXNAbP+gH21W4JsxskXlpLcfezQmg/zbgNxXaQjMyqqr2ftT2m9j0a5u1BCbXRXI/FhjatMKpl/jUF3xBFGTQJ4L1lxwXbHUxM4fMOYJkcWRlLp1EM4z0zytzeKoSovGX4A9PMlcZRV8OFxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785461537; c=relaxed/simple;
	bh=qFJ5FwXDmw4sDqWBJ6xXxn8YsyhcHmfMAlbGFVpiMwU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tqNSgN+nYXVp7/zzLIfBS+HNz4QANCY2yCrZulNXmwOe1v+buKXv1Lz9TDTcArkCCqxz1sh8sRuhNhopJdenoFI/U/9BYKQ8vg36TOKQ8CaKQRClCUKyrEjzB/ZD501lBGD6CAM+LvVZ0cznuE071DVmVktBz2Is+D2081Dm9+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOiDihQw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOiDihQw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5CA1F000E9;
	Fri, 31 Jul 2026 01:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785461536;
	bh=vX1Hv+GRhZgTA7XF4k6YSRQBBnl5buEFD767sgHEb5o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XOiDihQwzyPJNWVTLlZimCdbrAl2j3oet/zNoVeZ+xyfsH46hLG1lc86+JKrW9Mln
	 dz1yWMRouiUfyEN6cQoJvQjxUR1ofFIOZfD+M7WJOOJyROnyWaA/vfdHHXDp48HIyg
	 9wU9VjfdKEoAKfl6gKfgufSp2zNyblKJIDcXGUzfz2WW08ENxQ9ocuY6uvch4TZNJP
	 3gi5vKOdf+TczaXNL6aPNqmm1nCcernr/8trJri/j4uzA1rTvlTML70yOd3L6+Kqmb
	 AVXOqQDuGH4Rxz5/hKhJZ6Te3CWR37nYP1sZ2D6xEY5Cs4n0ymR7jkwOMIKik6lOAL
	 dtKAqYIgn1pOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2 1/3] EDAC/fsl_ddr: use
 devm_platform_ioremap_resource()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260731012130.1212640-2-rosenp@gmail.com>
References: <20260731012130.1212640-1-rosenp@gmail.com>
 <20260731012130.1212640-2-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 01:32:15 +0000
Message-Id: <20260731013215.DE5CA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Possible use-after-free in the interrupt handler during module rem=
oval / driver unbind.
- [High] Hardware interrupts are enabled before the IRQ handler is successf=
ully registered, risking an unhandled interrupt storm if the IRQ request fa=
ils.
--

--- Patch [1]: [PATCHv2 1/3] EDAC/fsl_ddr: use devm_platform_ioremap_resour=
ce() ---
commit 6f9b8e9cc4f802944da43deab8c11651f32e407d
Author: Rosen Penev <rosenp@gmail.com>

EDAC/fsl_ddr: use devm_platform_ioremap_resource()

This commit replaces the open-coded of_address_to_resource() and
devm_ioremap() sequences with devm_platform_ioremap_resource(). It
also removes the explicit devres group management as devm is already
used.

> diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
> index e4eaec0aa81d5..4236e06d568e9 100644
> --- a/drivers/edac/fsl_ddr_edac.c
> +++ b/drivers/edac/fsl_ddr_edac.c
[ ... ]
> @@ -638,7 +615,6 @@ int fsl_mc_err_probe(struct platform_device *op)
>  		       pdata->irq);
>  	}
> =20
> -	devres_remove_group(&op->dev, fsl_mc_err_probe);
>  	edac_dbg(3, "success\n");
>  	pr_info(EDAC_MOD_STR " MC err registered\n");
> =20
> @@ -647,7 +623,6 @@ int fsl_mc_err_probe(struct platform_device *op)
>  err2:
>  	edac_mc_del_mc(&op->dev);
>  err:
> -	devres_release_group(&op->dev, fsl_mc_err_probe);
>  	edac_mc_free(mci);

[Severity: High]
This isn't a bug introduced by this patch, but since we are relying on
devm APIs here, is there a risk of a use-after-free during driver unbind?

During module removal, fsl_mc_err_remove() manually frees the mci structure
via edac_mc_free(mci). However, the shared interrupt handler fsl_mc_isr()
is managed by devm_request_irq() and remains active until the driver core
cleans up devm resources strictly after remove() returns.

If another device sharing the same IRQ line triggers an interrupt in this
window, the kernel will execute fsl_mc_isr(), which unconditionally
dereferences the freed mci pointer:

fsl_mc_isr(..., void *dev_id)
{
        struct mem_ctl_info *mci =3D dev_id;
        struct fsl_mc_pdata *pdata =3D mci->pvt_info;
        ...
}

Should the IRQ be explicitly freed in remove(), or registered with a non-de=
vm
API to ensure the handler is unregistered before mci is freed?

[Severity: High]
This is also a pre-existing issue, but does this error path leave the hardw=
are
interrupt enabled if devm_request_irq() fails?

Earlier in fsl_mc_err_probe(), the hardware interrupt is explicitly enabled:

        ddr_out32(pdata, FSL_MC_ERR_INT_EN, DDR_EIE_MBEE | DDR_EIE_SBEE);

If devm_request_irq() fails (for example, due to -EPROBE_DEFER or resource
constraints), the failure path jumps here to err2, which does not disable
the hardware interrupt. If a memory error occurs and the controller asserts
the IRQ line, the lack of a registered handler might cause an unhandled
interrupt storm.

Should the error path disable the interrupt before returning?

>  	return res;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731012130.1212=
640-2-rosenp@gmail.com?part=3D1
