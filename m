Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080746;
	b=o21XXPxluPv2QNjkira/8M4Q9EHzWv3/qS7dszWDZOCdiXmCZcmcRL5K0RQuRqbVX2oa
	 XFFd7CZxEcA8/qMvilA5KY/kc8fBDTruLXHbQqmEg296MtEd1Xp5yVmB7aWQniQV6HX6t
	 xERkR3nBt3RRSNY019CEaihTk37k/bUj7/uzFw7uutITGCpI2qzdtqF3ZLMaQwmlvlY97
	 pIBznspF04C/qJWF5w1kJ62iX3Ukkvb5SGzXQR3fP4xoCkt/EeX3BANtu0JFzuoj56n82
	 nQNze0ohKRkRv/aBzpkj0vjI/2qL6U2WOrSQobTrz7uU4ptjwW8qQws5r93pPbEPAxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080746;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Cb/rdS3dUQAnUffSKLin/7OD+BSanQxlhIVsgC5f/r0=;
	b=4kQREUDWcxCz+Z74KNJ7QRxh1zdwR94H/Hf1RT+qOyTg73KiaZ5SZ67K+31RDFTLlO4e
	 KlXbLYLOcjdR68c96IOGCoHuGxm6XQ9RR1f85D+Y8cIR/4Sy9LSB5lmtMEgIzSLpT3hxt
	 /XoFHbaz1hqnWrXPbBOVGNwwNKqTK+5QzfEwsVAHpzV4Xj60NfjagTYTad37j52nRexx/
	 XopY3r1I62DB46jAZQDUK/u8etmSBtPQAwrrl3WBfA4VQ9dzwymYqZ7fwBC20bgeJu40w
	 5Is5fZvBPyA3oJWwRohEYWz4zoC/3Wc7bxBHbAEr5BXtvX4r6ii5aPnBV+UqSiJ4/MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TxDwGX1z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346EB606A320;
	Thu, 19 Nov 2026 09:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TxDwGX1z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6272B1F000C4;
	Thu, 19 Nov 2026 09:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795080745;
	bh=Cb/rdS3dUQAnUffSKLin/7OD+BSanQxlhIVsgC5f/r0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TxDwGX1z+1+iJ+B3Hq3hfQfoH5nsnDnlu5DVhnw/OV6TtRaFCjtg75WH1lOgVVvm7
	 4sp4FLupV9rrG6zpN24m28GRAzdsbVxDxdNuO3fx8+HJfeA17n7ZEeS6ZZGrFBdpgX
	 TqB5RqZ6xI3YVm03CYyzCwY7HMnQzXM+gHsIDaYxSGGmzy/FDw0NZJKuTzoVO40+Pf
	 xOIepQ16Y+k5+3wBbV+od7jIjaDWDi23752yHmC17aDvrdiOC0oVy1rkRhAWlDs75V
	 7rKTP5c4pbj84KMxwJnCQy75i2PBZdSbvPXFkoihvFpRMSKJlXnz4b8drD+fv2Opbs
	 edc7sjgM4oqrA==
Message-ID: <sashiko-outbox-222843@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 03/11] media: chips-media: wave6: Add Wave6 core
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nas Chung" <nas.chung@chipsnmedia.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <1030b93108a94a28b572a97695f3b5bfc75e0ac9.1795075580.git.nas.chung@chipsnmedia.com>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <1030b93108a94a28b572a97695f3b5bfc75e0ac9.1795075580.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 09:32:23 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential
issues to consider:
- [High] media: wave6: data race in wave6_vpu_require_work_buffer()
  across cores
- [High] media: wave6: dropped interrupts in wave6_vpu_core_irq() and
  irq_thread
- [High] media: wave6: unlocked rdy_queue traversal in
  wave6_vpu_check_fb_available()
- [Medium] media: wave6: skipped VPU init and active_count race in
  runtime_resume
- [Medium] media: wave6: race and missing error state in
  wave6_vpu_device_run_timeout()
- [Medium] media: wave6: stale codec sizeimage in wave6_update_pix_fmt()
- [Medium] media: wave6: vpu->lock inversion and clock leak on core
  removal
--

commit 203cdebd14b0043756ee7b19b462b06f101581ec
Author: Nas Chung <nas.chung@chipsnmedia.com>

media: chips-media: wave6: Add Wave6 core driver

