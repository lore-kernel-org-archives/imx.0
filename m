Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794448036;
	b=5JT8AbCJ2Ydjn6inh67c5qf1Q4PkFVc0M2zWteT9bzPBjM4BDX4sMaVG6sH6jbWuQjEN
	 0GOWjF2Frd7lLN5Wepm3EEXxMYX4lQGL/IC7ncI/eWUotoHHKV+lP+41YKXF0GLMYI+50
	 TKShtezL6Zkc1MzR0b6qPvMTCIszfSqwEkSHXt5hw5sZ3TVWzZWu4rHMT5fvM4px6vcAe
	 d2DEVpEvOeOC/PlXQfYe+V3wcUl4pPhc8P1zXgrIrcAeIf6kZhlgDc//n8Uvi82aB1rtQ
	 RobApHTVdZCD8sIEq3oZhnLyODA3PDWZlaOvjGQUdLTT2vVKME+MaBEzEZ5963YjkfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448036;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=YAasUpXd4Y3J+GE5AGq6+24CrznL6SHkG3wCr7INF78=;
	b=H6kFrPWWDRF62JUUnftFWvab/K+2KRQ6YD8XnspnRI8dM4lE/wTusvW8wFMAKKJnai1+
	 jlf6EB/LhcG7EankPMCFKCEeo7uLhXTZHzXfOEbVQMoCsCTnrUvZ5lEU2GFC+1aX4zERb
	 rSNQcEnIX+FJJHOmYE5gFwEQYxOiJxVs5IqfGWdnmntvsK5DeVYVUL+PLFkNG1pQYFP5T
	 8rwByDhQ1bIeKjLIR6/bfqL0geZ44tZoc94PcSYukj9pOdUxkc7cldo8kBIJIzLXxL3Qi
	 9dnch7nIlyoZPMnqlbVKQtXAM5i6c/KvH+V4vWQAQObDPksysZd43oc5+RyEa6UaoTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=CdWCAg0W;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9249606A321
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 01:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9249606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=CdWCAg0W
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6B9933D;
	Thu, 12 Nov 2026 02:44:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794447890;
	bh=HgZ7Ha70ZLzMn9/whtW0EoB1N1MqFubj3YjWeQb1A5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CdWCAg0WZiat7Gqs9PDQcTyzmYC4cigUOOnpPb36ovcS8JSdI4VDUDC29gJrYuciu
	 CX0icnP8UIIySF+tMqS8N8cHmbmto7ZEE38BZVWEX2v9PZ7+pwsBq7TYL9V2Ne9WAE
	 XFavYU/5vAZAyKD64tYVLCN6m+qAmnUlTvohrTN8=
Date: Thu, 12 Nov 2026 03:47:12 +0200
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
Subject: Re: [PATCH v4 04/11] media: imx8-isi: Reuse mxc_isi_format_enum() in
 capture format enumeration
Message-ID: <20261112014712.GC449716@killaraus.ideasonboard.com>
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
 <20260929-isi_imx952-v4-4-e69f89c7c651@oss.nxp.com>
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
In-Reply-To: <20260929-isi_imx952-v4-4-e69f89c7c651@oss.nxp.com>

On Tue, Sep 29, 2026 at 04:52:25PM +0800, Guoniu Zhou wrote:
> Simplify mxc_isi_video_enum_fmt() by reusing mxc_isi_format_enum()
> instead of open-coding the same format table traversal.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

This will cause a small performance regression when enumerating formats
without mbus_code being set, but it's not a hot path.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

You'll need to either update the commit message of 03/11 (or possibly
squash it with this patch).

> ---
> Changes in v4:
> - New patch
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 30 +++-------------------
>  1 file changed, 3 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 0d87a1082727..21849af3121b 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -1231,34 +1231,10 @@ static int mxc_isi_video_enum_fmt(struct file *file, void *priv,
>  				  struct v4l2_fmtdesc *f)
>  {
>  	const struct mxc_isi_format_info *fmt;
> -	unsigned int index = f->index;
> -	unsigned int i;
> -
> -	if (f->mbus_code) {
> -		/*
> -		 * If a media bus code is specified, only enumerate formats
> -		 * compatible with it.
> -		 */
> -		for (i = 0; i < ARRAY_SIZE(mxc_isi_formats); i++) {
> -			fmt = &mxc_isi_formats[i];
> -			if (fmt->mbus_code != f->mbus_code)
> -				continue;
> -
> -			if (index == 0)
> -				break;
> -
> -			index--;
> -		}
>  
> -		if (i == ARRAY_SIZE(mxc_isi_formats))
> -			return -EINVAL;
> -	} else {
> -		/* Otherwise, enumerate all formatS. */
> -		if (f->index >= ARRAY_SIZE(mxc_isi_formats))
> -			return -EINVAL;
> -
> -		fmt = &mxc_isi_formats[f->index];
> -	}
> +	fmt = mxc_isi_format_enum(f, MXC_ISI_VIDEO_CAP);
> +	if (!fmt)
> +		return -EINVAL;
>  
>  	f->pixelformat = fmt->fourcc;
>  	f->flags |= V4L2_FMT_FLAG_CSC_COLORSPACE | V4L2_FMT_FLAG_CSC_YCBCR_ENC

-- 
Regards,

Laurent Pinchart
