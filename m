Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439007;
	b=N63qGP5ZsKCfbdKWfZQiXFBaozWjsB1dAxkbNSAOxBrc1j/z2Kz7raQhnTbAeeedNujv
	 zW8zcDTMHuLdTiy84srN1uQBl8V1/KHotdY926yOQbRhwSmhX2czFZ2kJy12v9mlIW+Mk
	 l2Bmo+Lei0IB0uecmCV2A4ZXzxk91vUyrC/mrxeOgyL7p8yk6JemtXR9dMaEGKfe5DMas
	 YqtAuwArL3eTFOsXsOBnwe0jSSUgAePYIL6CRJW3ryfHG7B8jR3An1G/smQ6dOOVsu3B7
	 lwhdp8x5DPiPztr0LZS8u1yZDFQY6BfDg3IrytbSuebcLoTZJiusBCj/1AYjWMloh4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439007;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=gVIeqTEhmx2fXY3RkoSwuO1fdXlfwtDek+Btr2BpwUw=;
	b=jWyRcUFQVmfapPZSYd3szlmb1diWh3g1LAPvbkik7vPeEjBuJbMoyuIIWEWNBiddvpBq
	 23JaOXu+dvuYAq/3GNLva3/RgKorsUL0WslWszzYz+eZSTpH3DHItfVJIICqQJHMer6jb
	 v/msKuPEII3gZKKUsJOU2BBrIKzA2J5+Cx72cKXkz82a9ShFY8gjlON7hzM37WaS8jj++
	 JhCzd/n/YPsp0u35a5imHgkDJKsVkFq0jutrZW8myBDDB8Q+CUhKSowMlwoqSvi3IowYO
	 PYGUCuMvtOrro1YpkvL3GTJ9DPNKb3PHN2CIzClk8J8QrtXG556r0/JflNzQvIxenZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Ydtw7KnN;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6DC606A324
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 23:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A6DC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Ydtw7KnN
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44DF422B;
	Thu, 12 Nov 2026 00:14:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794438862;
	bh=z0dg7bwU2AAoMLZ79Myh4uGTQaMh+gcfY67SeB0Tlv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ydtw7KnN0JpDWFAoRtrJahH5aWkusxuCN0PY/k/3ePCt0lPSp7vPcpbdfpNo022R2
	 fv9gBmDZ83xYbRPNXsDlKt7B01xDdhFW+TnYG9z7BN8PHLWQJucSwDJCn/d1mmqMeE
	 k13Wvp9epVQNLdNwT9hMEzVDcBkto18wJciq3i3A=
Date: Thu, 12 Nov 2026 01:16:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@oss.nxp.com
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	"open list:DRM DRIVERS FOR XILINX" <dri-devel@lists.freedesktop.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] drm: xlnx: zynqmp_disp: use
 dmaengine_get_copy_align() accessor
Message-ID: <20261111231644.GC449775@killaraus.ideasonboard.com>
References: <20261111200739.3823753-1-Frank.Li@oss.nxp.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111200739.3823753-1-Frank.Li@oss.nxp.com>

On Wed, Nov 11, 2026 at 03:07:37PM -0500, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Use the dmaengine_get_copy_align() helper instead of directly accessing
> the copy_align field from the DMA device structure.
> 
> No functional change and prepare to move struct dma_device to private.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Tomi, I assume you'll push this to drm-misc. Please let me know if
that's not correct.

> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index e998f22686748..0753236b9546a 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -1433,7 +1433,7 @@ int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub)
>  		struct zynqmp_disp_layer *layer;
>  
>  		layer = &disp->layers[ZYNQMP_DPSUB_LAYER_VID];
> -		dpsub->dma_align = 1 << layer->dmas[0].chan->device->copy_align;
> +		dpsub->dma_align = 1 << dmaengine_get_copy_align(layer->dmas[0].chan);
>  	}
>  
>  	dpsub->disp = disp;

-- 
Regards,

Laurent Pinchart
