Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A3D273D96
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752158952; cv=none; b=TgKIcW2+Ol4zL7Cy1RD3k9r2dAuJMT3Pjul9wXveLIRA06AzQmdKYaUvR1PSchkl44fVCg/Y2Cf+CShLVdlrERSahTGwhH1iAVaiaa/AeP4YDNbrLDLweRlocjlNtT6bk/e3gbNKiakAczuY3aTUZSDxaInb+JkfcHt+UGtsQXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752158952; c=relaxed/simple;
	bh=m4ghKtwKJrUsSVXZHTvI5Ps+AMXUxsLNPsCHx2vmZI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6AF68I1D/bmvzqCJ7aGxtqNvFMps28otR48jhSgmhNqI3dcQn6Mu4v+Dhb9AROR2sC+N0MQSzR77XydNWCSNV0rSDesddEsMDEYp11CcfZdUuWek1uddkPSXs8Ss9H/qilWLmC7mrzBKqMxFda816x35vGr6nm0df3UGcIcVVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EGDggbiR; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EGDggbiR"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-237e6963f63so6861765ad.2
        for <imx@lists.linux.dev>; Thu, 10 Jul 2025 07:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752158950; x=1752763750; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wYtWRzzzlhSnP5KUQl4NFLAveNS15FrK/s5SwIAgVgk=;
        b=EGDggbiR2VL3MEis6YmTMv/U5OXztnfDQ+eQxEH9UeT5Q1ZUByg5lC7mLMDZGdaWvQ
         p//rlg5Rwv1l3sqqjxra0FvnxtYzlhexInBCPrADKF1AOGgJXEbyG9aPbNXl0nnNYhaK
         fvAXlA5Io3IyxSycAdpp9vzNpdXpm2ZWMb2KBXMoMwrxbJJc/DZaLsjna91/6CEOomGg
         JE9/GcZDMbgB8fc42p/LHXFUmPobQTXysd8yhOpvoE2ba5rhZQtlakLXff5vdI6fGook
         W/mo9oItZc5R9HtKAx3tNT8N6TqXYG3lkvyU8iMa4KkCOMonfN2ugPWB0fXpCZHkXqAK
         VIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752158950; x=1752763750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYtWRzzzlhSnP5KUQl4NFLAveNS15FrK/s5SwIAgVgk=;
        b=IfMIg9sY+RLCUyIMsTLmOlD2UME7X8zurJU7NWn3l7IAklkQgT9B7FN5H1z/U7fXGz
         wEy9csmbCMErf9SbH3cp4XwB15jeKZUUykXPzZiNGd+rbSB2h5huhx8jlL32FP8konk8
         s1VLZldDjrcdzJJxfzIewnacjt+ROCEkoX3v/TEhZO3pTXubGubXzMN4oXhWMXVj/Cw3
         SadNlvvb49zSgS042J7uMKHiwqHO48QzdOxKi4TRsjgNqi42ulMHfO0rJfMYsyH7NYBX
         XYY86j9/NgYYS0dZE7YP6iw93Uc7T8kii+yCi/tMo2bfy4sZmdZ2m5lcRuhwCr7/3Fe9
         NuXw==
X-Forwarded-Encrypted: i=1; AJvYcCW8bJ95rIFEYJKTv6iE8ImRShulp1+msyreQhrCEYYaux3FjPXdBn2N9bp8XvrrMbnNBFE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyv80cYjSVZPoZ8+eg823OaGayhHjf+jFtP12+0ZoSbv2l4Et+f
	mahPS2xpDQoFOifxxYUosRUFpF2onjGKPn6fxuvDwELUTJThh3ZDnnACZI1dTr2j2QY=
X-Gm-Gg: ASbGncvC+c2eAKysB+Vlpq29stonr1WBbvzFRaNcCzO2JOV4J4Z3dr5vVL93mLBlcw5
	6FsHejAD+r2Y62bojx3SB4qeW4hbAt46b0UQ1/BY9+v52+tSHwqrh1+U1GCdyWV9pDaC/luW/HD
	0tDvwG3O+QyBPMf3vAIS04LFFeFu/vI1kf5xmumq30LyIZk0q9oAFqWipv0HQklOeHntZzaBgHa
	5eg2g2CC9U25xL0IK4g7PzPz0mLTlHlZedujK0rNweWRA9YgvMro1YPMof07uv0vfVxKFN2+baQ
	q8KvBViDL4TjI9w6iCYcHODKBEV+KlNSAqOVXxAIVzqQoszgwlKBvsXPQRZksRjy
X-Google-Smtp-Source: AGHT+IHLOaTbeIxYAUR/yv9JVTQenD6oK2Ov/QMFGUQSqoTLIPq/eEsamfgUWhDnHyTHM/izk94ISw==
X-Received: by 2002:a17:902:e84a:b0:235:eb71:a386 with SMTP id d9443c01a7336-23de48b620bmr42210185ad.50.1752158950381;
        Thu, 10 Jul 2025 07:49:10 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3c1:4dff:9df5:b97c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c301a8862sm5390817a91.37.2025.07.10.07.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 07:49:09 -0700 (PDT)
Date: Thu, 10 Jul 2025 08:49:07 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] remoteproc: imx_dsp_rproc: Add support of coredump
Message-ID: <aG_S4xA1uwbwVimP@p14s>
References: <20250704052529.1040602-1-shengjiu.wang@nxp.com>
 <20250704052529.1040602-3-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704052529.1040602-3-shengjiu.wang@nxp.com>

On Fri, Jul 04, 2025 at 01:25:29PM +0800, Shengjiu Wang wrote:
> Add call rproc_coredump_set_elf_info() to initialize the elf info for
> coredump, otherwise coredump will report error "ELF class is not set".
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index ba764fc55686..6e78a01755c7 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1205,6 +1205,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
>  		goto err_detach_domains;
>  	}
>  
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
> +

The previous patch is small enough that this should be folded in it.

Thanks,
Mathieu

>  	pm_runtime_enable(dev);
>  
>  	return 0;
> -- 
> 2.34.1
> 
