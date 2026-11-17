Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951121;
	b=lYjOgvH35pItbb9HtQiXB4CIH90jRgykFajmT6fmdhrq2yDzWjisBJc7oqEJxXzLHLqj
	 NnbjI69aADhInc7SUFvKHdrq1XFeNjxyfs3fJpnIPMg9afxvJFjmNeVtGiyr/MmG9lYkw
	 9Gcs4WFVWIFv4mYLyeQj0MXNFwvdPouFbaItytPDFiB5XGqsZ8079g5TRh7QFL4T4pq7M
	 cDthIse8yU8x/mQxirTler2RxrjfUSQVPXXMBhegNBVHxHE8eWjQn58vspaah82LGXgrQ
	 cU+K8KCyuuSGbGjLaATp7XbUT38fcflnK1I0e80SJpHAilKVXHlKya0nWgNQsv4hrtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951121;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=AiRDOzpH95UQQFEtuP/vStLYkfQknTZRNwFShMgbrc0=;
	b=NzzZ+X43UUzXSSA1pR5BPj9YJvvxB6Kf4frW1XbKP2X0ecH5gZjMAtsWlNrEQtK1rHe+
	 HrHcTOlyxHSkuJeSRejV7MzhLzVQAv1vBOYlU191NeIs84DyE7UVAGlZ6d1LpxkLPANy9
	 DHn0YKuoMrotA/+Wk2Ac/B1Wjm/CgBWbX9leRWHlpl+GvxTYrw5KOQ7OZ8cXZaYI+o1Rq
	 vRDG/URq+H7bNR8ntwQ4kFSdLxwvcB18MtRR+A2WSvUcgQmWIVZkqYqFsjS2mi/Af8D+k
	 gVaM8FO46r3Wlgt6UC6GCQSF6C+fPDr6s/ZgF3f09xE4PelF1KpyLn+6+C+PeYgb8Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Nt5ZhPDl;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06AB606A31C
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 21:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A06AB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Nt5ZhPDl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794951118;
	bh=LpIiOijw2hoRxKkjG5H+tycmbZiiE0IAUAHL2/Z4xMc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Nt5ZhPDljNi6azHaM+esrUxeLggPl65a06MKoUG03kP6tB0dG4Q2oiKQPMMXcaJ1t
	 geWVX4rbjOeuxot2WkjI6utvmpccJeAsmsguxkkLccWzrp17r3TlBYAPgNIFqQCprr
	 vJ5rO+RHIs3YDrS21dnxt0l0HsgCDQOGQQyFx7BaI1q++kA8/Fj+m/eU1BMm7Z1vvr
	 JOqrDReeNgiEqLzaShkTdV1bq/wBcMox8vLHCzZr3HbSj5hGmoUcLkvpsRshvbm+4O
	 m09vk+u/MSjjORPMw4UgipK5eel41aW9qND+0AnTqaxtPjoBQAzhFrns3ku2fNmqvk
	 A2t3YyvG8Y98Q==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B56517E04B4;
	Tue, 17 Nov 2026 22:31:56 +0100 (CET)
Message-ID: <db1d7bd622df8b0edc0c329c37a350cee745b123.camel@collabora.com>
Subject: Re: [PATCH 03/14] media: h264: Add SPS video definitions
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
Date: Tue, 17 Nov 2026 16:31:55 -0500
In-Reply-To: <20260522101653.2565125-4-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
	 <20260522101653.2565125-4-paulk@sys-base.io>
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
	protocol="application/pgp-signature"; boundary="=-wwcCmKPZi8COV1ETuEo4"
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

--=-wwcCmKPZi8COV1ETuEo4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 22 mai 2026 =C3=A0 12:16 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> These definitions are used to build the video part of the SPS,
> including important fields such as frame cropping, timing info
> (frame rate) and pixel coding.

Since the kernel take control of bitstream generation, maybe it should offe=
r to
insert SEIs ?

Nicolas

