Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E832B33A6F1
	for <imx@lists.linux.dev>; Wed, 19 Nov 2025 16:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569366; cv=none; b=nlQmBbdXACB2bcc8IoTMSoc04gtetCxCz3FwLGn5HCWMSvZVKcdzQ46GaCiBa0LoRkfkBrJWVgjHPe6s52sUiQhdkzLmmJg6wc9vJOZ0eGbd0m5pPeJommJVzx9PiynBvgnVD708agQa7PDXahjtLKjgZop3STiPbLetuiThq0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569366; c=relaxed/simple;
	bh=4tZVfB9dJ+rmxklUVisjbT+aHHa2hP/95ghmvU1+jv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nd36MGa1Nz3E1ZE56hW9dgQ+/cHb856jQOgvEV0VQRdCBi6yHyDfBxfUjyODw8of7fqtwCKEKoA9+tptzoiseYcYmHiqgEDV9T8gDjYB7JpL57WmkuLy6Ym4fC53pc6s/xlvwlGgshotS8fbG3w0r+eZ6r6zW0y8L8gRocBjE00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LM83/0IQ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LM83/0IQ"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7bb3092e4d7so5514544b3a.0
        for <imx@lists.linux.dev>; Wed, 19 Nov 2025 08:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569364; x=1764174164; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SqgArqZqDLLZkxxlGxEl0Eyz/se4zZ6TXQ2QUXMksPc=;
        b=LM83/0IQSfGn+NZ+i3DMXnN/an9TpUafw9wh7VFxFASgbPmjhKEE9VCgqZ+2vHibTv
         e1dWKTnAaqD2TYaQtNd/mux3N9gR1STh3llDypa2lQU0u3IkZzBuw9oJL2rjcsAneXmv
         uwktkbdvTRQLPLTnLnZ4tn4M48gfq6fFFCFr8hZhir6oX5hVURb0ZoeJBm/eKozMt4mF
         w5D7xI1XBWHzmxbV72vk+snWW49lntJAJOcAY3bsaWndms5rHpJXItOYpmm7aCNIwViz
         o8eElDs/rLL2u4lGoUhgclIPCMnJhEr6R4b2bkSQPsk1uCET+WQefC6HVYwuPjRmobqN
         N8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569364; x=1764174164;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqgArqZqDLLZkxxlGxEl0Eyz/se4zZ6TXQ2QUXMksPc=;
        b=A41J6M0qMdxyHlbPUIgr6039jIl1U0V8+Bi+K3rkl0OLOtCEBRbIVyjZMDpKLfhFlG
         R/3scGc9X497gnH8xq2kLKZxo/bkO7SJbvYxwwtluWkEFdnju9ucBepWMZwPyj4AZ0Nj
         +PKEQiBRwtktrl7KLmWe0/tKDFTs5QnvNmzJh6eNs+XclPZKEWvvspOTewSDCF3TtxUP
         lat3HcsQWZH/A/biBWgxmw2Rimxt4w13lsyjCTZt3KTCTl00UFzGgqsJ8FdVjfqNzFg5
         xvwAnB9l1ehD7HxKYhHDoIFBhdhkMk6FkWq6NZfPfWWNKjDb48MBRskbW0qO8/C+1Wia
         5roA==
X-Forwarded-Encrypted: i=1; AJvYcCWIx8n6rTUlmZLtKEINHgstiuf2ASnlxEitZWRF1r2b/Zfjo13ws2oXkk8K30uTC810Zt0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvpXhbgj7qBui4xS6CChbUHeAQY5bXGaabb+5H+guaiM8OAUHN
	aZOfnf+DTz/H7iu+8NoReDcxA+vUu658oB/jY+mi+tu74ms6ZozONXRYMny8dY+QBjw=
X-Gm-Gg: ASbGncvYynPq1kz+fF8qsCIDnNiJoYegugMElLblsbGdviKxkFC8LlmatAzHY/g+8nl
	PPkgTZnLKzHe8Bw61cwqiuhE3P0oZKywFYQbGQe3BJ0idIn3TpR6I2h3StF//d/DNybaXbUHuEN
	56xrx9+ODdGMUKJG/v1WSEaUpBsozkGo8hHNjgqGsPsiP4iPRqTWQFz8FywiLtpva1goOrNXgjm
	XJk93UoyoOxdgu6mWo/0FF6SH2CcJNDdemEs0Y6U7UZpmFDsp4lmi2ZSjqKBsKFCpfiMvAu2rH5
	0ZdbNScEOvHaa9Vn85uf5t1KupMSSdcdMEfube+Omoj3W3RaTO3OYJW8EuL+wql/rrfngRHSWLQ
	JERzhKq8V9qpUzQUv1BK2Zv3dAQZqG1kZBQsW19Bpj+u/5QJ7GVNEKV5jQMHkT8P48cXEHdjrkx
	dj1PZ32kQFv/EG1w==
