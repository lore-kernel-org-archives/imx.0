Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849378;
	b=EMMEedLJYsop61pgIDsPx6wTsfj+cqorh6ZC+EdezPwLALD/xnElWYAn4PRi7fAQ10DQ
	 38iZ9btxqNiXFa9z16SDTb2NgPqvmzjLagV9cKnBjyNRKmWfPJ1dqbrlm+MIIdtAbR71l
	 UhTWg1FHMW9bvpdZPVPwg9PYCJXroi/+sGVePeWiNjPWBGB5c34SGlvjARRlNFJgXWLVN
	 s+xrwOI1d80yMQ83RnN+mPCwzGZgRKKS0Ku1uP8k7OJDyKTbR24rHGuUds9fnhkTxKzT7
	 eOVnX5jgnTt1kmJm8blkuYc8BUDEzRg97CAWRMe2FJtjMdQp7h+STaLK7kCdRQEc0gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Bd5KkZtIi9hEU9aTOnohsJP4GtQbznYQgq/LOm2c1XM=;
	b=1kWdkb7lKnLeNFGGpL61bajTObYr2MxdU9cGb6OPOWhKkgNOnm9l5eLeOmK0QhhxlV2m
	 KrfgJK2lihvToZsX5zAgP4oh+5ioNFVpVJldTS1DLZjFh4nDj92xKFniV8QlRquZGfmxY
	 8WnnBMyxCwkYqN93uks393KKHkGgFfbJxb0AGsK87JDfmDLDgmZ5R2ibVw3d+YMsTSVkn
	 9dl9fH7m0EfS+hafzpsbyPj+0q5Xq+sNtW2QUvGM9VYI1OjPqFBwdu0wTOOopc4ghHQHG
	 96YBa6ryjrieU/LWMnl1C+6wfcQt0XnferH6utmFXXKRMnrAvLi2JK5m2k2ij9+SNjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yxD2HKpX;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58530606A329
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 17:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58530606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yxD2HKpX
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b5efadd183so27200b3a.1
        for <imx@lists.linux.dev>; Mon, 16 Nov 2026 09:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794849376; x=1795454176; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bd5KkZtIi9hEU9aTOnohsJP4GtQbznYQgq/LOm2c1XM=;
        b=yxD2HKpXU1vFPVrbP7OYANtMwVh8UmS+RE0y/8dpnSVVFYr0uJFkTP3bb/8ZVxuP/s
         PN1nZRD2Sk4Ll67jvz9pza6IRNJ00eVidi392yOa0nhutOEtYk+hB8OkS7G09UDDL9J+
         SXdCgwhixXlN/oyyn+EKOgmbqgUrTU0RPTOMREAnVuj9pGOkinCydMgHpiU/rnWapp4D
         Z3KQkSeXnbq5Z63AjjE0FYP7FctE/RrL13FHeJJCRohqnE8i5riGUX23ESQG918Bl8rj
         sTdNBZGp4vM7P7aeBL2HBTT7tpDmyPdWPCCMGQIjEbGLPtZJ8OGlHfixz673fDPOiTY6
         puTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849376; x=1795454176;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bd5KkZtIi9hEU9aTOnohsJP4GtQbznYQgq/LOm2c1XM=;
        b=1MPOVGKfa2OBFvXlsiULpbi08vfeKmGUY5F5aNf2INQdhYTOguUHHzUEOBrUXRkHHP
         7fc2DswBotqk88tHi86mOFPgtOD8XrtVa9PFSjgfhq4bYFHfVbN46Ty2KyFs1B7tB98M
         FsBZviZjiRLDPPt2bb87LhagyySoIoF/Qa6SIERRMvs7URbf6RK3HQlGMV25okOLbk6n
         8yp7Hr/D/kSg3ywuN/20z64LlfgJCAeRQl/PWlYiZOYMruPY9FlSoQ6Wn3rb4360iVQV
         BTcmTD0oJlOzgXDyLJ/2q0rgK5ZXkvqyg9THa/8Y8etoGneRODNwDdFEciWjCLAxDvjr
         SI9Q==
X-Forwarded-Encrypted: i=1; AL+hErHx9lLGL20WhOwJ5boWWz6/diZYo3eeE7R/RYzAYiD+fUV0PuBu+fWdKq27Qh4X1+6zmuk=@lists.linux.dev
X-Gm-Message-State: APuU4Z8vxHuCo36324jT3oPGWuvJ5/T9E7u6/eSBhGzscL0LIuFfFXpN
	VkV527iDBU1kfx1ZuEr0OdQO0NwAwmdIJAzcfKr4Xeb1/PEbvr78oEkgQMCdiO+2TYg=
