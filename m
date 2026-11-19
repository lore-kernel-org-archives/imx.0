Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080702;
	b=3vZ0inwP9aIowCB0HErFpTzcy/TAVNYXdcJxzF/AjHjSGmAYkUa6S3jUsOSGRt8fM4D0
	 U8IAMdXcsrOZGw5Fra264tnJf4CIN0H6eLIZMDVYPpAwS76vwBzDgVKpiYx2eT6TcWbsl
	 t9uWDajkmsSxJGhm/Kcsv3VWoF2iy55YMS8HixH89zlGsWUcRlnHy9uKF250hJV8L2WQf
	 6xtNSO1Bsn2R0nmb4w04/2Vag3MxIauGNzYG4uf/LH/MzkLAbKbT2x9vOhkug4YyUnwFg
	 QasplhvYwoiwgK6yBP1NK85zF2qM2rRSMLJbt0rF0YZqRjR7ep/IN7OCS1Fi6t1XWJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080702;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RBw1NcU/mFRaUaMQCa9Xxa/e9U3v+/0Cmy7OkPuAQcQ=;
	b=NfAFjAmKgHQdSbjPuc6fspoM8vBlQsXrelW0Pi2I3PHP5DOHUUgXbeIdjAzBvNkpvNuw
	 V4sdteJms9QRq53HEhPtx9mzEQfgu1tyfTvLcBU7g35aZSXDcAAZ/jmxlNfeGY8aJ7fsU
	 GmF/PKTrsJjzAGxtr8pQ3MiEFFYIt2/5zP6GqENldRRAuK6KfAZrw9lB3mlctyxvgj71a
	 tyYDFNWmdBG3OCxPgX8Wo9Fj2HC5UBwj1lWfdJK7uNa0DTwjTw9qtJRlXAub5sv/HH0eF
	 l/cQLKxWXLma//d9Vtw9ZA72CLTO/mcg2MnbVcbsvPPbV5Gek1V9BUgY+U1AKxtEG5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NdTAGEyo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC49B606A320;
	Thu, 19 Nov 2026 09:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NdTAGEyo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1658D1F000C4;
	Thu, 19 Nov 2026 09:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795080702;
	bh=RBw1NcU/mFRaUaMQCa9Xxa/e9U3v+/0Cmy7OkPuAQcQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NdTAGEyoQPQmw70NaZ7xzsJp2b0juB9RoLDW3PaEHxbPenqhSQSbO6LfvjFnC++ct
	 3poHIV/ez/2XMnfRt1g7WRzqb7tTBJ0IurCc4vD+yZeb/N4irp0PUcHciIHAa646uo
	 XqKbrdvVNljBtkUYre0IsdoM89Yo3rvEHPDsoVT+qFKzsKATpn9y2YxATZ0L18Refj
	 Z/SRUWze8+8dskuK/dbqfjPsezkpPIFet760Y74tWHhzcnQMbuRS7Y/0FRmrjjlEe7
	 Q2EnQ7xGeyPANesSt7TFt9KYFf5kdkDNc8tAOnLduOza8nCOge2iIMmT2trahHXKRj
	 8DSrGuw72UFxA==
Message-ID: <sashiko-outbox-222840@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 05/11] media: chips-media: wave6: Add Wave6 m2m
 decoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nas Chung" <nas.chung@chipsnmedia.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <131b501b33d697b070553bb5ff9ffafcaea812d6.1795075581.git.nas.chung@chipsnmedia.com>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <131b501b33d697b070553bb5ff9ffafcaea812d6.1795075581.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 09:31:41 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 13 potential
issues to consider:
- [High] media: wave6: infinite job loop on failure in
  wave6_vpu_dec_seek_header()
- [High] media: wave6: missing CAPTURE buffer size check after format
  update
- [High] media: wave6: use-after-free of m2m_ctx in
  wave6_vpu_dec_release()
- [Medium] media: wave6: unhandled query failure in
  wave6_vpu_dec_finish_decode()
- [Medium] media: wave6: fbc_buf_registered not reset in
  wave6_vpu_dec_release_fb()
