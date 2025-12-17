Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D60633030D
	for <imx@lists.linux.dev>; Wed, 17 Dec 2025 23:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766013550; cv=none; b=A2pKoQmOzQ8FSsjiQHa8bIVSYaSuTXxS+eE/qzz8X6B+WQdC5Y7YmINt48JyDYYA7eqX86eKTEn19T5keaf+Lv4iwz5RlRWwcuGJEuQqA/ex/FyPD0M0HF+gui0mmIBXPrpezeO8+bHz/c593gFSjMQccuQHsydhd1+2xQkDRbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766013550; c=relaxed/simple;
	bh=aS8cgkXk/CAoYKh5hZLA6lveJ5wPCoWZ4Uz5qZAeLzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XoSXrV5FN1lBSkxEFuOwgQu4OxNLcpttHtzkdYx0yldOfvEDcHoyrolix/hUvS7kZKHny4djxdnsoaVWTuz5JRIth6ZEt/Z5rslv2mJSHYYXGCU2Nkg7f6vE6sPI8HdTSFHVlIxpnkGQbm3vjlbjb85E4LgyDAyJ3qEGZkLXIS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C0og3OIV; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C0og3OIV"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0c20ee83dso264965ad.2
        for <imx@lists.linux.dev>; Wed, 17 Dec 2025 15:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766013547; x=1766618347; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fnvJD5vnTj/iz4qjBfnZiFYyD/tC1WL5vWTNfDJr3Pg=;
        b=C0og3OIVkMHd6BgSK0TN1ouZngOVglyABMT9TPuObWAsrPvrDRiK8u3aj1kA4x8Scc
         A1YbWYXxwObkj6MPlNGip7K93CsAlVxhTwehnsa41ltBUP6iIAPA/hRdKM2dmyh0cDPM
         Yo7MKzd/qcrHoVdWtRS+dic0Mxd9cuDmMpk17tY38/sHsU7gqTwSaFN7TtUgaIpQmErq
         IbORU116tkiY84Cs684nPkTreoWkspu5f4iHv493CMTqu9jeinrKXkplGOfJkxVqcv8I
         3rE8007sZhamQIZ7/aJrCU0J831JieoGmTT/T6G9f/ErIK1e+0nOQe5J1xlK5Anx7giW
         MdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766013547; x=1766618347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fnvJD5vnTj/iz4qjBfnZiFYyD/tC1WL5vWTNfDJr3Pg=;
        b=I94D7aX2qRfIZtO360OFIBynO9mn9L2mpEpVbyNtxcvqljh10V3AjpOZ1t7S1+2lan
         7W770BgBV2Hw3DH3VaA4gHHMrKIHBEXBvgShKqNrWArKmFHfIkhpVDrifondbyV65kkk
         9UL637fzQRyR901EFqWKS2ikWZc6TLcki+OmDcyHaPuEd2vFvJfBBBooR7hKEw/Abt68
         +h36f7JGT8Nt6QuVKgM/DYptc6XwUTh5zauwivh12wtBP1Ef6GOwwcD/oWrNjQTi6Ish
         h6IbfhdVm8tZjHN9DPRnXik7ggUnXoD1156SXiSDz9hbcdPfi1G49k4Tyeab58HhXypC
         kM/A==
X-Forwarded-Encrypted: i=1; AJvYcCWU92pL5e3ZYuPtmbLtA5kS4B2xCCsyrNuoU5Hm5P115TSadFoEk09STqvPmaltL6QS6A4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfPbnemGDFztk9digVNgPE1LVZzEHNQOv49IAAKQrXQL3hckWA
	0gE9GL/Ke5VD9MlOLB3gwWtC589MQ5giNofe6WJtlITkF1OkMWLCmvvYYWzhVfjdFqI=
X-Gm-Gg: AY/fxX5njucgdW8Wkqjg/odlOh/JnhXKxr5z/20lHTXBx5Jajj6+dntgQcQC9QxOlC0
	V2VC6kt6xnGlo+eo5Eif/hucak785WrwWoLrjwvkdQ8uKlF+ZObkhBhrasUzxczCY+nqeEHCY42
	gP+z2jGrNwE2P96/d0PWL+8WQn/iBzPjIJvVkx+OEffY6oQx2aHgZtJKi+lRGh4zuLYyhrNafAO
	QEcw/G/hcJT2Mq0jNvX+tA9pYwSz1qiJ/kOJbDS+//BLeANSJQJhvw/2NViBnC4WQ/vE8zmpXgE
	yvGi3QAPMtZr4lzYLsdvgtEaXavhLeuEfZhRuBofgvXcIm7rnWBDoFU1Jc0uH9PAlbuRwSllRTr
	wbCRdNekiQHMbveQpZQ2fyckkDV65h+RhJPAFrD1+R6Zg/cajcdDPmUxV7kClO9R9UHvAL3O9Lf
	DKxdEm8lVAOWyH71DgglcGdE8=
