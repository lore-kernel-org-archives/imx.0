Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE3EF9D9;
	Tue, 12 May 2026 05:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778563750; cv=none; b=sWEJ25adiY5VgtfH5VyheCEdKlBfouS8cFE7RycsQGR3jiOfZyZh6PvXeeXE1nkWbmwFdqO+mWpre0r+wQP7v4z8pw9+fBICEKIJ06/Lde2j+gGyfeA/qWrZ4eknhQ2kX/L2rXP6RZ7GyiMqlrMiAJU6HqLnJXaXhoP6IEVWQ/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778563750; c=relaxed/simple;
	bh=WMYUtj6BzzzSNCS45PXdU6IBlw4t+baul9rE2YGVQDM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eti5IHuXYZxVKx3rU8IFASBXEeEthcGIxTiXwbPGCSABnu920ljyY1VS2V1EMSP3i8QnH3EXJn+haSQFiw6UtaUfkC0JXob2NKuevH8PZG4eZHLPE5AwPSnA7ELQS28SiPf8YMRWk5taJgwh3n4kL4RAbSQY6d6OD2CfLUn8QIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DGA5yD1b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DGA5yD1b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B44C2BCB0;
	Tue, 12 May 2026 05:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778563750;
	bh=WMYUtj6BzzzSNCS45PXdU6IBlw4t+baul9rE2YGVQDM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=DGA5yD1brCi2HRnKEg+gJV4LiHn6IgMYFFnjAEwBjkQ7to2ja5Ebn6517WWJznqFt
	 dqwuqrxIutDK3vO952c8wqV0Qr02LQgcr4EVs+I9hPvq88UGoZ3ap/cy0hrD+uvDSO
	 POB1j02wkxCe/ildAMYCimA7LeI0UsEdVFjSRiDHfAS8/s4zQUp2LOkmFq1ATAp4n3
	 kt8N/D/hB2x6SVe3rOy8CtqBZf8CaA+UiQn8OqDiBYIY4b4fT28IyWlag4FVcVIOPh
	 BaI7hUvXQkBid72QB1ocQwVrGPN+s0due8n/vdoXzUuRIgVFwzwu1LbuYSI4OY2Fwd
	 hN5vr7hcNpZQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/8] media: platform: Add NXP Neoisp Image Signal
 Processor
Reply-To: sashiko@lists.linux.dev
To: "Antoine Bouyer" <antoine.bouyer@nxp.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, krzk+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260511132629.1300868-7-antoine.bouyer@nxp.com>
References: <20260511132629.1300868-7-antoine.bouyer@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 05:29:09 +0000
Message-Id: <20260512052910.40B44C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [Critical] Concurrency / List Corruption in `neoisp_prepare_job` due to l=
ockless `ready_queue` access.
- [Critical] TOCTOU in userspace parameters buffer leading to Arbitrary Cod=
e Execution.
- [Critical] Typo in `NEOISP_COLORSPACE_MASK` (`&&` instead of `&`) leading=
 to Out-of-Bounds Read.
- [High] Incorrect standard `memcpy()` used for `__iomem` regions.
- [High] Stale buffer pointers in `queued_job.buf` leading to Double-Comple=
tion and Use-After-Free.
- [High] Double `v4l2_device_unregister` in `neoisp_init_devices` error pat=
h.
- [High] Use-After-Free due to incorrect teardown order in `neoisp_destroy_=
devices()`.
- [High] Asynchronous Runtime PM suspend is cancelled during device removal=
, leaving hardware powered on.
- [High] Unprotected hardware access in the IRQ handler while the device ma=
y be suspended.
- [High] HDR mode bits are not disabled when `INPUT1_NODE` stops streaming.
- [High] Unchecked `get_vaddr()` return value leads to NULL pointer derefer=
ence.
- [Medium] Missing `HAS_DMA` dependency in Kconfig for `VIDEOBUF2_DMA_CONTI=
G`.
- [Low] Unconditional assignment of `dev_pm_ops` structure creates dead cod=
e.
--

commit 6a87cbbdaa6c05a70269ebaa1a23189afb0ffe0f
Author: Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: media: platform: Add NXP Neoisp Image Signal Processor

This commit introduces the NXP Neoisp driver to support 8-16 bit RAW Bayer,
monochrome, and generic v4l2-isp formats. It features a standalone module
parameter, supports generic v4l2-isp parameters and statistics, and handles
context sharing across multiple V4L2 nodes.

