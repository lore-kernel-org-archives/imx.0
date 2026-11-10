Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325566;
	b=cNTRTJAJzzeF7dBwyXrn41RkxajDsbuXa1/aCSNv0iw4F79DDEjKRjsplZjDEzv5i9b7
	 j33wNbNCp20/9Zh/RTV09jynJihYVWEQe1dUpfVMB79JYCVdby5odj3Zyt0gKpQD3AlaN
	 XdVMhG7McaKNp3yIN9aAWzpqaYQofptdU5tpcGWWTMNCczc0ZTIAqiLp6aotU4POeDQSR
	 b7myg+BGb2GD/vsytncZKF31eMc8uIp+YvcggGxwI7wJQq1KRhbaT2pywwU+Jg2dUKi/P
	 cMaJ4vPsuH2FhIJUzdoSP8Oib/SbhrUY1UjtsMvwF82A07G8OhaKWGb35Hzr70imIuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=I6jvLVTJ6/L/P1TOo+cN1ccJTZcH95Jo/fx+GgYHa7w=;
	b=eaod3O4mq/iCeeeqbxrk+riDPyb7q7m9/kRkRlewibk4CImt0E5KJEd2HOYOe6Okmgms
	 IxzwVX8e/m0/0Og1/3cQGRHMZFdiFDMR3cBIfRuLrTBcrr39huq14fy7gDsh79PheoiDu
	 jgowIBROlpZzER0GMlDofIrfLsH6xatSNzbWIXc6Hdr6JSQ20KnEGF+M/uNv+m9ye54Mp
	 mJj1yvYoHa+J++CEdoW0OymjsB3ho+BmgjmGr6qm9ZM34q0pn2W/ob+7rtn/dB9OkuXoP
	 g88bq7hZxeko6YiBWmePdJ2ueaKI4XPzCkCEaiR0h+CHAgRfl+HCkjTujLLmi0/chbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WZ6fFag+;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B35606AB77
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 15:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5B35606AB77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WZ6fFag+
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso1426943a91.0
        for <imx@lists.linux.dev>; Tue, 10 Nov 2026 07:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794325565; x=1794930365; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I6jvLVTJ6/L/P1TOo+cN1ccJTZcH95Jo/fx+GgYHa7w=;
        b=WZ6fFag+k2xtYYOLEtqObFSk00rTN8UcOOQSCSDuuNU2mOZ4dP1bYfiPtVShAGBnOc
         JKtAyLGrsSOeK2XLpqWEtCVcBSYoPMoUgn3pCD0jsq5ZPt8wwClhjnRL8r6Hh6trY9Lk
         lExumnWl04xLhTKMqvnQP9khG0GxBcqlVC++Cy7IIPBFmN7S6C2AiYISjbxp/ZyOEtlv
         F2tZa+SWmc5c0ksyeylPl1nRZgxtlOdKVcF2gVuMGQ8nIIh43970Ihj4EfjoxGWn4YCv
         ttrftfe0QpWsGznemCQOfu+z1/YvLAaTGkYONI4vp+/mIEEGwNakEofagS8NMHG9aLzA
         i8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794325565; x=1794930365;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6jvLVTJ6/L/P1TOo+cN1ccJTZcH95Jo/fx+GgYHa7w=;
        b=dkSItZ1GChqK2FqnfO9AJ140cagaDNytH+A8VNWVW1pn+BMuNrCIDsPaZLQwT3aVUZ
         jsOaVTLiH6UhdVYldkC6vSIieRfD5WnYxCY60AusVx+VlrMK4Xgn9M+UqizlmM8DKRqs
         h7B018md0KtSDMYbhGAG6eaSu2kcLyOLEvA1dMUggQEHjnHEMemY6VF/h7Qa11ShVb/P
         EsDnN52LQnebHuFHYuF4ohgi/1x5HBPxaXEGvx59+UTgIli8JrbvAOQ9xNI5Jo7Xvq8c
         88RHpyBI26mpxjJAjxLUn6JKOo7m+6eqdBO3+4DLmp098ZA4horAI78vrIOxIgGNdQrQ
         bJpQ==
X-Forwarded-Encrypted: i=1; AL+hErF38oi9o6qpcxtIVULnPsDNvLrQwApqOBpiLRWtVOKlgHLmbmUN09CP9UvGCqQRQP12nbE=@lists.linux.dev
X-Gm-Message-State: APuU4Z9Yo0gmttKoHZa2xB+qfQ2YZG86KZfO2g0rU4GbrAJkfnSIgrUG
	Svs2B7dU0Sn45AIQ90PErCiaaZnlTH3KXjZTI7ZZ/8/FpJ1u7mpC1QeIAzqrqh20tFU=
