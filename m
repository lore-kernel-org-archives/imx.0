Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D40028751E
	for <imx@lists.linux.dev>; Thu,  2 Oct 2025 06:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759387098; cv=none; b=HhoKE8J80S0pkXiImpF8xCjI0eJ4odt/r+KMk3eOzXgxlawaZl1DMZrCWY/T5ohjh1LtZQCzXstb6D6WpaJLHT2wVBty/o9nVW/+vpkdC3Ct42sPi+FwKn3Ly4Yhbgij8bR1Wu9VzywPNF8zO5F2gajNVED/QyEfaXMqhMYxr0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759387098; c=relaxed/simple;
	bh=enLnV0HYXZbv7b64zQbKXzxzNjvlJRrVQycKKZy3GdA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CQIlA0JpO60QsDWZ+jJRDjqLX4LI34apct9e2E/a3AqXvji1bbuT4YYjShoTyBH2RxGUsH4cLYrfNvrUPzpS8/qjYnSSoduuJL1xN5RFAVHOh2Jk+Aqz9lmwt56QCfQekMkiWR0LOEghgMQs0FnqwnuO9wkI782TnhfYzrtYzOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ShT506+Z; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ShT506+Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759387093;
	bh=enLnV0HYXZbv7b64zQbKXzxzNjvlJRrVQycKKZy3GdA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ShT506+Z7swYdDEkhtZWn0md7zVNhYEFqWu4hQ5NsUFVPvbKkIM1hSCpegS0QrRko
	 AANlcyCjHLt1Mi0HWFyPyzQd5Ovmmp+oF3hhqUU2Pk2DbOPpR3ZM4vSW/9UpbyxgXm
	 a6tyqFedl6cHb+5NpXlkx5LR1Tm/NnsaA7Nd2Bi0fypfk+IbuBNGMs2JjD0sHY/VRE
	 /udWbOpsXOkxszsbLqV0l81b+vxKN2G62qpImyIhpWF7IRShTJGqiSWJnDOSZPMCP2
	 WcWRJ/nyn81qJMvthZIHg3DM4hTAOp1zUJiDI5gxSSw4ugSon8T3olDP+KAiBr9977
	 jg0sBzKSxq+4Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0507617E009B;
	Thu,  2 Oct 2025 08:38:12 +0200 (CEST)
Date: Thu, 2 Oct 2025 08:38:07 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 steven.price@arm.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.co, simona@ffwll.ch, marek.vasut@mailbox.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Rain Yang
 <jiyu.yang@nxp.com>
Subject: Re: [PATCH v2 2/2] drm/panthor: skip regulator setup if no such
 prop
Message-ID: <20251002083807.1d7d837d@fedora>
In-Reply-To: <20250928090334.35389-2-jiyu.yang@oss.nxp.com>
References: <20250928090334.35389-1-jiyu.yang@oss.nxp.com>
	<20250928090334.35389-2-jiyu.yang@oss.nxp.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 28 Sep 2025 17:03:34 +0800
Rain Yang <jiyu.yang@oss.nxp.com> wrote:

> From: Rain Yang <jiyu.yang@nxp.com>
> 
> The regulator is optional, skip the setup instead of returning an
> error if it is not present
> 
> Signed-off-by: Rain Yang <jiyu.yang@nxp.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
> index 3686515d368d..2df1d76d84a0 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -146,10 +146,9 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  	ptdev->devfreq = pdevfreq;
>  
>  	ret = devm_pm_opp_set_regulators(dev, reg_names);
> -	if (ret) {
> +	if (ret && ret != -ENODEV) {
>  		if (ret != -EPROBE_DEFER)
>  			DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
> -
>  		return ret;
>  	}
>  

