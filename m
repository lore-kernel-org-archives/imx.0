Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951019;
	b=WAtkFGlV2iltILnDP0HVIrCSHe2JwnONLBaoPD+K+AV4GEFR0LR6HZmSQvbbQDIWhON/
	 9NvAqxowAsoFdOrpYrO6bwaG/nYW9Y74ihVTlgJljevIEygi3KpYOl1kq/TG/dBxAzawH
	 jCyxGd1srbEZ6H0GNqt38kUwwj67xgg0LFRcjNvX1+YRgGlVDkGfKmIZgmCjJuksRI9ox
	 P50EJm6MYrqjUkWKAY6b5mYz6QtkrMj7fsI/NPuGhOF/tL3bYhYRlr0QqgBW+EsfEsJQ1
	 nSRZpRl90NlkgXGpKOOSZYVkakqnvaODPO0jif7Uqp3ArReXgB0pCW1GT7kRYWVoq9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951019;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=1OiGkRU0cDSw8p5HzufjcDuCRJXHBz8bqybKLzavlng=;
	b=CO/LQ6SNTglUN/bPIt9ZLiF8WokLnbppSdd/f82io+XVasLmov9T32gzqKiLFNZfK/aa
	 0kf1k4U18x8n8fiIpzEALm3PMbNd01skeNqaa2dhbX8a0G5H6HlxRDgMLztb/cCzcsk76
	 3GtjSWpSwf5fakSYx3Os+rVh5GSNvWMTbonNgU4A97ZCltXCsud6Y43FQ0m3jIqpMYQVt
	 +fnF0mnt1+CXCWODkFJ3qYWDZdgq3SLSz8YM4kbBHXziBmTzVEZieCz535KeYJglQTNTs
	 FI4CpHOfDQLKBwCdkWLYZHRHV2E0q5CiV4n7vvCY76wr948luY1iaktS4snJiB0GUjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=I4tMIksr;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02DB606A32C
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 21:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B02DB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=I4tMIksr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794951015;
	bh=VT3Hiu+RNn1MMNT9IiX/G0AxSztSwjtS3pUJpZOQnDI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=I4tMIksrS92/CeGx1jYL2cphB0NumRf/t0CNClGVtVkMjhJp/Y6dxc+rvItFkbsOW
	 6PgSNuiSMIwN80WBkQ5GZhUFmgiB8lG+r0XOuZm7hiZVJJ6qs6k1K1LaMd/wOTEqfC
	 agfvUfLwnQpJkL1TgWiakOWSbNWz0jP0tmty0BThhCP0To6BhNpEldwRUl379WTd3w
	 94NhAEb1zwx3Cqz//XR4HSogciHwwPNQ392bzl701BL8g4tZVMVCpWC4qcCj1917og
	 /G43mN+9nfEEkA1R/1K9u10nMSRhX2N5tYzV5vsU3CYtjLdUkrG8/PvJC0bPzhX7Hd
	 RiZ5aK/aOJ+Sw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BC8C017E06BF;
	Tue, 17 Nov 2026 22:30:13 +0100 (CET)
Message-ID: <1a1feaf854e6e1c34af468b7501988f2cf68ebca.camel@collabora.com>
Subject: Re: [PATCH 02/14] media: uapi: Add H.264 stateless encode support
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,  Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil	
 <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, Michael
 Tretter	 <m.tretter@pengutronix.de>
Date: Tue, 17 Nov 2026 16:30:11 -0500
In-Reply-To: <20260522101653.2565125-3-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
	 <20260522101653.2565125-3-paulk@sys-base.io>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-/fZMDlE7IzlEjztDt+D/"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

--=-/fZMDlE7IzlEjztDt+D/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 22 mai 2026 =C3=A0 12:16 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> This introduces the stateless H.264 encode params control that allows
> configuring an H.264 encode run.
>=20
> Note that the current uAPI does not support explicit passing of
> references and works following the sliding window decoded reference
> picture marking process. This may change in the future.

Since its no longer an RFC, you have to support this with a how it can chan=
ge in
the future without breaking the API. Its fine to create a entry profile for
encoders of course, we need a plan though.

