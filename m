Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300682F2341
	for <imx@lists.linux.dev>; Thu,  3 Jul 2025 15:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555503; cv=none; b=YCzrgVmaE3qHUTHjmckp4GjPu7EDkUrlbxPxu+Au/YBgVWK0Asx7KSYugg79FhmE7cruIyoZwhN0j6vNAMDYakREjQkUMxNKHwNN3N0U0lhJ9Cdu0+QK7856pzqjCtsQyCdgQfC7bsBxX3b6bMsnriGCejnUQGzHWl/Y2ZjS7k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555503; c=relaxed/simple;
	bh=RbxVGJNbXM6OAp0vOrGJKnDsx6+rYr6yWLn2VhGH7Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmR3mUFtIHejbaZeXgvIvqPy02dgTQdSABjVMKugF9tzIPfCWAcKb+0MQqtIQOgReZBdzl8qts5ui7hZDFT+cHbYF/BjrBNOJpmrT6U8H5bnVb3h7eWmU1GW7OLQVaHTnkqyfmUgCk/zA7/5dey1UJkG0Cay0SUUBh4cfWjFa84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y05nGJFk; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y05nGJFk"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae35f36da9dso1133610566b.0
        for <imx@lists.linux.dev>; Thu, 03 Jul 2025 08:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751555499; x=1752160299; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FxkvsrSL+5JDtGQsAevbH9zmJ4Ly3BiCGEDd5Aq9Bn8=;
        b=y05nGJFk2epBa5pP6FPJc7oeo9AoRovePKOySjXwnw9PMeMWaPKldUwVEKx0NnoAnY
         YHMTT6duCutvLFI5khk/Z/jd4sh9vhluhmcktnKjMwiTurDMP0Wc179VKaFJwsiYDYos
         icb2H0NkHqK0oqA/ynTvJ3kRih5hseY3oBGHTgZx0+s/nF3JwtaswWSFIV29nOTFMkiX
         UTSUI3lkXlncZGYZ9wnnqUrqbDo/e3b/BwiAZrRlsX1/agPX3fnjaqkaY3n0UFxKx0T7
         FC5TbxSBTkMTHX4sG5cSeGaMdTCZBWZWbyNBTNtbZCyapQU6PT5+My7Dh33d6nQqJ58x
         H9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555499; x=1752160299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxkvsrSL+5JDtGQsAevbH9zmJ4Ly3BiCGEDd5Aq9Bn8=;
        b=e3KzzWSXsIaJ75xZGfnPPxwjOsho8CN0KJ5788qBtX6mcK3cvhWD8aumcZl8AmoQsm
         1lYaEq5rkgPWpOeqKBLcmxxn17dQZOkZkKIW1ba6CZhEXQ6/m+xMpfALWNhXA7BfI8pu
         iDlgAR11lWTF6nSYeAd9nYfT0VF7bsGM25or5AD+vTWRCMqe57P2bavJJ/jURpJmqPQW
         bMJv8fp0if/m6qOWOcJrmxdjWttfzPwfSqKA8DNUlIHLjQUTI3gZlWkku1VvEI3PgmG7
         wCE9EH3fmtu4T16WvyGgzv1c6dvnjU1fdFGyRMDvXv/tKVJxgfDtEbeW0plpghlOEzRf
         8ccQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf5Rpz9LLF8kxImQ3Q6PXqVWk6bCG5RV3dWxttu4vWrIy23JQQ3sm8V9eCzx+XQe8/Y64=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx3lrI0coanjpk3Cgq965tdOWJNsiJl9h40Amx9iB5k3wgO31W
	MmSsjYcKBdvEau7ImtlccTke7o+7BnRlLzFP5fAKP7/7BndSbZS0JiCHPbT6qP9C0sk=
X-Gm-Gg: ASbGncvSO6oWap3bSohJmOW1Cfz+qNMAHTEJsfTzo9RWV+hnqf1xpFSnx14wmuu52Za
	v+MaAe8G0dvOKj757Yq8RznNFr7cdOmF4CBb0Y8UtadvahBP/uzihknAeskbI9986nRCQwjuxcp
	SF1tanggQ7EykQHZL3+xBCh0rewTa6I4Mh1RobYZhQNRBlycMFvD78VULHXwQsHhc/AMNxjm/Dp
	JfEuHSvX0uNTAVrnxYQI3AQyclsQJ9DeEMfuw4IH0AP6peAq7pxlBUUpsMvqyOD9QpJ8NYpoBXt
	ye3nNigWcHaekO4Gq/RioyiiN3Ia4LOIBuP3AyVaFWwJER9pdJzQceF7Q1I=
X-Google-Smtp-Source: AGHT+IHdpH0Sd2LIExCI7zlJsSgp4lqg2r2dh7poJIycXB81JioP7FOT54h9vFTuZ+M/bEMSFmF3pw==
X-Received: by 2002:a17:907:72c4:b0:adb:2ef9:db38 with SMTP id a640c23a62f3a-ae3d84f7aa3mr410481766b.36.1751555499231;
        Thu, 03 Jul 2025 08:11:39 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c831b3e29sm11077956a12.42.2025.07.03.08.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:11:38 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:11:36 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v2 2/5] clk: imx95-blk-ctl: Fix synchronous abort
Message-ID: <aGadqB5pP6DjNuRH@linaro.org>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-2-b378ad796330@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-2-b378ad796330@nxp.com>

On 25-07-03 11:40:21, Peng Fan wrote:
> From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> 
> When enabling runtime PM for clock suppliers that also belong to a power
> domain, the following crash is thrown:
> 
> ---
> Internal error: synchronous external abort: 0000000096000010 [#1] PREEMPT SMP
> Workqueue: events_unbound deferred_probe_work_func
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : clk_mux_get_parent+0x60/0x90
> lr : clk_core_reparent_orphans_nolock+0x58/0xd8
> Call trace:
>  clk_mux_get_parent+0x60/0x90
>  clk_core_reparent_orphans_nolock+0x58/0xd8
>  of_clk_add_hw_provider.part.0+0x90/0x100
>  of_clk_add_hw_provider+0x1c/0x38
>  imx95_bc_probe+0x2e0/0x3f0
>  platform_probe+0x70/0xd8
> 
> Enabling runtime PM without explicitly resuming the device caused
> the power domain cut off after clk_register() is called. As a result,
> a crash happens when the clock hardware provider is added and attempts
> to access the BLK_CTL register
> 
> Fix this by using devm_pm_runtime_enable() instead of pm_runtime_enable()
> and getting rid of the pm_runtime_disable() in the cleanup path.
> 
> Fixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driver")
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
