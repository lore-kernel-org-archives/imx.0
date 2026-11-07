Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794035601;
	b=bnjGGRC1kOgNm2eTOu3MFVK5V2QFAlc/ZKd81Xi44YamoslnJ+E8yTixZlEm5yajkD4F
	 7sYZKHBZ7w1/AoSjjhqLSVZDLRoQ7ftpBIXTvYGH+vNYcUcIvLDYvUIahzG7KVyeSvOvi
	 vgV7xssQzPARkv9mTIDb8PBL00iOuecAkzSskTn4m1e7D1paLWUP1rbcOiXMwwfZ7zIUn
	 BJGMqdxJZ41wC0hdCtosy+beBMGPnD3+VL9ateA3/nPK9OH8PbYBVr+OMODkuuRYqu4QE
	 PXka9CVnasxpzSbCg32Kx7xv54G+Byxgax4m0KxcuxyDQWpUqgRC0x4/7fwLbEERBCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794035601;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/xO/+kzareAl9cES+vJX1fp94o/yDo4PAJPX93oB9Eg=;
	b=tUi1Dcymg5yOW1rHtJqMBkINPGZ26DPS5lcGHoHjpnFh+B+fjSku1JzRRJ4SzcyQODIx
	 nTDOjY5M/lOiN1oJQonMEUkawaa38/I/ITuXbQqgXV8iAjsTWCiWK/mQIXrzNRtyyvM+I
	 c5EHpsr75Rfax0gzY5IKp5CXJ6BP3u2uBY1Nx8hESfO3hrFlsr8K3i1gvKGpsCjM3YAX3
	 K7KwZDMAU3ldXssh4NFoiQELBgP3uQU1cvfGvYlstt2n+V50cfj7+2ScQrtPeBaeDihhK
	 Ssap9G++Gu4jWaM4cVh8yrvKms1I7dzYD6TVXk3OpDMfhii6fGOlDEvZXLhhapC5/0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lnkkw+VV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373D3606A326
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 07:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lnkkw+VV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82CA21F0089F;
	Sat,  7 Nov 2026 07:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794035600;
	bh=/xO/+kzareAl9cES+vJX1fp94o/yDo4PAJPX93oB9Eg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lnkkw+VV9bMzb1ySYTeUuzrGJ99JokEyYB4lJSaQdk5ozfP9DfcsfuSc2ddCg5vQi
	 hAzQuOGcvBM5xlq0VKQPHTDOJkr+16jNM05tB7+avVXe60H9oAJIb2GL6uTh2vhgoh
	 VCJe9LBttSMwZbpHTxHjXUFa72dTUJTfhX7sEs4PZiVkIOfxBN+zzGx82Tdkk48P/W
	 E27h0YNz2wBbcqy8Vx7rPijdKPcs3ekoIi6Zo8qxgmazD6TuSNwgJOVQ9qWsQuiZG7
	 OXvuWHhQQJD2WO/awFxWhBI82iEIm3kSLPJbplS2uINCMSkOtTUpZQZ1PFbCHOXYex
	 M6MQ2p8xzT/og==
Message-ID: <sashiko-outbox-202678@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: nxp: imx8-isi: Fix potential pipe leaks on
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <liguangshuo@mail.sdu.edu.cn>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261107-0d0c29e10a-media-imx8-isi-1@mail.sdu.edu.cn>
References: <20261107-0d0c29e10a-media-imx8-isi-1@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 07:13:20 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] media: nxp: imx8-isi: NULL deref on
  media_device_register_entity() error
It also noticed 2 related pre-existing issues this patch does not
introduce:
- [Medium] media: nxp: imx8-isi: stateless device link leak in
  mxc_isi_async_notifier_bound() [1]
- [Critical] media: nxp: imx8-isi: unchecked dma_set_mask_and_coherent()
  in mxc_isi_probe() [2]
--

commit 1c93ad5a0d826cfb633314a1db34b0975979e67c
Author: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

media: nxp: imx8-isi: Fix potential pipe leaks on removal

