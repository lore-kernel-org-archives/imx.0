Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ED53148D0
	for <imx@lists.linux.dev>; Fri, 29 Aug 2025 16:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756483212; cv=none; b=fjw1DF0HqWSguceJWEz/vkGUvnsbqWnNnyYbGuOA+DbmWS1tcMDt2GlFJGXmbvz7gc07qB1fhBNqjKeU6QFCYPoGPc7PxqegSyO80AHVdsEQcuNGjlMBAy+4Ydf9xD8BhWWdZgGbrTj2HsbrBeL2QZlAEoUzSUvE+zzIFOcjltc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756483212; c=relaxed/simple;
	bh=bl+Dj5hxJbhV0m9QVfjDMQcT3BfjNIdaUKmmhOWc+8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDnPqOjrEpDuRul0YTydEm0I9jyL+TRpsdRWfNn7eCpUuVGfiXyn66esvxnTRIYLaiDlVKkhlXTeXjFxt0NC78zuLcYRAZmkJmen0zrlzLjDFculDKbgNrna8lQMqNLbLDtLhKMqqvvo2baMqpW8n+DXEdROK9NQEQhemOxQLoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QvsqSPOs; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QvsqSPOs"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7720b23a49fso2516517b3a.0
        for <imx@lists.linux.dev>; Fri, 29 Aug 2025 09:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756483209; x=1757088009; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JnUguYsPU/clLRFYfyLCtFaxL7BUTnwrUbOEBmMllkw=;
        b=QvsqSPOs+vweizOomZnlsRuwLKcmZUAb6FOTo1E/oN7gBXEO+G/bZAWnD9bbDZwFab
         SqeRclCpsK8h0ySIKfTQLCbRIlWohNmMd8q7rXMqvjEru5tTWUfwucDoF4wyJBFqDSlU
         oUq5GijjpOGoH95kI9bG/fpk/OSDnYS/BRBIVAGWtpTz465LWDbqUhqgTWWa2LA2rhK1
         J0KO2avI0w3D6jMHfymMOCZiJt04iS9Xlqcqu4x+Y7ryYU4LUqOtuVTIEbj1VC/m+gdB
         JH7uF7kgUQTurCv5PKbpee67bdvm5nRFNjjjFte+DruQsMMizYyLsbudWyXlCtg/TNQ1
         h8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756483209; x=1757088009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnUguYsPU/clLRFYfyLCtFaxL7BUTnwrUbOEBmMllkw=;
        b=YV4cK+IzcADrvZ2WCZouTfP1+z5JeZluHGNcPcSw6gH+Ur/3RSIQyiaefri19EL4Dt
         vdFEA9N3X26AwH6rG4mwRWzhTwQDTQMM7IbQmpyJ8cObYEWeBnd8fhpg6VDHHLOfgjC0
         majora55oXW8ZSkUmLcIU5AtZTq1ofAUU3C5iO+uXEL0PimzNF+Xx3b+ZR7764Ca9Eba
         1ePTwH8krz3mEyAe5z3j3JJPUc84sLDDxGfbnLRvxDWDcQA61WO4bK6JyMJLQCw0p6eU
         Zijn3GXNHdXOEm2zuowDyIroyTAb2C0Ycs5cruU42/yrS2HSKknVWgVr/ZpNmj99ZnCe
         lYRw==
X-Forwarded-Encrypted: i=1; AJvYcCXC1LPSUfdBO2bm6pZYc9YOadnJzgQQt1nZ5FMhY9+Iup3VpQiilREYslJ0rXZB566ROsI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBaumGSowC61aDU3RcasJJBynYcyH5vnf/fQlDjuOtHoR+yACC
	RU2lhzH/A1ba5de6D4+C0utn7DS4CtdD8GP4ixTJ0ywGCj6+9t/0bcnzTKq3YBhH72g=
