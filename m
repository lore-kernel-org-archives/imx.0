Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794447475;
	b=Djfr6w1F3l4qYh1rCzNvumY/HZFowYpiC51JS3TnzuVYKQf50kdQFQ+Dy0iLlvPVlYff
	 G8ufW3jjz8gcFe9dj4icNIVCc+naVcOpzY+/OZ4GTGPwPaS+JkGOs0mARisewAneymbqB
	 Su4gI140paRTue/uLqc7BcUJWoKClLfhEvFX8hop8ymBK4sRdZkMwJE58D5S127P1MoPv
	 xAqqojBXy2avDNvq9is0y2T6AYGBHwmV8my8vOqRu8bVRxaG9FhqJCHodOO19rRrM23en
	 UVvLN27SDseE5GYroGHWzBOx/W7pLPbjpmaUoV9vXwKH99UrYaCLV0WXmQ8RBPlfjIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794447475;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=8vBZUF5hn+hX56ST3pucRyV0dagx5wgip9bLjW8uoRY=;
	b=sIkV5glppv/YKCcnY9txx74SMUsHyWKpxVdWGuQVA6Kk3dbC+Gz1ipesvaqMhE0iP2oe
	 dL0eCyNi4kR3Sl/62IMcvEIn4OLJRVFGP3xy6vl167C9o83lrdk3RJajkCM+r7Nk0R+xt
	 cdmMSNJTBgJ0ZsAllUqt6OnxQ6U6pdEpGo0FDCNeAy8qvQuCif+Cxf1FST15a5K9ZFBfG
	 RcSnbrpXB4QMi+fahFKI+dx2RtdtrNTavSo9g/t5vY1t1/zLBwAC8wvvT+RAwJ+swaigx
	 PrbBz1YbjMDY7ap8NSMSVfESJ+kvSe4dRR54m8guvNhIF7oAipgtWS7RGuOet7IAhBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=shGXhYfO;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14E1606A324
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 01:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B14E1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=shGXhYfO
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BAD7F33D;
	Thu, 12 Nov 2026 02:35:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794447322;
	bh=JRkDYlrl3ziGUdvobqOMclP0M0whEvcZbmSFJ8MdrLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=shGXhYfO3xMKtpLDBPTgAFQAp/5BFgsCm5liYTAT/MIGmDy2UgX59upIIhiQRQyuy
	 k0xJ6TVQlixcI8HyCsT/wRjeGkyAdm0TqBV17DkuuQJoaTQvSAaEa0Bh828+L9VmhI
	 hbsw5ke+4QDvfdmFJC4sRY3liVntzS25cM7PQ0sM=
Date: Thu, 12 Nov 2026 03:37:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 02/11] media: imx8-isi: Extend output format mask to 7
 bits
Message-ID: <20261112013744.GA449716@killaraus.ideasonboard.com>
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
 <20260929-isi_imx952-v4-2-e69f89c7c651@oss.nxp.com>
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
In-Reply-To: <20260929-isi_imx952-v4-2-e69f89c7c651@oss.nxp.com>

Hi Zhou,

On Tue, Sep 29, 2026 at 04:52:23PM +0800, Guoniu Zhou wrote:
> The ISI output format field width differs across SoC generations:
> i.MX8 series (MN/MP/QM/QXP) use a 6-bit field (bits 29:24), while
> from i.MX8ULP onwards (including i.MX91/93/95/952) the field is
> extended to 7 bits (bits 30:24) to support RAW32 and RAW14 formats.
> 
> Extend CHNL_IMG_CTRL_FORMAT_MASK to 7 bits unconditionally since
> bit 30 is unused on older platforms.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v3:
> - Use unconditional 7-bit mask instead of per-platform approach (Laurent)
> - Drop Reviewed-by from Frank Li due to significant change
> 
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index e795f4daf3ff..c704be882705 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -39,7 +39,7 @@
>  /* Channel Image Control Register */
>  #define CHNL_IMG_CTRL						0x0004
>  #define CHNL_IMG_CTRL_FORMAT(n)					((n) << 24)
> -#define CHNL_IMG_CTRL_FORMAT_MASK				GENMASK(29, 24)
> +#define CHNL_IMG_CTRL_FORMAT_MASK				GENMASK(30, 24)

I've double-checked that bit 30 is reserved on all SoC versions that use
a 6-bit format.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  #define CHNL_IMG_CTRL_FORMAT_RGBA8888				0x00
>  #define CHNL_IMG_CTRL_FORMAT_ABGR8888				0x01
>  #define CHNL_IMG_CTRL_FORMAT_ARGB8888				0x02

-- 
Regards,

Laurent Pinchart
