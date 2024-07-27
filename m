Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72363B182
	for <imx@lists.linux.dev>; Sat, 27 Jul 2024 11:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722079034; cv=none; b=CUqedTS9Kd8OtIA0brqsCh6yDJve6a+zUl3BB0BAVd5PYlpZL4Us7VfYNZExrVnRuXLlJ5rtu4efPlsv5eaSbksg/flVqwLQr75QCm0EMQGq02Eit0wF+9C1QpqF1ISPe4S3FQjAH8PWveZ2aXBrlijFUJG5HYTEhAWvsiYqPfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722079034; c=relaxed/simple;
	bh=K/OyH/TONUiOndjiSj9G40F9VMCneoDFn/qv59esQ8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXF6FCr1v6A/V0qFpWPC6OdxL0drUDbXrLLwI32RJB+Im1gQfUJ+yRCuPS0+waJJ6KI0vaqzFtWIhCHNZwyJJxo9RM00nxc/USVi0tTOfi+w9ZbQomN738BO1gIk8yC6Q7mkgP9BrLEDdcMOiBUoWFCO0wM/aOFZMJtjcjYcq3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zjr/tjkD; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zjr/tjkD"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eeb1ba040aso33845731fa.1
        for <imx@lists.linux.dev>; Sat, 27 Jul 2024 04:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722079031; x=1722683831; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fkpa8TJ5OIzpKRb43AjTpsIXqFuO8ZOzenewpTC4PxI=;
        b=Zjr/tjkDdQu9S0wc9Z5kTXhfSdAT5MqJJBzI0ofmh00tEt1qn4B5MZKDEMTuQrGC3c
         ZN7w1Fwfp8sezHiNtxq+DQewxrypAb4GSv+VjmoefzisYvWyAF3fjrc/R9KWyJevPUfN
         DxVF7Y8Yu59vSfKJlfrmb6BqyRzcfa86FwkhtVeoLglGeRuvEXfYc4w9NPb0fP045mpN
         wxXYgsHseeChvaIfpMTii4b6ZhslHIgQkCW5SxBn/2G4K6gpGoWGQ+4dngEMD0uevgVZ
         mFPmLNuRFHjRCFv1tbaPVHcShzrTk4BwsF+Zz+qI+tftGxqukWOHySj5egR062zN07Ob
         jtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722079031; x=1722683831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fkpa8TJ5OIzpKRb43AjTpsIXqFuO8ZOzenewpTC4PxI=;
        b=Tn/kgwmZFV9lhoeDoGVEleg5BzPYqrACE0bG7VICJlm2/ggwU0FAaXJVW1DFQibxXt
         V7FmzFKAoIQ18Cy+mtY2NaIZLeumjpoZYWfg/opLgqQX2FocIip0hnrjVm267j4WPXCk
         cyKtlPUIVZXoORjdCQ4qt7IxLbe56ogABWUvCP5+fUrxCo5P/ahubW3mrIFl3jrH2gp9
         kIP9xcst1/39MyNgBm6IlZo4yTDW0npI51xtdos6DU/tRq32Rq72VykA7I8F/NBis690
         w95yle+6DLJs7vORI/gO3RV2k+FbiwFGnDUh4jmv/95AjwOOiz1Mq72aRdiBX1r8upaM
         4Q6w==
X-Forwarded-Encrypted: i=1; AJvYcCV06woA9Kh5NtnzMeTSLSSm2b2JB6QAN6D7TSDBunQhEBcfKD1mj0z+F8Iwd0RWukUDjGHeLeD1UES6kW6qTr2XN4u9
X-Gm-Message-State: AOJu0YyTEXaZSrZbvBbGS11qas2AAdiiNrAybghS1rkcNs6EaHiG6E8s
	q6yTkeLS9uU3ynKp95ghKq7s6OSAgB+hEDWOktRPaF5ClCQOah/Onu9kLlbNi7Q=
X-Google-Smtp-Source: AGHT+IFV2u5maYoEb8aiufChQSWaSXHdEC+3/iMuz9LLuZn9KA+LN3EVhcasTTkA+CVS8KmRnu6Uww==
X-Received: by 2002:ac2:511c:0:b0:52c:dac3:392b with SMTP id 2adb3069b0e04-5309b27d5d1mr1449168e87.33.1722079030930;
        Sat, 27 Jul 2024 04:17:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c19dc4sm733863e87.221.2024.07.27.04.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 04:17:10 -0700 (PDT)
Date: Sat, 27 Jul 2024 14:17:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/12] drm/imx/ipuv3: switch LDB and parallel-display
 driver to use drm_bridge_connector
Message-ID: <uqsnphe2pm366xenpdvtsxvpkiewgmxoqyv2zvbgc3ewlx23mp@guesbce35jcm>
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>

On Sun, Jun 02, 2024 at 03:04:40PM GMT, Dmitry Baryshkov wrote:
> The IPUv3 DRM i.MX driver contains several codepaths for different
> usescases: both LDB and paralllel-display drivers handle next-bridge,
> panel and the legacy display-timings DT node on their own.
> 
> Drop unused ddc-i2c-bus and edid handling (none of the DT files merged
> upstream ever used these features), switch to panel-bridge driver,
> removing the need to handle drm_panel codepaths separately and finally
> switch to drm_bridge_connector, removing requirement for the downstream
> bridges to create drm_connector on their own.
> 
> This has been tested on the iMX53 with the DPI panel attached to LDB via
> LVDS decoder, using all possible usecases (lvds-codec + panel, panel
> linked directly to LDB node and the display-timings node).
> 
> To be able to test on the iMX53 QSRB with the HDMI cape apply [1], [2]
> 
> [1] https://lore.kernel.org/all/20240514030718.533169-1-victor.liu@nxp.com/
> [2] https://lore.kernel.org/all/20240602-imx-sii902x-defconfig-v1-1-71a6c382b422@linaro.org/
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v3:
> - Notice (soft) dependencies in the cover letter (Chris)
> - Select DRM_BRIDGE instead of depending on it (Philipp)
> - Dropped unused selection of DRM_PANEL (Philipp)
> - Added missing include of <drm/bridge/imx.h> to parallel-display.c
>   (Philipp)
> - Link to v2: https://lore.kernel.org/r/20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org
> 
> Changes in v2:
> - Fixed drm_bridge_attach flags in imx/parallel-display driver.
> - Moved the legacy bridge to drivers/gpu/drm/bridge
> - Added missing EXPORT_SYMBOL_GPL to the iMX legacy bridge
> - Link to v1: https://lore.kernel.org/r/20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org

Just a gracious ping, this has been without maintainer's review for
nearly two months.

Should we change ipu-v3 to the 'S: Odd Fixes' state?

-- 
With best wishes
Dmitry
