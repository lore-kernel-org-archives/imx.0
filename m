Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6999202F93
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 06:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756794812; cv=none; b=US8yvaeOaHapNo8graSkvpmolyWajQxYVkgDpGqnFFt4DNM6Gx0cOUbr2jr7W4XdiiQK7t/OSMuUSdlvB4uu1SStODQ4CPkufPdBVS/9LHJFibqPHvNU3w3sGoouKjWPSHsEwKhtjDzQfSfHaJOdxQRc9QFsE20TNo02gl4huP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756794812; c=relaxed/simple;
	bh=OmgqGRS9lpyTrEFn41VfN0D8+8Pt7MBlL94ZsnDQY2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUiP0BmaSFLAd3LxkDl6cepv7if24cowMtnKwpmao4y95Gp7kkvReDoHGJTJfL3nzIHKkUsQSHk8NV3EgFsXL5atPqrdgV14ji7KP8p2KHhrHU1LtV2KN+Q5lyCm4kIJeWIkgJJa4xEwOYkkBZietboimbqgmT7pOpN0vYWfto4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sa9KXAKR; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sa9KXAKR"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3d19699240dso1952782f8f.1
        for <imx@lists.linux.dev>; Mon, 01 Sep 2025 23:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756794809; x=1757399609; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pZyWSfEXmR6en5hSqVkcdSusIQHGptuPDvKtOGXyj7g=;
        b=sa9KXAKRxx+7PhQ4UYqg/g5zV6d6CYMFaFBrx/sO9NJLb0+N7+pjdMbuvHCuIeAw0l
         ESZekHmj6GekeOg50IFXtZFJl1OdX62Rg47C9blgyCpqyJqSg3ondys0SjLLlDr6GIbz
         TS0HwusFjiv0WTvewxRDp8g22ct8nLhhbrdB0bbS2rFNShmXWRMsX0s45PfcVKvdeW5D
         PTMo8Z/ctbWbv9yLcxLcLklmCy5IDse1qs06WApjJgF6wTtPaV2m0ykUalTsOIApp0cV
         WTGA+a1g4FqZ753y1oDr/q1dikDmHPFqstUO6VyQCMGckOf1YzN+0ZccDfYGnFaaUdjy
         2U+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756794809; x=1757399609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZyWSfEXmR6en5hSqVkcdSusIQHGptuPDvKtOGXyj7g=;
        b=WTzXwUG5Ol5PTKWZQ3FeIaxOU3tOAmV5vkLHCsLBPBMvk62Sg6bxw08DTuBD2lWQwF
         dIeWUwjaphLhRzreo0zY6wIBRYS5UsmYS+d+e8QGJsfITOYpK9KGscIArBx8x25cfILp
         uHjml4CUgImgB0NExof8cZc8ADbsL6ls0jyAe2ucWMsR9OL0GR9pJ2g2omE1LDE4363d
         ocwS+jSoNG2F0JYJCtoHV6FmrUO87qoz4lfWpCDy9wobN6DrZRlLRG5LOR8iI82Tsdv+
         84Two7Gz+7BQN6sCDgNd8vIwqPFPLlKJB6k5UHHDQM1O4nSu0hzvDgVwDsNziUAlihvN
         MweA==
X-Forwarded-Encrypted: i=1; AJvYcCUveWCqRZB8dmvyGVNAGW7oEUOoHtcEaTx6xAH7kGtaFY5MfBR81mRYBgm7ojjXiJ3Kfaw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzT+PIfqEY6ypZ/Ffzk/PSv40FWmDSYLAyZ5abLLN6ueQSlzHLk
	/IPxirXXzYN2dmgRGT8PRPAhi8k4u8Je4jp4rRnf6Ojix322t1J75HS2vqZZtJmZBCl8JKEwFTc
	esP+M
X-Gm-Gg: ASbGncsLMbrVxSDjnFsXnYC4NzS6B2c2gC4dOyBIHvQz8Xzf2NCdc3pyZV4OuObooNi
	2alLiixwFgSNi3C8cgVuJT7urWJ/w4seSl3St7Qqp5N9TXVYKplnUumGYUZcTRp7FUlauuKivts
	DQZly3I3YiDbsbnBNMytAdIhfv9IodfOLbM9JPr4fj/HmOtA2RxuC1Qg79y72m53ALhzdxhzk4+
	PoB8uEiNL+p7WBxZUcKuqs7OYAB/SBo8EQVbWYK8hfa4h6llGYs/EPaSU3D/L2MqvDfX+hcu48p
	HFbpXebafliebxhasLS5KKh/M/dhQbP+CxMD0HZGHUhNL8dl+nO5ficI4Xf2MLV09o3kSuHIxcz
	qY+c+v9KcHxIwXRyMH/d9p/PbkqI=
X-Google-Smtp-Source: AGHT+IHKIWGa/m0pamORceoT/ghQw4RmChJ+ED2prLmd/mL7KJlk1waSR7kGX/s+IgenapL9sr29cg==
X-Received: by 2002:a05:6000:18af:b0:3d9:c661:88ec with SMTP id ffacd0b85a97d-3d9c661934emr1225669f8f.13.1756794808924;
        Mon, 01 Sep 2025 23:33:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cf33fba9fbsm18284186f8f.50.2025.09.01.23.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 23:33:28 -0700 (PDT)
Date: Tue, 2 Sep 2025 09:33:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: broonie@kernel.org, linux-sound@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Frank.Li@nxp.com, robh@kernel.org,
	laurentiu.mihalcea@nxp.com, waqar.hameed@axis.com,
	festevam@gmail.com, kernel@pengutronix.de, lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
Subject: Re: [PATCH] ASoC: SOF: imx: Fix devm_ioremap_resource check
Message-ID: <aLaPtf-eZ6sM47yV@stanley.mountain>
References: <20250901151513.286454-1-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901151513.286454-1-daniel.baluta@nxp.com>

On Mon, Sep 01, 2025 at 06:15:13PM +0300, Daniel Baluta wrote:
> devm_ioremap_resource does not return NULL on error
> but an error pointer so we need to use IS_ERR to check
> the return code.
> 
> Fixes: bc163baef570 ("ASoC: Use of_reserved_mem_region_to_resource() for "memory-region"")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  sound/soc/sof/imx/imx-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
> index 40debc541bf9..b3248c65215d 100644
> --- a/sound/soc/sof/imx/imx-common.c
> +++ b/sound/soc/sof/imx/imx-common.c
> @@ -316,7 +316,7 @@ static int imx_parse_ioremap_memory(struct snd_sof_dev *sdev)
>  		}
>  
>  		sdev->bar[blk_type] = devm_ioremap_resource(sdev->dev, res);
> -		if (!sdev->bar[blk_type])
> +		if (IS_ERR(sdev->bar[blk_type]))
>  			return dev_err_probe(sdev->dev,
>  					     -ENOMEM,

It's annoying that I didn't catch this bug.  It's because the error
pointer was stored in an array instead of a a "simple" variable.
Smatch does actually have a lower quality warning for this but I
wasn't reviewing them since that check had too many false positives.

I've done a little hack around, so this bug will be caught in the
future and it found a few other similar bugs which I've fixed as well.

regards,
dan carpenter

