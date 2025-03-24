Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA1F26158E
	for <imx@lists.linux.dev>; Mon, 24 Mar 2025 16:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742832664; cv=none; b=vBtREOSwhtxcdtJfF20+vGYWCwEdZy7F9/IzKoQmQyvEuU6iw6iKmne0TIxH1zpeqEs7MPwQOpCQ9IZvcdyxhtrSQ5EuUNgFyqwEqmw04/aOMhag44R9RmKvP43GfvsUxGTD05gIN0TTYJZdrQaeJYE22ULpeH1gI38dMbZyXKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742832664; c=relaxed/simple;
	bh=RXGsw/IIZ2cQK4vDV2zmSSo3gezBRdYOcUXmqa2QnfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/7DH9gK0c0BQPGzqIujSXpEk11FXYHPoX1B1MPDAEtLeRqKDCoHPMdnv8JpJH8JYOZMDlqCbsRcGxYpNB69xMVjt46QVK2lrAbKAS5Vf6MpXOKx1ozCwkMnEu5lumQYVnv0nQotkBr3kB4yvNZgoPdYnpsVmkMjj2EpEK6lz24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ostu+JeU; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ostu+JeU"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-227914acd20so42282225ad.1
        for <imx@lists.linux.dev>; Mon, 24 Mar 2025 09:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742832662; x=1743437462; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r5vgk90XdjvD//xy5cJrxojmSgOgyA8sd6HdwMa8sAQ=;
        b=ostu+JeUZ/A13yjVWuL0mGvVJKGwb4Ip5wQo+pWcGm1hay97EGYNVuX6PQOusMgi/T
         4AipiesHKgRq93viOZ4SqGcG4E4SJ/IE2QUO3juROGfdG4i/kTOarrt85yKXQdqnB0Kr
         mjL0DmCCDE+aTLA8NJ6Yaep8TpC9nsX41PP/1w3Xal6pVP953A6DYVaBQs7qD28grxPI
         LLgS2TYQy86e4/TZtUZWJNnCy61vNbiXH52H3mDvNX17mM5W1ABT/Ace4pkBQ71tqWf5
         buZbz/b4M1ZduO2GCypO1itjATq7xv6TS0GVCkjFfmpqBRhotZ/1fQ1kwpzPxJYNvYwZ
         TeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742832662; x=1743437462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5vgk90XdjvD//xy5cJrxojmSgOgyA8sd6HdwMa8sAQ=;
        b=PZLx06yKrOkQknHe2PQgq6VJwug1kAV2ihVQVpOpesEiZcOQfgS65orxCkwyVdiQ+B
         QH/iuO2hqUmxhs8TuipREIuKRurfrNM1RBPsZ8x/VyDnLg5NIe5FfCT2hQUENxE4gjMZ
         ZaZhMv8fbcUctIYqoIW3tr16YE4rwOr+J2wlGWcQ8qyU6akOoxaPqMGmg3GBwptP+nNL
         1KMeykN0PKWlDSWMdx5kmRe+K+6//zt7JaTDDCl0xDWcL9UzmOK+0rxVtEI1Glmo1Tue
         41xx/Ua/GDm5wrTYXfe8YDZYIYEbt9WzkMQCqnl8OOnZRNVX1j0NZjoJPIxAQaC3mSsY
         0b3g==
X-Forwarded-Encrypted: i=1; AJvYcCV7jDks/FIBPEACeFAj1gHnn+4fBM+I4DGIckb2xEcg/bDl3SY3VvkpUJKHplimizzqKo8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQyFqn1ZgLP8k1X5s54VxmNnfh0/Uw00YUl7qtGIyebLZkrwTj
	hTayVoU74J+ZLFGBEEEr/PHJUYvJLWRckwHNEH/LTTOY5ALRiVnu/Vb7JFt/GzU=
