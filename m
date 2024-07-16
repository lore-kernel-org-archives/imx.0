Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B491DA4D
	for <imx@lists.linux.dev>; Tue, 16 Jul 2024 15:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721144998; cv=none; b=TksNe9PbcvtXprYzzng4ifY37w4xG3un9GhZZA6J9Awzt+i6DTMs3YIG/FRP4iUS37fYElBsj7XyoZ2ECXMVLRTYbprm8F3AJKobrRRp5AkfNoePIrWlf6H9C8wqVlShoZdbZTXDnHlHUn9vIND8eKx1NRKaRi07h1OFs2I8NzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721144998; c=relaxed/simple;
	bh=J6Na8smUBNkvy7o5hOuNXKrDIV0L07cB3uZ5C3y7QgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NyCaIacGZoxuPZXckxMYpaxFZdIUZm2tS8iS0LeabMeOxOLS175GPSg0cYd30FMcVebsE1DKumsJXkbMu+dFxsIhW1SeD7I8YJ3IVMbAWw+/7T9CZIebUPE00oQzzYOODVygXq/MdhVQVpQWpyOGWaA88nq/pxbDv0XdqKGJZ1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ABSTFYoB; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ABSTFYoB"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70af22a9c19so4222753b3a.2
        for <imx@lists.linux.dev>; Tue, 16 Jul 2024 08:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721144996; x=1721749796; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qmk5Z4IT/WUXoxm4I3cPr8Nj8s2eF45loLGWh3Zjhdk=;
        b=ABSTFYoBj0K2oBMwVct0SAWOR+7NNxwQMqKQmAkK5p5jf3MVrxYNyJczHC26bonE2z
         547S14uLP5JQWwRjVYtXLaj+Ar/fR3jzyuSzNR4uytiavGucGOarLcNX6wpMUFoAsTfN
         ZgtolN7YbVXZ7BZGf0VCIwVub/gWDt36zJP+YOL/1CdrW5+NxEpkPej3WsPWlGa1NHgD
         ueJT+0+/T3J/VxneBiqwGjNbaNDtLu61Gv3baPVSC2BDF9fQibSXZQgvT/R4/TBSlmq3
         rHPSOVTmVYQeOePZJnYDNH0/L8t7scYa+HLqaadnkwVMQtETgzfpI06c472J0m726XMR
         0nOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721144996; x=1721749796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qmk5Z4IT/WUXoxm4I3cPr8Nj8s2eF45loLGWh3Zjhdk=;
        b=NHeL64tf46PaKMC1SBRXuhAZ/7k0WNFMWEv/ASx/aAv4vOr6Q6p0renAsNWczS9sOh
         Chn8TOPBL24orhFLOiN7FFXSFpNq8l/pDhc5KmsazLEMdlOYZPZDjLEVTrl+q70uLslo
         m2/8kt95qihlPzAlKGbuk00O0CE6wf/mSHtHEIM2xVE0VUT1pOZxrN2b5XYdbbjl6S8l
         JYLnDv5B3bF6x4MSNWQ+N3fhkC/BoJMJsnXGH8bIsqC116sdYOZsxd3descQS3GS+Y1e
         zIBaIke6GXpCYU2uEmZ6Zx/1yhcNA/yCoy/UXcpD8TSc1RdzIEKjRSTf53zSis7zbuq/
         GrDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6f/aLkMYzRh92risBYD+c6QmFU98VcY4AHef3tRHs3dXA9A+lYD9dq6yjL6h7v++0a2d2tpIBuWomBHijYjhdXrHz
X-Gm-Message-State: AOJu0YwIGJO2jeXJE4NO4ZpAZsd7ZiY/PCFpQ3URlXNU6ueZ/VaJn7Pd
	8sXjDgjSW0CyBPc/wdXh+fNkNffCcB2zZBABiN+ffC2dCsohZk0qrs1RofR506s=
X-Google-Smtp-Source: AGHT+IFgsccCrFEj/kSvTt/1puQQ8yew0zZCPSA1ewKljzJ2CdEca2/4yKweZZ7ydQaRy1tTj7ZnnQ==
X-Received: by 2002:a05:6a00:2381:b0:705:b6d3:4f15 with SMTP id d2e1a72fcca58-70c2e9b5544mr3169227b3a.25.1721144996374;
        Tue, 16 Jul 2024 08:49:56 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5d01:167d:9cf4:148e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ebb8139sm6472526b3a.80.2024.07.16.08.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 08:49:55 -0700 (PDT)
Date: Tue, 16 Jul 2024 09:49:52 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Subject: Re: [PATCH 6/6] remoteproc: imx_rproc: handle system off for i.MX7ULP
Message-ID: <ZpaWoNGH/oQvphVJ@p14s>
References: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
 <20240712-imx_rproc-v1-6-7bcf6732d328@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712-imx_rproc-v1-6-7bcf6732d328@nxp.com>

On Fri, Jul 12, 2024 at 04:34:59PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The i.MX7ULP Cortex-A7 is under control of Cortex-M4. The i.MX7ULP Linux
> poweroff and restart rely on rpmsg driver to send a message to Cortex-M4
> firmware. Then Cortex-A7 could poweroff or restart by Cortex-M4 to
> configure the i.MX7ULP power controller properly.
> 
> However the reboot and restart kernel common code use atomic notifier,
> so with blocking tx mailbox will trigger kernel dump, because of
> blocking mailbox will use wait_for_completion_timeout. In such case,
> linux no need to wait for completion.
> 
> Current patch is to use non-blocking tx mailbox channel when system
> is going to poweroff or restart.
> 
> Reviewed-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 01cf1dfb2e87..e1abf110abc9 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -18,6 +18,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
>  #include <linux/workqueue.h>
> @@ -114,6 +115,7 @@ struct imx_rproc {
>  	u32				entry;		/* cpu start address */
>  	u32				core_index;
>  	struct dev_pm_domain_list	*pd_list;
> +	struct sys_off_data		data;
>  };
>  
>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
> @@ -1050,6 +1052,22 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>  	return 0;
>  }
>  
> +static int imx_rproc_sys_off_handler(struct sys_off_data *data)
> +{
> +	struct rproc *rproc = data->cb_data;
> +	int ret;
> +
> +	imx_rproc_free_mbox(rproc);
> +
> +	ret = imx_rproc_xtr_mbox_init(rproc, false);

This is new functionality and has nothing to do with the rest of this set.
Please introduce patches 5/6 and 6/6 as part of a new patchset.

Thanks,
Mathieu

> +	if (ret) {
> +		dev_err(&rproc->dev, "Failed to request non-blocking mbox\n");
> +		return NOTIFY_BAD;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
>  static int imx_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1104,6 +1122,24 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	if (rproc->state != RPROC_DETACHED)
>  		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
>  
> +	if (of_device_is_compatible(dev->of_node, "fsl,imx7ulp-cm4")) {
> +		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF_PREPARE,
> +						    SYS_OFF_PRIO_DEFAULT,
> +						    imx_rproc_sys_off_handler, rproc);
> +		if (ret) {
> +			dev_err(dev, "register power off handler failure\n");
> +			goto err_put_clk;
> +		}
> +
> +		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART_PREPARE,
> +						    SYS_OFF_PRIO_DEFAULT,
> +						    imx_rproc_sys_off_handler, rproc);
> +		if (ret) {
> +			dev_err(dev, "register restart handler failure\n");
> +			goto err_put_clk;
> +		}
> +	}
> +
>  	ret = rproc_add(rproc);
>  	if (ret) {
>  		dev_err(dev, "rproc_add failed\n");
> 
> -- 
> 2.37.1
> 
