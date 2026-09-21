Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990604AB3A3
	for <imx@lists.linux.dev>; Mon, 21 Sep 2026 14:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002483; cv=none; b=guNEYHbFlFbbYI7o+f+sAH5O+jqtgjmZAXkYG95ATqq7813Clkei/N4HhNmhuTO/Zv0VshwCBMwXdbY64NfSY7gddLJTLxG9fmFIbWUajzmCV+lYXF/HXea/AjFCkQ7PO5Bk0Z2pytLs8h7DZldgKv3f8Uyc9hrMHI3dzOTokB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002483; c=relaxed/simple;
	bh=P0GjWhz6PO/wFsfp1izMYnE1j/H+ydX0NmYzz0wsGwc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OLhz2fHjEQ6k59PX81zZoSzjMWYy4EFxfMmDeMYl1x3s7Z4OrsJ3ltEcGrN09C51lMHRG13rUJI+/ag2EUYk6Pjbnd2cG59aFSiSwbvwag0/qvy4enaMSp+8c+vrvqwlEe3o+GiNF4UpVp+8RcsCsK9619kCWEA0GdHXtgic7A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3QF1SZ1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3QF1SZ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47831F000FF;
	Mon, 21 Sep 2026 14:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790002482;
	bh=mE1Kp4TP5P+bJJQ7jlGTgZZuUs0OipOpQadhq4xebjo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q3QF1SZ1w9etcj2ZyrOoqRo4BqNoppLtdpkUYIAfIcQu5RqndCCXuY0WBi8X/4cRu
	 cTS+XocDrHM8/s2gFSKSF7Tf6zupMe9fZTzw7QayvhMVVhKneAN8Rnh3sUwwIXIwiI
	 6UBbNXgOXzFcATiz8zQC5m/GjeQ9fuA0s9U3bH9rimDSB2ICRQZQEN5pxpmFLF5ZLj
	 GEdunyzm1kRJ5Q+CG9CfdFocpCYAhDvNLpuFBkNFTyFsAk0dpNmn2EGHEyj8Gg3Vh3
	 a+PGOjTV7LH031dWmPEupm3G2w1aexzb7HKnFQ7/c6ewUPSDxVDNMm8B655dUrFT5h
	 CMqiYv/SxvjkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/1] mmc: use dmaengine_get_dma_device() instead of
 chan->device->dev
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: wsa+renesas@sang-engineering.com, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260921144426.1083196-1-Frank.Li@oss.nxp.com>
References: <20260921144426.1083196-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 14:54:41 +0000
Message-Id: <20260921145441.E47831F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] mmc: mxs-mmc: mismatched DMA device on dmaengine_prep_slave_sg() e=
rror path
- [High] mmc: mxcmmc: NULL pointer dereference in mxcmci_setup_data() on PI=
O fallback
--

commit 76329da80aaedf4e7a72d175c67b41a9f5e8706a
Author: Frank Li <Frank.Li@nxp.com>

mmc: use dmaengine_get_dma_device() instead of chan->device->dev

This patch replaces direct dma_chan::device::dev access with the proper
dmaengine_get_dma_device() for the consumer API. It ensures the correct
device is used for DMA mapping, preparing for making the DMA engine
provider data structures private.

> diff --git a/drivers/mmc/host/mxcmmc.c b/drivers/mmc/host/mxcmmc.c
> --- a/drivers/mmc/host/mxcmmc.c
> +++ b/drivers/mmc/host/mxcmmc.c
> @@ -290,6 +290,7 @@ static int mxcmci_setup_data(struct mxcmci_host *host=
, struct mmc_data *data)
>  	unsigned int datasize =3D nob * blksz;
>  	struct scatterlist *sg;
>  	enum dma_transfer_direction slave_dirn;
> +	struct device *dma_dev =3D dmaengine_get_dma_device(host->dma);

[Severity: High]
Does this code dereference a NULL pointer when host->dma is NULL?

If the driver falls back to PIO mode during probe because requesting the DMA
channel failed, host->dma is set to NULL. This variable initialization appe=
ars
to evaluate dmaengine_get_dma_device(host->dma) before the check for PIO mo=
de
(!mxcmci_use_dma(host)) can execute, which could cause a panic.

>  	int i, nents;
> =20
>  	host->data =3D data;

[ ... ]

> diff --git a/drivers/mmc/host/mxs-mmc.c b/drivers/mmc/host/mxs-mmc.c
> --- a/drivers/mmc/host/mxs-mmc.c
> +++ b/drivers/mmc/host/mxs-mmc.c
> @@ -221,7 +221,7 @@ static struct dma_async_tx_descriptor *mxs_mmc_prep_d=
ma(
> =20
>  	if (data) {
>  		/* data */
> -		dma_map_sg(mmc_dev(host->mmc), data->sg,
> +		dma_map_sg(dmaengine_get_dma_device(ssp->dmach), data->sg,
>  			   data->sg_len, ssp->dma_dir);
>  		sgl =3D data->sg;
>  		sg_len =3D data->sg_len;

[Severity: High]
Will this lead to a mismatched DMA device during the error path in
mxs_mmc_prep_dma()?

The error path in mxs_mmc_prep_dma() still uses the old mmc_dev(host->mmc)
call to unmap the scatterlist:

    if (desc) {
        ...
    } else {
        if (data)
            dma_unmap_sg(mmc_dev(host->mmc), data->sg,
                         data->sg_len, ssp->dma_dir);
    }

Can this leak the IOMMU mapping on the correct device and erroneously unmap
mappings on the wrong device if dmaengine_prep_slave_sg() fails?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921144426.1083=
196-1-Frank.Li@oss.nxp.com?part=3D1