>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 62 +++++++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c |  4 ++
>  include/media/v4l2-ctrls.h                |  2 +
>  include/uapi/linux/v4l2-controls.h        | 33 ++++++++++++
>  include/uapi/linux/videodev2.h            |  1 +
>  5 files changed, 102 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index 85d07ef44f62..48217811b0f1 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -382,6 +382,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ct=
rl)
>  =09case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
>  =09=09pr_cont("H264_PRED_WEIGHTS");
>  =09=09break;
> +=09case V4L2_CTRL_TYPE_H264_ENCODE_PARAMS:
> +=09=09pr_cont("H264_ENCODE_PARAMS");
> +=09=09break;
>  =09case V4L2_CTRL_TYPE_FWHT_PARAMS:
>  =09=09pr_cont("FWHT_PARAMS");
>  =09=09break;
> @@ -880,6 +883,7 @@ static int std_validate_compound(const struct v4l2_ct=
rl *ctrl, u32 idx,
>  =09struct v4l2_ctrl_h264_pred_weights *p_h264_pred_weights;
>  =09struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
>  =09struct v4l2_ctrl_h264_decode_params *p_h264_dec_params;
> +=09struct v4l2_ctrl_h264_encode_params *p_h264_enc_params;
>  =09struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>  =09struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>  =09struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
> @@ -1102,6 +1106,61 @@ static int std_validate_compound(const struct v4l2=
_ctrl *ctrl, u32 idx,
>  =09=09zero_reserved(*p_h264_dec_params);
>  =09=09break;
> =20
> +=09case V4L2_CTRL_TYPE_H264_ENCODE_PARAMS:
> +=09=09p_h264_enc_params =3D p;
> +
> +=09=09if (p_h264_enc_params->slice_type !=3D V4L2_H264_SLICE_TYPE_B)
> +=09=09=09p_h264_enc_params->flags &=3D
> +=09=09=09=09~V4L2_H264_ENCODE_FLAG_DIRECT_SPATIAL_MV_PRED;
> +=09=09if (!(p_h264_enc_params->flags & V4L2_H264_ENCODE_FLAG_IDR_PIC) ||
> +=09=09    !p_h264_enc_params->nal_ref_idc)
> +=09=09=09p_h264_enc_params->flags &=3D
> +=09=09=09=09~V4L2_H264_ENCODE_FLAG_LONG_TERM_REFERENCE;
> +
> +=09=09if (p_h264_enc_params->flags & V4L2_H264_ENCODE_FLAG_IDR_PIC &&
> +=09=09    p_h264_enc_params->slice_type !=3D V4L2_H264_SLICE_TYPE_I)
> +=09=09=09return -EINVAL;
> +=09=09if (p_h264_enc_params->colour_plane_id > 2)
> +=09=09=09return -EINVAL;
> +=09=09if (p_h264_enc_params->cabac_init_idc > 2)
> +=09=09=09return -EINVAL;
> +=09=09if (p_h264_enc_params->disable_deblocking_filter_idc > 2)
> +=09=09=09return -EINVAL;
> +=09=09if (p_h264_enc_params->slice_alpha_c0_offset_div2 < -6 ||
> +=09=09    p_h264_enc_params->slice_alpha_c0_offset_div2 > 6)
> +=09=09=09return -EINVAL;
> +=09=09if (p_h264_enc_params->slice_beta_offset_div2 < -6 ||
> +=09=09    p_h264_enc_params->slice_beta_offset_div2 > 6)
> +=09=09=09return -EINVAL;
> +
> +=09=09if (p_h264_enc_params->slice_type =3D=3D V4L2_H264_SLICE_TYPE_I ||
> +=09=09    p_h264_enc_params->slice_type =3D=3D V4L2_H264_SLICE_TYPE_SI)
> +=09=09=09p_h264_enc_params->num_ref_idx_l0_active_minus1 =3D 0;
> +=09=09if (p_h264_enc_params->slice_type !=3D V4L2_H264_SLICE_TYPE_B)
> +=09=09=09p_h264_enc_params->num_ref_idx_l1_active_minus1 =3D 0;
> +
> +=09=09if (p_h264_enc_params->flags & V4L2_H264_ENCODE_FLAG_IDR_PIC) {
> +=09=09=09p_h264_enc_params->frame_num =3D 0;
> +=09=09=09p_h264_enc_params->pic_order_cnt_lsb =3D 0;
> +=09=09=09p_h264_enc_params->delta_pic_order_cnt_bottom =3D 0;
> +=09=09=09p_h264_enc_params->delta_pic_order_cnt0 =3D 0;
> +=09=09=09p_h264_enc_params->delta_pic_order_cnt1 =3D 0;
> +=09=09} else {
> +=09=09=09p_h264_enc_params->idr_pic_id =3D 0;
> +=09=09}
> +
> +=09=09if (p_h264_enc_params->num_ref_idx_l0_active_minus1 >
> +=09=09    (V4L2_H264_REF_LIST_LEN - 1))
> +=09=09=09return -EINVAL;
> +=09=09if (p_h264_enc_params->num_ref_idx_l1_active_minus1 >
> +=09=09    (V4L2_H264_REF_LIST_LEN - 1))
> +=09=09=09return -EINVAL;
> +=09=09memset(&p_h264_enc_params->reserved0, 0,
> +=09=09       sizeof(p_h264_enc_params->reserved0));
> +=09=09memset(&p_h264_enc_params->reserved1, 0,
> +=09=09       sizeof(p_h264_enc_params->reserved1));
> +=09=09break;
> +
>  =09case V4L2_CTRL_TYPE_VP8_FRAME:
>  =09=09p_vp8_frame =3D p;
> =20
> @@ -1913,6 +1972,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_=
ctrl_handler *hdl,
>  =09case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
>  =09=09elem_size =3D sizeof(struct v4l2_ctrl_h264_pred_weights);
>  =09=09break;
> +=09case V4L2_CTRL_TYPE_H264_ENCODE_PARAMS:
> +=09=09elem_size =3D sizeof(struct v4l2_ctrl_h264_encode_params);
> +=09=09break;
>  =09case V4L2_CTRL_TYPE_VP8_FRAME:
>  =09=09elem_size =3D sizeof(struct v4l2_ctrl_vp8_frame);
>  =09=09break;
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4=
l2-core/v4l2-ctrls-defs.c
> index ad41f65374e2..4fa6dc7a3b00 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1216,6 +1216,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  =09case V4L2_CID_STATELESS_H264_PPS:=09=09=09return "H264 Picture Parame=
ter Set";
>  =09case V4L2_CID_STATELESS_H264_SCALING_MATRIX:=09=09return "H264 Scalin=
g Matrix";
>  =09case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:=09=09return "H264 Predicti=
on Weight Table";
> +=09case V4L2_CID_STATELESS_H264_ENCODE_PARAMS:=09=09return "H264 Encode =
Parameters";
>  =09case V4L2_CID_STATELESS_H264_SLICE_PARAMS:=09=09return "H264 Slice Pa=
rameters";
>  =09case V4L2_CID_STATELESS_H264_DECODE_PARAMS:=09=09return "H264 Decode =
Parameters";
>  =09case V4L2_CID_STATELESS_FWHT_PARAMS:=09=09=09return "FWHT Stateless P=
arameters";
> @@ -1555,6 +1556,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum=
 v4l2_ctrl_type *type,
>  =09case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:
>  =09=09*type =3D V4L2_CTRL_TYPE_H264_PRED_WEIGHTS;
>  =09=09break;
> +=09case V4L2_CID_STATELESS_H264_ENCODE_PARAMS:
> +=09=09*type =3D V4L2_CTRL_TYPE_H264_ENCODE_PARAMS;
> +=09=09break;
>  =09case V4L2_CID_STATELESS_VP8_FRAME:
>  =09=09*type =3D V4L2_CTRL_TYPE_VP8_FRAME;
>  =09=09break;
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 31fc1bee3797..54133cda7bc7 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -42,6 +42,7 @@ struct video_device;
>   * @p_h264_scaling_matrix:=09Pointer to a struct v4l2_ctrl_h264_scaling_=
matrix.
>   * @p_h264_slice_params:=09Pointer to a struct v4l2_ctrl_h264_slice_para=
ms.
>   * @p_h264_decode_params:=09Pointer to a struct v4l2_ctrl_h264_decode_pa=
rams.
> + * @p_h264_encode_params:=09Pointer to a struct v4l2_ctrl_h264_encode_pa=
rams.
>   * @p_h264_pred_weights:=09Pointer to a struct v4l2_ctrl_h264_pred_weigh=
ts.
>   * @p_vp8_frame:=09=09Pointer to a VP8 frame params structure.
>   * @p_vp9_compressed_hdr_probs:=09Pointer to a VP9 frame compressed head=
er probs structure.
> @@ -76,6 +77,7 @@ union v4l2_ctrl_ptr {
>  =09struct v4l2_ctrl_h264_scaling_matrix *p_h264_scaling_matrix;
>  =09struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
>  =09struct v4l2_ctrl_h264_decode_params *p_h264_decode_params;
> +=09struct v4l2_ctrl_h264_encode_params *p_h264_encode_params;
>  =09struct v4l2_ctrl_h264_pred_weights *p_h264_pred_weights;
>  =09struct v4l2_ctrl_vp8_frame *p_vp8_frame;
>  =09struct v4l2_ctrl_hevc_sps *p_hevc_sps;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index 2d30107e047e..9add059ca02a 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1568,6 +1568,7 @@ struct v4l2_h264_reference {
> =20
>  #define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED=09=090x01
>  #define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH=09=09=090x02
> +#define V4L2_H264_SLICE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE=090x04
> =20
>  #define V4L2_CID_STATELESS_H264_SLICE_PARAMS=09(V4L2_CID_CODEC_STATELESS=
_BASE + 6)
>  /**
> @@ -1707,6 +1708,38 @@ struct v4l2_ctrl_h264_decode_params {
>  =09__u32 flags;
>  };
> =20
> +#define V4L2_H264_ENCODE_FLAG_IDR_PIC=09=09=09=090x01
> +#define V4L2_H264_ENCODE_FLAG_FIELD_PIC=09=09=09=090x02
> +#define V4L2_H264_ENCODE_FLAG_BOTTOM_FIELD=09=09=090x04

Just notice you are ahead of Vulkan here, they don't seem to have inerlaced
encoding, maybe they just want to discourage people to use that, and that's=
 why
they only decode it :-D

> +#define V4L2_H264_ENCODE_FLAG_DIRECT_SPATIAL_MV_PRED=09=090x08
> +#define V4L2_H264_ENCODE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE=090x10
> +#define V4L2_H264_ENCODE_FLAG_NO_OUTPUT_OF_PRIOR_PICS=09=090x20
> +#define V4L2_H264_ENCODE_FLAG_LONG_TERM_REFERENCE=09=090x40
> +
> +#define V4L2_CID_STATELESS_H264_ENCODE_PARAMS=09(V4L2_CID_CODEC_STATELES=
S_BASE + 8)
> +struct v4l2_ctrl_h264_encode_params {
> +=09__u8 nal_ref_idc;

This is fixed in this implementation, and will be derivable with support fo=
r
other reference model. I'd remove.

> +=09__u8 slice_type;

I think we should do like Vulkan here though. They split the frame invarian=
t
(StdVideoEncodeH264PictureInfo) from the slice parameters
(StdVideoEncodeH264SliceHeader). slice_type does not have to be the same on=
 all
slices, just like many more below.

> +=09__u8 pic_parameter_set_id;
> +=09__u8 colour_plane_id;

I'm not aware of any HW capable of !=3D 0 here, so I'd be keen on dropping.=
 We can
make it an encode_params_professional in the future, there will likely be m=
ore
things to add by then.

> +=09__u16 frame_num;
> +=09__u16 idr_pic_id;
> +=09__u16 pic_order_cnt_lsb;
> +=09__u8 reserved0[2];
> +=09__s32 delta_pic_order_cnt_bottom;
> +=09__s32 delta_pic_order_cnt0;
> +=09__s32 delta_pic_order_cnt1;
> +=09__u8 num_ref_idx_l0_active_minus1;
> +=09__u8 num_ref_idx_l1_active_minus1;
> +=09__u8 cabac_init_idc;
> +=09__s8 slice_qp_delta;
> +=09__u8 disable_deblocking_filter_idc;
> +=09__s8 slice_alpha_c0_offset_div2;
> +=09__s8 slice_beta_offset_div2;
> +=09__u8 reserved1[6];

This leads the next flag 1 byte off 32bit alignment, what the compiler will=
 do
next can't be predicted. Did you forgot to run pahole?

> +=09__u32 flags; /* V4L2_H264_ENCODE_FLAG_ */

Missing something like temporal_id, first_mb_in_slice, while splitting the =
slice
params, these would become a dybamic array and that will define the number =
of
slices. No long term support I think?=20

That's all I could find on this pass.
Nicolas


> +};
> +
>  /* Stateless FWHT control, used by the vicodec driver */
> =20
>  /* Current FWHT version */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index becd08fdbddb..1d5e27b65544 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1964,6 +1964,7 @@ enum v4l2_ctrl_type {
>  =09V4L2_CTRL_TYPE_H264_SLICE_PARAMS    =3D 0x0203,
>  =09V4L2_CTRL_TYPE_H264_DECODE_PARAMS   =3D 0x0204,
>  =09V4L2_CTRL_TYPE_H264_PRED_WEIGHTS    =3D 0x0205,
> +=09V4L2_CTRL_TYPE_H264_ENCODE_PARAMS   =3D 0x0206,
> =20
>  =09V4L2_CTRL_TYPE_FWHT_PARAMS=09    =3D 0x0220,
> =20

--=-/fZMDlE7IzlEjztDt+D/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavzHZAAKCRDZQZRRKWBy
9JIeAPwLoc6UcFJ+vaUaCM7hDt//6JEo8hCRaEtlHKiHkmOfrQEA7aIsygjuOzNb
tM4fww/8zNbM5bOdURvRgRfIGaadvAw=
=b9OE
-----END PGP SIGNATURE-----

--=-/fZMDlE7IzlEjztDt+D/--