- [Medium] media: wave6: zero pixelformat matched in
  wave6_find_vpu_fmt()
- [Medium] media: wave6: skipped FBC setup in
  wave6_vpu_dec_start_streaming() after seek
- [Medium] media: wave6: duplicate display buffer entries in
  p_dec_info->disp_buf[]
- [Medium] media: wave6: infinite job rescheduling loop on
  DEC_NOTI_FLAG_NO_FB
- [Medium] media: wave6: race between wave6_vpu_dec_finish_decode() and
  timeout work
- [Medium] media: wave6: unlocked cap_q_ctx.rdy_queue traversal races
  with queue ops
- [Medium] media: wave6: unlocked state updates and early event in
  source change
- [Medium] media: wave6: ignored buffer registration errors in
  prepare_decode()
--

commit 2d9ead557a0ff6a4de5fd71e8b36d2fcff95e3a1
Author: Nas Chung <nas.chung@chipsnmedia.com>

media: chips-media: wave6: Add Wave6 m2m decoder

This commit adds the V4L2 m2m stateful decoder driver for the Chips&Media
Wave6 video codec IP, supporting H.264 and HEVC 8-bit decoding, downscaling,
and dynamic resolution changes.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c b/d=
rivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
> new file mode 100644
> index 0000000000000..54b408922bbc2
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
> @@ -0,0 +1,1935 @@

[ ... ]

> +static const struct vpu_format wave6_vpu_dec_fmt_list[2][6] =3D {
> +	[VPU_FMT_TYPE_CODEC] =3D {
> +		{
> +			.v4l2_pix_fmt =3D V4L2_PIX_FMT_HEVC,
> +			.max_width =3D W6_MAX_DEC_PIC_WIDTH,
> +			.min_width =3D W6_MIN_DEC_PIC_WIDTH,
> +			.max_height =3D W6_MAX_DEC_PIC_HEIGHT,
> +			.min_height =3D W6_MIN_DEC_PIC_HEIGHT,
> +			.num_planes =3D 1,
> +		},
> +		{
> +			.v4l2_pix_fmt =3D V4L2_PIX_FMT_H264,
> +			.max_width =3D W6_MAX_DEC_PIC_WIDTH,
> +			.min_width =3D W6_MIN_DEC_PIC_WIDTH,
> +			.max_height =3D W6_MAX_DEC_PIC_HEIGHT,
> +			.min_height =3D W6_MIN_DEC_PIC_HEIGHT,
> +			.num_planes =3D 1,
> +		},
> +	},

[ ... ]

> +static const struct vpu_format *wave6_find_vpu_fmt(unsigned int v4l2_pix=
_fmt,
> +						   enum vpu_fmt_type type)
> +{
> +	for (int i =3D 0; i < ARRAY_SIZE(wave6_vpu_dec_fmt_list[type]); i++) {
> +		if (wave6_vpu_dec_fmt_list[type][i].v4l2_pix_fmt =3D=3D v4l2_pix_fmt)
> +			return &wave6_vpu_dec_fmt_list[type][i];
> +	}
> +
> +	return NULL;
> +}

[Severity: Medium]
Can wave6_find_vpu_fmt() match an unpopulated entry in
wave6_vpu_dec_fmt_list[VPU_FMT_TYPE_CODEC] when v4l2_pix_fmt is 0?

VPU_FMT_TYPE_CODEC only populates 2 of its 6 slots, leaving slots 2..5
zero-initialized.  Passing pixelformat =3D=3D 0 to VIDIOC_S_FMT on OUTPUT
matches slot 2 instead of falling back to inst->src_fmt, which sets
inst->src_fmt.num_planes and plane sizes to 0 and triggers WARN_ON() in
vb2_core_reqbufs() on a subsequent VIDIOC_REQBUFS.

[ ... ]

> +static void wave6_vpu_dec_release_fb(struct vpu_instance *inst)
> +{
> +	for (int i =3D 0; i < WAVE6_MAX_FBS; i++) {
> +		wave6_vdi_free_dma(&inst->frame_vbuf[i]);
> +		memset(&inst->frame_buf[i], 0, sizeof(struct frame_buffer));
> +		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_FBC_Y_TBL][i]);
> +		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_FBC_C_TBL][i]);
> +		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_MV_COL][i]);
> +	}
> +}
> +
> +static void wave6_vpu_dec_destroy_instance(struct vpu_instance *inst)
> +{
> +	u32 fail_res =3D 0;
> +	int ret;
> +
> +	wave6_vpu_disable_instance(inst);
> +
> +	ret =3D wave6_vpu_dec_close(inst, &fail_res);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "failed destroy instance: %d (%d)\n",
> +			ret, fail_res);
> +	}
> +
> +	scoped_guard(spinlock, &inst->dev->inst_lock)
> +		list_del_init(&inst->list);
> +	wave6_vpu_dec_release_fb(inst);
> +	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_NONE);
> +
> +	pm_runtime_put_sync(inst->dev->dev);
> +	wave6_vpu_core_deactivate(inst->dev);
> +}

