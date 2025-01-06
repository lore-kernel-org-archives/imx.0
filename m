Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8041C198A29
	for <imx@lists.linux.dev>; Mon,  6 Jan 2025 21:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736200523; cv=none; b=OHkrkuC5cLtBB2yMhS8E6JDYRFoBN7hs08+MAK6UoqTILbUT9ERBW1gvqBwQkF0Y2vpoLmjAfk6PWy4fMyxjcLsZFWHmdYyRRV9wSQLLzlHnTdpPFH5JIRul2gupSr7nlc7oh1TgTU9QHLg6PJK2GCsZQsB/vHk43wqf2g+yu2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736200523; c=relaxed/simple;
	bh=wL4YcwxLPx96c/FNtqtVLsnKm+VHQ4cVwnAgXoBNwDc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=axuWzhPxnvMVYXuNPI3UqwdLBUHqMGXn0RS7Y1w8+i63pTXhhcHLScPN87r+ILGVJ58ML/WPr4EWClui70tLuzm4u1D8Ob0phpO3IFSe0m6NmZnR7GKb+tSQ5E4I1XUHWYGKZe6XgB1fyqScHFrs59BiKakFlN8yDjVcVQQ+jAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=tFmeBiZ+; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="tFmeBiZ+"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d8f916b40bso195524926d6.3
        for <imx@lists.linux.dev>; Mon, 06 Jan 2025 13:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736200515; x=1736805315; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fW8hdI6OqJh0dWWDQGRvo9CrT55Jt23ggLAYk7qjGXo=;
        b=tFmeBiZ+x63O8ACeCDrMdnfOtHQCt1J4NMW/gWH+YvunjZHOxljCQ9e9wKQCa04AP2
         0SFOvtp+1bD4AYV1ZoQXU5M4ysqohE/6M6INsec4tVwo4PjEYiH3At6VxygxnxetjCCy
         UngG+x9ChO7IcraD4PGuEjjLgulLTgRCyTxVvtes5psaBIRsJuWoi+x/rbMqRnCGuHXv
         wppqNkcZPx0NZJkSpUfYWwpCdcmJetAofcEbtdleFN4ezjZj5sC5C16UzSHOqJRur2wd
         A3hABfi2uMjKp5cLcdEuGNV3vFngv5rQ1e7YPGLRzTaUpeVUGd0nxtIrUktQ28nqmA24
         Tjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736200515; x=1736805315;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fW8hdI6OqJh0dWWDQGRvo9CrT55Jt23ggLAYk7qjGXo=;
        b=d96sgKkMQMHcKdGxJvXnwOOzZkgub1WpEZ/cv2H5p9el+/59ndBiKGWkaSdKIN/NIp
         mxMH03SRHO0nFWT3geLDJBd6i8jTr+NbRabe3frDCKZAjhqXf4fHAVbRnzLxKPNvjgYi
         GLjnYbPGHwJX+naL/O/zbT+lSK2L0GCR6JLIBBtOOzOuwdIqme9wJmGS2hPRe5/Gsp9C
         pnxkLhdH3p0r03IOQqDm0O4Ctcpx4cgWplF9QPTqLqPit1OVPvU1sJM1149glZQl4Hj1
         FcaZSGU/ueA1Z7LZfGyICOJ8Po4udSZqpXQSVVSN7/eJ2T4wd0ElK9V83aifJOseT8vI
         gkOw==
X-Forwarded-Encrypted: i=1; AJvYcCWS7WyOV1Ybg/DNxjdBsV7YVmte8t4mdUDYANNRUqx/FGAjkXIA/OZ65iVSLzXPr9eQTbM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9iZR0c2biAWXZken24+nXoeVwEZbIX4jcq3hEJbzQot1+9FIQ
	5+8rL2F6klatQPnUYJHDKwJC28p7UrTCFTFCSReUQ17qoHoS4+4WGum8dQRME5k=