X-Google-Smtp-Source: AGHT+IHuSIrZBCiLgca0WU1DQj7ineP68uKwSXumgVfu9Fe9sbAmM4VWuP+tv6PTaJCg3+0A1H698w==
X-Received: by 2002:a05:6a00:812:b0:7ad:9e8a:1f72 with SMTP id d2e1a72fcca58-7c29c492acamr4056626b3a.14.1763569364343;
        Wed, 19 Nov 2025 08:22:44 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:f8d9:9ae3:90a2:d39e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ba611682cfsm17088879b3a.26.2025.11.19.08.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:22:43 -0800 (PST)
Date: Wed, 19 Nov 2025 09:22:40 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 00/12] remoteproc: imx_dsp_rproc: Refactor to use new
 ops and remove switch-case logic
Message-ID: <aR3u0F7FTZUgxCQ6@p14s>
References: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>

On Wed, Nov 19, 2025 at 12:21:45PM +0800, Peng Fan (OSS) wrote:
> This patchset aligns imx_dsp_rproc with the cleanup and modernization
> previously applied to imx_rproc.c. The goal is to simplify the driver by
> transitioning to the new ops-based method, eliminating the legacy
> switch-case logic for a cleaner and more maintainable design.
> 
> Patches 1–5: General cleanup, including code simplification and adoption
>              of the devres API.
> Patches 6–10: Transition to the new ops-based approach, removing the
>               switch-case structure.
> Patch 11: Remove the obsolete enum imx_rproc_method.
> Patch 12: Cleanup goto based logic.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v4:
> - Collected R-b and T-b
> - Address the build warning in patch 1
> - Add a new patch 12 to cleanup the goto based logic
> - Link to V3: https://lore.kernel.org/imx/20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com/
> 
> Changes in v3:
> - Collected R-b
> - Simplify commit log for patch 4 per Frank.
> - Link to V2: https://lore.kernel.org/all/20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com/
> 
> Changes in v2:
> - Collected R-b
> - Patch 3: Update commit per Frank/Daniel
> - patch 8: Use priv->dsp_dcfg->dcfg to avoid adding "const struct imx_rproc_dsp_dcfg *dsp_dcfg"
> - Link to v1: https://lore.kernel.org/linux-remoteproc/CAEnQRZAOTFw=sBppHTYQAdfDBuNqkqk6gVO4FyP0EBsva3Oi+Q@mail.gmail.com/T/#m27c93af9fb1e7fdeb0766bdbffbaae39d79eefab
> 
> ---
> Peng Fan (12):
>       remoteproc: imx_dsp_rproc: simplify power domain attach and error handling
>       remoteproc: imx_dsp_rproc: Use devm_rproc_add() helper
>       remoteproc: imx_dsp_rproc: Use devm_pm_runtime_enable() helper
>       remoteproc: imx_dsp_rproc: Use dev_err_probe() for firmware and mode errors
>       remoteproc: imx_dsp_rproc: Drop extra space
>       remoteproc: imx_dsp_rproc: Use start/stop/detect_mode ops from imx_rproc_dcfg
>       remoteproc: imx_dsp_rproc: Move imx_dsp_rproc_dcfg closer to imx_dsp_rproc_of_match
>       remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_MMIO switch case
>       remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_SCU_API switch case
>       remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_RESET_CONTROLLER switch case
>       remoteproc: imx_rproc: Remove enum imx_rproc_method
>       remoteproc: imx_dsp_rproc: simplify start/stop error handling
> 
>  drivers/remoteproc/imx_dsp_rproc.c | 353 +++++++++++++++++++------------------
>  drivers/remoteproc/imx_rproc.h     |  14 --

I have applied this set.

Thanks,
Mathieu

>  2 files changed, 186 insertions(+), 181 deletions(-)
> ---
> base-commit: 187dac290bfd0741b9d7d5490af825c33fd9baa4
> change-id: 20251119-imx-dsp-2025-11-19-fa99d7c84c91
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