X-Google-Smtp-Source: AGHT+IFGDqxMNPRy4HzlHPhca7EFo7g467xFIgnEfyyXQR5wehGNGfMsyhEWYaEwCFxwgFNc1WWorA==
X-Received: by 2002:a17:902:d4c8:b0:2a0:b4f6:5595 with SMTP id d9443c01a7336-2a0b4f65742mr126278535ad.50.1766013547181;
        Wed, 17 Dec 2025 15:19:07 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:cfb9:c35:9f28:8222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2cef1bf32sm4528385ad.0.2025.12.17.15.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 15:19:06 -0800 (PST)
Date: Wed, 17 Dec 2025 16:19:04 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aUM6aGbSH9ICOL5f@p14s>
References: <20251216-imx95-rproc-2025-12-15-v4-0-bf1064ea8daf@nxp.com>
 <20251216-imx95-rproc-2025-12-15-v4-4-bf1064ea8daf@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216-imx95-rproc-2025-12-15-v4-4-bf1064ea8daf@nxp.com>

On Tue, Dec 16, 2025 at 09:51:02AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
> 
> Depending on SM configuration, M7 can be used as follows:
>  (1) M7 in a separate Logical Machine (LM) from A55 cores, that Linux
>      can't control
>  (2) M7 in a separate LM from A55 cores that Linux can control using LMM
>      protocol.
>  (3) M7 runs in same Logical Machine as A55 cores, so Linux can control it
>      using CPU protocol
> 
> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
>    is fixed as 1 in SM firmware if M7 is in a separate LM),
>    if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
>    protocol to start/stop. Otherwise, use LMM protocol to start/stop.
>    Whether using CPU or LMM protocol to start/stop, the M7 status
>    detection could use CPU protocol to detect started or not. So
>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>    status of M7.
>  - For above case (1) and (2), Use SCMI_IMX_LMM_POWER_ON to detect whether
>    the M7 LM is under control of A55 LM.
>  - For above case , after using SCMI_IMX_LMM_POWER_ON to check
>    permission, SCMI_IMX_LMM_SHUTDOWN API should be called to shutdown
>    the M7 LM to save power only when M7 LM is going to be started by
>    remoteproc framework. Otherwise bypass SCMI_IMX_LMM_SHUTDOWN API if
>    M7 LM is started before booting Linux.
> 
> Current setup relies on pre-Linux software(U-Boot) to do M7 TCM ECC
> initialization. In future, we could add the support in Linux to decouple
> U-Boot and Linux.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/Kconfig     |   2 +
>  drivers/remoteproc/imx_rproc.c | 193 +++++++++++++++++++++++++++++++++++++++++
>  drivers/remoteproc/imx_rproc.h |   3 +
>  3 files changed, 198 insertions(+)
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
> index 35585235c683e6327c3e6db65d5d33253ffba327..55e555f2b5dd63e7d82996437e792a8152c91521 100644
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
> @@ -92,8 +94,12 @@ struct imx_rproc_mem {
>  #define ATT_CORE_MASK   0xffff
>  #define ATT_CORE(I)     BIT((I))
>  
> +/* Linux has permission to handle the Logical Machine of remote cores */
> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(0)
> +
>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
>  static void imx_rproc_free_mbox(void *data);
> +static int imx_rproc_sm_detect_mode(struct rproc *rproc);
>  
>  struct imx_rproc {
>  	struct device			*dev;
> @@ -117,6 +123,11 @@ struct imx_rproc {
>  	u32				core_index;
>  	struct dev_pm_domain_list	*pd_list;
>  	const struct imx_rproc_plat_ops	*ops;
> +	/*
> +	 * For i.MX System Manager based systems
> +	 * BIT 0: IMX_RPROC_FLAGS_SM_LMM_AVAIL(RPROC LM is under Linux control )
> +	 */
> +	u32				flags;
>  };
>  
>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
> @@ -313,6 +324,44 @@ static int imx_rproc_scu_api_start(struct rproc *rproc)
>  	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
>  }
>  
> +static int imx_rproc_sm_cpu_start(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	int ret;
> +
> +	ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to set reset vector cpuid(%u): %d\n", dcfg->cpuid, ret);
> +		return ret;
> +	}
> +
> +	return scmi_imx_cpu_start(dcfg->cpuid, true);
> +}
> +
> +static int imx_rproc_sm_lmm_start(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	struct device *dev = priv->dev;
> +	int ret;
> +
> +	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
> +	if (ret) {
> +		dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
> +			dcfg->lmid, dcfg->cpuid, ret);
> +		return ret;
> +	}
> +
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_BOOT, 0);
> +	if (ret) {
> +		dev_err(dev, "Failed to boot lmm(%d): %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int imx_rproc_start(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -369,6 +418,25 @@ static int imx_rproc_scu_api_stop(struct rproc *rproc)
>  	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
>  }
>  
> +static int imx_rproc_sm_cpu_stop(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +
> +	return scmi_imx_cpu_start(dcfg->cpuid, false);
> +}
> +
> +static int imx_rproc_sm_lmm_stop(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +
> +	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
> +		return -EACCES;
> +
> +	return scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> +}
> +
>  static int imx_rproc_stop(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -485,6 +553,33 @@ static int imx_rproc_mem_release(struct rproc *rproc,
>  	return 0;
>  }
>  
> +static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	int ret;
> +
> +	/*
> +	 * IMX_RPROC_FLAGS_SM_LMM_AVAIL not set indicates Linux is not able
> +	 * to start/stop rproc LM, then if rproc is not in detached state,
> +	 * prepare should fail. If in detached state, this is in rproc_attach()
> +	 * path.
> +	 */
> +	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
> +		return rproc->state == RPROC_DETACHED ? 0 : -EACCES;
> +
> +	/* Power on the Logical Machine to make sure TCM is available. */
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}
> +
> +	dev_info(priv->dev, "lmm(%d) powered on by Linux\n", dcfg->lmid);
> +
> +	return 0;
> +}
> +
>  static int imx_rproc_prepare(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -980,6 +1075,104 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static const struct imx_rproc_plat_ops imx_rproc_ops_sm_lmm = {
> +	.detect_mode	= imx_rproc_sm_detect_mode,
> +	.prepare	= imx_rproc_sm_lmm_prepare,
> +	.start		= imx_rproc_sm_lmm_start,
> +	.stop		= imx_rproc_sm_lmm_stop,
> +};
> +
> +static const struct imx_rproc_plat_ops imx_rproc_ops_sm_cpu = {
> +	.detect_mode	= imx_rproc_sm_detect_mode,
> +	.start		= imx_rproc_sm_cpu_start,
> +	.stop		= imx_rproc_sm_cpu_stop,
> +};

Why are these not at the bottom of the file with the rest of the
imx_rproc_plat_ops?  That way you wouldn't have to declare
imx_rproc_sm_detect_mode() at the top of the file...

> +
> +static int imx_rproc_sm_lmm_check(struct rproc *rproc, bool started)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	struct device *dev = priv->dev;
> +	int ret;
> +
> +	/*
> +	 * Use power on to do permission check. If rproc is in different LM,
> +	 * and linux has permission to handle the LM, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
> +	 */
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> +	if (ret) {
> +		if (ret == -EACCES) {
> +			/*
> +			 * rproc LM is booted before Linux and not under Linux Control, so only
> +			 * do IPC between RPROC and Linux, not return failure
> +			 */
> +			dev_info(dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
> +			return 0;
> +		}
> +
> +		dev_err(dev, "power on lmm(%d) failed: %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}
> +
> +	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> +
> +	/* rproc was started before boot Linux and under control of Linux, directly return */
> +	if (started)
> +		return 0;
> +
> +	/* else shutdown the LM to save power */
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> +	if (ret) {
> +		priv->flags &= ~IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> +		dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}

If you move this call to scmi_imx_lmm_operation() (and the error check) before
setting priv->flags, you won't have to reset it in the error path.

Let's see how the next revision goes...

Thanks,
Mathieu

> +
> +	return 0;
> +}
> +
> +static int imx_rproc_sm_detect_mode(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	struct device *dev = priv->dev;
> +	struct scmi_imx_lmm_info info;
> +	bool started = false;
> +	int ret;
> +
> +	ret = scmi_imx_cpu_started(dcfg->cpuid, &started);
> +	if (ret) {
> +		dev_err(dev, "Failed to detect cpu(%d) status: %d\n", dcfg->cpuid, ret);
> +		return ret;
> +	}
> +
> +	if (started)
> +		priv->rproc->state = RPROC_DETACHED;
> +
> +	/* Get current Linux Logical Machine ID */
> +	ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
> +	if (ret) {
> +		dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Check whether rproc is in the same LM as host core(running Linux)
> +	 * If yes, use CPU protocol API to manage rproc.
> +	 * If no, use Logical Machine API to manage rproc.
> +	 */
> +	if (dcfg->lmid == info.lmid) {
> +		priv->ops = &imx_rproc_ops_sm_cpu;
> +		dev_info(dev, "Using CPU Protocol OPS\n");
> +		return 0;
> +	}
> +
> +	priv->ops = &imx_rproc_ops_sm_lmm;
> +	dev_info(dev, "Using LMM Protocol OPS\n");
> +
> +	return imx_rproc_sm_lmm_check(rproc, started);
> +}
> +
>  static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  {
>  	/*
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index 37417568a0ade2ae4d6a4e3d0f139ea52b185254..d37e6f90548cec727b4aeb874680b42af85bdbb4 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -38,6 +38,9 @@ struct imx_rproc_dcfg {
>  	size_t				att_size;
>  	u32				flags;
>  	const struct imx_rproc_plat_ops	*ops;
> +	/* For System Manager(SM) based SoCs */
> +	u32				cpuid; /* ID of the remote core */
> +	u32				lmid;  /* ID of the Logcial Machine */
>  };
>  
>  #endif /* _IMX_RPROC_H */
> 
> -- 
> 2.37.1
> 
