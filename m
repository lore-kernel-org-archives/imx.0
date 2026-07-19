Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9B543F08A
	for <imx@lists.linux.dev>; Sun, 19 Jul 2026 19:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784490685; cv=none; b=Ops//Y/X/DvfSKFE3PHHjjr8G+1um+7WKzv1QayImlnaU7XMD+1WdLnFIjRH2CRsH523u9qqiDu//qe5dZhilsZ9gR5jmwUhhLxylRUVrXoorEul9h7DjRlzmVBciXWKPm/0zDPF2PwhjCNkuhN4fHH6LMZET+knZ0kfIyjBf2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784490685; c=relaxed/simple;
	bh=Uv8Le2D+L6cioJLiumRHjOSPOzOLUD6PDBBJ5jLOkp0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jfdJ+nwnYXwC64vGGBc8GEy5deFCr5cXtCo6ye3mlD5UWmmc81H4N29M57G8xdRHhfG2wZiUUeI9YgfVL00ob747I/tfDGSC/cIrSvlwGq2UTTTVKp4MviW0MW+/WiEPRkj31PdXh8+Ig8KBiwd43HIgQOmOAKU/pgCAy3/yW3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iL+bWtCs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iL+bWtCs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04681F000E9;
	Sun, 19 Jul 2026 19:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784490683;
	bh=hSNyEwQXPkO/bgShoeY3etrgx5mGlDHw7h9ROHKAbI0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iL+bWtCsPDUmgLyLyip1iXUB5+BmjYF2PTiKEzyS74SQeIbBilBxDMBGltBX7PVxz
	 Q4gabOCrgfLIocbwVHW0vMcQi0f02/cQDp/+YLEmROnxSuk8UBsvdSZPsJtJJvuwFs
	 f46hYDS1rpOPnBKQkcYpoFgOxOPfHlGOKtVUk+FgHGkWCtlxfDbMtgwk3upeeEdtpy
	 o24o9uA/p7GdcqK0h3y/5zhonS55Ska64OeTNdukW2fi9noqT6nPtYsLeQrm5/cL+8
	 AOEfrYBwkpBhdLXW+7Src35TN4a2iGAludN4aGV9M7U9tIPuRoTp45XUDehzfz39oJ
	 P42Ji3iFrDv3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] EDAC: fsl_ddr: restore MC error registers on probe
 failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260719194009.117532-2-rosenp@gmail.com>
References: <20260719194009.117532-1-rosenp@gmail.com>
 <20260719194009.117532-2-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 19:51:23 +0000
Message-Id: <20260719195123.C04681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Calling `ddr_out32()` in the `err` cleanup path unconditionally de=
references unmapped I/O memory pointers if probe fails early, leading to a =
kernel crash.
- [High] Pre-initializing `orig_ddr_err_disable` and `orig_ddr_err_sbe` to =
0 causes the error path to blindly overwrite hardware registers with 0 inst=
ead of their true original states on intermediate probe failures.

Pre-existing issues:
- [High] The EDAC MC object (`mci`) is freed before the shared interrupt ha=
ndler is unregistered during module removal, creating a use-after-free vuln=
erability.
--

--- Patch [1]: [PATCH 1/2] EDAC: fsl_ddr: restore MC error registers on pro=
be failure ---
commit 987a0eb5943a39fdf0201244bbdd7e9cdf6c562e
Author: Rosen Penev <rosenp@gmail.com>

EDAC: fsl_ddr: restore MC error registers on probe failure

fsl_mc_err_probe() clears FSL_MC_ERR_DISABLE and, in EDAC_OPSTATE_INT
mode, sets FSL_MC_ERR_INT_EN to enable error reporting. If a later
initialization step fails and jumps to the err/err2 labels, the cleanup
only frees driver memory and does not restore these hardware registers.

> diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
> index e4eaec0aa81d5..7fb789e97074b 100644
> --- a/drivers/edac/fsl_ddr_edac.c
> +++ b/drivers/edac/fsl_ddr_edac.c
> @@ -519,6 +519,8 @@ int fsl_mc_err_probe(struct platform_device *op)
> =20
>  	pdata =3D mci->pvt_info;
>  	pdata->name =3D "fsl_mc_err";
> +	pdata->orig_ddr_err_disable =3D 0;
> +	pdata->orig_ddr_err_sbe =3D 0;

[Severity: High]
Does pre-initializing these to 0 cause the error path to overwrite
hardware registers incorrectly?

If probe fails after I/O mapping but before the original hardware states are
read (for example, if the ECC verification check fails), the code jumps to =
the
err: block.=20

Because orig_ddr_err_disable and orig_ddr_err_sbe are pre-initialized to 0,
the driver will write 0 back to the hardware registers rather than restoring
the bootloader's true configuration, which clears all disable bits and
forcibly enables all memory controller errors.

>  	mci->pdev =3D &op->dev;
>  	pdata->edac_idx =3D edac_mc_idx++;
>  	dev_set_drvdata(mci->pdev, mci);

[ ... ]

> @@ -646,7 +648,11 @@ int fsl_mc_err_probe(struct platform_device *op)
> =20
>  err2:
>  	edac_mc_del_mc(&op->dev);
> +	ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
>  err:
> +	ddr_out32(pdata, FSL_MC_ERR_DISABLE,
> +		  pdata->orig_ddr_err_disable);
> +	ddr_out32(pdata, FSL_MC_ERR_SBE, pdata->orig_ddr_err_sbe);

[Severity: High]
Can this unconditionally dereference unmapped I/O memory pointers if the
probe fails early?

If early initialization steps such as of_address_to_resource(),
devm_request_mem_region(), or devm_ioremap() fail in fsl_mc_err_probe(), the
code jumps to the err: label. At this point, pdata->mc_vbase is still NULL.

The cleanup path added here unconditionally calls ddr_out32(), which execut=
es
ddr_reg_addr() to calculate the register address. This would result in an
invalid low memory address (NULL + off) being passed to iowrite32(),
triggering a fatal Data Abort.

>  	devres_release_group(&op->dev, fsl_mc_err_probe);
>  	edac_mc_free(mci);
>  	return res;


[Severity: High]
This is a pre-existing issue, but does fsl_mc_err_remove() have a
use-after-free vulnerability during module removal?

In fsl_mc_err_probe(), a shared interrupt is requested via devm_request_irq=
()
using mci as the dev_id. However, during module removal, edac_mc_free(mci) =
is
called synchronously before devres cleans up the shared IRQ:

drivers/edac/fsl_ddr_edac.c:fsl_mc_err_remove() {
    ...
	edac_mc_del_mc(&op->dev);
	edac_mc_free(mci);
}

Because the IRQ remains registered until devres cleanup runs after
fsl_mc_err_remove() returns, an interrupt on the shared IRQ line during this
window would cause fsl_mc_isr() to execute and dereference the freed mci
pointer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719194009.1175=
32-1-rosenp@gmail.com?part=3D1
