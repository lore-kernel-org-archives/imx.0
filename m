Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C80359A79
	for <imx@lists.linux.dev>; Tue,  7 Apr 2026 15:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575180; cv=none; b=XUoZannQwult32NrwjmxBkN9Ll3KKV0bXX9KpJjxTkdauL7El9Jxm879tJZhrKBDWoFOhcpGbAFn0as6DGG5Yavu5NQ8p7snlXXF1GpKg0c4fo2lY+k/R5r7CVTFDqXj6Kpna/gzly0TFNskM0u6Y0pP7psfxPtVrg3ln+Nn5VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575180; c=relaxed/simple;
	bh=Esr4m/CWzlzGxIEXM4jv9Iy3Hrt7tqhgId2RGV+BjP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PkYh++CIG+O+kJoRedv87Dd10X2xrK4D3sc/7mCwcltOw9TwKhY4Bqj9Xc89gHbnMQosPR20BZDUuR26efIpQhz0zJQtrpA95dvenwvXA/EzG5ikNDwQXkLq7DV9nkV1O+tgBzRz+9wdZ806PAeQNYIU7SaMTaRwgDTk/WvvGbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VYGeMPdF; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VYGeMPdF"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82a7ebc729dso2216891b3a.3
        for <imx@lists.linux.dev>; Tue, 07 Apr 2026 08:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775575178; x=1776179978; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=px+aTSO680+yUdTUoCh2tkBc+4urCGyGCdnmZi+tHi8=;
        b=VYGeMPdFFmCp51FS5JwoZG5DJl4iMzu3ujAEehnzyN3AlmCfvIYNeNaH7Gz8Db0D5b
         sZindc7+n3B2RtJl3zOdDuLZhOHAAp/rDp2NGpR1TkXR9oz3RRVU7cdK1DunK+5cXmiZ
         aB5NaYJlVvwmMtXdQYSF05UCni1J8phXIX4DQydOZL4RDmENplSkHL36HVh1ZANQ5Qb5
         bEplyh9agt/0UZ3X5YA1L/otFS7wzxk5u8k+URr8+SR0xXxgKTbv90cPgUaUpcLo9bBi
         QS7lU6m7Cjw6SgcEiIMtheNt8XzSNIeoKtR8ueKmIPB0wHjJRiy+oBCwZ4zcQjtVxero
         Tczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775575178; x=1776179978;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=px+aTSO680+yUdTUoCh2tkBc+4urCGyGCdnmZi+tHi8=;
        b=THgxMfEPYHDmLTdGoDG9cQxvZxn6baySwzh7KyeqELYYvgMiF04iEQMhyGhE4wowZ0
         WD1UaAiylMQI5VuFlUakYkKzHC0ZURTB66nSLS64yZAesdlHhWUt13pGeu2fuslFZeIZ
         ikEjVT8tihU9Ub3v7Di86POeyCIfQULCvKEpn9nUo6dq+5BOJUJBehYyy4LqNK82maOW
         57cwI35mpTwrO8BQs9H6d8h27XXjIyYgHg6pmC05paC+INfZf67WgG+jVwIqBNSNrjxc
         iD8Jx2O8WBul2G+fNlplp4U93XAljfWGpAxD7hODZP8SbIX+E3Hg+fMGSGQ08uP90fcI
         sk0A==
X-Forwarded-Encrypted: i=1; AJvYcCXe9XleToJRGP4RiaPhIBPF56/0vE/Qozx+SL9LFRjmRVgZ10Hkp0k0ITH8oxDGhezByqE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYJT490oPecY4dVE/j5Nr66KzZGgQnsm+Z+ICE9hBK2cJzQAT2
	TwAlx3kUsR0pi0hTcqtmuNnEUdJAUFMcuSVWFpa/QB2a3OO4yOO+0YGXJXfUfcqqjbQ=
