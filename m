Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6A533F8AC
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 15:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761838119; cv=none; b=q6rCVZagX+PQ4ZSxR5OaPq1TVzv8p8zWL4RPyaUx1GATxPv8qYXXEJo4LRiW5CcPn6MBKX9r490LnGqk0WA/v6FY7nK2Hgy07Sj+7TwA1kOVoui9GdeMEOSfjXjovD8Vq1c83ut9dwlMg+gsBv+vzTYMO/MJ7jz3GMOmJjQCQXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761838119; c=relaxed/simple;
	bh=XHZMcK+5OSpCXFB1wFSnCNpApeCmcMqWLIl2TOiFHK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rlkZ7betv1Isf+I8W5yLZ18aBIDK9TW/IhQdZ3WzdN+vqoK0JKosHV9vjtPzGdDMkmVk79clR5dOVjhrMTZrEw/TtYvCGGTZE4rDTdfwfjbKk8rSVLuHcaczljTx+PU/MQEzyHnr57yPiaZaOEqhfl4XiexcrWtkTknkz6rijzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2167A2C42
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 08:28:28 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A6CF63F673
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 08:28:35 -0700 (PDT)
Date: Thu, 30 Oct 2025 15:28:33 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
	steven.price@arm.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, xianzhong.li@nxp.com,
	Rain Yang <jiyu.yang@nxp.com>,
	Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
Subject: Re: [PATCH v3] drm/panthor: attach the driver's multiple power
 domains
Message-ID: <aQOEIdRM2yk0JhLt@e110455-lin.cambridge.arm.com>
References: <20251022092604.181752-1-jiyu.yang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251022092604.181752-1-jiyu.yang@oss.nxp.com>

On Wed, Oct 22, 2025 at 05:26:04PM +0800, Rain Yang wrote:
> From: Rain Yang <jiyu.yang@nxp.com>
> 
> Some platforms, such as i.MX95, utilize multiple power domains that need
> to be attached explicitly. This patch ensures that the driver properly
> attaches all available power domains using devm_pm_domain_attach_list().
> 
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Suggested-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
> Signed-off-by: Rain Yang <jiyu.yang@nxp.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index f0b2da5b2b96..c39b9812eaa7 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -64,6 +64,16 @@ static int panthor_clk_init(struct panthor_device *ptdev)
>  	return 0;
>  }
>  
> +static int panthor_init_power(struct device *dev)
> +{
> +	struct dev_pm_domain_list  *pd_list = NULL;
> +
> +	if (dev->pm_domain)
> +		return 0;
> +
> +	return devm_pm_domain_attach_list(dev, NULL, &pd_list);
> +}
> +
>  void panthor_device_unplug(struct panthor_device *ptdev)
>  {
>  	/* This function can be called from two different path: the reset work
> @@ -218,6 +228,12 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = panthor_init_power(ptdev->base.dev);
> +	if (ret < 0) {
> +		drm_err(&ptdev->base, "init power domains failed, ret=%d", ret);
> +		return ret;
> +	}
> +
>  	ret = panthor_devfreq_init(ptdev);
>  	if (ret)
>  		return ret;
> -- 
> 2.39.5
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
