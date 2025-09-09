Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66FE33EB14
	for <imx@lists.linux.dev>; Tue,  9 Sep 2025 16:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757434558; cv=none; b=g81lpsjcY8kKbCzgNEZmInyO7yHLbcEa1ckIuBAWWyGBrj6KnU67+i11XsA4TpZrqXLAVzOdBZf2zOcX9P5E/bYdjCFnWvmiHNTW7+jE3cQgD9PZiAbPfRAcCJfF7YKkRE49iwR0RuImvERG2ya3HOeKksof3CFWShLFHIvyuF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757434558; c=relaxed/simple;
	bh=7Z15smc22BjF1dnNwqHWT4Q61K0HQySupMCHoRvenSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEpMWJJWK4CL9QsuaZxo10ZC+gV6Z7YqMpBbzQlPR/rcSxUhkd4nVk07zMdzR1GW47G7FJ7kSkh8Du75PPM5/jyqeIN/jgG16Xyo3jTjA1jHVbiqUF/0g6Iu58RsmUO5yRguYgx+giZUnoun6ZrsufDmVijSalRm0tmYZGbPuQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NFgw8GBu; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NFgw8GBu"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7728815e639so3169083b3a.1
        for <imx@lists.linux.dev>; Tue, 09 Sep 2025 09:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757434555; x=1758039355; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UEiPxhZen3QXZAobK2Ga2iD+ttNiESa3yuRWHgPHltc=;
        b=NFgw8GBusxyvBCIDP+bSYP1i0uTyRyqNttxhuD/PPnkY730h5t4P4I0aoUW0pVxrr3
         D60uw/8VLid3pOoMZ2IibqB5AFzVyJSxEnyn3M2BwHJqZOIQsCsowD3oDT4wuyJdNeJb
         HEYfLn3WCb4odRcQpxmJS1W/vFf3dkzfahB3e34F2uU9huPnETmREy2D50DS5n9hAhZ8
         TSvSCgQRo4um756OrWNHWd1M9lYE7Qoe+dDYjNWZLtfLjZi6hOA8yy5G9oVad5CS+H5D
         H7sHt+h0O6RQds0ErDA6Qc1X7CSdUMRq1FZ2rTIzEEJObvIBq4W157BN3tM0amAizWmd
         L0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757434555; x=1758039355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEiPxhZen3QXZAobK2Ga2iD+ttNiESa3yuRWHgPHltc=;
        b=eLFWi74bvucP07d6Fd/uGBAKTstv6ynfVUWuQoWp4ZHg8818H381LhrEYDdV4Urc4p
         bdvJ40yYrJMBtNIT3X7asC2e8uptXB6qYmJm1ayW9UcB8N0/B6R1Pz7aYCHYvIgDwhPi
         U8MfPnmxWtc3jfRwDoZPJTdsgDRiUAn84dxqhiD18QFuXtti/McBVMTfS4avU+qb4CX2
         Z8u48yWdU4fosZqEg6TpJiLVujMNYOMBaT6XPO3UQ+hyGPoLTw8aKPp9mk0oFPE0CNcU
         ypRDTQwd5Bk6I437OuNYW5/ToJ+BzjeOf9tkh/kp6YRArYs9fC2FC4vvb0lTgaUxJgY8
         9wVw==
X-Forwarded-Encrypted: i=1; AJvYcCW/u07Ml++6oer2WZPJW5TmhV3K/6MlZet6zX7HLhaImBNg9mGtOHg6je/WZj0QlQLLmnk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVxgAKNcbiXhWNwP1HU2mTyN3yNqjtaLV1f6hhI71qxq2BJDQy
	1s5E4t+AV/LRKM8q3XlhX2l7RBWiVxnw4kBMiWHbkLt59Yeo3dwyvW7ej4KuA+vK7o4=