[Severity: Medium]
Should wave6_vpu_dec_release_fb() or wave6_vpu_dec_destroy_instance()
reset inst->fbc_buf_registered to false?

When wave6_vpu_dec_queue_setup() destroys the instance in
VPU_INST_STATE_SEEK and a new instance is created on the next OUTPUT
STREAMON, inst->fbc_buf_registered remains true from the destroyed
instance even though all FBC buffers were freed.  If V4L2_DEC_CMD_STOP is
then issued before a sequence header is parsed,
wave6_vpu_dec_prepare_decode() skips the !inst->fbc_buf_registered early
drain exit and issues W6_CMD_INIT_SEQ on an empty bitstream.

[ ... ]

> +static void wave6_vpu_dec_handle_dst_buffer(struct vpu_instance *inst)
> +{
> +	struct vb2_v4l2_buffer *dst_buf;
> +	struct v4l2_m2m_buffer *v4l2_m2m_buf;
> +	struct vpu_buffer *vpu_buf;
> +	u32 fb_stride =3D inst->dst_fmt.plane_fmt[0].bytesperline;
> +	u32 luma_size =3D fb_stride * inst->dst_fmt.height;
> +	u32 chroma_size =3D (fb_stride / 2) * (inst->dst_fmt.height / 2);
> +	struct frame_buffer disp_buffer =3D { };
> +	struct dec_seq_info *seq_info =3D &inst->codec_info->dec_info.seq_info;
> +	int consumed_num =3D wave6_vpu_get_consumed_fb_num(inst);
> +	int ret;
> +
> +	v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {

[Severity: Medium]
What serializes v4l2_m2m_for_each_dst_buf() against concurrent list
modifications on cap_q_ctx.rdy_queue?

v4l2_m2m_for_each_dst_buf() iterates cap_q_ctx.rdy_queue without holding
cap_q_ctx.rdy_spinlock:

kworker                           CPU0 (VIDIOC_QBUF)
wave6_vpu_device_run()
  wave6_vpu_dec_prepare_decode()
    wave6_vpu_dec_handle_dst_buffer()
      v4l2_m2m_for_each_dst_buf()
                                  wave6_vpu_dec_buf_queue_dst()
                                    guard(mutex)(&inst->lock)
                                    v4l2_m2m_buf_queue()
                                      list_add_tail(&b->list, ...)
        /* unlocked list traversal */

Similarly, wave6_vpu_core_irq_thread() traverses cap_q_ctx.rdy_queue
unlocked in wave6_get_dst_buf_by_addr() and calls
v4l2_m2m_dst_buf_remove_by_buf(), which can race with
wave6_vpu_dec_buf_queue_dst() or with v4l2_m2m_for_each_dst_buf() in
wave6_vpu_dec_cmd_start() and corrupt the list traversal.

> +		dst_buf =3D &v4l2_m2m_buf->vb;
> +		vpu_buf =3D wave6_to_vpu_buf(dst_buf);
> +
> +		if (vpu_buf->consumed)
> +			continue;
> +
> +		if (consumed_num >=3D WAVE6_MAX_FBS)
> +			break;
> +
> +		if (inst->dst_fmt.num_planes =3D=3D 1) {
> +			disp_buffer.buf_y =3D wave6_get_dma_addr(dst_buf, 0);
> +			disp_buffer.buf_cb =3D disp_buffer.buf_y + luma_size;
> +			disp_buffer.buf_cr =3D disp_buffer.buf_cb + chroma_size;
> +		} else if (inst->dst_fmt.num_planes =3D=3D 2) {
> +			disp_buffer.buf_y =3D wave6_get_dma_addr(dst_buf, 0);
> +			disp_buffer.buf_cb =3D wave6_get_dma_addr(dst_buf, 1);
> +			disp_buffer.buf_cr =3D disp_buffer.buf_cb + chroma_size;
> +		} else if (inst->dst_fmt.num_planes =3D=3D 3) {
> +			disp_buffer.buf_y =3D wave6_get_dma_addr(dst_buf, 0);
> +			disp_buffer.buf_cb =3D wave6_get_dma_addr(dst_buf, 1);
> +			disp_buffer.buf_cr =3D wave6_get_dma_addr(dst_buf, 2);
> +		}
> +		disp_buffer.height =3D inst->src_fmt.height;
> +		disp_buffer.stride =3D fb_stride;
> +		disp_buffer.map_type =3D LINEAR_FRAME_MAP;
> +		disp_buffer.luma_bit_depth =3D seq_info->luma_bit_depth;
> +		disp_buffer.chroma_bit_depth =3D seq_info->chroma_bit_depth;
> +		disp_buffer.c_fmt_idc =3D seq_info->c_fmt_idc;
> +
> +		ret =3D wave6_vpu_dec_register_display_buffer(inst, disp_buffer);
> +		if (ret) {
> +			dev_err(inst->dev->dev, "fail register display buffer %d", ret);
> +			break;
> +		}
> +
> +		vpu_buf->consumed =3D true;
> +		consumed_num++;
> +	}

[Severity: Medium]
Does re-queuing a displayed CAPTURE buffer insert duplicate entries into
p_dec_info->disp_buf[] until all WAVE6_MAX_FBS slots are exhausted?

When a displayed buffer is dequeued and re-queued via VIDIOC_QBUF,
wave6_vpu_dec_buf_queue() resets vpu_buf->consumed =3D false, so
wave6_vpu_dec_handle_dst_buffer() calls
wave6_vpu_dec_register_display_buffer() again.  In commit "media:
chips-media: wave6: Add Wave6 decoder firmware interface",
wave6_dec_set_display_buffer() always writes to the first empty
!disp_buf[i].buf_y slot without checking if fb.buf_y is already present,
and wave6_vpu_dec_get_output_info() only removes buffers on
W6_RET_DEC_RELEASE_IDC, not W6_RET_DEC_DISP_IDC:

drivers/media/platform/chips-media/wave6/wave6-hw.c:wave6_dec_set_display_b=
uffer() {
	for (int i =3D 0; i < WAVE6_MAX_FBS; i++) {
		if (!p_dec_info->disp_buf[i].buf_y) {
			p_dec_info->disp_buf[i] =3D fb;
			break;
		}
	}
}

After 31 displayed frames are re-queued, p_dec_info->disp_buf[] is full of
duplicates and cannot record any new buffer address.

> +
> +	if (!inst->fbc_buf_registered) {
> +		ret =3D wave6_vpu_dec_register_frame_buffer(inst);
> +		if (ret)
> +			dev_err(inst->dev->dev, "register frame buffer fail %d\n", ret);
> +		else
> +			inst->fbc_buf_registered =3D true;
> +	}
> +}