X-Gm-Gg: ASbGncvrA8G2/3L7X4A9CM1+qiB957PbVxMRtzjVlsGs2aXWn8COdBgvWlmxmWg8fP0
	tEJmEQJgGud5qJBFao8A6MBKCiVnTrZY1TYDwu2stVMz3m1lMCDgqwXXr7lCzSOjJsrKZ+6STdU
	yNNDtQ5pvAGQCkfZlcBerCooT9q3s1R7GNZ8uL77N/W35I8fsOGCWDsZ7jkF4V0CTKP/mFcJObc
	Qz2PAfyUyFJhPf95aymstq0xkz9SccJVrny7hk6fiQMsPh170dftd3kZw==
X-Google-Smtp-Source: AGHT+IHyFImGpVyVS4whWQuQGwntMIAkoFAJllux2YC1p18fREEsO7LZFvVepwsLojmnuxwhQdAo0A==
X-Received: by 2002:a05:6214:240e:b0:6d8:9838:d3a9 with SMTP id 6a1803df08f44-6dd23356042mr869489616d6.26.1736200515342;
        Mon, 06 Jan 2025 13:55:15 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd181c1e99sm174072366d6.93.2025.01.06.13.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 13:55:14 -0800 (PST)
Message-ID: <e6548df223ca891427aab1e145db04814a9eb67b.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: amphion: Support dmabuf and v4l2 buffer
 without binding
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ming Qian <ming.qian@oss.nxp.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, 	eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Mon, 06 Jan 2025 16:55:13 -0500
In-Reply-To: <20241213091030.2936864-1-ming.qian@oss.nxp.com>
References: <20241213091030.2936864-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Le vendredi 13 d=C3=A9cembre 2024 =C3=A0 18:10 +0900, Ming Qian a =C3=A9cri=
t=C2=A0:
> From: Ming Qian <ming.qian@nxp.com>
>=20
> When using VB2_DMABUF, the relationship between dma-buf and v4l2 buffer
> may not one-to-one, a single dma-buf may be queued via different
> v4l2 buffers, and different dma-bufs may be queued via the same
> v4l2 buffer, so it's not appropriate to use the v4l2 buffer index
> as the frame store id.
>=20
> We can generate a frame store id according to the dma address.
> Then for a given dma-buf, the id is fixed.
>=20
> Driver now manages the frame store and vb2-buffer states independently.
>=20
> When a dmabuf is queued via another v4l2 buffer before the buffer is
> released by firmware, need to pend it until firmware release it.
>=20
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> ---
> v2
> -- fix an uninitialized issue reported by media-ci
>=20
>  drivers/media/platform/amphion/vdec.c     | 232 ++++++++++++++++++----
>  drivers/media/platform/amphion/vpu.h      |   7 +-
>  drivers/media/platform/amphion/vpu_dbg.c  |  15 +-
>  drivers/media/platform/amphion/vpu_v4l2.c |  11 +
>  4 files changed, 218 insertions(+), 47 deletions(-)
>=20
> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platfo=
rm/amphion/vdec.c
> index 61d5598ee6a1..a26cb0c264c9 100644
> --- a/drivers/media/platform/amphion/vdec.c
> +++ b/drivers/media/platform/amphion/vdec.c
> @@ -26,6 +26,7 @@
>  #include "vpu_cmds.h"
>  #include "vpu_rpc.h"
> =20
> +#define VDEC_SLOT_CNT_DFT		32
>  #define VDEC_MIN_BUFFER_CAP		8
>  #define VDEC_MIN_BUFFER_OUT		8
> =20
> @@ -41,6 +42,14 @@ struct vdec_fs_info {
>  	u32 tag;
>  };
> =20
> +struct vdec_frame_store_t {
> +	struct vpu_vb2_buffer *curr;
> +	struct vpu_vb2_buffer *pend;
> +	dma_addr_t addr;
> +	unsigned int state;
> +	u32 tag;
> +};
> +
>  struct vdec_t {
>  	u32 seq_hdr_found;
>  	struct vpu_buffer udata;
> @@ -48,7 +57,8 @@ struct vdec_t {
>  	struct vpu_dec_codec_info codec_info;
>  	enum vpu_codec_state state;
> =20
> -	struct vpu_vb2_buffer *slots[VB2_MAX_FRAME];
> +	struct vdec_frame_store_t *slots;
> +	u32 slot_count;
>  	u32 req_frame_count;
>  	struct vdec_fs_info mbi;
>  	struct vdec_fs_info dcp;
> @@ -289,6 +299,64 @@ static int vdec_ctrl_init(struct vpu_inst *inst)
>  	return 0;
>  }
> =20
> +static void vdec_attach_frame_store(struct vpu_inst *inst, struct vb2_bu=
ffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +	struct vpu_vb2_buffer *vpu_buf =3D to_vpu_vb2_buffer(vbuf);
> +	struct vdec_t *vdec =3D inst->priv;
> +	struct vdec_frame_store_t *new_slots =3D NULL;
> +	dma_addr_t addr;
> +	int i;
> +
> +	addr =3D vpu_get_vb_phy_addr(vb, 0);
> +	for (i =3D 0; i < vdec->slot_count; i++) {
> +		if (addr =3D=3D vdec->slots[i].addr) {
> +			if (vdec->slots[i].curr && vdec->slots[i].curr !=3D vpu_buf) {
> +				vpu_set_buffer_state(vbuf, VPU_BUF_STATE_CHANGED);
> +				vdec->slots[i].pend =3D vpu_buf;
> +			} else {
> +				vpu_set_buffer_state(vbuf, vdec->slots[i].state);
> +			}
> +			vpu_buf->fs_id =3D i;
> +			return;
> +		}
> +	}
> +
> +	for (i =3D 0; i < vdec->slot_count; i++) {
> +		if (!vdec->slots[i].addr) {
> +			vdec->slots[i].addr =3D addr;
> +			vpu_buf->fs_id =3D i;
> +			return;
> +		}
> +	}
> +
> +	new_slots =3D vzalloc(sizeof(*vdec->slots) * vdec->slot_count * 2);

To avoid open coding arithmetics (see Documentation/process/deprecated.rst)=
 you
may be able to use flex_array_size(vdec, slots, vdec->slot_count * 2)

> +	if (!vdec->slots) {
> +		dev_err(inst->dev, "fail to alloc frame store\n");
> +		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_ERROR);
> +		return;
> +	}
> +
> +	memcpy(new_slots, vdec->slots, sizeof(*vdec->slots) * vdec->slot_count)=
;
> +	vfree(vdec->slots);
> +	vdec->slots =3D new_slots;
> +	vdec->slot_count *=3D 2;
> +
> +	vdec->slots[i].addr =3D addr;
> +	vpu_buf->fs_id =3D i;
> +}
> +
> +static void vdec_reset_frame_store(struct vpu_inst *inst)
> +{
> +	struct vdec_t *vdec =3D inst->priv;
> +
> +	if (!vdec->slots || !vdec->slot_count)
> +		return;
> +
> +	vpu_trace(inst->dev, "inst[%d] reset slots\n", inst->id);
> +	memset(vdec->slots, 0, sizeof(*vdec->slots) * vdec->slot_count);


Same here, flex_array_size() would calculate the size for you.

> +}
> +
>  static void vdec_handle_resolution_change(struct vpu_inst *inst)
>  {
>  	struct vdec_t *vdec =3D inst->priv;
> @@ -745,11 +813,11 @@ static int vdec_frame_decoded(struct vpu_inst *inst=
, void *arg)
>  	struct vb2_v4l2_buffer *src_buf;
>  	int ret =3D 0;
> =20
> -	if (!info || info->id >=3D ARRAY_SIZE(vdec->slots))
> +	if (!info || info->id >=3D vdec->slot_count)
>  		return -EINVAL;
> =20
>  	vpu_inst_lock(inst);
> -	vpu_buf =3D vdec->slots[info->id];
> +	vpu_buf =3D vdec->slots[info->id].curr;
>  	if (!vpu_buf) {
>  		dev_err(inst->dev, "[%d] decoded invalid frame[%d]\n", inst->id, info-=
>id);
>  		ret =3D -EINVAL;
> @@ -770,11 +838,13 @@ static int vdec_frame_decoded(struct vpu_inst *inst=
, void *arg)
>  	if (vpu_get_buffer_state(vbuf) =3D=3D VPU_BUF_STATE_DECODED)
>  		dev_info(inst->dev, "[%d] buf[%d] has been decoded\n", inst->id, info-=
>id);
>  	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_DECODED);
> +	vdec->slots[info->id].state =3D VPU_BUF_STATE_DECODED;
>  	vdec->decoded_frame_count++;
>  	if (vdec->params.display_delay_enable) {
>  		struct vpu_format *cur_fmt;
> =20
>  		cur_fmt =3D vpu_get_format(inst, inst->cap_format.type);
> +		vdec->slots[info->id].state =3D VPU_BUF_STATE_READY;
>  		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_READY);
>  		for (int i =3D 0; i < vbuf->vb2_buf.num_planes; i++)
>  			vb2_set_plane_payload(&vbuf->vb2_buf,
> @@ -797,11 +867,11 @@ static struct vpu_vb2_buffer *vdec_find_buffer(stru=
ct vpu_inst *inst, u32 luma)
>  	struct vdec_t *vdec =3D inst->priv;
>  	int i;
> =20
> -	for (i =3D 0; i < ARRAY_SIZE(vdec->slots); i++) {
> -		if (!vdec->slots[i])
> +	for (i =3D 0; i < vdec->slot_count; i++) {
> +		if (!vdec->slots[i].curr)
>  			continue;
> -		if (luma =3D=3D vdec->slots[i]->luma)
> -			return vdec->slots[i];
> +		if (luma =3D=3D vdec->slots[i].addr)
> +			return vdec->slots[i].curr;
>  	}
> =20
>  	return NULL;
> @@ -835,11 +905,11 @@ static void vdec_buf_done(struct vpu_inst *inst, st=
ruct vpu_frame_info *frame)
> =20
>  	cur_fmt =3D vpu_get_format(inst, inst->cap_format.type);
>  	vbuf =3D &vpu_buf->m2m_buf.vb;
> -	if (vbuf->vb2_buf.index !=3D frame->id)
> -		dev_err(inst->dev, "[%d] buffer id(%d, %d) dismatch\n",
> -			inst->id, vbuf->vb2_buf.index, frame->id);
> +	if (vpu_buf->fs_id !=3D frame->id)
> +		dev_err(inst->dev, "[%d] buffer id(%d(%d), %d) dismatch\n",
> +			inst->id, vpu_buf->fs_id, vbuf->vb2_buf.index, frame->id);
> =20
> -	if (vpu_get_buffer_state(vbuf) =3D=3D VPU_BUF_STATE_READY && vdec->para=
ms.display_delay_enable)
> +	if (vdec->params.display_delay_enable)
>  		return;
> =20
>  	if (vpu_get_buffer_state(vbuf) !=3D VPU_BUF_STATE_DECODED)
> @@ -852,10 +922,11 @@ static void vdec_buf_done(struct vpu_inst *inst, st=
ruct vpu_frame_info *frame)
>  	vbuf->sequence =3D vdec->sequence;
>  	dev_dbg(inst->dev, "[%d][OUTPUT TS]%32lld\n", inst->id, vbuf->vb2_buf.t=
imestamp);
> =20
> -	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
>  	vpu_inst_lock(inst);
> +	vdec->slots[vpu_buf->fs_id].state =3D VPU_BUF_STATE_READY;
>  	vdec->display_frame_count++;
>  	vpu_inst_unlock(inst);
> +	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
>  	dev_dbg(inst->dev, "[%d] decoded : %d, display : %d, sequence : %d\n",
>  		inst->id, vdec->decoded_frame_count, vdec->display_frame_count, vdec->=
sequence);
>  }
> @@ -1083,18 +1154,30 @@ static int vdec_response_frame(struct vpu_inst *i=
nst, struct vb2_v4l2_buffer *vb
>  	if (!vbuf)
>  		return -EINVAL;
> =20
> -	if (vdec->slots[vbuf->vb2_buf.index]) {
> -		dev_err(inst->dev, "[%d] repeat alloc fs %d\n",
> -			inst->id, vbuf->vb2_buf.index);
> +	vpu_buf =3D to_vpu_vb2_buffer(vbuf);
> +	if (vpu_buf->fs_id < 0 || vpu_buf->fs_id >=3D vdec->slot_count) {
> +		dev_err(inst->dev, "invalid fs %d for v4l2 buffer %d\n",
> +			vpu_buf->fs_id, vbuf->vb2_buf.index);
>  		return -EINVAL;
>  	}
> =20
> +	if (vdec->slots[vpu_buf->fs_id].curr) {
> +		if (vdec->slots[vpu_buf->fs_id].curr !=3D vpu_buf) {
> +			vpu_set_buffer_state(vbuf, VPU_BUF_STATE_CHANGED);
> +			vdec->slots[vpu_buf->fs_id].pend =3D vpu_buf;
> +		} else {
> +			vpu_set_buffer_state(vbuf, vdec->slots[vpu_buf->fs_id].state);
> +		}
> +		dev_err(inst->dev, "[%d] repeat alloc fs %d (v4l2 index %d)\n",
> +			inst->id, vpu_buf->fs_id, vbuf->vb2_buf.index);
> +		return -EAGAIN;
> +	}
> +
>  	dev_dbg(inst->dev, "[%d] state =3D %s, alloc fs %d, tag =3D 0x%x\n",
>  		inst->id, vpu_codec_state_name(inst->state), vbuf->vb2_buf.index, vdec=
->seq_tag);
> -	vpu_buf =3D to_vpu_vb2_buffer(vbuf);
> =20
>  	memset(&info, 0, sizeof(info));
> -	info.id =3D vbuf->vb2_buf.index;
> +	info.id =3D vpu_buf->fs_id;
>  	info.type =3D MEM_RES_FRAME;
>  	info.tag =3D vdec->seq_tag;
>  	info.luma_addr =3D vpu_get_vb_phy_addr(&vbuf->vb2_buf, 0);
> @@ -1109,12 +1192,13 @@ static int vdec_response_frame(struct vpu_inst *i=
nst, struct vb2_v4l2_buffer *vb
>  	if (ret)
>  		return ret;
> =20
> -	vpu_buf->tag =3D info.tag;
>  	vpu_buf->luma =3D info.luma_addr;
>  	vpu_buf->chroma_u =3D info.chroma_addr;
>  	vpu_buf->chroma_v =3D 0;
>  	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_INUSE);
> -	vdec->slots[info.id] =3D vpu_buf;
> +	vdec->slots[info.id].tag =3D info.tag;
> +	vdec->slots[info.id].curr =3D vpu_buf;
> +	vdec->slots[info.id].state =3D VPU_BUF_STATE_INUSE;
>  	vdec->req_frame_count--;
> =20
>  	return 0;
> @@ -1175,25 +1259,47 @@ static void vdec_recycle_buffer(struct vpu_inst *=
inst, struct vb2_v4l2_buffer *v
>  	v4l2_m2m_buf_queue(inst->fh.m2m_ctx, vbuf);
>  }
> =20
> -static void vdec_clear_slots(struct vpu_inst *inst)
> +static void vdec_release_curr_frame_store(struct vpu_inst *inst, u32 id)
>  {
>  	struct vdec_t *vdec =3D inst->priv;
>  	struct vpu_vb2_buffer *vpu_buf;
>  	struct vb2_v4l2_buffer *vbuf;
> +
> +	if (id >=3D vdec->slot_count)
> +		return;
> +	if (!vdec->slots[id].curr)
> +		return;
> +
> +	vpu_buf =3D vdec->slots[id].curr;
> +	vbuf =3D &vpu_buf->m2m_buf.vb;
> +
> +	vdec_response_fs_release(inst, id, vdec->slots[id].tag);
> +	if (vpu_buf->fs_id =3D=3D id) {
> +		if (vpu_buf->state !=3D VPU_BUF_STATE_READY)
> +			vdec_recycle_buffer(inst, vbuf);
> +		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
> +	}
> +
> +	vdec->slots[id].curr =3D NULL;
> +	vdec->slots[id].state =3D VPU_BUF_STATE_IDLE;
> +
> +	if (vdec->slots[id].pend) {
> +		vpu_set_buffer_state(&vdec->slots[id].pend->m2m_buf.vb, VPU_BUF_STATE_=
IDLE);
> +		vdec->slots[id].pend =3D NULL;
> +	}
> +}
> +
> +static void vdec_clear_slots(struct vpu_inst *inst)
> +{
> +	struct vdec_t *vdec =3D inst->priv;
>  	int i;
> =20
> -	for (i =3D 0; i < ARRAY_SIZE(vdec->slots); i++) {
> -		if (!vdec->slots[i])
> +	for (i =3D 0; i < vdec->slot_count; i++) {
> +		if (!vdec->slots[i].curr)
>  			continue;
> =20
> -		vpu_buf =3D vdec->slots[i];
> -		vbuf =3D &vpu_buf->m2m_buf.vb;
> -
>  		vpu_trace(inst->dev, "clear slot %d\n", i);
> -		vdec_response_fs_release(inst, i, vpu_buf->tag);
> -		vdec_recycle_buffer(inst, vbuf);
> -		vdec->slots[i]->state =3D VPU_BUF_STATE_IDLE;
> -		vdec->slots[i] =3D NULL;
> +		vdec_release_curr_frame_store(inst, i);
>  	}
>  }
> =20
> @@ -1324,39 +1430,29 @@ static void vdec_event_req_fs(struct vpu_inst *in=
st, struct vpu_fs_info *fs)
>  static void vdec_evnet_rel_fs(struct vpu_inst *inst, struct vpu_fs_info =
*fs)
>  {
>  	struct vdec_t *vdec =3D inst->priv;
> -	struct vpu_vb2_buffer *vpu_buf;
> -	struct vb2_v4l2_buffer *vbuf;
> =20
> -	if (!fs || fs->id >=3D ARRAY_SIZE(vdec->slots))
> +	if (!fs || fs->id >=3D vdec->slot_count)
>  		return;
>  	if (fs->type !=3D MEM_RES_FRAME)
>  		return;
> =20
> -	if (fs->id >=3D vpu_get_num_buffers(inst, inst->cap_format.type)) {
> +	if (fs->id >=3D vdec->slot_count) {
>  		dev_err(inst->dev, "[%d] invalid fs(%d) to release\n", inst->id, fs->i=
d);
>  		return;
>  	}
> =20
>  	vpu_inst_lock(inst);
> -	vpu_buf =3D vdec->slots[fs->id];
> -	vdec->slots[fs->id] =3D NULL;
> -
> -	if (!vpu_buf) {
> +	if (!vdec->slots[fs->id].curr) {
>  		dev_dbg(inst->dev, "[%d] fs[%d] has bee released\n", inst->id, fs->id)=
;
>  		goto exit;
>  	}
> =20
> -	vbuf =3D &vpu_buf->m2m_buf.vb;
> -	if (vpu_get_buffer_state(vbuf) =3D=3D VPU_BUF_STATE_DECODED) {
> +	if (vdec->slots[fs->id].state =3D=3D VPU_BUF_STATE_DECODED) {
>  		dev_dbg(inst->dev, "[%d] frame skip\n", inst->id);
>  		vdec->sequence++;
>  	}
> =20
> -	vdec_response_fs_release(inst, fs->id, vpu_buf->tag);
> -	if (vpu_get_buffer_state(vbuf) !=3D VPU_BUF_STATE_READY)
> -		vdec_recycle_buffer(inst, vbuf);
> -
> -	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
> +	vdec_release_curr_frame_store(inst, fs->id);
>  	vpu_process_capture_buffer(inst);
> =20
>  exit:
> @@ -1552,6 +1648,11 @@ static void vdec_cleanup(struct vpu_inst *inst)
>  		return;
> =20
>  	vdec =3D inst->priv;
> +	if (vdec) {
> +		vfree(vdec->slots);
> +		vdec->slots =3D NULL;
> +		vdec->slot_count =3D 0;
> +	}
>  	vfree(vdec);
>  	inst->priv =3D NULL;
>  	vfree(inst);
> @@ -1683,6 +1784,38 @@ static int vdec_stop_session(struct vpu_inst *inst=
, u32 type)
>  	return 0;
>  }
> =20
> +static int vdec_get_slot_debug_info(struct vpu_inst *inst, char *str, u3=
2 size, u32 i)
> +{
> +	struct vdec_t *vdec =3D inst->priv;
> +	struct vpu_vb2_buffer *vpu_buf;
> +	int num =3D -1;
> +
> +	vpu_inst_lock(inst);
> +	if (i >=3D vdec->slot_count || !vdec->slots[i].addr)
> +		goto exit;
> +
> +	vpu_buf =3D vdec->slots[i].curr;
> +
> +	num =3D scnprintf(str, size, "slot[%2d] :", i);
> +	if (vpu_buf) {
> +		num +=3D scnprintf(str + num, size - num, " %2d",
> +				 vpu_buf->m2m_buf.vb.vb2_buf.index);
> +		num +=3D scnprintf(str + num, size - num, "; state =3D %d", vdec->slot=
s[i].state);
> +	} else {
> +		num +=3D scnprintf(str + num, size - num, " -1");
> +	}
> +
> +	if (vdec->slots[i].pend)
> +		num +=3D scnprintf(str + num, size - num, "; %d",
> +				 vdec->slots[i].pend->m2m_buf.vb.vb2_buf.index);
> +
> +	num +=3D scnprintf(str + num, size - num, "\n");
> +exit:
> +	vpu_inst_unlock(inst);
> +
> +	return num;
> +}
> +
>  static int vdec_get_debug_info(struct vpu_inst *inst, char *str, u32 siz=
e, u32 i)
>  {
>  	struct vdec_t *vdec =3D inst->priv;
> @@ -1741,6 +1874,7 @@ static int vdec_get_debug_info(struct vpu_inst *ins=
t, char *str, u32 size, u32 i
>  				vdec->codec_info.vui_present);
>  		break;
>  	default:
> +		num =3D vdec_get_slot_debug_info(inst, str, size, i - 10);
>  		break;
>  	}
> =20
> @@ -1764,6 +1898,8 @@ static struct vpu_inst_ops vdec_inst_ops =3D {
>  	.get_debug_info =3D vdec_get_debug_info,
>  	.wait_prepare =3D vpu_inst_unlock,
>  	.wait_finish =3D vpu_inst_lock,
> +	.attach_frame_store =3D vdec_attach_frame_store,
> +	.reset_frame_store =3D vdec_reset_frame_store,
>  };
> =20
>  static void vdec_init(struct file *file)
> @@ -1804,6 +1940,14 @@ static int vdec_open(struct file *file)
>  		return -ENOMEM;
>  	}
> =20
> +	vdec->slots =3D vzalloc(sizeof(*vdec->slots) * VDEC_SLOT_CNT_DFT);
> +	if (!vdec->slots) {
> +		vfree(vdec);
> +		vfree(inst);
> +		return -ENOMEM;
> +	}
> +	vdec->slot_count =3D VDEC_SLOT_CNT_DFT;
> +
>  	inst->ops =3D &vdec_inst_ops;
>  	inst->formats =3D vdec_formats;
>  	inst->type =3D VPU_CORE_TYPE_DEC;
> diff --git a/drivers/media/platform/amphion/vpu.h b/drivers/media/platfor=
m/amphion/vpu.h
> index 22f0da26ccec..76bfd6b26170 100644
> --- a/drivers/media/platform/amphion/vpu.h
> +++ b/drivers/media/platform/amphion/vpu.h
> @@ -223,6 +223,8 @@ struct vpu_inst_ops {
>  	int (*get_debug_info)(struct vpu_inst *inst, char *str, u32 size, u32 i=
);
>  	void (*wait_prepare)(struct vpu_inst *inst);
>  	void (*wait_finish)(struct vpu_inst *inst);
> +	void (*attach_frame_store)(struct vpu_inst *inst, struct vb2_buffer *vb=
);
> +	void (*reset_frame_store)(struct vpu_inst *inst);
>  };
> =20
>  struct vpu_inst {
> @@ -296,7 +298,8 @@ enum {
>  	VPU_BUF_STATE_DECODED,
>  	VPU_BUF_STATE_READY,
>  	VPU_BUF_STATE_SKIP,
> -	VPU_BUF_STATE_ERROR
> +	VPU_BUF_STATE_ERROR,
> +	VPU_BUF_STATE_CHANGED
>  };
> =20
>  struct vpu_vb2_buffer {
> @@ -305,8 +308,8 @@ struct vpu_vb2_buffer {
>  	dma_addr_t chroma_u;
>  	dma_addr_t chroma_v;
>  	unsigned int state;
> -	u32 tag;
>  	u32 average_qp;
> +	s32 fs_id;
>  };
> =20
>  void vpu_writel(struct vpu_dev *vpu, u32 reg, u32 val);
> diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/pla=
tform/amphion/vpu_dbg.c
> index 940e5bda5fa3..497ae4e8a229 100644
> --- a/drivers/media/platform/amphion/vpu_dbg.c
> +++ b/drivers/media/platform/amphion/vpu_dbg.c
> @@ -48,6 +48,7 @@ static char *vpu_stat_name[] =3D {
>  	[VPU_BUF_STATE_READY] =3D "ready",
>  	[VPU_BUF_STATE_SKIP] =3D "skip",
>  	[VPU_BUF_STATE_ERROR] =3D "error",
> +	[VPU_BUF_STATE_CHANGED] =3D "changed",
>  };
> =20
>  static inline const char *to_vpu_stat_name(int state)
> @@ -164,6 +165,7 @@ static int vpu_dbg_instance(struct seq_file *s, void =
*data)
>  	for (i =3D 0; i < vb2_get_num_buffers(vq); i++) {
>  		struct vb2_buffer *vb;
>  		struct vb2_v4l2_buffer *vbuf;
> +		struct vpu_vb2_buffer *vpu_buf;
> =20
>  		vb =3D vb2_get_buffer(vq, i);
>  		if (!vb)
> @@ -173,13 +175,24 @@ static int vpu_dbg_instance(struct seq_file *s, voi=
d *data)
>  			continue;
> =20
>  		vbuf =3D to_vb2_v4l2_buffer(vb);
> +		vpu_buf =3D to_vpu_vb2_buffer(vbuf);
> =20
>  		num =3D scnprintf(str, sizeof(str),
> -				"capture[%2d] state =3D %10s, %8s\n",
> +				"capture[%2d] state =3D %10s, %8s",
>  				i, vb2_stat_name[vb->state],
>  				to_vpu_stat_name(vpu_get_buffer_state(vbuf)));
>  		if (seq_write(s, str, num))
>  			return 0;
> +
> +		if (vpu_buf->fs_id >=3D 0) {
> +			num =3D scnprintf(str, sizeof(str), "; fs %d", vpu_buf->fs_id);
> +			if (seq_write(s, str, num))
> +				return 0;
> +		}
> +
> +		num =3D scnprintf(str, sizeof(str), "\n");
> +		if (seq_write(s, str, num))
> +			return 0;
>  	}
> =20
>  	num =3D scnprintf(str, sizeof(str), "sequence =3D %d\n", inst->sequence=
);
> diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/pl=
atform/amphion/vpu_v4l2.c
> index 45707931bc4f..74668fa362e2 100644
> --- a/drivers/media/platform/amphion/vpu_v4l2.c
> +++ b/drivers/media/platform/amphion/vpu_v4l2.c
> @@ -501,14 +501,25 @@ static int vpu_vb2_queue_setup(struct vb2_queue *vq=
,
>  		call_void_vop(inst, release);
>  	}
> =20
> +	if (V4L2_TYPE_IS_CAPTURE(vq->type))
> +		call_void_vop(inst, reset_frame_store);
> +
>  	return 0;
>  }
> =20
>  static int vpu_vb2_buf_init(struct vb2_buffer *vb)
>  {
>  	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +	struct vpu_vb2_buffer *vpu_buf =3D to_vpu_vb2_buffer(vbuf);
> +	struct vpu_inst *inst =3D vb2_get_drv_priv(vb->vb2_queue);
> =20
> +	vpu_buf->fs_id =3D -1;
>  	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
> +
> +	if (!inst->ops->attach_frame_store || V4L2_TYPE_IS_OUTPUT(vb->type))
> +		return 0;
> +
> +	call_void_vop(inst, attach_frame_store, vb);
>  	return 0;
>  }
> =20

Just a general question, was the choice for a flexible array because the IP=
 does
not provide enough per-codec information to calculate the number of needed =
slots
or to actually avoid needing to do per codec array sizing ?

Nicolas

