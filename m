Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7802D25744D
	for <imx@lists.linux.dev>; Mon, 24 Mar 2025 08:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742805829; cv=none; b=fYZYtxF0Kktce0z8PFKIXwcBshqT2BCW50e6sohoC1QWkz238EFlFX5UnjPqFnrm4jIq6+ubeBGjHr3VBF/BdcJsu8UsCtTyGasRtQ5lIZfLnFGBEsC3hUL4+zWS79+SkWpnVGKM6Ju2KTlSbI+ZrPWF7bXzxjf3a+dsFmnN23k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742805829; c=relaxed/simple;
	bh=GHS3IpXQhdYO4TFfzI7IaDKnCl40cRYwui87XEEhlGg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q+qNAMtJ4sQT2mRAprbuTWiPgTgL6WAnoRVEStZENHdJ/R6lFSIwGzFg1xnvOOJ3wolvn7XkVllSPC9gvVq7S0DbQDrVswi5JCXcvdHZEJ4pPhHcY4ZoqRebQBSlew7T/GV9DJq3q4pz5L3ZkW9wGuBRgFTOG0+7uss2OztACn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LUfPERqY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LUfPERqY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742805818;
	bh=GHS3IpXQhdYO4TFfzI7IaDKnCl40cRYwui87XEEhlGg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LUfPERqY2YeNmCMthC0TWEUy+C9p14zzstnLfbgvjTbPch2DOxOaKqVujvW2HNvYB
	 +y39XCzpLEB/mQgovQmJQBZaVRbKBU7h3hZhawqAq9iFSMC97KCFaV2ac363LVS7We
	 4i90Dk1PBGO8pG/Qd0S3C+2SYGfUDIR46u/gu0qjxaZ1Zcn+qhOVMPLTf4c+QYWIZg
	 ZEv0Me5JE0QWWJ04ySu49wsr9DI4q62r+covXy7rnNWQSiCqfFFPLRvzHgBque2leE
	 b7bk+wBjFCTZ+YE/zpkamGNVMpTr1ZMPbvHcnBjGb7oRl9arCUz7yN86YXHBo9fewF
	 +ufZ6ufEzz8cw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2F25417E0B12;
	Mon, 24 Mar 2025 09:43:38 +0100 (CET)
Date: Mon, 24 Mar 2025 09:43:33 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley
 <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, Steven Price
 <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
Message-ID: <20250324094333.7afb17a1@collabora.com>
In-Reply-To: <20250321200625.132494-5-marex@denx.de>
References: <20250321200625.132494-1-marex@denx.de>
	<20250321200625.132494-5-marex@denx.de>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 21 Mar 2025 21:05:54 +0100
Marek Vasut <marex@denx.de> wrote:

> The instance of the GPU populated in Freescale i.MX95 does require
> release from reset by writing into a single GPUMIX block controller
> GPURESET register bit 0. Implement support for one optional reset.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: Drop the select RESET_SIMPLE from Kconfig
> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_device.h |  3 +++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index a9da1d1eeb707..51ee9cae94504 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -64,6 +64,17 @@ static int panthor_clk_init(struct panthor_device *ptdev)
>  	return 0;
>  }
>  
> +static int panthor_reset_init(struct panthor_device *ptdev)
> +{
> +	ptdev->resets = devm_reset_control_get_optional_exclusive_deasserted(ptdev->base.dev, NULL);
> +	if (IS_ERR(ptdev->resets))
> +		return dev_err_probe(ptdev->base.dev,
> +				     PTR_ERR(ptdev->resets),
> +				     "get reset failed");
> +
> +	return 0;
> +}
> +
>  void panthor_device_unplug(struct panthor_device *ptdev)
>  {
>  	/* This function can be called from two different path: the reset work
> @@ -217,6 +228,10 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = panthor_reset_init(ptdev);
> +	if (ret)
> +		return ret;
> +
>  	ret = panthor_devfreq_init(ptdev);
>  	if (ret)
>  		return ret;
> @@ -470,6 +485,10 @@ int panthor_device_resume(struct device *dev)
>  	if (ret)
>  		goto err_disable_stacks_clk;
>  
> +	ret = reset_control_deassert(ptdev->resets);
> +	if (ret)
> +		goto err_disable_coregroup_clk;
> +
>  	panthor_devfreq_resume(ptdev);
>  
>  	if (panthor_device_is_initialized(ptdev) &&
> @@ -512,6 +531,9 @@ int panthor_device_resume(struct device *dev)
>  
>  err_suspend_devfreq:
>  	panthor_devfreq_suspend(ptdev);
> +	reset_control_assert(ptdev->resets);
> +
> +err_disable_coregroup_clk:
>  	clk_disable_unprepare(ptdev->clks.coregroup);
>  
>  err_disable_stacks_clk:
> @@ -563,6 +585,7 @@ int panthor_device_suspend(struct device *dev)
>  
>  	panthor_devfreq_suspend(ptdev);
>  
> +	reset_control_assert(ptdev->resets);

Hm, that might be the cause of the fast reset issue (which is a fast
resume more than a fast reset BTW): if you re-assert the reset line on
runtime suspend, I guess this causes a full GPU reset, and the MCU ends
up in a state where it needs a slow reset (all data sections reset to
their initial state). Can you try to move the reset_control_[de]assert
to the unplug/init functions?

>  	clk_disable_unprepare(ptdev->clks.coregroup);
>  	clk_disable_unprepare(ptdev->clks.stacks);
>  	clk_disable_unprepare(ptdev->clks.core);
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index da6574021664b..fea3a05778e2e 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -111,6 +111,9 @@ struct panthor_device {
>  		struct clk *coregroup;
>  	} clks;
>  
> +	/** @resets: GPU reset. */
> +	struct reset_control *resets;
> +
>  	/** @coherent: True if the CPU/GPU are memory coherent. */
>  	bool coherent;
>  

