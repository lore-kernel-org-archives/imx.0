Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4425D1F12FB
	for <imx@lists.linux.dev>; Mon,  5 Oct 2026 04:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791173284; cv=none; b=IYVincpZBvUvGOeSSFemh/mvxHEmZN/LHmwA+lqJ25qg6g/B1yxUieN029Jf4uIzGfI52ZzAiluByriq6i2Ptk+Sojuvlye2kT9vELcxYQ6+TsRndy72YBer7rhNoSc89tjLwOncH3Mo7aN8purywvwqmH2jv0AWKP9WoCgISBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791173284; c=relaxed/simple;
	bh=LMDE8Z0gPoVrNprdeBHN/Jw/1zoG7YryqwLWnWMRDUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rf2S/hy0IF9IGxyTKmRUNieCRJODxRwSxVOBzMt9xpI+d+DYc+oYN1tIONh+6TJAHeVMS19o+lt9F8T+0qavjI8mMGKuAsZ8/qaS57UTNWveMpfVw6eFlhPp67ax3TKMQoi7Df9zts+b+K4IT4DjnZ1TOCDtLwOYqsjO5TpIRSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J0qG2FtK; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J0qG2FtK"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c11ef641aso2280379eec.1
        for <imx@lists.linux.dev>; Sun, 04 Oct 2026 21:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791173281; x=1791778081; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LoOBU3dKUoijTmAk3p1LupdivqwWNOCTytdFGuDGRd8=;
        b=J0qG2FtKENZMiZh3Pw1BjXqRXV7D1DYet4PGTOUfLDw7zPfRd1gvr+y4drF5F3GD94
         Qshe4XRVwncN3xPxygbSMCbppWWtjVSfYcZdzgUSHCGC+w9tnX8672w7L1cvqXAx4YrT
         FF/Gh0wydrAQPpzXR2WbjQtbEYj47TcLCVk5Yc/h5ZThfhyLUe8+/r99L1NPxvZyumw7
         s153ptzIX1XkGEFaKmfInT6xvFK66rth0WIztngzOdLqmnjK06AqzBfyRkU4fShuM6k0
         /UpojLQk4JHDy0fheKMbCW5ohi4pto/j2n/6IHcXSHawXj7PTJLBiStIZD//TFQX/aTH
         GuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791173281; x=1791778081;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LoOBU3dKUoijTmAk3p1LupdivqwWNOCTytdFGuDGRd8=;
        b=APuF1wK3/sYNCs833xb42KV2N0eKbEvZqeW2JNGEKGC5rAdSQuD+qG+CLYZ91Wgzsp
         g1g9WnbNU+bhI4ktN0cOr5mSz79mOQsZ0FckIfpZ5fuYIUwyiZQ22l+Jn47J4/tJwiUy
         vT+eN1ac8PvyWE3VRDkTkN/A3RZgTEIs/pjxdesqPgGz0iELAk7cO2tOYE2f2e7zFWqW
         Kbn7cY53LKFlHYUVyKAaCdXUUBBjcIjACRHXsOFL3LsrHszrK3JtWbok32auOeWjNESo
         MW/u+mdYGcSQW4d4m9nO1R1FFSFdYHUDTIfIS9eFzSH8OESreGZ1vyq8EGQjLMyImjZc
         uIlg==
X-Forwarded-Encrypted: i=1; AKwUvBy90pXUbqHwD8cgwC32JhkvSHd1xdXsRhHI1uoS0MjvxS+Nj/nT/ypNs5h6bomrHgJem9A=@lists.linux.dev
X-Gm-Message-State: AFuF++nq0O52oUGyMdHLMBOEGjNk29OG9sv81MIN+0RWKypuwIN4DNAR
	8HKtSZIa7A/OSZbv/eAlxQvvn3hefMmbpSd85guMWXnbXOvjPXvG+43AFvCm2y6XNbM=
X-Gm-Gg: AYBFou3lphuJlpLoaGoGm7rnSy86jwZYd4kpH9AGxJlzgdcXEtgx+RAsSiAtcx2WuD/
	5ccHlKxcFz9OcFkbCjeWzHrarlu6R38WOf3mRnooEcQVMHbtKNlYsociCQFDWcFQ6cnX6Noxa/w
	ODp6mgNxy1RGK1Ov5JmLK6ggSNx3CwOYCjOjmohtksE7pSynzt/76oMt5j2FUWcSnaDmpgemC0s
	78S1oRec50k3eWIXcoThHvv5+yGS8/xa8MgyZbHYMpyO3RrWGjiWH5E/SymipPzy1k+oNWKGQBE
	iGT3P6XjOvAFKgxSHBJUj0yznW0EhA3vV2WlS6+CQPj5OTJem14Wwn2uGYUaswqOOIyhVYnYu3Y
	MSe9yI+fgQTA3DekjkT+0Nbq8f58OhAKwZoSewmNgzJwLONN+RJ752gRaUjBTcQWGWhQuh86+tL
	0KLbOOJ6pcipKOPhd5TkHrJuvKnAANoy818nQhaP5FUI2Ffzu5aMuqOO1r4t32EzjAKj4vzhSN
X-Received: by 2002:a05:701b:2810:b0:149:cfa4:9b3b with SMTP id a92af1059eb24-14f58de5451mr12982932c88.3.1791173281135;
        Sun, 04 Oct 2026 21:08:01 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fcec9a95sm18805270c88.15.2026.10.04.21.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 21:08:00 -0700 (PDT)