X-Gm-Gg: ASbGncuHR8M3p7IKKukvxJvbtMkFhHQx4B3YuKd/9yWh9RdEez17SwAU20sXA/lUF+y
	T62rLDeY1TxYeycYKigNEKq6ppKI/ZZ+BoyZn7OnOaI+ku8oAue2PIPVSoigkpbpDd/EI75Ya+h
	Wxv8O0W2yF2KBcPoGzuL+SRBt530izMO94Hm8ZvMppuoyBzyQcOz6GGP81zN84zcQZfeL99Ei2I
	NVXNcJQE8gvpQ7dF3JW1ePMHsXNqICAnxcZzsr/PsDDpTG6rmU375Oi56Wg4UYoKBu4EVzIsLCB
	EBxz/0Z7MYmC8QNXv/2S+XW0RJTLeRt/ROuI5qDLa9DIk9u9T1lqGbHsDAz0Q4GJ160hnf5SVqK
	yEMhxvDBK7mXmaTJNe86fWdpRBJJnIF6cnYsV19eZ447J2z7Pb56lahNrtydx65ulvSYXlLQTQX
	C3xX4PfFajtSQ1j3Ex4B2yAUrX2otV/1yUN0U=
X-Google-Smtp-Source: AGHT+IH55jBXQuGrRFWB7QFDwp0aHH2LNHjhqhfqYbAFcay2HL31leHRvKu+CE2zXWHS10Yrl/LklQ==
X-Received: by 2002:a17:902:e884:b0:248:811e:f873 with SMTP id d9443c01a7336-25170f37b15mr169800035ad.36.1757434554322;
        Tue, 09 Sep 2025 09:15:54 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e31e:18ea:d6c1:d90e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a27def96esm2062685ad.55.2025.09.09.09.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 09:15:53 -0700 (PDT)
Date: Tue, 9 Sep 2025 10:15:50 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] remoteproc: imx_rproc: Clean up after ops
 introduction
Message-ID: <aMBStih6Wi_isn2N@p14s>
References: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
 <20250908-imx-rproc-cleanup-v1-6-e838cb14436c@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908-imx-rproc-cleanup-v1-6-e838cb14436c@nxp.com>

On Mon, Sep 08, 2025 at 09:07:39PM +0800, Peng Fan wrote:
> With the switch-case in imx_rproc_{start,stop}{} removed, simplify
> the code logic by removing 'goto'. The last switch-case in
> imx_rproc_detect_mode() are no longer needed and can be removed.
> 
> This cleanup improves code readability and aligns with the new ops-based
> design.
> 
> No functional changes.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 25 +++++++------------------
>  1 file changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 5fa729f4286f6ac939357c32fef41d7d97e5f860..ed8395b097d07d02e5323550ff497819f9b95ad6 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -323,14 +323,11 @@ static int imx_rproc_start(struct rproc *rproc)
>  	if (ret)
>  		return ret;
>  
> -	if (dcfg->ops && dcfg->ops->start) {
> +	if (dcfg->ops && dcfg->ops->start)
>  		ret = dcfg->ops->start(rproc);
> -		goto start_ret;
> -	}
> -
> -	return -EOPNOTSUPP;
> +	else
> +		return -EOPNOTSUPP;


Here I would simply refactor this to:

        if (!dcfg->ops || !dcfg->ops_start)
                return -EONOTSUPP;

Otherwise this patchset is going in the right direction.

Thanks,
Mathieu

>  
> -start_ret:
>  	if (ret)
>  		dev_err(dev, "Failed to enable remote core!\n");
>  
> @@ -380,14 +377,11 @@ static int imx_rproc_stop(struct rproc *rproc)
>  	struct device *dev = priv->dev;
>  	int ret;
>  
> -	if (dcfg->ops && dcfg->ops->stop) {
> +	if (dcfg->ops && dcfg->ops->stop)
>  		ret = dcfg->ops->stop(rproc);
> -		goto stop_ret;
> -	}
> -
> -	return -EOPNOTSUPP;
> +	else
> +		return -EOPNOTSUPP;
>  
> -stop_ret:
>  	if (ret)
>  		dev_err(dev, "Failed to stop remote core\n");
>  	else
> @@ -1000,13 +994,8 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  	if (dcfg->ops && dcfg->ops->detect_mode)
>  		return dcfg->ops->detect_mode(priv->rproc);
>  
> -	switch (dcfg->method) {
> -	case IMX_RPROC_NONE:
> +	if (dcfg->method == IMX_RPROC_NONE)
>  		priv->rproc->state = RPROC_DETACHED;
> -		return 0;
> -	default:
> -		break;
> -	}
>  
>  	return 0;
>  }
> 
> -- 
> 2.37.1
> 
