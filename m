Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0681CF7C9
	for <imx@lists.linux.dev>; Tue,  5 Nov 2024 10:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730800856; cv=none; b=CSQURfDX7WtuXfZkQpevNASvpcrAF5dmf+Gg+2ojDUA1Qp27yM78X/p25+IKOCsRNmtn6kWsGw/JMn2fvUQ03U1dASM0/sqyuynncfM3hpPw4SNYwYu2wpG8Qbo2bJ0BHncDDtr69kpe+HY+0HF9K3BzLJV15n64Iy6wYUBRpMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730800856; c=relaxed/simple;
	bh=G51jhzQqKY+D8hwS2m/4yusGKIpJiOixdKXy7qb5+3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NplbrRTdcRNScX5Ue3GgBKMDgqDNXsweOCN2v+sdK+ttWC8ipIV08/pbGg3TCz4PZYvSt/OFFNtJ/wjPtUfmUTXtEBP5NR56Ld/5kgf7FXOCCRhvlEo1eSXKBlbnZreVEDOqRSB1zf6YdCHbf/wFPo4Rk/8Sl/9RBwL+7cIkyjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TX+JocvB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TX+JocvB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-431688d5127so41571805e9.0
        for <imx@lists.linux.dev>; Tue, 05 Nov 2024 02:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730800853; x=1731405653; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qqjjzu00wo0rLZzR44vy7Mc+li1wHJBT4o2yabL2Nbg=;
        b=TX+JocvBygsNQ+a9DjLRTUMh89lpOCeF23Glv1of2dshqznW3DgUBZ9qBF97Qtz3cW
         puH7unPE86O5Y15xPw2yQXggpwPV5YVlOQ/DHFUui3ezx2j/meny4i9DlhD7I338fTVb
         gakifpu9vE0IjIjDUQlioogUrENe51nooZwPQDdvN+uL6lj3E+Z1h8G6VXJJxNtnBBzL
         F9bLmIam+hYLjfSNwkxE7wVv62fFVzE1WMQ7YsDvKo69dM1uMP9G06ZbiEB0wxeN6gmg
         6Pe1OChK1A7YAnAgNjWczGq0jr8pxRslr2Jrq6FRF/EubwDVoZGptah7EYZsaicqE27o
         9QyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730800853; x=1731405653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqjjzu00wo0rLZzR44vy7Mc+li1wHJBT4o2yabL2Nbg=;
        b=P7cWsz9oN3LiJHhqK1iy6RCzm9diYR6Yl1jKosBFc7nIlRgaLh6bbbZu2ze17b7oRC
         3tnHm6irKBOo+XRNZ4U6RM8zkhqlcdKIWFZNYLI5OeMOoGCY+CAMdZcPtUWxU5SwvIYW
         xyoXeDwjILhxj+TltX7LzUqX5gtW+4XYdbp0WdY1petY+oGh2SSDJJH3Icexos02KfFL
         MatsQtINrOlY/h6qipvI8Y6cbHnBcJ6/lm1SdmD22I3/A3bXT4DOGofBi1LOUzjGU4ro
         Y9hNdwQsZsAM+vkZyBVRtcwjy8WjkiF7qpMxGg8si4ggYCXxMbeiN8GC0BrVWNjyJbBz
         JYmw==
X-Forwarded-Encrypted: i=1; AJvYcCUzgllwEZI2ie0itCdRhd83IS+PIplsrlDTOc2Ti1pFXX4QsFnm5+2B+GZPawPKs5TJr9E=@lists.linux.dev
X-Gm-Message-State: AOJu0YwaAvkDmoPCF3iqUoQ8mJ876yjr3JJ3UExpfU80fE/pHdx1mJ86
	9XglrzyQjal/GkgZdR3TKoGswD48bE0cDV5XzTELEE5SdC+n5VBSSstyIqKOuW8=
X-Google-Smtp-Source: AGHT+IFm4Qb4M3oCZgWdKRIgQrNjub2F52DYcxA3WJCF5Ri03R0Wl6j6IdT3Hz00MkG2UHWSG6u6kw==
X-Received: by 2002:a05:600c:458f:b0:431:3bf9:3ebb with SMTP id 5b1f17b1804b1-4319ad047a7mr311045735e9.24.1730800852400;
        Tue, 05 Nov 2024 02:00:52 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf4e7sm181024905e9.15.2024.11.05.02.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 02:00:51 -0800 (PST)
