Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEF23438BE;
	Thu,  2 Jul 2026 16:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783009358; cv=none; b=GUhzCbLPs5L43A/qjHDqaH9Rc01GMVYNXEnsmSc/pcq43Gcn7cw8h/JpTvbUW/EVxG0eIGunKv3aZG8JbZOZfk0f/XovTJq8gn4i1Wt4XzoJ/Du8J2oZ+V2kr0v8xwT9RVTHkh6hSIByuxRg9vWAuq2LOTwSEyQ3oB4wr3dMF6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783009358; c=relaxed/simple;
	bh=xST/xqTrei21ylbcCPgPCDXFBN030b8KkjntlgFmecg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NHMwhehl8rOVkL/uc6UGcybptRdoGuKOdl0ZyIfiCDpylEytFnm8DHuQypoBFssU4fu7QKrCo1ht34WpnVVO/Tw+hKTeCnu6LFfDCG3PQ0Ob+7UV0Rvsd41wiWmZ/ey6RXpAKMNbhVMF8mze2UOP03ON5GcVm/4BXw86vF3SqeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I0KxwP+t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0KxwP+t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999DC1F000E9;
	Thu,  2 Jul 2026 16:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783009355;
	bh=SxBa45VxQ5m6WK2ncEVMqYs/sRtjbSJyr3P50XAEKGg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I0KxwP+tEQ7D4uLSD8R3m2/9a5rlNgjc7VYhvH+UGXOFynsYsHUix86pEYuNqHpXA
	 ew6JFjwpgBsCKqZVlD7LVjREFR6bgcbF6bxY+BNQHrYxvWXDLjpJt1Wg/OGBs9TYin
	 E6O7zwMhx74HhejQmh6sKjtjS7WJ6cgJBFZjvn2rVRX4SBinGZIdvP6h8Reatz7zDH
	 nW0GCrtUNwlh5nCzCR3ekxnL7Utr9O9SuPJbLgJYODxr4jguTrlc+zO2iDoKMFu363
	 vgQAV/KE7y5pwCV026IlmSNqpj/8ac3Rf6fvvvbj5vvuS0DQ2EBvx5eeGGvkbuskKK
	 vFXcjn0bTlVJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/8] media: subdev: Add media_async_register_subdev()
 helper
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260702-imx8qxp_pcam-v7-2-b47d9e363400@nxp.com>
References: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
 <20260702-imx8qxp_pcam-v7-2-b47d9e363400@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 16:22:34 +0000
Message-Id: <20260702162234.999DC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Uninitialized `v4l2_fwnode_endpoint` struct causes unpredictable p=
arsing failures.
- [High] Mixing goto-based error handling with `__free()` cleanup causes a =
dangling pointer and potential double-free.
- [Low] Build failure due to undefined macro `fwnode_graph_for_each_endpoin=
t_scoped`.
- [Low] Redundant and useless notifier cleanup in `media_async_subdev_clean=
up`.
- [Low] Misleading error message when an endpoint is unsupported.
--

commit 9d4b9d1706779f41c6021852dce23778f72cf70b
Author: Frank Li <Frank.Li@nxp.com>
Subject: media: subdev: Add media_async_register_subdev() helper

This commit adds a helper to register a V4L2 sub-device with the asynchrono=
us
sub-device framework. It centralizes firmware graph parsing, media pad crea=
tion,
and notifier registration to reduce duplicated code in V4L2 drivers.

> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-c=
ore/v4l2-fwnode.c
> index 62a3a452f7884..4e15adc1af065 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
[ ... ]
> @@ -1302,6 +1303,174 @@ int __v4l2_async_register_subdev_sensor(struct v4=
l2_subdev *sd, struct module *m
[ ... ]
> +static int
> +v4l2_async_nf_parse_fwnode(struct device *dev, struct media_pad *pads, u=
32 pads_count,
> +			   struct v4l2_async_notifier *notifier)
> +{
> +	struct v4l2_subdev *sd =3D notifier->sd;
> +	struct v4l2_async_connection *asd;
> +	struct v4l2_fwnode_endpoint vep;

[Severity: High]
Should vep be initialized before use?

When passed to v4l2_fwnode_endpoint_parse(), uninitialized fields like
vep.bus_type might contain stack garbage. Could this potentially confuse the
parser into assuming a specific bus type was requested, leading to parsing
failures?

> +	struct media_pad *pad;
> +	int ret;
> +
> +	if (!sd->internal_ops || !sd->internal_ops->set_pad_by_ep)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Missed set_pad_by_ep() callback\n");
> +	pad =3D pads;
> +
> +	fwnode_graph_for_each_endpoint_scoped(dev_fwnode(dev), ep) {

[Severity: Low]
Does this macro exist in the kernel? It looks like
fwnode_graph_for_each_endpoint_scoped is not defined yet, which might cause=
 a
build failure here.

> +		u32 flags;
> +
> +		ret =3D v4l2_fwnode_endpoint_parse(ep, &vep);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to parse endpoint\n");
> +
> +		if (vep.base.port >=3D pads_count)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "port number bigger than pad number\n");
> +
> +		pad =3D pads + vep.base.port;
> +
> +		ret =3D sd->internal_ops->set_pad_by_ep(sd, pad, &vep);
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret, "Can support endpoint\n");

[Severity: Low]
Is there a typo in this error message? It says "Can support endpoint" when
it is on the failure path, which might be confusing during debugging.

[ ... ]
> +void media_async_subdev_cleanup(struct v4l2_subdev *sd)
> +{
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_async_nf_unregister(sd->subdev_notifier);
> +	v4l2_async_nf_cleanup(sd->subdev_notifier);

[Severity: Low]
Are these notifier cleanup calls necessary here?

v4l2_async_unregister_subdev() already unregisters and cleans up the
notifier, then sets sd->subdev_notifier to NULL. These subsequent calls
appear to operate on a NULL pointer.

> +	kfree(sd->entity.pads);
> +}
> +EXPORT_SYMBOL_GPL(media_async_subdev_cleanup);
> +
> +int __media_async_register_subdev(struct v4l2_subdev *sd, struct module =
*module)
> +{
> +	struct device *dev =3D sd->dev;
> +	u32 ep_count;
> +	int ret;
> +
> +	if (WARN_ON(!sd->dev))
> +		return -ENODEV;
> +
> +	struct v4l2_async_notifier *notifier __free(kfree) =3D kzalloc_obj(*not=
ifier);
> +	if (!notifier)
> +		return -ENOMEM;
> +
> +	v4l2_async_subdev_nf_init(notifier, sd);
> +
> +	ep_count =3D fwnode_graph_get_endpoint_count(dev_fwnode(dev),
> +						   FWNODE_GRAPH_DEVICE_DISABLED);
> +	if (!ep_count)
> +		return dev_err_probe(dev, -EINVAL, "No connected endpoints\n");
> +
> +	struct media_pad *pads __free(kfree) =3D kzalloc_objs(struct media_pad,=
 ep_count);
> +	if (!pads)
> +		return -ENOMEM;
> +
> +	ret =3D v4l2_async_nf_parse_fwnode(dev, pads, ep_count, notifier);
> +	if (ret < 0)
> +		goto out_cleanup;
> +
> +	ret =3D media_entity_pads_init(&sd->entity, ep_count, pads);
> +	if (ret)
> +		goto out_cleanup;
> +
> +	ret =3D v4l2_async_nf_register(notifier);
> +	if (ret < 0)
> +		goto out_cleanup;
> +
> +	ret =3D v4l2_subdev_init_finalize(sd);
> +	if (ret)
> +		goto out_unregister;
> +
> +	ret =3D __v4l2_async_register_subdev(sd, module);
> +	if (ret < 0)
> +		goto out_unregister;
> +
> +	sd->subdev_notifier =3D no_free_ptr(notifier);
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

[Severity: High]
Could this goto-based error path lead to a dangling pointer?

Earlier in the function, media_entity_pads_init() stores the local pads
pointer into sd->entity.pads. When jumping to out_cleanup, the
compiler-inserted cleanup implicitly frees pads upon returning, but
sd->entity.pads is never reset to NULL.

If the driver handles the failure by calling media_async_subdev_cleanup(),
might this result in a double-free on sd->entity.pads? The cleanup
subsystem guidelines prohibit mixing goto labels with scope-based
cleanup annotations for this reason.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-imx8qxp_pc=
am-v7-0-b47d9e363400@nxp.com?part=3D2
