Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C7830C165
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 16:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008926; cv=none; b=PsmX5GW0Euziz5z6VJU2/B3JgqS/6CRdpTutoJC6srLIg/w9Hl7cmQtd6SNrfN+hl10kk5FVVYs5kh/0Ybp4U9ZLnkF1ZrGhZn9KKV68N80S1pRwduwRohlqGkgEoITRTvY4ZstxPwFFHqonxT5jD/rskYWoPiHGtC0L+xTzRgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008926; c=relaxed/simple;
	bh=FaARUEjrFyJuj8uGntTCA4eGDykM1s2cESVLncfkhos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clhJ6LyWxMxVa+dyWXwX/7U6hMJBKiJT7WCmwuYqe/FOX/M8920F95pL+TNYb9tm/DVqnmJMRC1slRTNi1G5VS4fvmikc579OapMl427Wf3j8ydISSEpXBA8PiipRBhxzawB7Hk7Q4AGojXGdcRPvjV/15UgjFXRV5Zp5rvKpNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dxdAH/ca; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dxdAH/ca"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B8C88CB;
	Thu,  2 Jul 2026 18:14:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783008875;
	bh=FaARUEjrFyJuj8uGntTCA4eGDykM1s2cESVLncfkhos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dxdAH/caapOtAKAs+fQGBJuECOgXbJMXWbNP6VbeHZ4/7smBFbzgFixqa/HlBNRMQ
	 yGEADDco/OnHTJ3Xh+etq/6dTqCa3ui6QzWcT8gfpqSzVPpk2lxS8hYR/MB8QMSHm1
	 KLsVLKDhjEu64NJFHfqsi8O3S4vG0DDKwsYPknRw=
Date: Thu, 2 Jul 2026 19:15:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@oss.nxp.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Frank Li <Frank.Li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Guoniu Zhou <guoniu.zhou@nxp.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 2/8] media: subdev: Add media_async_register_subdev()
 helper
Message-ID: <20260702161519.GI3534761@killaraus.ideasonboard.com>
References: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
 <20260702-imx8qxp_pcam-v7-2-b47d9e363400@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260702-imx8qxp_pcam-v7-2-b47d9e363400@nxp.com>

Hi Frank,

Have you missed the comment in v6 ?

https://lore.kernel.org/all/20260629084654.GB3054459@killaraus.ideasonboard.com/

