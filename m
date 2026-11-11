Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794438956;
	b=VaUQNnN54plNrLZClyPUCCMxVAilEU5kxnVgv3OUPzoC2OGZC4j9FNDdQwQjXgfRczdQ
	 LrClCvVhlzQvF2wAkQ4URc1QgoRVdP5BiB5SNZPi/fkRLU3phlSnbhVHblqAqvxhH9LBV
	 BD+HnDi9DCcB71hIB+cN8Ghwj0U96mBdEof2FmqLShg4bmzjzppuwaTbp3RAVAFJ/uDYs
	 V7lOwGXhCRi04h98c7aa6ZjPH3R0FjpLpAUOXO+iEGZelDuoV/UvysvKr9kvTJr7LyPQQ
	 Zw5xpSX64kiloir/9XAubIwH8DGhJgnrwPEKJyj0ABorC9DIRfMYSk+L+HoiiaygzZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794438956;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=SwCLDaTF/SZHcXaLHvk//w6qsnUfE/A450nw0/y6Vmg=;
	b=qtvHVePTj6wp+UOovF+z2cGehQXsOWLm6I4h87KMMEbvpJKZuWzBU17X9H+jdbnqwRnB
	 DbbyawhZki7pntq7fRZYg2d2SuLTws0BGl3OOs4q2sGxWrQBvXJov+eQdlJBaYTf79sCa
	 EHoFcuJ5N1Ow6BJmjh3bGYKy9HaJ79ZoKjA8qQSTL7kdZQoGJiznVPxoYdy+Vg+jSHMjl
	 XaBjnIqAb/G67XJBUq8Hj2qzlF85BGTMJoaYDd+sVkAtA0PGkQRrbqOVhi9mezGSODRVY
	 zhY4tjDNcLg/tM/II4zpgLPjUkeQnumYPO8WzvIIjtRBWBOybllhdr3qj/zIs4xuOMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=YRreNREZ;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA322606A332
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 23:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA322606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=YRreNREZ
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EEB122B;
	Thu, 12 Nov 2026 00:13:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794438809;
	bh=aGlUHD0gujoJhXfnK8skBxle8rV39ixzq+kLCVy3sgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YRreNREZ6iYcL1wj2CZzh0OVHAnqJaAJj760Zo3rcUn8hMU5mKP1gznFZMtYw+lPQ
	 qPBRdAeFJV4k+qIGrrcidLhGuvPyHInhjCWAwj7OdPri/Q+ZXzr6Tm+VX+ld17dJkM
	 7wH1odF1AHoeA9X08f473Z3B5S2dro1xeg/JM2YM=
Date: Thu, 12 Nov 2026 01:15:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	"open list:XILINX VIDEO IP CORES" <linux-media@vger.kernel.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
	vkoul@kernel.org, Frank Li <Frank.Li@nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 1/1] media: xilinx: Use dmaengine_get_copy_align()
 accessor
Message-ID: <20261111231551.GB449775@killaraus.ideasonboard.com>
References: <20261111171325.3424645-1-Frank.Li@oss.nxp.com>
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
In-Reply-To: <20261111171325.3424645-1-Frank.Li@oss.nxp.com>

On Wed, Nov 11, 2026 at 12:13:24PM -0500, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace direct access to dma->dma->device->copy_align with the
> dmaengine_get_copy_align() accessor function.
> 
> Prepare move struct dma_device to private.

I didn't see a rationale in the commit that introduced
dmaengine_get_copy_align(), and I then saw it here. Without knowing much
about the greater plan of making dma_device private, this patch looks
OK.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Tomi, will you handle this with any other ongoing work on
media/platform/xilinx/, or should it get merged separately ?

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/xilinx/xilinx-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
> index ece2116639fc0..e01bb40bc39c7 100644
> --- a/drivers/media/platform/xilinx/xilinx-dma.c
> +++ b/drivers/media/platform/xilinx/xilinx-dma.c
> @@ -710,7 +710,7 @@ int xvip_dma_init(struct xvip_composite_device *xdev, struct xvip_dma *dma,
>  		goto error;
>  	}
>  
> -	dma->align = 1 << dma->dma->device->copy_align;
> +	dma->align = 1 << dmaengine_get_copy_align(dma->dma);
>  
>  	ret = video_register_device(&dma->video, VFL_TYPE_VIDEO, -1);
>  	if (ret < 0) {

-- 
Regards,

Laurent Pinchart