This commit refcounts mxc_isi_dev so that pipe and V4L2 state stays alive
until both device removal and the last V4L2 reference complete, while
disconnecting capture and M2M queues during unregistration.

> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/driver=
s/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 0ae5f35e017c6..bd046a0751b9f 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c

[ ... ]

> @@ -211,33 +256,25 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *is=
i)
>  	return 0;
> =20
>  err_m2m:
> -	mxc_isi_m2m_unregister(isi);
>  	v4l2_async_nf_cleanup(&isi->notifier);
>  err_v4l2:
> +	mxc_isi_video_unregister_all(isi);
>  	v4l2_device_unregister(v4l2_dev);
> +	media_device_unregister(media_dev);
> +	v4l2_device_put(v4l2_dev);
>  err_media:
> -	media_device_cleanup(media_dev);
>  	return ret;
>  }
> =20
>  static void mxc_isi_v4l2_cleanup(struct mxc_isi_dev *isi)
>  {
> -	unsigned int i;
> +	mxc_isi_video_unregister_all(isi);
> =20
>  	v4l2_async_nf_unregister(&isi->notifier);
>  	v4l2_async_nf_cleanup(&isi->notifier);
> -
>  	v4l2_device_unregister(&isi->v4l2_dev);
>  	media_device_unregister(&isi->media_dev);
> -
> -	mxc_isi_m2m_unregister(isi);
> -
> -	for (i =3D 0; i < isi->pdata->num_channels; ++i)
> -		mxc_isi_pipe_unregister(&isi->pipes[i]);
> -
> -	mxc_isi_crossbar_unregister(&isi->crossbar);
> -
> -	media_device_cleanup(&isi->media_dev);
> +	v4l2_device_put(&isi->v4l2_dev);
>  }

[Severity: Medium]
This problem wasn't introduced by this patch, but does the driver leak the
stateless device link created in mxc_isi_async_notifier_bound() [1]?

drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c:mxc_isi_async_notifier_=
bound() {
	...
	link =3D device_link_add(isi->dev, sd->dev, DL_FLAG_STATELESS);
	if (!link) {
		dev_err(isi->dev,
			"Failed to create device link to source %s\n", sd->name);
		return -EINVAL;
	}

	return v4l2_create_fwnode_links_to_pad(sd, pad, link_flags);
}

Because DL_FLAG_STATELESS is used, the driver core does not remove the link
automatically.  If v4l2_create_fwnode_links_to_pad() fails, or when a
subdevice unbinds or the ISI driver is removed (since
mxc_isi_async_notifier_ops has no .unbind callback and
mxc_isi_v4l2_cleanup() does not delete the link), the device_link and its
device references are leaked, and repeated subdevice unbind/rebind cycles
increment the link's refcount indefinitely.

> @@ -479,11 +516,15 @@ static int mxc_isi_probe(struct platform_device *pd=
ev)
>  	unsigned int i;
>  	int ret =3D 0;
> =20
> -	isi =3D devm_kzalloc(dev, sizeof(*isi), GFP_KERNEL);
> +	isi =3D kzalloc_obj(*isi);
>  	if (!isi)
>  		return -ENOMEM;
> =20
> -	isi->dev =3D dev;
> +	isi->dev =3D get_device(dev);
> +	kref_init(&isi->ref);
> +	ret =3D devm_add_action_or_reset(dev, mxc_isi_put, isi);
> +	if (ret)
> +		return ret;
>  	platform_set_drvdata(pdev, isi);
> =20
>  	isi->pdata =3D of_device_get_match_data(dev);
> @@ -521,48 +562,35 @@ static int mxc_isi_probe(struct platform_device *pd=
ev)
>  		return dev_err_probe(dev, ret,
>  				     "Failed to initialize crossbar\n");

[Severity: Critical]
This problem wasn't introduced by this patch, but should mxc_isi_probe()
check the return value of dma_set_mask_and_coherent() [2]?

drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c:mxc_isi_probe() {
	...
	dma_size =3D isi->pdata->has_36bit_dma ? 36 : 32;
	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_size));

	ret =3D devm_pm_runtime_enable(dev);
	...
}

If setting the 32-bit or 36-bit DMA mask fails, probe continues with an
invalid DMA configuration, which can truncate physical addresses during DMA
transfers and cause memory corruption or IOMMU faults.

[ ... ]

> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers=
/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index b729eecad0fef..5349e09e9b57a 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c

[ ... ]

> @@ -790,11 +801,11 @@ int mxc_isi_m2m_register(struct mxc_isi_dev *isi, s=
truct v4l2_device *v4l2_dev)
>  	vdev->entity.function =3D MEDIA_ENT_F_IO_V4L;
>  	ret =3D media_entity_pads_init(&vdev->entity, 1, &m2m->pad);
>  	if (ret)
> -		goto err_video;
> +		goto err_unregister;
> =20
>  	ret =3D media_device_register_entity(v4l2_dev->mdev, &vdev->entity);
>  	if (ret)
> -		goto err_entity_cleanup;
> +		goto err_unregister;

[ ... ]

>  err_unregister:
> +	mxc_isi_m2m_unregister(isi);
> +err_return:
>  	return ret;
>  }
> =20
> @@ -849,13 +851,43 @@ int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi)
>  {
>  	struct mxc_isi_m2m *m2m =3D &isi->m2m;
>  	struct video_device *vdev =3D &m2m->vdev;
> +	struct mxc_isi_m2m_ctx *ctx;
> =20
> +	if (!video_is_registered(vdev))
> +		return 0;
> +
> +	guard(mutex)(&m2m->contexts_lock);
>  	video_unregister_device(vdev);
> +	v4l2_m2m_suspend(m2m->m2m_dev);
> +	list_for_each_entry(ctx, &m2m->contexts, list) {
> +		guard(mutex)(&ctx->vb2_lock);
> +		vb2_queue_error(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx));
> +		vb2_queue_error(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx));
> +		v4l2_m2m_streamoff(NULL, ctx->fh.m2m_ctx,
> +				   V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +		v4l2_m2m_streamoff(NULL, ctx->fh.m2m_ctx,
> +				   V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	}
> =20
> -	v4l2_m2m_release(m2m->m2m_dev);
> -	media_devnode_remove(m2m->intf);
> -	media_entity_cleanup(&vdev->entity);
> -	mutex_destroy(&m2m->lock);
> +	if (m2m->intf) {
> +		media_devnode_remove(m2m->intf);
> +		m2m->intf =3D NULL;
> +	}
> +	media_device_unregister_entity(&vdev->entity);

[Severity: Medium]
Can jumping to err_unregister when media_device_register_entity() fails
cause a NULL pointer dereference in media_device_unregister_entity()?

drivers/media/mc/mc-device.c:media_device_register_entity() {
	...
	entity->graph_obj.mdev =3D mdev;
	INIT_LIST_HEAD(&entity->links);
	entity->num_links =3D 0;
	entity->num_backlinks =3D 0;

	ret =3D ida_alloc_min(&mdev->entity_internal_idx, 1, GFP_KERNEL);
	if (ret < 0)
		return ret;
	...
}

If ida_alloc_min() fails inside media_device_register_entity(),
entity->graph_obj.mdev is already set, while entity->internal_idx is still 0
and media_gobj_create() has not initialized entity->graph_obj.list.
Calling mxc_isi_m2m_unregister() -> media_device_unregister_entity() on this
partially initialized entity then calls ida_free() on index 0 and
list_del(&gobj->list) on a zeroed list_head, dereferencing NULL.

[1] https://sashiko.dev/#/bug/linux-feae4a20-e500-4215-90d3-b1654008ecd5
[2] https://sashiko.dev/#/bug/linux-939c7345-a73b-4e71-844e-5708e3fa78c4

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-0d0c29e10a=
-media-imx8-isi-1@mail.sdu.edu.cn?part=3D1