[Severity: Medium]
Should wave6_vpu_dec_handle_dst_buffer() propagate registration errors to
wave6_vpu_dec_prepare_decode()?

If wave6_vpu_dec_register_frame_buffer() or
wave6_vpu_dec_register_display_buffer() fails, the error is logged and
dropped, and wave6_vpu_dec_prepare_decode() still returns 0.
wave6_vpu_device_run() then arms inst->task_timer and calls
wave6_vpu_dec_start_decode() without registered FBC or display buffers.

[ ... ]

> +static void wave6_vpu_dec_handle_source_change(struct vpu_instance *inst)
> +{
> +	static const struct v4l2_event vpu_event_src_ch =3D {
> +		.type =3D V4L2_EVENT_SOURCE_CHANGE,
> +		.u.src_change.changes =3D V4L2_EVENT_SRC_CH_RESOLUTION,
> +	};
> +	struct dec_seq_info *info =3D &inst->codec_info->dec_info.seq_info;
> +
> +	dev_dbg(inst->dev->dev, "pic size %dx%d profile %d, min_fb_cnt : %d | m=
in_disp_cnt : %d\n",
> +		info->pic_width, info->pic_height,
> +		info->profile, info->min_frame_buffer_count, info->frame_buf_delay);
> +
> +	wave6_vpu_dec_retry_one_frame(inst);
> +	wave6_vpu_dec_reset_frame_buffer_info(inst);
> +	inst->fbc_buf_registered =3D false;
> +
> +	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_INIT_SEQ);
> +
> +	inst->scaler_info.enable =3D false;
> +	inst->crop.left =3D info->pic_crop_rect.left;
> +	inst->crop.top =3D info->pic_crop_rect.top;
> +	inst->crop.width =3D info->pic_crop_rect.right - inst->crop.left;
> +	inst->crop.height =3D info->pic_crop_rect.bottom - inst->crop.top;
> +
> +	wave6_update_v4l2_ctrls(inst, info);
> +	wave6_update_color_info(inst, info);
> +	wave6_update_pix_fmt(&inst->src_fmt, info->pic_width, info->pic_height);
> +	wave6_update_pix_fmt_cap(&inst->dst_fmt,
> +				 info->pic_width, info->pic_height,
> +				 true);
> +
> +	v4l2_event_queue_fh(&inst->v4l2_fh, &vpu_event_src_ch);
> +}

