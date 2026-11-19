Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080387;
	b=Zj1qFrX08DfHsIyXm8x9oiYKcFPOo660KDH49ncAPbcmngAfgXWb4gcg0Oajpv/ZHgo0
	 nByiiVD2/NdG0ixyKGVA1EJqyGlt4j6xMJ97dly0G39a2KjFMwzFjgkf/+D47QWf1wy0P
	 kLBSLaGeKrN5PHdH4qp/h0ytgx8uVLcQ0kxkBOUKKCYaHZyuUUxfBnxXIuTyIZwtCVrry
	 6y/dkwdJMcoFZpG4qVLdJpNTNnYFgQTYHjJS8KWX/BV7biy+6nlxwWSp0M1tlQJWDhWYd
	 RhDr2DWRTPvcv42Ft3fZyRAnJjNAVfoIW8ZZt9P5ANmYbJzSVYEUsrRbHeAhLAClC8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080387;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7uY6PZIE/a0B6qtAhmUIgjc1TLboYM8baZak3XyoNV8=;
	b=5knhhYQAVeHTpDhwrGiC2wcJBY6DnE5Osx5MTOdUa0p63NT0L9fEPuC5qtfruW35RXGN
	 5k3YlAlqgQjwVfMkCHmN5FbmnSOLm8epjWtPCA1WiUEA7EtWuwiasV3XYS0zCaeKTyMKp
	 3OaukSlV1gMHSY7caVZgRHOTsj52HEyt1LVSMWyI+BAO+ky3EFA9PioP6WP58wQz/ak6l
	 pk0U9iLvxq27eu5crIL570M96kXFgRO5xpSGdwBKyPBtCtDCGXnhlyL66lVfktLvqlTvM
	 r67i0QdIYhbrKMf+qrxnV7E2InK2VzA0NinbFPF7EGdBN1vt4V8jYtiIsHP0cH+fD7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DBAEeyuX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE896606A32F;
	Thu, 19 Nov 2026 09:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DBAEeyuX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4769D1F000C4;
	Thu, 19 Nov 2026 09:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795080386;
	bh=7uY6PZIE/a0B6qtAhmUIgjc1TLboYM8baZak3XyoNV8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DBAEeyuX/9ULnjJhhjxNCdq0mwq5sD1705zwjSQG0WzVd8SPsO5aSZ6JzJdn65dvx
	 oPyt1wi9gGIQwpem2IavGPNNJ0Rrqh4Y4SFXqpjJsHJ4ljdrekqlRjV1H7MJwKCvON
	 vj0kTMpFN2vjs7ZNCA2Ual4O/Tp9BHOZ5naKu+70LZtfsGxauxwYVkkrbIzCvAygN3
	 LxYfVNsxQH8/uZ8q+jRh3q9FZySYy72irab77ACFOq07F6RjmKzq+9SGI2FwMwo5Mj
	 VMmwHQ8N/xiXxKb/A1ioYty4/nKTT8SdRDJ6AAw460ngiyeIAtZXdDXpd9xBh+vRAu
	 lmHZwY3CKE++g==
Message-ID: <sashiko-outbox-222830@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 02/11] media: chips-media: wave6: Add Wave6 control
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nas Chung" <nas.chung@chipsnmedia.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <6b00047b748267a2ff4e18ccbfd573ea92166d34.1795075580.git.nas.chung@chipsnmedia.com>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <6b00047b748267a2ff4e18ccbfd573ea92166d34.1795075580.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 09:26:25 +0000
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
- [High] media: wave6: vpu->lock held across core device register and
  unregister
- [High] media: wave6: data race on work_buffers_avail in
  wave6_vpu_require_work_buffer()
- [Medium] media: wave6: stuck PREPARE state on work buf error in
  wave6_vpu_init_vpu()
- [Medium] media: wave6: incompatible phys_addr_t pointer in
  wave6_vpu_probe()
- [Medium] media: wave6: wave6_vpu_probe() succeeds without required
  memory-region
- [Medium] media: wave6: wrong product code value for WAVE677_CODE
- [Low] media: wave6: off-by-one of_irq_get() error check in
  wave6_vpu_create_cores()
- [Low] media: wave6: mixed guard(mutex) and goto cleanup in
  wave6_vpu_get()
--

commit 600333b152222fe3a820d242ccd857c34cf7d58c
Author: Nas Chung <nas.chung@chipsnmedia.com>

