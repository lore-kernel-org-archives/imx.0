Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081037;
	b=H5MhF5R6nzP31XMwhLCSoN2huKFg5sRGN2GWoL2pcbbb6Y4kAU6prvw84OeKpQ341NbU
	 cK0f3IGpJPwoZL7KacvOsnTbQF864JutnhGUEINFKoX/2X61dZxJ5XzbnYFBKz7idps2j
	 dgg2M09z3Lecn6/fXXYyHNW8adbzx1/uQ/GwyoVniJBZgQQR1r0otyUY9D7mVbzDo/hwC
	 xHoEYRIQmABw/4ecbtwN731sI+gC4aIeGQrDC256kGThofCvl0EwIp0CY1R+AOpGq/JSc
	 WtMI43DBxCXhwRJUDw0xMJI/XtFjjBZxUHI3HZkPD+d8+sNxmED9g6LBUVrAbdScIIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081037;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dnAsKJq1mlLVGSNMSxe4+QWMWmab6TI+rB6dU+cUTd8=;
	b=fVzQyILESwqUauMeIQLzHH9BhmszrD5ya7b9gqlYs8oQaOv2KkSmmVaBbZ9knAjpwgLN
	 H6kqr3mzn4M78sPk5wX0032edRhxtkNQUOSQDVmxJBDggADNZVCzbvKLofM5+eephC9xE
	 yeEwDD2rW8Fsu/AmzYwjhgUS0gRbUjinRAV7ItTSqwG6CV3N3VB13gUnD83Cl2jTyxjHK
	 Ru07wGtkZ4xgrPx6xZaxJtjgRPqQvrvvYV9S7n08AwIBXV/tPmiEaSnJAdJZ6Wb6b1Lrr
	 ilB08gyHx7wKDDSiIOChnDmcOSgakRjeQP2YkSURkKcNt0RNuYQb0iURoKKBfID9iqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="CEL7QCe/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06FD606A33E;
	Thu, 19 Nov 2026 09:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CEL7QCe/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0822C1F000C4;
	Thu, 19 Nov 2026 09:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795081036;
	bh=dnAsKJq1mlLVGSNMSxe4+QWMWmab6TI+rB6dU+cUTd8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CEL7QCe/uxz8CLskxVoIFRreoDwwI07Jo9ZLiXKr3/BiQv9VDXztH4AU/X1MDqQqS
	 ssQgNJQnZwKZRWifaWNGEI7GMevsv49qm8a1jLRo66qeM+p1i9lnR3P+hZ/2mDLzrk
	 xDP9bNHvE5jiT3PNomD1dLUBnJz/YnfHATk95sGfcvOanBLM3adwsWjopWnD+QkfeJ
	 UNkFe5ZqRuNLJPeEzIAvuDPqqsK0ngkrv4ldl4tG21RNpo9SM9OZPffnuCa4dlI+VI
	 /7mx2xP7Xm0N3OQYRcTjqmaZOgf1g+9t5WK0+vzTC55wjRKG9mHxoVRpKf776+W4lQ
	 xZpxNGwGd8Gpg==
Message-ID: <sashiko-outbox-222861@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 11/11] arm64: dts: freescale: imx95: Add video codec
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nas Chung" <nas.chung@chipsnmedia.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <e89f330486c8b986088278b563d0c4364d35f19b.1795075582.git.nas.chung@chipsnmedia.com>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <e89f330486c8b986088278b563d0c4364d35f19b.1795075582.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 09:37:15 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 8 potential
issues to consider:
- [High] media: chips-media: wave6: UAF of m2m_ctx during release and
  job finish
- [High] media: chips-media: wave6: unlocked work_buffers_avail access
  in hard IRQ
- [High] media: chips-media: wave6: asymmetric encoder instance
  streaming lifecycle
- [High] media: chips-media: wave6: infinite job loop on
  wave6_vpu_dec_seek_header()
- [Medium] media: chips-media: wave6: PM domains detached before devm
  cooling teardown
- [Medium] media: chips-media: wave6: stale fbc_buf_registered after
  destroy_instance
- [Medium] media: chips-media: wave6: wave6_vpu_get() skipped if core
  already active