[Severity: Medium]
Can queuing V4L2_EVENT_SOURCE_CHANGE inside
wave6_vpu_dec_handle_source_change() wake userspace before the caller
finishes marking the last frame?

CPU0 (irq_thread / kworker)       CPU1 (userspace)
wave6_vpu_dec_seek_header()
  wave6_vpu_dec_handle_source_change()
    /* updates formats unlocked */
    v4l2_event_queue_fh(...)
                                  /* wakes on SOURCE_CHANGE event */
                                  VIDIOC_STREAMON(CAPTURE)
                                  VIDIOC_QBUF(CAPTURE)
  if (vb2_is_streaming(dst_vq))
    wave6_handle_last_frame()     <-- tags new buffer with LAST

In addition, wave6_vpu_dec_handle_source_change() modifies inst->state,
inst->crop, inst->src_fmt, and inst->dst_fmt without holding
core->dev_lock, so a concurrent VIDIOC_G_FMT or VIDIOC_TRY_FMT can observe
partially updated format fields (such as bytesperline temporarily set to
0).  Queuing the event after wave6_handle_last_frame() and serializing the
format update would avoid this race.

[ ... ]

> +static void wave6_vpu_dec_finish_decode(struct vpu_instance *inst, bool =
error)
> +{
> +	struct dec_output_info info;
> +	int ret;
> +
> +	memset(&info, 0, sizeof(info));
> +
> +	ret =3D wave6_vpu_dec_get_output_info(inst, &info);
> +	if (ret)
> +		goto finish_decode;

[Severity: Medium]
What synchronizes wave6_vpu_dec_finish_decode() against inst->task_timer
(wave6_vpu_device_run_timeout())?

wave6_vpu_dec_finish_decode() does not cancel inst->task_timer on entry;
wave6_vpu_finish_job() only calls non-synchronous cancel_delayed_work() at
the very end:

CPU0 (irq_thread)                 CPU1 (kworker)
wave6_vpu_dec_finish_decode()     wave6_vpu_device_run_timeout()
  wave6_handle_decoded_frame()
    src_buf =3D v4l2_m2m_next_src_buf()
                                    src_buf =3D v4l2_m2m_src_buf_remove()
                                    v4l2_m2m_buf_done(src_buf, ...)
    wave6_vpu_dec_src_buf_done()
      v4l2_m2m_src_buf_remove_by_buf()
      v4l2_m2m_buf_done(src_buf)  <-- double remove and buf_done

If the timeout fires while the completion interrupt is being handled, both
paths remove and complete the same source and destination buffers and both
call v4l2_m2m_job_finish().

[Severity: Medium]
If wave6_vpu_dec_get_output_info() fails here, does jumping to
finish_decode leave the consumed head OUTPUT buffer on the ready queue?

Unlike wave6_vpu_dec_start_decode(), this error path neither removes and
completes the head src_buf with VB2_BUF_STATE_ERROR nor transitions
inst->state to VPU_INST_STATE_ERROR, so v4l2_m2m_job_finish() can schedule
the next job with the already-consumed buffer still at the head of the
queue.

> +
> +	dev_dbg(inst->dev->dev, "dec %d dis %d noti_flag %d stream_end %d\n",
> +		info.frame_decoded, info.frame_display,
> +		info.notification_flags, info.stream_end);
> +
> +	if (info.notification_flags & DEC_NOTI_FLAG_NO_FB) {
> +		wave6_vpu_dec_retry_one_frame(inst);
> +		goto finish_decode;
> +	}

[Severity: Medium]
Does DEC_NOTI_FLAG_NO_FB cause an immediate job rescheduling busy loop?

In wave6_vpu_dec_handle_dst_buffer(), queued CAPTURE buffers have
vpu_buf->consumed set to true while vpu_buf->used remains false until
wave6_handle_decoded_frame().  When DEC_NOTI_FLAG_NO_FB jumps to
finish_decode without setting vpu_buf->used, wave6_vpu_check_fb_available()
in commit "media: chips-media: wave6: Add Wave6 core driver" still sees
!vpu_buf->used and reports the job as ready:

drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c:wave6_vpu_check_f=
b_available() {
	v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
		vb2_v4l2_buf =3D &v4l2_m2m_buf->vb;
		vpu_buf =3D wave6_to_vpu_buf(vb2_v4l2_buf);

		if (!vpu_buf->used)
			return true;
	}
}

