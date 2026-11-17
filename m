Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932924;
	b=Pu6TINSjYmwHOrxpJA7QrXk/Y3KOrfsbabAACO7bf5EDMyIP10ZRxxF45yrUl/hcyn0t
	 mipA0bqs24kqfYlJCX3B+0zKkcfx+ZDjLyRDssG7Kyv7sq869adHskz7xCpQ2B9nJJaI1
	 mBQAhBxv0FnkLa0Wa3KM7CYmFqUgo/olDy4MI9uiydF5YdQGjVrLfve3cquLU2SG6nr43
	 ASFmR8NgPha4UjYwtIPj+ctwSeHWAplcrK0Ezf8/DGuB3qpQV6EBLQDzig01c3Kgcu955
	 pJ4vDMLz+/uwqERMVJK1g6y/186T7yQzpbRdY5I755D3Ol1DftVQYFGXdwkYSFnE8FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=z9knRtCcMgIWWsx+jn+Ep/GYomBKonoGDT8JCXsB+Dc=;
	b=gn3H35/NlGMTLzjGmkypZ4foUfNMmVGzWbhcx279bulMg42vjaogc4XFE7WGJJgO5de+
	 mzNl/TatGhjeWTybVo/2EGgfC4N8QeFfhFTLf8EgdeeNSY0jAMds4womPauDUm8rSCZpN
	 6+braztsA4/SEbEED77WPHEr4dYrCs2sbwJwVuQNqXYRVBfgJQ8yLJgfQ+K6fFmD7KPAq
	 PqwUvuUEAJfZmZSQpuGNnZoBNFJr9BM+qZpwBYx5zmmff1PjMfcCYTB2xeShHcxU5f0zp
	 urlMXAKbQVHJGgkB/++zWW7kSWNmBHZEiM4FVCFTJta10ZHoap8X34dIjLDcZaxnLLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AShIKmj7;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ED8606A330
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 16:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5ED8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AShIKmj7
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b197cd42b0so3621651a91.2
        for <imx@lists.linux.dev>; Tue, 17 Nov 2026 08:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794932922; x=1795537722; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z9knRtCcMgIWWsx+jn+Ep/GYomBKonoGDT8JCXsB+Dc=;
        b=AShIKmj7yFLIVvllvfX9YWH7crSyaA3E1kk7u5cRgBGqq/dIqfOA6rdJnBizjdX0+I
         JhVKQsXwCYrMhR2Q5PPodvswfi3VcJXW8y+cT999XPPITEkJtFLwl3CqcyWvVeO2YYNX
         oFCDP/a5PQQLBwctQcBS0cvvhVds8AKQuD/x1hEq/5kIFwJYZqIO/lN3qhGq6GMI3Mg8
         KAlJPb1IYKggZUKmQ4YaqmiuJwE/VShc1Qg5mwUkEgsfwH1gNTkBrumsviksaB2uiOg7
         NGJb0l+bJiqWolVJsBXvM2f5+k93HP1TeAE9GZoVi+0KNdNbyHqGlEiCCexoemeh8wJV
         f0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932922; x=1795537722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z9knRtCcMgIWWsx+jn+Ep/GYomBKonoGDT8JCXsB+Dc=;
        b=i9fs7wMYYBhh7wlehteVdvnra5XcDb0eqiQ+oE7gj8zI5ygrzr/s9KPcFAZOWpUBLn
         8askvhZ3Vw9C7g3kEIhXFUa8S4BGWM1PZCxaplcS3Dxionzbhi+NfvLnd1UH/TXkKoFS
         o14WV9VmNU81XZoSOe4CZ22F1xxGY0ZiFjMRHMLhlou4Tjm9/tyF5OUcO4wf/DChAEA/
         4qYtrpGwO2JhheekcQf3oVRs51LyI31zCTYo/34yg0N0fAzrW4KABdF0yOLikFzgzDPh
         JrHqpuqDK0mG50KeyKqbExUxbMAgDFCx6W0HWCiF3yipNtab55SH+yGPziCAu1XWdVLb
         D5nA==
X-Forwarded-Encrypted: i=1; AL+hErHYid86kmQeyChthaFBkHEVXXNhvSI7aNGayHoOiUIK/DXkefgXNF1rk+iLo3MpY5uzmM8=@lists.linux.dev
X-Gm-Message-State: APuU4Z/kT9hNiJ6+3gh9iqC0w+HFl8MTiHir1+hzCyy0Gh2jeJqReO5n
	4K+rPRa67inop/0Sh2jAdInhKXw3TwLtQu0S0mSYLeFD3ZhaPPI7BuwzWfOW1zPGe48=