X-Gm-Gg: AYBFou0sXM/bQDnuvC1a5UNmOXbKUUMlC5iCq12FMgCK3fO/meE0I6uE9Aaz0Wd0ve0
	sAKqzgD6qZG4k7W5Wv0t2rk58AS78+Whtlbh3cMyLYRVN80Akeyk+xMbW8oBY9XW45dyv/SNLUP
	qHUDsYqYzErnOlEp9gDfxI74gPfFF8rG4AvDG4Lh/mYgpAIIIRTWeZPuR+cqoCHFDUztFMxWdY3
	Y/jAbZefMNLrRn9QK6f30vZ1x9rK6KjofBLdLDJ4yt43wceHfDEx3VVnRnSS/fhLIbA9WUiIgoP
	AkOv+MA1SW1dwP+0P7W2ngSToOEpY9ePUVPyN95CgALiaeedY9Pycw8EYj8wBndg/ot1gLWI84D
	QCszQQ61+RSHmWpSBe7Gy+N+kMFxQPbSaIE24mH3lBqhzXymUwHQaZBnWQEHS0YgPSHW5Xc3Lni
	rxf8LZWbsyek7pPb5f7wCA1o6ZJjjcZzyNzeDmjMUSyru9vFp4/k95d3AyHykCG6FqA3uRknzgY
	lB9kPSt0rUDMvDhx2koTlmIIZ8N12OFAdAQY0qgs36c/FO+Mp+HWb0MTcgk+W2Ze8ZSRINY5KNR
	u80s6cogCSLhtNhwCR7GE2YTymJNvGPp
X-Received: by 2002:a05:6a21:7a46:b0:3de:71c4:a22b with SMTP id adf61e73a8af0-3fd29c153b2mr84093637.1.1794849376336;
        Mon, 16 Nov 2026 09:16:16 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ea6f:45e1:c614:f10f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a97f9sm3778408b3a.14.2026.11.16.09.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:16:15 -0800 (PST)
Date: Mon, 16 Nov 2026 11:16:13 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v2 05/11] remoteproc: virtio: report
 VIRTIO_F_ACCESS_PLATFORM when required
Message-ID: <avs6XQpoQmY_MNYx@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-5-26b300e01c62@valla.it>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-remoteproc_virtio_map-v2-5-26b300e01c62@valla.it>

On Mon, Nov 02, 2026 at 12:26:42AM +0100, Francesco Valla wrote:
> Depending on the driver originating them, data buffers used for virtio
> communication can either:
> 
>   - already be allocated from the coherent memory area that is
>     accessible by the remote processor; this is the case of
>     remoteproc-specific virtio devices, i.e., rpmsg and rproc-serial;
>   - be allocated from generic kmem, and thus not necessarily accessible
>     directly by the remote processor.
> 
> In the second case, the DMA APIs can be exploited to obtain a
> functional communication, since they will take care of cache maintenance
> and - if required - bounce buffering. The VIRTIO_F_ACCESS_PLATFORM
> feature flag can be used for this purpose: with it set, the virtio
> framework will use the aforementioned DMA APIs to map and unmap buffers.
> 
> Bounce buffering will be transparently used in two cases:
> 
>   - if the buffer address supplied by the virtio driver is not suitable
>     for DMA transfers, or
>   - if the reserved memory associated to the vdev is a
>     restricted-dma-pool; in this case, *all* buffers will be bounced to
>     and from this pool.
> 
> With this support in place, any kind of virtio device can be supported
> through the remoteproc-virtio transport, at least from a data exchange
> standpoint.
> 
> Note that remote processors behind an IOMMU need da == pa for the memory
> region(s) the buffers are allocated from.

I'm not sure to understand the da == pa requirement - can you expand more on
that?

> 
> Existing use cases (e.g., rpmsg and virtio-console) are not impacted as
> they are explicitly excluded.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index f1b362158a9c..1496659ddff9 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -280,9 +280,14 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
>  	 * All non-remoteproc-specific virtio devices are assumed to be
>  	 * compliant with virtio specifications 1.x; there is no other method
>  	 * to transmit this capability from the remote processor to the host.
> +	 *
> +	 * Virtio devices that are specific for remoteproc usage take care on
> +	 * their own to allocate memory from the device's coherent pool; use
> +	 * the DMA APIs for the others through VIRTIO_F_ACCESS_PLATFORM.
>  	 */
>  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> -		features |= (1ULL << VIRTIO_F_VERSION_1);
> +		features |= ((1ULL << VIRTIO_F_VERSION_1) |
> +			     (1ULL << VIRTIO_F_ACCESS_PLATFORM));
>  
>  	return features;
>  }
> @@ -312,7 +317,8 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
>  	features = vdev->features;
>  
>  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> -		features &= ~(1ULL << VIRTIO_F_VERSION_1);
> +		features &= ~((1ULL << VIRTIO_F_VERSION_1) |
> +			      (1ULL << VIRTIO_F_ACCESS_PLATFORM));
>  
>  	if (WARN_ON((u32)vdev->features != features))
>  		return -EINVAL;
> 
> -- 
> 2.56.0
> 