This commit adds the core platform driver for the Chips&Media Wave6 video
codec IP to manage the per-core interface register regions, interrupts,
runtime PM, and V4L2 mem2mem helpers.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c b/=
drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
> new file mode 100644
> index 0000000000000..67c6666579d92
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
> @@ -0,0 +1,392 @@
[ ... ]
> +static irqreturn_t wave6_vpu_core_irq(int irq, void *dev_id)
> +{
> +	struct vpu_core_device *core =3D dev_id;
> +	struct vpu_irq irq_info;
> +
> +	if (!vpu_read_reg(core, W6_VPU_VPU_INT_STS))
> +		return IRQ_NONE;
> +
> +	irq_info.status =3D vpu_read_reg(core, W6_VPU_VINT_REASON);
> +	irq_info.inst_idc =3D vpu_read_reg(core, W6_RET_INT_INSTANCE_INFO);
> +
> +	vpu_write_reg(core, W6_RET_INT_INSTANCE_INFO, INT_INSTANCE_INFO_CLEAR);
> +	vpu_write_reg(core, W6_VPU_VINT_REASON_CLEAR, irq_info.status);
> +	vpu_write_reg(core, W6_VPU_VINT_CLEAR, VINT_CLEAR);
> +
> +	if (irq_info.status & BIT(W6_INT_BIT_REQ_WORK_BUF)) {
> +		wave6_vpu_require_work_buffer(core->vpu, core->reg_base);
> +
> +		return IRQ_HANDLED;
> +	}

[Severity: High]
Can concurrent W6_INT_BIT_REQ_WORK_BUF interrupts on different cores race
on core->vpu->work_buffers_avail in wave6_vpu_require_work_buffer()?

Each core has its own interrupt line, but all cores share the parent
core->vpu:

drivers/media/platform/chips-media/wave6/wave6-vpu.c:wave6_vpu_require_work=
_buffer() {
	...
	if (WARN_ON(vpu->work_buffers_avail =3D=3D 0))
		goto exit;

	vpu->work_buffers_avail--;
	vb =3D &vpu->work_buffers[vpu->work_buffers_avail];
	...
}

CPU0 (core 0 hardirq)             CPU1 (core 1 hardirq)
wave6_vpu_core_irq()              wave6_vpu_core_irq()
  wave6_vpu_require_work_buffer()   wave6_vpu_require_work_buffer()
    work_buffers_avail =3D=3D 1           work_buffers_avail =3D=3D 1
    vpu->work_buffers_avail-- (0)
                                      vpu->work_buffers_avail-- (U32_MAX)
                                      &vpu->work_buffers[U32_MAX]  <-- OOB =
read

Even when work_buffers_avail > 1, two cores can read the same decremented
index and assign the same DMA work buffer to two codec instances.

[ ... ]

> +static struct vpu_instance *wave6_vpu_core_get_instance(struct vpu_core_=
device *core,
> +							u32 inst_idc)
> +{
> +	struct vpu_instance *inst;
> +
> +	guard(spinlock)(&core->inst_lock);
> +
> +	list_for_each_entry(inst, &core->instances, list) {
> +		if ((BIT(inst->id) & inst_idc) && inst->enable)
> +			return inst;
> +	}
> +
> +	return NULL;
> +}
[ ... ]
> +static irqreturn_t wave6_vpu_core_irq_thread(int irq, void *dev_id)
> +{
> +	struct vpu_core_device *core =3D dev_id;
> +	struct vpu_instance *inst;
> +	struct vpu_irq irq_info;
> +
> +	while (kfifo_len(&core->irq_fifo)) {
> +		bool error =3D false;
> +
> +		if (!kfifo_out(&core->irq_fifo, &irq_info, sizeof(struct vpu_irq)))
> +			break;
> +
> +		inst =3D wave6_vpu_core_get_instance(core, irq_info.inst_idc);
> +		if (!inst)
> +			continue;
> +
> +		if (irq_info.status & BIT(W6_INT_BIT_INIT_SEQ)) {
> +			complete(&inst->irq_done);
> +			continue;
> +		}
> +
> +		if (irq_info.status & BIT(W6_INT_BIT_BSBUF_ERROR))
> +			error =3D true;
> +
> +		if (inst->ops && inst->ops->finish_process)
> +			inst->ops->finish_process(inst, error);
> +	}
> +
> +	return IRQ_HANDLED;
> +}

[Severity: High]
Can wave6_vpu_core_irq() and wave6_vpu_core_irq_thread() drop pending
interrupts when multiple status or instance bits are set at once?

In wave6_vpu_core_irq(), W6_RET_INT_INSTANCE_INFO and
W6_VPU_VINT_REASON_CLEAR are cleared for the entire irq_info.status mask
before the BIT(W6_INT_BIT_REQ_WORK_BUF) check.  If W6_INT_BIT_REQ_WORK_BUF
is set alongside another bit such as W6_INT_BIT_DEC_PIC or
W6_INT_BIT_INIT_SEQ, returning IRQ_HANDLED early without queuing the
remaining bits to core->irq_fifo loses that completion interrupt.

In addition, irq_info.inst_idc is a bitmask of instance IDs, and
W6_RET_INT_INSTANCE_INFO has already been cleared to 0 in the hardirq
handler.  Because wave6_vpu_core_irq_thread() calls
wave6_vpu_core_get_instance() only once per FIFO entry and returns the
first matching instance, any other instances with bits set in
irq_info.inst_idc never receive their completion callback and will time
out.

[ ... ]

> +void wave6_vpu_core_activate(struct vpu_core_device *core)
> +{
> +	atomic_inc(&core->active_count);
> +}
> +
> +void wave6_vpu_core_deactivate(struct vpu_core_device *core)
> +{
> +	atomic_dec(&core->active_count);
> +}
> +
> +static int wave6_vpu_core_wait_activated(struct vpu_core_device *core)
> +{
> +	if (!atomic_read(&core->active_count))
> +		return 0;
> +
> +	return wave6_vpu_core_check_state(core);
> +}
[ ... ]
> +	ret =3D devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_core_runtime_suspend(struct device *dev)
> +{
> +	struct vpu_core_device *core =3D dev_get_drvdata(dev);
> +
> +	if (WARN_ON(!core))
> +		return -ENODEV;
> +
> +	if (core->vpu_held) {
> +		wave6_vpu_put(core->vpu, core->reg_base);
> +		core->vpu_held =3D false;
> +	}
> +
> +	clk_bulk_disable_unprepare(core->num_clks, core->clks);
> +
> +	return 0;
> +}

[Severity: Medium]
Can unregistering child core devices under vpu->lock in
wave6_vpu_release() deadlock with wave6_vpu_core_runtime_suspend() or leak
prepared clocks on teardown?

drivers/media/platform/chips-media/wave6/wave6-vpu.c:wave6_vpu_release() {
	guard(mutex)(&vpu->lock);

	wave6_vpu_destroy_cores(vpu);
	...
}

wave6_vpu_destroy_cores() calls platform_device_unregister() while holding
vpu->lock, which waits for child runtime PM transitions and barriers,
whereas wave6_vpu_core_runtime_suspend() and
wave6_vpu_core_runtime_resume() call wave6_vpu_put() and wave6_vpu_get(),
which acquire vpu->lock:

CPU0                              CPU1
----                              ----
lock(&vpu->lock)
                                  /* runtime PM transition on core */
/* waits for core runtime PM */
                                  lock(&vpu->lock)

 *** DEADLOCK ***

CPU0: wave6_vpu_release() -> wave6_vpu_destroy_cores() -> platform_device_u=
nregister()
CPU1: rpm_suspend() -> wave6_vpu_core_runtime_suspend() -> wave6_vpu_put()

Furthermore, wave6_vpu_core_driver has no remove callback or devm action
to suspend a runtime-active core before devm_clk_bulk_get_all() releases
core->clks.  If a core is runtime-active at unbind (for example via sysfs
power/control set to "on"), core->clks are never disabled or unprepared
and any held core->vpu_held reference is leaked.

> +
> +static int wave6_vpu_core_runtime_resume(struct device *dev)
> +{
> +	struct vpu_core_device *core =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (WARN_ON(!core))
> +		return -ENODEV;
> +
> +	ret =3D clk_bulk_prepare_enable(core->num_clks, core->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (atomic_read(&core->active_count)) {
> +		ret =3D wave6_vpu_get(core->vpu, core->reg_base);
> +		if (ret)
> +			goto error_get_vpu;
> +
> +		core->vpu_held =3D true;
> +	}
> +
> +	ret =3D wave6_vpu_core_wait_activated(core);
> +	if (ret)
> +		goto error_activate;

[Severity: Medium]
What happens if wave6_vpu_core_runtime_resume() runs while
core->active_count is 0?

If the core device is runtime-resumed before wave6_vpu_core_activate() is
called (for instance when runtime PM is forced on via sysfs
power/control), wave6_vpu_core_runtime_resume() skips both wave6_vpu_get()
and wave6_vpu_core_check_state(), leaving core->vpu_held false.  When an
instance later calls wave6_vpu_core_activate() followed by
pm_runtime_resume_and_get(), runtime PM sees the device is already
RPM_ACTIVE and returns 0 without running wave6_vpu_core_runtime_resume(),
so the parent VPU is never powered on or initialized and core interrupts
are never enabled.

Also, because wave6_vpu_core_runtime_resume() and
wave6_vpu_core_wait_activated() read core->active_count twice without
synchronization (rather than checking core->vpu_held in
wave6_vpu_core_wait_activated()), an intervening wave6_vpu_core_activate()
can cause wave6_vpu_core_check_state() to poll VPU registers when
wave6_vpu_get() was skipped.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c b/=
drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
> new file mode 100644
> index 0000000000000..75371566de385
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
> @@ -0,0 +1,384 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +/*
> + * Wave6 series multi-standard codec IP - v4l2 driver helper interface
> + *
> + * Copyright (C) 2026 CHIPS&MEDIA INC
> + */
> +
> +#include "wave6-vpu.h"
> +#include "wave6-vpu-core.h"
> +
> +void wave6_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
> +			  unsigned int width,
> +			  unsigned int height)
> +{
> +	const struct v4l2_format_info *fmt_info;
> +	unsigned int stride_y;
> +
> +	pix_mp->width =3D width;
> +	pix_mp->height =3D height;
> +	pix_mp->flags =3D 0;
> +	pix_mp->field =3D V4L2_FIELD_NONE;
> +	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
> +
> +	fmt_info =3D v4l2_format_info(pix_mp->pixelformat);
> +	if (!fmt_info) {
> +		pix_mp->plane_fmt[0].bytesperline =3D 0;
> +		if (!pix_mp->plane_fmt[0].sizeimage)
> +			pix_mp->plane_fmt[0].sizeimage =3D width * height;
> +
> +		return;
> +	}

[Severity: Medium]
Does preserving a non-zero pix_mp->plane_fmt[0].sizeimage for compressed
formats leave sizeimage stale when the resolution is increased?

For codec formats (where v4l2_format_info() returns NULL), if
pix_mp->plane_fmt[0].sizeimage was already initialized to a default
resolution's size (or populated by VIDIOC_G_FMT) and wave6_update_pix_fmt()
is then called for a larger resolution without zeroing sizeimage first,
plane_fmt[0].sizeimage remains clamped to the old smaller resolution's
buffer size.

[ ... ]

> +static bool wave6_vpu_check_fb_available(struct vpu_instance *inst)
> +{
> +	struct vb2_v4l2_buffer *vb2_v4l2_buf;
> +	struct v4l2_m2m_buffer *v4l2_m2m_buf;
> +	struct vpu_buffer *vpu_buf;
> +
> +	v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
> +		vb2_v4l2_buf =3D &v4l2_m2m_buf->vb;
> +		vpu_buf =3D wave6_to_vpu_buf(vb2_v4l2_buf);
> +
> +		if (!vpu_buf->used)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static int wave6_vpu_job_ready(void *priv)
> +{
> +	struct vpu_instance *inst =3D priv;
> +
> +	dev_dbg(inst->dev->dev, "[%d]%s: state %d\n",
> +		inst->id, __func__, inst->state);
> +
> +	if (inst->state =3D=3D VPU_INST_STATE_OPEN)
> +		return 1;
> +	if (inst->state < VPU_INST_STATE_PIC_RUN)
> +		return 0;
> +	if (inst->state =3D=3D VPU_INST_STATE_ERROR)
> +		return 0;
> +	if (!wave6_vpu_check_fb_available(inst))
> +		return 0;
> +
> +	return 1;
> +}

[Severity: High]
Isn't m2m_ctx->cap_q_ctx.rdy_queue traversed without holding
cap_q_ctx.rdy_spinlock or core->dev_lock when wave6_vpu_check_fb_available()
is called from wave6_vpu_finish_job()?

v4l2_m2m_for_each_dst_buf() expands to list_for_each_entry() over
m2m_ctx->cap_q_ctx.rdy_queue without taking cap_q_ctx.rdy_spinlock.  When
wave6_vpu_finish_job() runs from wave6_vpu_core_irq_thread(), core->dev_lock
is not held, and v4l2_m2m_job_finish() only takes m2m_dev->job_spinlock
before calling wave6_vpu_job_ready().  Meanwhile, VIDIOC_QBUF on another
CPU holds core->dev_lock and cap_q_ctx.rdy_spinlock while mutating
cap_q_ctx.rdy_queue in v4l2_m2m_buf_queue():

CPU0 (irq thread)                 CPU1 (VIDIOC_QBUF)
wave6_vpu_finish_job()            v4l2_m2m_qbuf()
  v4l2_m2m_job_finish()             v4l2_m2m_buf_queue()
    lock(&m2m_dev->job_spinlock)      lock(&cap_q_ctx.rdy_spinlock)
    wave6_vpu_job_ready()             list_add_tail(..., &rdy_queue)
      wave6_vpu_check_fb_available()
        v4l2_m2m_for_each_dst_buf()  <-- concurrent list traversal/mutation

> +
> +void wave6_vpu_device_run_timeout(struct work_struct *work)
> +{
> +	struct vpu_instance *inst =3D container_of(to_delayed_work(work),
> +						 struct vpu_instance, task_timer);
> +	struct vb2_v4l2_buffer *src_buf =3D NULL;
> +	struct vb2_v4l2_buffer *dst_buf =3D NULL;
> +
> +	dev_err(inst->dev->dev, "[%d] sequence %d timeout\n", inst->id, inst->s=
equence);
> +	src_buf =3D v4l2_m2m_src_buf_remove(inst->v4l2_fh.m2m_ctx);
> +	if (src_buf) {
> +		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
> +		if (inst->type =3D=3D VPU_INST_TYPE_DEC)
> +			inst->processed_buf_num++;
> +		inst->error_buf_num++;
> +	}
> +
> +	dst_buf =3D v4l2_m2m_dst_buf_remove(inst->v4l2_fh.m2m_ctx);
> +	if (dst_buf)
> +		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
> +
> +	vb2_queue_error(v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx));
> +	vb2_queue_error(v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx));
> +
> +	v4l2_m2m_job_finish(inst->dev->m2m_dev, inst->v4l2_fh.m2m_ctx);
> +}
> +
> +static void wave6_vpu_device_run(void *priv)
> +{
> +	struct vpu_instance *inst =3D priv;
> +	int ret;
> +
> +	dev_dbg(inst->dev->dev, "[%d]%s: state %d\n",
> +		inst->id, __func__, inst->state);
> +
> +	ret =3D inst->ops->prepare_process(inst);
> +	if (ret) {
> +		v4l2_m2m_job_finish(inst->dev->m2m_dev, inst->v4l2_fh.m2m_ctx);
> +		return;
> +	}
> +
> +	schedule_delayed_work(&inst->task_timer, msecs_to_jiffies(W6_VPU_TIMEOU=
T));
> +
> +	ret =3D inst->ops->start_process(inst);
> +	if (ret)
> +		wave6_vpu_finish_job(inst);
> +}
> +
> +void wave6_vpu_finish_job(struct vpu_instance *inst)
> +{
> +	cancel_delayed_work(&inst->task_timer);
> +	v4l2_m2m_job_finish(inst->dev->m2m_dev, inst->v4l2_fh.m2m_ctx);
> +}

[Severity: Medium]
Can wave6_vpu_device_run_timeout() race with normal job completion in
finish_process() and wave6_vpu_finish_job()?

wave6_vpu_finish_job() uses non-synchronous cancel_delayed_work() and does
not check its return value.  If wave6_vpu_device_run_timeout() has already
started running when finish_process() executes on the IRQ thread, nothing
serializes them:

CPU0 (kworker)                    CPU1 (irq thread)
wave6_vpu_device_run_timeout()    wave6_vpu_core_irq_thread()
                                    inst->ops->finish_process()
  v4l2_m2m_src_buf_remove()           ...
  inst->error_buf_num++               wave6_vpu_finish_job()
                                        cancel_delayed_work() -> false
                                        v4l2_m2m_job_finish()
  v4l2_m2m_job_finish()  <-- double v4l2_m2m_job_finish()

Both contexts concurrently remove buffers, update inst->processed_buf_num
and inst->error_buf_num, and call v4l2_m2m_job_finish().

In addition, wave6_vpu_device_run_timeout() does not transition
inst->state to VPU_INST_STATE_ERROR before calling v4l2_m2m_job_finish().
Because v4l2_m2m_job_finish() immediately checks wave6_vpu_job_ready() to
schedule the next queued job, and neither __v4l2_m2m_try_queue() nor
wave6_vpu_job_ready() checks vq->error, another queued job will be started
on the timed-out instance.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795075577.gi=
t.nas.chung@chipsnmedia.com?part=3D3
