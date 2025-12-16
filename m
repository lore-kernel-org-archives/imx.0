Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE3A2701DA
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 20:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765918427; cv=none; b=bDzSQPXzLPVecpLXzcHHUWmv0nDAhM+ZWiQzhuyU1TzhPBQ6EUN/wZUkZC5Hzs3X03PD5LQqVt2HDcfZRx7YWxzvtxumuR3D2zux5K4nV6Q/7bDIdonCpdrCtnDULbQlKMzHKibebicmZa+et1DZGvEcZIGxJBxQCBph6OXJiQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765918427; c=relaxed/simple;
	bh=SsDoW1F9IimdUbums/aXlP3kPueowrzS3rjSQAcbVNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YrwnYoZuhVDV9XA3lYtLNWil96MnhyEaTpKbYqj55lZL0DMz68Xmj/sFXAXm7EiXgL4rpbOV0BAa+HCoJ8jseAqcf1ArKMMIy90tRLakMH4zsv3SKlfQR7Txd8pW9aP7yM9lGZSUJ8a03o2pDhcGisZiDACeEyfDnP+7Nen07h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jbahtCRJ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jbahtCRJ"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so3684601b3a.2
        for <imx@lists.linux.dev>; Tue, 16 Dec 2025 12:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765918425; x=1766523225; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ypk7mUNq+7q06ZauQ3L/JgorQOHAAj+3MQphJ7ASbOU=;
        b=jbahtCRJj4TXtUxPF09Otn4BsjywBUlrujspxAlHrazSg4ONzUL70p1tM3vKz1aWvg
         /2nrPHqshN3/V3rJ7R/cXhdbnQFdH6u6/vrKeVaI9bwPHCLWK6qUZQgu+u5hWVijjbRX
         efxW4ExdIt8ZXutEyHdPhE4Nn/4mIQFEDPbZZngmSfF10lZuk9RPiDq2ga9fOkEnzkpV
         1dhgqafI6ci3H/zpKLBUce39KZM0gATIEb6jKaxzPu3ICJr5YyCfDHYqY7EFvL8wq1CS
         iosd/8T1FY5wHBXGJakN3j+GwmXudU6u3ZTu3Yx4aXZvXRBCvBiCNRcGppXnoZc3N48E
         T34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765918425; x=1766523225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ypk7mUNq+7q06ZauQ3L/JgorQOHAAj+3MQphJ7ASbOU=;
        b=FgNnbXnLvrnOkZdL2qSx9vIDrBHlBbX4wACkniYF1lNc20LgKQ3JMR1rHBmbcpracJ
         3LGkh+mgoHT9MYJNOUpStZGxfggrvt1M/nxI6mXpa/OHh6Jyzio4sdy12qDh0n1iPkNW
         wO1Kk9dlVXHPeUrdzaSD28fEC+656IpBFdYFwu6vQe7hQ/62SgqSks1AcJFxynQ85Xzh
         PofrAM5UmoHZERsZJ6gRCcWXSavfWag1PVg+5ADSvC8Ya3MlEYuhrWrakojqkTZgEFYq
         L8QMv497IE5IbjlyzSeAryAaLr8m3FefJemmC3B9C+7RXAEOXuxdv3nI0vliNaR8HWPJ
         Jlpg==
X-Forwarded-Encrypted: i=1; AJvYcCWGw8RneUF7LluhSy1QSBfUfXaE6sbs4KP19WIOgC3bMHwDQ/UcXwRhZygKOIa9MKTstoo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq8fV9ODJzLD4vv+d6obrBtgS9BDBPgw9+qFl+ick4aYMT7fZB
	9j8txfEkN50zFbUN2+KJutAFyd9sE4OctMzV+RtMcrhCpQNz5iuwFfjz7whbyDZF7gs=
X-Gm-Gg: AY/fxX6SOpKWtaVwlOBPS1+NkqyY7giySf1JfkLu8WvGK4SQ/A9nKupLwzukfRN6FFC
	ifOmD9hwIjxmPGykiyxCL0Yj4u9vKX8coXQRS07bH4av7Bx8CZruliUAeUL8GHyCFhJ/QqOb6Sz
	XxqcQEEYl17P7ocgSxMU9YuM48INPUco4GjxnRWaqHAddEn91+999mafLD53F+EOzRNKrQ6TkAw
	MKg5Oa/tsJZdiDDyYxAVr7kh1LrR4Qycab/wa0SBQ7Q1QznVgg41+IhpUqNcf8wcLDl15IA5ZuN
	EVK35wqDImRFtbKHGMoUAbCkx05LADo2Ixj4hC9BvfCHppwcOZq5ZRKH5IMrOZVKP6+FJTkQwrR
	yJnP55jP9JGgWEgFW37mUwVz3MPaEC6ccbbLmnBIsxcXR4U2bEE7d6FzqE8Ei2QrAaJ1ydnzg7f
	i8UOKOO+GdcFJyhQ==
X-Google-Smtp-Source: AGHT+IGF2rbTSI4Q4t7Hy49LQZnu0ZesdmocTDZQXJHCS+mdCGABBHatiVGmZZZWsxcTaHxupGoA3w==
X-Received: by 2002:a05:6a00:a118:b0:7e8:4587:e8c2 with SMTP id d2e1a72fcca58-7f669898f41mr16662303b3a.53.1765918425228;
        Tue, 16 Dec 2025 12:53:45 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ba5d:91e2:900a:fb01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fcb5c6d9acsm482316b3a.0.2025.12.16.12.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 12:53:44 -0800 (PST)
Date: Tue, 16 Dec 2025 13:53:42 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com
Subject: Re: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-table"
 check
Message-ID: <aUHG1svhft249rn8@p14s>
References: <20251208233302.684139-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208233302.684139-1-shenwei.wang@nxp.com>

On Mon, Dec 08, 2025 at 05:33:02PM -0600, Shenwei Wang wrote:
> The resource name may include an address suffix, for example:
> rsc-table@1fff8000.
> 
> To handle such cases, use strstarts() instead of strcmp() when checking
> for "rsc-table".
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 3be8790c14a2..33f21ab24c92 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -694,7 +694,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  		}
>  		priv->mem[b].sys_addr = res.start;
>  		priv->mem[b].size = resource_size(&res);
> -		if (!strcmp(res.name, "rsc-table"))
> +		if (strstarts(res.name, "rsc-table"))
>  			priv->rsc_table = priv->mem[b].cpu_addr;
>  		b++;
>  	}
> -- 
> 2.43.0
> 