On Thu, Jul 02, 2026 at 12:03:58PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add media_async_register_subdev(), a helper to register a V4L2 sub-device
> with the asynchronous sub-device framework.
> 
> The helper requires each port to contain a single endpoint, with port
> addresses starting at 0 and increasing consecutively.
> 
> During registration it parses the firmware graph, creates media pads for
> all endpoints, and registers common asynchronous notifiers for sink
> endpoints. These notifiers automatically create media links when the
> corresponding remote source devices become available.
> 
> The set_pad_by_ep() callback allows drivers to determine the media pad
> associated with a firmware endpoint and identify whether the endpoint
> represents a sink pad.
> 
> By centralizing firmware graph parsing, media pad creation, notifier
> registration, and link creation, this helper reduces duplicated code and
> simplifies error handling in V4L2 sub-device drivers.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v7
> - don't use saved vep informaiton from media pand
> - fix sashiko report problem
> 
> change in v6
> - new patch
> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 169 ++++++++++++++++++++++++++++++++++
>  include/media/v4l2-async.h            |  39 ++++++++
>  2 files changed, 208 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 62a3a452f7884..4e15adc1af065 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -26,6 +26,7 @@
>  
>  #include <media/v4l2-async.h>
>  #include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
>  #include <media/v4l2-subdev.h>
>  
>  #include "v4l2-subdev-priv.h"
> @@ -1302,6 +1303,174 @@ int __v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd, struct module *m
>  }
>  EXPORT_SYMBOL_GPL(__v4l2_async_register_subdev_sensor);
>  
> +static int v4l2_common_notifier_bound(struct v4l2_async_notifier *notifier,
> +				      struct v4l2_subdev *sd,
> +				      struct v4l2_async_connection *asd)
> +{
> +	struct media_pad *pad = NULL;
> +	struct fwnode_endpoint ep;
> +	int ret;
> +
> +	if (asd->match.type != V4L2_ASYNC_MATCH_TYPE_FWNODE)
> +		return -EINVAL;
> +
> +	if (!asd->match.fwnode)
> +		return -EINVAL;
> +
> +	struct fwnode_handle *remote __free(fwnode_handle) =
> +		fwnode_graph_get_remote_endpoint(asd->match.fwnode);
> +
> +	ret = fwnode_graph_parse_endpoint(remote, &ep);
> +	if (ret)
> +		return -EINVAL;
> +
> +	for (int i = 0; i < notifier->sd->entity.num_pads; i++) {
> +		if (notifier->sd->entity.pads[i].index == ep.port) {
> +			pad = &notifier->sd->entity.pads[i];
> +			break;
> +		}
> +	}
> +
> +	if (!pad) {
> +		dev_err(notifier->sd->dev, "failed to find sink pad\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = v4l2_create_fwnode_links_to_pad(sd, pad, MEDIA_LNK_FL_ENABLED);
> +	if (ret) {
> +		dev_err(sd->dev, "failed to link source pad\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_async_notifier_operations v4l2_common_notifier_ops = {
> +	.bound = v4l2_common_notifier_bound,
> +};
> +
> +/*
> + * The only one endpoint under one port. And all ports number is continues.
> + */
> +static int
> +v4l2_async_nf_parse_fwnode(struct device *dev, struct media_pad *pads, u32 pads_count,
> +			   struct v4l2_async_notifier *notifier)
> +{
> +	struct v4l2_subdev *sd = notifier->sd;
> +	struct v4l2_async_connection *asd;
> +	struct v4l2_fwnode_endpoint vep;
> +	struct media_pad *pad;
> +	int ret;
> +
> +	if (!sd->internal_ops || !sd->internal_ops->set_pad_by_ep)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Missed set_pad_by_ep() callback\n");
> +	pad = pads;
> +
> +	fwnode_graph_for_each_endpoint_scoped(dev_fwnode(dev), ep) {
> +		u32 flags;
> +
> +		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to parse endpoint\n");
> +
> +		if (vep.base.port >= pads_count)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "port number bigger than pad number\n");
> +
> +		pad = pads + vep.base.port;
> +
> +		ret = sd->internal_ops->set_pad_by_ep(sd, pad, &vep);
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret, "Can support endpoint\n");
> +
> +		flags = pad->flags;
> +
> +		if (flags & MEDIA_PAD_FL_SOURCE)
> +			continue; /* Bypass source port */
> +
> +		notifier->ops = &v4l2_common_notifier_ops;
> +
> +		asd = v4l2_async_nf_add_fwnode_remote(notifier, ep,
> +						      struct v4l2_async_connection);
> +		if (IS_ERR(asd))
> +			return dev_err_probe(dev, PTR_ERR(asd),
> +					      "failed to add notifier\n");
> +	}
> +
> +	return 0;
> +}
> +
> +void media_async_subdev_cleanup(struct v4l2_subdev *sd)
> +{
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_async_nf_unregister(sd->subdev_notifier);
> +	v4l2_async_nf_cleanup(sd->subdev_notifier);
> +	kfree(sd->entity.pads);
> +}
> +EXPORT_SYMBOL_GPL(media_async_subdev_cleanup);
> +
> +int __media_async_register_subdev(struct v4l2_subdev *sd, struct module *module)
> +{
> +	struct device *dev = sd->dev;
> +	u32 ep_count;
> +	int ret;
> +
> +	if (WARN_ON(!sd->dev))
> +		return -ENODEV;
> +
> +	struct v4l2_async_notifier *notifier __free(kfree) = kzalloc_obj(*notifier);
> +	if (!notifier)
> +		return -ENOMEM;
> +
> +	v4l2_async_subdev_nf_init(notifier, sd);
> +
> +	ep_count = fwnode_graph_get_endpoint_count(dev_fwnode(dev),
> +						   FWNODE_GRAPH_DEVICE_DISABLED);
> +	if (!ep_count)
> +		return dev_err_probe(dev, -EINVAL, "No connected endpoints\n");
> +
> +	struct media_pad *pads __free(kfree) = kzalloc_objs(struct media_pad, ep_count);
> +	if (!pads)
> +		return -ENOMEM;
> +
> +	ret = v4l2_async_nf_parse_fwnode(dev, pads, ep_count, notifier);
> +	if (ret < 0)
> +		goto out_cleanup;
> +
> +	ret = media_entity_pads_init(&sd->entity, ep_count, pads);
> +	if (ret)
> +		goto out_cleanup;
> +
> +	ret = v4l2_async_nf_register(notifier);
> +	if (ret < 0)
> +		goto out_cleanup;
> +
> +	ret = v4l2_subdev_init_finalize(sd);
> +	if (ret)
> +		goto out_unregister;
> +
> +	ret = __v4l2_async_register_subdev(sd, module);
> +	if (ret < 0)
> +		goto out_unregister;
> +
> +	sd->subdev_notifier = no_free_ptr(notifier);
> +	retain_and_null_ptr(pads);
> +
> +	return 0;
> +
> +out_unregister:
> +	v4l2_async_nf_unregister(notifier);
> +	v4l2_subdev_cleanup(sd);
> +out_cleanup:
> +	v4l2_async_nf_cleanup(notifier);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(__media_async_register_subdev);
> +
>  MODULE_DESCRIPTION("V4L2 fwnode binding parsing library");
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 54a2d9620ed5b..ca41820f776c5 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -345,4 +345,43 @@ __v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd, struct module *modul
>   * @sd: pointer to &struct v4l2_subdev
>   */
>  void v4l2_async_unregister_subdev(struct v4l2_subdev *sd);
> +
> +enum v4l2_subdev_1to1_pads {
> +	V4L2_SUBDEV_1TO1_PADS_SINK,
> +	V4L2_SUBDEV_1TO1_PADS_SOURCE,
> +	V4L2_SUBDEV_1TO1_PADS_TOTAL,
> +};
> +
> +/**
> + * media_async_register_subdev - registers a sub-device to the asynchronous
> + *				 sub-device framework and parse set up common
> + *				 related devices
> + *
> + * @sd: pointer to struct &v4l2_subdev
> + *
> + * Register a V4L2 sub-device with the asynchronous sub-device framework.
> + * In addition to v4l2_async_register_subdev(), this function parses the
> + * firmware graph, creates media pads for the endpoints, and registers common
> + * notifiers to create media links between connected devices.
> + *
> + * This function also init media_pads.
> + *
> + * The sub-device is unregistered and cleanup by media_async_subdev_cleanup()
> + *
> + * While registered, the subdev module is marked as in-use.
> + *
> + * An error is returned if the module is no longer loaded on any attempts
> + * to register it.
> + */
> +#define media_async_register_subdev(sd_1to1) \
> +	 __media_async_register_subdev(sd_1to1, THIS_MODULE)
> +
> +int __media_async_register_subdev(struct v4l2_subdev *sd_1to1, struct module *module);
> +
> +/**
> + * media_async_subdev_cleanup - unregistered and cleanup subdev and media pads
> + * @sd_1to1: pointer to struct &v4l2_subdev_1to1
> + */
> +void media_async_subdev_cleanup(struct v4l2_subdev *sd_1to1);
> +
>  #endif

-- 
Regards,

Laurent Pinchart
