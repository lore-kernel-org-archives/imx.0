Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5223ACA7A;
	Fri, 12 Jun 2026 13:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781271721; cv=none; b=ZYgaTXDC28INf6rK90WWjQn/7P0BnHqJOHr4L0II99stGdShcIjrFSoizOyy46KW5Mn7EL/7me+WdOVgR8hwsx0ML97ckxJSSyGkYTkeunqp4QItEtxb9ye/zneAbgl3tW39y5NNH/mBK4itb4IfYkbT0bgypNO3apsWQIxQdh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781271721; c=relaxed/simple;
	bh=OmL+4tQmsYBu+O7bPCHc04GNp8e7tMfRd2uyM4og//s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lgehaGLq7nrIzAA7I82Ibv2cN2W/09qhGeM3IHwc3arQrro0sXBhkhKWIwTBEnmT3exCBUhOl5W4/kpvk1BYmUktgBRAFkxmP6x8hNTv5XXCG9ai5GMJ+BawCIjI4c/9l4WdiMHALC9Mv/GwRL0qKtD4jchQuRQTdet4PWBYzoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRW95JuS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRW95JuS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B906C1F000E9;
	Fri, 12 Jun 2026 13:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781271718;
	bh=+/qd9tr6MzoDUh99zVqYGeAiJYLC+iebqr/MWvk3Xiw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LRW95JuSbTzKYQ8tnGDf42PyjwvW6rpwpnm+jesxwCNCGluB5WBBrxYD8n39Jv+Du
	 jaxaNaGUngY+qLqqlbpwOE+ASHL1/8qhj8SOQ4hRyCUuUx6aa1+r4fkg0GZFWl6/It
	 5kyASsvL9qS9eN+aJZwWMc+djMPx76k4ukNOlk7B5aok5Ho7+os66tytBCB9fqZ2qY
	 Ix3XbbKbESaBF22jcUrxa6ByrVThp2YrRxC1KoPgy435Whh9bI2b5DdgW+fR8sxFsH
	 UOEye95LFkQKL6fER0KcmY0hJ9XiBAU3G5naWIb8P/4gUq14He6MnQmHdjuK0cR+IH
	 w6JUQBklkhojA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/8] media: platform: Add NXP Neoisp Image Signal
 Processor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antoine Bouyer" <antoine.bouyer@nxp.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260612132039.2089051-7-antoine.bouyer@nxp.com>
References: <20260612132039.2089051-7-antoine.bouyer@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 13:41:57 +0000
Message-Id: <20260612134157.B906C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 14 potential issue=
(s) to consider:
- [Critical] The driver validates ISP parameters directly in the user-mappe=
d shared memory buffer without a kernel copy, exposing a critical TOCTOU vu=
lnerability.
- [High] Using asynchronous `pm_runtime_put()` before `pm_runtime_disable()=
` leaves the hardware permanently powered on.
- [High] Using standard `memcpy` on MMIO mapped memory causes architectural=
 faults.
- [High] Missing NULL pointer checks for virtual addresses returned by vide=
obuf2.
- [High] Invalid V4L2 teardown order in `neoisp_destroy_devices()` causes U=
se-After-Free of `v4l2_dev`.
- [High] Missing `media_entity_cleanup()` for video nodes causes memory lea=
ks of media pads/links.
- [High] Unbounded wait for hardware completion in `neoisp_node_stop_stream=
ing()` deadlocks and leaks buffers.
- [High] The IRQ handler can fire after `neoisp_destroy_devices()` has free=
d DMA buffers, causing a Use-After-Free.
- [High] The driver exposes video devices to userspace before initializing =
`hw_lock` and the hardware.
- [High] `start_streaming` prepares only a single job, stranding any other =
initially queued buffers and stalling the pipeline.
- [High] `start_streaming` modifies the shared `neoispd->context` without l=
ocking, causing a data race with the active IRQ handler.
- [High] The IRQ handler accesses hardware registers without checking if th=
e device is active, violating runtime PM safety.
- [High] `VIDIOC_S_SELECTION` modifies `node->crop` locklessly while the IR=
Q handler reads it, causing address corruption.
- [High] `neoisp_core_media_register` lacks synchronization, allowing concu=
rrent calls to corrupt media graph initialization.
--

commit 0f5211be403174984a3657c54a249e9f22caa901
Author: Antoine Bouyer <antoine.bouyer@nxp.com>
Date:   Fri Jun 12 13:20:37 2026 +0000

    media: platform: Add NXP Neoisp Image Signal Processor

    This commit adds the first version of the NXP neoisp driver for process=
