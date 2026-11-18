Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017301;
	b=Df/RIURyANSvaMnuI/glw/RBCEfNVQT8FCRBe4JGXBBf61f9H2pVOXtKQFz3Q9U8DH7L
	 /T9YQIFBU9jjnx738bFgRNo0vGDFWBnCogtrV8OH0EgcfBIJbxSfq1ijDjjVvJjyhjR10
	 Jj63fMu8WbDG65v9/x1axuWpwPY/L5zW+zP4vOTc9mSnyS5teJqPyzGXBMDWehP7ESfiC
	 jhFu52vzqSUFzzNkv4YUziFQbWpZFjHrcivZ0vEfBiGO6yHjaV+BcWhakBHUp3nF2BlJR
	 OkYr1OLZNculqviCqlA1Ir6h+QLmI9lWOT7DEIhMToJJxooezAvILj5GjFI+ykLgtLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qYegP4uULHLbb4rYN9EEt/ZV0VWypeovKGqy+rkk7so=;
	b=hFP4qZrGpYx9hFvZUzZirbVY5X0dp7oMJHkw3TWsre9RkCco8CEaoYJ0ksr9IgMUoOy9
	 iQiemTdECEbNLs0+wLdFoGIwtFc9T0zJD6X4GSMfXKLuS4KcmJfjJbEaeBOhNY8b8Bm8N
	 r84UQ4lU2on/N/42dCoE09AdqHMFHZ/QSwV3iKKDQxCjMaMrSYXBsrsQcJCSTSKVpqSuO
	 eCE2VzUfjE2buIxJ/dEiw27+rYpKgnqKh/zZyaPPaAPgD7ZmbbuCJX8jfTe5+tjtrwug6
	 mEMObxilK8nHWd9uh1yn+YN9eLj0j83PjfTDzSj5yyU25pCfUUcWSFxeIaPa8L6f6zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WaxcBNG7;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2A8606A331
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 15:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF2A8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WaxcBNG7
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so1635270a12.0
        for <imx@lists.linux.dev>; Wed, 18 Nov 2026 07:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795017299; x=1795622099; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qYegP4uULHLbb4rYN9EEt/ZV0VWypeovKGqy+rkk7so=;
        b=WaxcBNG712Pc8IGdQFOwU2NUzkxbywZXLbOmxbUba96CVr+Gt++Ir94ZNDT28DnSMX
         8NQBW5o1ElsmYljS8izWET0jY877iFOjeTBY3BIJ3+Y8OL5s8tbGmSUlmkPOzJkp6TCk
         2mAr7YKQvmnFKQVlh8knOlBWtstp/sr3YZu9lg5zelS4nfT7Xav9LY+ma6MOCgHCeY39
         ZL83p4Mzirjwy4AgF0gyJjMslHAPA7y6j6Y2dk6e+SVv8sATOmgV8bEKA9U0VnHIafAi
         fBrkYjQHYViz7oKhljQPGHaKQd+k6OBa8Y61yR2AH6LTZEIbJnxoKDhFvj+n1wo3Zgfo
         L2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017299; x=1795622099;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qYegP4uULHLbb4rYN9EEt/ZV0VWypeovKGqy+rkk7so=;
        b=pDeXiTgf+8QH5zcxuN4n/l5/qpHlrKvIPOUYIg3pqV2mCxJfdzDWuv0bmUK5B00JsE
         JDTejJ4Z7zPuYr5qXh2XKAAQ5oAQ80Hamv16ekwUlvzKx7y2sb5UxCtKGihLGKxQGRtz
         DWMJ2ty3gDdvd7XjfnjW8djmuYCVFihiZANDXtHj5E/9KAfYQbXakAOxrj9SPg+dgdy8
         mLVJ5K/IwkYaELj4JWq0Ae0j+uyhYBCpxjYbbznx+PDJcDPMz2a5W07/DOauGjAIgS73
         7dy7YTZ4hK6yS437TSMTk7R2sd5nVjf4pkS9qpMfPzTf1HeK2reg4t7M52cY1dv8Ylu7
         YYgQ==
