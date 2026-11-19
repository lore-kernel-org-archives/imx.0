Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080130;
	b=Qj7Bv1BwBtVN3qovoaitmlcfrLD9AqZsyjUED9GtmyMp4GS21nklQctUWz2o8rWmufQ4
	 D35/6GN5Te8OcTfQWeXrLlTtLbt2LRovTPiSB0K3eC+iegBm/8xuBHusvGcUO7eQl8cNZ
	 CV6aY/dNmT0nilZprZ4yluvvEVfxvJj5tZOQK4gSRaIf1wkH/YwkhWN/VXWOU1rILJn1l
	 49bdG+VYX0MRErxlL4zU3ihKwhHvSaKVj3/P7nX8iamVnlUg0p7Qmn7G8AfnLKih6XZQ3
	 0IVCu00wLaftxyvpgVltaZSTTH9O6WIvqrLuANfJZzNsVfJzfXCATXoME+UbX3loSvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080130;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=U+OfMdrrfx8w65FkVi+pxPn+Vv2MbXlrWHJ0L9MueEE=;
	b=w05WdhDP2WVRZ3mZaQo8AgS5bMv+xPXUs/Z9dYh1tqfxS/Cufjz6MUJ3U397aG2rq9H0
	 80JJPbHLBVHS2rl6QCEVCpt2IW55vZXyalOloExVQYUOdx/DKUp8Qa4ZNvo6AGN++IpSl
	 ZLr9si8+K0p9yQ3ubhzFilTDAqSPXPcY72xESCZlP18iZA92NYNPxlw4XTbND4ysTv0ix
	 19cYvFzzGwUUoa53Mmpu7coVw7gdXFpCgA4ovzOYbUdBdFOIQGDlKgwZOEMXSuMWlXXcV
	 08wiIRI8DfBoME+kq03D3KO8PX5mIw0BKa0M6LdW0SOQycxDHk/jmQ6zXWv/++Mxh8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OKHwnoiP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3384606A320;
	Thu, 19 Nov 2026 09:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OKHwnoiP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D87D51F000C4;
	Thu, 19 Nov 2026 09:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795080130;
	bh=U+OfMdrrfx8w65FkVi+pxPn+Vv2MbXlrWHJ0L9MueEE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OKHwnoiPvcA246oa28Uh42npPVMGZYqp9BKBqC6IbdgG/hkLxlIBlEdwVsbOvvxog
	 BVxq7JtovLsDGlOsx2HkevBL5PEMgiqLLzMbUNqoxhm69nh1rty0IJqGp1Ysm7pdDf
	 bHZ2CxIvYk1pcPLoREZGOWxbuq0xUYxU8iMNGNLXzgVBMQ3BcamCsJpWNcC7o1Jf+j
	 soblaUP7BEo3vHwyIG8bLI4q78RLR24EOY/eKygnbvhpp9W+0kSTviELk1Os9PxjZc
	 P6/5b4uLQ4/UqfUoUoHvUxH+0kU4ut6aLFA0gyjuplGZuioGbBTjlMD9gd61AP8FJl
	 tp2bgZA52ZjWg==
Message-ID: <sashiko-outbox-222819@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 04/11] media: chips-media: wave6: Add Wave6 decoder
 firmware interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nas Chung" <nas.chung@chipsnmedia.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <c246cbe7fe5fdd1affbce30b8c7f7d2987fd308f.1795075580.git.nas.chung@chipsnmedia.com>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <c246cbe7fe5fdd1affbce30b8c7f7d2987fd308f.1795075580.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 09:22:09 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Low] media: wave6: unset disp_pic_width/height in
  wave6_vpu_dec_get_output_info()
- [Low] media: wave6: invalid W6_RET_DEC_BS_RD_PTR read in
  wave6_vpu_dec_get_rd_ptr()
- [Low] media: wave6: ctu_size 2-bit bitfield truncates
  DEC_PIC_TYPE_CTU_SIZE to 0
--

commit 4430346b0188df2bacf518d95646056af3905289
Author: Nas Chung <nas.chung@chipsnmedia.com>

media: chips-media: wave6: Add Wave6 decoder firmware interface

This commit adds the firmware and register interface layer for the
Chips&Media Wave6 video decoder, covering instance management, sequence
initialization, buffer registration, and picture decoding.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-hw.c b/driver=
s/media/platform/chips-media/wave6/wave6-hw.c
> index fcf5be294ef5a..872a540df0218 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-hw.c
> +++ b/drivers/media/platform/chips-media/wave6/wave6-hw.c
[ ... ]
> @@ -179,3 +276,659 @@ int wave6_vpu_get_version(struct vpu_core_device *c=
ore)
[ ... ]
> +int wave6_vpu_dec_get_output_info(struct vpu_instance *inst, struct dec_=
output_info *info)
> +{
[ ... ]
> +	reg_val =3D vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_PIC_SIZE);
> +	info->dec_pic_width =3D DEC_PIC_SIZE_WIDTH(reg_val);
> +	info->dec_pic_height =3D DEC_PIC_SIZE_HEIGHT(reg_val);
> +
> +	info->rd_ptr =3D wave6_vpu_dec_get_rd_ptr(inst);
> +	info->wr_ptr =3D p_dec_info->stream_wr_ptr;
> +	info->byte_pos_frame_start =3D vpu_read_reg_relaxed(inst->dev, W6_RET_D=
EC_AU_START_POS);
> +	info->byte_pos_frame_end =3D vpu_read_reg_relaxed(inst->dev, W6_RET_DEC=
_AU_END_POS);
> +	info->stream_end =3D vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_STREAM_=
END);
> +	info->notification_flags =3D vpu_read_reg_relaxed(inst->dev, W6_RET_DEC=
_NOTIFICATION);
> +	info->last_frame_in_au =3D vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_L=
AST_FRAME_FLAG);
> +
> +	reg_val =3D vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_TIMESTAMP_LOW);
> +	info->timestamp =3D vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_TIMESTAM=
P_HIGH);
> +	info->timestamp =3D (info->timestamp << 32) | reg_val;
> +
> +	if (decoded_idx >=3D 0 && decoded_idx < WAVE6_MAX_FBS)
> +		p_dec_info->dec_out_info[decoded_idx].decoded_poc =3D info->decoded_po=
c;
> +
> +	if (disp_idx >=3D 0 && disp_idx < WAVE6_MAX_FBS) {
> +		info->display_poc =3D p_dec_info->dec_out_info[disp_idx].decoded_poc;
> +		info->disp_pic_width =3D p_dec_info->dec_out_info[disp_idx].dec_pic_wi=
dth;
> +		info->disp_pic_height =3D p_dec_info->dec_out_info[disp_idx].dec_pic_h=
eight;
> +	}
> +
> +	info->sequence_no =3D p_dec_info->seq_info.sequence_no;
> +	if (decoded_idx >=3D 0 && decoded_idx < WAVE6_MAX_FBS)
> +		p_dec_info->dec_out_info[decoded_idx] =3D *info;

