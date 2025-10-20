Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704442E0B69
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 07:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760947189; cv=none; b=Otw0eqWaLhCD3gS6HwnkPTumOTS7ni8SINZ1Pj0fmiA+AUWxgfMY0lOAwE5hH0CNA11Fnp04tJ9DNckMCIrQlr1rQtsP8seMvh37bIwIeDbQ3ypOidnzNqqJQS+dLQXmNf9svhXu4VWHPm9zZVuLAwLb531ySyyG2cP3pEmAGrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760947189; c=relaxed/simple;
	bh=cNIzRBLR2VNDxsPHGbdqUKpAui/g9FRb3KrqxF1ngIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UEkLVzSdGftegqW8kPaABFn14/n3Mz86uY5e2u9RrS/xLXhBShzFL8i7J3QCaAVVuE+7DlpDY8c5TwHIhNYoyyS9H5i3kf4h1BZNOqzq/e+weib1pxy+hnMp/hkv71zLGZ4fXT5Ot1+c8S392eFjKeeWGZ0guL5gY7Pn+6hX/AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B94581063;
	Mon, 20 Oct 2025 00:59:37 -0700 (PDT)
Received: from [10.57.36.117] (unknown [10.57.36.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33C493F63F;
	Mon, 20 Oct 2025 00:59:43 -0700 (PDT)
Message-ID: <77faf362-05bc-45b8-bddd-eed66ae70a63@arm.com>
Date: Mon, 20 Oct 2025 08:59:41 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: attach the driver's multiple power
 domains
To: Rain Yang <jiyu.yang@oss.nxp.com>, imx@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, xianzhong.li@nxp.com,
 Rain Yang <jiyu.yang@nxp.com>, Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
References: <20251013093438.125243-1-jiyu.yang@oss.nxp.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251013093438.125243-1-jiyu.yang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/10/2025 10:34, Rain Yang wrote:
> From: Rain Yang <jiyu.yang@nxp.com>
> 
> Some platforms, such as i.MX95, utilize multiple power domains that need
> to be attached explicitly. This patch ensures that the driver properly
> attaches all available power domains using devm_pm_domain_attach_list().
> 
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
> Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index f0b2da5b2b96..fbbc84e9efbe 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -167,6 +167,7 @@ static void panthor_device_free_page(struct drm_device *ddev, void *data)
>  int panthor_device_init(struct panthor_device *ptdev)
>  {
>  	u32 *dummy_page_virt;
> +	struct dev_pm_domain_list  *pd_list = NULL;
>  	struct resource *res;
>  	struct page *p;
>  	int ret;
> @@ -218,6 +219,12 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = devm_pm_domain_attach_list(ptdev->base.dev, NULL, &pd_list);
> +	if (ret < 0) {
> +		drm_err(&ptdev->base, "attach power domains failed, ret=%d", ret);
> +		return ret;

This fails on the rock-5b. I believe because the PM code automatically 
attaches a single power domain (as on the rock-5b) so this then returns 
-EEXIST:

[   11.433501] panthor fb000000.gpu: [drm] *ERROR* attach power domains failed, ret=-17

I notice that the tegra driver checks dev->pm_domain and only calls 
devm_pm_domain_attach_list if that is NULL.

Thanks,
Steve

> +	}
> +
>  	ret = panthor_devfreq_init(ptdev);
>  	if (ret)
>  		return ret;

