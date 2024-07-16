Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B3F19AA40
	for <imx@lists.linux.dev>; Tue, 16 Jul 2024 15:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721144563; cv=none; b=DPrNzNTr/pvtqbCXsMhKVBA9SfVUmQxxveJT32/r6FrJVQm2bVZk3/J3ku3XpFBh0i+Y+h2rQd9hLJJSDbMp0SS6M/RkAyZaObb0R58s3147Hsxi2lc1NIVosgbNPGTjj15nNqHWWSDCY2ZAXBFSYAwMiOUUDXTD6QTHoEFftpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721144563; c=relaxed/simple;
	bh=rQQ1Qg6JSBfjSH2QZ8VvmzPD790Oe1XjwPlwbolB7ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qTv0QIqtQJmwkmqW45liyxDsLDLm18VhLLH/UZUDX9H/BGLSD5s5DM0WJ8k3YDwjwSmk6eY23MuT/ax2J6x4pxZCJJ458lTQWalHhftoEucp1u2RC17kUkphbI3O2HeU+Fa4AIY3uPyXSTF/AdNc7ucNDOEUpVs8Jg3nSZQvpU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w7qtZKpo; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w7qtZKpo"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fb0d7e4ee9so37320635ad.3
        for <imx@lists.linux.dev>; Tue, 16 Jul 2024 08:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721144561; x=1721749361; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wDLjTilJpT2HBZBHwtZnBdq05Hhmc0NUomleiXquZZU=;
        b=w7qtZKpoZZfwdamxG7JJV+qDw/n/JiL1msBt9CA0zCAyX7AnDRd9sYb9mb/zlQkIax
         pE6BQ2Z1xHHcSqz4HTnRtRqmxPgrfnvj8+PWUh8IIAVPLcGANb0A5+GItw5HPlMoZ8pO
         VhvPo9qsX+DxXG6aRofFiJ0eH3azVfYQ2SZYPPdXGnMmlgyu38keTl60btlAAfuJIocu
         UlRUZHa5ET4tXdak4Ql+pFGg+iKrghvotRM5ViaHtXJnnFUG2aXzLe38Uue/m3WGjVHr
         SE/mxeyP8a4iBV+uMaTWziyjlJbqFxwBCL6MWqXh2dLIpab7gKTB6WzkWSgxLdgmOdJ4
         XdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721144561; x=1721749361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDLjTilJpT2HBZBHwtZnBdq05Hhmc0NUomleiXquZZU=;
        b=POUFCTiQSqSIzyrWhsDhRQeclVMvaz3X51lW9qG2Vj6dWIDm4f+ZRGfh0HtD5lbtRz
         Zlyfl9ALk+qdTPo+9/jjVvEIgoP3EicgLaXRixN8i793NxtOigdkAkC6O1CbjvO81XQ1
         5stUrz3QlIyqzQ6bxplxNkQOExX4Rg4ZE4gRFinzlFf745CrpA+dmfj61sfP1FHCqKuG
         J4Pp+P8UnnNn2tnvlXQmgIgrHC/4dxOCIIp6QDI7oOHPg/mw65viUEGEqOEmsiaCNgT1
         Gz1lr2kkng3EyP2xBaE+iGAmiQb4030/e8xMz5764RBMaqMixPvHZ6A+xk5X2nYPajzf
         19IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR3Tl9Vh8SVzblsW7fl4j36vaL4wxbZqqCE20l3JMpzA2u2Ncq6Mb6H8gbp289KiW9syBfTatuB+HNl7QvHRGIwZa2
X-Gm-Message-State: AOJu0YzqRN+zpeEXmaPwbsqgPs7rh5Pzw+mjci15XFLh11KfnhSqrWxt
	3BSmf0kB4osT1sZUkowJkUvaZbJwu3nnKKfUXzMjeIoXZLt2qhv6xttePwY7OTw=
X-Google-Smtp-Source: AGHT+IFOsaKUXJaZMWGbZAXbmDixqd3fsB0nKaPU0B/B4/vmsuI8S5FQiPXCYpXlIkiFt2B8Xo+YkQ==
X-Received: by 2002:a05:6a21:3284:b0:1c1:31d0:c7a7 with SMTP id adf61e73a8af0-1c3f1210888mr2801180637.16.1721144561320;
        Tue, 16 Jul 2024 08:42:41 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5d01:167d:9cf4:148e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-78e33bbb564sm5051782a12.29.2024.07.16.08.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 08:42:40 -0700 (PDT)
Date: Tue, 16 Jul 2024 09:42:37 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, marex@denx.de,
	iuliana.prodan@nxp.com, daniel.baluta@nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 4/6] remoteproc: imx_rproc: merge TCML/U
Message-ID: <ZpaU7TBfCQ7Tha1L@p14s>
References: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
 <20240712-imx_rproc-v1-4-7bcf6732d328@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712-imx_rproc-v1-4-7bcf6732d328@nxp.com>

On Fri, Jul 12, 2024 at 04:34:57PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Merge contiguous TCML/U regions into one to avoid load elf files which
> has large sections failure.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 9e99bb27c033..552fccebf7e2 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -119,20 +119,16 @@ struct imx_rproc {
>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
>  	/* dev addr , sys addr  , size	    , flags */
>  	/* TCM CODE NON-SECURE */
> -	{ 0x0FFC0000, 0x201C0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> -	{ 0x0FFE0000, 0x201E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> +	{ 0x0FFC0000, 0x201C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
>  
>  	/* TCM CODE SECURE */
> -	{ 0x1FFC0000, 0x201C0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> -	{ 0x1FFE0000, 0x201E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> +	{ 0x1FFC0000, 0x201C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
>  
>  	/* TCM SYS NON-SECURE*/
> -	{ 0x20000000, 0x20200000, 0x00020000, ATT_OWN | ATT_IOMEM },
> -	{ 0x20020000, 0x20220000, 0x00020000, ATT_OWN | ATT_IOMEM },
> +	{ 0x20000000, 0x20200000, 0x00040000, ATT_OWN | ATT_IOMEM },
>  
>  	/* TCM SYS SECURE*/
> -	{ 0x30000000, 0x20200000, 0x00020000, ATT_OWN | ATT_IOMEM },
> -	{ 0x30020000, 0x20220000, 0x00020000, ATT_OWN | ATT_IOMEM },
> +	{ 0x30000000, 0x20200000, 0x00040000, ATT_OWN | ATT_IOMEM },
>  
>  	/* DDR */
>  	{ 0x80000000, 0x80000000, 0x10000000, 0 },
> @@ -211,10 +207,8 @@ static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
>  	{ 0x08000000, 0x08000000, 0x08000000, 0 },
>  	/* DDR (Code) - alias */
>  	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
> -	/* TCML */
> -	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN  | ATT_IOMEM},
> -	/* TCMU */
> -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN  | ATT_IOMEM},
> +	/* TCML/U */
> +	{ 0x1FFE0000, 0x007E0000, 0x00040000, ATT_OWN  | ATT_IOMEM},

Here too I will need an RB tag by Marek, Iuliana or Daniel.

>  	/* OCRAM_S */
>  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
>  	/* OCRAM */
> 
> -- 
> 2.37.1
> 