- [Low] media: chips-media: wave6: debugfs dir leaked in
  wave6_vpu_core_probe()
--

commit aa070a21021b515d839ff256d8cb72ca0721cb00
Author: Nas Chung <nas.chung@chipsnmedia.com>

arm64: dts: freescale: imx95: Add video codec node

This commit adds the Chips&Media Wave633 video codec node to the i.MX95
SoC device tree and enables it with a reserved boot memory region on the
i.MX95 19x19 EVK board.

> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/d=
ts/freescale/imx95.dtsi
> index d20c2498b9aa2..b6323e527ab78 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -2139,6 +2139,43 @@ vpu_blk_ctrl: clock-controller@4c410000 {
>  			assigned-clock-rates =3D <133333333>, <667000000>, <500000000>;
>  		};
> =20
> +		vpu: video-codec@4c4c0000 {
> +			compatible =3D "nxp,imx95-vpu";
> +			reg =3D <0x0 0x4c4c0000 0x0 0x10000>;
> +			clocks =3D <&scmi_clk IMX95_CLK_VPU>,
> +				 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
> +			clock-names =3D "core", "vpublk";
> +			power-domains =3D <&scmi_devpd IMX95_PD_VPU>,
> +					<&scmi_perf IMX95_PERF_VPU>;
> +			power-domain-names =3D "vpu", "perf";
> +			sram =3D <&sram1>;
> +			#cooling-cells =3D <2>;

[Severity: Medium]
With both "vpu" and "perf" power domains and cooling cells enabled here,
can wave6_vpu_remove() (or probe error unwind in wave6_vpu_probe()) cause a
use-after-free of vpu->thermal.dev in the wave6 driver introduced earlier
in this series (commit "media: chips-media: wave6: Add Wave6 control
driver" and commit "media: chips-media: wave6: Add Wave6 thermal cooling
device")?

wave6_vpu_attach_pm_domains() attaches the domains with the non-managed
dev_pm_domain_attach_list(), and wave6_vpu_get_performance_dev() stores
vpu->pd_list->pd_devs[index] in vpu->thermal.dev.  wave6_vpu_cooling_init()
then registers the cooling device via
devm_thermal_of_child_cooling_device_register() on vpu->dev:

drivers/media/platform/chips-media/wave6/wave6-vpu.c:wave6_vpu_remove() {
	wait_for_completion(&vpu->fw_done);
	wave6_vpu_release(vpu);
	pm_runtime_disable(vpu->dev);
	wave6_vpu_detach_pm_domains(vpu);
}

Because wave6_vpu_detach_pm_domains() calls dev_pm_domain_detach_list()
before the driver core runs devres_release_all() to unregister the devm
cooling device, vpu->thermal.dev is unregistered and freed while
wave6_vpu_cooling_set_cur_state() can still call
dev_pm_genpd_set_performance_state(thermal->dev, level).

> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			ranges;
> +			status =3D "disabled";
> +
> +			interface@4c480000 {
> +				reg =3D <0x0 0x4c480000 0x0 0x10000>;
> +				interrupts =3D <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			interface@4c490000 {
> +				reg =3D <0x0 0x4c490000 0x0 0x10000>;
> +				interrupts =3D <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			interface@4c4a0000 {
> +				reg =3D <0x0 0x4c4a0000 0x0 0x10000>;
> +				interrupts =3D <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			interface@4c4b0000 {
> +				reg =3D <0x0 0x4c4b0000 0x0 0x10000>;
> +				interrupts =3D <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
> +			};

[Severity: High]
Since the four core interface nodes have separate GIC SPI interrupts, can
concurrent W6_INT_BIT_REQ_WORK_BUF interrupts race on
vpu->work_buffers_avail in wave6_vpu_require_work_buffer() (from commit
"media: chips-media: wave6: Add Wave6 control driver")?

drivers/media/platform/chips-media/wave6/wave6-vpu.c:wave6_vpu_require_work=
_buffer() {
	...
	if (WARN_ON(vpu->work_buffers_avail =3D=3D 0))
		goto exit;

	vpu->work_buffers_avail--;
	vb =3D &vpu->work_buffers[vpu->work_buffers_avail];
	...
}

Each core's hard IRQ handler wave6_vpu_core_irq() calls
wave6_vpu_require_work_buffer(core->vpu, core->reg_base) on the shared
parent vpu without a lock:

CPU0 (<hardirq> SPI 299)          CPU1 (<hardirq> SPI 300)
wave6_vpu_core_irq()              wave6_vpu_core_irq()
  wave6_vpu_require_work_buffer()   wave6_vpu_require_work_buffer()
    work_buffers_avail =3D=3D 1           work_buffers_avail =3D=3D 1
    work_buffers_avail-- (0)          work_buffers_avail-- (0xffffffff)
                                      vpu->work_buffers[0xffffffff]
                                        <-- out-of-bounds read

Even when work_buffers_avail > 1, two cores racing on the decrement can
receive the same DMA work buffer.

[Severity: High]
In the core, decoder and encoder drivers instantiated for these interface
nodes (commit "media: chips-media: wave6: Add Wave6 core driver", commit
"media: chips-media: wave6: Add Wave6 m2m decoder" and commit "media:
chips-media: wave6: Add Wave6 m2m encoder"), can wave6_vpu_dec_release(),
wave6_vpu_enc_release() and wave6_vpu_finish_job() cause a use-after-free
of inst->v4l2_fh.m2m_ctx?

drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c:wave6_vpu_dec_rele=
ase() {
	wave6_vpu_remove_dbgfs_file(inst);
	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);

	if (inst->state !=3D VPU_INST_STATE_NONE)
		wave6_vpu_dec_destroy_instance(inst, false);
	...
}

drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c:wave6_vpu_finish_=
job() {
	cancel_delayed_work(&inst->task_timer);
	v4l2_m2m_job_finish(inst->dev->m2m_dev, inst->v4l2_fh.m2m_ctx);
}

wave6_vpu_dec_stop_streaming() does not destroy the instance (nor does
wave6_vpu_enc_stop_streaming() when only the OUTPUT queue was streaming),
so v4l2_m2m_ctx_release() frees m2m_ctx before destroy_instance() calls
wave6_vpu_disable_instance() to clear inst->enable, synchronize_irq() and
cancel_delayed_work_sync(&inst->task_timer):

CPU0                              CPU1
wave6_vpu_dec_release()
  v4l2_m2m_ctx_release(m2m_ctx)
    kfree(m2m_ctx)
                                  wave6_vpu_core_irq_thread()
                                    inst->ops->finish_process()
                                      ...
                                      v4l2_m2m_job_finish(..., m2m_ctx)
                                        <-- use-after-free
  wave6_vpu_dec_destroy_instance()
    wave6_vpu_disable_instance()

In addition, wave6_vpu_finish_job() uses cancel_delayed_work() rather than
cancel_delayed_work_sync(), allowing an already-running
wave6_vpu_device_run_timeout() work item to access m2m_ctx and call
v4l2_m2m_job_finish() concurrently with frame completion.

[Severity: High]
In commit "media: chips-media: wave6: Add Wave6 m2m encoder", can starting
and stopping only the encoder OUTPUT queue leave the instance in
VPU_INST_STATE_PIC_RUN with stale format parameters and undersized FBC DMA
buffers?

drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c:wave6_vpu_enc_star=
t_streaming() {
	...
	if (inst->state =3D=3D VPU_INST_STATE_NONE) {
		ret =3D wave6_vpu_enc_create_instance(inst);
		if (ret)
			goto exit;
	}
	...
	if (inst->state =3D=3D VPU_INST_STATE_INIT_SEQ) {
		ret =3D wave6_vpu_enc_prepare_fb(inst);
	...
}

drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c:wave6_vpu_enc_stop=
_streaming() {
	...
	if (V4L2_TYPE_IS_CAPTURE(q->type) && inst->state !=3D VPU_INST_STATE_NONE)
		wave6_vpu_enc_destroy_instance(inst, true);
	...
}

wave6_vpu_enc_start_streaming() creates the firmware instance and allocates
FBC buffers on the first queue that starts streaming (even if q->type is
OUTPUT), transitioning inst->state to VPU_INST_STATE_PIC_RUN.  Because
wave6_vpu_enc_stop_streaming() only destroys the instance when stopping the
CAPTURE queue, stopping OUTPUT leaves inst->state at VPU_INST_STATE_PIC_RUN
while neither queue is streaming; a subsequent VIDIOC_S_FMT to a larger
resolution followed by VIDIOC_STREAMON skips instance recreation and FBC
buffer reallocation.

[Severity: High]
In commit "media: chips-media: wave6: Add Wave6 m2m decoder", does a
failure in wave6_vpu_dec_seek_header() trigger an infinite workqueue loop
in wave6_vpu_device_run()?

drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c:wave6_vpu_dec_prep=
are_decode() {
	...
	wave6_handle_bitstream_buffer(inst, stream_end);

	if (inst->state < VPU_INST_STATE_PIC_RUN) {
		if (inst->state =3D=3D VPU_INST_STATE_OPEN &&
		    wave6_vpu_dec_seek_header(inst)) {
			vb2_queue_error(v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx));
			vb2_queue_error(v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx));
		}

		return -EAGAIN;
	}
	...
}

When wave6_vpu_dec_seek_header() fails (for example on an unsupported
profile or timeout), the source buffer remains queued on m2m_ctx and
inst->state stays VPU_INST_STATE_OPEN.  Because wave6_vpu_job_ready()
unconditionally returns 1 when inst->state =3D=3D VPU_INST_STATE_OPEN, call=
ing
v4l2_m2m_job_finish() in wave6_vpu_device_run() immediately reschedules
wave6_vpu_device_run() in an endless loop.

[Severity: Medium]
In commit "media: chips-media: wave6: Add Wave6 m2m decoder", does
wave6_vpu_dec_destroy_instance() leave inst->fbc_buf_registered set to true
when an instance is destroyed and recreated during a seek?

drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c:wave6_vpu_dec_dest=
roy_instance() {
	...
	wave6_vpu_dec_release_fb(inst);
	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_NONE);
	...
}

When wave6_vpu_dec_queue_setup() calls wave6_vpu_dec_destroy_instance() in
VPU_INST_STATE_SEEK, the FBC buffers are freed and the firmware instance is
closed, but inst->fbc_buf_registered is not reset to false on the reused
struct vpu_instance.  If streaming restarts and a drain occurs before new
FBC buffers are registered, wave6_vpu_dec_prepare_decode() sees the stale
inst->fbc_buf_registered flag and skips wave6_vpu_dec_finish_drain().

[Severity: Medium]
In commit "media: chips-media: wave6: Add Wave6 core driver", can
wave6_vpu_get() be skipped if a core device is already runtime-active when
an instance is created?

drivers/media/platform/chips-media/wave6/wave6-vpu-core.c:wave6_vpu_core_ru=
ntime_resume() {
	...
	if (atomic_read(&core->active_count)) {
		ret =3D wave6_vpu_get(core->vpu, core->reg_base);
		if (ret)
			goto error_get_vpu;

		core->vpu_held =3D true;
	}
	...
}

If the core device is runtime-resumed while core->active_count is 0 (for
example via sysfs power/control), wave6_vpu_core_runtime_resume() finishes
with core->vpu_held =3D=3D false.  When wave6_vpu_dec_create_instance() or
wave6_vpu_enc_create_instance() later increments active_count and calls
pm_runtime_resume_and_get(inst->dev->dev), runtime PM sees the core device
is already RPM_ACTIVE and returns 0 without calling
wave6_vpu_core_runtime_resume(), leaving the parent VPU device unpowered.

[Severity: Low]
In commit "media: chips-media: wave6: Add trace and debugfs", does
wave6_vpu_core_probe() leak the top-level "wave6" debugfs directory?

drivers/media/platform/chips-media/wave6/wave6-vpu-core.c:wave6_vpu_core_pr=
obe() {
	...
	core->debugfs =3D debugfs_lookup(WAVE6_VPU_DEBUGFS_DIR, NULL);
	if (!IS_ERR_OR_NULL(core->debugfs))
		dput(core->debugfs);
	else
		core->debugfs =3D debugfs_create_dir(WAVE6_VPU_DEBUGFS_DIR, NULL);
	...
}

Nothing removes this directory on probe failure, device removal, or module
unload.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795075577.gi=
t.nas.chung@chipsnmedia.com?part=3D11