ing
    RAW images. It supports single context and multiple M2M operations,
    including generic v4l2-isp parameters and statistics.

> diff --git a/drivers/media/platform/nxp/neoisp/neoisp_ctx.c b/drivers/med=
ia/platform/nxp/neoisp/neoisp_ctx.c
> new file mode 100644
> index 0000000000000..9d13eb7b732d2
> --- /dev/null
> +++ b/drivers/media/platform/nxp/neoisp/neoisp_ctx.c

[ ... ]

> +static inline void
> +local_mem_blk_write(struct neoisp_dev_s *neoispd, enum isp_block_map_e m=
ap, void *src)
> +{
> +	u32 offset, count;
> +
> +	get_offsize(map, &offset, &count);
> +	memcpy(neoispd->local_mem + offset, src, count);
> +}
> +
> +static inline void
> +local_mem_blk_read(struct neoisp_dev_s *neoispd, enum isp_block_map_e ma=
p, void *dst)
> +{
> +	u32 offset, count;
> +
> +	get_offsize(map, &offset, &count);
> +	memcpy(dst, neoispd->local_mem + offset, count);
> +}

[Severity: High]
Does this usage of memcpy() on an MMIO region trigger architectural faults?

The neoispd->local_mem region is mapped via devm_ioremap_resource_wc(),
returning an I/O memory pointer. Using standard string routines like
memcpy() on MMIO violates kernel API rules and can cause unaligned access
faults on certain architectures.

[ ... ]

