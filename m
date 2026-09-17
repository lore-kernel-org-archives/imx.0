Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7929A4078D5
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 20:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678543; cv=none; b=EwtcY7+7u0e8rG7TihI5DVaoqAPskaZFyoMVBfD/qpj2yls7aSRRh8cVxhT4Z8uxe2eckS9KsJTkLMZSfMvOz0HdT0x+gIaFfg3FHRAVDpGRxO/Mq21b74hytvJ6PXfcyfHDpvnBDXWR+kCceR66wD8Mc27Q8s9IFbPIOMkW3nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678543; c=relaxed/simple;
	bh=tS4/sYfzN2PHkuvCmM47471eR+SALa//0YzRi03F2lo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EF0cHEnfuf8WJQrPP1qYwHL4bQeiOjERiaES2L9QkTrNVDKe8dWHmOCNPS7DPBedbD6rQFBkF5KPHq73m7Q+b9Rn7PPjKPneX7F8kClu7vzooylKzg4F3tWhtJ0yS/0L5UDCGuQq3NwjW9mQKigx/6MGZMzmzn5nv41FSpWhs9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFxLsuBs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFxLsuBs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19BB1F000FF;
	Thu, 17 Sep 2026 20:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789678542;
	bh=nWuLu9wjlSk4CbWcBhZdErwCHhQjjaXTGW80xH4pNYU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mFxLsuBsAD7WTOTTIyYvM5yYEtZGMWtuCnsb59YOxeeLb5uLLjiTXOeEvgN9gC9Ln
	 mi0G8yeCTDxGrPwrAu4oNRc+kTnxoEloxF5AhD3Z5KHn3wy0HAEgYROwia8e4vJexh
	 y/nDuw3opH1W6Kvydy6h2C/uMrRFoFkp/QxB8umXxE7YiBXXsFP/KErxm4OZCvzQP3
	 CO+Ckwpz0pn9p6rFSr52d4YWeU2Cs+2S0WbI4cU0oS+oO4vLIAc+7ifipOXmxsi4Ik
	 VyDu7vLCyUqbrynJ0YdiO3OBDG4mbcmFfdctbwOF++ynUqzQZR9zeEDF933+YL/Nox
	 hNXG75X1/n6WQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] mmc: use dmaengine_get_dma_device() instead of
 chan->device->dev
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: wsa+renesas@sang-engineering.com, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260917204240.1284796-1-Frank.Li@oss.nxp.com>
References: <20260917204240.1284796-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 20:55:41 +0000
Message-Id: <20260917205541.C19BB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mmc: mmci: DMA API violation due to map/unmap device mismatch
--

commit d094ad885249a508b0979254780f5dd030ce3bf9
Author: Frank Li <Frank.Li@nxp.com>

mmc: use dmaengine_get_dma_device() instead of chan->device->dev

This commit replaces direct access to the chan->device->dev field
with dmaengine_get_dma_device(chan) to retrieve the correct DMA device,=20
especially for engines with per-channel IOMMU mappings. This also prepares
for making the DMA engine provider data structures private.

> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 416bdb184ed4c..5d81c96ca4f37 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
[ ... ]
> @@ -940,7 +940,7 @@ static void mmci_dma_unmap(struct mmci_host *host, st=
ruct mmc_data *data)
>  	else
>  		chan =3D dmae->tx_channel;
> =20
> -	dma_unmap_sg(chan->device->dev, data->sg, data->sg_len,
> +	dma_unmap_sg(dmaengine_get_dma_device(chan), data->sg, data->sg_len,
>  		     mmc_get_dma_dir(data));
>  }

[Severity: High]
Does this introduce a device mismatch with the mapping paths in the same fi=
le?

The map path in _mmci_dmae_prep_data() still maps the scatterlist using the
underlying DMA controller device:

drivers/mmc/host/mmci.c:_mmci_dmae_prep_data() {
    ...
	nr_sg =3D dma_map_sg(device->dev, data->sg, data->sg_len,
			   mmc_get_dma_dir(data));
    ...
 unmap_exit:
	dma_unmap_sg(device->dev, data->sg, data->sg_len,
		     mmc_get_dma_dir(data));
}

Since dmaengine_get_dma_device(chan) can return a different device structure
than chan->device->dev, does passing mismatched device structures to
dma_map_sg() and dma_unmap_sg() violate the DMA API contract?

[Severity: Medium]
This is a pre-existing issue, but I noticed there are other files in the
MMC subsystem that still directly access chan->device->dev which appear to
have been missed by this patch's search strategy.

For example, in drivers/mmc/host/mxcmmc.c:mxcmci_setup_data():

	nents =3D dma_map_sg(host->dma->device->dev, data->sg,
				     data->sg_len,  host->dma_dir);

And in drivers/mmc/host/omap.c:mmc_omap_dma_cb():

		dev =3D c->device->dev;

Will leaving these in place cause build breakages when the DMA engine provi=
der
structures are finally made private?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917204240.1284=
796-1-Frank.Li@oss.nxp.com?part=3D1