>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  include/media/v4l2-h264.h | 115 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 115 insertions(+)
>=20
> diff --git a/include/media/v4l2-h264.h b/include/media/v4l2-h264.h
> index 1833c0556963..3b00a1b67fe5 100644
> --- a/include/media/v4l2-h264.h
> +++ b/include/media/v4l2-h264.h
> @@ -12,6 +12,121 @@
> =20
>  #include <media/v4l2-ctrls.h>
> =20
> +#define V4L2_H264_START_CODE_ANNEX_B=09=090x00000001
> +
> +#define V4L2_H264_NALU_TYPE_SLICE_NON_IDR=091
> +#define V4L2_H264_NALU_TYPE_SLICE_IDR=09=095
> +#define V4L2_H264_NALU_TYPE_SPS=09=09=097
> +#define V4L2_H264_NALU_TYPE_PPS=09=09=098
> +#define V4L2_H264_NALU_TYPE_AUD=09=09=099
> +
> +#define V4L2_H264_PRIMARY_PIC_TYPE_I=09=090
> +#define V4L2_H264_PRIMARY_PIC_TYPE_IP=09=091
> +#define V4L2_H264_PRIMARY_PIC_TYPE_IPB=09=092
> +
> +#define V4L2_H264_VUI_ASPECT_RATIO_IDC_EXTENDED=09255
> +
> +#define V4L2_H264_VUI_VIDEO_COMPONENT=09=090
> +#define V4L2_H264_VUI_VIDEO_PAL=09=09=091
> +#define V4L2_H264_VUI_VIDEO_NTSC=09=092
> +#define V4L2_H264_VUI_VIDEO_SECAM=09=093
> +#define V4L2_H264_VUI_VIDEO_MAC=09=09=094
> +#define V4L2_H264_VUI_VIDEO_UNSPECIFIED=09=095
> +
> +#define V4L2_H264_VUI_COLOUR_BT709=09=091
> +#define V4L2_H264_VUI_COLOUR_UNSPECIFIED=092
> +#define V4L2_H264_VUI_COLOUR_BT470_SYSTEM_M=094
> +#define V4L2_H264_VUI_COLOUR_BT470_SYSTEM_BG=095
> +#define V4L2_H264_VUI_COLOUR_SMPTE170M=09=096
> +#define V4L2_H264_VUI_COLOUR_SMPTE240M=09=097
> +#define V4L2_H264_VUI_COLOUR_BT2020=09=099
> +
> +#define V4L2_H264_VUI_TRANSFER_BT709=09=091
> +#define V4L2_H264_VUI_TRANSFER_UNSPECIFIED=092
> +#define V4L2_H264_VUI_TRANSFER_BT470_SYSTEM_M=094
> +#define V4L2_H264_VUI_TRANSFER_BT470_SYSTEM_BG=095
> +#define V4L2_H264_VUI_TRANSFER_SMPTE170M=096
> +#define V4L2_H264_VUI_TRANSFER_SMPTE240M=097
> +#define V4L2_H264_VUI_TRANSFER_LINEAR=09=098
> +#define V4L2_H264_VUI_TRANSFER_SRGB=09=0913
> +
> +#define V4L2_H264_VUI_MATRIX_IDENTITY=09=090
> +#define V4L2_H264_VUI_MATRIX_BT709=09=091
> +#define V4L2_H264_VUI_MATRIX_UNSPECIFIED=092
> +#define V4L2_H264_VUI_MATRIX_BT470_SYSTEM_M=094
> +#define V4L2_H264_VUI_MATRIX_BT470_SYSTEM_BG=095
> +#define V4L2_H264_VUI_MATRIX_SMPTE170M=09=096
> +#define V4L2_H264_VUI_MATRIX_SMPTE240M=09=097
> +#define V4L2_H264_VUI_MATRIX_BT2020=09=099
> +#define V4L2_H264_VUI_MATRIX_BT2020_CONST_LUM=0910
> +
> +#define V4L2_H264_SPS_VIDEO_FLAG_FRAME_CROPPING=09=09=09=09BIT(0)
> +#define V4L2_H264_SPS_VIDEO_FLAG_VUI_PARAMETERS_PRESENT=09=09=09BIT(1)
> +#define V4L2_H264_SPS_VIDEO_FLAG_VUI_ASPECT_RATIO_INFO_PRESENT=09=09BIT(=
2)
> +#define V4L2_H264_SPS_VIDEO_FLAG_VUI_OVERSCAN_INFO_PRESENT=09=09BIT(3)
> +#define V4L2_H264_SPS_VIDEO_FLAG_VUI_OVERSCAN_APPROPRIATE=09=09BIT(4)
> +#define V4L2_H264_SPS_VIDEO_FLAG_VUI_VIDEO_SIGNAL_TYPE_PRESENT=09=09BIT(=
5)
> +#define V4L2_H264_SPS_VIDEO_FLAG_VUI_VIDEO_FULL_RANGE=09=09=09BIT(6)
> +#define V4L2_H264_SPS_VIDEO_FLAG_VUI_COLOUR_DESCRIPTION_PRESENT=09=09BIT=
(7)
> +#define V4L2_H264_SPS_VIDEO_FLAG_VUI_CHROMA_LOC_INFO_PRESENT=09=09BIT(8)
> +#define V4L2_H264_SPS_VIDEO_FLAG_VUI_TIMING_INFO_PRESENT=09=09BIT(9)
> +#define V4L2_H264_SPS_VIDEO_FLAG_VUI_FIXED_FRAME_RATE=09=09=09BIT(10)
> +#define V4L2_H264_SPS_VIDEO_FLAG_VUI_NAL_HRD_PARAMETERS_PRESENT=09=09BIT=
(11)
> +#define V4L2_H264_SPS_VIDEO_FLAG_VUI_VCL_HRD_PARAMETERS_PRESENT=09=09BIT=
(12)
> +#define V4L2_H264_SPS_VIDEO_FLAG_VUI_LOW_DELAY_HRD=09=09=09BIT(13)
> +#define V4L2_H264_SPS_VIDEO_FLAG_VUI_PIC_STRUCT_PRESENT=09=09=09BIT(14)
> +#define V4L2_H264_SPS_VIDEO_FLAG_VUI_BITSTREAM_RESTRICTION=09=09BIT(15)
> +#define V4L2_H264_SPS_VIDEO_FLAG_VUI_MOTION_VECTORS_OVER_PIC_BOUNDARIES=
=09BIT(16)
> +
> +struct v4l2_h264_sps_video_hrd {
> +=09u8 cpb_cnt_minus1;
> +=09u8 bit_rate_scale;
> +=09u8 cpb_size_scale;
> +
> +=09u32 bit_rate_value_minus1[32];
> +=09u32 cpb_size_value_minus1[32];
> +=09u8 cbr_flag[32];
> +
> +=09u8 initial_cpb_removal_delay_length_minus1;
> +=09u8 cpb_removal_delay_length_minus1;
> +=09u8 dpb_output_delay_length_minus1;
> +=09u8 time_offset_length;
> +};
> +
> +struct v4l2_h264_sps_video {
> +=09u32 frame_crop_left_offset;
> +=09u32 frame_crop_right_offset;
> +=09u32 frame_crop_top_offset;
> +=09u32 frame_crop_bottom_offset;
> +
> +=09u8 aspect_ratio_idc;
> +=09u16 sar_width;
> +=09u16 sar_height;
> +
> +=09u8 video_format;
> +=09u8 colour_primaries;
> +=09u8 transfer_characteristics;
> +=09u8 matrix_coefficients;
> +
> +=09u8 chroma_sample_loc_type_top_field;
> +=09u8 chroma_sample_loc_type_bottom_field;
> +
> +=09u32 num_units_in_tick;
> +=09u32 time_scale;
> +
> +=09struct v4l2_h264_sps_video_hrd nal_hrd;
> +=09struct v4l2_h264_sps_video_hrd vcl_hrd;
> +
> +=09u32 max_bytes_per_pic_denom;
> +=09u32 max_bits_per_mb_denom;
> +=09u32 log2_max_mv_length_horizontal;
> +=09u32 log2_max_mv_length_vertical;
> +=09u32 max_num_reorder_frames;
> +=09u32 max_dec_frame_buffering;
> +
> +=09u32 flags;
> +};
> +
>  /**
>   * struct v4l2_h264_reflist_builder - Reference list builder object
>   *

--=-wwcCmKPZi8COV1ETuEo4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavzHywAKCRDZQZRRKWBy
9J+bAPsEdUmKw823k9vFfWb96+ew2e3/HW4G5gJ8WXa4T/pgygEA1mrIyQvGdVbK
xjclhCW5Az4OOx9fty3dU8u+g0yL6Aw=
=6tQ6
-----END PGP SIGNATURE-----

--=-wwcCmKPZi8COV1ETuEo4--
