Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204F42620DD
	for <imx@lists.linux.dev>; Fri, 28 Feb 2025 10:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740737215; cv=none; b=F84nH5ylY/RCG4CXRnPeQGHd3YH0iqGPeMNdcMm4ThP3d4OxpgLuaOtgKQV4V5RjDHK7qAS99cVg2d/zfiLSp4RlEbBKGhCif7JtBV9+2hULT/cotXH/JM+YcEFM4TO2YXxb9Rep100bb0XyI5TIGV3qoZ3Xpk0kVs+hsMdEYAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740737215; c=relaxed/simple;
	bh=xJryABLIv+31jUswzXH51MKt/z5cwbhyQ2XUnSSX82c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dzxkShmIGzfcw0N7DfTaskIpR5fZYmgtcoWUjBLZ7sK1Ute/8v+MleO7HJ8GuM4PffSm37FetlCG8VGxIQKuoIKWMjfF3qxyDWz4tzmxK5e+L86Io84HHEWtD8cQxJ0Q8NryFy+dcJiWrEkB167en0IsbAItAc32+2j7cm696/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=hsMvVb6D; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Fvx1hIAI reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="hsMvVb6D";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Fvx1hIAI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740737212; x=1772273212;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7UjylcZhDrHqEfo7yqLi8Yfpye96d9C9gSDdjBw2v0w=;
  b=hsMvVb6D4g2chQ90jqd7j2M5mkYevY+RkxwgHBi9Q6tFzFDF7vX9zQ1b
   G9ETd/fvOwzYdgEyYJsCmI4tg5KAscchPAL6k/xvx+XKgniULV3tF9hoQ
   /fuE33zb0QhAGe8l8YPaTtazhNEWtmgY3mOMFq4qDfpF+9AY6r1WtqVWs
   afrb9AHMgLgcFj1V4E5X+Q8RBRVt5CIYvA8ZWCcC5rHoRsOryaLZZPg8a
   y/4zcSjrD4s42+NAEVzEkFv9XA3BPKwP1Oa4gVn7WNr3HiTB3GFZftMdv
   aPHj+gOHlcDykWC+SCQMIykQdXgfGobwO9IsdP7wd5mKcEskubD4TyGe8
   Q==;
X-CSE-ConnectionGUID: dLZ25iIRRtiBj98dxD8a4g==
X-CSE-MsgGUID: UcAor732TXyFThfCnesRdw==
X-IronPort-AV: E=Sophos;i="6.13,322,1732575600"; 
   d="scan'208";a="42171062"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Feb 2025 11:06:49 +0100
X-CheckPoint: {67C18AB9-1E-A2FC2151-C3FA4B33}
X-MAIL-CPID: E78A661758568EAC10083EAA25773422_0
X-Control-Analysis: str=0001.0A002111.67C18AB9.00C7,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB12316449D;
	Fri, 28 Feb 2025 11:06:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740737205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7UjylcZhDrHqEfo7yqLi8Yfpye96d9C9gSDdjBw2v0w=;
	b=Fvx1hIAIK68mVmmpZGImxQ4O3hNXVAcYOeWyZ0eO6+DtyqEEdI1UvlKfxbzLlrnBEWfyxk
	g9CzVxIlIJnOxREDc0rkb2ouxGaipcRUYVSAJaYwpAig2trTgXevR2B3TQYXOmcnrw1gHl
	Y+Ff62oDsqGIacwNVuHNO+QaVdKK8keDiNnspxsQz+nAqz77AiuskLZwOxNhSEo4eokn5W
	XgwCVw+2ViLz5plRnbRdUMbxab0grgcTfwlvb9SQzgs0w6KJ8cSGx9/tQz4DIFRuaVygcp
	fDMlmpWevShFQjVrLnAJqsl0jZuqBkfdDJlJrCLjsy8tlfThE5US0CF9fbeUaA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 4/9] drm/panthor: Implement optional reset