X-Gm-Gg: AYBFou0TGZmzkSlPKBeCjRTW6qIVCN47QQSREM1/c1jjN7UfyuOUoGxRYJJuYRZD3uy
	xiLAAHXUeQUoPAMBluq4IEqnNGDWoH+9d4PXoVsohLJnBYfsN/SjGIWi2NQ2IIhH/ef4eSuA4b+
	XJqIezQUUBPOhGgCbQiBaIWIA+vIFdDjovfKWdFq+OqeiUORhG94rZn9Xp6+g4gSp3aeeHlrMjj
	wZIdgp0MmCG62dedH1FX5OgDVHHEVyXJ9zCrIgK62cyvMjCgygbDrLF9wAFPSZ8dWX6/rdJA3kg
	6jXCdohrmrgU42GT7wWfRN1I2nAG7Ad20D8UZ9yzks82Awx35wHFsl7MLMNSSJq9pilES6cL3vc
	zxnGSul1HNoTiLVjJsQCL7sWB4zV/7ED6g4w15dbKbhpf7xK4CTt6l3CEYWXbegXHXX7TviYmVC
	MDKTJRphUNqz/1edFeIv9x77r7xUqywzarU3Ub/rxXxliAogmjj2gk5NTQW2Yk8ZVxwwPrrU7bj
	+mOImfWVxu1Kj65kHzu60ly4Jo/jHTATkXZqBcn04b/dFoAyEs1zossDMouR2vUQm6do+n9jrl5
	UIxWg4ORc2GFrDOZIEZ8t/KosDQVghh7qD6qAhGRFTrAH2npO0zVcg==
X-Received: by 2002:a17:90b:57cf:b0:3b0:b64e:1e34 with SMTP id 98e67ed59e1d1-3b166ce8e72mr3333472a91.51.1794325564896;
        Tue, 10 Nov 2026 07:46:04 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:a917:5683:7f92:9eda])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db2fcfesm325724a91.4.2026.11.10.07.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:46:04 -0800 (PST)
Date: Tue, 10 Nov 2026 09:46:01 -0600
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
Subject: Re: [PATCH RFC v2 04/11] remoteproc: report VIRTIO_F_VERSION_1 for
 non-rproc-specific vdevs
Message-ID: <avM8OYHxB4nAKCnb@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-4-26b300e01c62@valla.it>
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
In-Reply-To: <20261102-remoteproc_virtio_map-v2-4-26b300e01c62@valla.it>

Hi,

I started reviewing this set, making it to this patch.  I will continue tomorrow
but due to the KVM forum later this week, I may not finish before next week.
That said, I applied the first 2 patches so no need to include them in the next
revision.

Thanks,
Mathieu

On Mon, Nov 02, 2026 at 12:26:41AM +0100, Francesco Valla wrote:
> There is currently no way to report the VIRTIO_F_VERSION_1 using the
> resource table alone, as the per-vdev feature array is limited to 32
> bits.
> 
> Considering that the VIRTIO 1.0 specification is now ~10 years old,
> always report the VIRTIO_F_VERSION_1 feature for virtio devices that
> are not specific for remoteproc usage. These latter, which as of today
> are rpmsg and rproc-serial, are excluded to avoid impacting the existing
> usecases, since VIRTIO_F_VERSION_1 changes the semantics of the
> communication (e.g., the configuration space is assumed to be
> little-endian rather than follow the device's endianness).
> 
> While at it, replace BUG_ON() with WARN_ON() and return an appropriate
> error in case of features that would overflow the 32 bits limit.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index c56d3330adfe..f1b362158a9c 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -16,6 +16,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/remoteproc.h>
> +#include <linux/rsc_table.h>
>  #include <linux/virtio.h>
>  #include <linux/virtio_config.h>
>  #include <linux/virtio_ids.h>
> @@ -27,6 +28,11 @@
>  
>  #include "remoteproc_internal.h"
>  
> +static bool rproc_virtio_rsc_vdev_rproc_specific(struct fw_rsc_vdev *rsc)
> +{
> +	return (rsc->id == VIRTIO_ID_RPMSG || rsc->id == VIRTIO_ID_RPROC_SERIAL);
> +}
> +
>  static int copy_dma_range_map(struct device *to, struct device *from)
>  {
>  	const struct bus_dma_region *map = from->dma_range_map, *new_map, *r;
> @@ -268,8 +274,17 @@ static void rproc_virtio_synchronize_cbs(struct virtio_device *vdev)
>  static u64 rproc_virtio_get_features(struct virtio_device *vdev)
>  {
>  	struct fw_rsc_vdev *rsc = vdev_to_rsc(vdev);
> +	u64 features = (u64)rsc->dfeatures;
>  
> -	return rsc->dfeatures;
> +	/*
> +	 * All non-remoteproc-specific virtio devices are assumed to be
> +	 * compliant with virtio specifications 1.x; there is no other method
> +	 * to transmit this capability from the remote processor to the host.
> +	 */
> +	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> +		features |= (1ULL << VIRTIO_F_VERSION_1);
> +
> +	return features;
>  }
>  
>  static void rproc_transport_features(struct virtio_device *vdev)
> @@ -285,6 +300,7 @@ static void rproc_transport_features(struct virtio_device *vdev)
>  static int rproc_virtio_finalize_features(struct virtio_device *vdev)
>  {
>  	struct fw_rsc_vdev *rsc = vdev_to_rsc(vdev);
> +	u64 features;
>  
>  	/* Give virtio_ring a chance to accept features */
>  	vring_transport_features(vdev);
> @@ -292,8 +308,14 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
>  	/* Give virtio_rproc a chance to accept features. */
>  	rproc_transport_features(vdev);
>  
> -	/* Make sure we don't have any features > 32 bits! */
> -	BUG_ON((u32)vdev->features != vdev->features);
> +	/* Make sure we don't have any features > 32 bits except the expected ones. */
> +	features = vdev->features;
> +
> +	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> +		features &= ~(1ULL << VIRTIO_F_VERSION_1);
> +
> +	if (WARN_ON((u32)vdev->features != features))
> +		return -EINVAL;
>  
>  	/*
>  	 * Remember the finalized features of our vdev, and provide it
> 
> -- 
> 2.56.0
> 
