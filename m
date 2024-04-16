Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8B26EB45
	for <imx@lists.linux.dev>; Tue, 16 Apr 2024 21:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713304743; cv=none; b=fURNygmPm1zggenpPigDFIDQiPqAIewMfogrVRU31kFEsC1jH0rZd/h8cJdF3q1tVFY204g+jpQnpW/32PlYGaUZ6pVC2lSfPJ7dWw4mBGDYjMO6CknswkrOwbUNVsh5oDunu4/Uurj/h2m/T2hzmFYKAoN7o3+ZWQAMYgdryiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713304743; c=relaxed/simple;
	bh=XEoW389eSLuQ1EWHK2ao+NjLE5w0UuWoEmY0QujQk4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IqZK0huFneTQCUqPoN0rBcKgJ1IZt/ueOBwsyYH3FWmG1poxY0EC24gxWsT+ln5wsnqB54bQo0Yzu1q+a7RYFDO8yP27CIkvf63qJob3ewEBe5SNorcRJWmBYjeObDqxf8NLiVXF7C6PWDAthvPNiaJTDq/tPD5Bm9qz/rSqC+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dAXXFbG3; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dAXXFbG3"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-516d0161e13so6054111e87.3
        for <imx@lists.linux.dev>; Tue, 16 Apr 2024 14:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713304740; x=1713909540; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FrWqLDNPHgTIgEAwm/yBGkXHJJ9fe1QtFWXIQREdmco=;
        b=dAXXFbG3846u6XgWHCWzY0rnR+pWrTqabj47ds9yScWSBsX1yfrA0T3mYBooM03S/+
         lpTNL9Rg0PYc+hxJICCSAQ2FGVzE9c5G0s9do7GJYmgaZahpu359ZcnTLnx3DqOBP40c
         6pdG2iTzBExnJwgsp2QtMjf08wezBNjtZIeBQIzlZHh/cb8JS0HMb2LqTpuwT66CsJhO
         gDt4S5GFcHsbR1yi2WTUejRyM3LULVkDxVEUvP9qd/ketT8KUopCT0JVfdSbILjqdjdZ
         8EA+UMOtdVlEBNVjk4075MNgv+gVARi5ELmpqFERQvkci8PTWGKa4vM/kQpG3l2u2YBK
         Lh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713304740; x=1713909540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrWqLDNPHgTIgEAwm/yBGkXHJJ9fe1QtFWXIQREdmco=;
        b=dO9eSm3SU3DHDIJFHKZCq/oLZOFBdedXZQnle+yJ5Ps9RAPam5s4Oi36PQJ4bpw1aH
         HekX3NCz3Qyb4Rt/c1hS8WtNYMT/YobDlbdJYJgunLHOOz5LBKt4MPvkZh9k2bCPsOQ2
         gmoegz3SMkAuIs0q3XxORx/djPXLo8JAT5k7BW5L38ClRK/2Gh5DWgkalS3pgLj29R1r
         +N1NxtHJMJ4RHi7j52vhf6E40754zsgKnfy2CYC+klydbdY3vK17l6O8P6wjbNeLBS96
         fxKz3pEZJCkxD8qmPviDkkU27uiEa3sry7FuAG+Isj1yRx+flCTcO6r2USM/I/NSAX9z
         +0qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhoMjysxZ64O8zwLcwPqEtyDirG2i8fkb0yvQs0CxbJtB5Y7rWZpHKJOh8Oxy4/7PcR4NAMmb/SyxfYBC5vsoGJ2E1
X-Gm-Message-State: AOJu0Yy1g6xLKe6cuavt6DiTOp0WX3iHnVbcF+rzU1wmtxitQxgh5zfU
	FdTkPFbzjJlvNQiRXvQSZRVg9bG1Pjtafjj6Hl8wqHIdWGxwyKdfztWQAqpOW+k=
X-Google-Smtp-Source: AGHT+IHIWdijioLtvYC5fIdBBwJ5eA/9DxE81hqHqTOf/GfjKH/Bjt5bQdrOAL/NR1UOMamRdStcwA==
X-Received: by 2002:a05:6512:1c7:b0:516:d3ba:5602 with SMTP id f7-20020a05651201c700b00516d3ba5602mr9510074lfp.16.1713304739613;
        Tue, 16 Apr 2024 14:58:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id k5-20020a05651210c500b00518c1a1d370sm984687lfg.101.2024.04.16.14.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 14:58:59 -0700 (PDT)
Date: Wed, 17 Apr 2024 00:58:57 +0300
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
Subject: Re: [PATCH v2 00/12] drm/imx/ipuv3: switch LDB and parallel-display
 driver to use drm_bridge_connector
Message-ID: <yh4r2pgdl2m5wp627r35zse3obacmeanin5rjo34f7tctgpix2@dme3vwzaivag>
References: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>

On Sun, Mar 31, 2024 at 11:28:57PM +0300, Dmitry Baryshkov wrote:
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
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Fixed drm_bridge_attach flags in imx/parallel-display driver.
> - Moved the legacy bridge to drivers/gpu/drm/bridge
> - Added missing EXPORT_SYMBOL_GPL to the iMX legacy bridge
> - Link to v1: https://lore.kernel.org/r/20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org

Phillip, Shawn, Sascha, any comments on this patchset?


-- 
With best wishes
Dmitry
