Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566844A04
	for <imx@lists.linux.dev>; Mon,  6 Jan 2025 22:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736201817; cv=none; b=DnRvktwxkgsnUcQ/qxcQmABqPArfBSkZLDW2qA8mgu9bQZ/z2N2cGXwZdTfN7SaGKypX24HwrYbSCvm6Pc76D2XnkiuZM+tlxfrXw+kVTHcMR1mlxe3gbgPoi0LjsibQc09kJWVp7TzXPv0BP3f3tesB1wzuT1E12H11S4txRpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736201817; c=relaxed/simple;
	bh=uJoQ0VAGlfyNJz06xkKxvmBToLcte81JyTpjF5zZu1M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SHc8cVWwJd4gRc5dG+xbXjesEpNjEhrtgHp+2SryTcU7bKi9a0nfLe6nh7gCGvcyl1Pc2hmCHMqgfXlRO29lvCT7dF+nkMxCAKjEh4cR4A0zD3aTSCeBIU/TlwnVcWh1lfgUwT9pFA5A0o4LA5qpOBuqecBdhMYs+tiCSdCiN7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=bxChGPP8; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="bxChGPP8"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d8f916b40bso195732026d6.3
        for <imx@lists.linux.dev>; Mon, 06 Jan 2025 14:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736201814; x=1736806614; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MKTyGHq16tbtZ727IbGG7iAWKjSMFE0JRUn0L2vZOLI=;
        b=bxChGPP84mJxm+7FqObDgTvz8PkZ6oPVfIEfUnbOUuM6EQMooXs/3fqUtH8LuhBpVW
         R2ChsF5FCHG6rtjTTYW55NvfhgOWiNHRzVTh/RwuKzMARTol+kmElWNtpAzv81Z9mici
         wg3ZO5jpf3veekeZYeLfvbaAiPAOs9+cZxcTUX5x2sBPGGWaXU2I/lYUqx9L5SrUenOZ
         RFQJXnJeszVk8v62Js9P0Y7v702ugxGKxGmVj2oBzNQ6IWC/OcB+bQZYY3F2c/qOa/lt
         K7l6jsT/WSSoYHE2Bu6U0KfgvItPQfBdrOWw/IPn3EA9//riB/JWJ8J8xXeRewJkR660
         0d1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736201814; x=1736806614;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MKTyGHq16tbtZ727IbGG7iAWKjSMFE0JRUn0L2vZOLI=;
        b=fVkhinna2n0PwW+tK/o2/wYzqEUPRLDBc6uHqCOxw60WMpyK6UXo7G+IlBWAAgdK1Q
         ObzbydDWLCBOTe4/ddeUrP8oat6UBZpr3xEN1Nwl01i4q3KX+RG5YL5M5JLFgAhoQqR9
         ptdfLb6NWh7KyweCYD4TKTPpdG/h7tYYz4ZQo6b8co+Dny4/bWFclkjYlXvc2ETxuF5L
         b9p3UyLchk1uE27y91pCNuT7deJvXbhqbXRrJaVR5O59uQhTugNxrcV6iMss1xlWRDZb
         mdlS8Uj+u3gwzi2msN6Nl2oTcxj5+9CBjyOEQ0K6Yba7fKvOL+VEqbs+LuajfoJyIdau
         uofQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLGGv5LMRGMNNmZ+ejTvpRynTMhEpucj1bNWkapnKmppnO/BiAs93OulBk9jBuA4kJTf4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0ATe6SzLnGPD123OahfuI+OB37y0ffw9pQRGplsd1MXrDUF6Y
	TS4A3To4BxCe9E3l11a5OSXO+JraKMi+N4fa4+u6lObuf662jDlHeAJ/qVy7LBQ=
X-Gm-Gg: ASbGnctvSCOtbonOxuK55V+HAEChrMD9lzAhKCLxaFKE9AVENsx7yWckk+gY6b9OC/a
	0ScLhoqXmDgodmm7fspl92pSVeJew5pOyChh0OiSi2KBGj2wEEWlAu9S0MXm69NgSesKVs/URwx
	rguGrQP/AzNil+jat8XVR5f4IuQZYILbCnyA6pr8MeeQaXZYV4sOCE8db1zGefNsX41ywy1pAOt
	N7SMayyiJjNd/y0fAIpgRUCnxzZd/+xF8nJ7qYGoXUTz1JkbGxk1sFfPA==
