Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F393D16F4;
	Tue, 12 May 2026 05:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778564835; cv=none; b=RXnFEo1r3tlcCVA3GQE8KkjS/XQCUP4yGqaqmWGTnZKli2b8hZOX9tMRr/jim1j0oXeVFy0V5pS2H2OkGkJBntXR8LVPAnraJkkppPceZOsdjDwR04Vb0FXdWQ2RicAjr8fyyo2vE9NIbDYhObfEuTca3tgq2pWh3Detaay3JyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778564835; c=relaxed/simple;
	bh=LcwtjoJoEAyc9y80XNnj+U5uifz5TSpASZOqNzguJTg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uf2S9uj4Mm4NPnyvCbjoHxSXrrZmZRQqogZ/blpp2SnDRCo+KD0wpxjZKqw7kb0RoU/CWZzALNzJxtSxHXQCPNW+3LnNQ8OFMObl440Ofs1moMLQKpvaz+qgY1k0lS2IsZFC9WNq/ESSHxDgYkH3tvPKg0M5sdM+5ZvcUonFBkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Of3o4UCb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Of3o4UCb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037E8C2BCB0;
	Tue, 12 May 2026 05:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778564834;
	bh=LcwtjoJoEAyc9y80XNnj+U5uifz5TSpASZOqNzguJTg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Of3o4UCb0/ChoessLMaxVmpsNjaQ93QNvllNioufJFu+SgwCDY8g+q/HSd4WzNzRM
	 eQQXkphnV+QdtfXuFqqNyRAtuHVuAXuL2oy1d7X7Crklrbcm0H//ze7xMszTrHNU2d
	 DNj2OdfNAHOXsKxnh/9OseWyfsRYZYScnaL6dzkmxlFfLLOEkkDTHrqrk4L6OG+X6l
	 JST6oXoNjjgHbngX5g4CApSWojRkY8Xw1NdJbhMBZRUI2hKPFGhiUshOp8My/kTow0
	 PVivqMQaDF5NATIaa8RwPlALbp1oSdLR7BIh+qWcu3tSv2jeu6fR4IMVCFGcoN26wa
	 Jb3a/kwgyBIKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/8] media: platform: neoisp: Add debugfs support
Reply-To: sashiko@lists.linux.dev
To: "Antoine Bouyer" <antoine.bouyer@nxp.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260511132629.1300868-8-antoine.bouyer@nxp.com>
References: <20260511132629.1300868-8-antoine.bouyer@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 05:47:13 +0000
Message-Id: <20260512054714.037E8C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] The probe error path skips cleanup of previously allocated dev=
ices and debugfs files, leading to memory leaks and Use-After-Free.
- [High] Direct pointer dereference of `__iomem` mapped memory causes undef=
ined behavior and potential faults.
- [Medium] PM runtime usage counter leak when `enable_debugfs` is true.
--

commit 8ed96f76ce4a3c28d7472942ee6dafd2b5be2f9a
Author: Antoine Bouyer <antoine.bouyer@nxp.com>

media: platform: neoisp: Add debugfs support

Add debugfs entries to dump ISP registers and internal memory regions used
to store Vignetting and DRC coefficients. Debug mode is conditionally
activated to avoid runtime suspend which blocks register access.

> diff --git a/drivers/media/platform/nxp/neoisp/neoisp_debugfs.c b/drivers=
/media/platform/nxp/neoisp/neoisp_debugfs.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/platform/nxp/neoisp/neoisp_debugfs.c

[ ... ]

> +static inline int neoisp_dump_memory(struct seq_file *m, enum isp_block_=
map_e map, int wsize)
> +{
> +	struct neoisp_dev_s *neoispd =3D m->private;
> +	union udata_t data;
> +	u32 addr;
> +	u32 *src =3D (u32 *)(uintptr_t)neoispd->mmio_tcm;
> +	u32 offset =3D ISP_GET_OFF(map) / sizeof(u32);
> +	u32 size =3D ISP_GET_SZ(map) / sizeof(u32);
> +	int i, j;
> +
> +	for (i =3D 0; i < size; i++) {
> +		addr =3D (offset + i) * sizeof(u32);
> +		data.word =3D src[offset + i];

Is it safe to directly dereference __iomem pointers here? It looks like
mmio_tcm is mapped I/O memory, so bypassing I/O accessors like readl() or
ioread32() might cause alignment faults or undefined behavior on ARM64.

[ ... ]

> diff --git a/drivers/media/platform/nxp/neoisp/neoisp_main.c b/drivers/me=
dia/platform/nxp/neoisp/neoisp_main.c
> --- a/drivers/media/platform/nxp/neoisp/neoisp_main.c
> +++ b/drivers/media/platform/nxp/neoisp/neoisp_main.c

[ ... ]

> @@ -1758,9 +1763,18 @@ static int neoisp_probe(struct platform_device *pd=
ev)
>  	neoisp_init_hw(neoispd);
>  	neoisp_set_default_context(neoispd);
> =20
> +	if (enable_debugfs) {
> +		neoisp_debugfs_init(neoispd);
> +		/* Increase pm_runtime counter to prevent suspend */
> +		ret =3D pm_runtime_resume_and_get(dev);
> +		if (ret)
> +			goto err_pm_runtime_suspend;
> +	}
> =20
>  	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);

If this pm_runtime_resume_and_get() fails and we take the goto
err_pm_runtime_suspend path, does this leak the devices initialized by
neoisp_init_devices() earlier in the probe function?

Since neoispd is allocated via devm_kzalloc(), it will be freed when probe
fails. If the V4L2 devices and debugfs files aren't cleaned up here, could
userspace accessing the leaked files trigger a use-after-free on the freed
neoispd pointer?

[ ... ]

> @@ -1777,6 +1791,9 @@ static void neoisp_remove(struct platform_device *p=
dev)
>  {
>  	struct neoisp_dev_s *neoispd =3D platform_get_drvdata(pdev);
> =20
> +	if (neoispd->regset)
> +		neoisp_debugfs_exit(neoispd);
> +
>  	neoisp_destroy_devices(neoispd);
> =20
>  	if (standalone_mdev)

Since we incremented the PM runtime usage counter with
pm_runtime_resume_and_get() in probe when enable_debugfs is true, do we
need to drop that extra reference here in the remove path?

It seems like failing to do so could leak the usage counter and keep the
device permanently awake after driver removal.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511132629.1300=
868-1-antoine.bouyer@nxp.com?part=3D7