X-Gm-Gg: AeBDiesn6zTLWMo9ovtwkzaAdPqJ/gPTFkomwkKJD5WONC9Z8K4voTJqbxMMpwRsQBP
	iwiYJzN6pmi6T/RnbyayxNh4DM5qcJyxFypW41Yo7wJJyKqeF+UEmDMKu5r08fQUl13cov332vd
	SzZSkc8DdUGlyWlMbubQmHewocPg1zhMN2R97ZOwYx17d6HOJbQ/ydPFgGz5iPX0P9X+Bvkd3+C
	OOYkMCWy5yKz8pedJylkH7GwOSul0WU+RnUiQnOtkhHfcG7O8PC0tpf940xPaJrGPHojesaCcY1
	r49G4oIkEZ7BJIa2PGFPG9aNkeMd0fup6OMn1/caGhDjrZEJhoTmt8jKeo+yv0VkQ0efO3Jp0ZT
	Ai2G/lANi7VMmEDxWIMISPhU3PHLD6rfCcv0RmoCUmnywpIn17MV9pgH/2LzqMPHeEd8y43LE26
	84WdIfZQJnfIvmHFpf0XvFhmyrilM=
X-Received: by 2002:a05:6a00:3926:b0:7f7:2f82:9904 with SMTP id d2e1a72fcca58-82d0da2c50cmr17909669b3a.5.1775575177733;
        Tue, 07 Apr 2026 08:19:37 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:97a2:befd:d439:79fb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c6ba2fsm18101364b3a.45.2026.04.07.08.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:19:37 -0700 (PDT)
Date: Tue, 7 Apr 2026 09:19:34 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
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
Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to SM
 CPU/LMM reset vector
Message-ID: <adUghiyZbe3fmcNX@p14s>
References: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
 <20260327-imx943-rproc-v2-2-a547a3588730@nxp.com>
 <acqjS440STRl2sK2@p14s>
 <acs2PAZq2k3zjmDW@shlinux89>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acs2PAZq2k3zjmDW@shlinux89>

On Tue, Mar 31, 2026 at 10:49:32AM +0800, Peng Fan wrote:
> On Mon, Mar 30, 2026 at 10:22:35AM -0600, Mathieu Poirier wrote:
> >On Fri, Mar 27, 2026 at 10:42:03AM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> Cortex-M[7,33] processors use a fixed reset vector table format:
> >> 
> >>   0x00  Initial SP value
> >>   0x04  Reset vector
> >>   0x08  NMI
> >>   0x0C  ...
> >>   ...
> >>   IRQ[n]
> >> 
> >> In ELF images, the corresponding layout is:
> >> 
> >> reset_vectors:  --> hardware reset address
> >>         .word __stack_end__
> >>         .word Reset_Handler
> >>         .word NMI_Handler
> >>         .word HardFault_Handler
> >>         ...
> >>         .word UART_IRQHandler
> >>         .word SPI_IRQHandler
> >>         ...
> >> 
> >> Reset_Handler:  --> ELF entry point address
> >>         ...
> >> 
> >> The hardware fetches the first two words from reset_vectors and populates
> >> SP with __stack_end__ and PC with Reset_Handler. Execution proceeds from
> >> Reset_Handler.
> >> 
> >> However, the ELF entry point does not always match the hardware reset
> >> address. For example, on i.MX94 CM33S:
> >> 
> >>   ELF entry point:     0x0ffc211d
> >>   hardware reset base: 0x0ffc0000 (default reset value, sw programmable)
> >>
> >
> >But why?  Why can't the ELF image be set to the right reset base?
> 
> Per zephyr general link script[1]:
> ENTRY(CONFIG_KERNEL_ENTRY)
> 
> CONFIG_KERNEL_ENTRY(_start) is the first instruction that Cortex-M starts to
> execute.
> 
> config KERNEL_ENTRY
>         string "Kernel entry symbol"
>         default "__start"
>         help
>           Code entry symbol, to be set at linking phase.
> 
> The hardware reset base is different: it is the address where the hardware
> fetches the initial MSP and PC values from the vector table. Hardware uses
> this base to initialize the stack pointer and program counter, and only then
> does the Cortex‑M begin execution at the reset handler.

That part is clear.

> 
> Aligning the ELF entry point with the hardware reset base on Cortex‑M systems
> is possible, but it comes with several risks.

I'm not asking to align the ELF entry point with the hardware reset base.  All I
want is to have the correct start address embedded in the ELF file to avoid
having to use a mask.

> 1, Semantic mismatch (ELF vs. hardware behavior)
> 2, Debuggers may attempt to set breakpoints or start execution at the entry symbol
> 
> [1] https://elixir.bootlin.com/zephyr/v4.4.0-rc1/source/include/zephyr/arch/arm/cortex_m/scripts/linker.ld#L103
> 
> Regards
> Peng.
> > 