X-Gm-Gg: AZFdTZdph67vflvtYMgEEGT3KyewXn4oRaNv8gHOghqUUXAYYQLBBTZ6flytHDcevBy
	AXXgIQRJmON8yZl6bnUvF6q4VKb1Y8NsxpN8GDJ75KHCN1XO87kbduLr5h1eN5gFp1AnJ1qGTTT
	VMTQwgL1TM/Qa5Bjv4I3pmeWYWyRg9sE0kOdhlNGlfxorkuhQ87dSwPAO97StHzSsZ6XRGPjcp5
	DgPz6QDs0MCT5q8bffwxPCVGnyvKh391NnoxmSN6jhJdfEmObFZ/08wcg45Hp/IRevMwGe/jvlH
	2NHIDXB58GYN3XrvFpyLyOX0NxvPP3Dry9RVqkuCx6El76rCi1sK7T9R8uX1BQtwjM16J3jjx59
	LhnFqPG9dTDOY8svPmn4yMYSkJ8ae/ReYUvFy4V9GPSazmbdPxg65wl6BdET9KL2dWdLR2X+Z0Z
	4CxDmUG9rGD99QBNiFurR5CSqTNjXcGhC2XjwytXKyuxDdCHAX/2YgQTYNWE8t7pL7HV8n5sMke
	IHyiNPF8QE9fjZln/oMUhcsev29h7XQNxpSNHN7HKy41HSYRNB1190b2lRkzkwXd63cMichzMt4
	OGHS1sJniKsQkQ/xpjREm9ljD36OxuRD
X-Received: by 2002:a17:90b:6c7:b0:3b0:9183:23ef with SMTP id 98e67ed59e1d1-3b1b07e41b9mr15684802a91.3.1794932922021;
        Tue, 17 Nov 2026 08:28:42 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:61f7:13ac:b599:b52c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abe8b263sm5082310a91.13.2026.11.17.08.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:28:41 -0800 (PST)
Date: Tue, 17 Nov 2026 10:28:38 -0600
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
Subject: Re: [PATCH RFC v2 07/11] remoteproc: assign fwnode during vdev
 registration
Message-ID: <avyAtmxdbfEBbZ87@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-7-26b300e01c62@valla.it>
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
In-Reply-To: <20261102-remoteproc_virtio_map-v2-7-26b300e01c62@valla.it>

