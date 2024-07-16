Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0FCD53B
	for <imx@lists.linux.dev>; Tue, 16 Jul 2024 15:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721144322; cv=none; b=RI0mGxZ7TFT/Mqsqmmzltbj7uMrXYh2DQrI6knUhkKga0+aAHihZ6Qvi8s8doFqQvNGM49FtitgJ7znsy/i5ErLCBdzBM1g2uSwXvbuUJsZt37neju3HHoLJ64LhjDNc9iWIhOQYJUHUPBNInjB5a7TrNpKfYWL87xx8PpxOqAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721144322; c=relaxed/simple;
	bh=wFRmeqZAChY0vBaEki4uMRrWLGdelkkOLKoOuO9tiyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0GMgwsc3ln1ToRsLmP+EDYsI7UO5lQ//TK/OwlRbU90GSPIsPw9qM7UNaC4UOOirfIrzpmCGreXIHiLHGdjQe1iWig2fMzVRe3gONtIUmc9Y1oYsThg/cDB6JSkY0+FrlgQhJmNHBxTXEQKTUOhGwet4K180es8IRinFwSSYi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jDQp/DDc; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jDQp/DDc"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7515437ff16so4080189a12.2
        for <imx@lists.linux.dev>; Tue, 16 Jul 2024 08:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721144320; x=1721749120; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IRJWJNrzc2jygwsryIDGVRubrMYo6CPq74PglfU61vc=;
        b=jDQp/DDcYea0Glx/3PefvUrsFd53c45x1Ttu/BDCgbcroYRzQIJluqu4ZDcZfh9OeL
         hmpwPpE5+69QhmI9LiZw0fJN504NLBOTdBpiz6bFewPK220MTPVG8JAm1APy32g9Fp9x
         y6GEmfeNaYXYdg+bVfgKmWIH2nJL1uQM+uhd5mUUddtEOge5wKKt5HjMrdPf0Jus46go
         8Umvick8PpDDlEBpNTG0VvN4elMrkIH43987QGYGSzyGOtM+ka0UVfPHgOD3IJWdipSv
         8xq9UztceZrevNgN3FyBSQmagcKm+s83l9MzDPpgtyCPDNUwloOWciNmkWfTg5MAjocN
         iu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721144320; x=1721749120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRJWJNrzc2jygwsryIDGVRubrMYo6CPq74PglfU61vc=;
        b=V3m/k2iDMzYWuvOO2FkzDKV0RKKxxyhht1hJWeKyk6FyblGBWbWr7+W3tOn0WaRrKf
         L5Vu2vmMGW86I7pCKkmpXw3Ce2qStQgvNfOcyx1HWVW/EFmCaqFn0Rw4AcWmDHwuC0SZ
         NcGLrejgJevxiWhucAz5KORf1aqnuWyA1+TntsXVmm9A+vbj54+o+U5LjcJhTU32bf6h
         /PjL382Rw1+iJWEZTYy01ksSOw50mXjOgpc+dvBVGMvfVpsPWNDxTU5nuzZczV3NmzE3
         D5M1JGKRW2j2FbFBwFsDzd2Sh8zrdid4sYIkA0OsOKqlkusudWh+DX6aofXxa+SaL+xy
         wcQg==
X-Forwarded-Encrypted: i=1; AJvYcCWVAK2LGbdTkcRM6Ec2WVGKkIE5/eRfX8oFvEulLvIq0UHKiu/0HDGKwVCaEBptIyCq2gB6sb0yfRJl16MIU2qFvj2a
X-Gm-Message-State: AOJu0YyyQKCl8vO6KSfdfvpj/joXLbywK3CEMyirprvRcJa+Xtlf6q1i
	gabcRUontBv0/Qmo0TEqwz5FBtmZauaVbCvkPfyoEqxlIaWQHgXtnk8tXziGN9Q=
X-Google-Smtp-Source: AGHT+IEDSWIUtRywATQg3qAhHcdwjWZgT7tZwoG/YQpCa+cTCsrStW9SpatZa0yN+LXWMK82f6rs3Q==
X-Received: by 2002:a05:6a20:3d8c:b0:1c0:f097:4eb8 with SMTP id adf61e73a8af0-1c3f1273b1emr3243135637.35.1721144319905;
        Tue, 16 Jul 2024 08:38:39 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5d01:167d:9cf4:148e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cacd3f10dfsm8466569a91.17.2024.07.16.08.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 08:38:39 -0700 (PDT)
Date: Tue, 16 Jul 2024 09:38:36 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/6] remoteproc: imx_rproc: initialize workqueue earlier
Message-ID: <ZpaT/Ioa9l5LBT5Q@p14s>
References: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
 <20240712-imx_rproc-v1-3-7bcf6732d328@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712-imx_rproc-v1-3-7bcf6732d328@nxp.com>

On Fri, Jul 12, 2024 at 04:34:56PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Initialize workqueue before requesting mailbox channel, otherwise if
> mailbox interrupt comes before workqueue ready, the imx_rproc_rx_callback
> will trigger issue.
> 
> Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>

All reviews should be done publicly - please remove here and for all the other
patches.

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 48c48b53a3aa..9e99bb27c033 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1087,6 +1087,8 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	}
>  
> +	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
> +

There should be a "Fixes:" tag on this patch.

>  	ret = imx_rproc_xtr_mbox_init(rproc);
>  	if (ret)
>  		goto err_put_wkq;
> @@ -1105,8 +1107,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_put_scu;
>  
> -	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
> -
>  	if (rproc->state != RPROC_DETACHED)
>  		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
>  
> 
> -- 
> 2.37.1
> 