media: chips-media: wave6: Add Wave6 control driver

This commit adds the control driver for the Chips&Media Wave6 video codec IP
to manage firmware loading, shared memory resources, and child core devices.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.c b/drive=
rs/media/platform/chips-media/wave6/wave6-vpu.c
> new file mode 100644
> index 0000000000000..9160ce53062ce
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
[ ... ]
> +static int wave6_vpu_init_vpu(struct wave6_vpu_device *vpu,
> +			      void __iomem *core_base)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&vpu->lock);
> +
> +	/* try init directly as firmware is running */
> +	if (wave6_vdi_readl(core_base, W6_VPU_VCPU_CUR_PC))
> +		goto init_done;
> +
> +	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_PREPARE);
> +
> +	wave6_vpu_remap_code_buf(vpu);
> +
> +	wave6_vdi_writel(core_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
> +	wave6_vdi_writel(core_base, W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0,
> +			 vpu->sram_buf.dma_addr);
> +	wave6_vdi_writel(core_base, W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0,
> +			 vpu->sram_buf.size);
> +	wave6_vdi_writel(vpu->reg_base, W6_COMMAND_GB, W6_CMD_INIT_VPU);
> +	wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_CORE_START_GB,
> +			 REMAP_CORE_START_ON);
> +
> +	ret =3D wave6_vpu_wait_busy(core_base);
> +	if (ret) {
> +		dev_err(vpu->dev, "init vpu timeout\n");
> +		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
> +		return -EINVAL;
> +	}
> +
> +	ret =3D wave6_vpu_check_result(core_base);
> +	if (ret) {
> +		dev_err(vpu->dev, "init vpu fail, reason 0x%x\n", ret);
> +		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
> +		return -EIO;
> +	}
> +
> +init_done:
> +	ret =3D wave6_vpu_init_work_buf(vpu, core_base);
> +	if (ret)
> +		return ret;
> +
> +	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_ON);
> +
> +	return 0;
> +}

[Severity: Medium]
Does returning on wave6_vpu_init_work_buf() failure leave vpu->state stuck
in WAVE6_VPU_STATE_PREPARE?

Unlike the timeout and error paths above init_done, this path does not
reset vpu->state to WAVE6_VPU_STATE_OFF.  wave6_vpu_get() then powers down
the device and drops core_count to 0, and every later wave6_vpu_get() ->
wave6_vpu_try_boot() sees vpu->state =3D=3D WAVE6_VPU_STATE_PREPARE and ret=
urns
0 without booting the VPU or initializing work buffers.

[ ... ]

> +int wave6_vpu_get(struct wave6_vpu_device *vpu, void __iomem *core_base)
> +{
> +	int ret;
> +
> +	guard(mutex)(&vpu->lock);
> +
> +	/* Only the first core executes boot; others return */
> +	if (atomic_inc_return(&vpu->core_count) > 1)
> +		return 0;
> +
> +	ret =3D pm_runtime_resume_and_get(vpu->dev);
> +	if (ret)
> +		goto error_pm;
> +
> +	ret =3D wave6_vpu_try_boot(vpu, core_base);
> +	if (ret)
> +		goto error_boot;
> +
> +	return 0;
> +
> +error_boot:
> +	pm_runtime_put_sync(vpu->dev);
> +error_pm:
> +	atomic_dec(&vpu->core_count);
> +
> +	return ret;
> +}

[Severity: Low]
This isn't a bug, but wave6_vpu_get() mixes guard(mutex) with goto-based
error unwinding in the same function, contrary to the Cleanup API
conventions in include/linux/cleanup.h.

[ ... ]

> +void wave6_vpu_require_work_buffer(struct wave6_vpu_device *vpu,
> +				   void __iomem *core_base)
> +{
> +	struct vpu_buf *vb;
> +	u32 size;
> +
> +	size =3D wave6_vdi_readl(core_base, W6_CMD_SET_WORK_BUF_SIZE);
> +	if (!size)
> +		return;
> +
> +	if (WARN_ON(size > W637DEC_WORKBUF_SIZE_FOR_CQ))
> +		goto exit;
> +
> +	if (WARN_ON(vpu->work_buffers_avail =3D=3D 0))
> +		goto exit;
> +
> +	vpu->work_buffers_avail--;
> +	vb =3D &vpu->work_buffers[vpu->work_buffers_avail];
> +
> +	wave6_vdi_writel(core_base, W6_CMD_SET_WORK_BUF_ADDR, vb->daddr);
> +
> +exit:
> +	wave6_vdi_writel(core_base, W6_CMD_SET_WORK_BUF_SIZE, SET_WORK_BUF_SIZE=
_ACK);
> +}

