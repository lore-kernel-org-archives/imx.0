Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1093D140360
	for <imx@lists.linux.dev>; Wed, 25 Sep 2024 19:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727292967; cv=none; b=lx7bub3qRi7JescLPug2lAq5OrSdbFHO9wjDF+pMdv2TpjJBIvGXS7pDQxRLSa7/GtY7Jtzky+ajDvB05CdRomWJLswj8slI6uIydZvIBTX+xyKl6kj15ZrCjI1mPTGFQSs4bn+rbE0Ob27k6bSC9ITHDHUeyAIY9hNQNRICTZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727292967; c=relaxed/simple;
	bh=g65BxwBJyJxd6ZpqTbeNfzfkPJAGkZKQsFaE6FtwJ9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qT0zjB5Z3Ruma5InkDWoniQAWGfn8LJ32S67E6FHw0JU0mvEwk52E/6tAQUElBxNELIrs0HIyl9xRloNxkPE6+ZC9RguD/zACOKld6rRli6W3itkRE8P+/k6loYZzmsyOG9UqtVMWvY9cFVmvIYW9Ja0J7WNbntSQ1TevREahOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Gq9BKWir; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Gq9BKWir"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B43417E2;
	Wed, 25 Sep 2024 21:34:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727292876;
	bh=g65BxwBJyJxd6ZpqTbeNfzfkPJAGkZKQsFaE6FtwJ9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gq9BKWirY8TRrjLKkYv8KHEmWP8ieKH/nOQcEkHEvGZ3w/1yjLlfXdFbv/MNjbrgX
	 G/Neou3jqlKJ1PYnNNWzPhYQfE0eirAzZJMpIzUiPPcnK20kjOhgQCXOKV8geCyZhp
	 EWGCgoMeQX0uEIDoG4qM+W0KJTCJFBQcRIEBpRNA=
Date: Wed, 25 Sep 2024 22:36:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: nxp: imx8-isi: fix v4l2-compliance test errors
Message-ID: <20240925193602.GG30399@pendragon.ideasonboard.com>
References: <20240924103304.124085-1-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240924103304.124085-1-laurentiu.palcu@oss.nxp.com>

Hi Laurentiu,

Thank you for the patch.

On Tue, Sep 24, 2024 at 01:33:04PM +0300, Laurentiu Palcu wrote:
> Running the v4l2-compliance (1.27.0-5208, SHA: af114250d48d) on the m2m
> device fails on the MMAP streaming tests, with the following messages:
> 
> fail: v4l2-test-buffers.cpp(240): g_field() == V4L2_FIELD_ANY
> fail: v4l2-test-buffers.cpp(1508): buf.qbuf(node)
> 
> Apparently, the driver does not properly set the field member of
> vb2_v4l2_buffer struct, returning the default V4L2_FIELD_ANY value which
> is against the guidelines.
> 
> Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
> v2:
>  * set the 'field' in mxc_isi_video_buffer_prepare() as suggested by
>    Laurent;
>  * change the commit subject to make it more generic as the fix does
>    not address only the M2M device compliance errors but also the
>    video capture ones;
> 
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index ddd42a8f17884..60c55d6839431 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -898,6 +898,7 @@ int mxc_isi_video_buffer_prepare(struct mxc_isi_dev *isi, struct vb2_buffer *vb2
>  				 const struct v4l2_pix_format_mplane *pix)
>  {
>  	unsigned int i;
> +	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb2);

I'll swap those two lines when applying, we usually sort lines (roughly)
by decreasing length.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	for (i = 0; i < info->mem_planes; i++) {
>  		unsigned long size = pix->plane_fmt[i].sizeimage;
> @@ -911,6 +912,8 @@ int mxc_isi_video_buffer_prepare(struct mxc_isi_dev *isi, struct vb2_buffer *vb2
>  		vb2_set_plane_payload(vb2, i, size);
>  	}
>  
> +	v4l2_buf->field = pix->field;
> +
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart
