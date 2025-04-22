Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BA617BED0
	for <imx@lists.linux.dev>; Tue, 22 Apr 2025 20:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745352932; cv=none; b=E1D7FgGZ81/U5ySvPUk9O/b+ZwUatNRx0o/L09mguW0onwxnlJyEBgp/5UfN3Uyr3xzFm8uYf/X6UTku1siMimy2Y62nBSy4CXNLYIAMNymTfLx706W+iBBSzXHx7Dj9SkOMRjJVvpjR1Le2EYQf7yNBchwMxTIVwPdCEqY0A20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745352932; c=relaxed/simple;
	bh=wNORhVYlgTJse9QfgWQWMbFqYMq1ZPqAa96KFCBdsj8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lw0NWAqhiDJWl6eNMdrHBxGwkis/sEJOB0cGVX95SgcVmdMsoy5OF+JKv9+ScVgRoDYXAn5hlTM6Iqz5U3JHvnHuV9KT5NtWupyNDtrN5os36kF97H0UyCu3wo8pvjQPUoEvX+LU9GJV8uhU/ALXjR9TCqB99c0HMtUTt0qIVvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=rmFzv/un; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="rmFzv/un"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c081915cf3so768966485a.1
        for <imx@lists.linux.dev>; Tue, 22 Apr 2025 13:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745352928; x=1745957728; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FfIoYR2Hk8OscvFDt1woJsVwZTyVIxPWRqw5VTDHqxU=;
        b=rmFzv/undSNtvME67dRYtIzW7UywOap2E+a3cOeWULEQMrs3/25Hr9o4akqY27Nez4
         EPT0elxciC9husngR5TixFkprPWMpV90sECBIKXlZhI6Ggf0T+hpXm1qCTlhmfYfqeIE
         ZiOOHSRbYe2m2YQco55ey3JVLHzwQfCZBZFhYim5HCwmZtpSBW3oWJdX4aAYDfk7I/QG
         Q/+VS8wAJTHtg5zn2BZ8N/kf0NTvKO3i5Hod1dBzYwvQVGBe0MYCCQiFsBY3OyNaDLjL
         jNo7L9jkJDJt14i5m7sfRMl9RDo+vPFu8pbBBk0t6pSqVM1iRviHLihzrf2pFmsBZB09
         Eihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745352928; x=1745957728;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FfIoYR2Hk8OscvFDt1woJsVwZTyVIxPWRqw5VTDHqxU=;
        b=sP4BLqdrFSO7j9O8jDh488UsMR493Ie6e22YYOe5TKPOXcMqifDXoolNVOruANKI+x
         9TuMzHaSjwA1Ld1NhmH/qOY1ayiupKK41v2DZC1IsvMg0+c368gumYQRzWjYqxx3T/nB
         YeZWRNdTCvdva2exrya3wHe5Q+a0HHJoEBqKF2VLQY0QBfsYSTE69+/6NqY1GQVBrnyu
         BBYW8YqLZrZuC7wSexAzIzPQ528gu+r4gMuWSvwItiaN6HMubgZseQHofK8h3IKYRwTO
         bL5GUe3jcOn5U1O4n+VpRvqAKFtks/Bcd/DZKZ3yY2ynYhXt5wTKJjCU+GtGDIn/INZb
         PAWg==
X-Forwarded-Encrypted: i=1; AJvYcCWQfmpVA2JbMJLHGuMdoSpVtMHubrmMAzG3QLGoclgx/aIxE7lKl2FrSHlUqIiRczywOEk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyesSKatJLx2PYmekgc711kG3+eidyCY4EgCqtch4j3pX8/dN2i
	EtDMmjz4xvCqz9FXcHBLwL4Ip0rf/jXrdPYvNvfX9UyVffXXPWrnIERnQ3BOkS8=
X-Gm-Gg: ASbGncuxSevvLCdL84CwprvalGmi1+FqviLGJE534BGgj9r5be5Zjxt+nUoZxwDxIEU
	HGBkv0rADWNGpu+dssKdFi9LmrQumGUMzAMeSEcPQawvSZrlcU2iQczTs8uTIqwHZSoUt2tsWpW
	g27KV1Ik60PT34h1LEnPJ5SWjqyrzv81OxjkhPurpQ8m1S9Fzq98ZwtVKOFihgYlGsqc/LKc7Lt
	g3rWtfHdtqPehYMAHlh4pvGJlvx+VI6dUxIKSrI9fiYEFqpK8rRr/SoK+mTi+0qzDHqcPJKc/Xm
	plsqPY4tMRQwfKvBKgBTzoVbMgufjcOZMJP4K0c6YOvC4a6vos0pTL/r
X-Google-Smtp-Source: AGHT+IE5UyDb3sP+B1E0k8WlUIn5epHst96b+MCPIWCRdWJrnaIbCMq4o4Z31SsOW5ok7mHv5BAPog==
X-Received: by 2002:a05:620a:1a07:b0:7c7:827b:46bf with SMTP id af79cd13be357-7c928015f8dmr2301315685a.39.1745352928409;
        Tue, 22 Apr 2025 13:15:28 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b6e198sm590055985a.103.2025.04.22.13.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 13:15:27 -0700 (PDT)
Message-ID: <74eb0589ae54855db1d2024591d501989e30027a.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: amphion: Add H264 and HEVC profile and level
 control
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ming Qian <ming.qian@oss.nxp.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, 	eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Tue, 22 Apr 2025 16:15:25 -0400
In-Reply-To: <20241210093337.3779686-1-ming.qian@oss.nxp.com>
References: <20241210093337.3779686-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Ming,

Le mardi 10 d=C3=A9cembre 2024 =C3=A0 18:33 +0900, Ming Qian a =C3=A9crit=
=C2=A0:
> From: Ming Qian <ming.qian@nxp.com>
>=20
> For format H264 and HEVC, the firmware can report the parsed profile idc
> and level idc to driver, the information may be useful.
> Implement the H264 and HEVC profile and level control to report them.
>=20
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> ---
> v2
> -- add support for V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE
>=20
> =C2=A0drivers/media/platform/amphion/vdec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 61 +++++++++++++
> =C2=A0drivers/media/platform/amphion/vpu_defs.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 1 +
> =C2=A0drivers/media/platform/amphion/vpu_helpers.c | 93 +++++++++++++++++=
+++
> =C2=A0drivers/media/platform/amphion/vpu_helpers.h |=C2=A0 5 ++
> =C2=A0drivers/media/platform/amphion/vpu_malone.c=C2=A0 |=C2=A0 3 +-
> =C2=A05 files changed, 162 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platfo=
rm/amphion/vdec.c
> index ca8f7319503a..61d5598ee6a1 100644
> --- a/drivers/media/platform/amphion/vdec.c
> +++ b/drivers/media/platform/amphion/vdec.c
> @@ -232,6 +232,37 @@ static int vdec_ctrl_init(struct vpu_inst *inst)
> =C2=A0			=C2=A0 V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE,
> =C2=A0			=C2=A0 0, 1, 1, 0);
> =C2=A0
> +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_H264_PROFILE=
,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_MUL=
TIVIEW_HIGH,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ~((1 << V4L2_MPEG_VIDEO_H264_PRO=
FILE_BASELINE) |
> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |

You've added it here, but you will never report it, see my comment
below.

> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED) |
> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH) |
> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH)),

Shall we advertise multiview and stereo ? My impression is that we lack
a mechanism to actually signal the stereo layout, or which view each
buffers came from. I'm thinking, you can can't test it, we should just
fail on these ?

> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_BAS=
ELINE);
> +
> +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_H264_LEVEL,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
> +
> +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_HEVC_PROFILE=
,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PROFILE_MAI=
N_10,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ~((1 << V4L2_MPEG_VIDEO_HEVC_PRO=
FILE_MAIN) |
> +				 (1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10)),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PROFILE_MAI=
N);
> +
> +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_4);
> +
> =C2=A0	ctrl =3D v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
> =C2=A0				 V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 2);
> =C2=A0	if (ctrl)
> @@ -1166,6 +1197,35 @@ static void vdec_clear_slots(struct vpu_inst *inst=
)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +static void vdec_update_v4l2_ctrl(struct vpu_inst *inst, u32 id, u32 val=
)
> +{
> +	struct v4l2_ctrl *ctrl =3D v4l2_ctrl_find(&inst->ctrl_handler, id);
> +
> +	if (ctrl)
> +		v4l2_ctrl_s_ctrl(ctrl, val);
> +}
> +
> +static void vdec_update_v4l2_profile_level(struct vpu_inst *inst, struct=
 vpu_dec_codec_info *hdr)
> +{
> +	switch (inst->out_format.pixfmt) {
> +	case V4L2_PIX_FMT_H264:
> +	case V4L2_PIX_FMT_H264_MVC:
> +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_h264_v4l2_profile(hdr->profil=
e_idc));
> +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_LEVEL,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_h264_v4l2_level(hdr->level_id=
c));
> +		break;
> +	case V4L2_PIX_FMT_HEVC:
> +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_hevc_v4l2_profile(hdr->profil=
e_idc));
> +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_hevc_v4l2_level(hdr->level_id=
c));
> +		break;
> +	default:
> +		return;
> +	}
> +}
> +
> =C2=A0static void vdec_event_seq_hdr(struct vpu_inst *inst, struct vpu_de=
c_codec_info *hdr)
> =C2=A0{
> =C2=A0	struct vdec_t *vdec =3D inst->priv;
> @@ -1189,6 +1249,7 @@ static void vdec_event_seq_hdr(struct vpu_inst *ins=
t, struct vpu_dec_codec_info
> =C2=A0	vdec_init_crop(inst);
> =C2=A0	vdec_init_mbi(inst);
> =C2=A0	vdec_init_dcp(inst);
> +	vdec_update_v4l2_profile_level(inst, hdr);
> =C2=A0	if (!vdec->seq_hdr_found) {
> =C2=A0		vdec->seq_tag =3D vdec->codec_info.tag;
> =C2=A0		if (vdec->is_source_changed) {
> diff --git a/drivers/media/platform/amphion/vpu_defs.h b/drivers/media/pl=
atform/amphion/vpu_defs.h
> index 428d988cf2f7..606f9d61a265 100644
> --- a/drivers/media/platform/amphion/vpu_defs.h
> +++ b/drivers/media/platform/amphion/vpu_defs.h
> @@ -134,6 +134,7 @@ struct vpu_dec_codec_info {
> =C2=A0	u32 decoded_height;
> =C2=A0	struct v4l2_fract frame_rate;
> =C2=A0	u32 dsp_asp_ratio;
> +	u32 profile_idc;
> =C2=A0	u32 level_idc;
> =C2=A0	u32 bit_depth_luma;
> =C2=A0	u32 bit_depth_chroma;
> diff --git a/drivers/media/platform/amphion/vpu_helpers.c b/drivers/media=
/platform/amphion/vpu_helpers.c
> index d12310af9ebc..108b75ceb4ae 100644
> --- a/drivers/media/platform/amphion/vpu_helpers.c
> +++ b/drivers/media/platform/amphion/vpu_helpers.c
> @@ -509,3 +509,96 @@ const char *vpu_codec_state_name(enum vpu_codec_stat=
e state)
> =C2=A0	}
> =C2=A0	return "<unknown>";
> =C2=A0}
> +
> +struct codec_id_mapping {
> +	u32 id;
> +	u32 v4l2_id;
> +};
> +
> +static struct codec_id_mapping h264_profiles[] =3D {
> +	{66,=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE},
> +	{77,=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_MAIN},
> +	{88,=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED},
> +	{100, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH},
> +	{118, V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH},
> +	{128, V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH}
> +};
> +
> +static struct codec_id_mapping h264_levels[] =3D {
> +	{10,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_0},
> +	{9,=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1B},
> +	{11,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_1},
> +	{12,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_2},
> +	{13,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_3},
> +	{20,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_2_0},
> +	{21,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_2_1},
> +	{22,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_2_2},
> +	{30,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_3_0},
> +	{31,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_3_1},
> +	{32,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_3_2},
> +	{40,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_4_0},
> +	{41,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_4_1},
> +	{42,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_4_2},
> +	{50,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_5_0},
> +	{51,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_5_1},
> +	{52,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_5_2},
> +	{60,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_6_0},
> +	{61,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_6_1},
> +	{62,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_6_2}
> +};
> +
> +static struct codec_id_mapping hevc_profiles[] =3D {
> +	{1,=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN},
> +	{2,=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10}
> +};
> +
> +static struct codec_id_mapping hevc_levels[] =3D {
> +	{30,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_1},
> +	{60,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_2},
> +	{63,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1},
> +	{90,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_3},
> +	{93,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1},
> +	{120, V4L2_MPEG_VIDEO_HEVC_LEVEL_4},
> +	{123, V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1},
> +	{150, V4L2_MPEG_VIDEO_HEVC_LEVEL_5},
> +	{153, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1},
> +	{156, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2},
> +	{180, V4L2_MPEG_VIDEO_HEVC_LEVEL_6},
> +	{183, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1},
> +	{186, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2}
> +};
> +
> +static u32 vpu_find_v4l2_id(u32 id, struct codec_id_mapping *array, u32 =
array_sz)
> +{
> +	u32 i;
> +
> +	if (!array || !array_sz)
> +		return 0;
> +
> +	for (i =3D 0; i < array_sz; i++) {
> +		if (id =3D=3D array[i].id)
> +			return array[i].v4l2_id;
> +	}
> +
> +	return 0;
> +}
> +
> +u32 vpu_get_h264_v4l2_profile(u32 idc)
> +{
> +	return vpu_find_v4l2_id(idc, h264_profiles, ARRAY_SIZE(h264_profiles));
> +}
> +
> +u32 vpu_get_h264_v4l2_level(u32 idc)
> +{
> +	return vpu_find_v4l2_id(idc, h264_levels, ARRAY_SIZE(h264_levels));
> +}
> +
> +u32 vpu_get_hevc_v4l2_profile(u32 idc)
> +{
> +	return vpu_find_v4l2_id(idc, hevc_profiles, ARRAY_SIZE(hevc_profiles));
> +}
> +
> +u32 vpu_get_hevc_v4l2_level(u32 idc)
> +{
> +	return vpu_find_v4l2_id(idc, hevc_levels, ARRAY_SIZE(hevc_levels));
> +}
> diff --git a/drivers/media/platform/amphion/vpu_helpers.h b/drivers/media=
/platform/amphion/vpu_helpers.h
> index 0eaddb07190d..dc5fb1ca2d33 100644
> --- a/drivers/media/platform/amphion/vpu_helpers.h
> +++ b/drivers/media/platform/amphion/vpu_helpers.h
> @@ -70,4 +70,9 @@ int vpu_color_get_default(u32 primaries, u32 *ptransfer=
s, u32 *pmatrix, u32 *pfu
> =C2=A0
> =C2=A0int vpu_find_dst_by_src(struct vpu_pair *pairs, u32 cnt, u32 src);
> =C2=A0int vpu_find_src_by_dst(struct vpu_pair *pairs, u32 cnt, u32 dst);
> +
> +u32 vpu_get_h264_v4l2_profile(u32 idc);
> +u32 vpu_get_h264_v4l2_level(u32 idc);
> +u32 vpu_get_hevc_v4l2_profile(u32 idc);
> +u32 vpu_get_hevc_v4l2_level(u32 idc);
> =C2=A0#endif
> diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/=
platform/amphion/vpu_malone.c
> index 4769c053c6c2..5c6b2a841b6f 100644
> --- a/drivers/media/platform/amphion/vpu_malone.c
> +++ b/drivers/media/platform/amphion/vpu_malone.c
> @@ -889,7 +889,8 @@ static void vpu_malone_unpack_seq_hdr(struct vpu_rpc_=
event *pkt,
> =C2=A0	info->frame_rate.numerator =3D 1000;
> =C2=A0	info->frame_rate.denominator =3D pkt->data[8];
> =C2=A0	info->dsp_asp_ratio =3D pkt->data[9];
> -	info->level_idc =3D pkt->data[10];
> +	info->profile_idc =3D (pkt->data[10] >> 8) & 0xff;

The data should normally also include the sps_constraint_set1_flag,
which differentiate baseline from constrained-baseline. I would also be
very surprised if the decoders supports ASO/FMO.

Nicolas

> +	info->level_idc =3D pkt->data[10] & 0xff;
> =C2=A0	info->bit_depth_luma =3D pkt->data[13];
> =C2=A0	info->bit_depth_chroma =3D pkt->data[14];
> =C2=A0	info->chroma_fmt =3D pkt->data[15];
