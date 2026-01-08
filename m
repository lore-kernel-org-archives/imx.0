Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33593239E63
	for <imx@lists.linux.dev>; Thu,  8 Jan 2026 15:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767885018; cv=none; b=doqbPo6goA/owzAKukJ281YCLo9uIBuTcpfMgyMK5rN00rcHK6WLsHdPoS20aaOso4Ivg9Prl03D1bLlr3qS8BekhHWAC2sW3ymTe4EDmpirGXbQn22piEoYXZZFnjMskJy21/N0/bzoPO1O9+nLDyiW5rOWwC3UH89yJtFC0cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767885018; c=relaxed/simple;
	bh=qKoNns7ZimbfPEEy1t4QVDO1CmWWwQqfbpDDZVsHnmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXx7OqjU2FpmpT9LdKMIor0+S16bWux2Djqsd9vMykdLefxA9MwtVWNxqgeTHj7KhW+lk9qTqTPKE0CZA0UgZuuvbNNhCjswhTeMDNLXWjLNkKYAFMVqnHhNEo5oCZWQkq3EPEvf81+WIA4kHip56JkAk5ok6MqftshQwCEosYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dkecV59O; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dkecV59O"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c03e8ac1da3so1556255a12.2
        for <imx@lists.linux.dev>; Thu, 08 Jan 2026 07:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767885013; x=1768489813; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dhcuq9el8jXisrdDDPJhueutUdvIyETPBmEWgvOuRc0=;
        b=dkecV59O0/FyRn7jCcDiIABu1VHqLIvRvFSQiOHV/sCcObsVShyNifnRwLiO4k7Don
         TIDATH5sAepTN9fM3eLEEfGMcs71aUQFFEKIjGrpP0vbqONR8UvdK649fC3FeGApkZrO
         PyqqVs60xRauB/bAIF2LXu//14PgvmxnX2GRRjUmFG5M5INo9SjiB2+nM3gA6AiVU0n1
         52HCNezPZXVZRd0Vw2vGw8UpDubENQkxyL3m6L0JbWJ5gozHFHT05xE0I1E5fpPw9lnx
         K7JhTlwg7oBGexvAa6lSrITK835Vjc77x9VdJua27Yk0NIA2EsXvy77ytyFcC1YFcCn0
         gN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767885013; x=1768489813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dhcuq9el8jXisrdDDPJhueutUdvIyETPBmEWgvOuRc0=;
        b=eDByv5sBZ7NsQP1PyL5mwk4x45g+/jw5vgYmeZMFhrdy1mA+xE0K3gjOteeATi6pJk
         robHNP5KIuczt2ITc5n4sqsBq02pe0EJIV/+BKyuF18mL4d//oEChYFLrhZnD7Awd65p
         Tt4jIOprwIp4kfmUnoqU+tZq5Hco0pkj9EWJNPN9lGYNf1T15W+MBsM0P2C0hJtR2icA
         CD+7rAFu9fo49ZoGvV0pcZSInqWVcryMz1PjHsU1qZPX92eA9EAKi7hFAJuwYv7iTfHf
         OT7r9oXFzpmpobqoa1IZC18pGCVO8dcCfnuCjqpYutrpOGegM9qCV6mRG62Zh7NR5f5M
         Tk4g==
X-Forwarded-Encrypted: i=1; AJvYcCV4s8R6ke5oBQKE4gY6MpPAvsekX9fLHmxcbLg3W+UkAhrRXH1VTw5mu1BWPKSYgVDpyhI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCdzYC+fKUwUB2qYtSQyB3XqQgOlKbvm21cS9haGfkw9sXiTFZ
	0iv/lnH+uzKHInqajZGzDIPpZA12l4NmTt45ZGPAe3srrECWlHvJIyobJ8X0VfDCnUE=
X-Gm-Gg: AY/fxX5RjdZG/qUCOy9m9tpkDDQuPNJT/XoK1eAWmXTe4MB9n/55okwlFTJWjqLqNVM
	TlS0jfB1YjvgagrkJXKBS08i4ODxijV3HKQBn13uTqWl3gpBR6gKSv64IDJNmd5gzRcyksN2nqn
	y1ujRQ6TvuuR6ZBcMxP4Opojl26DmtGjCZwUfkIFZ6EtOkm8+66IsW3wFbnUnlGUeRncKH/1Tl7
	ta0wwe+H/8mSaLtr2kiW96JQbg2GYo18Ev2qj8+qwW8Ev5+5iGGWkswtDpsBGEmEMY4UvFq/eYo
	PXTOSmzUIEXXTv01zonT7TaWn9RAmYkV8q0jA6zj9AMMAooUZqwLCf+e/873/UBe7wB5TjDifAn
	69DPLDmmutC2ojWxiLl3zcgGeTaqvnzjmR8eGe1Me01hrJGfDdzChrct9G0QqsK1Y4wYT2Vtr+v
	pLr4exZrUJvNmYog==
X-Google-Smtp-Source: AGHT+IHdVQFm0LoRLpz5ffOipFREjXXoGNgUc0A0LwHWdii2Nr5bh8+R06mGKRoJf0I2Vwoi809Uig==
X-Received: by 2002:a17:902:e846:b0:2a1:39cd:7462 with SMTP id d9443c01a7336-2a3ee43892bmr52476395ad.8.1767885013214;
        Thu, 08 Jan 2026 07:10:13 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9a09:dd70:79df:b876])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48c75sm83669855ad.35.2026.01.08.07.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 07:10:12 -0800 (PST)