[Severity: Low]
When a frame is decoded and displayed in the same step (disp_idx =3D=3D
decoded_idx), such as on the initial IDR frame or with zero reorder delay,
does reading disp_pic_width and disp_pic_height from
p_dec_info->dec_out_info[disp_idx] before p_dec_info->dec_out_info[decoded_=
idx]
is updated leave them set to 0 or stale dimensions from an earlier frame?

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.c b/dr=
ivers/media/platform/chips-media/wave6/wave6-vpuapi.c
> new file mode 100644
> index 0000000000000..c8d1138334b31
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.c
> @@ -0,0 +1,202 @@
[ ... ]
> +int wave6_vpu_dec_complete_seq_init(struct vpu_instance *inst,
> +				    struct dec_seq_info *info)
> +{
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	int ret;
> +
> +	guard(mutex)(&inst->dev->hw_lock);
> +
> +	ret =3D wave6_vpu_dec_get_seq_info(inst, info);
> +	if (!ret)
> +		p_dec_info->seq_info_obtained =3D true;
> +
> +	info->rd_ptr =3D wave6_vpu_dec_get_rd_ptr(inst);
> +	info->wr_ptr =3D p_dec_info->stream_wr_ptr;
> +
> +	p_dec_info->seq_info =3D *info;
> +
> +	return ret;
> +}
[ ... ]
> +void wave6_vpu_dec_get_bitstream_buffer(struct vpu_instance *inst,
> +					dma_addr_t *p_rd_ptr,
> +					dma_addr_t *p_wr_ptr)
> +{
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	dma_addr_t rd_ptr;
> +	dma_addr_t wr_ptr;
> +
> +	guard(mutex)(&inst->dev->hw_lock);
> +
> +	rd_ptr =3D wave6_vpu_dec_get_rd_ptr(inst);
> +	wr_ptr =3D p_dec_info->stream_wr_ptr;
> +
> +	if (p_rd_ptr)
> +		*p_rd_ptr =3D rd_ptr;
> +	if (p_wr_ptr)
> +		*p_wr_ptr =3D wr_ptr;
> +}

[Severity: Low]
Can wave6_vpu_dec_get_rd_ptr() return an unrelated register value when
called outside a W6_QUERY_OPT_GET_RESULT query?

W6_RET_DEC_BS_RD_PTR (offset 0x30C) shares its register offset with
command registers such as W6_CMD_DEC_SET_DISP_Y_BASE and
W6_CMD_DEC_PIC_SEC_AXI, and wave6_vpu_dec_get_rd_ptr() reads it directly
without issuing a query command:

drivers/media/platform/chips-media/wave6/wave6-hw.c:wave6_vpu_dec_get_rd_pt=
r() {
	lockdep_assert_held(&inst->dev->hw_lock);

	return vpu_read_reg(inst->dev, W6_RET_DEC_BS_RD_PTR);
}

Calling wave6_vpu_dec_get_rd_ptr() in wave6_vpu_dec_get_bitstream_buffer(),
or in wave6_vpu_dec_complete_seq_init() when wave6_vpu_dec_get_seq_info()
fails (which also overwrites p_dec_info->seq_info on error), reads
whatever value was last written to 0x30C by a previous command.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h b/dr=
ivers/media/platform/chips-media/wave6/wave6-vpuapi.h
> index 62dd4969afafc..7d6a734f64b43 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
[ ... ]
> @@ -208,12 +248,116 @@ struct instance_buffer {
[ ... ]
> +struct dec_output_info {
[ ... ]
> +	u32 release_disp_frame_num: 5;
> +	u32 disp_frame_num: 5;
> +	u32 ctu_size: 2;

[Severity: Low]
Does the 2-bit ctu_size bitfield truncate DEC_PIC_TYPE_CTU_SIZE() to 0?

wave6_vpu_dec_get_output_info() assigns info->ctu_size from
DEC_PIC_TYPE_CTU_SIZE(reg_val), which evaluates to (16 << FIELD_GET(GENMASK=
(11, 10), (x)))
and produces 16, 32, 64, or 128, none of which fit in a 2-bit bitfield.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795075577.gi=
t.nas.chung@chipsnmedia.com?part=3D4