> diff --git a/drivers/media/platform/nxp/neoisp/Kconfig b/drivers/media/pl=
atform/nxp/neoisp/Kconfig
> --- /dev/null
> +++ b/drivers/media/platform/nxp/neoisp/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config VIDEO_NXP_NEOISP
> +	tristate "NXP NEO Image Signal Processor (ISP) driver"
> +	depends on VIDEO_DEV
> +        depends on ARCH_MXC || COMPILE_TEST
> +	select MEDIA_CONTROLLER
> +	select VIDEOBUF2_DMA_CONTIG

Will selecting VIDEOBUF2_DMA_CONTIG on architectures lacking HAS_DMA when
COMPILE_TEST is enabled result in unmet Kconfig dependency warnings and bui=
ld
failures?

> diff --git a/drivers/media/platform/nxp/neoisp/neoisp.h b/drivers/media/p=
latform/nxp/neoisp/neoisp.h
> --- /dev/null
> +++ b/drivers/media/platform/nxp/neoisp/neoisp.h
[ ... ]
> +#define NEOISP_COLORSPACE_MASK(colorspace) BIT((colorspace) && 0x1f)

Is it possible this intended to use a bitwise AND instead of a logical AND?

Using && evaluates to BIT(1) for any non-zero colorspace, which could render
the validation in neoisp_try_fmt() ineffective. If userspace requests an
unsupported colorspace, could this cause the xfer and enc indices to exceed
the bounds of xfer_lut and enc_lut during hardware programming?

> diff --git a/drivers/media/platform/nxp/neoisp/neoisp_ctx.c b/drivers/med=
ia/platform/nxp/neoisp/neoisp_ctx.c
> --- /dev/null
> +++ b/drivers/media/platform/nxp/neoisp/neoisp_ctx.c
[ ... ]
> +static inline void ctx_blk_write(enum isp_block_map_e map, u32 *ptr, u32=
 *dest)
> +{
[ ... ]
> +	memcpy(dest + woffset, ptr, count);
> +}

Is it safe to use standard memcpy() on __iomem regions here, and similarly
in neoisp_ctx_upload_context() and neoisp_ctx_get_stats_blk()?

On ARM64 architectures, executing standard memory instructions against Devi=
ce
memory might generate synchronous external aborts. Should this use
memcpy_toio() and memcpy_fromio() instead?