X-Forwarded-Encrypted: i=1; AL+hErGAT/p5hOSHJXXcRnjcovpVYnMrxDplVuo2J5afFhy2+q6r9zxGsSP414/VCLEgwDnyZp0=@lists.linux.dev
X-Gm-Message-State: APuU4Z9LnIv668rL1AG+PyKUHwR4pHGswNNNQeaf7GftWYc0lRPzRfOM
	YoSlQg5Xu10KSZxGjsBvWukHuDFcEPM+YLhN3W3R2CXQAnfUDfqq+LLg8L3gUM/qa1Wy6xMKcx6
	FagjN
X-Gm-Gg: AYBFou39PKwKvDG5/OXbrwMUDpITL6noQWqHmlwY0fsGXv3vhu0t/23Mfp8UkTf6ReD
	sKfkrnll2AAk8kIpXd+Z7PRygzF/XgFau65fIMIKQtweISCcKnXcXEtjLjnJ4MZ12ksjx7qQ+8n
	7U688c4JX6I5cO35oPF4AKE29+bvzaOR0HHXIggHxIKTQft1xKI16wl5Y+DiilEqSPbcZFs7hiV
	U6jb5/YRz28S/DgNPFFBCscHyifjCRZcnT7kaZ+KZPBdtqkpj7ksyIJCk5RW3NPsan3o2LHt0AF
	iaLfEOo22fWZzgpjiOWDuO8D57au26FQFa6aO6kKKOPpXhQqok5nmHkQD0jVRD7N1ok4/Up/Wzz
	VIE4qR6pnCD+idkJ1pbAqRoBWzkZ52i5J+MFoqzKQlIYyOFyt5W3sel4qGd3ah6w542hRcNDynD
	/yzvpSQPHpXPImhLnX+mkkaprywS3p0EYeus8PqyjvvKRRUSjVeBDzKdNjanYb4qRboaBGn/pnp
	Mj0arauqly6dr0Bjee8GtICs4x4/TEcHAaq0twZLSdWb6GLSUC3LJts7L/q6rNvMJBHpwEKtghT
	NQuaBllVRP/2rX2LWuZBtJRLgxRjovN9
X-Received: by 2002:a17:906:c14e:b0:c50:a7ff:f880 with SMTP id a640c23a62f3a-c510e28dfcamr310805266b.34.1795017299066;
        Wed, 18 Nov 2026 07:54:59 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9f37:bd39:7f19:3b3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51231bc1a2sm20902066b.5.2026.11.18.07.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:54:58 -0800 (PST)
Date: Wed, 18 Nov 2026 09:54:49 -0600
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
Message-ID: <av3KSXqeGyazaMR9@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-7-26b300e01c62@valla.it>
 <avyAtmxdbfEBbZ87@p14s>
 <avzS1DiNGmL1Pqmn@bywater>
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
In-Reply-To: <avzS1DiNGmL1Pqmn@bywater>