v4l2_m2m_job_finish() then immediately re-runs the job without waiting for
a new CAPTURE buffer, and wave6_vpu_dec_handle_dst_buffer() skips all
existing CAPTURE buffers because their vpu_buf->consumed is already true.

[ ... ]

> +static int wave6_vpu_dec_s_fmt_out(struct file *file, void *fh, struct v=
4l2_format *f)
> +{

[ ... ]

> +	wave6_update_pix_fmt_cap(&inst->dst_fmt,
> +				 pix_mp->width, pix_mp->height,
> +				 true);
> +
> +	return 0;
> +}

[Severity: High]
Can updating inst->dst_fmt in wave6_vpu_dec_s_fmt_out() or
wave6_vpu_dec_handle_source_change() allow undersized CAPTURE buffers to
be registered for DMA?

If userspace allocates and queues (or prepares via VIDIOC_PREPARE_BUF)
CAPTURE buffers at the default 720x480 format before CAPTURE STREAMON,
wave6_vpu_dec_buf_prepare() validates their sizes against 720x480 and marks
them prepared.  If inst->dst_fmt is then increased (up to 4096x4096) via
VIDIOC_S_FMT on OUTPUT or sequence header parsing, VIDIOC_STREAMON on
CAPTURE calls wave6_vpu_dec_start_streaming() -> wave6_vpu_dec_prepare_fb()
without re-checking the prepared buffers' plane sizes against the new
inst->dst_fmt.plane_fmt[i].sizeimage (unlike wave6_vpu_dec_cmd_start()).
wave6_vpu_dec_handle_dst_buffer() then registers those smaller DMA buffers
with the hardware using the new stride and height, causing out-of-bounds
DMA writes.

[ ... ]

