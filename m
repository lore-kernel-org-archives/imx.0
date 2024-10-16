Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF2F205E02
	for <imx@lists.linux.dev>; Wed, 16 Oct 2024 09:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729071415; cv=none; b=fteeHc3xOV7H9EITh28Ruq9d6rstIVvh7j4FHuTUluWcCG4fc/L/xv7UmnJGkh3C+A4ciVdMrU4xktDsuDXhElAmBCaKfWDPu0JXj7IzBI2HPT+aPJ6Das2orDluATnKye2znpJkzhP2rJ61At7r6vAh9Q4C4dcUKh97EytEQCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729071415; c=relaxed/simple;
	bh=AF2PqunK1k+XUN3mW+Re5acyYvzfPCvF2Hb4iVv5SHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sc1/R1b3PxLpFOmv4PICzJJOcOzp2rKbohhfLMA0guNtt4XeP7P7UT3O3JvapUSOHNApu7niZXJIZ1r19TE2tjVxj4/TmFuWcsbWp/7AtKtrOPc0iz0COkuYTYIE4m+PojIvo/3RjsAAYy8ajfaD75w+WQuiyICbY68iIjLFxro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zxstQAjP; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zxstQAjP"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43140cadeaaso14253195e9.0
        for <imx@lists.linux.dev>; Wed, 16 Oct 2024 02:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729071411; x=1729676211; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fxIP+503HmacKr52hF4cwN6vKpq9JVczVJoJF+op9ME=;
        b=zxstQAjPCtDLcHbNwBpyipHdlxVDwgI9wq9Q3wHqF93SOJbjobj9afInP7sVel1jo5
         BCN9x5AWTwp9zleGQSEtg53tijAbEyPeKPCv9RmIfjswkomuGnIBzgs78ilZx11Eusi4
         TywXx4gC+UNQ0Y50UHQuJRycAqxZYPuccIx6RGgxBTMCBf/QExcJmiODdZ11q+rPHe70
         bvASFplFo3A51aRThrht4MY5MDb77LyWOjUid91l7zR+qGgvKdE/VO0RG5tyGz344Piq
         5SrChV2g5UZK7r7Q021oYOnscPAaF/jcYVh+csSJn7QEZcLG0sb3ACf+tk/R+ss9jNg6
         tY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729071411; x=1729676211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxIP+503HmacKr52hF4cwN6vKpq9JVczVJoJF+op9ME=;
        b=BMKkX13u5A8hCLUHo7z0dwr4uhLyrdf9uBV9q0vtm50tdb8vDmRbPyujn9LkjmupQv
         1swXzmydgsqJqhAdSblyet//SaU5XqQgavIhev6VXrtVUY2XFQcm3NVQ4iVXiDN9kv8s
         HPSSOklHSplhTsM6aYEqj0pDu6HvsgyeBrcb6/2y1/P+oCuDioIuoKffz3VdT7jNK3hm
         CjkY/h5Huj0uvedr58IbWBDAADoCfiIRaVry3S37u8YQ+sqLvvWaVM9DwZ4AEtx/y4pI
         JkwKcRpGMk80UH3HQ1mG8HWFhcKm9jcHRQc2Q6zKJPDREkHUJpqBgYf/sbRoeaJ90/AH
         3Aug==
X-Forwarded-Encrypted: i=1; AJvYcCVYZdDE24cqtIiahbFtvT4UFOc2oXRyT30yOeZ7rKn7z0uvNExkpzYyaHwNWy7tq+ks8Jk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjYj+sHPVI8oztf0Vbn5lpe66fbM83hcNArdV14sjZwzF6ZtZS
	oczlMNj1mualHuYU0dZCw6HN8JQK/gBjgWXw6mQyYVNPOJEMaINg0N2rTYoSg00=
X-Google-Smtp-Source: AGHT+IG6fNHMCd9wfwMroBHIryaVFXQVYfqJpieR0jsQIFDOAiMSqq1/ES6dB3VtdNGRUPAFimGMVw==
X-Received: by 2002:a05:600c:3555:b0:42c:bb96:340e with SMTP id 5b1f17b1804b1-4311df56158mr144236185e9.31.1729071411221;
        Wed, 16 Oct 2024 02:36:51 -0700 (PDT)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fc123dasm3798064f8f.94.2024.10.16.02.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 02:36:50 -0700 (PDT)
Date: Wed, 16 Oct 2024 12:36:48 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Pengfei Li <pengfei.li_1@nxp.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, abelvesa@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, ping.bai@nxp.com,
	ye.li@nxp.com, peng.fan@nxp.com, aisheng.dong@nxp.com,
	frank.li@nxp.com, kernel@pengutronix.de, festevam@gmail.com,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] clk: imx93: Move IMX93_CLK_END macro to clk driver
Message-ID: <Zw+JMMUOErRKqEH1@linaro.org>
References: <20241014182438.732444-1-pengfei.li_1@nxp.com>
 <20241014182438.732444-2-pengfei.li_1@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014182438.732444-2-pengfei.li_1@nxp.com>

On 24-10-14 11:24:35, Pengfei Li wrote:
> IMX93_CLK_END was previously defined in imx93-clock.h to indicate
> the number of clocks. However, it is not part of the ABI. For starters
> it does no really appear in DTS. But what's more important - new clocks
> are described later, which contradicts this define in binding header.
> So move this macro to clock driver.
> 
> Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> ---
>  drivers/clk/imx/clk-imx93.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
> index c6a9bc8ecc1f..c8b65146e76e 100644
> --- a/drivers/clk/imx/clk-imx93.c
> +++ b/drivers/clk/imx/clk-imx93.c
> @@ -15,6 +15,8 @@
>  
>  #include "clk.h"
>  
> +#define IMX93_CLK_END 202
> +

Sorry for this back and forth.

I've been discussing this off-list with Krzysztof and others and
now I think this is actually not wrong.

So:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

>  enum clk_sel {
>  	LOW_SPEED_IO_SEL,
>  	NON_IO_SEL,
> -- 
> 2.34.1
> 