> +void neoisp_ctx_update_w_user_params(struct neoisp_dev_s *neoispd)
> +{
[ ... ]
> +	params =3D (struct v4l2_isp_buffer *)get_vaddr(buf);
> +
> +	if (params->data_size =3D=3D 0)

Can get_vaddr() return NULL for unmapped DMABUF buffers?

If so, does dereferencing params->data_size here unconditionally lead to a
NULL pointer dereference?

> +	while (block_offset < max_offset) {
> +		union neoisp_params_block_u *block =3D (union neoisp_params_block_u *)
> +			&params->data[block_offset];
> +		block_offset +=3D block->header.size;
> +
> +		block_handler =3D &neoisp_block_handlers[block->header.type];
> +		block_handler->handler(neoispd->context, block);
> +	}

Is this vulnerable to a Time-Of-Check-to-Time-Of-Use (TOCTOU) race conditio=
n?

Since the buffer can be modified by userspace concurrently after the initial
QBUF validation, could a malicious thread alter the block->header.type field
to an out-of-bounds value and force the driver to execute an arbitrary func=
tion
pointer?

> +void neoisp_ctx_update_hdr_mode(struct neoisp_dev_s *neoispd,
> +				struct neoisp_context_s *context)
> +{
> +	struct neoisp_hdr_merge_s *hmg =3D &context->hw.hdr_merge;
> +	struct neoisp_hdr_decompress1_s *hd1 =3D &context->hw.hdr_decompress1;
> +
> +	hmg->ctrl |=3D NEO_HDR_MERGE_CTRL_CAM0_ENABLE;
> +	hd1->ctrl |=3D NEO_HDR_DECOMPRESS1_CTRL_CAM0_ENABLE;
> +}

Does the driver ever disable these HDR mode bits when INPUT1_NODE stops
streaming?

If INPUT0_NODE continues streaming without INPUT1_NODE, could the hardware
remain in an invalid HDR mode and attempt to read from a zeroed DMA address?

> diff --git a/drivers/media/platform/nxp/neoisp/neoisp_main.c b/drivers/me=
dia/platform/nxp/neoisp/neoisp_main.c
> --- /dev/null
> +++ b/drivers/media/platform/nxp/neoisp/neoisp_main.c
[ ... ]
> +static int neoisp_prepare_job(struct neoisp_dev_s *neoispd)
> +{
[ ... ]
> +	for (i =3D 0; i < NEOISP_NODES_COUNT; i++) {
> +		if (buf[i]) {
> +			list_del(&buf[i]->ready_list);
> +			job->buffers[i] =3D buf[i];
> +		}
> +	}

Are we iterating and removing items from the ready_queue across multiple no=
des
without holding a cross-node or global lock?

Since neoisp_node_buf_queue() inserts buffers into these lists using only a
per-node queue_lock, could concurrent QBUF calls lead to list corruption he=
re?

> +static irqreturn_t neoisp_irq_handler(int irq, void *dev_id)
> +{
[ ... ]
> +	irq_status =3D neoisp_rd(neoispd, NEO_PIPE_CONF_INT_STAT0);

Can this interrupt handler run while the hardware is in a suspended Runtime=
 PM
state?

If a shared or spurious interrupt fires, could accessing
NEO_PIPE_CONF_INT_STAT0 without calling pm_runtime_get_if_active() result in
a bus hang or invalid read?

[ ... ]
> +	if (done) {
> +		for (i =3D 0; i < NEOISP_NODES_COUNT; i++) {
> +			if (buf[i]) {
> +				buf[i]->vb.sequence =3D neoispd->frame_sequence;
> +				buf[i]->vb.vb2_buf.timestamp =3D ts;
> +				vb2_buffer_done(&buf[i]->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +			}
> +		}

Should the completed buffer pointers in neoispd->queued_job.buf be cleared
here?

If a subsequent spurious or late error interrupt fires and sets done =3D tr=
ue
before a new job is scheduled, could the handler invoke vb2_buffer_done()
again on the same buffer pointers, causing a use-after-free?

> +static void neoisp_destroy_devices(struct neoisp_dev_s *neoispd)
> +{
[ ... ]
> +	if (neoispd->context) {
> +		dma_free_coherent(neoispd->dev,
> +				  sizeof(struct neoisp_context_s),
> +				  neoispd->context,
> +				  neoispd->params_dma_addr);
> +	}
[ ... ]
> +	for (i =3D NEOISP_NODES_COUNT - 1; i >=3D 0; i--) {
> +		video_unregister_device(&neoispd->node[i].vfd);
> +		vb2_queue_release(&neoispd->node[i].queue);
> +	}
> +}

Is it possible for a use-after-free to occur here?

Releasing the queues calls neoisp_node_stop_streaming(), which calls
neoisp_set_default_context(). That function performs a memcpy() into
neoispd->context, but neoispd->context has already been freed by
dma_free_coherent() earlier in this function.

> +static int neoisp_init_devices(struct neoisp_dev_s *neoispd)
> +{
[ ... ]
> +	ret =3D media_device_register(mdev);
> +	if (ret)
> +		goto err_media;
> +
> +	return 0;
> +
> +err_media:
> +	neoisp_destroy_devices(neoispd);
> +err_group:
> +	media_device_cleanup(&neoispd->mdev);
> +err_unregister_v4l2:
> +	v4l2_device_unregister(v4l2_dev);
> +	return ret;
> +}

Does this error path unregister the V4L2 device twice?

neoisp_destroy_devices() internally calls v4l2_device_unregister() on
&neoispd->v4l2_dev, and execution then falls through to err_unregister_v4l2,
calling it again.

> +static void neoisp_remove(struct platform_device *pdev)
> +{
[ ... ]
> +	pm_runtime_dont_use_autosuspend(neoispd->dev);
> +	pm_runtime_disable(neoispd->dev);
> +}

Could this leave the hardware powered on indefinitely?

If there are asynchronous suspend requests queued (for instance, via
pm_runtime_put_autosuspend() during vb2_queue_release()), calling
pm_runtime_disable() immediately will cancel those pending idle/suspend work
tasks.

> +static struct platform_driver neoisp_driver =3D {
> +	.probe  =3D neoisp_probe,
> +	.remove =3D neoisp_remove,
> +	.driver =3D {
> +		.name =3D NEOISP_NAME,
> +		.pm =3D &neoisp_pm,
> +		.of_match_table =3D neoisp_dt_ids,
> +	},
> +};

Should the .pm assignment be wrapped with pm_ptr()?

If CONFIG_PM is disabled, the unconditional reference to neoisp_pm will cau=
se
it and all its callbacks to be compiled into the kernel as dead code.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511132629.1300=
868-1-antoine.bouyer@nxp.com?part=3D6