> +static int wave6_vpu_dec_seek_header(struct vpu_instance *inst)
> +{
> +	struct dec_seq_info seq_info;
> +	int ret;
> +
> +	memset(&seq_info, 0, sizeof(struct dec_seq_info));
> +
> +	ret =3D wave6_vpu_dec_issue_seq_init(inst);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "failed wave6_vpu_dec_issue_seq_init %d\n", re=
t);
> +		return ret;
> +	}
> +
> +	ret =3D wave6_vpu_wait_interrupt(inst, W6_VPU_TIMEOUT);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "failed to call vpu_wait_interrupt()\n");
> +		return ret;
> +	}
> +
> +	ret =3D wave6_vpu_dec_complete_seq_init(inst, &seq_info);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "vpu_dec_complete_seq_init: %d, reason : 0x%x\=
n",
> +			ret, seq_info.err_reason);
> +		if ((seq_info.err_reason & WAVE6_SYSERR_NOT_SUPPORT) ||
> +		    (seq_info.err_reason & WAVE6_SYSERR_NOT_SUPPORT_PROFILE)) {
> +			ret =3D -EINVAL;
> +		} else if (seq_info.err_reason =3D=3D HEVC_ETCERR_INIT_SEQ_SPS_NOT_FOU=
ND ||
> +			   seq_info.err_reason =3D=3D AVC_ETCERR_INIT_SEQ_SPS_NOT_FOUND) {
> +			wave6_handle_skipped_frame(inst);
> +			ret =3D 0;
> +		}
> +	} else {
> +		wave6_vpu_dec_handle_source_change(inst);
> +		inst->v4l2_fh.m2m_ctx->ignore_cap_streaming =3D false;
> +		v4l2_m2m_set_dst_buffered(inst->v4l2_fh.m2m_ctx, false);
> +		if (vb2_is_streaming(v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx))) {
> +			scoped_guard(mutex, &inst->lock)
> +				wave6_handle_last_frame(inst, NULL);
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static int wave6_vpu_dec_prepare_decode(struct vpu_instance *inst)
> +{
> +	bool stream_end;
> +
> +	scoped_guard(mutex, &inst->lock)
> +		stream_end =3D inst->drain && !inst->drain_src_buf_num;
> +
> +	if (stream_end && !inst->fbc_buf_registered) {
> +		wave6_vpu_dec_finish_drain(inst);
> +		return -EAGAIN;
> +	}
> +
> +	wave6_handle_bitstream_buffer(inst, stream_end);
> +
> +	if (inst->state < VPU_INST_STATE_PIC_RUN) {
> +		if (inst->state =3D=3D VPU_INST_STATE_OPEN &&
> +		    wave6_vpu_dec_seek_header(inst)) {
> +			vb2_queue_error(v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx));
> +			vb2_queue_error(v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx));
> +		}
> +
> +		return -EAGAIN;
> +	}

[Severity: High]
Does a failure in wave6_vpu_dec_seek_header() trigger an infinite m2m job
loop?

When wave6_vpu_dec_seek_header() fails with any error other than
SPS_NOT_FOUND (such as WAVE6_SYSERR_NOT_SUPPORT_PROFILE on a 10-bit stream
or a timeout), the consumed head OUTPUT buffer is not removed from the
ready queue and inst->state remains VPU_INST_STATE_OPEN.  Calling
vb2_queue_error() only sets q->error without stopping streaming, and
wave6_vpu_job_ready() returns 1 whenever inst->state =3D=3D VPU_INST_STATE_=
OPEN.
When wave6_vpu_dec_prepare_decode() returns -EAGAIN,
wave6_vpu_device_run() calls v4l2_m2m_job_finish(), which immediately
re-queues and re-runs the job in an unbounded loop on the same buffer.

[ ... ]

