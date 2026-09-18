Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6108550B404
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 15:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789746494; cv=none; b=uKijgKhc74VBk6xPOyLCiZCDHPpCJMFR9rfMODBKEdEmTWPx/a32ofdbgb4o520I616px+UogUz0Pit0wpgn86NMXsruKXbhcSLjE8YzY3uiQf89FmPfkWvoDcoUDoKH1+zDz2pdZB2SIG2jatNqe0C5w96SJvu4E+b5JLHoO2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789746494; c=relaxed/simple;
	bh=Jk7UIenqndZsnauLbZWAcWqUs+CZ5N7UY9oT1SDo7Ww=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xkh8WDzHbXkvfXr+ht+uwUZqqg1F3XKVyF8AtljW/UjrMzYUJX1ZZDtLZAhhpH3vnsK+ZrYTBVzioXMHD4V5xvwyORYEILcWdL82kFLcBvN1B8ol77ZlRcn7TFYim2CqgWRp5iHhjiL7hOHwT7tfM9ZMh9sxzRJJQtrsiS1fPJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XsLxb4Pr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XsLxb4Pr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05EE1F000FF;
	Fri, 18 Sep 2026 15:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789746493;
	bh=EjZhqzJyQhMArQYgh9iNLy7YBgaRjJ7zTswjN7I8TEY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XsLxb4PrwqnYsA95adorC9nH0eHagfZY70RbUw61e8GfMfwJtGe6absHoqe7NaJ5H
	 fm4WFk9QJa/7dy7RIU9r2fjKPBugQeDiGbbOMtxoFwsc9PNTij13MxizouhmLw4lU/
	 IWGJplkieuUfkwBhGvxnXKYxTny83QAvTULLkF/UiNEgohSFK5ZHZDYDIjuHRYCFCh
	 2vCmpyDaNiOYMJ6kBAxNJbEClbM1S1JopgpG7/bxPrDE3NTHSExjxfrXO0jfJC2EmL
	 kLQEeqagjSN6cbYsjE0+7zrh0ZqYQ6XBDa7VrkqmhiZD4K747GIsVh2le1DwVpyRzf
	 WwWQwmHSEPC3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] mmc: use dmaengine_get_dma_device() instead of
 chan->device->dev
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260918152349.2101305-1-Frank.Li@oss.nxp.com>
References: <20260918152349.2101305-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 15:48:12 +0000
Message-Id: <20260918154812.C05EE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] mmc: mxcmmc: NULL pointer dereference in mxcmci_setup_data fallbac=
k to PIO
- [Medium] mmc: missed device->dev conversions in omap.c and mxs-mmc.c
--

commit fac187edba18928bfcb50c068ba67dea2103d2aa
Author: Frank Li <Frank.Li@nxp.com>
Subject: mmc: use dmaengine_get_dma_device() instead of chan->device->dev

This patch replaces direct dma_chan::device::dev access with the=20
dmaengine_get_dma_device() macro across the MMC subsystem. This change=20
prepares the subsystem for making the DMA engine provider data structures=20
private.

> mmc: use dmaengine_get_dma_device() instead of chan->device->dev
>
> Replace direct dma_chan::device::dev access with the proper
> dmaengine_get_dma_device() for consumer API
>
> chan->device->dev is not always the device used for DMA mapping.
> Some DMA engines support per-channel IOMMU mappings, so different
> channels may use different DMA devices.  dmaengine_get_dma_device()
> returns the correct device for each channel.
>
> This also prepares for making the DMA engine provider data structures
> private. DMA consumers should not access DMA engine internals directly.
>
> Assisted-by: LLM
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> ---
> Change in v2
> - find more place, which use device->dev for dma mapping. This time should
> clean all.

[Severity: Medium]
Does this patch catch all instances across the MMC subsystem?

The commit message mentions this should clean all occurrences, but there
appear to be remaining direct chan->device->dev accesses in
drivers/mmc/host/omap.c (e.g., c->device->dev in mmc_omap_prepare_data())
and drivers/mmc/host/mxs-mmc.c (ssp->dmach->device->dev in mxs_mmc_probe()).
These will likely cause compilation failures when the DMA engine fields are
actually made private.

[ ... ]
> diff --git a/drivers/mmc/host/mxcmmc.c b/drivers/mmc/host/mxcmmc.c
> index 097498a3f8ff4..c20cff770395e 100644
> --- a/drivers/mmc/host/mxcmmc.c
> +++ b/drivers/mmc/host/mxcmmc.c
> @@ -290,6 +290,7 @@ static int mxcmci_setup_data(struct mxcmci_host *host=
, struct mmc_data *data)
>  	unsigned int datasize =3D nob * blksz;
>  	struct scatterlist *sg;
>  	enum dma_transfer_direction slave_dirn;
> +	struct device *dma_dev =3D dmaengine_get_dma_device(host->dma);

[Severity: High]
Will this cause a NULL pointer dereference if the driver falls back to=20
PIO mode?

In mxcmci_probe(), if dma_request_chan() fails, host->dma is set to NULL to
fallback to PIO mode. However, in mxcmci_setup_data(), we now unconditional=
ly
initialize dma_dev by calling dmaengine_get_dma_device(host->dma) before the
!mxcmci_use_dma(host) check happens. This macro dereferences the channel
pointer to access chan->chan_dev->chan_dma_dev, which will crash upon the=20
first PIO data transfer if host->dma is NULL.

>  	int i, nents;
> =20
>  	host->data =3D data;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918152349.2101=
305-1-Frank.Li@oss.nxp.com?part=3D1