X-Google-Smtp-Source: AGHT+IFBCd5sFXzWy1gcNmqfDzYVOs8lG40yFCqGt0rSh5Hxou3JAyyvVXilB2wQl4wInH3b+m+z+Q==
X-Received: by 2002:ad4:5cc6:0:b0:6d4:e0a:230e with SMTP id 6a1803df08f44-6dd23337823mr949624936d6.16.1736201814187;
        Mon, 06 Jan 2025 14:16:54 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac2bd0b9sm1541514285a.23.2025.01.06.14.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 14:16:53 -0800 (PST)
Message-ID: <86d9eb915432c6b070f7c7f524973e9a363de76e.camel@ndufresne.ca>
Subject: Re: [PATCH 1/2] media: amphion: Support display delay for Hevc
 format
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ming Qian <ming.qian@oss.nxp.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, 	eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Mon, 06 Jan 2025 17:16:52 -0500
In-Reply-To: <20241219015146.706482-1-ming.qian@oss.nxp.com>
References: <20241219015146.706482-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi,

nit: use capital HEVC in the subject

Le jeudi 19 d=C3=A9cembre 2024 =C3=A0 10:51 +0900, Ming Qian a =C3=A9crit=
=C2=A0:
> The amphion decoder firmware v1.9.0 supports display delay 0 for
> hevc format, then driver can enable this feature.

nit: HEVC

I think this added "feature" hides a bug you haven't fixed in this patch.


        v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
                          V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE,
                          0, 1, 1, 0);

With the control registered this way, 0 is the default, and the range of 0-=
1.
But from your commit message, this is only supported from firmware 1.9.0 an=
d up.
I think the patch should basically adjust the min and def values according =
to
the detected firmware version.

This might actually be more complex, aka per CODEC, and for that you may wa=
nt to
use v4l2_ctrl_config structure.

Nicolas


> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
>  drivers/media/platform/amphion/vpu_malone.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/=
platform/amphion/vpu_malone.c
> index 5c6b2a841b6f..8f4aa48b2d65 100644
> --- a/drivers/media/platform/amphion/vpu_malone.c
> +++ b/drivers/media/platform/amphion/vpu_malone.c
> @@ -332,6 +332,8 @@ struct vpu_dec_ctrl {
>  	u32 buf_addr[VID_API_NUM_STREAMS];
>  };
> =20
> +static const struct malone_padding_scode *get_padding_scode(u32 type, u3=
2 fmt);
> +
>  u32 vpu_malone_get_data_size(void)
>  {
>  	return sizeof(struct vpu_dec_ctrl);
> @@ -654,8 +656,10 @@ static int vpu_malone_set_params(struct vpu_shared_a=
ddr *shared,
>  		hc->jpg[instance].jpg_mjpeg_interlaced =3D 0;
>  	}
> =20
> -	hc->codec_param[instance].disp_imm =3D params->display_delay_enable ? 1=
 : 0;
> -	if (malone_format !=3D MALONE_FMT_AVC)
> +	if (params->display_delay_enable &&
> +	    get_padding_scode(SCODE_PADDING_BUFFLUSH, params->codec_format))
> +		hc->codec_param[instance].disp_imm =3D 1;
> +	else
>  		hc->codec_param[instance].disp_imm =3D 0;
>  	hc->codec_param[instance].dbglog_enable =3D 0;
>  	iface->dbglog_desc.level =3D 0;
> @@ -1024,6 +1028,7 @@ static const struct malone_padding_scode padding_sc=
odes[] =3D {
>  	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_JPEG,        {0x0, 0x0}},
>  	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264,        {0x15010000, 0x0}},
>  	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264_MVC,    {0x15010000, 0x0}},
> +	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_HEVC,        {0x3e010000, 0x20}},
>  };
> =20
>  static const struct malone_padding_scode padding_scode_dft =3D {0x0, 0x0=
};
> @@ -1058,8 +1063,11 @@ static int vpu_malone_add_padding_scode(struct vpu=
_buffer *stream_buffer,
>  	int ret;
> =20
>  	ps =3D get_padding_scode(scode_type, pixelformat);
> -	if (!ps)
> +	if (!ps) {
> +		if (scode_type =3D=3D SCODE_PADDING_BUFFLUSH)
> +			return 0;
>  		return -EINVAL;
> +	}
> =20
>  	wptr =3D readl(&str_buf->wptr);
>  	if (wptr < stream_buffer->phys || wptr > stream_buffer->phys + stream_b=
uffer->length)