X-Gm-Gg: ASbGncsqa8BzZUfb5trpfbWJqs+oPzNmioJ5JtZzGOquf6DgXMdoa1+vzpDtxavaS/3
	E4PWLd/2dEZr5RnUnwaChONV47bJifSdFbTWN1lQfOQJ26Td4+OJeGpBuNhV1NyR57sE8h3R9N8
	dHTtGGrKHsSuOn4xaqWZchiAIjuut9Fu/YvuNcTDG3SYfhMnHApYB5d/zcowDaJoHeyBCKwyTNx
	/gemSLOjd9/dHi5ymjDX4O6L6mJSfU0hDnbcyxBu+4eE2b/aixQw+6YcNBTbg1mzs0T9no3FSox
	ybwb2RjIY95ekLcdP+SuFRqtz/3RpK7wTDqo8Owo3S0mfGF844YnHDcbp6EV55DJUUBfEXNEMWn
	L5kJqAZnFAUL6WnCGS9MRqVgHrePsvs6CZsbKPIhGYUghVlC6OBuPBm2CrbLfb9otKTL5EfGui1
	29d666XeakglTAlZjhvo6r2WbMhr4E3HeLOeo=
X-Google-Smtp-Source: AGHT+IE0deW5N/05Y6sYjCUfSFpadBfKmTscVPlxU1ZCjmH/10rKotp0bgLMBq4xrzm3mC+bu2wkmg==
X-Received: by 2002:a05:6a00:2286:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-7702faaf0abmr34492786b3a.21.1756483208758;
        Fri, 29 Aug 2025 09:00:08 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c8f8:92f5:116b:3068])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77232248100sm1713276b3a.98.2025.08.29.09.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 09:00:08 -0700 (PDT)
Date: Fri, 29 Aug 2025 10:00:04 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aLHOhKpAQbVCC76-@p14s>
References: <20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com>
 <20250821-imx95-rproc-1-v5-2-e93191dfac51@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-imx95-rproc-1-v5-2-e93191dfac51@nxp.com>

Good day,

