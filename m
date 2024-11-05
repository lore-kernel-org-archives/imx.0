Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8C61D1739
	for <imx@lists.linux.dev>; Tue,  5 Nov 2024 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730800762; cv=none; b=Ko0AUyO+W4iJXMG11fiKaenV1Z/lt1U9dOY8CCoou8iAHj7wquypRY0vk+WklWdLm3RKk4Rn7I0veKDoG7wGFwghVBbZN+K7A9VFrtcNO2/3lCqjAhfvuzJFrOJTyUp8OCCUjPNFKLyVztDgT7UUX5K5SWCgJv8E4RBAKO2j/js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730800762; c=relaxed/simple;
	bh=zNjg+Qs9cvpRbWrCXV1WmkwBfqNjNTh65eWMo8ZLqiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhvHaL5xZ9Vhz+5opBTX8rOZZ6PrV4oOZBqoTGyzst/L6qNi+RuOcaYPfKWD3otFjxtOB1uRT2jnZmqxxJAW5b/B2hRubQnET14e0OqQ6iIP7Il9Z2bT6YTo8+MYqjA5QFtdqASKCUvZhiqmlShNfZH4eC+peL1h2zEUfRx7aXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aO0sYlRS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aO0sYlRS"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-431688d5127so41558005e9.0
        for <imx@lists.linux.dev>; Tue, 05 Nov 2024 01:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730800759; x=1731405559; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fyGIcIP85izql5VivzAyfDSoQYWkeBRRivWAb6Rz/VY=;
        b=aO0sYlRSLJDYzI/5rW/Bsjso3+Vd8aWvGqnwRGvjcbPtGSX8JxzKDacdJ5nZ2QUolI
         bRu8R3S4vUZ3b/cjmlhV/RLP1xYyW3PDwDWJBhurLyauXCn9/2BWWRDJazbwX4Io3LBH
         dLkZzvgY1l3AmANjPidD7E1HRwNn5Wqu6C7/jHLBdYgch6ySDKLKbmaBw45qf3uusfrq
         XLp9juwzFOljXNDkgriSf08GscZWMObs8OB2nBNu+tQkr2uqsRwQ/YgX2MRG2TmYx/+r
         lDnEhTXBmL63jwNUKFEOPkjKGx8rNUKRu4inwwFZK7m8GZszIfqHnjjYZTdz+K6R6ZVr
         Lyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730800759; x=1731405559;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fyGIcIP85izql5VivzAyfDSoQYWkeBRRivWAb6Rz/VY=;
        b=TJPGNTs1zS5JXGg8OYARODJEqEbnU0WzwCdvkGf1pBL6jlV+yI0uLg80N3PN/d/tCF
         g16Y2iyuANh4apIUV4WPHwHw9AwNXCoEphev7VZbSs9WXpyCKRPzZ3gXu+m6QDOZPPAh
         gc6npbspGj8ZSXpfC+oLLSZ1unJ0kgVng+h+drqO4q77qAcPK7Yt5cMK5cekdvG6qHPV
         +oVqy3ip43zK/UYNZriBmzv6cuciOSVigNicZGmNE459ExpvF+bgtw6xNKyOOslMb+U0
         szRjG9juNFn2S3URv6io8LLyD68UhbqeOCuCtNzdYs/QL0Y5D6r6vlVoMLYGPEtBILC3
         pu/g==
X-Forwarded-Encrypted: i=1; AJvYcCXLfw3X5Zc1XJkOq5RbZi9x4qiOFIXlUOkcdukAmjhYtASSHTt7mlfsLy2McOKsqfqmKiQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxY/iFI9xugV8zNKEjVZAFHp3Tqw9f+SiloyeEPA/tOsV3HcILi
	waCmuFJAjvsNkTpd0wesZYFhuAKgHC7VK40Ro+3efniUgjqy2ZqEjoc8eT8nTnU=
X-Google-Smtp-Source: AGHT+IFh1eUnSOgYeUPL8vbfgeu7KUTTM1nBaaDD9m2PgycfeAUV7I9FEe2TI7FKOJYLMdMaTY2lWw==
X-Received: by 2002:a05:600c:458f:b0:431:3bf9:3ebb with SMTP id 5b1f17b1804b1-4319ad047a7mr310993305e9.24.1730800759033;
        Tue, 05 Nov 2024 01:59:19 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5ab305sm182610885e9.7.2024.11.05.01.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 01:59:18 -0800 (PST)
Date: Tue, 5 Nov 2024 11:59:17 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aisheng Dong <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>
Subject: Re: [PATCH v3 2/5] clk: imx: fracn-gppll: correct PLL initialization
 flow
Message-ID: <ZynsdXx3McoW9SK5@linaro.org>
References: <20241027-imx-clk-v1-v3-0-89152574d1d7@nxp.com>
 <20241027-imx-clk-v1-v3-2-89152574d1d7@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241027-imx-clk-v1-v3-2-89152574d1d7@nxp.com>

On 24-10-27 20:00:08, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Per i.MX93 Reference Mannual 22.4 Initialization information
> 1. Program appropriate value of DIV[ODIV], DIV[RDIV] and DIV[MFI]
>    as per Integer mode.
> 2. Wait for 5 μs.
> 3. Program the following field in CTRL register.
>    Set CTRL[POWERUP] to 1'b1 to enable PLL block.
> 4. Poll PLL_STATUS[PLL_LOCK] register, and wait till PLL_STATUS[PLL_LOCK]
>    is 1'b1 and pll_lock output signal is 1'b1.
> 5. Set CTRL[CLKMUX_EN] to 1'b1 to enable PLL output clock.
> 
> So move the CLKMUX_EN operation after PLL locked.
> 
> Fixes: 1b26cb8a77a4 ("clk: imx: support fracn gppll")
> Co-developed-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-fracn-gppll.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
> index 591e0364ee5c113859a7b6271c8c11e98a0e0ffc..4749c3e0b7051cf53876664808aa28742f6861f7 100644
> --- a/drivers/clk/imx/clk-fracn-gppll.c
> +++ b/drivers/clk/imx/clk-fracn-gppll.c
> @@ -303,13 +303,13 @@ static int clk_fracn_gppll_prepare(struct clk_hw *hw)
>  	val |= POWERUP_MASK;
>  	writel_relaxed(val, pll->base + PLL_CTRL);
>  
> -	val |= CLKMUX_EN;
> -	writel_relaxed(val, pll->base + PLL_CTRL);
> -
>  	ret = clk_fracn_gppll_wait_lock(pll);
>  	if (ret)
>  		return ret;
>  
> +	val |= CLKMUX_EN;
> +	writel_relaxed(val, pll->base + PLL_CTRL);
> +
>  	val &= ~CLKMUX_BYPASS;
>  	writel_relaxed(val, pll->base + PLL_CTRL);
>  
> 
> -- 
> 2.37.1
> 
