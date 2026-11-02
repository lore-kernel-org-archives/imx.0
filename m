Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793577778;
	b=b6TC1ozFTJat+6rykIJ5JUlgbwZMwtlKFc564YFqlUywN5zfpOSxxJ3b8m6zoQdfE5v0
	 j4icFbRZYPKUPc9EJCHQdjV8aABeNLZgaIUrncYdtEVsHFIeEBTRUD/d4IAdjMAks4NTj
	 c13oze9xgxAgOum0aNBr2fb9DJHx7PXfzdjJhrX6C/hretwLPkykoc4M7MB39kXHy+NdD
	 8bh0u5M2O7l8gHxrivgMjwLVjhK0hOL7rHvQNBDXOyff5AypNt+TPrZBRhyspyTM5g6pP
	 rLh4esb0gOOQISxUP5v5kv0We271knwDuEGq0CDCvvZrVczNufSzOzS60+xlxqfiHkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793577778;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4qIby5wrhy/8mg9ZF5x0rKsJeZTzsj6O9jhH1+m5l/4=;
	b=gClvtrXmP65sgRSAEzLUp2RkB+xKwsZOq8iwYCNmA5e/q13twT9PYwZVgaWuzQFKnFDN
	 xypJGvcT8s668A5VLqtBPW6FUf+tn0sqmUIcw+lqGHOKl7UWuOmhwln83jNi4evGMnv0C
	 WFizPHzH8keireecBOpE6hHO1dKmZqBRuVEEnvJ7AUC9CjHz5Xtd8EfSJVSbXXgMcxtqN
	 DuuCtq6VLkXokRIDeS8E561dKeoLidGSgCcCFuJMezXpFBuE0yXX0q0bvHboFoDrns3h3
	 IwI29OZrzsi4w/V51B55xKCmvJf/aigtl5MbBoAHx2Vn59Z4ar7FQgfkCN2hOja6cSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qn172Msh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2A7606A324;
	Mon,  2 Nov 2026 00:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qn172Msh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB2C1F000C1;
	Mon,  2 Nov 2026 00:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793577778;
	bh=4qIby5wrhy/8mg9ZF5x0rKsJeZTzsj6O9jhH1+m5l/4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qn172MshRXn7NI03V33Y1dIQNDEnOrhuRGwH94rFrTciqbFDNDDTiPO0pn58Owx52
	 Vc5GeGEVLcXM0fi6MC7onN6QzMmHpEqhlXddyiUARWYnDm9rvCcRb7JJf8X1kLWkCY
	 EV3cfaVk/d7nw7pfHKSnxrhGSy8eMolIOTuxHYQVsCyg+ATOV1bfkHtPlh9eGRMH+b
	 NPyezxJLVoxPGQMs5wDltL7QYS3gb/thSCYZWdwnl/6dODDFdM8T2Jx9s8CAaP4KcK
	 fYj9oKxqD872bAbV4LjWz2iA2c9TEQdToAnpE4t3k2Gv/81dTPF02JjYuO2XcqGDXF
	 b0W/YqrwGHrzA==
Message-ID: <sashiko-outbox-192788@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 07/11] remoteproc: assign fwnode during vdev
 registration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Francesco Valla" <francesco@valla.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261102-remoteproc_virtio_map-v2-7-26b300e01c62@valla.it>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-7-26b300e01c62@valla.it>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 00:02:57 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] remoteproc: unreleased reserved memory before register_virtio_devi=
ce()
--

commit 3f46613846e39fe7244229a8a47044d9f38bc9cb
Author: Francesco Valla <francesco@valla.it>

remoteproc: assign fwnode during vdev registration

This commit looks up a child firmware node describing a virtio device
during vdev registration and assigns it to the rproc-virtio platform
device, using its memory-region when no parent carveout is provided.

> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/=
remoteproc_virtio.c
> index 1496659ddff9e..950d65480be59 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
[ ... ]
> @@ -394,6 +396,23 @@ static void rproc_virtio_dev_release(struct device *=
dev)
>  	put_device(&rvdev->pdev->dev);
>  }
> =20
> +/*
> + * Attach the memory region declared inside the vdev's own devicetree no=
de.
> + *
> + * A restricted-dma-pool region is attached by of_dma_configure() when t=
he
> + * platform device is probed, but it is released together with the virtio
> + * device (see rproc_virtio_dev_release()); attach it again if needed, e=
.g.
> + * when the remote processor is restarted during a crash recovery.
> + * Any other kind of region (e.g., shared-dma-pool) is attached only her=
e.
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
> @@ -410,6 +429,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rv=
dev, int id)
>  	struct device *dev =3D &rvdev->pdev->dev;
>  	struct virtio_device *vdev;
>  	struct rproc_mem_entry *mem;
> +	bool has_mem_region;
>  	int ret;
> =20
>  	if (rproc->ops->kick =3D=3D NULL) {
> @@ -417,11 +437,24 @@ static int rproc_add_virtio_dev(struct rproc_vdev *=
rvdev, int id)
>  		return -EINVAL;
>  	}
> =20
> +	has_mem_region =3D of_property_present(dev->of_node, "memory-region");
> +
>  	/* Try to find dedicated vdev buffer carveout */
>  	mem =3D rproc_find_carveout_by_name(rproc, "vdev%dbuffer", rvdev->index=
);
>  	if (mem) {
>  		phys_addr_t pa;
> =20
> +		if (has_mem_region) {
> +			/*
> +			 * The carveout takes precedence: drop the region that
> +			 * of_dma_configure() might have attached at probe time.
> +			 */
> +			dev_warn(dev,
> +				 "vdev%dbuffer carveout found, ignoring memory-region\n",
> +				 rvdev->index);
> +			of_reserved_mem_device_release(dev);
> +		}
> +
>  		if (mem->of_resm_idx !=3D -1) {
>  			struct device_node *np =3D rproc->dev.parent->of_node;
> =20
> @@ -451,6 +484,14 @@ static int rproc_add_virtio_dev(struct rproc_vdev *r=
vdev, int id)
>  				return ret;
>  			}
>  		}
> +	} else if (has_mem_region) {
> +		/* Use the memory region declared in the vdev's own node */
> +		ret =3D rproc_virtio_init_vdev_mem(dev);
> +		if (ret) {
> +			dev_err(dev, "Can't associate vdev memory-region: %d\n",
> +				ret);
> +			return ret;
> +		}

[Severity: High]
What happens to the reserved memory attached to &rvdev->pdev->dev if the
virtio device is never registered?

When rproc_handle_vdev() sets pdev_info.fwnode and registers the platform
device via platform_device_register_full(), a restricted-dma-pool region
in the vdev node is attached during probe by:

  really_probe()
    -> platform_dma_configure()
      -> of_dma_configure()
        -> of_dma_configure_id()
          -> of_dma_set_restricted_buffer()
            -> of_reserved_mem_device_init_by_idx()

This allocates a struct rmem_assigned_device entry pointing to &pdev->dev
and links it into the global of_rmem_assigned_device_list.

Similarly, in rproc_add_virtio_dev(), rproc_virtio_init_vdev_mem() (or the
carveout / parent fallback paths) attaches reserved or coherent memory to
&rvdev->pdev->dev before vdev =3D kzalloc_obj(*vdev) is called:

  rproc_add_virtio_dev() {
      ...
      } else if (has_mem_region) {
          ret =3D rproc_virtio_init_vdev_mem(dev);
          ...
      }
      vdev =3D kzalloc_obj(*vdev);
      if (!vdev)
          return -ENOMEM;
  }

However, of_reserved_mem_device_release(&rvdev->pdev->dev) and
dma_release_coherent_memory(&rvdev->pdev->dev) are only called in
rproc_virtio_dev_release(), not in rproc_virtio_remove() or in the error
paths of rproc_virtio_probe() and rproc_add_virtio_dev().

If rproc_virtio_probe() fails, if rproc_fw_boot() or rproc_attach() fails
after rproc_handle_vdev() (for example in rproc_alloc_registered_carveouts(=
),
rproc_load_segments(), rproc_prepare_subdevices(), or rproc->ops->start()),
or if rproc_add_virtio_dev() fails when rproc->ops->kick is NULL or when
kzalloc_obj(*vdev) returns NULL, rproc_virtio_dev_release() never runs.

When rproc_resource_cleanup() then unregisters and frees rvdev->pdev,
doesn't that leak the struct rmem_assigned_device entry on
of_rmem_assigned_device_list with a dangling rd->dev pointer to the freed
platform device (and leave the memory region attached across crash
recovery attempts so dma_assign_coherent_memory() fails with -EBUSY)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-remoteproc=
_virtio_map-v2-0-26b300e01c62@valla.it?part=3D7