On Tue, Nov 17, 2026 at 11:29:01PM +0100, Francesco Valla wrote:
> On Tue, Nov 17, 2026 at 10:28:38AM -0600, Mathieu Poirier wrote:
> > On Mon, Nov 02, 2026 at 12:26:44AM +0100, Francesco Valla wrote:
> > > The virtio subsystem already supports a fwnode describing a vdev; search
> > > for a specific node during vdev registration and supply it to the
> > > rproc-virtio platform device that is being registered.
> > > 
> > > A memory-region specified inside that node is also used for the virtio
> > > device if a carveout was not supplied for it through the parent device's
> > > node.
> > > 
> > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > ---
> > >  drivers/remoteproc/remoteproc_core.c   | 48 +++++++++++++++++++++++++++++++---
> > >  drivers/remoteproc/remoteproc_virtio.c | 41 +++++++++++++++++++++++++++++
> > >  2 files changed, 85 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index c946ecd980a5..e833853ae7f6 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -440,6 +440,33 @@ void rproc_remove_rvdev(struct rproc_vdev *rvdev)
> > >  	if (rvdev)
> > >  		list_del(&rvdev->node);
> > >  }
> > > +
> > > +static struct fwnode_handle *rproc_get_vdev_fwnode(struct device *dev, u32 idx)
> > > +{
> > > +	struct fwnode_handle *group, *child;
> > > +	u32 reg;
> > > +	int ret;
> > > +
> > > +	group = device_get_named_child_node(dev, "virtio");
> > > +	if (!fwnode_device_is_available(group)) {
> > > +		fwnode_handle_put(group);
> > > +		return NULL;
> > > +	}
> > > +
> > > +	fwnode_for_each_available_child_node(group, child) {
> > > +		ret = fwnode_property_read_u32(child, "reg", &reg);
> > > +		if (ret)
> > > +			continue;
> > > +
> > > +		if (idx == reg)
> > > +			break;
> > > +	}
> > > +
> > > +	fwnode_handle_put(group);
> > > +
> > > +	return child;
> > > +}
> > > +
> > >  /**
> > >   * rproc_handle_vdev() - handle a vdev fw resource
> > >   * @rproc: the remote processor
> > > @@ -475,7 +502,16 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > >  	struct device *dev = &rproc->dev;
> > >  	size_t rsc_size;
> > >  	struct rproc_vdev_data rvdev_data;
> > > +	struct platform_device_info pdev_info = {
> > > +		.parent = dev,
> > > +		.name = "rproc-virtio",
> > > +		.id = PLATFORM_DEVID_AUTO,
> > > +		.data = &rvdev_data,
> > > +		.size_data = sizeof(rvdev_data),
> > > +	};
> > >  	struct platform_device *pdev;
> > > +	struct fwnode_handle *fwnode;
> > > +	int ret = 0;
> > >  
> > >  	/* make sure resource isn't truncated */
> > >  	rsc_size = struct_size(rsc, vring, rsc->num_of_vrings);
> > > @@ -498,20 +534,24 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > >  	rvdev_data.rsc_offset = offset;
> > >  	rvdev_data.rsc = rsc;
> > >  
> > > +	fwnode = rproc_get_vdev_fwnode(dev->parent, rvdev_data.index);
> > > +	pdev_info.fwnode = fwnode;
> > > +
> > >  	/*
> > >  	 * When there is more than one remote processor, rproc->nb_vdev number is
> > >  	 * same for each separate instances of "rproc". If rvdev_data.index is used
> > >  	 * as device id, then we get duplication in sysfs, so need to use
> > >  	 * PLATFORM_DEVID_AUTO to auto select device id.
> > >  	 */
> > > -	pdev = platform_device_register_data(dev, "rproc-virtio", PLATFORM_DEVID_AUTO, &rvdev_data,
> > > -					     sizeof(rvdev_data));
> > > +	pdev = platform_device_register_full(&pdev_info);
> > >  	if (IS_ERR(pdev)) {
> > >  		dev_err(dev, "failed to create rproc-virtio device\n");
> > > -		return PTR_ERR(pdev);
> > > +		ret = PTR_ERR(pdev);
> > >  	}
> > >  
> > > -	return 0;
> > > +	fwnode_handle_put(fwnode);
> > > +
> > > +	return ret;
> > >  }
> > >
> > >  /**
> > > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > > index 1496659ddff9..950d65480be5 100644
> > > --- a/drivers/remoteproc/remoteproc_virtio.c
> > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > > @@ -13,10 +13,12 @@
> > >  #include <linux/dma-map-ops.h>
> > >  #include <linux/dma-mapping.h>
> > >  #include <linux/export.h>
> > > +#include <linux/of.h>
> > >  #include <linux/of_reserved_mem.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/remoteproc.h>
> > >  #include <linux/rsc_table.h>
> > > +#include <linux/swiotlb.h>
> > >  #include <linux/virtio.h>
> > >  #include <linux/virtio_config.h>
> > >  #include <linux/virtio_ids.h>
> > > @@ -394,6 +396,23 @@ static void rproc_virtio_dev_release(struct device *dev)
> > >  	put_device(&rvdev->pdev->dev);
> > >  }
> > >  
> > > +/*
> > > + * Attach the memory region declared inside the vdev's own devicetree node.
> > > + *
> > > + * A restricted-dma-pool region is attached by of_dma_configure() when the
> > > + * platform device is probed, but it is released together with the virtio
> > > + * device (see rproc_virtio_dev_release()); attach it again if needed, e.g.
> > > + * when the remote processor is restarted during a crash recovery.
> > > + * Any other kind of region (e.g., shared-dma-pool) is attached only here.
> > > + */
> > > +static int rproc_virtio_init_vdev_mem(struct device *dev)
> > > +{
> > > +	if (is_swiotlb_for_alloc(dev))
> > > +		return 0;
> > > +
> > > +	return of_reserved_mem_device_init_by_idx(dev, dev->of_node, 0);
> > > +}
> > > +
> > >  /**
> > >   * rproc_add_virtio_dev() - register an rproc-induced virtio device
> > >   * @rvdev: the remote vdev
> > > @@ -410,6 +429,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> > >  	struct device *dev = &rvdev->pdev->dev;
> > >  	struct virtio_device *vdev;
> > >  	struct rproc_mem_entry *mem;
> > > +	bool has_mem_region;
> > >  	int ret;
> > >  
> > >  	if (rproc->ops->kick == NULL) {
> > > @@ -417,11 +437,24 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> > >  		return -EINVAL;
> > >  	}
> > >  
> > > +	has_mem_region = of_property_present(dev->of_node, "memory-region");
> > > +
> > >  	/* Try to find dedicated vdev buffer carveout */
> > >  	mem = rproc_find_carveout_by_name(rproc, "vdev%dbuffer", rvdev->index);
> > >  	if (mem) {
> > >  		phys_addr_t pa;
> > >  
> > > +		if (has_mem_region) {
> > > +			/*
> > > +			 * The carveout takes precedence: drop the region that
> > > +			 * of_dma_configure() might have attached at probe time.
> > 
> > I don't understand this part - why would someone configure vdevXbuffer with the
> > same name at the rproc and rproc-virtio level?  This should be an error.
> >
> 
> The carveout might come from the remote processor's resource table. I
> was unsure on how to treat it (warning or error) - if you advise for
> the second I'll go that route.
> 

Ok, so this is also related to my for patch [5/11], i.e handling of authentic
rproc-virtio device should follow modern practices.   

> > > +			 */
> > > +			dev_warn(dev,
> > > +				 "vdev%dbuffer carveout found, ignoring memory-region\n",
> > > +				 rvdev->index);
> > > +			of_reserved_mem_device_release(dev);
> > 
> > Who would have called of_reserved_mem_device_init_by_XYZ()?  The remoteproc core
> > or virtio core?  
> > 
> The of_dma_configure() call that is part of the platform DMA
> configuration automatically associates to the device the first
> restricted-dma-pool node referenced by memory-region; see [1].
> 
> This is actually beneficial to the proposed solution, but current
> implementation requires this step to avoid leaking the association (this
> will be required also in case of error, because of_dma_configure() is
> called during the probe).
> 

Ok

> > > +		}
> > > +
> > >  		if (mem->of_resm_idx != -1) {
> > >  			struct device_node *np = rproc->dev.parent->of_node;
> > >  
> > > @@ -451,6 +484,14 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> > >  				return ret;
> > >  			}
> > >  		}
> > > +	} else if (has_mem_region) {
> > > +		/* Use the memory region declared in the vdev's own node */
> > > +		ret = rproc_virtio_init_vdev_mem(dev);
> > > +		if (ret) {
> > > +			dev_err(dev, "Can't associate vdev memory-region: %d\n",
> > > +				ret);
> > > +			return ret;
> > > +		}
> > 
> > Mixing the initialisation of the legacy rproc-virtio and authentic rproc-virtio
> > devices is very confusing.  I think there is value in splitting them, even if it
> > entails some code duplication.
> > 
> 
> Ok, I'll split them for V3.
> 

Please move forward on that.  Since it will introduce a fair amount of churn, I
will simply stop reviewing the current set and wait for V3.  You can remove the
"RFC" tag, we are well past that now.


> > Thanks,
> > Mathieu
> > 
> > >  	} else {
> > >  		struct device_node *np = rproc->dev.parent->of_node;
> > >  
> > > 
> > > -- 
> > > 2.56.0
> > > 
> >
> 
> Thank you!
> 
> Regards,
> Francesco
> 
> 
> [1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/of/device.c#L35
> 
