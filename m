Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080928;
	b=Pl7Phd/qfrBUJqIBS45K1u7TvV4VxyQNcvOMBDuPD8E6NgWTkRKXWyODXsQ0233rhIgp
	 x0hr1jVpzh/yrU8ZQwLQhqz9wMFv/83tUdIJ3mLkQsT4SYo1IFTsdCymiADdqOykk1pVC
	 cx0CKGrVhcmeZHmI+CTZvnk0dGhERLsMmitaXfp1gmPlJeGhsNGTsW7hfDfdEo62MauHC
	 bHWGWGwhyuhEf/tjxa6BDv9hmaKkoIOyajbOg+je8e2qlLRFFKrDwwszci+tkEgaWAr3Z
	 Wm1SEVuvRrBM6sBhKxewS9UHjxfpxx9B/dGOMWGVbNfW5b6VIRBcb9h/lF0SIiiXN2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080928;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LLfVBaD4Kmp8LPJLmZT1e9Itac1d29q9Djaoah8jO3c=;
	b=Vl70KJMEAXNV+mISR4DyCjMM3sEsrGJZzvC0aB51tGob1FR792BDA5tIVOthMj7O/7U5
	 3TexRvBbAj+y2RR7CA1Xvu7LBnnqYUWTFsmwT53f92UuPMODw7NeNnaDt1N2b3Swb4HmS
	 EMBgP8tvHvnXuKq+Pj1c1reDC3lN0pKU47xBJcA8tEdMhPxyaZQpn//2hVAmGPuVCYcaT
	 UhDiTqoUBfv6fElHT+UvTJeU4R5WQBQ31J4bVcbQlhsNy/Kwkk9EN5y7+eX7iYyvlv2+0
	 ddP+QiAgz81/q0xTGnnbdKpuoDpqK7tf453uSjkMS0+65mCAtVDvvUUaCayFraKj+pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kv675w9J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A433960A2611;
	Thu, 19 Nov 2026 09:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kv675w9J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8C91F000C4;
	Thu, 19 Nov 2026 09:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795080928;
	bh=LLfVBaD4Kmp8LPJLmZT1e9Itac1d29q9Djaoah8jO3c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kv675w9JDRnsbe+nyyXFc1J7BUuDos8g7haJ/amfYtJC7RSp9JG3W4AQX7AqUr9v0
	 lJxQnZeyuHDbUeuTgzv7h3Ox0a+JQwQEQYpguw4CC4QGS3sajp+WoEnzQbzY2wfvTx
	 bv53qyWMS7uG0GOFxpUMWCf8pSNEvbwfa5mlyCVTxGZB3rZbGFDiJp6KHMpBa5zOyp
	 6HBy2+SYxzIllgVG9Or+XB2VeFotkqbA6LDU1lFhGXyJnNA2sCcKp2cxjzxZOUO6Ky
	 UW0BvYtXeawp3ZaXv5CvgvPWE366xXw4Fh0+y6U+EGbyhD1eA0fiPVWIU0twq+4bD2
	 Wsg8X0txaJpBw==
Message-ID: <sashiko-outbox-222858@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 07/11] media: chips-media: wave6: Add Wave6 m2m
 encoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nas Chung" <nas.chung@chipsnmedia.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <542892d0f75d82102f122dfd55c73847e6b8c6f1.1795075581.git.nas.chung@chipsnmedia.com>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <542892d0f75d82102f122dfd55c73847e6b8c6f1.1795075581.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 09:35:27 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 12 potential
issues to consider:
- [High] media: wave6: buffer leak and m2m job hang in
  wave6_vpu_enc_finish_encode()
- [High] media: wave6: unvalidated CAPTURE size and stale sizeimage in
  dst_fmt
- [High] media: wave6: asymmetric instance lifecycle in start and
  stop_streaming()
- [High] media: wave6: missing busy check and zero crop return in
  s_selection()
- [High] media: wave6: unlocked m2m rdy_queue traversal in encoder
  buffer lookup
- [High] media: wave6: race between wave6_vpu_enc_finish_encode() and
  timeout work
- [Medium] media: wave6: zero CSC coefficients in wave6_set_csc() for
  XV601 and XV709
- [Medium] media: wave6: HEVC refresh controls overwritten in
  wave6_set_enc_hevc_param()
- [Medium] media: wave6: skipped CAPTURE validation in
  wave6_vpu_enc_buf_prepare()
- [Medium] media: wave6: zero-padded format table match in
  wave6_find_vpu_fmt()
- [Medium] media: wave6: wave6_find_vpu_fmt() matches zeroed format
  table entries
- [Low] media: wave6: unupdated timeperframe in wave6_vpu_enc_s_parm()
--