Date: Fri, 28 Feb 2025 11:06:43 +0100
Message-ID: <2180166.OBFZWjSADL@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250227170012.124768-5-marex@denx.de>
References:
 <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-5-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Marek,

Am Donnerstag, 27. Februar 2025, 17:58:04 CET schrieb Marek Vasut:
> The instance of the GPU populated in Freescale i.MX95 does require
> release from reset by writing into a single GPUMIX block controller
> GPURESET register bit 0. Implement support for one optional reset.
>=20
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
>  drivers/gpu/drm/panthor/Kconfig          |  1 +
>  drivers/gpu/drm/panthor/panthor_device.c | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_device.h |  3 +++
>  3 files changed, 27 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kc=
onfig
> index 55b40ad07f3b0..ab62bd6a0750f 100644
> --- a/drivers/gpu/drm/panthor/Kconfig
> +++ b/drivers/gpu/drm/panthor/Kconfig
> @@ -14,6 +14,7 @@ config DRM_PANTHOR
>  	select IOMMU_IO_PGTABLE_LPAE
>  	select IOMMU_SUPPORT
>  	select PM_DEVFREQ
> +	select RESET_SIMPLE if SOC_IMX9
>  	help
>  	  DRM driver for ARM Mali CSF-based GPUs.
> =20
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/p=
anthor/panthor_device.c
> index a9da1d1eeb707..51ee9cae94504 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -64,6 +64,17 @@ static int panthor_clk_init(struct panthor_device *ptd=
ev)
>  	return 0;
>  }
> =20
> +static int panthor_reset_init(struct panthor_device *ptdev)
> +{
> +	ptdev->resets =3D devm_reset_control_get_optional_exclusive_deasserted(=
ptdev->base.dev, NULL);

If the description as a write-once register is true, wouldn't this
already write to it?

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
> =20
> +	ret =3D panthor_reset_init(ptdev);
> +	if (ret)
> +		return ret;
> +
>  	ret =3D panthor_devfreq_init(ptdev);
>  	if (ret)
>  		return ret;
> @@ -470,6 +485,10 @@ int panthor_device_resume(struct device *dev)
>  	if (ret)
>  		goto err_disable_stacks_clk;
> =20
> +	ret =3D reset_control_deassert(ptdev->resets);
> +	if (ret)
> +		goto err_disable_coregroup_clk;
> +

This wouldn't work at all on a write-once register, no? Same for resume.

Best regards
Alexander

>  	panthor_devfreq_resume(ptdev);
> =20
>  	if (panthor_device_is_initialized(ptdev) &&
> @@ -512,6 +531,9 @@ int panthor_device_resume(struct device *dev)
> =20
>  err_suspend_devfreq:
>  	panthor_devfreq_suspend(ptdev);
> +	reset_control_assert(ptdev->resets);
> +
> +err_disable_coregroup_clk:
>  	clk_disable_unprepare(ptdev->clks.coregroup);
> =20
>  err_disable_stacks_clk:
> @@ -563,6 +585,7 @@ int panthor_device_suspend(struct device *dev)
> =20
>  	panthor_devfreq_suspend(ptdev);
> =20
> +	reset_control_assert(ptdev->resets);
>  	clk_disable_unprepare(ptdev->clks.coregroup);
>  	clk_disable_unprepare(ptdev->clks.stacks);
>  	clk_disable_unprepare(ptdev->clks.core);
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/p=
anthor/panthor_device.h
> index da6574021664b..fea3a05778e2e 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -111,6 +111,9 @@ struct panthor_device {
>  		struct clk *coregroup;
>  	} clks;
> =20
> +	/** @resets: GPU reset. */
> +	struct reset_control *resets;

Your commit message says "one optional reset", so I would name this just
reset.

> +
>  	/** @coherent: True if the CPU/GPU are memory coherent. */
>  	bool coherent;
> =20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