X-Gm-Gg: ASbGncuLLXIUnfBCDC0BgzhBhOXPU4UYmdpoe8oi0UwnNQObdrptAuo3U09ElfSMuih
	V54p3RkVElFZxFag23azN4EUrGUAd9OlH4GSAKw3BplnL/LR/++s/ny0vtWpd/8O7Jg69agnjRt
	hKZc8lGXg4k6xf9FQ9MqV3tV6iF56k0fRuvuhKFH/GWKH45AsYtE1gYzdF4Yum84EcKi4XlCdA5
	T0JV/fGVhTstcc/1yXNLIYP9Uvc6fi59HT5WSngxwW1w+8QVE14rGjYGk3MUEzzNxgvlhK3CVxr
	L1K7otIJGaEGI41A32tzWYWsoxfSMd/zmJrEp9TggsRo5axD
X-Google-Smtp-Source: AGHT+IEUktCIjYcV/UliuBFwLd7ktQyPdWhUBdENSBLSBk2b6FUGTx7qO3Kt+i5xGhua1KlGlHJUIg==
X-Received: by 2002:a05:6a00:4648:b0:736:491b:5370 with SMTP id d2e1a72fcca58-73905a28b22mr22284141b3a.10.1742832661421;
        Mon, 24 Mar 2025 09:11:01 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1300:9465:2fd2:e14f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390614afb5sm8086630b3a.121.2025.03.24.09.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:11:00 -0700 (PDT)
Date: Mon, 24 Mar 2025 10:10:57 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"S.J. Wang" <shengjiu.wang@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mpuaudiosw <Mpuaudiosw@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2] remoteproc: imx_dsp_rproc: Add support for
 DSP-specific features
Message-ID: <Z-GEEVMXUysX1Hhu@p14s>
References: <20250318215007.2109726-1-iuliana.prodan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318215007.2109726-1-iuliana.prodan@oss.nxp.com>

Good day Iuliana,

On Tue, Mar 18, 2025 at 11:50:07PM +0200, Iuliana Prodan (OSS) wrote:
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
> 
> Some DSP firmware requires a FW_READY signal before proceeding, while
> others do not.
> Therefore, add support to handle i.MX DSP-specific features.
> 
> Implement handle_rsc callback to handle resource table parsing and to
> process DSP-specific resource, to determine if waiting is needed.
> 
> Update imx_dsp_rproc_start() to handle this condition accordingly.
> 
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
> Changes in v2:
> - Reviews from Mathieu Poirier:
>   - Use vendor-specific resource table entry.
>   - Implement resource handler specific to the i.MX DSP.
> - Revise commit message to include recent updates.
> - Link to v1: https://lore.kernel.org/all/20250305123923.514386-1-iuliana.prodan@oss.nxp.com/
> 
>  drivers/remoteproc/imx_dsp_rproc.c | 59 +++++++++++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index b9bb15970966..1729bfbc602e 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -35,9 +35,17 @@ module_param_named(no_mailboxes, no_mailboxes, int, 0644);
>  MODULE_PARM_DESC(no_mailboxes,
>  		 "There is no mailbox between cores, so ignore remote proc reply after start, default is 0 (off).");
>  
> +/* Flag indicating that the remote is up and running */
>  #define REMOTE_IS_READY				BIT(0)
> +/* Flag indicating that the host should wait for a firmware-ready response */
> +#define HOST_WAIT_FW_READY			BIT(1)

Right now the default behavior is to wait for a ready message from the remote
processor.  We need to keep this implementation in order to remain backward
compatible with older firwmare images.  As such the above should be:

#define HOST_DONT_WAIT_FW_READY			BIT(1)