[Severity: High]
Can concurrent calls to wave6_vpu_require_work_buffer() across VPU cores
race on vpu->work_buffers_avail?

In commit "media: chips-media: wave6: Add Wave6 core driver", each child
core device calls wave6_vpu_require_work_buffer() directly from its
wave6_vpu_core_irq() hardirq handler without holding any shared lock:

CPU0 (<hardirq> core 0)           CPU1 (<hardirq> core 1)
wave6_vpu_core_irq()              wave6_vpu_core_irq()
  wave6_vpu_require_work_buffer()   wave6_vpu_require_work_buffer()
    if (work_buffers_avail =3D=3D 0)      if (work_buffers_avail =3D=3D 0)
    work_buffers_avail--;             work_buffers_avail--;
    vb =3D &work_buffers[avail];        vb =3D &work_buffers[avail];
                                        <-- duplicate buffer or underflow

Two cores can be assigned the same work_buffers[] entry, or when
vpu->work_buffers_avail is 1, both cores can pass the zero check and
underflow the u32 counter to 0xffffffff, reading vpu->work_buffers[] out of
bounds.

Also, when jumping to exit on error, should W6_CMD_SET_WORK_BUF_ADDR be
cleared before writing SET_WORK_BUF_SIZE_ACK so the firmware does not
consume a stale address?