Date: Mon, 5 Oct 2026 09:37:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumeet Pawnikar <sumeet4linux@gmail.com>
Cc: rafael@kernel.org, krzk@kernel.org, amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org, thara.gopinath@gmail.com,
	talel@amazon.com, hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org, mmayer@broadcom.com, sumitg@nvidia.com,
	peter.griffin@linaro.org, myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sven@kernel.org,
	j@jannau.net, marcan@marcan.st, casey.connolly@linaro.org,
	sre@kernel.org, wens@kernel.org, t.schramm@manjaro.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de,
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] cpufreq: Use %pe to print error pointers
 symbolically
Message-ID: <asMinVwyd7gcvRlo@vireshk-B250M-D3H>
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
 <20260912191156.185448-4-sumeet4linux@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912191156.185448-4-sumeet4linux@gmail.com>

On 13-09-26, 00:41, Sumeet Pawnikar wrote:
> Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
> to pr_err() and pr_warn(). The %pe format specifier prints a symbolic error
> name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it
> falls back gracefully and prints the raw integer value. This makes messages
> more readable without any functional change.
> 
> Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
> ---
>  drivers/cpufreq/bmips-cpufreq.c   | 4 ++--
>  drivers/cpufreq/cppc_cpufreq.c    | 4 ++--
>  drivers/cpufreq/qoriq-cpufreq.c   | 4 ++--
>  drivers/cpufreq/s3c64xx-cpufreq.c | 5 ++---
>  4 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/cpufreq/bmips-cpufreq.c b/drivers/cpufreq/bmips-cpufreq.c
> index a8e35bc75fb2..389fff5e6f65 100644
> --- a/drivers/cpufreq/bmips-cpufreq.c
> +++ b/drivers/cpufreq/bmips-cpufreq.c
> @@ -132,8 +132,8 @@ static int bmips_cpufreq_init(struct cpufreq_policy *policy)
>  
>  	freq_table = bmips_cpufreq_get_freq_table(policy);
>  	if (IS_ERR(freq_table)) {
> -		pr_err("%s: couldn't determine frequency table (%ld).\n",
> -			BMIPS_CPUFREQ_NAME, PTR_ERR(freq_table));
> +		pr_err("%s: couldn't determine frequency table (%pe).\n",
> +			BMIPS_CPUFREQ_NAME, freq_table);
>  		return PTR_ERR(freq_table);
>  	}
>  
> diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
> index 80893844353c..f767898ebfb5 100644
> --- a/drivers/cpufreq/cppc_cpufreq.c
> +++ b/drivers/cpufreq/cppc_cpufreq.c
> @@ -230,8 +230,8 @@ static void cppc_fie_kworker_init(void)
>  
>  	kworker_fie = kthread_run_worker(0, "cppc_fie");
>  	if (IS_ERR(kworker_fie)) {
> -		pr_warn("%s: failed to create kworker_fie: %ld\n", __func__,
> -			PTR_ERR(kworker_fie));
> +		pr_warn("%s: failed to create kworker_fie: %pe\n", __func__,
> +			kworker_fie);
>  		fie_disabled = FIE_DISABLED;
>  		kworker_fie = NULL;
>  		return;
> diff --git a/drivers/cpufreq/qoriq-cpufreq.c b/drivers/cpufreq/qoriq-cpufreq.c
> index 42edb41ad459..0652e5df0278 100644
> --- a/drivers/cpufreq/qoriq-cpufreq.c
> +++ b/drivers/cpufreq/qoriq-cpufreq.c
> @@ -57,8 +57,8 @@ static u32 get_bus_freq(void)
>  	/* get platform freq by its clock name */
>  	pltclk = clk_get(NULL, "cg-pll0-div1");
>  	if (IS_ERR(pltclk)) {
> -		pr_err("%s: can't get bus frequency %ld\n",
> -		       __func__, PTR_ERR(pltclk));
> +		pr_err("%s: can't get bus frequency %pe\n",
> +		       __func__, pltclk);
>  		return PTR_ERR(pltclk);
>  	}
>  
> diff --git a/drivers/cpufreq/s3c64xx-cpufreq.c b/drivers/cpufreq/s3c64xx-cpufreq.c
> index 9cef71528076..9a01592425ee 100644
> --- a/drivers/cpufreq/s3c64xx-cpufreq.c
> +++ b/drivers/cpufreq/s3c64xx-cpufreq.c
> @@ -152,15 +152,14 @@ static int s3c64xx_cpufreq_driver_init(struct cpufreq_policy *policy)
>  
>  	policy->clk = clk_get(NULL, "armclk");
>  	if (IS_ERR(policy->clk)) {
> -		pr_err("Unable to obtain ARMCLK: %ld\n",
> -		       PTR_ERR(policy->clk));
> +		pr_err("Unable to obtain ARMCLK: %pe\n", policy->clk);
>  		return PTR_ERR(policy->clk);
>  	}
>  
>  #ifdef CONFIG_REGULATOR
>  	vddarm = regulator_get(NULL, "vddarm");
>  	if (IS_ERR(vddarm)) {
> -		pr_err("Failed to obtain VDDARM: %ld\n", PTR_ERR(vddarm));
> +		pr_err("Failed to obtain VDDARM: %pe\n", vddarm);
>  		pr_err("Only frequency scaling available\n");
>  		vddarm = NULL;
>  	} else {

Applied. Thanks.

-- 
viresh