>  #define REMOTE_READY_WAIT_MAX_RETRIES		500
>  
> +/* This flag is set in the DSP resource table's features field to indicate
> + * that the firmware requires the host to wait for a FW_READY response.
> + */
> +#define WAIT_FW_READY				BIT(0)
> +
>  /* att flags */
>  /* DSP own area */
>  #define ATT_OWN					BIT(31)
> @@ -136,6 +144,19 @@ struct imx_dsp_rproc_dcfg {
>  	int (*reset)(struct imx_dsp_rproc *priv);
>  };
>  
> +/**
> + * struct fw_rsc_imx_dsp - i.MX DSP specific info
> + * @len: length of the resource entry
> + * @features: feature flags supported by the i.MX DSP firmware
> + *
> + * This represents a DSP-specific resource in the firmware's
> + * resource table, providing information on supported features.
> + */
> +struct fw_rsc_imx_dsp {
> +	uint32_t len;
> +	uint32_t features;
> +};
> +

This needs a version field and magic number.  Have a look at what Xilinx did for
inspiration [1] (both magic and complement of the magic number).  You will also
need a "__packed" attribute for the structure.

[1].
https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/xlnx_r5_remoteproc.c#L103

>  static const struct imx_rproc_att imx_dsp_rproc_att_imx8qm[] = {
>  	/* dev addr , sys addr  , size	    , flags */
>  	{ 0x596e8000, 0x556e8000, 0x00008000, ATT_OWN },
> @@ -300,6 +321,39 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
>  	return -ETIMEDOUT;
>  }
>  
> +/**
> + * imx_dsp_rproc_handle_rsc() - Handle DSP-specific resource table entries
> + * @rproc: remote processor instance
> + * @rsc_type: resource type identifier
> + * @rsc: pointer to the resource entry
> + * @offset: offset of the resource entry
> + * @avail: available space in the resource table
> + *
> + * Parse the DSP-specific resource entry and update flags accordingly.
> + * If the WAIT_FW_READY feature is set, the host must wait for the firmware
> + * to signal readiness before proceeding with execution.
> + *
> + * Return: RSC_HANDLED if processed successfully, RSC_IGNORED otherwise.
> + */
> +static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
> +				    void *rsc, int offset, int avail)
> +{
> +	struct imx_dsp_rproc *priv = rproc->priv;
> +	struct fw_rsc_imx_dsp *imx_dsp_rsc = rsc;
> +
> +	if (!imx_dsp_rsc || imx_dsp_rsc->len != sizeof(imx_dsp_rsc->features)) {
> +		priv->flags |= HOST_WAIT_FW_READY;

Unless I am missing something, this way of enforcing the default behavior won't
work because in older images, function imx_dsp_rproc_handle_rsc() will never be
called.

To fix this I suggest renaming HOST_WAIT_FW_READY to
HOST_DONT_WAIT_FOR_FW_READY.  That way the host can skip waiting for a FW ready
message only when it was specifically told to do so.

Thanks,
Mathieu

> +		return RSC_IGNORED;
> +	}
> +
> +	if (imx_dsp_rsc->features & WAIT_FW_READY)
> +		priv->flags |= HOST_WAIT_FW_READY;
> +	else
> +		priv->flags &= ~HOST_WAIT_FW_READY;
> +
> +	return RSC_HANDLED;
> +}
> +
>  /*
>   * Start function for rproc_ops
>   *
> @@ -335,8 +389,8 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>  
>  	if (ret)
>  		dev_err(dev, "Failed to enable remote core!\n");
> -	else
> -		ret = imx_dsp_rproc_ready(rproc);
> +	else if (priv->flags & HOST_WAIT_FW_READY)
> +		return imx_dsp_rproc_ready(rproc);
>  
>  	return ret;
>  }
> @@ -936,6 +990,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
>  	.kick		= imx_dsp_rproc_kick,
>  	.load		= imx_dsp_rproc_elf_load_segments,
>  	.parse_fw	= imx_dsp_rproc_parse_fw,
> +	.handle_rsc	= imx_dsp_rproc_handle_rsc,
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>  	.sanity_check	= rproc_elf_sanity_check,
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
> -- 
> 2.25.1
> 
