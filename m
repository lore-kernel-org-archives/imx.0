Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80ED4085D
	for <imx@lists.linux.dev>; Fri, 24 Jan 2025 13:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737726689; cv=none; b=qITGu3927xUS3BY5L4KA7THbna6+DuDNtuBfCf4idPFni6SN4A2hLonX2fXtGdG5khlR1TmP9f2LTJmTmbnIP59VSPXZC60s3xYJPPbKtNeQF9W85ZYTE1PcUZEXWG+dFchCmejzdtCJMAAMnyCbzHdl2LV/bTHfZ/FBKALFi/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737726689; c=relaxed/simple;
	bh=pJFaFR/cdHX84EYRD0FIV+VAe/KBfCM9byCxxPK0kf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIschylNyr81MOeGutaaVh8QZxeyg6zmx/xYxJFXPSn8SBFjKZAZ4u1b425he6U3FLJMnzVMLLEjXQnJb2TDPV2ZMWcj7FPlQtb0WI77A1gtOxrTW4gEP6Er8LF0+aWproNLsdWO/6Doe8lYIh2kGtCQeLQuMX9HU04zSdgCI0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yVftCtM4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yVftCtM4"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43621d27adeso14340235e9.2
        for <imx@lists.linux.dev>; Fri, 24 Jan 2025 05:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737726686; x=1738331486; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zKRrbe6gGWiSaBV4mplOTEhtmjTYcRZx77kHNzgfO9s=;
        b=yVftCtM4TogzmS4AxTfTft7WkCB6xDIj31IDMfMJaSGi7YmI6s9TPW8RHkTTiw869p
         Mi3u9YTIq1/7kJ9DXchne6MOlAFhEgV57R99D4eJnY8RtfbVtaSFPEMyQ72GbwkhGu3/
         CRIv3KJfM56dt8yzftSe/ShpZE0HyrDuqMduhrDAEkl8ztvq1RkNS6LqobRMNFlqtJAN
         cWtwwvsO6GoRNdr/TqNFSZ1fB1sELEmmeXlR8X9LwDrcU2cRcFH3OUhnOrLesoO2ERRX
         2fIO3+g5aKsElIyHmd4F3UA/s70VgWCzO9Zis+kY59nf1sF6ZADqv6A0qlxeBaerjftP
         RWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737726686; x=1738331486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKRrbe6gGWiSaBV4mplOTEhtmjTYcRZx77kHNzgfO9s=;
        b=f2gTUns+LcnIoOVc1QutYGbub4U7Z01TdOmmmxms57xZ4Wj0q0NvwL751e9/qRxw9f
         ILMTclSuG7hWf0VLlijMiA7vniuAkH3fWDhCFWUg4l/zBP9luUgr86FuKuDJaLjY80wI
         ILGdQcpkmbCGV0JnqGWSTsg7q/HC3CI/Pz1wQWSp1twpq5ClN1eg6rD+CNorjJ3Nup44
         OcxdNZsmOUvUN9OOTjSaDoksIPmPjuFleYwHHPjAaGMNB2rgiiW1QUK4U9bGjj1E3gc+
         56S8hy1iKtcr5cWy7iKKIrpSvACzQsXnqBnbWARwwM69RIZJ4TKX/RHHfawxNi3x3q+/
         EBIg==
X-Forwarded-Encrypted: i=1; AJvYcCVilONxk7vhjamUCvzGFtlZwZm/OkDxg5HanoRf3YiCnS987OsYGUNVuJlMjqltlsjEisw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxecbY7aGxY5raTA0l4Gzfpbm0qaq7ICapOWuPeskmyWWjZGL+d
	4Ca67PsjoD9kEaZIYySluSeeraQhmigyxULXBBp1Hasekza/B3ecSDk/aEEED1U=
X-Gm-Gg: ASbGncsVnDMacz+nayCqFEfzzB2fdObUgOQOKhrjfSrg3mE0sjb9Sf+t0C8z//z1jiA
	Hg/IUvZdQz6JWQCZLIC/pNlv7zC4rDJcCXtUuYsiJkZnueyaAai4VJ1Jk+lS5KLKuwd1NYyXCCG
	eIx0XBBmXON464wvYUQvE8+jm8mhaRucl5SrN26Tlmegi3Eyj8nzWFXObtkVHtAuRGvXXmfL7fR
	uQIs080stGvG4m3+pWbUxNlmGvmmm32zMrMdz/9dHLfVCgU17F4kd1NMZXRmtgi6YpwNxCWH4Rz
	NEn7F8pD3g==
X-Google-Smtp-Source: AGHT+IETFMJJrZWr/EDBakUelIAVIlOvrzgYZmGp+ZA18dqs2i5tih8sUMHw8uH4sD7esRtqKjCpXw==
X-Received: by 2002:a05:600c:3585:b0:434:f297:8e85 with SMTP id 5b1f17b1804b1-438913d5da1mr323417065e9.10.1737726686177;
        Fri, 24 Jan 2025 05:51:26 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd485007sm27717805e9.12.2025.01.24.05.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 05:51:25 -0800 (PST)
Date: Fri, 24 Jan 2025 16:51:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/3] clk: Introduce clk_set_spread_spectrum
Message-ID: <f83759b4-8e8a-4497-b032-341c8538c293@stanley.mountain>
References: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com>
 <20250124-clk-ssc-v1-1-2d39f6baf2af@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124-clk-ssc-v1-1-2d39f6baf2af@nxp.com>

On Fri, Jan 24, 2025 at 10:25:17PM +0800, Peng Fan (OSS) wrote:
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index cf7720b9172ff223d86227aad144e15375ddfd86..a4fe4a60f839244b736e3c2751eeb38dc4577b1f 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2790,6 +2790,45 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
>  }
>  EXPORT_SYMBOL_GPL(clk_set_max_rate);
>  
> +int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
> +			    unsigned int spreadpercent, unsigned int method,
> +			    bool enable)
> +{
> +	struct clk_spread_spectrum clk_ss;
> +	struct clk_core *core;
> +	int ret = 0;
> +
> +	if (!clk || !clk->core)
> +		return 0;
> +
> +	clk_ss.modfreq = modfreq;
> +	clk_ss.spreadpercent = spreadpercent;
> +	clk_ss.method = method;
> +	clk_ss.enable = enable;
> +
> +	clk_prepare_lock();
> +
> +	core = clk->core;
> +
> +	if (core->prepare_count) {
> +		ret = -EBUSY;
> +		goto fail;

fail is too vague to be useful as a name.  Also this should be
goto unlock;

> +	}
> +
> +	ret = clk_pm_runtime_get(core);
> +	if (ret)
> +		goto fail;
> +
> +	if (core->ops->set_spread_spectrum)
> +		ret = core->ops->set_spread_spectrum(core->hw, &clk_ss);
> +
> +	clk_pm_runtime_put(core);
unlock:

> +	clk_prepare_unlock();
> +fail:
> +	return ret;
> +}

regards,
dan carpenter

