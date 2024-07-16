Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B207B19B3F7
	for <imx@lists.linux.dev>; Tue, 16 Jul 2024 15:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721143014; cv=none; b=bWnkE0EMCMoM14WnqDzr4YLaqZqKvwHArWrGL4A9uv8/tLbjSbM21xY1RICNJ3phDOBBZE7veq0E1H/zBPvr/OBjQOfJ6DRhPR0nEtS5X9XuNAGtu6egoS/2n4HJBV8R1IP16Q+OHc9LbQubUBpM41MheyiTviYLtd9dNYkFMKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721143014; c=relaxed/simple;
	bh=QdugAtkkmtyw1j2n4aC/U95y3fRjs/Qu67PPL3gShUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqcp1DP1c6EsjspJAKcWE0Z+BmD7LI7V1frHaKXHruF5mfiS/gXlOnWyUGt7r6dvBsIm2hmu9pKY1GasGhSGU/abVmzAIkhhkoxZ7OMMdcDiIz5Kzo3hhe9IKy4C7GEvF7knyvQWMqKF5OW/2NxAj8CuG5ssy2EbYYOgfrXf9FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vx0le+Zt; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vx0le+Zt"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70cdc91d25dso345270b3a.0
        for <imx@lists.linux.dev>; Tue, 16 Jul 2024 08:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721143012; x=1721747812; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q+oBquCC6Yqm7bL0Kr3aJX57Dgk/RB3bFu+I79pPnBY=;
        b=Vx0le+ZtTJ/R0kqNdPseDoD3P7AHkuPtA26cNJcl5bwt9vSC9UrAUFyyZrVyQDylWA
         KNsL0u7AgfGO8WD+6AVtlwq4ty392MCQtf4p5StoDyV8VpmzK+xoDVeoZWe0e2wnhZIs
         IWMuGGeKjoqSpjARfXjVzDYSkkkewZSadWnv7oom8cFuDNn90ObmrBsUTbKS1Jyj4T8a
         8CZ2IvjGzFbT5OmRS9++wbWdjmli+cAPssfwtJyXudYvxQP6aOoao62RO76FLTmcQSKM
         tT3+ypqBNiHqnnf3bgZ0Utn8gVuba6DmjcYltL9zf+BAOaRu9srMFVmZWJNOnbBwaUdP
         b5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721143012; x=1721747812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+oBquCC6Yqm7bL0Kr3aJX57Dgk/RB3bFu+I79pPnBY=;
        b=IdcHbaiFYhvRX5cVEDso2iJzl+mTT8x6R8j0QJw3JRKgUAXMqPsoOpv7JFW7vH7ZQB
         +r2jj6fzQJJkO7Fw/dB7lwVfgjbvoVIR7etJhInKaYlG8MEHBCQpvDIoN7eu+KZHmkhf
         YvFtwZaVWQF4ZfWnm0OU8ClCt8umIzmi6Lx9SNRewDrTIdpwj9oH/ErXkT7MlwqjiR9c
         VFPnl+IVaipp6y7etx1ytYO50g/MJdk8GpNcxVSaKn3Drvo2ZXrWLDP1QYDgr6Sge/Uf
         tkiF7rPwbEdpxsL8Oik2cItE0JnzgNZmUDM6M23WhjYOZbs763MkFTgO8t2htRZLKJDk
         Mhqg==
X-Forwarded-Encrypted: i=1; AJvYcCX5KSHNrR5DJfHq8m/cPOJ1rB6ZiK1hFb46N1vtkKOqzO+fWlZqHKbXM11tlnHF2UcsnbBrM3DUmhaW11s/U5Q8XemH
X-Gm-Message-State: AOJu0YyTSAG2/Tc9gZaL1haruEAvgcpjUnb5iy+kr585aVCYJde0X68A
	PcsBvtAposGHE8QwewMcIltzUN50ngqp23P8V3Muwuqh85f3H6fmJ1b+xGqcAWM=
X-Google-Smtp-Source: AGHT+IHK38fZflwQZj+0YBMxhcUoqsY5qUO9G0uXW0RmTRimetE4YldMaHWfupwsPvdp5aX1P8Rc/w==
X-Received: by 2002:a05:6a00:238c:b0:6ec:f2e7:21a8 with SMTP id d2e1a72fcca58-70c2e9942e1mr3475412b3a.21.1721143011828;
        Tue, 16 Jul 2024 08:16:51 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5d01:167d:9cf4:148e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ec7da19sm6413009b3a.133.2024.07.16.08.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 08:16:51 -0700 (PDT)
Date: Tue, 16 Jul 2024 09:16:48 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, marex@denx.de,
	iuliana.prodan@nxp.com, daniel.baluta@nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, Terry Lv <terry.lv@nxp.com>
Subject: Re: [PATCH 1/6] remoteproc: imx_rproc: correct ddr alias for i.MX8M
Message-ID: <ZpaO4FDEYoA0cpae@p14s>
References: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
 <20240712-imx_rproc-v1-1-7bcf6732d328@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712-imx_rproc-v1-1-7bcf6732d328@nxp.com>

Good morning,

On Fri, Jul 12, 2024 at 04:34:54PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The DDR Alias address should be 0x40000000 according to RM, so correct
> it.
> 
> Fixes: 4ab8f9607aad ("remoteproc: imx_rproc: support i.MX8MQ/M")

This commit was merged more than 3 years ago...  I don't see how such a blatant
mistake could have survived this long without causing problems or being noticed.
On top of things checkpatch gives me a warning.

> Reported-by: Terry Lv <terry.lv@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 144c8e9a642e..3c8b64db8823 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -210,7 +210,7 @@ static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
>  	/* QSPI Code - alias */
>  	{ 0x08000000, 0x08000000, 0x08000000, 0 },
>  	/* DDR (Code) - alias */
> -	{ 0x10000000, 0x80000000, 0x0FFE0000, 0 },
> +	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },

Without access to HW or the documentation there is no way for me to assess the
validity of this patch.  Marek, Iuliana and Daniel - please review and test this
patch.

Thanks,
Mathieu

>  	/* TCML */
>  	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN  | ATT_IOMEM},
>  	/* TCMU */
> 
> -- 
> 2.37.1
> 
