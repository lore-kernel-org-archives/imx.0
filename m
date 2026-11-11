Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430278;
	b=J6RTIHkNVA0VFfykvFvwjhMAkNcTCO8UKrxNbivoEiMAfZx8edJLq35fxo6DvqY3rOTK
	 3tYGS1AC6ZyHe5Q0znpkHKfCD/eevhxpB/ULVZYCBeVG7C3tNedpedvrm1JcEKcliF8V5
	 ePgF2mZiD5IaJPk6CiobPZuLfXqGZYuMkYCgCFNxzJeQhEK8XASt8WmOZFEVwammhVslE
	 T6ZzlPcCEfgxUM5ABANfaHwBghJr+qB0dtmzGalfVnwpQpWC8eZ3sD3+zFJoA7PT+ygNf
	 lmqVmrrFb+yIGuRmwufBjPi0CxVl+o0/m5AoGDxl4bg59sUxro+w9gYwLoRNoOQKOZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430278;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WOiuDiF2XEYlTdQA27sRYfJM0Crm9B+gOIZsE4HZATc=;
	b=WlTIlmOzbe9nd+HYU6V1O88y1Jt32zYMPC8XDNuKx50ZOHTtIr+YpSQYUVVS2VZ8JThl
	 fY8QLX9SK90cNt+GYZuGufifenVC2Zm0oj6NvhV7Ksg+SQ3cdlDetFiwRukUciT4wl+na
	 4MNwLJdVZ29uv6KARGg8wcKzxB+FHmuPQSvXg2gXSwaO+ndbejYtJmgl7sRzfXUk43J1I
	 BudZyu/IQJhM3CkowBSBrInRS9dYpNv53QmAXblFXnw51gPoiw814BW1Juy/spYCUqiV/
	 wXxKNR2ihPaRZivPpVKyqyK24Ju74l0y3ACJvw+HnZGw/yRYyDfn+n4vGHURYOo3zJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CrfDc+Hy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2270606A31C
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 20:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CrfDc+Hy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F181F00A05;
	Wed, 11 Nov 2026 20:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794430278;
	bh=WOiuDiF2XEYlTdQA27sRYfJM0Crm9B+gOIZsE4HZATc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CrfDc+Hy+9PQ3UXYy2/DTgGxdwZDhnT289vcSjto+DnwAzJaXUHgMkg0WlwIC0/iN
	 rPxmfnSFjIRMk0/URrPPXWwHgOJRqlOezVYmEvHfVghNTXHoFh7l4pMvdAj5akn1mZ
	 /VjclswGdk1PJVtefiHkXEGNHU9K/D5wLnj9ciZMy5gNF+VMUt/9+0MowM+6+qYDKr
	 svgtFMOwe4n6FT6X/UHo+JheV8lpBP6qjUUvV7fZLow2bRMVkd21o3RlbV2wobwQMH
	 IIPmAHWxgVz4YW8SrWd99XfAHJ2QVb0KRWlls7/Ns8P4eufSoHz+I3Ghqpk6LYHjbl
	 0cyxukZMjRZ+g==
Message-ID: <sashiko-outbox-209681@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] mtd: nand: raw: use dmaengine accessor API
 functions
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Frank
 Li" <Frank.Li@nxp.com>, "Alok Tiwari" <alok.a.tiwari@oracle.com>, "Runyu
 Xiao" <runyu.xiao@seu.edu.cn>, "Chen Ni" <nichen@iscas.ac.cn>, "Kees Cook" <kees+treewide@kernel.org>, "Hemanth
 Selam" <hemanth.selam@gmail.com>, =?utf-8?b?b3BlbiBsaXN0OkNBREVOQ0UgTkFO?=
 =?utf-8?b?RCBEUklWRVI=?= <linux-mtd@lists.infradead.org>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261111202502.3860647-1-Frank.Li@oss.nxp.com>
References: <20261111202502.3860647-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 20:51:17 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] mtd: rawnand: cadence: unmap device mismatch in
  cadence_nand_remove()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] mtd: rawnand: fsmc: missing reinit_completion() in
  dma_xfer() [1]
--

commit 9eda52238f6d5af7214b32eeb0870d65126ccf3d
Author: Frank Li <Frank.Li@nxp.com>

mtd: nand: raw: use dmaengine accessor API functions

This commit replaces direct chan->device and device_prep_dma_memcpy()
accesses in the Cadence and FSMC raw NAND drivers with
dmaengine_get_dma_device() and dmaengine_prep_dma_memcpy().

> diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd=
/nand/raw/cadence-nand-controller.c
> index 2085632631c02..5e3d34f24f9d9 100644
> --- a/drivers/mtd/nand/raw/cadence-nand-controller.c
> +++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
[ ... ]
> @@ -3170,12 +3170,12 @@ static int cadence_nand_init(struct cdns_nand_ctr=
l *cdns_ctrl)
>  		}
>  	}
> =20
> -	dma_dev =3D cdns_ctrl->dmac->device;
> -	cdns_ctrl->io.iova_dma =3D dma_map_resource(dma_dev->dev, cdns_ctrl->io=
.dma,
> +	dma_dev =3D dmaengine_get_dma_device(cdns_ctrl->dmac);
> +	cdns_ctrl->io.iova_dma =3D dma_map_resource(dma_dev, cdns_ctrl->io.dma,
>  						  cdns_ctrl->io.size,
>  						  DMA_BIDIRECTIONAL, 0);
> =20
> -	ret =3D dma_mapping_error(dma_dev->dev, cdns_ctrl->io.iova_dma);
> +	ret =3D dma_mapping_error(dma_dev, cdns_ctrl->io.iova_dma);
>  	if (ret) {
>  		dev_err(cdns_ctrl->dev, "Failed to map I/O resource to DMA\n");
>  		goto dma_release_chnl;
> @@ -3204,7 +3204,7 @@ static int cadence_nand_init(struct cdns_nand_ctrl =
*cdns_ctrl)
>  	return 0;
> =20
>  unmap_dma_resource:
> -	dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
> +	dma_unmap_resource(dma_dev, cdns_ctrl->io.iova_dma,
>  			   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
> =20
>  dma_release_chnl:

[Severity: Medium]
Should cadence_nand_remove() also use dmaengine_get_dma_device() when
unmapping cdns_ctrl->io.iova_dma?

drivers/mtd/nand/raw/cadence-nand-controller.c:cadence_nand_remove() {
	...
	if (cdns_ctrl->dmac)
		dma_unmap_resource(cdns_ctrl->dmac->device->dev,
				   cdns_ctrl->io.iova_dma, cdns_ctrl->io.size,
				   DMA_BIDIRECTIONAL, 0);
	...
}

When chan->dev->chan_dma_dev is set, dmaengine_get_dma_device() returns
&chan->dev->device rather than chan->device->dev, so cadence_nand_remove()
unmaps the resource against a different struct device than
cadence_nand_init() used to map it, leaking the mapping on driver removal.
It also leaves a direct dereference of struct dma_device.

> diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc=
_nand.c
> index b13b2b0c3f300..831293a5bd814 100644
> --- a/drivers/mtd/nand/raw/fsmc_nand.c
> +++ b/drivers/mtd/nand/raw/fsmc_nand.c
> @@ -486,7 +486,7 @@ static int dma_xfer(struct fsmc_nand_data *host, void=
 *buffer, int len,
>  		    enum dma_data_direction direction)
>  {
>  	struct dma_chan *chan;
> -	struct dma_device *dma_dev;
> +	struct device *dma_dev;
>  	struct dma_async_tx_descriptor *tx;
>  	dma_addr_t dma_dst, dma_src, dma_addr;
>  	dma_cookie_t cookie;
> @@ -501,9 +501,9 @@ static int dma_xfer(struct fsmc_nand_data *host, void=
 *buffer, int len,
>  	else
>  		return -EINVAL;
> =20
> -	dma_dev =3D chan->device;
> -	dma_addr =3D dma_map_single(dma_dev->dev, buffer, len, direction);
> -	if (dma_mapping_error(dma_dev->dev, dma_addr))
> +	dma_dev =3D dmaengine_get_dma_device(chan);
> +	dma_addr =3D dma_map_single(dma_dev, buffer, len, direction);
> +	if (dma_mapping_error(dma_dev, dma_addr))
>  		return -EINVAL;
> =20
>  	if (direction =3D=3D DMA_TO_DEVICE) {
> @@ -514,8 +514,7 @@ static int dma_xfer(struct fsmc_nand_data *host, void=
 *buffer, int len,
>  		dma_dst =3D dma_addr;
>  	}
> =20
> -	tx =3D dma_dev->device_prep_dma_memcpy(chan, dma_dst, dma_src,
> -			len, flags);
> +	tx =3D dmaengine_prep_dma_memcpy(chan, dma_dst, dma_src, len, flags);
>  	if (!tx) {
>  		dev_err(host->dev, "device_prep_dma_memcpy error\n");
>  		ret =3D -EIO;
> @@ -547,7 +546,7 @@ static int dma_xfer(struct fsmc_nand_data *host, void=
 *buffer, int len,
>  	ret =3D 0;
> =20
>  unmap_dma:
> -	dma_unmap_single(dma_dev->dev, dma_addr, len, direction);
> +	dma_unmap_single(dma_dev, dma_addr, len, direction);
> =20
>  	return ret;
>  }

[Severity: Critical]
This problem wasn't introduced by this patch, but can dma_xfer() unmap
dma_addr while the DMA transfer is still in flight [1]?

If an earlier transfer times out and its callback fires late,
host->dma_access_complete is left signaled.  Because dma_xfer() does not
call reinit_completion(&host->dma_access_complete) before submitting a new
transfer, wait_for_completion_timeout() consumes the stale completion and
returns immediately, so dma_unmap_single() runs while hardware DMA is
still active on buffer.

[1] https://sashiko.dev/#/bug/linux-836e69de-023a-4bd2-8b41-03e05feb8137

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111202502.3860=
647-1-Frank.Li@oss.nxp.com?part=3D1