On Thu, Aug 21, 2025 at 05:05:05PM +0800, Peng Fan wrote:
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
> 
> There are three cases for M7:
>  (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
>  (2) M7 in a separate Logical Machine that Linux can control it using
>      LMM protocol
>  (3) M7 runs in same Logical Machine as A55, so Linux can control it
>      using CPU protocol
> 
> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>  - Add IMX_RPROC_SM to indicate the remote core runs on a SoC that
>    has System Manager.
>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
>    is fixed as 1 in SM firmware if M7 is in a seprate LM),
>    if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
>    protocol to start/stop. Otherwise, use LMM protocol to start/stop.
>    Whether using CPU or LMM protocol to start/stop, the M7 status
>    detection could use CPU protocol to detect started or not. So
>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>    status of M7.
>  - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whether
>    the M7 LM is under control of A55 LM.
> 
> Current setup relies on pre-Linux software(U-Boot) to do
> M7 TCM ECC initialization. In future, we could add the support in Linux
> to decouple U-Boot and Linux.
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/Kconfig     |   2 +
>  drivers/remoteproc/imx_rproc.c | 123 ++++++++++++++++++++++++++++++++++++++++-
>  drivers/remoteproc/imx_rproc.h |   5 ++
>  3 files changed, 127 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 48a0d3a69ed08057716f1e7ea950899f60bbe0cf..ee54436fea5ad08a9c198ce74d44ce7a9aa206de 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -27,6 +27,8 @@ config IMX_REMOTEPROC
>  	tristate "i.MX remoteproc support"
>  	depends on ARCH_MXC
>  	depends on HAVE_ARM_SMCCC
> +	depends on IMX_SCMI_CPU_DRV || !IMX_SCMI_CPU_DRV
> +	depends on IMX_SCMI_LMM_DRV || !IMX_SCMI_LMM_DRV
>  	select MAILBOX
>  	help
>  	  Say y here to support iMX's remote processors via the remote
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index a6eef0080ca9e46efe60dcb3878b9efdbdc0f08e..151b9ca34bac2dac9df0ed873f493791f2d1466e 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/firmware/imx/sci.h>
> +#include <linux/firmware/imx/sm.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/mailbox_client.h>
> @@ -22,6 +23,7 @@
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/scmi_imx_protocol.h>
>  #include <linux/workqueue.h>
>  
>  #include "imx_rproc.h"
> @@ -92,6 +94,11 @@ struct imx_rproc_mem {
>  #define ATT_CORE_MASK   0xffff
>  #define ATT_CORE(I)     BIT((I))
>  
> +/* Logical Machine Operation */
> +#define IMX_RPROC_FLAGS_SM_LMM_OP	BIT(0)
> +/* Linux has permission to handle the Logical Machine of remote cores */
> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(1)
> +
>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
>  static void imx_rproc_free_mbox(struct rproc *rproc);
>  
> @@ -116,6 +123,8 @@ struct imx_rproc {
>  	u32				entry;		/* cpu start address */
>  	u32				core_index;
>  	struct dev_pm_domain_list	*pd_list;
> +	/* For i.MX System Manager based systems */
> +	u32				flags;
>  };
>  
>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
> @@ -394,6 +403,30 @@ static int imx_rproc_start(struct rproc *rproc)
>  	case IMX_RPROC_SCU_API:
>  		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
>  		break;
> +	case IMX_RPROC_SM:
> +		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
> +			if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
> +				return -EACCES;
> +
> +			ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
> +			if (ret) {
> +				dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
> +					dcfg->lmid, dcfg->cpuid, ret);
> +			}
> +
> +			ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_BOOT, 0);
> +			if (ret)
> +				dev_err(dev, "Failed to boot lmm(%d): %d\n", ret, dcfg->lmid);
> +		} else {
> +			ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
> +			if (ret) {
> +				dev_err(dev, "Failed to set reset vector cpuid(%u): %d\n",
> +					dcfg->cpuid, ret);
> +			}
> +
> +			ret = scmi_imx_cpu_start(dcfg->cpuid, true);
> +		}
> +		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -436,6 +469,16 @@ static int imx_rproc_stop(struct rproc *rproc)
>  	case IMX_RPROC_SCU_API:
>  		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
>  		break;
> +	case IMX_RPROC_SM:
> +		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
> +			if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL)
> +				ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> +			else
> +				ret = -EACCES;
> +		} else {
> +			ret = scmi_imx_cpu_start(dcfg->cpuid, false);
> +		}
> +		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -546,10 +589,48 @@ static int imx_rproc_mem_release(struct rproc *rproc,
>  	return 0;
>  }
>  
> +static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	int ret;
> +
> +	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP))
> +		return 0;
> +
> +	/*
> +	 * Power on the Logical Machine to make sure TCM is available.
> +	 * Also serve as permission check. If in different Logical
> +	 * Machine, and linux has permission to handle the Logical
> +	 * Machine, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
> +	 */
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> +	if (ret == 0) {
> +		dev_info(priv->dev, "lmm(%d) powered on\n", dcfg->lmid);
> +		priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;

Why is setting this flag needed?  The check that is done on it in
imx_rproc_{start|stop} should be done here.  If there is an error then we don't
move forward.

> +	} else if (ret == -EACCES) {
> +		dev_info(priv->dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
> +		/*
> +		 * If remote cores boots up in detached mode, continue;
> +		 * else linux has no permission, return -EACCES.
> +		 */
> +		if (priv->rproc->state != RPROC_DETACHED)
> +			return -EACCES;

The comment above scmi_imx_lmm_operation() mentions that calling
scmi_imx_lmm_operation() is done to make sure TCMs are available.  Is there a
point in calling scmi_imx_lmm_operation() if ->state == RPROC_DETACHED?  If not,
can't that check be move to the beginning of imx_rproc_sm_lmm_prepare()?  

> +
> +		/* work in state RPROC_DETACHED */
> +		ret = 0;
> +	} else if (ret) {
> +		dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", ret, dcfg->lmid);
> +	}
> +
> +	return ret;
> +}
> +
>  static int imx_rproc_prepare(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
>  	struct device_node *np = priv->dev->of_node;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	struct of_phandle_iterator it;
>  	struct rproc_mem_entry *mem;
>  	struct reserved_mem *rmem;
> @@ -593,7 +674,10 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		rproc_add_carveout(rproc, mem);
>  	}
>  
> -	return  0;
> +	if (dcfg->method == IMX_RPROC_SM)
> +		return imx_rproc_sm_lmm_prepare(rproc);
> +
> +	return 0;
>  }
>  
>  static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> @@ -927,13 +1011,41 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  	struct regmap_config config = { .name = "imx-rproc" };
>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	struct device *dev = priv->dev;
> +	struct scmi_imx_lmm_info info;
>  	struct regmap *regmap;
>  	struct arm_smccc_res res;
> +	bool started = false;
>  	int ret;
>  	u32 val;
>  	u8 pt;
>  
>  	switch (dcfg->method) {
> +	case IMX_RPROC_SM:
> +		/* Get current Linux Logical Machine ID */
> +		ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
> +		if (ret) {
> +			dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
> +			return ret;
> +		}
> +
> +		/*
> +		 * Check whether remote processor is in same Logical Machine as Linux.
> +		 * If no, need use Logical Machine API to manage remote processor, and
> +		 * set IMX_RPROC_FLAGS_SM_LMM_OP.
> +		 * If yes, use CPU protocol API to manage remote processor.
> +		 */
> +		if (dcfg->lmid != info.lmid) {
> +			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_OP;
> +			dev_info(dev, "Using LMM Protocol OPS\n");
> +		} else {
> +			dev_info(dev, "Using CPU Protocol OPS\n");
> +		}
> +
> +		ret = scmi_imx_cpu_started(dcfg->cpuid, &started);
> +		if (ret || started)
> +			priv->rproc->state = RPROC_DETACHED;

An error should be reported and the initialization process aborted if an error
occurs rather than defaulting to the default mode.  This will lead to additional
error conditions that will have to be handled elsewhere.

Thanks,
Mathieu

> +
> +		return 0;
>  	case IMX_RPROC_NONE:
>  		priv->rproc->state = RPROC_DETACHED;
>  		return 0;
> @@ -1045,8 +1157,13 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>  	struct device *dev = priv->dev;
>  	int ret;
>  
> -	/* Remote core is not under control of Linux or it is managed by SCU API */
> -	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
> +	/*
> +	 * Remote core is not under control of Linux or it is managed by SCU API.
> +	 * System Manager(SM) firmware automatically configures clock, so also
> +	 * bypass the clk settings for IMX_RPROC_SM.
> +	 */
> +	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API ||
> +	    dcfg->method == IMX_RPROC_SM)
>  		return 0;
>  
>  	priv->clk = devm_clk_get(dev, NULL);
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index cfd38d37e1467d1d9e6f89be146c0b53262b92a0..6fe8d975ed302967f27b7a4319a899e6f0822976 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -26,6 +26,8 @@ enum imx_rproc_method {
>  	IMX_RPROC_SCU_API,
>  	/* Through Reset Controller API */
>  	IMX_RPROC_RESET_CONTROLLER,
> +	/* Through System Manager */
> +	IMX_RPROC_SM,
>  };
>  
>  /* dcfg flags */
> @@ -42,6 +44,9 @@ struct imx_rproc_dcfg {
>  	size_t				att_size;
>  	enum imx_rproc_method		method;
>  	u32				flags;
> +	/* For System Manager(SM) based SoCs, the IDs are from SM firmware */
> +	u32				cpuid;
> +	u32				lmid;
>  };
>  
>  #endif /* _IMX_RPROC_H */
> 
> -- 
> 2.37.1
> 