> +static int wave6_vpu_dec_start_streaming(struct vb2_queue *q, unsigned i=
nt count)
> +{
> +	struct vpu_instance *inst =3D vb2_get_drv_priv(q);
> +	struct v4l2_pix_format_mplane *fmt;
> +	int ret =3D 0;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> +		fmt =3D &inst->src_fmt;
> +		if (inst->state =3D=3D VPU_INST_STATE_NONE) {
> +			ret =3D wave6_vpu_dec_create_instance(inst);
> +			if (!ret) {
> +				inst->v4l2_fh.m2m_ctx->ignore_cap_streaming =3D true;
> +				v4l2_m2m_set_dst_buffered(inst->v4l2_fh.m2m_ctx, true);
> +			}
> +		}
> +		if (inst->state =3D=3D VPU_INST_STATE_SEEK)
> +			wave6_vpu_set_instance_state(inst, inst->state_in_seek);
> +	} else {
> +		fmt =3D &inst->dst_fmt;
> +		if (inst->state =3D=3D VPU_INST_STATE_INIT_SEQ) {
> +			ret =3D wave6_vpu_dec_prepare_fb(inst);
> +			if (ret)
> +				goto exit;
> +		}
> +	}

[Severity: Medium]
Can wave6_vpu_dec_prepare_fb() be skipped if CAPTURE streaming starts while
inst->state is VPU_INST_STATE_SEEK?

If OUTPUT streaming is stopped while in VPU_INST_STATE_INIT_SEQ,
wave6_vpu_dec_stop_streaming() saves inst->state_in_seek =3D
VPU_INST_STATE_INIT_SEQ and sets inst->state =3D VPU_INST_STATE_SEEK.  If
userspace then starts CAPTURE streaming before restarting OUTPUT streaming,
CAPTURE start_streaming sees inst->state =3D=3D VPU_INST_STATE_SEEK and ski=
ps
wave6_vpu_dec_prepare_fb(), and OUTPUT start_streaming only restores
inst->state to VPU_INST_STATE_INIT_SEQ without calling
wave6_vpu_dec_prepare_fb(), leaving decoding permanently stalled in
VPU_INST_STATE_INIT_SEQ.

Also, in wave6_vpu_dec_try_fmt_cap(), checking inst->state >=3D
VPU_INST_STATE_INIT_SEQ evaluates to true in VPU_INST_STATE_SEEK even when
inst->state_in_seek was VPU_INST_STATE_OPEN.

[ ... ]

> +static int wave6_vpu_dec_release(struct file *filp)
> +{
> +	struct vpu_instance *inst =3D wave6_file_to_vpu_inst(filp);
> +
> +	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
> +
> +	if (inst->state !=3D VPU_INST_STATE_NONE)
> +		wave6_vpu_dec_destroy_instance(inst);

[Severity: High]
Can releasing inst->v4l2_fh.m2m_ctx before wave6_vpu_dec_destroy_instance()
cause a use-after-free on m2m_ctx?

v4l2_m2m_ctx_release() waits only for TRANS_RUNNING to clear and then frees
m2m_ctx, whereas wave6_vpu_disable_instance() (which sets inst->enable =3D
false, calls synchronize_irq(), and calls cancel_delayed_work_sync() on
inst->task_timer) only runs afterward inside
wave6_vpu_dec_destroy_instance():

CPU0                              CPU1 (irq_thread / kworker)
wave6_vpu_dec_release()
                                  wave6_vpu_device_run_timeout()
                                    v4l2_m2m_job_finish()
                                      /* clears TRANS_RUNNING */
  v4l2_m2m_ctx_release()
    kfree(m2m_ctx)
                                  wave6_vpu_core_irq_thread()
                                    wave6_vpu_dec_finish_decode()
                                      ...
                                      v4l2_m2m_next_src_buf(m2m_ctx)
                                        <-- use-after-free
  wave6_vpu_dec_destroy_instance()
    wave6_vpu_disable_instance()

A similar race happens if wave6_vpu_finish_job() calls non-synchronous
cancel_delayed_work(&inst->task_timer) and clears TRANS_RUNNING while
wave6_vpu_device_run_timeout() is already running on another CPU.  Calling
wave6_vpu_disable_instance() before v4l2_m2m_ctx_release() would ensure the
IRQ thread and timeout work cannot touch m2m_ctx after it is freed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795075577.gi=
t.nas.chung@chipsnmedia.com?part=3D5