On Mon, Nov 02, 2026 at 12:26:44AM +0100, Francesco Valla wrote:
> The virtio subsystem already supports a fwnode describing a vdev; search
> for a specific node during vdev registration and supply it to the
> rproc-virtio platform device that is being registered.
> 
> A memory-region specified inside that node is also used for the virtio
> device if a carveout was not supplied for it through the parent device's
> node.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/remoteproc/remoteproc_core.c   | 48 +++++++++++++++++++++++++++++++---
>  drivers/remoteproc/remoteproc_virtio.c | 41 +++++++++++++++++++++++++++++
>  2 files changed, 85 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index c946ecd980a5..e833853ae7f6 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -440,6 +440,33 @@ void rproc_remove_rvdev(struct rproc_vdev *rvdev)
>  	if (rvdev)
>  		list_del(&rvdev->node);
>  }
> +
> +static struct fwnode_handle *rproc_get_vdev_fwnode(struct device *dev, u32 idx)
> +{
> +	struct fwnode_handle *group, *child;
> +	u32 reg;
> +	int ret;
> +
> +	group = device_get_named_child_node(dev, "virtio");
> +	if (!fwnode_device_is_available(group)) {
> +		fwnode_handle_put(group);
> +		return NULL;
> +	}
> +
> +	fwnode_for_each_available_child_node(group, child) {
> +		ret = fwnode_property_read_u32(child, "reg", &reg);
> +		if (ret)
> +			continue;
> +
> +		if (idx == reg)
> +			break;
> +	}
> +
> +	fwnode_handle_put(group);
> +
> +	return child;
> +}
> +
>  /**
>   * rproc_handle_vdev() - handle a vdev fw resource
>   * @rproc: the remote processor
> @@ -475,7 +502,16 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	struct device *dev = &rproc->dev;
>  	size_t rsc_size;
>  	struct rproc_vdev_data rvdev_data;
> +	struct platform_device_info pdev_info = {
> +		.parent = dev,
> +		.name = "rproc-virtio",
> +		.id = PLATFORM_DEVID_AUTO,
> +		.data = &rvdev_data,
> +		.size_data = sizeof(rvdev_data),
> +	};
>  	struct platform_device *pdev;
> +	struct fwnode_handle *fwnode;
> +	int ret = 0;
>  
>  	/* make sure resource isn't truncated */
>  	rsc_size = struct_size(rsc, vring, rsc->num_of_vrings);
> @@ -498,20 +534,24 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	rvdev_data.rsc_offset = offset;
>  	rvdev_data.rsc = rsc;
>  
> +	fwnode = rproc_get_vdev_fwnode(dev->parent, rvdev_data.index);
> +	pdev_info.fwnode = fwnode;
> +
>  	/*
>  	 * When there is more than one remote processor, rproc->nb_vdev number is
>  	 * same for each separate instances of "rproc". If rvdev_data.index is used
>  	 * as device id, then we get duplication in sysfs, so need to use
>  	 * PLATFORM_DEVID_AUTO to auto select device id.
>  	 */
> -	pdev = platform_device_register_data(dev, "rproc-virtio", PLATFORM_DEVID_AUTO, &rvdev_data,
> -					     sizeof(rvdev_data));
> +	pdev = platform_device_register_full(&pdev_info);
>  	if (IS_ERR(pdev)) {
>  		dev_err(dev, "failed to create rproc-virtio device\n");
> -		return PTR_ERR(pdev);
> +		ret = PTR_ERR(pdev);
>  	}
>  
> -	return 0;
> +	fwnode_handle_put(fwnode);
> +
> +	return ret;
>  }
>
>  /**
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 1496659ddff9..950d65480be5 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -13,10 +13,12 @@
>  #include <linux/dma-map-ops.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/export.h>
> +#include <linux/of.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/remoteproc.h>
>  #include <linux/rsc_table.h>
> +#include <linux/swiotlb.h>
>  #include <linux/virtio.h>
>  #include <linux/virtio_config.h>
>  #include <linux/virtio_ids.h>
> @@ -394,6 +396,23 @@ static void rproc_virtio_dev_release(struct device *dev)
>  	put_device(&rvdev->pdev->dev);
>  }
>  
> +/*
> + * Attach the memory region declared inside the vdev's own devicetree node.
> + *
> + * A restricted-dma-pool region is attached by of_dma_configure() when the
> + * platform device is probed, but it is released together with the virtio
> + * device (see rproc_virtio_dev_release()); attach it again if needed, e.g.
> + * when the remote processor is restarted during a crash recovery.
> + * Any other kind of region (e.g., shared-dma-pool) is attached only here.
> + */
> +static int rproc_virtio_init_vdev_mem(struct device *dev)
> +{
> +	if (is_swiotlb_for_alloc(dev))
> +		return 0;
> +
> +	return of_reserved_mem_device_init_by_idx(dev, dev->of_node, 0);
> +}
> +
>  /**
>   * rproc_add_virtio_dev() - register an rproc-induced virtio device
>   * @rvdev: the remote vdev
> @@ -410,6 +429,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>  	struct device *dev = &rvdev->pdev->dev;
>  	struct virtio_device *vdev;
>  	struct rproc_mem_entry *mem;
> +	bool has_mem_region;
>  	int ret;
>  
>  	if (rproc->ops->kick == NULL) {
> @@ -417,11 +437,24 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>  		return -EINVAL;
>  	}
>  
> +	has_mem_region = of_property_present(dev->of_node, "memory-region");
> +
>  	/* Try to find dedicated vdev buffer carveout */
>  	mem = rproc_find_carveout_by_name(rproc, "vdev%dbuffer", rvdev->index);
>  	if (mem) {
>  		phys_addr_t pa;
>  
> +		if (has_mem_region) {
> +			/*
> +			 * The carveout takes precedence: drop the region that
> +			 * of_dma_configure() might have attached at probe time.

I don't understand this part - why would someone configure vdevXbuffer with the
same name at the rproc and rproc-virtio level?  This should be an error.

> +			 */
> +			dev_warn(dev,
> +				 "vdev%dbuffer carveout found, ignoring memory-region\n",
> +				 rvdev->index);
> +			of_reserved_mem_device_release(dev);

Who would have called of_reserved_mem_device_init_by_XYZ()?  The remoteproc core
or virtio core?  

> +		}
> +
>  		if (mem->of_resm_idx != -1) {
>  			struct device_node *np = rproc->dev.parent->of_node;
>  
> @@ -451,6 +484,14 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>  				return ret;
>  			}
>  		}
> +	} else if (has_mem_region) {
> +		/* Use the memory region declared in the vdev's own node */
> +		ret = rproc_virtio_init_vdev_mem(dev);
> +		if (ret) {
> +			dev_err(dev, "Can't associate vdev memory-region: %d\n",
> +				ret);
> +			return ret;
> +		}

Mixing the initialisation of the legacy rproc-virtio and authentic rproc-virtio
devices is very confusing.  I think there is value in splitting them, even if it
entails some code duplication.

Thanks,
Mathieu

>  	} else {
>  		struct device_node *np = rproc->dev.parent->of_node;
>  
> 
> -- 
> 2.56.0
> 