> +static int wave6_vpu_create_cores(struct wave6_vpu_device *vpu)
> +{
> +	struct device_node *child;
> +	int num_cores =3D 0;
> +
> +	for_each_available_child_of_node(vpu->dev->of_node, child) {
> +		struct platform_device_info info =3D {};
> +		struct platform_device *pdev;
> +		struct resource res[2];
> +		int irq;
> +
> +		if (num_cores >=3D W6_VPU_MAX_NUM_CORE) {
> +			of_node_put(child);
> +			break;
> +		}
> +
> +		if (of_address_to_resource(child, 0, &res[0])) {
> +			dev_warn(vpu->dev, "%pOF: missing reg property\n", child);
> +			continue;
> +		}
> +
> +		irq =3D of_irq_get(child, 0);
> +		if (irq < 0) {
> +			dev_warn(vpu->dev, "%pOF: missing interrupts property\n", child);
> +			continue;
> +		}
> +		res[1] =3D DEFINE_RES_IRQ(irq);

[Severity: Low]
Should the error check for of_irq_get() be "if (irq <=3D 0)"?

of_irq_get() returns 0 when IRQ mapping fails, which would register the
child platform device with an invalid IRQ 0 resource.

[ ... ]

> +static void wave6_vpu_release(struct wave6_vpu_device *vpu)
> +{
> +	guard(mutex)(&vpu->lock);
> +
> +	wave6_vpu_destroy_cores(vpu);
> +	wave6_vpu_free_work_buffers(vpu);
[ ... ]
> +}
> +
> +static void wave6_vpu_init_firmware(struct wave6_vpu_device *vpu,
> +				    const struct firmware *fw)
> +{
> +	guard(mutex)(&vpu->lock);
> +
> +	if (!fw || !fw->data) {
> +		dev_err(vpu->dev, "No firmware.\n");
> +		return;
> +	}
> +
> +	if (fw->size + W6_EXTRA_CODE_BUF_SIZE > wave6_vpu_get_code_buf_size(vpu=
)) {
> +		dev_err(vpu->dev, "firmware size (%zd > %zd) is too big\n",
> +			fw->size, vpu->code_buf.size);
> +		return;
> +	}
> +
> +	memcpy(vpu->code_buf.vaddr, fw->data, fw->size);
> +
> +	if (!wave6_vpu_create_cores(vpu))
> +		dev_err(vpu->dev, "Failed to create VPU cores\n");
> +}

[Severity: High]
Does holding vpu->lock across wave6_vpu_create_cores() and
wave6_vpu_destroy_cores() invert the lock hierarchy against child core
device locks and runtime PM transitions?

wave6_vpu_create_cores() -> platform_device_register_full() and
wave6_vpu_destroy_cores() -> platform_device_unregister() acquire the child
core device's device_lock (core_dev->mutex) while vpu->lock is held, and
platform_device_unregister() -> __device_release_driver() also runs
pm_runtime_get_sync(core_dev) and pm_runtime_put_sync(core_dev).  In commit
"media: chips-media: wave6: Add Wave6 core driver", the child's runtime PM
and system sleep callbacks call wave6_vpu_get() and wave6_vpu_put(), which
acquire vpu->lock under core_dev->mutex or during a core_dev runtime PM
transition:

CPU0                              CPU1
----                              ----
lock(&vpu->lock)
                                  lock(&core_dev->mutex)
lock(&core_dev->mutex)
                                  lock(&vpu->lock)

 *** DEADLOCK ***

CPU0: wave6_vpu_init_firmware() -> wave6_vpu_create_cores() ->
      platform_device_register_full()
CPU1: device_suspend() -> wave6_vpu_core_suspend() ->
      pm_runtime_force_suspend() -> wave6_vpu_core_runtime_suspend() ->
      wave6_vpu_put()

During teardown, if core_dev is in RPM_RESUMING or RPM_SUSPENDING waiting
for vpu->lock in wave6_vpu_get() or wave6_vpu_put() when
wave6_vpu_release() runs, __device_release_driver()'s
pm_runtime_get_sync(core_dev) will also wait on core_dev->power.wait_queue
while holding vpu->lock.

[ ... ]

> +	np =3D of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
> +	if (np) {
> +		struct resource mem;
> +
> +		ret =3D of_address_to_resource(np, 0, &mem);
> +		of_node_put(np);
> +		if (!ret) {
> +			vpu->code_buf.phys_addr =3D mem.start;
> +			vpu->code_buf.size =3D resource_size(&mem);
> +			ret =3D wave6_vpu_init_code_buf(vpu);
> +			if (ret)
> +				goto error_detach_pm_domains;
> +		} else {
> +			dev_warn(&pdev->dev, "memory-region is not available.\n");
> +		}
> +	}

[Severity: Medium]
Should wave6_vpu_probe() fail and jump to error_detach_pm_domains when
"memory-region" is missing or of_address_to_resource() fails?

Without it, vpu->code_buf.size remains 0 while wave6_vpu_probe() continues,
allocates 48 MiB of coherent DMA work buffers and SRAM, and returns 0, only
for wave6_vpu_init_firmware() to unconditionally fail its size check against
wave6_vpu_get_code_buf_size(vpu) and leave those resources allocated without
creating any core devices.

> +	vpu->sram_pool =3D of_gen_pool_get(pdev->dev.of_node, "sram", 0);
> +	if (vpu->sram_pool) {
> +		vpu->sram_buf.size =3D vpu->res->sram_size;
> +		vpu->sram_buf.vaddr =3D gen_pool_dma_alloc(vpu->sram_pool,
> +							 vpu->sram_buf.size,
> +							 &vpu->sram_buf.phys_addr);

[Severity: Medium]
Does passing &vpu->sram_buf.phys_addr to gen_pool_dma_alloc() fail to build
when phys_addr_t and dma_addr_t have different widths?

struct wave6_vpu_dma_buf declares phys_addr as phys_addr_t, whereas
gen_pool_dma_alloc() takes a dma_addr_t * third argument, which triggers
-Werror=3Dincompatible-pointer-types on configs where
CONFIG_PHYS_ADDR_T_64BIT and CONFIG_ARCH_DMA_ADDR_T_64BIT differ (exposed by
COMPILE_TEST).

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h b=
/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
> new file mode 100644
> index 0000000000000..1d4e016c2a582
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
> @@ -0,0 +1,37 @@
[ ... ]
> +#define WAVE617_CODE	0x6170
> +#define WAVE627_CODE	0x6270
> +#define WAVE633_CODE	0x6330
> +#define WAVE637_CODE	0x6370
> +#define WAVE663_CODE	0x6630
> +#define WAVE677_CODE	0x6670

[Severity: Medium]
Should WAVE677_CODE be 0x6770 instead of 0x6670?

All other Wave6 product codes encode the three-digit model number in bits
[15:4], so wave6_is_product_w_series() in wave6_vpu_try_boot() would reject
a Wave677 reporting 0x6770 with -EINVAL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795075577.gi=
t.nas.chung@chipsnmedia.com?part=3D2