commit d914baad0e743b67d2e3cd7e1bd636ba7a5de85f
Author: Nas Chung <nas.chung@chipsnmedia.com>

media: chips-media: wave6: Add Wave6 m2m encoder

This commit adds the V4L2 m2m stateful encoder driver for the Chips&Media
Wave6 video codec IP, supporting H.264 and HEVC encoding.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c b/d=
rivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
> new file mode 100644
> index 0000000000000..7142666d4503d
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
> @@ -0,0 +1,2732 @@

[ ... ]

> +static const struct vpu_format wave6_vpu_enc_fmt_list[2][23] =3D {
> +	[VPU_FMT_TYPE_CODEC] =3D {
> +		{
> +			.v4l2_pix_fmt =3D V4L2_PIX_FMT_HEVC,
> +			.max_width =3D W6_MAX_ENC_PIC_WIDTH,
> +			.min_width =3D W6_MIN_ENC_PIC_WIDTH,
> +			.max_height =3D W6_MAX_ENC_PIC_HEIGHT,
> +			.min_height =3D W6_MIN_ENC_PIC_HEIGHT,
> +			.num_planes =3D 1,
> +		},
> +		{
> +			.v4l2_pix_fmt =3D V4L2_PIX_FMT_H264,
> +			.max_width =3D W6_MAX_ENC_PIC_WIDTH,
> +			.min_width =3D W6_MIN_ENC_PIC_WIDTH,
> +			.max_height =3D W6_MAX_ENC_PIC_HEIGHT,
> +			.min_height =3D W6_MIN_ENC_PIC_HEIGHT,
> +			.num_planes =3D 1,
> +		},
> +	},

[ ... ]

> +static const struct vpu_format *wave6_find_vpu_fmt(unsigned int v4l2_pix=
_fmt,
> +						   enum vpu_fmt_type type)
> +{
> +	for (int i =3D 0; i < ARRAY_SIZE(wave6_vpu_enc_fmt_list[type]); i++) {
> +		if (wave6_vpu_enc_fmt_list[type][i].v4l2_pix_fmt =3D=3D v4l2_pix_fmt)
> +			return &wave6_vpu_enc_fmt_list[type][i];
> +	}
> +
> +	return NULL;
> +}

[Severity: Medium]
Can wave6_find_vpu_fmt() match the unpopulated trailing entries in
wave6_vpu_enc_fmt_list[VPU_FMT_TYPE_CODEC] when v4l2_pix_fmt is 0?

Because wave6_vpu_enc_fmt_list is sized to 23 elements for both sub-arrays
while VPU_FMT_TYPE_CODEC only populates 2 entries, the remaining 21 entries
are zero-initialized. Unlike wave6_find_vpu_fmt_by_idx(), wave6_find_vpu_fm=
t()
does not reject a zero pixelformat, so passing pixelformat 0 to
VIDIOC_TRY_FMT on the capture queue matches a zeroed entry and sets
pix_mp->pixelformat and pix_mp->num_planes to 0 instead of falling back to
inst->dst_fmt.

[ ... ]

> +static struct vb2_v4l2_buffer *wave6_get_valid_src_buf(struct vpu_instan=
ce *inst)
> +{
> +	struct vb2_v4l2_buffer *vb2_v4l2_buf;
> +	struct v4l2_m2m_buffer *v4l2_m2m_buf;
> +	struct vpu_buffer *vpu_buf =3D NULL;
> +
> +	v4l2_m2m_for_each_src_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
> +		vb2_v4l2_buf =3D &v4l2_m2m_buf->vb;
> +		vpu_buf =3D wave6_to_vpu_buf(vb2_v4l2_buf);
> +
> +		if (!vpu_buf->consumed) {
> +			dev_dbg(inst->dev->dev, "no consumed src idx : %d\n",
> +				vb2_v4l2_buf->vb2_buf.index);
> +			return vb2_v4l2_buf;
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct vb2_v4l2_buffer *wave6_get_valid_dst_buf(struct vpu_instan=
ce *inst)
> +{
> +	struct vb2_v4l2_buffer *vb2_v4l2_buf;
> +	struct v4l2_m2m_buffer *v4l2_m2m_buf;
> +	struct vpu_buffer *vpu_buf;
> +
> +	v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
> +		vb2_v4l2_buf =3D &v4l2_m2m_buf->vb;
> +		vpu_buf =3D wave6_to_vpu_buf(vb2_v4l2_buf);
> +
> +		if (!vpu_buf->consumed) {
> +			dev_dbg(inst->dev->dev, "no consumed dst idx : %d\n",
> +				vb2_v4l2_buf->vb2_buf.index);
> +			return vb2_v4l2_buf;
> +		}
> +	}
> +
> +	return NULL;
> +}

[Severity: High]
Does iterating the M2M ready queues in wave6_get_valid_src_buf(),
wave6_get_valid_dst_buf(), and wave6_get_dst_buf_by_addr() race with
v4l2_m2m_buf_queue()?

v4l2_m2m_for_each_src_buf() and v4l2_m2m_for_each_dst_buf() expand to plain
list_for_each_entry() over out_q_ctx.rdy_queue and cap_q_ctx.rdy_queue
without taking q_ctx->rdy_spinlock:

CPU0 (v4l2_m2m_device_run_work)   CPU1 (VIDIOC_QBUF)
wave6_vpu_device_run()            wave6_vpu_enc_buf_queue()
  wave6_vpu_enc_start_encode()      v4l2_m2m_buf_queue()
    wave6_get_valid_src_buf()         spin_lock(&q_ctx->rdy_spinlock)
      v4l2_m2m_for_each_src_buf()     list_add_tail(&b->list,
                                                    &q_ctx->rdy_queue)
        /* unlocked list traversal <-- data race */

When wave6_vpu_device_run() runs from the M2M job workqueue, neither
inst->dev->dev_lock nor rdy_spinlock is held. Likewise, when
wave6_handle_encoded_frame() calls wave6_get_dst_buf_by_addr() from the IRQ
thread, it holds only inst->lock while VIDIOC_QBUF mutates rdy_queue under
inst->dev->dev_lock and rdy_spinlock.

> +
> +static void wave6_set_csc(struct vpu_instance *inst, struct enc_param *p=
ic_param)
> +{
> +	const struct vpu_format *vpu_fmt;
> +	bool is_10bit;
> +
> +	vpu_fmt =3D wave6_find_vpu_fmt(inst->src_fmt.pixelformat, VPU_FMT_TYPE_=
RAW);
> +	if (!vpu_fmt)
> +		return;
> +
> +	if (!(vpu_fmt->flags & VPU_FMT_FLAG_RGB))
> +		return;
> +
> +	is_10bit =3D !!(vpu_fmt->flags & VPU_FMT_FLAG_10BIT);
> +	pic_param->csc.fmt_order =3D vpu_fmt->csc_fmt_order;
> +
> +	if (inst->ycbcr_enc =3D=3D V4L2_YCBCR_ENC_DEFAULT ||
> +	    inst->ycbcr_enc =3D=3D V4L2_YCBCR_ENC_601) {

[ ... ]

> +	} else if (inst->ycbcr_enc =3D=3D V4L2_YCBCR_ENC_XV601) {
> +		if (inst->quantization =3D=3D V4L2_QUANTIZATION_LIM_RANGE) {
> +			/*
> +			 * Y   0.2558(R)  0.5021(G)  0.0975(B)
> +			 * Cb -0.1476(R) -0.2899(G)  0.4375(B)
> +			 * Cr  0.4375(R) -0.3664(G) -0.0711(B)
> +			 */
> +			pic_param->csc.coef_ry =3D 0x083;
> +			pic_param->csc.coef_gy =3D 0x101;
> +			pic_param->csc.coef_by =3D 0x032;
> +			pic_param->csc.coef_rcb =3D 0xffffffb4;
> +			pic_param->csc.coef_gcb =3D 0xffffff6c;
> +			pic_param->csc.coef_bcb =3D 0x0e0;
> +			pic_param->csc.coef_rcr =3D 0x0e0;
> +			pic_param->csc.coef_gcr =3D 0xffffff44;
> +			pic_param->csc.coef_bcr =3D 0xffffffdc;
> +			pic_param->csc.offset_y =3D (is_10bit) ? 0x40 : 0x10;
> +			pic_param->csc.offset_cb =3D 0x0;
> +			pic_param->csc.offset_cr =3D 0x0;
> +		}
> +	} else if (inst->ycbcr_enc =3D=3D V4L2_YCBCR_ENC_XV709) {
> +		if (inst->quantization =3D=3D V4L2_QUANTIZATION_LIM_RANGE) {
> +			/*
> +			 * Y   0.1819(R)  0.6118(G)  0.0618(B)
> +			 * Cb -0.1003(R) -0.3372(G)  0.4375(B)
> +			 * Cr  0.4375(R) -0.3974(G) -0.0401(B)
> +			 */
> +			pic_param->csc.coef_ry =3D 0x05d;
> +			pic_param->csc.coef_gy =3D 0x139;
> +			pic_param->csc.coef_by =3D 0x020;
> +			pic_param->csc.coef_rcb =3D 0xffffffcd;
> +			pic_param->csc.coef_gcb =3D 0xffffff53;
> +			pic_param->csc.coef_bcb =3D 0x0e0;
> +			pic_param->csc.coef_rcr =3D 0x0e0;
> +			pic_param->csc.coef_gcr =3D 0xffffff35;
> +			pic_param->csc.coef_bcr =3D 0xffffffeb;
> +			pic_param->csc.offset_y =3D (is_10bit) ? 0x40 : 0x10;
> +			pic_param->csc.offset_cb =3D 0x0;
> +			pic_param->csc.offset_cr =3D 0x0;
> +		}
> +	}
> +}

[Severity: Medium]
Does wave6_set_csc() leave pic_param->csc zeroed when encoding RGB formats
with V4L2_YCBCR_ENC_XV601 or V4L2_YCBCR_ENC_XV709 and default quantization?

inst->quantization defaults to V4L2_QUANTIZATION_DEFAULT, and
wave6_vpu_enc_try_fmt_out() only converts V4L2_QUANTIZATION_FULL_RANGE to
V4L2_QUANTIZATION_LIM_RANGE for XV601 and XV709. Because these two branches
require inst->quantization =3D=3D V4L2_QUANTIZATION_LIM_RANGE, all CSC
coefficients remain 0 when quantization is V4L2_QUANTIZATION_DEFAULT,
producing all-zero YCbCr output. In addition, V4L2_YCBCR_ENC_DEFAULT is
always treated as BT.601 here instead of being resolved via
V4L2_MAP_YCBCR_ENC_DEFAULT(inst->colorspace) as in to_matrix_coeffs().

[ ... ]

> +static int wave6_vpu_enc_start_encode(struct vpu_instance *inst)
> +{

[ ... ]

> +	src_buf =3D wave6_get_valid_src_buf(inst);
> +	dst_buf =3D wave6_get_valid_dst_buf(inst);
> +
> +	if (!src_buf || !dst_buf) {
> +		dev_dbg(inst->dev->dev, "no valid src or dst buf\n");
> +		return 0;
> +	}
> +
> +	dst_vbuf =3D wave6_to_vpu_buf(dst_buf);
> +	dst_vbuf->consumed =3D true;
> +	dst_vbuf->used =3D true;
> +	pic_param.pic_stream_buffer_addr =3D wave6_get_dma_addr(dst_buf, 0);
> +	pic_param.pic_stream_buffer_size =3D vb2_plane_size(&dst_buf->vb2_buf, =
0);
> +
> +	src_vbuf =3D wave6_to_vpu_buf(src_buf);
> +	src_vbuf->consumed =3D true;

[ ... ]

> +static void wave6_handle_encoded_frame(struct vpu_instance *inst,
> +				       struct enc_output_info *info)
> +{
> +	struct vb2_v4l2_buffer *src_buf;
> +	struct vb2_v4l2_buffer *dst_buf;
> +	struct vpu_buffer *vpu_buf;
> +	struct vpu_buffer *dst_vpu_buf;
> +	enum vb2_buffer_state state;
> +
> +	guard(mutex)(&inst->lock);
> +
> +	state =3D info->encoding_success ? VB2_BUF_STATE_DONE : VB2_BUF_STATE_E=
RROR;
> +
> +	dst_buf =3D wave6_get_dst_buf_by_addr(inst, info->bitstream_buffer);
> +	if (!dst_buf) {
> +		dev_err(inst->dev->dev, "[%d] encoder can't find dst buffer\n", inst->=
id);
> +		return;
> +	}
> +
> +	src_buf =3D v4l2_m2m_src_buf_remove_by_idx(inst->v4l2_fh.m2m_ctx,
> +						 info->enc_src_idx);
> +	if (!src_buf) {
> +		dev_err(inst->dev->dev, "[%d] encoder can't find src buffer\n", inst->=
id);
> +		return;
> +	}
> +
> +	vpu_buf =3D wave6_to_vpu_buf(src_buf);
> +	if (!vpu_buf->consumed) {
> +		dev_err(inst->dev->dev, "[%d] src buffer is not consumed\n", inst->id);
> +		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
> +		return;
> +	}

[ ... ]

> +	v4l2_m2m_dst_buf_remove_by_buf(inst->v4l2_fh.m2m_ctx, dst_buf);
> +	if (state =3D=3D VB2_BUF_STATE_ERROR) {
> +		dev_dbg(inst->dev->dev, "[%d] error frame %d\n", inst->id, inst->seque=
nce);
> +		inst->error_recovery =3D true;
> +		inst->error_buf_num++;
> +	}
> +	v4l2_m2m_buf_done(dst_buf, state);
> +	inst->processed_buf_num++;
> +}

[Severity: High]
Can wave6_handle_encoded_frame() race with wave6_vpu_device_run_timeout()
and corrupt the destination queue list or complete dst_buf twice?

wave6_vpu_enc_finish_encode() runs wave6_handle_encoded_frame() before
cancelling inst->task_timer in wave6_vpu_finish_job(), and
wave6_vpu_finish_job() only uses asynchronous cancel_delayed_work() while
wave6_vpu_device_run_timeout() does not take inst->lock:

CPU0 (wave6_vpu_core_irq_thread)  CPU1 (wave6_vpu_device_run_timeout)
wave6_vpu_enc_finish_encode()
  wave6_handle_encoded_frame()
    mutex_lock(&inst->lock)
    dst_buf =3D wave6_get_dst_buf_by_addr()
                                  dst_buf =3D v4l2_m2m_dst_buf_remove()
                                  v4l2_m2m_buf_done(dst_buf,
                                                    VB2_BUF_STATE_ERROR)
    v4l2_m2m_dst_buf_remove_by_buf(..., dst_buf)
      list_del(&dst_buf->list)    <-- double list_del
    v4l2_m2m_buf_done(dst_buf, state)
                                  <-- double buffer completion

> +
> +static void wave6_vpu_enc_finish_encode(struct vpu_instance *inst, bool =
error)
> +{
> +	int ret;
> +	struct enc_output_info info;
> +
> +	if (error) {
> +		vb2_queue_error(v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx));
> +		vb2_queue_error(v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx));
> +
> +		wave6_vpu_set_instance_state(inst, VPU_INST_STATE_ERROR);
> +
> +		goto finish_encode;
> +	}
> +
> +	memset(&info, 0, sizeof(info));
> +
> +	ret =3D wave6_vpu_enc_get_output_info(inst, &info);
> +	if (ret) {
> +		dev_dbg(inst->dev->dev, "vpu_enc_get_output_info fail %d\n", ret);
> +		goto finish_encode;
> +	}
> +
> +	if (info.enc_src_idx >=3D 0 && info.recon_frame_index >=3D 0)
> +		wave6_handle_encoded_frame(inst, &info);
> +
> +finish_encode:
> +	wave6_vpu_finish_job(inst);
> +}

[Severity: High]
Are the in-flight source and destination buffers stranded on the M2M ready
queues when a frame is skipped or an encode error occurs?

wave6_vpu_enc_start_encode() marks src_vbuf->consumed =3D true and
dst_vbuf->consumed =3D true while leaving both buffers on m2m_ctx until
wave6_handle_encoded_frame() removes and completes them. When a frame is
skipped due to V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT (so
info.recon_frame_index < 0), or when error is true or
wave6_vpu_enc_get_output_info() fails, wave6_handle_encoded_frame() is
not called; similarly, its early returns if src_buf is missing or unconsumed
leave dst_buf unremoved. Those buffers remain on the ready queues with
consumed =3D true and are skipped forever by wave6_get_valid_src_buf() and
wave6_get_valid_dst_buf().

Furthermore, when wave6_vpu_enc_start_encode() subsequently finds no
unconsumed buffer (!src_buf || !dst_buf), it returns 0 without starting a
hardware command, so wave6_vpu_device_run() leaves the M2M job running with
inst->task_timer armed until the 6-second watchdog timeout fires and kills
both queues.

[ ... ]

> +static int wave6_vpu_enc_enum_framesizes(struct file *f, void *fh, struc=
t v4l2_frmsizeenum *fsize)
> +{
> +	const struct vpu_format *vpu_fmt;
> +
> +	if (fsize->index)
> +		return -EINVAL;
> +
> +	vpu_fmt =3D wave6_find_vpu_fmt(fsize->pixel_format, VPU_FMT_TYPE_CODEC);
> +	if (!vpu_fmt) {
> +		vpu_fmt =3D wave6_find_vpu_fmt(fsize->pixel_format, VPU_FMT_TYPE_RAW);
> +		if (!vpu_fmt)
> +			return -EINVAL;
> +	}

[Severity: Medium]
Does wave6_vpu_enc_enum_framesizes() succeed with 0x0 stepwise bounds when
fsize->pixel_format is 0?

Because wave6_find_vpu_fmt(0, VPU_FMT_TYPE_CODEC) returns a pointer to the
first zero-padded entry in wave6_vpu_enc_fmt_list[VPU_FMT_TYPE_CODEC],
VIDIOC_ENUM_FRAMESIZES returns 0 with min_width, max_width, min_height, and
max_height all set to 0 instead of returning -EINVAL.

[ ... ]

> +static int wave6_vpu_enc_try_fmt_cap(struct file *file, void *fh, struct=
 v4l2_format *f)
> +{
> +	struct vpu_instance *inst =3D wave6_file_to_vpu_inst(file);
> +	struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> +	const struct vpu_format *vpu_fmt;
> +	int width, height;
> +
> +	dev_dbg(inst->dev->dev, "%s: 4cc %d w %d h %d plane %d colorspace %d\n",
> +		__func__, pix_mp->pixelformat, pix_mp->width, pix_mp->height,
> +		pix_mp->num_planes, pix_mp->colorspace);
> +
> +	if (!V4L2_TYPE_IS_CAPTURE(f->type))
> +		return -EINVAL;
> +
> +	vpu_fmt =3D wave6_find_vpu_fmt(pix_mp->pixelformat, VPU_FMT_TYPE_CODEC);
> +	if (!vpu_fmt) {
> +		width =3D inst->dst_fmt.width;
> +		height =3D inst->dst_fmt.height;
> +		pix_mp->pixelformat =3D inst->dst_fmt.pixelformat;
> +		pix_mp->num_planes =3D inst->dst_fmt.num_planes;
> +	} else {
> +		width =3D pix_mp->width;
> +		height =3D pix_mp->height;
> +		pix_mp->pixelformat =3D vpu_fmt->v4l2_pix_fmt;
> +		pix_mp->num_planes =3D vpu_fmt->num_planes;
> +	}
> +
> +	wave6_update_pix_fmt(pix_mp, width, height);

[Severity: High]
Can wave6_vpu_enc_try_fmt_cap() set plane_fmt[0].sizeimage to 0, and do
wave6_vpu_enc_s_fmt_out() and wave6_vpu_enc_s_selection() leave
inst->dst_fmt.plane_fmt[0].sizeimage stuck at the initial 416x240 size?

In wave6_update_pix_fmt(), sizeimage for coded formats is only recalculated
when plane_fmt[0].sizeimage is 0:

drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c:wave6_update_pix_=
fmt() {
    ...
	if (!fmt_info) {
		pix_mp->plane_fmt[0].bytesperline =3D 0;
		if (!pix_mp->plane_fmt[0].sizeimage)
			pix_mp->plane_fmt[0].sizeimage =3D width * height;

		return;
	}
    ...
}

When pix_mp->pixelformat is valid in wave6_vpu_enc_try_fmt_cap(), width and
height are taken directly from userspace without clamping or using
inst->dst_fmt. Passing width =3D 0 or height =3D 0 with sizeimage =3D 0 sets
inst->dst_fmt.plane_fmt[0].sizeimage to 0 in wave6_vpu_enc_s_fmt_cap(),
which triggers WARN_ON(!plane_sizes[i]) in vb2_core_reqbufs().

Conversely, because wave6_vpu_open_enc() initializes inst->dst_fmt to
416x240 (sizeimage =3D 99840) and neither wave6_vpu_enc_s_fmt_out() nor
wave6_vpu_enc_s_selection() clears inst->dst_fmt.plane_fmt[0].sizeimage
before calling wave6_update_pix_fmt(&inst->dst_fmt, ...), raising the
output resolution leaves capture bitstream buffers undersized at 99840
bytes.

[ ... ]

> +static int wave6_vpu_enc_s_selection(struct file *file, void *fh, struct=
 v4l2_selection *s)
> +{
> +	struct vpu_instance *inst =3D wave6_file_to_vpu_inst(file);
> +	u32 max_crop_w, max_crop_h;
> +
> +	if (!V4L2_TYPE_IS_OUTPUT(s->type))
> +		return -EINVAL;
> +
> +	if (s->target !=3D V4L2_SEL_TGT_CROP)
> +		return -EINVAL;
> +
> +	if (!(s->flags & (V4L2_SEL_FLAG_GE | V4L2_SEL_FLAG_LE)))
> +		s->flags |=3D V4L2_SEL_FLAG_LE;
> +
> +	if (s->flags & V4L2_SEL_FLAG_GE) {
> +		s->r.left =3D round_up(s->r.left, W6_ENC_CROP_STEP);
> +		s->r.top =3D round_up(s->r.top, W6_ENC_CROP_STEP);
> +		s->r.width =3D round_up(s->r.width, W6_ENC_CROP_STEP);
> +		s->r.height =3D round_up(s->r.height, W6_ENC_CROP_STEP);
> +	}
> +	if (s->flags & V4L2_SEL_FLAG_LE) {
> +		s->r.left =3D round_down(s->r.left, W6_ENC_CROP_STEP);
> +		s->r.top =3D round_down(s->r.top, W6_ENC_CROP_STEP);
> +		s->r.width =3D round_down(s->r.width, W6_ENC_CROP_STEP);
> +		s->r.height =3D round_down(s->r.height, W6_ENC_CROP_STEP);
> +	}
> +
> +	s->r.left =3D clamp_t(s32, s->r.left, 0,
> +			    inst->src_fmt.width - W6_MIN_ENC_PIC_WIDTH);
> +	s->r.top =3D clamp_t(s32, s->r.top, 0,
> +			   inst->src_fmt.height - W6_MIN_ENC_PIC_HEIGHT);
> +
> +	max_crop_w =3D inst->src_fmt.width - s->r.left;
> +	max_crop_h =3D inst->src_fmt.height - s->r.top;
> +
> +	if (!s->r.width || !s->r.height)
> +		return 0;
> +	if (max_crop_w < W6_MIN_ENC_PIC_WIDTH)
> +		return 0;
> +	if (max_crop_h < W6_MIN_ENC_PIC_HEIGHT)
> +		return 0;
> +
> +	s->r.width =3D clamp(s->r.width, W6_MIN_ENC_PIC_WIDTH, max_crop_w);
> +	s->r.height =3D clamp(s->r.height, W6_MIN_ENC_PIC_HEIGHT, max_crop_h);
> +
> +	wave6_update_pix_fmt(&inst->dst_fmt, s->r.width, s->r.height);
> +	wave6_update_crop_info(inst, s->r.left, s->r.top, s->r.width, s->r.heig=
ht);

[Severity: High]
Can wave6_vpu_enc_s_selection() modify inst->codec_rect while streaming,
and does it return a 0-sized rectangle when width or height is 0?

wave6_vpu_enc_s_selection() does not check vb2_is_busy() on the queues or
whether inst->state !=3D VPU_INST_STATE_NONE. Because hardware picture
dimensions are configured once at streamon while
wave6_update_frame_buf_addr() adds inst->codec_rect.top and
inst->codec_rect.left to the source frame DMA addresses on every frame,
changing the crop offset mid-stream shifts the DMA base addresses while the
VPU still reads the original frame dimensions past the end of the source
buffer.

In addition, returning 0 early when !s->r.width || !s->r.height bypasses
the clamp() calls right below and reports an invalid 0-sized crop rectangle
back to userspace.

[ ... ]

> +static int wave6_vpu_enc_s_parm(struct file *file, void *fh, struct v4l2=
_streamparm *a)
> +{
> +	struct vpu_instance *inst =3D wave6_file_to_vpu_inst(file);
> +	struct enc_controls *ctrls =3D &inst->enc_ctrls;
> +
> +	dev_dbg(inst->dev->dev, "%s: type %d\n", __func__, a->type);
> +
> +	if (!V4L2_TYPE_IS_OUTPUT(a->type))
> +		return -EINVAL;
> +
> +	a->parm.output.capability =3D V4L2_CAP_TIMEPERFRAME;
> +	if (a->parm.output.timeperframe.denominator &&
> +	    a->parm.output.timeperframe.numerator) {
> +		ctrls->frame_rate =3D DIV_ROUND_CLOSEST(a->parm.output.timeperframe.de=
nominator,
> +						      a->parm.output.timeperframe.numerator);
> +		ctrls->frame_rate =3D clamp(ctrls->frame_rate,
> +					  MIN_FRAME_RATE, MAX_FRAME_RATE);
> +	} else {
> +		a->parm.output.timeperframe.numerator =3D 1;
> +		a->parm.output.timeperframe.denominator =3D ctrls->frame_rate;
> +	}

[Severity: Low]
Should wave6_vpu_enc_s_parm() update a->parm.output.timeperframe after
computing and clamping ctrls->frame_rate?

When numerator and denominator are non-zero, the driver rounds and clamps
ctrls->frame_rate but leaves the caller's unadjusted values in
a->parm.output.timeperframe instead of returning 1 / ctrls->frame_rate.

[ ... ]

> +static void wave6_set_enc_hevc_param(struct enc_codec_param *output,
> +				     struct hevc_enc_controls *ctrls)
> +{

[ ... ]

> +	switch (ctrls->refresh_type) {
> +	case V4L2_MPEG_VIDEO_HEVC_REFRESH_NONE:
> +		output->decoding_refresh_type =3D DEC_REFRESH_TYPE_NON_IRAP;
> +		break;
> +	case V4L2_MPEG_VIDEO_HEVC_REFRESH_IDR:
> +		output->decoding_refresh_type =3D DEC_REFRESH_TYPE_IDR;
> +		break;
> +	default:
> +		break;
> +	}
> +	output->intra_period =3D ctrls->refresh_period;
> +	if (output->idr_period) {
> +		output->decoding_refresh_type =3D DEC_REFRESH_TYPE_IDR;
> +		output->intra_period =3D output->idr_period;
> +		output->idr_period =3D 0;
> +	}

[Severity: Medium]
Does checking if (output->idr_period) here overwrite the HEVC refresh type
and period whenever V4L2_CID_MPEG_VIDEO_GOP_SIZE is non-zero?

wave6_set_enc_open_param() sets output->idr_period =3D ctrls->gop_size
(which defaults to 30) before calling wave6_set_enc_hevc_param(). Checking
if (output->idr_period) instead of if (!output->intra_period) clobbers
ctrls->refresh_period and ctrls->refresh_type unless GOP size is explicitly
set to 0.

[ ... ]

> +static int wave6_vpu_enc_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct vpu_instance *inst =3D vb2_get_drv_priv(vb->vb2_queue);
> +
> +	if (V4L2_TYPE_IS_CAPTURE(vb->type))
> +		return 0;

[Severity: Medium]
Should wave6_vpu_enc_buf_prepare() validate the capture plane size against
inst->dst_fmt.plane_fmt[0].sizeimage and reset the plane payload to 0?

Returning early for capture buffers allows undersized imported DMABUFs to
be queued without error, and a re-queued capture buffer that is later
completed as an empty EOS buffer via v4l2_m2m_last_buffer_done() when
V4L2_ENC_CMD_STOP or output streamoff runs retains its stale bytesused
payload from the previous frame.

[ ... ]

> +static int wave6_vpu_enc_start_streaming(struct vb2_queue *q, unsigned i=
nt count)
> +{
> +	struct vpu_instance *inst =3D vb2_get_drv_priv(q);
> +	int ret =3D 0;
> +
> +	v4l2_m2m_update_start_streaming_state(inst->v4l2_fh.m2m_ctx, q);
> +
> +	if (inst->state =3D=3D VPU_INST_STATE_NONE) {
> +		ret =3D wave6_vpu_enc_create_instance(inst);
> +		if (ret)
> +			goto exit;
> +	}
> +
> +	if (inst->state =3D=3D VPU_INST_STATE_OPEN) {
> +		ret =3D wave6_vpu_enc_initialize_instance(inst);
> +		if (ret) {
> +			wave6_vpu_enc_destroy_instance(inst);
> +			goto exit;
> +		}
> +	}
> +
> +	if (inst->state =3D=3D VPU_INST_STATE_INIT_SEQ) {
> +		ret =3D wave6_vpu_enc_prepare_fb(inst);
> +		if (ret) {
> +			wave6_vpu_enc_destroy_instance(inst);
> +			goto exit;
> +		}
> +	}
> +
> +exit:
> +	if (ret)
> +		wave6_vpu_return_buffers(inst, q->type, VB2_BUF_STATE_QUEUED);
> +
> +	return ret;
> +}
> +
> +static void wave6_vpu_enc_stop_streaming(struct vb2_queue *q)
> +{
> +	struct vpu_instance *inst =3D vb2_get_drv_priv(q);
> +
> +	dev_dbg(inst->dev->dev, "[%d] %s, input %d, encode %d\n",
> +		inst->id, V4L2_TYPE_IS_OUTPUT(q->type) ? "output" : "capture",
> +		inst->queued_src_buf_num, inst->sequence);
> +
> +	if (inst->state =3D=3D VPU_INST_STATE_NONE)
> +		goto exit;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> +		inst->queued_src_buf_num =3D 0;
> +		inst->processed_buf_num =3D 0;
> +		inst->error_buf_num =3D 0;
> +		inst->sequence =3D 0;
> +	} else {
> +		inst->queued_dst_buf_num =3D 0;
> +	}
> +
> +	if (V4L2_TYPE_IS_CAPTURE(q->type) && inst->state !=3D VPU_INST_STATE_NO=
NE)
> +		wave6_vpu_enc_destroy_instance(inst);
> +
> +exit:
> +	wave6_vpu_return_buffers(inst, q->type, VB2_BUF_STATE_ERROR);
> +	v4l2_m2m_update_stop_streaming_state(inst->v4l2_fh.m2m_ctx, q);
> +}

[Severity: High]
Can starting streaming on one queue before configuring the other leave the
hardware instance and FBC reference buffers out of sync with the configured
formats?

wave6_vpu_enc_start_streaming() creates the hardware instance and allocates
FBC buffers sized to inst->codec_rect on whichever queue starts streaming
first, while wave6_vpu_enc_s_fmt_out() and wave6_vpu_enc_s_fmt_cap() only
check vb2_is_busy() on their own queue. If userspace starts capture
streaming first (or stops only the output queue, which does not destroy the
instance) and then changes the output resolution or capture codec format,
the second STREAMON sees inst->state =3D=3D VPU_INST_STATE_PIC_RUN and skips
reinitializing the hardware instance and FBC buffers.

In addition, if capture stops streaming before output,
wave6_vpu_enc_stop_streaming() destroys the instance and sets inst->state
to VPU_INST_STATE_NONE, so stopping the output queue afterwards takes the
early goto exit and skips resetting queued_src_buf_num, processed_buf_num,
error_buf_num, and sequence.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795075577.gi=
t.nas.chung@chipsnmedia.com?part=3D7
