Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B851805E
	for <imx@lists.linux.dev>; Mon, 24 Jun 2024 09:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719219933; cv=none; b=sc0iBN2ZjFYZFeOZG0RN55n70uxa2AohtdTmte0G9zdMciAe2lUqpen9I0wmCdIMf+JHrsaa9PpWxOLPJ1aKaHXk67Emb2jKdcKicJCM7Tz+Kg2+Z+tLgXhsK/Y3JB0DBpbyd9jKYiLUeCl8tF/OumBgxCAO243vE/MlkS7JwK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719219933; c=relaxed/simple;
	bh=y3HVBK/bRtl4XQzsyLB6r9HO/3l+Qjcw4dVPw8dtz3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDzXEEr84+gDjVPFPAEsoE/RdHymMbmd9cNPgfbvT1Obwvl5g6gF0XBzf0hQ7gcWRHWccuYyhvk4GDgqZFtD+hMC3y9wgEk/rRsdL/O6VdGYjo9FFPOxQ3t8m+xtgWxnp6Pqg15oHfwUQN2w+u+Wwn9l8rMLSyAt3kjg2seAVzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OYC3fAE/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OYC3fAE/"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-421bb51d81aso33833475e9.3
        for <imx@lists.linux.dev>; Mon, 24 Jun 2024 02:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719219930; x=1719824730; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eX7dckm9u+f+lO2ZsVHDkfJuiV4Rz3AqkMPKl5tZVVE=;
        b=OYC3fAE/tmy0L7lSaIsIfun/eIw8SrMPgAETb4dJR71flqWtWAFs3/gEJd7c6Ldi5a
         YdtnzAcD4M9g/a3GtHH/WRn0qT7+Lf6W1qlxomj3u7Lw7Gp/zksW0qknFVpcR62f8pCn
         eJ0K1w6kAj3C86zshSqy38uRoUzGStUN9FhAz3krBadsV6UlvG96Yrgf35BtqW7106zs
         JsLWDYBGNP4k6rOq+RBqZlPPdUgvsi5JIqzvUAHZ842UV+W6H1dJMgLSlzQZPT2DLTTy
         j2CF6B96Vs7M9BTBPXxDfi/E006Kms6RqqG9kmoLJ8y5KtAHtxUqENuPUlWT5AyCk3Oq
         bxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719219930; x=1719824730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eX7dckm9u+f+lO2ZsVHDkfJuiV4Rz3AqkMPKl5tZVVE=;
        b=cfgYowGSuF84MElAL2wc6HQR30giaWnQeFicnvnJnURqHTOIsLIjHGzRbhVScFtFLd
         AGXhL4n+d6QB6wti1iiU0fBYyXwPtUQPLDOdjG+w9jgovmeXgeoVUNUFGwcoR8GlfAuQ
         QjI4OGFsExMVTUlkBHfPI+JKvo31sVpj04CG850JbuoOJI24knGqm/jA0mf9/XjfbtO0
         vEVYDx7fZ5vr8rll6HO/GtXpj0qYv6swuyz3ir8JkHQUF1XJka2zci/lvCezkwOvQzgq
         FBEWHOt4MwVL4VnOGjoJITDRwwbvrVMzjCNFvkt8cFjqIEYt2heG0w+iPkg+WIABfxkw
         TTLA==
X-Forwarded-Encrypted: i=1; AJvYcCX/neE4jUevLLB11UrKecyRYJS3aCML3cWtvxKPJ0DWoozqYenPfI8JiwOqgp4dnYzrq4hlzdkv2NgmCJXFgJueMPXQ
X-Gm-Message-State: AOJu0Yz0eHxz1FOkAf3kd81yAml8JkFg5KolqlSeaCUNkW87kkIdRrMK
	1Iz86dZfvSSShOhJxYZe5mDj+GuScoqRdhUib74sOf1ZJTzOgKDOdS0rddyXpEc=
X-Google-Smtp-Source: AGHT+IFCAyqdfSpwc+KusHgg6PUb11/WZSWULyobNuTMHB2rRr+sqQCcDWWC19uzTo3m9BDnUqC8tA==
X-Received: by 2002:a05:6000:1847:b0:366:ead3:37cd with SMTP id ffacd0b85a97d-366ead33bc6mr3176993f8f.28.1719219930407;
        Mon, 24 Jun 2024 02:05:30 -0700 (PDT)
Received: from linaro.org ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366383f6da6sm9400270f8f.12.2024.06.24.02.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:05:30 -0700 (PDT)
Date: Mon, 24 Jun 2024 12:05:28 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] clk: imx: composite-7ulp: Use NULL instead of 0
Message-ID: <Znk22OwMJ7oKDLXo@linaro.org>
References: <20240624024351.488492-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624024351.488492-1-peng.fan@oss.nxp.com>

On 24-06-24 10:43:51, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Address the sparse warnings "
> sparse warnings: (new ones prefixed by >>)
> >> drivers/clk/imx/clk-composite-7ulp.c:85:24: sparse: sparse:
> Using plain integer as NULL pointer
> "
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202406220536.JnAncjqz-lkp@intel.com/
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> 
> V1:
>  Since the orignal patch is still in linux-next tree, so not add fixes tag
> 
>  drivers/clk/imx/clk-composite-7ulp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-composite-7ulp.c b/drivers/clk/imx/clk-composite-7ulp.c
> index db7f40b07d1a..8ed2e0ad2769 100644
> --- a/drivers/clk/imx/clk-composite-7ulp.c
> +++ b/drivers/clk/imx/clk-composite-7ulp.c
> @@ -82,7 +82,7 @@ static struct clk_hw *imx_ulp_clk_hw_composite(const char *name,
>  	val = readl(reg);
>  	if (!(val & PCG_PR_MASK)) {
>  		pr_info("PCC PR is 0 for clk:%s, bypass\n", name);
> -		return 0;
> +		return NULL;
>  	}
>  
>  	if (mux_present) {
> -- 
> 2.37.1
> 
