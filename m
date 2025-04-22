Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102FB1A23A2
	for <imx@lists.linux.dev>; Tue, 22 Apr 2025 19:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745351222; cv=none; b=QYS68ulDe8ae8Qnf3wvKN+849PBmYul9TRkfZx5SPgE7OQbvLJxAu3Gl315ZCpvgTvAZTgiiYPkg8HvpsV8RU/YBsdcvWcQDsmql7JTrTLE4B2dy1uh70bG9RB7uALIRFNbattov9Y39DHK0slFo6xlTK4Y/bDzuqvjCM1CvYjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745351222; c=relaxed/simple;
	bh=t2fNCKroL9F7ZVN7zRq8ikEIYNQqgqm5OYQ+KBoNpnE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O5Wr2JZjncNLXq0cOeVyYWyVJGIO+mL5Rkfd/Lb3zgP4QUxl+MRJQvqMOgNPX9OnZotmWGkHBorMcmH3/nN0QSleD8/N5g0lu53yEUG717hjhHW9AqUTSzdLwlFEtY58vXFjOFMaX9dwtvtY0ZTXsSL3xvnGFTLzMHLqRff/PrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=r6ceJUNR; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="r6ceJUNR"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c559b3eb0bso323959485a.1
        for <imx@lists.linux.dev>; Tue, 22 Apr 2025 12:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745351220; x=1745956020; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AZRNUBKg8hwCgXEyYs/1skOhVgOq5no2ClQkvRkjKGA=;
        b=r6ceJUNRbJDnuZ+CTnqbJCKSqgS2g8cG9+ewto/S19KCFcgQV7rON28c5PQ6RP6lDJ
         RErB8uDse5BZfB9Noo0JJkaRHLFKshzy1OtLMLlzObER2Uyp93gA2oW4IRK+14kJCpDm
         dStnbxKr7d/EbZaG0GL3cB8ihYiuN8qD9xD+/I47+7WpjS+/hXDIfOMFldn3zgkr8h4C
         gtUr/EW2McFmks3I/AAYqbZXHj32h+wt0+GBybQ7iAOwKlzo7XjyePw1UJ+4yCjLnb6l
         YBaNlDBuz9Y1QB5HEdILwSEigrYN9fm1IJNdNgT798LjL2CoPWPd3mLvcveEzO/uWyiu
         3u1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745351220; x=1745956020;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AZRNUBKg8hwCgXEyYs/1skOhVgOq5no2ClQkvRkjKGA=;
        b=p+cqcY735PKamMOJusu+hHp0g/QaI9UT1kyOb0QLCG69loIoLBBH0ls3deozg9xfmG
         9KaJfqTaIrT0jRt7VHatZmaIvAponxvXRs6H0zDHSZnZ8ar8yAI2FbF9q1QztN5xvgIL
         JnQx+Z9NA6hjudGD6NPwc3ZbM+MHkqfYHzu6SG3oo80gDh74M7mBbOkxz0BVlUp/p3ob
         AI2usEtmkzU3U+hRmmY5Iae/oaMeGLbVoQKgkkL0X3C0IA32mDllV9YnB8ELICOlJ+tP
         GPdi4Pr/2Br6Tcy8UQyeAX7sRl5TmcC/o6wm/C9SKlX2QP0BlLgLQ9xFWgbPFxGj3S7Q
         WqHw==
X-Forwarded-Encrypted: i=1; AJvYcCWi4SuMwnwlYAkb0tx1MjrT+3etPuKri6Qd39cJ2XLamssWCboenBscQFstM/l4xc6HDoI=@lists.linux.dev
X-Gm-Message-State: AOJu0YySeLsO9drKT7qhFERn/f5tYhbett/xdejuIfIczJIUM5Pnt2+y
	zxNfEjJ23GPQ9ZFbRq7z+uBQtPw0xAn2m/VLm1RHWCN8Gbf2vfWM4WqvHkMCnvM=
X-Gm-Gg: ASbGncsaH/utc7T/d+VRHaQwI7tWBXY0v7QIU9kuktQ8Or2RMWziXVXBcfpfSWrJzW7
	A8pf+tsHTFscTOh86QbEurdu2s5Z12zeHFfnuv6mh2WzcCNihPBZOkwRu9616i2dPNhdhkABOUG
	jjApqRGPTH8DL75EzgsuSieLOtacrIoBSGpWgk+nJJXm/FWIm+zQKyVP11o+oPX+hZjxy8nly8x
	3cAeyLjcu41xF88jdtgJkdf5C4xRKp9XBYDuE3zWFWy/NEn52zy1fs7Lq94YIdE8cDCooZRXplH
	39/yrnzExePPgLbAhDkv+tsBp0qQCCKx9CVBdtTQf51+B3ks0z3BHAxm
