Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4AC26ED52
	for <imx@lists.linux.dev>; Mon, 15 Dec 2025 02:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765765192; cv=none; b=VB+AOcROP2Lp1rP9a2ccOBzE1u+jheYNXiqVEzaSQwb9aioX/Wnbnd9Rs0zn6Lo2cVDfkhnj9/Fv76KJ1hWbeBrwZASADWRoWWF2RdXN+4Hbh0+hCd+z3ZSWM679AqcJo/IToX5yvzJDUB1KshwKU7KoC5W/Shlz7+PsTx8x84A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765765192; c=relaxed/simple;
	bh=aW+yQYjoTCVBtGqvUIqWfBFdLzxBL6TthkJE1sLcV4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1ELZ4RLbY1/FCVwxyGpYeVvxumGKyYxhdzcfA56pbJw9tatiZzkcSQKX0YO5YAq0SBxY6fdnQDDcEPOcmxA6CRTjb6f9gAds/x4jQRr9NhE0gS+sneQlXPUuu9FxWn2t8ksDTmlpLOv9avQtN43Qcq+/4kqnIQKg/33p/w50Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IfV9N10K; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IfV9N10K"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29f2676bb21so28740865ad.0
        for <imx@lists.linux.dev>; Sun, 14 Dec 2025 18:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765765189; x=1766369989; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vyQpy40LuVc+jIOEZN17H+ajGzV6rjuUMt2NowJl5CE=;
        b=IfV9N10KUEk0EiG0PGkaWwP/osDHaE/tc2F4bvYIrTbUiE9lMTaiPtHP/B6zE/Znfa
         nygGG65zRLBGiUrP8R62UDqPo+tFiPF8pTgGL97HcFhfpxVAvgsPp2aYW3m3HvMkPZc2
         xs0ydMHTehjloGGV+aiApnYjKVjQi/w4Z18jSgFHm+X0y0DoZAZUG4JX9eNmQvGlr40E
         NvUYRiI80UyLY/wg0RgA1WIe48M+xwcVCuCGWL+1dnz6OEK4xuDX9F3quIG1OfOVZKYz
         Z/MwOL4EKibYfIMUtn3YFDiEiZ1etN7A1DT7bYTgNrf3T21/ZJLhgOB+REIFlrrxzgGI
         YJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765765189; x=1766369989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vyQpy40LuVc+jIOEZN17H+ajGzV6rjuUMt2NowJl5CE=;
        b=Sw1brlu13/oiz+cCfBQd8SJZ9fEDTQ66RAw9qaPiEjtUNlmC81v6OomXOhimEieOJE
         4/87e4igK3oc5JoQSquNe0nsJBZiLZEkvay5jiG6qwmz3d0GZ3XHgn7pRVUmKlsTtNCZ
         CyqZBrad2h4DAhl/HtWjlZL1BlO2+FlcmxpRhAt9uLaJhoMJLt9pj02U0VHYtb56I49f
         mgZyw/fUfB1J3powpPaeR+0qrAyE+zXaFKr9FqtA6UTazAuGaEx7MlCbqnsscCTOyYP0
         ikR+31KSCIrRcYKkciqfbd0rADVd9tVBxpiGXmV2nepMljSIYlfFsUfAn+5ekYBmYgDZ
         gp7g==
X-Forwarded-Encrypted: i=1; AJvYcCUsRbnrSOMe/j/pOM1qdpan3hHO5Epvuks645Zux+tKLPSBwVI+gO5WPLDFysZCTdoYGHk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3WyU97CSuJQH/3FHAkI8wBsAoJru7SMBQq+A8+xtvnnHuN/iQ
	P7zro1vjQOXNIeCPRJWQtN6Nj57AWjaVHcbkwGRbOVPDIq44hK87ZRGY4Cy7b61adL4=
X-Gm-Gg: AY/fxX49Zq0Xg+dz/z4yhVp0DNCptN7Zn9/Y/6C7B2jPqBTBy1V1tF5Onj4ZZLYF3pV
	cjB68/txVwscTmxkLeLvB88S+1a7zjtDPFhM7lI+t0URLruoVr2D8jK39vYR4GGKKLhItb2bAwW
	U+I25PrYheVsarYzGQoIf6MU3MxGFJhfMqOdi1y6osdGEhjk4mm4dw98G2ViyJo7BKP/iRCBE7N
	5TG7okOMcV043HUEJdyh8LSPV57Y93Aw3gbqZ5gfOZjQZEIpGLntKD6f+agLx1vkD65LUxU8+cg
	yLcD8IvNMXKbvlEh64EFaWeGGTE25jKvadwADzp8epjFklgbbNR2ekKZPLY8DFwtw27bahBpAoT
	N54bOROI0TH/7WyEBDoZoRB9zQlUEmDUuD1ukfqifp8hH7Q0uFe425lrKllxrVwY7Ei1LZmMHGC
	We/xjg+hA0lMXC0iBuPuoojeLw5F+/caTGKw4H6a6bDA==
X-Google-Smtp-Source: AGHT+IHIU/jYZqSE4lK3mrtbuZ7ZFUKFi0MmSupmKRFzoKfYEL8mWKvDxqp7/lHuRh29MqAgh78KvQ==
X-Received: by 2002:a17:902:f544:b0:2a0:d6d5:b342 with SMTP id d9443c01a7336-2a0d6d5b935mr26580395ad.37.1765765188823;
        Sun, 14 Dec 2025 18:19:48 -0800 (PST)
Received: from p14s (p7838222-ipoefx.ipoe.ocn.ne.jp. [123.225.39.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0e96df1c9sm15403105ad.39.2025.12.14.18.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 18:19:48 -0800 (PST)
Date: Sun, 14 Dec 2025 19:19:43 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com
Subject: Re: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-table"
 check
Message-ID: <aT9wP_3olsf7WbPL@p14s>
References: <20251208233302.684139-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208233302.684139-1-shenwei.wang@nxp.com>

On Mon, Dec 08, 2025 at 05:33:02PM -0600, Shenwei Wang wrote:
> The resource name may include an address suffix, for example:
> rsc-table@1fff8000.
> 
> To handle such cases, use strstarts() instead of strcmp() when checking
> for "rsc-table".
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 3be8790c14a2..33f21ab24c92 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -694,7 +694,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  		}
>  		priv->mem[b].sys_addr = res.start;
>  		priv->mem[b].size = resource_size(&res);
> -		if (!strcmp(res.name, "rsc-table"))
> +		if (strstarts(res.name, "rsc-table"))
>  			priv->rsc_table = priv->mem[b].cpu_addr;

Before applying this patch, I want to know how it ever worked before.  How
did DT with a suffix tested?

>  		b++;
>  	}
> -- 
> 2.43.0
> 