Date: Thu, 8 Jan 2026 08:10:10 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
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
Message-ID: <aV_I0iGYt1lxEIUw@p14s>
References: <20251218-imx95-rproc-2025-12-18-v5-0-b56a27d4158f@nxp.com>
 <20251218-imx95-rproc-2025-12-18-v5-4-b56a27d4158f@nxp.com>
 <aV6ow9dGUNaPDqZg@p14s>
 <aV+HEAzwNSOCUx88@shlinux89>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV+HEAzwNSOCUx88@shlinux89>

On Thu, Jan 08, 2026 at 06:29:36PM +0800, Peng Fan wrote:
> Hi Mathieu,
> 
> On Wed, Jan 07, 2026 at 11:41:07AM -0700, Mathieu Poirier wrote:
> >On Thu, Dec 18, 2025 at 01:17:38PM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> ...
> >> +/* Linux has permission to handle the Logical Machine of remote cores */
> >> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(0)
> >> +
> >
> >This should be named IMX_RPROC_FLAGS_SM_LMM_CTRL.
> 
> Fix in V6.
> 
> >
> >>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
> >>  static void imx_rproc_free_mbox(void *data);
> >>  
> ...
> >> +static int imx_rproc_sm_lmm_start(struct rproc *rproc)
> >> +{
> >> +	struct imx_rproc *priv = rproc->priv;
> >> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> >> +	struct device *dev = priv->dev;
> >> +	int ret;
> >> +
> >
> >A comment is needed here to say that if the remoteproc core can't start the M7,
> >it will already be handled in imx_rproc_sm_lmm_prepare()
> 
> Add in V6:
>         /*
>          * If the remoteproc core can't start the LM, it will already be

The remoteproc core starts a remote processor, which in this case is the M7.
I'm not sure why you are referring to the logical machine (LM).


>          * handled in imx_rproc_sm_lmm_prepare().
>          */
> 
> >
> >> +	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
> >> +	if (ret) {
> >> +		dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
> >> +			dcfg->lmid, dcfg->cpuid, ret);
> >> +		return ret;
> >> +	}
> >> +
> >>  
> ...
> >> +static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
> >> +{
> >> +	struct imx_rproc *priv = rproc->priv;
> >> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> >> +	int ret;
> >> +
> >
> >>>>>>>>>>>>
> >
> >> +	/*
> >> +	 * IMX_RPROC_FLAGS_SM_LMM_AVAIL not set indicates Linux is not able
> >> +	 * to start/stop rproc LM, then if rproc is not in detached state,
> >> +	 * prepare should fail. If in detached state, this is in rproc_attach()
> >> +	 * path.
> >> +	 */
> >> +	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
> >> +		return rproc->state == RPROC_DETACHED ? 0 : -EACCES;
> >
> ><<<<<<<<<<<
> >
> >        if (rproc->state == RPROC_DETACHED)
> >                return 0;
> >
> >        if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
> >                return -EACCES;
> >
> ><<<<<<<<<<<
> 
> Update in v6 with your code snippets.
> 
> >> +
> >> +	/* Power on the Logical Machine to make sure TCM is available. */
> >> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> >> +	if (ret) {
> >> +		dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", dcfg->lmid, ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	dev_info(priv->dev, "lmm(%d) powered on by Linux\n", dcfg->lmid);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  static int imx_rproc_prepare(struct rproc *rproc)
> >>  {
> >>  	struct imx_rproc *priv = rproc->priv;
> >> @@ -980,6 +1078,93 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
> >>  	return 0;
> >>  }
> >>  
> >> +static int imx_rproc_sm_lmm_check(struct rproc *rproc, bool started)
> >> +{
> >> +	struct imx_rproc *priv = rproc->priv;
> >> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> >> +	struct device *dev = priv->dev;
> >> +	int ret;
> >> +
> >> +	/*
> >> +	 * Use power on to do permission check. If rproc is in different LM,
> >> +	 * and linux has permission to handle the LM, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
> >> +	 */
> >
> >Two things here:
> >(1) This whole comment describes what this function does rather than what the
> >code is doing in the next few lines.  As such it needs to be moved above the
> >function declaration.
> >(2) We know the M7 is in a different LM, otherwise "dcfg->lmid == info.lmid" in
> >imx_rproc_sm_detect_mode() and we would not be here.  As such the comment is
> >wrong.  The only thing this code is doing is check if the remoteproc core is
> >responsible for the M7 lifecycle.
> 
> Update in v6:
> /* Check whether remoteproc core is responsible for LM lifecycle */

Same comment as above.

> static int imx_rproc_sm_lmm_check(struct rproc *rproc, bool started)
> 
> >
> >> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> >> +	if (ret) {
> ...
> >> +
> >> +
> >
> >>>>>>>>>>>>
> >
> >> +	/* rproc was started before boot Linux and under control of Linux, directly return */
> >> +	if (started) {
> >> +		priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> >> +		return 0;
> >> +	}
> >> +
> >> +	/* else shutdown the LM to save power */
> >> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> >> +	if (ret) {
> >> +		dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> >
> ><<<<<<<<<<<
> >
> >        /* Shutdown remote processor if not started */
> >        if (!started) {
> >	        ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> >	        if (ret) {
> >		        dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
> >		        return ret;
> >	        }
> >        }
> >
> >	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> >
> ><<<<<<<<<<<
> 
> Thanks for your code snippets. Update in v6.
> 
> >
> >This patchset would be a lot easier to digest if you had split the support for
> >CPU and LMM protocols in diffent patches.
> 
> I appreciate your detailed review and the code snippets you provided. Please
> let me know if you'd prefer that I split the support for LMM
> and CPU into separate patches in v6, or keep them combined as they are.

Please split.

> 
> Thanks,
> Peng.