> +void neoisp_ctx_update_buf_addr(struct neoisp_dev_s *neoispd)
> +{
> +	struct neoisp_job_s *job =3D &neoispd->queued_job;
> +	struct neoisp_pipe_conf_s *cfg =3D &neoispd->context->hw.pipe_conf;
> +	struct neoisp_buffer_s *buf_inp0 =3D job->buf[NEOISP_INPUT0_NODE];
> +	struct neoisp_buffer_s *buf_inp1 =3D job->buf[NEOISP_INPUT1_NODE];
> +	struct neoisp_buffer_s *buf_out =3D job->buf[NEOISP_FRAME_NODE];
> +	struct neoisp_buffer_s *buf_ir =3D job->buf[NEOISP_IR_NODE];
> +	struct neoisp_node_s *nd;
> +	u32 ibpp, inp0_stride, inp1_stride;
> +	dma_addr_t inp0_addr, inp1_addr;
> +
> +	/* Input0 specific */
> +	nd =3D &neoispd->node[NEOISP_INPUT0_NODE];
> +	ibpp =3D (nd->neoisp_format->bit_depth + 7) / 8;
> +	inp0_stride =3D nd->format.fmt.pix_mp.plane_fmt[0].bytesperline;
> +
> +	/* Input0 - Take crop into account if any */
> +	inp0_addr =3D get_addr(buf_inp0, 0) + (nd->crop.left * ibpp) + (nd->cro=
p.top * inp0_stride);

[Severity: High]
Is there a data race on nd->crop here?

In neoisp_s_selection(), the node->crop values are updated without checking
vb2_is_busy() while only holding the queue_lock. The hardirq handler runs
this code to calculate the active DMA address without synchronization,
potentially resulting in an invalid address if crop coordinates change
during active streaming.

[ ... ]

> +void neoisp_ctx_update_w_user_params(struct neoisp_dev_s *neoispd)
> +{
> +	struct neoisp_buffer_s *buf =3D neoispd->queued_job.buf[NEOISP_PARAMS_N=
ODE];
> +	struct v4l2_isp_buffer *params;
> +	size_t block_offset =3D 0, max_offset;
> +
> +	if (IS_ERR_OR_NULL(buf))
> +		return;
> +
> +	params =3D (struct v4l2_isp_buffer *)get_vaddr(buf);
> +
> +	if (!params || params->data_size =3D=3D 0)
> +		/* No relevant parameters in this buffer */
> +		return;
> +
> +	max_offset =3D params->data_size;
> +
> +	/*
> +	 * Walk the list of parameter blocks and process them. No
> +	 * validation is done here, as the content of the parameters
> +	 * buffer is already checked when the buffer is queued.
> +	 */
> +	while (block_offset < max_offset) {
> +		const struct neoisp_block_handler_s *block_handler;
> +		const union neoisp_params_block_u *block;
> +
> +		block =3D (const union neoisp_params_block_u *)
> +			&params->data[block_offset];
> +		block_offset +=3D block->header.size;
> +
> +		block_handler =3D &neoisp_block_handlers[block->header.type];
> +		block_handler->handler(neoispd->context, block);
> +	}
> +}

[Severity: Critical]
Is this vulnerable to a TOCTOU (Time-Of-Check to Time-Of-Use) race?

The parameters are validated during QBUF but never copied into private
kernel memory. Here, in the hardware interrupt context, the driver
dereferences block->header.type directly from the user-mapped buffer to
index the neoisp_block_handlers array.=20

An attacker modifying the mapped buffer after validation could cause an
out-of-bounds access on the function pointer array and obtain arbitrary
code execution.

[ ... ]

> +void neoisp_ctx_upload_context(struct neoisp_dev_s *neoispd)
> +{
> +	struct neoisp_context_s *ctx =3D neoispd->context;
> +	u32 *src =3D (u32 *)&ctx->hw.pipe_conf.img_conf;
> +
> +	reg_blk_write(neoispd, NEO_PIPE_CONF_IMG_CONF_CAM0, src,
> +		      NEO_AUTOFOCUS_ROI0_SUM0_CAM0 - NEO_PIPE_CONF_IMG_CONF_CAM0);

[Severity: High]
Could this copy a partially updated context to the hardware?

This is executed in the hardirq handler, while neoisp_node_start_streaming()
modifies neoispd->context concurrently without holding hw_lock. If another
node is streaming, this could write torn configuration data to MMIO.

[ ... ]

> +void neoisp_ctx_get_stats(struct neoisp_dev_s *neoispd, struct neoisp_bu=
ffer_s *buf)
> +{
> +	struct neoisp_node_s *node =3D &neoispd->node[NEOISP_STATS_NODE];
> +	struct v4l2_isp_buffer *stats;
> +	u32 *blk_list, count;
> +
> +	/* Check if stats node link is enabled */
> +	if (!neoisp_node_link_is_enabled(node))
> +		return;
> +
> +	if (IS_ERR_OR_NULL(buf)) {
> +		dev_err(neoispd->dev, "Error: stats pointer\\n");
> +		return;
> +	}
> +
> +	stats =3D (struct v4l2_isp_buffer *)get_vaddr(buf);
> +	v4l2_isp_stats_init_buffer(stats, V4L2_ISP_VERSION_V1);

[Severity: High]
Can get_vaddr() return NULL here and cause an oops?

vb2_plane_vaddr() can return NULL if the memory isn't mapped, which gets
passed blindly to v4l2_isp_stats_init_buffer() resulting in a dereference
crash.

> diff --git a/drivers/media/platform/nxp/neoisp/neoisp_main.c b/drivers/me=
dia/platform/nxp/neoisp/neoisp_main.c
> new file mode 100644
> index 0000000000000..b08995403c597
> --- /dev/null
> +++ b/drivers/media/platform/nxp/neoisp/neoisp_main.c

[ ... ]

> +static int neoisp_params_node_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +	struct neoisp_node_s *node =3D vb2_get_drv_priv(vb->vb2_queue);
> +	struct neoisp_dev_s *neoispd =3D node->neoisp;
> +	struct v4l2_isp_params_buffer *params =3D vb2_plane_vaddr(&vbuf->vb2_bu=
f, 0);
> +	int ret;
> +
> +	ret =3D v4l2_isp_params_validate_buffer_size(neoispd->dev, vb,
> +						   node->format.fmt.meta.buffersize);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D v4l2_isp_params_validate_buffer(neoispd->dev, vb,
> +					      params, neoisp_params_block_types_info,
> +					      ARRAY_SIZE(neoisp_params_block_types_info));

[Severity: High]
Should we check if params is NULL before passing it to the validation?

vb2_plane_vaddr() can return NULL, and v4l2_isp_params_validate_buffer()
will crash if it tries to dereference a NULL pointer.

[ ... ]

> +static int neoisp_node_start_streaming(struct vb2_queue *q, u32 count)
> +{
> +	struct neoisp_node_s *node =3D vb2_get_drv_priv(q);
> +	struct neoisp_dev_s *neoispd =3D node->neoisp;
> +	struct neoisp_buffer_s *buf, *tmp;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(neoispd->dev);
> +	if (ret < 0)
> +		goto error;
> +
> +	ret =3D neoisp_prepare_node_streaming(node);
> +	if (ret < 0)
> +		goto error_streaming;
> +
> +	scoped_guard(spinlock_irq, &neoispd->hw_lock) {
> +		neoispd->streaming_map |=3D BIT(node->id);
> +		neoispd->frame_sequence =3D 0;
> +	}
> +
> +	dev_dbg(neoispd->dev, "%s: for node %s (count %u)\\n",
> +		__func__, NODE_NAME(node), count);
> +	dev_dbg(neoispd->dev, "Nodes streaming now 0x%x\\n",
> +		neoispd->streaming_map);
> +
> +	/* Update queued job context with current driver configuration */
> +	neoisp_ctx_update_packetizer(neoispd);
> +	neoisp_ctx_update_pipe_conf(neoispd);

[Severity: High]
Could neoispd->context be corrupted here?

Updating the context configuration is performed here without locking, which
can race with the hardware interrupt if the device is already streaming on
another node.

> +
> +	/* Maybe we're ready to run. */
> +	if (!neoisp_prepare_job(neoispd))
> +		neoisp_schedule(neoispd, false);

[Severity: High]
Is a single neoisp_prepare_job() call sufficient here?

If userspace has queued multiple buffers before starting the stream,
preparing only one job leaves the rest stranded in the ready_queue, which
stalls the processing pipeline.

[ ... ]

> +static void neoisp_node_stop_streaming(struct vb2_queue *q)
> +{
> +	struct neoisp_node_s *node =3D vb2_get_drv_priv(q);
> +	struct neoisp_dev_s *neoispd =3D node->neoisp;
> +	struct neoisp_job_desc_s *job, *temp;
> +	struct neoisp_buffer_s *buf;
> +	LIST_HEAD(tmp_list);
> +
> +	/*
> +	 * Now this is a bit awkward. In a simple M2M device we could just wait
> +	 * for all queued jobs to complete, but here there's a risk that a
> +	 * partial set of buffers was queued and cannot be run. For now, just
> +	 * cancel all buffers stuck in the "ready queue", then wait for any
> +	 * running job.
> +	 *
> +	 * This may return buffers out of order.
> +	 */
> +	dev_dbg(neoispd->dev, "%s: for node %s\\n", __func__, NODE_NAME(node));
> +	do {
> +		buf =3D list_first_entry_or_null(&node->ready_queue,
> +					       struct neoisp_buffer_s,
> +					       ready_list);
> +		if (buf) {
> +			list_del(&buf->ready_list);
> +			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +		}
> +	} while (buf);
> +
> +	vb2_wait_for_all_buffers(&node->queue);

[Severity: High]
Can this lead to a permanent deadlock?

If the hardware has stalled or an interrupt is missed,
vb2_wait_for_all_buffers() will block indefinitely because the hardware is
never forcibly stopped.

> +
> +	if (node->id =3D=3D NEOISP_INPUT0_NODE)
> +		neoisp_set_default_context(neoispd);
> +
> +	spin_lock_irq(&neoispd->hw_lock);
> +	neoispd->streaming_map &=3D ~BIT(node->id);
> +
> +	if (neoispd->streaming_map =3D=3D 0) {
> +		/*
> +		 * If all nodes have stopped streaming release all jobs
> +		 * without holding the lock.
> +		 */
> +		list_splice_init(&neoispd->job_queue, &tmp_list);
> +	}
> +	spin_unlock_irq(&neoispd->hw_lock);
> +
> +	list_for_each_entry_safe(job, temp, &tmp_list, queue) {
> +		list_del(&job->queue);
> +		kfree(job);
> +	}

[Severity: High]
Do these freed jobs leak their associated buffers?

Any buffers tracked inside the discarded job->buffers arrays are not
returned to vb2, resulting in a permanent buffer leak.

[ ... ]

> +static irqreturn_t neoisp_irq_handler(int irq, void *dev_id)
> +{
> +	struct neoisp_dev_s *neoispd =3D (struct neoisp_dev_s *)dev_id;
> +	struct neoisp_buffer_s **buf =3D neoispd->queued_job.buf;
> +	u64 ts =3D ktime_get_ns();
> +	u32 irq_status =3D 0;
> +	u32 irq_clear =3D 0;
> +	bool done =3D false;
> +	int i;
> +
> +	irq_status =3D neoisp_rd(neoispd, NEO_PIPE_CONF_INT_STAT0);

[Severity: High]
Does this access the hardware without ensuring it is powered?

The device supports runtime PM, but the IRQ handler does not call
pm_runtime_get_if_active() before accessing NEO_PIPE_CONF_INT_STAT0. A
spurious or shared interrupt while the device is suspended could trigger a
fatal bus error.

[ ... ]

> +static void neoisp_destroy_devices(struct neoisp_dev_s *neoispd)
> +{
> +	int i;
> +
> +	if (neoispd->context) {
> +		dma_free_coherent(neoispd->dev,
> +				  sizeof(struct neoisp_context_s),
> +				  neoispd->context,
> +				  neoispd->params_dma_addr);
> +	}
> +
> +	v4l2_device_unregister(&neoispd->v4l2_dev);
> +
> +	if (standalone_mdev)
> +		media_device_unregister(&neoispd->mdev);
> +	else if (!neoispd->media_registered)
> +		return;
> +
> +	dev_dbg(neoispd->dev, "Unregister from media controller\\n");
> +
> +	v4l2_ctrl_handler_free(&neoispd->hdl);
> +	media_entity_cleanup(&neoispd->sd.entity);
> +
> +	for (i =3D NEOISP_NODES_COUNT - 1; i >=3D 0; i--) {
> +		struct neoisp_node_s *node =3D &neoispd->node[i];
> +
> +		video_unregister_device(&node->vfd);
> +		vb2_queue_release(&node->queue);
> +	}

[Severity: High]
Is the v4l2 unregistration sequence safe?

v4l2_device_unregister() is called before the video devices are unregistered
with video_unregister_device(). The V4L2 core requires video nodes to be
unregistered first to prevent Use-After-Free bugs if userspace is still
interacting with an open node.

[Severity: High]
Are we leaking the media pads allocated for the video nodes?

The video nodes had their pads dynamically initialized via
media_entity_pads_init() during setup, but media_entity_cleanup() is never
called for node->vfd.entity before releasing them.

[ ... ]

> +int neoisp_core_media_register(struct device *dev, struct v4l2_subdev *s=
d)
> +{
> +	struct neoisp_dev_s *neoispd =3D dev_get_drvdata(dev);
> +	struct media_device *mdev =3D sd->v4l2_dev->mdev;
> +	int ret;
> +
> +	if (!neoispd)
> +		return -EINVAL;
> +
> +	if (neoispd->media_registered || standalone_mdev)
> +		return 0;
> +
> +	ret =3D neoisp_init_group(neoispd, mdev);
> +	if (ret)
> +		return ret;
> +
> +	neoispd->media_registered++;
> +	return 0;
> +}

[Severity: High]
Is neoispd->media_registered protected from concurrent accesses?

This exported function can be called asynchronously. Without locking, two
callers can bypass the check concurrently, causing double-initialization of
the video nodes and a corrupted media device graph.

[ ... ]

> +static int neoisp_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct neoisp_dev_s *neoispd;
> +	struct resource *r;
> +	int ret, irq;

[ ... ]

> +	ret =3D neoisp_init_devices(neoispd);
> +	if (ret)
> +		goto err_pm_runtime_suspend;
> +
> +	spin_lock_init(&neoispd->hw_lock);
> +	neoisp_init_hw(neoispd);
> +	neoisp_set_default_context(neoispd);

[Severity: High]
Does this order expose uninitialized locks to userspace?

neoisp_init_devices() registers the /dev/videoX nodes. If userspace
immediately opens a node and starts streaming, it could hit an uninitialized
hw_lock or interact with unconfigured hardware before neoisp_init_hw()
runs.

[ ... ]

> +err_pm_runtime_suspend:
> +	pm_runtime_put(dev);
> +err_pm_runtime_disable:
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_disable(dev);
> +err_irq:
> +	dev_err(dev, "probe: error %d\\n", ret);
> +	return ret;
> +}

[Severity: High]
Does this sequence properly handle the asynchronous pm_runtime_put()?

Calling pm_runtime_disable() immediately after the asynchronous
pm_runtime_put() will cancel the pending suspend, permanently stranding the
hardware in a powered-on state. A synchronous put should be used before
disabling.

> +static void neoisp_remove(struct platform_device *pdev)
> +{
> +	struct neoisp_dev_s *neoispd =3D platform_get_drvdata(pdev);
> +
> +	neoisp_destroy_devices(neoispd);
> +
> +	if (standalone_mdev)
> +		media_device_cleanup(&neoispd->mdev);
> +
> +	pm_runtime_dont_use_autosuspend(neoispd->dev);
> +	pm_runtime_disable(neoispd->dev);
> +}

[Severity: High]
Could the hardware IRQ fire after structures are freed?

The IRQ handler is managed by devm_request_irq() and will remain active
until the devm teardown phase. However, neoisp_destroy_devices() frees
neoispd->context. A late or spurious interrupt could trigger a
use-after-free in the handler. Should the hardware interrupts be explicitly
disabled here?

[Severity: High]
Should we use a synchronous PM put here?

Similar to the probe error path, failing to transition the device to suspend
before calling pm_runtime_disable() can leave the hardware permanently
powered on.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612132039.2089=
051-1-antoine.bouyer@nxp.com?part=3D6
