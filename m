Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EDB3DB306
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 23:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073459; cv=none; b=qTBxn2wwxYgVUg3WWPx0kEtPQLeGJDEo5D/La5AJFkLS59kXed2Y8adA9Rd8o4nc2cJ++LYFbkxklQDR8FuAyQGzdAljU1aZGatjnNb8E8dyuq/2rXiGNO4MO4EBif/v00DmRclHlwAyH4GYKUItQ60ZPAym3oJEmXyokwzbejA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073459; c=relaxed/simple;
	bh=Tu0m16gQPgzxYpXooxlQMpBsaNIfz8wBZwNDb+G2wvI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gjV/JREWSrmz7uoCyDFlSrQPVcf+CrXCT/W81tYsY+ChfjcZB1vNsXAq6ZyNpByxl99g9ir1wVHMUYwK6zSiLXgQydL3RN5H0StUp2ITx8kmMahKxNBZCPqIDUZWEHajA/wY3oEn+sHSFWKD77JbUr6gUKlHVvu1O77s58Zj2sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCfx6E/w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCfx6E/w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94D81F000E9;
	Tue, 14 Jul 2026 23:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784073458;
	bh=WYyFrXjgeoo9Grrd5SUV77nVcTs3VCbNfzO8K84+k0o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FCfx6E/w/UyoLxR50D48VFU7V9dQhEz4AmNYRzMHzv3zfPujeI3dOUndMyZzsY+xv
	 ZnVtJLWutc8DaH+uVbfpZoV/meHTIA+hMu59P7NwsCnCZtwoa7XQzeLnhmLwG/P2W8
	 SZNkaRNVy2yZxYBIaeBWYs/ciClrZBFOhB1EsGUTiYCNHcfv7tSS3ec9uudr24SVhA
	 hObW2r4ufsQBVdyDkD/a+99wBVhRwhi7eDiTxtB219zd+K84wd8FD0lr0Zxd3WJVUj
	 TyU7ioBhOLCZkz/ZpCW2mLK9JibX/mYl0qioCLdh7WeWDtbD4YWp/gC42ohTmQF/BV
	 rGC9ziUemC35g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] EDAC: fsl_ddr: use devm_platform_ioremap_resource()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260714234609.902367-1-rosenp@gmail.com>
References: <20260714234609.902367-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 23:57:37 +0000
Message-Id: <20260714235737.D94D81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware registers altered during initialization are not restored =
on probe error paths.
- [High] Use-after-free of `mci` and `pdata` in the shared interrupt handle=
r during device removal.
--

--- Patch [1]: [PATCH] EDAC: fsl_ddr: use devm_platform_ioremap_resource() =
---
commit 95d86798c0c6ff810ee7e3129ccd0c259af42fed
Author: Rosen Penev <rosenp@gmail.com>

EDAC: fsl_ddr: use devm_platform_ioremap_resource()
   =20
Replace the open-coded of_address_to_resource() plus devm_request_mem_regio=
n()
and devm_ioremap() sequence with devm_platform_ioremap_resource(), which fo=
lds
the resource lookup, region reservation and mapping into one step and retur=
ns
an ERR_PTR checked with IS_ERR()/PTR_ERR().

> diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
> index e4eaec0aa81d5..f19ccef942c02 100644
> --- a/drivers/edac/fsl_ddr_edac.c
> +++ b/drivers/edac/fsl_ddr_edac.c

[ ... ]

> @@ -532,28 +535,7 @@ int fsl_mc_err_probe(struct platform_device *op)
>  	 * Default is big endian.
>  	 */
>  	pdata->little_endian =3D of_property_read_bool(op->dev.of_node, "little=
-endian");
> -
> -	res =3D of_address_to_resource(op->dev.of_node, 0, &r);
> -	if (res) {
> -		pr_err("%s: Unable to get resource for MC err regs\n",
> -		       __func__);
> -		goto err;

[Severity: High]
This is a pre-existing issue, but since we are modifying error paths in
fsl_mc_err_probe(), does the error handling here fail to restore hardware
registers?

Later in the probe function, hardware state is saved and error interrupts
are enabled by clearing FSL_MC_ERR_DISABLE and setting FSL_MC_ERR_INT_EN.

If a subsequent initialization step fails and jumps to the err or err2
labels:

err2:
	edac_mc_del_mc(&op->dev);
err:
	devres_release_group(&op->dev, fsl_mc_err_probe);
	edac_mc_free(mci);
	return res;

These paths clean up driver memory but do not restore the modified hardware
registers. Since the memory controller is left configured to generate
interrupts but no handler is successfully registered, could a subsequent
memory error trigger an unhandled interrupt storm on the shared IRQ line?

> -	}
> -
> -	if (!devm_request_mem_region(&op->dev, r.start, resource_size(&r),
> -				     pdata->name)) {
> -		pr_err("%s: Error while requesting mem region\n",
> -		       __func__);
> -		res =3D -EBUSY;
> -		goto err;
> -	}
> -
> -	pdata->mc_vbase =3D devm_ioremap(&op->dev, r.start, resource_size(&r));
> -	if (!pdata->mc_vbase) {
> -		pr_err("%s: Unable to setup MC err regs\n", __func__);
> -		res =3D -ENOMEM;
> -		goto err;
> -	}
> +	pdata->mc_vbase =3D mc_vbase;
> =20
>  	if (pdata->flag =3D=3D TYPE_IMX9) {
>  		pdata->inject_vbase =3D devm_platform_ioremap_resource_byname(op, "inj=
ect");

[Severity: High]
This isn't a bug introduced by this patch, but could there be a
use-after-free race condition during device removal?

In fsl_mc_err_probe(), the interrupt is registered as shared using the
managed API devm_request_irq(), passing mci as the context data.

During device removal:

drivers/edac/fsl_ddr_edac.c:fsl_mc_err_remove() {
    ...
    edac_mc_del_mc(&op->dev);
    edac_mc_free(mci);
}

Since devres_release_all() runs after fsl_mc_err_remove() completes, the
shared IRQ remains active while mci is explicitly freed here.

If another device sharing the IRQ line triggers an interrupt during this
window, fsl_mc_isr() will dereference the freed mci and pdata pointers.
Should the IRQ be freed explicitly before freeing mci, or should mci be
managed by devres as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714234609.9023=
67-1-rosenp@gmail.com?part=3D1