X-Google-Smtp-Source: AGHT+IFgS/Q0V6U15helS9ADvq78s/nB3ALXSasniZ8+SnkCEwwfFJHhc6L1EiB4G7ySAUTvyb76hA==
X-Received: by 2002:a05:620a:4510:b0:7c5:54d8:3d43 with SMTP id af79cd13be357-7c928053ba5mr2594224685a.58.1745351219854;
        Tue, 22 Apr 2025 12:46:59 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a6e6absm593612885a.19.2025.04.22.12.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:46:59 -0700 (PDT)
Message-ID: <39053a9e0767289cf822beb350819d366994dd0a.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: Start decoding job when both queue are
 on
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, 	eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 ming.qian@oss.nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Tue, 22 Apr 2025 15:46:57 -0400
In-Reply-To: <20240719075007.384342-1-ming.qian@nxp.com>
References: <20240719075007.384342-1-ming.qian@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi,

Le vendredi 19 juillet 2024 =C3=A0 16:50 +0900, Ming Qian a =C3=A9crit=C2=
=A0:
> Start the decoding job when both queue are on, except the for the
> initialization sequence.
>=20
> Especially when seeking, the capture streamon may be called after output
> streamon, driver will start to decode job immediately after output
> streamo, if seek to a new resolution, then the source change flow may be
> mixed with the seek, it will cause confusion, then may led to pipeline
> hang.
>=20
> When both output and capture queue are on, it's ready to start the
> decoding job, and it can avoid the above potential problem.

This commit message needs some work and I'm unsure I understand its
meaning. After reading the change, I am under the impression that you
simply say that once the seq_hdr is found, the driver should keep
delaying the processing of output buffer until the capture queue is
ready ?

>=20
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> ---
> =C2=A0drivers/media/platform/amphion/vdec.c | 18 +++++++++++++++++-
> =C2=A01 file changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platfo=
rm/amphion/vdec.c
> index 6a38a0fa0e2d..ca8f7319503a 100644
> --- a/drivers/media/platform/amphion/vdec.c
> +++ b/drivers/media/platform/amphion/vdec.c
> @@ -1363,6 +1363,12 @@ static int vdec_process_output(struct vpu_inst *in=
st, struct vb2_buffer *vb)
> =C2=A0	if (inst->state =3D=3D VPU_CODEC_STATE_STARTED)
> =C2=A0		vdec_update_state(inst, VPU_CODEC_STATE_ACTIVE, 0);
> =C2=A0
> +	if (vdec->seq_hdr_found &&
> +	=C2=A0=C2=A0=C2=A0 !vb2_start_streaming_called((v4l2_m2m_get_dst_vq(ins=
t->fh.m2m_ctx)))) {
> +		vpu_trace(inst->dev, "[%d] capture is not ready, pend input frame\n", =
inst->id);
> +		return -EINVAL;

I got really confused by this error return value. Its clearly not an
error, but just a delay. I think before we add more on top, you should
turn all these function for which the return value is unused to void.
And use a plain "return;" here. That applies to all similar ops.

> +	}
> +
> =C2=A0	ret =3D vpu_iface_get_stream_buffer_desc(inst, &desc);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> @@ -1555,6 +1561,16 @@ static int vdec_start(struct vpu_inst *inst)
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +static void vdec_enqueue_pending_frames(struct vpu_inst *inst)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < v4l2_m2m_num_src_bufs_ready(inst->fh.m2m_ctx); i++) {
> +		if (vpu_process_output_buffer(inst))
> +			break;

How well does this work ? Previous you made good care of interleaving
the processing output and capture, which I could imaging prevents the
hardware from starving ?

> +	}
> +}
> +
> =C2=A0static int vdec_start_session(struct vpu_inst *inst, u32 type)
> =C2=A0{
> =C2=A0	struct vdec_t *vdec =3D inst->priv;
> @@ -1573,10 +1589,10 @@ static int vdec_start_session(struct vpu_inst *in=
st, u32 type)
> =C2=A0	if (V4L2_TYPE_IS_OUTPUT(type)) {
> =C2=A0		vdec_update_state(inst, vdec->state, 1);
> =C2=A0		vdec->eos_received =3D 0;
> -		vpu_process_output_buffer(inst);
> =C2=A0	} else {
> =C2=A0		vdec_cmd_start(inst);
> =C2=A0	}
> +	vdec_enqueue_pending_frames(inst);

Was this intentional to reverse the STREAMON(CAPTURE) call flow to:

  - process_capture() (inside vdec_cmd_start())
  - proces_output() x n

Nicolas

> =C2=A0	if (inst->state =3D=3D VPU_CODEC_STATE_ACTIVE)
> =C2=A0		vdec_response_fs_request(inst, false);
> =C2=A0

