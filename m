Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1E437CD41
	for <imx@lists.linux.dev>; Wed, 13 May 2026 01:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778636005; cv=none; b=DIHfRN+1l64BuQUt5eFqaWz/gyZNhxrqhwc6BdEX8iYo1b6+OCg/dKT8QLydhcZ2a1+Jaon+ZqCN4Hp/lvthnEuOFAkjbjJ6d03d+k6/faT87fjR3rbHVd9VR8GvWifhGn2gA3wcbF7PmMQmnaeDoCHhAhJzNUIX31biS+qHZ7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778636005; c=relaxed/simple;
	bh=IIXoJjM39wo7MUTKx4ZWbAdDJ61KCv/Kgkf1otyMGYQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tsF0wadkgl55UbCGjhexQiwQdgESPxnfqFmWZsf8E7z/KD8zRmMMqGB+q1O9xHkTFE6FKgsMsU+AINayWun2FSoVf4GjO2vCNUowfxP+2cbwH166XX7jGlftn04t6NJ3xZcf5gxw9h86G4W2iDOIqaPLNxYvSQZnep/9J4WSeRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+yK8rou; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+yK8rou"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F59CC2BCB0;
	Wed, 13 May 2026 01:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778636004;
	bh=IIXoJjM39wo7MUTKx4ZWbAdDJ61KCv/Kgkf1otyMGYQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=L+yK8rouj4SEYkHdd9dcol3T0GNTylNT7HWW/NsjMHWFA2UurC1ZZMnKF/1bxOBoR
	 ZTPnyN82JsZ04aBYvAwaUlk9/L2n9huj7mzQTEvpo0jLjlyoypRRZ61AADv7cM71y+
	 a8WWuAwdwMO8JSam7wpWSWB1krq0omHkZoXYr2pQW0iuxvGw9VNi94l3hgsWareaA3
	 nBbthZiEiWIoV22fs/zrMAwVFeVJoiRiT6bSyw/mMazE7p9fvTE4ZDa2TxSl0oAG7J
	 tYa5C1A3MoytLXw4HphDotzJAZclbln+hNiM/fCqVbKGAfMx9q0D0zwAISd3KOPiI2
	 soOJ6dTa6IY0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] remoteproc: switch exact-match drivers to
 wc-ioremap callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Levinsky" <ben.levinsky@amd.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, wsa+renesas@sang-engineering.com
In-Reply-To: <20260511211841.284809-3-ben.levinsky@amd.com>
References: <20260511211841.284809-3-ben.levinsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 01:33:23 +0000
Message-Id: <20260513013324.4F59CC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Implicit and undocumented behavioral change in memory access sem=
antics, and introduced inconsistency.
--

commit 33b97865cf4d72ce26fd26e8b0209b38daaf1222
Author: Ben Levinsky <ben.levinsky@amd.com>

remoteproc: switch exact-match drivers to wc-ioremap callbacks

Replace the exact-match carveout map and unmap callbacks in the
existing remoteproc drivers with the common wc-ioremap helpers. Leave
the zynqmp R5 TCM callbacks alone because they also clear the mapped
memory and are not exact matches.

> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_=
dsp_rproc.c
> index 008741af9f11c..2d9f14fbef1da 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
[ ... ]
> @@ -700,8 +674,10 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp=
_rproc *priv)
> =20
>  		/* Register memory region */
>  		mem =3D rproc_mem_entry_init(dev, NULL, (dma_addr_t)att->sa,
> -					   att->size, da, imx_dsp_rproc_mem_alloc,
> -					   imx_dsp_rproc_mem_release, "dsp_mem");
> +					   att->size, da,
> +					   rproc_mem_entry_ioremap_wc,
> +					   rproc_mem_entry_iounmap,
> +					   "dsp_mem");

Does replacing the custom callbacks with rproc_mem_entry_ioremap_wc()
unintentionally alter the memory access semantics for these drivers?

The new rproc_mem_entry_ioremap_wc() helper explicitly sets
mem->is_iomem =3D true. The previous custom callbacks like
imx_dsp_rproc_mem_alloc() called ioremap_wc() but left mem->is_iomem as
false.

Setting is_iomem =3D true causes the ELF loader and coredump routines to
switch from standard memcpy() and memset() to I/O accessors like
memcpy_toio() and memset_io().

While this is likely safer for I/O mapped memory, this behavioral change
does not appear to be documented in the commit message. Should the commit
message document this shift in memory access semantics?

> Leave the zynqmp R5 TCM callbacks alone because they also clear the mapped
> memory and are not exact matches.

By leaving the ZynqMP R5 TCM callbacks untouched, does this create an
inconsistency in how the remoteproc framework handles I/O mapped memory?

The ZynqMP R5 TCM callbacks will continue to map memory using ioremap_wc()
without setting is_iomem =3D true. Would it be better to update the ZynqMP
callbacks to also set is_iomem so the framework accesses I/O memory
consistently across all drivers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511211841.2848=
09-1-ben.levinsky@amd.com?part=3D2
