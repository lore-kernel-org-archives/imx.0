Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB3A3ACA65
	for <imx@lists.linux.dev>; Tue, 28 Apr 2026 15:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777388764; cv=none; b=pm1YB7P91y0PoCX/UpHh0p0Wmo6GyWbORVj+ry1a0u+9gQl/E/8caoYJlcScr1jnd6lSdmfD7dpLnbXVWlBS4CJoGMhmm38yXNfM5s8o88z4fTfCUiOYS0/H179O57IimUK9BuveneYsZRa0cNsR8ioB2Wo9TA2GeRXom3t8pRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777388764; c=relaxed/simple;
	bh=xoNuD8JS3btCKdjzs3bUeyqzNLPY3psjI8zo9aZsx9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SK4/zkcXnHnf5avv9KiI5pNbDuCza8towS6z54t0yno/u0SiB7A0xDDi3IzXz3XxEwKVQSaDvIU7eGekkuQL2fOJKEJfC3nJwiBPaZzBVEnxZG0VSMnzn6P3VhCC4V5SRavj830KzGDkW7e0ZwUEI5ZjBsHJ4ToOntFx9ybv61Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pW5z0hP1; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pW5z0hP1"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36146ae9dd4so9749645a91.3
        for <imx@lists.linux.dev>; Tue, 28 Apr 2026 08:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777388762; x=1777993562; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OfbUgiQnGWlnScYJSuysWPKlVFUYfQRRK1nJfSaqXew=;
        b=pW5z0hP1gGBEmLZih+n3UMzhS3JOgIs5s41qfjZlOvJsKZePHnmF/KiUSHdI/InRJq
         0mijnBmMcZVxloO0bU08KeXCCz/Ct9ueDIPoVn54KgzO19BWf8VCTlkSl7fTMioIu26t
         ye0giYQ0fYtXFhHwxL+8lGj3v1WOm2beEFJOWeidgTOxTZY9qeKDQ1f+nqdIjElUKnDD
         ot2fLNWQi0BlUx+9gWPorsPCLgAlctHFvj77bGFoLm4JEcymEIzYnNzaF5QHGOY5yTo+
         SsXGztYUO7CFMVTPUKvy1+2hJubDd1wLkizC3Gak0NJ7OmzBIstl0G35GcfUlA4gK6Nr
         AFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777388762; x=1777993562;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OfbUgiQnGWlnScYJSuysWPKlVFUYfQRRK1nJfSaqXew=;
        b=Rc1hw00x78GZm4gwC4R83Wt2uOIWW9sa9cAlr4ks8esbr7rYleQ7q3hNh3kTgDXwJT
         1Gp6UdIkqX6iUPvz8dCx/T5uD19QLI8NUnPzjm6Wy8SFwhVoaXBWQflVgWfU+7nrCxkK
         pM+jZZcLqHpRpZzb8/W9PZQxdE6Fn7Zx7Wmr1GwKQkkawwBc/h1EQPCPx53lf1iHJNS1
         pAHdawiRNTP0LlpElggoeGt1rkAxVxxM3lDUl1S5z1nZBbL3ntKit0ZuV9zkWZyekvUi
         /svX8Dx8m1Tk0HAXdRASDqhb4/w9h77Q46QD1GXAbXyjZA8Eqhrex04Wre11HEdj4Qpz
         FCgw==
X-Forwarded-Encrypted: i=1; AFNElJ+KAuDgfKDZpQoAmrtE2eM1Wm+B5UCLbtKNyQ8QMbOaBBf3HwU8i/DK1Q5jsnBrAnRX7Tg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzoHIF/5TBiI8F88/8mWRdCk1WywNv/mrFXn1M/GzsYpIQJvPGB
	9ywe/O7ggDGmgD6KgLy+F48CIU4bBEM41nYH9LqH2uhyOYe4wWdmWw2Jw/cCtcHxhWQ=
X-Gm-Gg: AeBDieunSDBJk7WB3MCft+9HiKBmUdJWy2qR1rNR1GLrvR4DNbFObEmK40c03N+JMNP
	Y8sN4KZnoNVNhb7yd3D5wymeJk4+kDcOcaPcQrw9+0WnnO8RFoGqv4XEgcATWaVQl2BaC8wpJYL
	P9y5LUcAQhEiXYibdzYJ7jYrBVxdLx3M8B6bILF+oj/OcMQkyz/E+oZEbKLiOG04tivkOAb6C3q
	S+NWLkhZZvK4NBXFw5GNb3t04CJD2HI3V7LOCqvAik0tB1+CNsOPow//UdHaCEK2XZNH8a+tFF/
	LV4Lup0/pTzpl7sfbZ0478DUTRZpTl2Y54hiyY/CQc3cdAH/1mWXpeFe/lS+TIlEjjZh1M34agw
	gYJjpzQLJlUBuLEPs7RCQMCq++bW0HV20OSlIKBV+Z1h3RijQl9KdJ4grGsi66RGuraQcisfFkH
	eIL1lG6sXNLLczbyBhSgl9DtroJ+G6aTEFW6fuWA==
