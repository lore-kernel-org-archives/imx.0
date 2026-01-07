Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DB6340A59
	for <imx@lists.linux.dev>; Wed,  7 Jan 2026 18:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767811282; cv=none; b=Prll0fmWyXJHuggrNTKTg85F4IoFpKLmHMJQGlOeLDKfQ7KQhQbd7RhLf1iXgiMUwNiZ+1xpELcjeZG4/bRVWbxzO+uzlCxK+Z1nqyRizzGz1NFshVn5rul4xLXUeIhcuAs2hLVVAAk+pdDfic3Ao9RxNSyOjkMXznJzcpOL+ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767811282; c=relaxed/simple;
	bh=NSGCdbI+h+PBhKKXiVPWSi4Qz9Zo6Hpod+dbHIifoDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DExv/6glJusf5O8evKfW0QZTSoLdCjM0RuTyBM5VPmqBq/rtErXDxMz5mjwxErnNBAHbFNgHu+4dTihmtJnonGkrI41SfsDuehyEo4rPsaY9KIRXxakEcDM+uFbcExLezLuAYfARn8IJiAWx88Rl1olLQ6DlarDcxVvd3+WCj6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CjcNVd1Q; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CjcNVd1Q"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0d6f647e2so27053965ad.1
        for <imx@lists.linux.dev>; Wed, 07 Jan 2026 10:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767811272; x=1768416072; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9635V4lsYtlxVVNoZLyWSLHpA71mqfx4+EjwWyxRe/Q=;
        b=CjcNVd1Qlf5AoAc7/0h3GDFrJAfGjgWSa5OlyerD5DGEhQtgId5BI2JVtfEb9Pstjx
         JEjqvkehpo+LuB3AXwwYnxEtIg9/kVAW6aqWXAE5iEGa1Vx4hs0wRQikhnIggbsV4jEi
         e4BnSzVlNCYWvnz7zYuuI25XefpmuAe5JAVWkToE8P8q/u8u1Y8l/qsTPDQbqYnWWXFH
         p70W5QC135k//6yyohJqqpMzb5ISAdo7ii/iwTVY1DbP7b02kScb8axFjF/gxlLC9dWJ
         ObTKPnaQKciOL8laRA3i3nqu27UseP/DtasTgNE2y2OxpDI+ovkqz7HgIGHz9DRKNZ/N
         qoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767811272; x=1768416072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9635V4lsYtlxVVNoZLyWSLHpA71mqfx4+EjwWyxRe/Q=;
        b=Qlw+mCsggiSzLWDGjcYkcwJIKL5AA4rfAys4WNhGnk1dMKlNK4YlnKevvO8yhDEj6I
         vlcv/7rfOYhWU9xvPQ6YSFJBHG101s3F/3zdGdUFs+OgoUZ+InuEYctWtcYBETfXRMZq
         nTLCI1zLSyvQgktVYRZyhSv/u847BqH9N++Gn+Wd9016Y10+zdPYP+yHK8lbdLyPZsEN
         JPlqL5ijxbmSpI+FqPEN3ZehtBQWaoR+7WatrdqZbZFRKAdRq4fjEN3b/xsJ2L2qDZye
         z3yb04x1d52kctsgp/IH/1FhSCChb0QWfN0Q8dzLb+mxWL341vO/1WOg32I4K1IyJD5U
         CgEA==
X-Forwarded-Encrypted: i=1; AJvYcCVd5cafk1XbMySxOZe+aDyPME2X9bdLT1oHR8ILAcV/Yiud2WsKcP3NBT2RVDdpqGjS72s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3o1Fxwk+Be9uVyZwS/coHb2O/XRvTqzfSrA6fBP77844uvmCq
	19JD4xRxUvQX/txnhUvNzKqvzPrMqyWUdhhhmXraqScJ/ZrP4qrydqWkx61Fv3CtmS0=
X-Gm-Gg: AY/fxX4gFEK9xqOZ/Wo+rO1JknRnWizys137xdZx+/2pu2Ujw6ozhFGsH/yqm8nSnjR
	VVzCBlRhDxLFd6VvoqwDdZduuNLiC7GXkjW+bfeY4Svt8+prcGoCuzDqFcAaHOmOIB1yCqlNDQi
	eE2cvfE/YpFvbGk1PuiB92rYH2aPQ+34GSHav2Ci9VGVlh+ZUbHKldiO/2NiyDgl1XqJRs7SAG/
	SwafQfRgDFZHm1ZvZyPgUFUNHb+xkRH4TGzxDt23WTsDaxTPSqOB5KjrP9FOzh01DGxlOUvZxt+
	IfePpnoi5jDCjRMsH4Zw5MeI4VB7QrDg6g+DNvFadAqRd8NyV58gHFafA3sSKM+5w97VPs2bvN8
	o9FGJSz+onvb1NmnXMYlXKTZlaF5T5oE4XL8AOok5HrxaHV+qjDLR+LLhzFXSKPt6hAtEbL+zCs
	gmQu7broLZN1NZYw==
X-Google-Smtp-Source: AGHT+IFkwVLcuEQ8JWGXwLrFYhjNk2Drta0jODGnrSFjxLSNgge/fyObT0crE0diC80filzVsoc1hQ==
X-Received: by 2002:a17:902:e952:b0:2a2:b293:27d2 with SMTP id d9443c01a7336-2a3ee4b4cb5mr31926135ad.53.1767811271398;
        Wed, 07 Jan 2026 10:41:11 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9a09:dd70:79df:b876])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2e26sm56082135ad.48.2026.01.07.10.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:41:10 -0800 (PST)
Date: Wed, 7 Jan 2026 11:41:07 -0700
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
Subject: Re: [PATCH v5 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aV6ow9dGUNaPDqZg@p14s>
References: <20251218-imx95-rproc-2025-12-18-v5-0-b56a27d4158f@nxp.com>
 <20251218-imx95-rproc-2025-12-18-v5-4-b56a27d4158f@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-imx95-rproc-2025-12-18-v5-4-b56a27d4158f@nxp.com>

On Thu, Dec 18, 2025 at 01:17:38PM +0800, Peng Fan (OSS) wrote:
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
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/Kconfig     |   2 +
>  drivers/remoteproc/imx_rproc.c | 198 +++++++++++++++++++++++++++++++++++++++++
>  drivers/remoteproc/imx_rproc.h |   3 +
>  3 files changed, 203 insertions(+)
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
> index b0857a1a9660503ee7cd5473c06dacb5262286b8..ae3183ad996462ad0815889a2291d320ce7a1e8f 100644
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
> @@ -92,9 +94,16 @@ struct imx_rproc_mem {
>  #define ATT_CORE_MASK   0xffff
>  #define ATT_CORE(I)     BIT((I))
>  
> +/* Linux has permission to handle the Logical Machine of remote cores */
> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(0)
> +

This should be named IMX_RPROC_FLAGS_SM_LMM_CTRL.

>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
>  static void imx_rproc_free_mbox(void *data);
>  
> +/* Forward declarations for platform operations */
> +static const struct imx_rproc_plat_ops imx_rproc_ops_sm_lmm;
> +static const struct imx_rproc_plat_ops imx_rproc_ops_sm_cpu;
> +
>  struct imx_rproc {
>  	struct device			*dev;
>  	struct regmap			*regmap;
> @@ -117,6 +126,11 @@ struct imx_rproc {
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
> @@ -313,6 +327,44 @@ static int imx_rproc_scu_api_start(struct rproc *rproc)
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

A comment is needed here to say that if the remoteproc core can't start the M7,
it will already be handled in imx_rproc_sm_lmm_prepare()

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
> @@ -369,6 +421,25 @@ static int imx_rproc_scu_api_stop(struct rproc *rproc)
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
> @@ -485,6 +556,33 @@ static int imx_rproc_mem_release(struct rproc *rproc,
>  	return 0;
>  }
>  
> +static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	int ret;
> +

>>>>>>>>>>>

> +	/*
> +	 * IMX_RPROC_FLAGS_SM_LMM_AVAIL not set indicates Linux is not able
> +	 * to start/stop rproc LM, then if rproc is not in detached state,
> +	 * prepare should fail. If in detached state, this is in rproc_attach()
> +	 * path.
> +	 */
> +	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
> +		return rproc->state == RPROC_DETACHED ? 0 : -EACCES;

<<<<<<<<<<<

        if (rproc->state == RPROC_DETACHED)
                return 0;

        if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
                return -EACCES;

<<<<<<<<<<<
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
> @@ -980,6 +1078,93 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
>  	return 0;
>  }
>  
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

Two things here:
(1) This whole comment describes what this function does rather than what the
code is doing in the next few lines.  As such it needs to be moved above the
function declaration.
(2) We know the M7 is in a different LM, otherwise "dcfg->lmid == info.lmid" in
imx_rproc_sm_detect_mode() and we would not be here.  As such the comment is
wrong.  The only thing this code is doing is check if the remoteproc core is
responsible for the M7 lifecycle.

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
> +

>>>>>>>>>>>

> +	/* rproc was started before boot Linux and under control of Linux, directly return */
> +	if (started) {
> +		priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> +		return 0;
> +	}
> +
> +	/* else shutdown the LM to save power */
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> +	if (ret) {
> +		dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}
> +
> +	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;

<<<<<<<<<<<

        /* Shutdown remote processor if not started */
        if (!started) {
	        ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
	        if (ret) {
		        dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
		        return ret;
	        }
        }

	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;

<<<<<<<<<<<

This patchset would be a lot easier to digest if you had split the support for
CPU and LMM protocols in diffent patches.

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
> @@ -1155,6 +1340,19 @@ static const struct imx_rproc_plat_ops imx_rproc_ops_scu_api = {
>  	.detect_mode	= imx_rproc_scu_api_detect_mode,
>  };
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
> +
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
>  	.src_reg	= IMX7D_SRC_SCR,
>  	.src_mask	= IMX7D_M4_RST_MASK,
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