Date: Tue, 5 Nov 2024 12:00:50 +0200
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
Subject: Re: [PATCH v3 3/5] clk: imx: fracn-gppll: fix pll power up
Message-ID: <Zyns0qfYpO3mZ4fa@linaro.org>
References: <20241027-imx-clk-v1-v3-0-89152574d1d7@nxp.com>
 <20241027-imx-clk-v1-v3-3-89152574d1d7@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241027-imx-clk-v1-v3-3-89152574d1d7@nxp.com>

On 24-10-27 20:00:09, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> To i.MX93 which features dual Cortex-A55 cores and DSU, when using
> writel_relaxed to write value to PLL registers, the value might be
> buffered. To make sure the value has been written into the hardware,
> using readl to read back the register could achieve the goal.
> 
> current PLL power up flow can be simplified as below:
>   1. writel_relaxed to set the PLL POWERUP bit;
>   2. readl_poll_timeout to check the PLL lock bit:
>      a). timeout = ktime_add_us(ktime_get(), timeout_us);
>      b). readl the pll the lock reg;
>      c). check if the pll lock bit ready
>      d). check if timeout
> 
> But in some corner cases, both the write in step 1 and read in
> step 2 will be blocked by other bus transaction in the SoC for a
> long time, saying the value into real hardware is just before step b).
> That means the timeout counting has begins for quite sometime since
> step a), but value still not written into real hardware until bus
> released just at a point before step b).
> 
> Then there maybe chances that the pll lock bit is not ready
> when readl done but the timeout happens. readl_poll_timeout will
> err return due to timeout. To avoid such unexpected failure,
> read back the reg to make sure the write has been done in HW
> reg.
> 
> So use readl after writel_relaxed to fix the issue.
> 
> Since we are here, to avoid udelay to run before writel_relaxed, use
> readl before udelay.
> 
> Fixes: 1b26cb8a77a4 ("clk: imx: support fracn gppll")
> Co-developed-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-fracn-gppll.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
> index 4749c3e0b7051cf53876664808aa28742f6861f7..85771afd4698ae6a0d8a7e82193301e187049255 100644
> --- a/drivers/clk/imx/clk-fracn-gppll.c
> +++ b/drivers/clk/imx/clk-fracn-gppll.c
> @@ -254,9 +254,11 @@ static int clk_fracn_gppll_set_rate(struct clk_hw *hw, unsigned long drate,
>  	pll_div = FIELD_PREP(PLL_RDIV_MASK, rate->rdiv) | rate->odiv |
>  		FIELD_PREP(PLL_MFI_MASK, rate->mfi);
>  	writel_relaxed(pll_div, pll->base + PLL_DIV);
> +	readl(pll->base + PLL_DIV);
>  	if (pll->flags & CLK_FRACN_GPPLL_FRACN) {
>  		writel_relaxed(rate->mfd, pll->base + PLL_DENOMINATOR);
>  		writel_relaxed(FIELD_PREP(PLL_MFN_MASK, rate->mfn), pll->base + PLL_NUMERATOR);
> +		readl(pll->base + PLL_NUMERATOR);
>  	}
>  
>  	/* Wait for 5us according to fracn mode pll doc */
> @@ -265,6 +267,7 @@ static int clk_fracn_gppll_set_rate(struct clk_hw *hw, unsigned long drate,
>  	/* Enable Powerup */
>  	tmp |= POWERUP_MASK;
>  	writel_relaxed(tmp, pll->base + PLL_CTRL);
> +	readl(pll->base + PLL_CTRL);
>  
>  	/* Wait Lock */
>  	ret = clk_fracn_gppll_wait_lock(pll);
> @@ -302,6 +305,7 @@ static int clk_fracn_gppll_prepare(struct clk_hw *hw)
>  
>  	val |= POWERUP_MASK;
>  	writel_relaxed(val, pll->base + PLL_CTRL);
> +	readl(pll->base + PLL_CTRL);
>  
>  	ret = clk_fracn_gppll_wait_lock(pll);
>  	if (ret)
> 
> -- 
> 2.37.1
> 