X-Received: by 2002:a17:90b:5291:b0:35d:a90d:580e with SMTP id 98e67ed59e1d1-36492046369mr3453884a91.23.1777388761787;
        Tue, 28 Apr 2026 08:06:01 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:a4ee:17e1:59a1:f1e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aa7b9d2sm29165775ad.11.2026.04.28.08.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:06:01 -0700 (PDT)
Date: Tue, 28 Apr 2026 09:05:57 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 0/3] Add i.MX94 remoteproc support and reset vector
 handling improvements
Message-ID: <afDM1Vhw77l3zpCr@p14s>
References: <20260427-imx943-rproc-v4-0-68d7c7253acd@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260427-imx943-rproc-v4-0-68d7c7253acd@nxp.com>

On Mon, Apr 27, 2026 at 10:41:23AM +0800, Peng Fan (OSS) wrote:
> This series adds remoteproc support for the i.MX94 family, including the
> CM70, CM71, and CM33S cores, and derive the hardware reset vector for
> Cortex‑M processors whose ELF entry point does not directly correspond to
> the actual reset address.
> 
> Background:
> Cortex‑M processors fetch their initial SP and PC from a fixed reset vector
> table. While ELF images embed the entry point (e_entry), this value is
> not always aligned to the hardware reset address. On platforms such as
> i.MX94 CM33S, masking is required to compute the correct reset vector
> address before programming the SoC reset registers.
> 
> Similarly, on i.MX95, the existing implementation always programs a reset
> vector of 0x0, which only works when executing entirely from TCM. When
> firmware is loaded into DDR, the driver must pass the correct reset vector
> to the SM CPU/LMM interfaces.
> 
> Summary of patches:
> [1]dt-bindings: remoteproc: imx-rproc: Introduce fsl,reset-vector-mask
> Adds a new DT property allowing SoCs to specify a mask for deriving the
> hardware reset vector from the ELF entry point.
> 
> [2]remoteproc: imx_rproc: Program non-zero SM CPU/LMM reset vector
> Ensures the correct reset vector is passed to SM APIs by introducing a
> helper (imx_rproc_sm_get_reset_vector()) that applies the reset‑vector
> mask.
> 
> [3]remoteproc: imx_rproc: Add support for i.MX94 remoteproc
> Adds address translation tables and configuration data for CM70, CM71,
> and CM33S, enabling full remoteproc operation on i.MX94.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v4:
> - Daniel raised the M33S secure region was not included, but since I not
>   have image to test secure region, so drop the Secure alias region for
>   all. Updated DDR region. R-b kept since this is a minor change.
> - Add R-b for patch 2
> - Link to v3: https://lore.kernel.org/r/20260415-imx943-rproc-v3-0-9fa7528db8ca@nxp.com
>

I have applied this set.
 
> Changes in v3:
> - Patch 2: 
>   Drop R-b because of changes in V3
> 
>   Following suggestion from Mathieu that apply reset vector in
>   scmi_imx_[cpu,lmm]_reset_vector_set(), not change the meaning of
>   rproc->bootaddr, add helper imx_rproc_sm_get_reset_vector() to get reset
>   vector and use the hlper in scmi_imx_[cpu,lmm]_reset_vector_set().
> 
>   Add reset-vector-mask for i.MX95 CM7 to avoid breaking i.MX95 CM7
>   boot.
> 
> - Link to v2: https://lore.kernel.org/r/20260327-imx943-rproc-v2-0-a547a3588730@nxp.com
> 
> Changes in v2:
> - Drop fsl,reset-vector-mask by using fixed value in driver for per device
> - Add R-b for i.MX94 dt-binding
> - Update commit log to include dev addr and sys addr
> - Link to v1: https://lore.kernel.org/r/20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com
> 
> ---
> Peng Fan (3):
>       dt-bindings: remoteproc: imx-rproc: Support i.MX94
>       remoteproc: imx_rproc: Program non-zero SM CPU/LMM reset vector
>       remoteproc: imx_rproc: Add support for i.MX94
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         |  3 +
>  drivers/remoteproc/imx_rproc.c                     | 92 +++++++++++++++++++++-
>  drivers/remoteproc/imx_rproc.h                     |  2 +
>  3 files changed, 95 insertions(+), 2 deletions(-)
> ---
> base-commit: 724699d8d0523909da51fda8d1e10c1ff867b280
> change-id: 20260311-imx943-rproc-2050e00b65f7
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
