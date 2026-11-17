Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952822;
	b=oKPLTw2OltsDPa0dPjp2Er8ouaLFgw08jODSEzcasJdfhojHzn6tQz9RKIrEz0HjXlyW
	 NLfTWHC3BmdIyDuaq0FyRcDAD/Yv1MmvWVHgYRvh5ljvmwbKrjgPw1OzHmAUAVdgoz2WL
	 XR0v0W5h+ErZLK5H2eU/HjKPm6b0D3n+dfj4wfZo2b7c1N9H0oH56xRplqXzq5yDzVoNb
	 gFOioD8x2ctu1Li8WAnK3BXMvalukH/5ywX+RBkj9N0j9nffOPA5DuXmAHKV9f4Sl0eyx
	 XvOqzH/IiI1tNSYL1Z/cggy/OadsSddGB6KqY9XhYDxVIvRnKH+u92VquivU54CuSFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952822;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=36FKbSoeq2Cl8dzoAdy7X8uwIh2PewHDGjWT9zWDmeY=;
	b=LQE4EMkie6SQFBVnNBaslqn68liZmQo3oFxAPCECSCeo3qhWn2YnZ+byxv7GwmQchCAd
	 xKvVTfnFlDnYfONtQyKyZJbsNsjtifXQQmN8RyWRtUPGs3iJJZiyCefs/9ya/BDP1N4dL
	 ntepwb0TAaWxxBPjPMaKoiGoHntuDQxGSFgCcVBtS1ifwmOZdJd8bWhmn+6Jx6frGp0qS
	 ZvewmQeo9YgtCsHedGWga69q1vf0QrtEL0fn49MblV/rvWeLKrVIXmc7z3hwvj3WYgJJ1
	 up2InybvW4HS/hzGMvws95TXNatcFi72RfVwzFdYolnTbyVh4WBE5EnwnFKlxiSiA9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="QZ5blqJ/";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8697A606A32C
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 22:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8697A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=QZ5blqJ/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794952817;
	bh=2TzfmQrdyvzw3vCxW3AAsPV/p3rTHdsqqS9S9dmcKb8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=QZ5blqJ/Y0Jk93Wuo5BRh2AUC3PX8+yWBVuOQDlEf/x3hksqDSUQI41sEG/Fzz4sa
	 KqKzvEEg+pg0KAdCjePQLWzjGMkM/9U2JVXUWbUAbNIgu6v6llsvWUCjizlFDcDiVv
	 qeQtbISXPVUaNDumr1TJZH4QwxWcjtkvF9kY+LaMqA5IoFoziDCRBDM0LY0V4Ef+Wv
	 CECyDdWlxK/bs94aVOK1tMo6Ta9t+3qD9cssz14oU3NGdh/ecRPLiPm1pwT4zxFiuv
	 qu28iIePhtu8+T2NIX06YQA/dgtm5bnfv4h1oAFNfS13A3t2XqUxAc+rdCJN8mkfrc
	 OTZXfrUyB6t3Q==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B77517E04B4;
	Tue, 17 Nov 2026 23:00:15 +0100 (CET)
Message-ID: <206d0fb68342892f1e007ff7299dd07edc65e80a.camel@collabora.com>
Subject: Re: [PATCH 12/14] media: verisilicon: Add support for the VC8000E
 H.264 encoder
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
Date: Tue, 17 Nov 2026 17:00:14 -0500
In-Reply-To: <20260522101653.2565125-13-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
	 <20260522101653.2565125-13-paulk@sys-base.io>
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
	protocol="application/pgp-signature"; boundary="=-6CcgTW6DhSHdgYxHsiLb"
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

--=-6CcgTW6DhSHdgYxHsiLb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

warning: partial review.

Le vendredi 22 mai 2026 =C3=A0 12:16 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> This introduces support for the Hantro VC8000E H.264 encoder,
> a stateless hardware encoder from Verisilicon.
>=20
> This driver is the first user of the V4L2 H.264 stateless encoding
> core and uAPI.
>=20
> The hardware needs to be programmed in a sequential way (registers
> written in ascending offset order) so the registers are programmed
> in a memory buffer first and copied in order at the end.
> They are described as packed structured for convenience and should
> also contain all required definitions for HEVC and JPEG support.
>=20
> Only a single reference frame is currently supported, even though
> the registers seems to indicate that two could be supported.
> More research and investigation is needed to operate two.
>=20
> The lambda tables are currently hardcoded to generally reasonable
> values but could be recalculated for each target QP to give more
> accurate results.
>=20
> Most other features of the encoder are supported, except ROI and
> intra areas support which are currently disabled.
>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  drivers/media/platform/verisilicon/Kconfig    |    1 +
>  drivers/media/platform/verisilicon/Makefile   |    2 +
>  drivers/media/platform/verisilicon/hantro.h   |   14 +
>  .../media/platform/verisilicon/hantro_drv.c   |  152 +-
>  .../media/platform/verisilicon/hantro_h264.c  |    6 +-
>  .../media/platform/verisilicon/hantro_hw.h    |   27 +
>  .../media/platform/verisilicon/hantro_v4l2.c  |    6 +
>  .../platform/verisilicon/hantro_vc8000e.c     |   68 +
>  .../verisilicon/hantro_vc8000e_h264_enc.c     |  883 +++++++
>  .../verisilicon/hantro_vc8000e_regs.h         | 2129 +++++++++++++++++
>  10 files changed, 3279 insertions(+), 9 deletions(-)
>  create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e.c
>  create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e_h26=
4_enc.c
>  create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e_reg=
s.h
>=20
> diff --git a/drivers/media/platform/verisilicon/Kconfig b/drivers/media/p=
latform/verisilicon/Kconfig
> index 3272a24db71d..ae186a848e24 100644
> --- a/drivers/media/platform/verisilicon/Kconfig
> +++ b/drivers/media/platform/verisilicon/Kconfig
> @@ -12,6 +12,7 @@ config VIDEO_HANTRO
>  =09select VIDEOBUF2_VMALLOC
>  =09select V4L2_MEM2MEM_DEV
>  =09select V4L2_H264
> +=09select V4L2_H264_ENC
>  =09select V4L2_JPEG_HELPER
>  =09select V4L2_VP9
>  =09help
> diff --git a/drivers/media/platform/verisilicon/Makefile b/drivers/media/=
platform/verisilicon/Makefile
> index f6f019d04ff0..caa32de29ab7 100644
> --- a/drivers/media/platform/verisilicon/Makefile
> +++ b/drivers/media/platform/verisilicon/Makefile
> @@ -7,6 +7,8 @@ hantro-vpu-y +=3D \
>  =09=09hantro_v4l2.o \
>  =09=09hantro_postproc.o \
>  =09=09hantro_h1_jpeg_enc.o \
> +=09=09hantro_vc8000e.o \
> +=09=09hantro_vc8000e_h264_enc.o \
>  =09=09hantro_g1.o \
>  =09=09hantro_g1_h264_dec.o \
>  =09=09hantro_g1_mpeg2_dec.o \
> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/=
platform/verisilicon/hantro.h
> index badd0b13988c..b21c16dd6c1b 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -32,6 +32,7 @@ struct hantro_codec_ops;
>  struct hantro_postproc_ops;
> =20
>  #define HANTRO_JPEG_ENCODER=09BIT(0)
> +#define HANTRO_H264_ENCODER=09BIT(1)
>  #define HANTRO_ENCODERS=09=090x0000ffff
>  #define HANTRO_MPEG2_DECODER=09BIT(16)
>  #define HANTRO_VP8_DECODER=09BIT(17)
> @@ -107,6 +108,7 @@ struct hantro_variant {
>   * enum hantro_codec_mode - codec operating mode.
>   * @HANTRO_MODE_NONE:  No operating mode. Used for RAW video formats.
>   * @HANTRO_MODE_JPEG_ENC: JPEG encoder.
> + * @HANTRO_MODE_H264_ENC: H264 encoder.
>   * @HANTRO_MODE_H264_DEC: H264 decoder.
>   * @HANTRO_MODE_MPEG2_DEC: MPEG-2 decoder.
>   * @HANTRO_MODE_VP8_DEC: VP8 decoder.
> @@ -117,6 +119,7 @@ struct hantro_variant {
>  enum hantro_codec_mode {
>  =09HANTRO_MODE_NONE =3D -1,
>  =09HANTRO_MODE_JPEG_ENC,
> +=09HANTRO_MODE_H264_ENC,
>  =09HANTRO_MODE_H264_DEC,
>  =09HANTRO_MODE_MPEG2_DEC,
>  =09HANTRO_MODE_VP8_DEC,
> @@ -272,6 +275,7 @@ struct hantro_ctx {
>  =09/* Specific for particular codec modes. */
>  =09union {
>  =09=09struct hantro_h264_dec_hw_ctx h264_dec;
> +=09=09struct hantro_h264_enc_hw_ctx h264_enc;
>  =09=09struct hantro_mpeg2_dec_hw_ctx mpeg2_dec;
>  =09=09struct hantro_vp8_dec_hw_ctx vp8_dec;
>  =09=09struct hantro_hevc_dec_hw_ctx hevc_dec;
> @@ -466,6 +470,16 @@ static __always_inline void hantro_reg_write_relaxed=
(struct hantro_dev *vpu,
>  =09vdpu_write_relaxed(vpu, vdpu_read_mask(vpu, reg, val), reg->base);
>  }
> =20
> +static __always_inline void hantro_io_copy(void __iomem *dst, void *src,
> +=09=09=09=09=09   size_t size)
> +{
> +#ifdef CONFIG_ARM64
> +=09__iowrite32_copy(dst, src, size / 4);
> +#else
> +=09memcpy_toio(dst, src, size);
> +#endif
> +}
> +
>  void *hantro_get_ctrl(struct hantro_ctx *ctx, u32 id);
>  dma_addr_t hantro_get_ref(struct hantro_ctx *ctx, u64 ts);
> =20
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index d798ba361b25..2de27f0a2be0 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -420,6 +420,8 @@ static const struct v4l2_ctrl_ops hantro_av1_ctrl_ops=
 =3D {
>  =09=09=09=09=09 V4L2_JPEG_ACTIVE_MARKER_DHT)
> =20
>  static const struct hantro_ctrl controls[] =3D {
> +=09/* JPEG Encoder */
> +
>  =09{
>  =09=09.codec =3D HANTRO_JPEG_ENCODER,
>  =09=09.cfg =3D {
> @@ -446,7 +448,127 @@ static const struct hantro_ctrl controls[] =3D {
>  =09=09=09 */
>  =09=09=09.flags =3D V4L2_CTRL_FLAG_READ_ONLY,
>  =09=09},
> +=09},
> +
> +=09/* H.264 Encoder */
> +
> +=09{
> +=09=09.codec =3D HANTRO_H264_ENCODER,
> +=09=09.cfg =3D {
> +=09=09=09.id =3D V4L2_CID_STATELESS_H264_ENCODE_PARAMS,
> +=09=09},
> +=09}, {
> +=09=09.codec =3D HANTRO_H264_ENCODER,
> +=09=09.cfg =3D {
> +=09=09=09.id =3D V4L2_CID_STATELESS_H264_SPS,
> +=09=09},
> +=09}, {
> +=09=09.codec =3D HANTRO_H264_ENCODER,
> +=09=09.cfg =3D {
> +=09=09=09.id =3D V4L2_CID_STATELESS_H264_PPS,
> +=09=09},
> +=09}, {
> +=09=09.codec =3D HANTRO_H264_ENCODER,
> +=09=09.cfg =3D {
> +=09=09=09.id =3D V4L2_CID_STATELESS_H264_START_CODE,
> +=09=09=09.min =3D V4L2_STATELESS_H264_START_CODE_NONE,
> +=09=09=09.max =3D V4L2_STATELESS_H264_START_CODE_ANNEX_B,
> +=09=09=09.def =3D V4L2_STATELESS_H264_START_CODE_ANNEX_B,
> +=09=09},
> +=09}, {
> +=09=09.codec =3D HANTRO_H264_ENCODER,
> +=09=09.cfg =3D {
> +=09=09=09.id =3D V4L2_CID_MPEG_VIDEO_AU_DELIMITER,
> +=09=09=09.step =3D 1,
> +=09=09=09.min =3D 0,
> +=09=09=09.max =3D 1,
> +=09=09=09.def =3D 0,

Any rational not to always insert AUD ?

> +=09=09},
> +=09}, {
> +=09=09.codec =3D HANTRO_H264_ENCODER,
> +=09=09.cfg =3D {
> +=09=09=09.id =3D V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR,
> +=09=09=09.step =3D 1,
> +=09=09=09.min =3D 0,
> +=09=09=09.max =3D 1,
> +=09=09=09.def =3D 0,

Same.

> +=09=09},
> +=09}, {
> +=09=09.codec =3D HANTRO_H264_ENCODER,
> +=09=09.cfg =3D {
> +=09=09=09.id =3D V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE,
> +=09=09=09.step =3D 1,
> +=09=09=09.min =3D 0,
> +=09=09=09.max =3D 1,
> +=09=09=09.def =3D 0,

Same, why not having some default? Of course VBR RC is more common default,=
 but
this disable RC completely?

> +=09=09},
> +=09}, {
> +=09=09.codec =3D HANTRO_H264_ENCODER,
> +=09=09.cfg =3D {
> +=09=09=09.id =3D V4L2_CID_MPEG_VIDEO_H264_MIN_QP,
> +=09=09=09.step =3D 1,
> +=09=09=09.min =3D 0,
> +=09=09=09.max =3D 51,
> +=09=09=09.def =3D 0,
> +=09=09},
> +=09}, {
> +=09=09.codec =3D HANTRO_H264_ENCODER,
> +=09=09.cfg =3D {
> +=09=09=09.id =3D V4L2_CID_MPEG_VIDEO_H264_MAX_QP,
> +=09=09=09.step =3D 1,
> +=09=09=09.min =3D 0,
> +=09=09=09.max =3D 51,
> +=09=09=09.def =3D 51,
> +=09=09},
> +=09}, {
> +=09=09.codec =3D HANTRO_H264_ENCODER,
> +=09=09.cfg =3D {
> +=09=09=09.id =3D V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP,
> +=09=09=09.step =3D 1,
> +=09=09=09.min =3D 0,
> +=09=09=09.max =3D 51,
> +=09=09=09.def =3D 24,
> +=09=09},
>  =09}, {
> +=09=09.codec =3D HANTRO_H264_ENCODER,
> +=09=09.cfg =3D {
> +=09=09=09.id =3D V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP,
> +=09=09=09.step =3D 1,
> +=09=09=09.min =3D 0,
> +=09=09=09.max =3D 51,
> +=09=09=09.def =3D 28,
> +=09=09},
> +=09}, {
> +=09=09.codec =3D HANTRO_H264_ENCODER,
> +=09=09.cfg =3D {
> +=09=09=09.id =3D V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
> +=09=09=09.min =3D V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
> +=09=09=09.max =3D V4L2_MPEG_VIDEO_BITRATE_MODE_CQ,
> +=09=09=09.def =3D V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
> +=09=09},
> +=09}, {
> +=09=09.codec =3D HANTRO_H264_ENCODER,
> +=09=09.cfg =3D {
> +=09=09=09.id =3D V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY,
> +=09=09=09.step =3D 1,
> +=09=09=09.min =3D 0,
> +=09=09=09.max =3D 100,
> +=09=09=09.def =3D 80,
> +=09=09},
> +=09}, {
> +=09=09.codec =3D HANTRO_H264_ENCODER,
> +=09=09.cfg =3D {
> +=09=09=09.id =3D V4L2_CID_MPEG_VIDEO_BITRATE,
> +=09=09=09.step =3D 1,
> +=09=09=09.min =3D 1000,
> +=09=09=09.max =3D 96000000,
> +=09=09=09.def =3D 2000000,
> +=09=09},
> +=09},
> +
> +=09/* MPEG-2 Decoder */
> +
> +=09{
>  =09=09.codec =3D HANTRO_MPEG2_DECODER,
>  =09=09.cfg =3D {
>  =09=09=09.id =3D V4L2_CID_STATELESS_MPEG2_SEQUENCE,
> @@ -461,7 +583,11 @@ static const struct hantro_ctrl controls[] =3D {
>  =09=09.cfg =3D {
>  =09=09=09.id =3D V4L2_CID_STATELESS_MPEG2_QUANTISATION,
>  =09=09},
> -=09}, {
> +=09},
> +
> +=09/* VP8 Decoder */
> +
> +=09{
>  =09=09.codec =3D HANTRO_VP8_DECODER,
>  =09=09.cfg =3D {
>  =09=09=09.id =3D V4L2_CID_STATELESS_VP8_FRAME,
> @@ -471,7 +597,11 @@ static const struct hantro_ctrl controls[] =3D {
>  =09=09.cfg =3D {
>  =09=09=09.id =3D V4L2_CID_STATELESS_H264_DECODE_PARAMS,
>  =09=09},
> -=09}, {
> +=09},
> +
> +=09/* H.264 Decoder */
> +
> +=09{
>  =09=09.codec =3D HANTRO_H264_DECODER,
>  =09=09.cfg =3D {
>  =09=09=09.id =3D V4L2_CID_STATELESS_H264_SPS,
> @@ -513,7 +643,11 @@ static const struct hantro_ctrl controls[] =3D {
>  =09=09=09BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
>  =09=09=09.def =3D V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
>  =09=09}
> -=09}, {
> +=09},
> +
> +=09/* HEVC Decoder */
> +
> +=09{
>  =09=09.codec =3D HANTRO_HEVC_DECODER,
>  =09=09.cfg =3D {
>  =09=09=09.id =3D V4L2_CID_STATELESS_HEVC_DECODE_MODE,
> @@ -565,7 +699,11 @@ static const struct hantro_ctrl controls[] =3D {
>  =09=09.cfg =3D {
>  =09=09=09.id =3D V4L2_CID_STATELESS_HEVC_SCALING_MATRIX,
>  =09=09},
> -=09}, {
> +=09},
> +
> +=09/* VP9 Decoder */
> +
> +=09{
>  =09=09.codec =3D HANTRO_VP9_DECODER,
>  =09=09.cfg =3D {
>  =09=09=09.id =3D V4L2_CID_STATELESS_VP9_FRAME,
> @@ -576,7 +714,11 @@ static const struct hantro_ctrl controls[] =3D {
>  =09=09.cfg =3D {
>  =09=09=09.id =3D V4L2_CID_STATELESS_VP9_COMPRESSED_HDR,
>  =09=09},
> -=09}, {
> +=09},
> +
> +=09/* AV1 Decoder */
> +
> +=09{
>  =09=09.codec =3D HANTRO_AV1_DECODER,
>  =09=09.cfg =3D {
>  =09=09=09.id =3D V4L2_CID_STATELESS_AV1_FRAME,
> diff --git a/drivers/media/platform/verisilicon/hantro_h264.c b/drivers/m=
edia/platform/verisilicon/hantro_h264.c
> index 2414782f1eb6..d71e041010ad 100644
> --- a/drivers/media/platform/verisilicon/hantro_h264.c
> +++ b/drivers/media/platform/verisilicon/hantro_h264.c
> @@ -453,13 +453,11 @@ int hantro_h264_dec_prepare_run(struct hantro_ctx *=
ctx)
>  =09if (WARN_ON(!ctrls->decode))
>  =09=09return -EINVAL;
> =20
> -=09ctrls->sps =3D
> -=09=09hantro_get_ctrl(ctx, V4L2_CID_STATELESS_H264_SPS);
> +=09ctrls->sps =3D hantro_get_ctrl(ctx, V4L2_CID_STATELESS_H264_SPS);
>  =09if (WARN_ON(!ctrls->sps))
>  =09=09return -EINVAL;
> =20
> -=09ctrls->pps =3D
> -=09=09hantro_get_ctrl(ctx, V4L2_CID_STATELESS_H264_PPS);
> +=09ctrls->pps =3D hantro_get_ctrl(ctx, V4L2_CID_STATELESS_H264_PPS);
>  =09if (WARN_ON(!ctrls->pps))
>  =09=09return -EINVAL;
> =20
> diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/med=
ia/platform/verisilicon/hantro_hw.h
> index c9b6556f8b2b..a0c752ef44dd 100644
> --- a/drivers/media/platform/verisilicon/hantro_hw.h
> +++ b/drivers/media/platform/verisilicon/hantro_hw.h
> @@ -12,11 +12,13 @@
>  #include <linux/interrupt.h>
>  #include <linux/v4l2-controls.h>
>  #include <media/v4l2-ctrls.h>
> +#include <media/v4l2-h264-enc.h>
>  #include <media/v4l2-vp9.h>
>  #include <media/videobuf2-core.h>
> =20
>  #include "rockchip_av1_entropymode.h"
>  #include "rockchip_av1_filmgrain.h"
> +#include "hantro_vc8000e_regs.h"
> =20
>  #define DEC_8190_ALIGN_MASK=090x07U
> =20
> @@ -69,6 +71,22 @@ struct hantro_aux_buf {
>  =09unsigned long attrs;
>  };
> =20
> +struct hantro_vc8000e_rec_buf {
> +=09struct hantro_aux_buf luma;
> +=09struct hantro_aux_buf chroma;
> +=09struct hantro_aux_buf luma_4n;
> +=09struct hantro_aux_buf colctbs;
> +};
> +
> +struct hantro_h264_enc_hw_ctx {
> +=09struct v4l2_h264_enc enc;
> +=09struct hantro_aux_buf nal_tbl;
> +
> +=09union {
> +=09=09struct hantro_vc8000e_regs vc8000e_regs;
> +=09};
> +};
> +
>  /* Max. number of entries in the DPB (HW limitation). */
>  #define HANTRO_H264_DPB_SIZE=09=0916
> =20
> @@ -451,6 +469,15 @@ int hantro_g1_h264_dec_run(struct hantro_ctx *ctx);
>  int hantro_h264_dec_init(struct hantro_ctx *ctx);
>  void hantro_h264_dec_exit(struct hantro_ctx *ctx);
> =20
> +irqreturn_t hantro_vc8000e_irq(int irq, void *dev_id);
> +int hantro_vc8000e_h264_enc_init(struct hantro_ctx *ctx);
> +void hantro_vc8000e_h264_enc_exit(struct hantro_ctx *ctx);
> +void hantro_vc8000e_h264_enc_done(struct hantro_ctx *ctx);
> +int hantro_vc8000e_h264_enc_run(struct hantro_ctx *ctx);
> +int hantro_h264_enc_prepare_run(struct hantro_ctx *ctx);
> +int hantro_h264_enc_init(struct hantro_ctx *ctx);
> +void hantro_h264_enc_exit(struct hantro_ctx *ctx);
> +
>  int hantro_hevc_dec_init(struct hantro_ctx *ctx);
>  void hantro_hevc_dec_exit(struct hantro_ctx *ctx);
>  int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx);
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/m=
edia/platform/verisilicon/hantro_v4l2.c
> index 2125f2913d9a..96b72c1f37db 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -629,6 +629,12 @@ static int hantro_set_fmt_out(struct hantro_ctx *ctx=
,
>  =09=09=09=09     hantro_get_format_depth(pix_mp->pixelformat),
>  =09=09=09=09     need_postproc);
> =20
> +=09/* Propagate dimensions for encoders. */
> +=09if (ctx->is_encoder) {
> +=09=09ctx->dst_fmt.width =3D pix_mp->width;
> +=09=09ctx->dst_fmt.height =3D pix_mp->height;
> +=09}
> +
>  =09/* Colorimetry information are always propagated. */
>  =09ctx->dst_fmt.colorspace =3D pix_mp->colorspace;
>  =09ctx->dst_fmt.ycbcr_enc =3D pix_mp->ycbcr_enc;
> diff --git a/drivers/media/platform/verisilicon/hantro_vc8000e.c b/driver=
s/media/platform/verisilicon/hantro_vc8000e.c
> new file mode 100644
> index 000000000000..ebd726e13460
> --- /dev/null
> +++ b/drivers/media/platform/verisilicon/hantro_vc8000e.c
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Hantro VPU codec driver
> + *
> + * Copyright (C) 2025-2026 Paul Kocialkowski <paulk@sys-base.io>
> + */
> +
> +#include "hantro.h"
> +#include "hantro_vc8000e_regs.h"
> +
> +irqreturn_t hantro_vc8000e_irq(int irq, void *dev_id)
> +{
> +=09struct hantro_dev *vpu =3D dev_id;
> +=09u32 regs_buffer[HANTRO_VC8000E_SWREG_OFFSET(swreg6) / 4];
> +=09struct hantro_vc8000e_regs *regs =3D
> +=09=09(struct hantro_vc8000e_regs *)regs_buffer;
> +=09enum vb2_buffer_state state;
> +
> +=09hantro_vc8000e_swreg_read(vpu, regs, swreg1);
> +
> +=09pr_debug("+ hantro-vc8000e-irq: %#x\n",

vpu_debug() ? and drop the +?

> +=09=09 regs_buffer[HANTRO_VC8000E_SWREG_OFFSET(swreg1) / 4]);
> +
> +=09if (regs->swreg1.irq)
> +=09=09pr_debug("  - irq\n");
> +=09if (regs->swreg1.frame_rdy_status)
> +=09=09pr_debug("  - frame ready\n");
> +=09if (regs->swreg1.bus_error_status)
> +=09=09pr_debug("  - bus error\n");
> +=09if (regs->swreg1.sw_reset)
> +=09=09pr_debug("  - sw reset\n");
> +=09if (regs->swreg1.buffer_full)
> +=09=09pr_debug("  - buffer full\n");
> +=09if (regs->swreg1.timeout)
> +=09=09pr_debug("  - timeout\n");
> +=09if (regs->swreg1.slice_rdy_status)
> +=09=09pr_debug("  - slice ready\n");
> +=09if (regs->swreg1.irq_fuse_error)
> +=09=09pr_debug("  - fuse error\n");
> +=09if (regs->swreg1.strm_segment_rdy_int)
> +=09=09pr_debug("  - segment ready\n");

We rate limit these, and to follow vpu_debug(), it should be backed by dev_=
dbg,
so dev_dbg_ratelimited().

> +
> +=09hantro_vc8000e_swreg_read(vpu, regs, swreg4);
> +=09hantro_vc8000e_swreg_read(vpu, regs, swreg5);
> +
> +=09/* Make sure to disble the encoder on error for safety. */
> +=09if ((regs->swreg1.bus_error_status ||
> +=09     regs->swreg1.buffer_full ||
> +=09     regs->swreg1.timeout ||
> +=09     regs->swreg1.irq_fuse_error) &&
> +=09    (regs->swreg4.mode =3D=3D HANTRO_VC8000E_SWREG4_MODE_H264 ||
> +=09     regs->swreg4.mode =3D=3D HANTRO_VC8000E_SWREG4_MODE_HEVC)) {
> +=09=09regs->swreg5.enable =3D 0;
> +=09=09hantro_vc8000e_swreg_write(vpu, regs, swreg5);
> +=09}
> +
> +=09state =3D regs->swreg1.frame_rdy_status ? VB2_BUF_STATE_DONE :
> +=09=09=09=09=09=09VB2_BUF_STATE_ERROR;
> +
> +=09regs->swreg1.irq_dis =3D 1;
> +=09regs->swreg1.timeout_int =3D 0;
> +
> +=09hantro_vc8000e_swreg_write(vpu, regs, swreg1);
> +
> +=09hantro_irq_done(vpu, state);
> +
> +=09return IRQ_HANDLED;
> +}
> diff --git a/drivers/media/platform/verisilicon/hantro_vc8000e_h264_enc.c=
 b/drivers/media/platform/verisilicon/hantro_vc8000e_h264_enc.c
> new file mode 100644
> index 000000000000..d3522d61443d
> --- /dev/null
> +++ b/drivers/media/platform/verisilicon/hantro_vc8000e_h264_enc.c
> @@ -0,0 +1,883 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Hantro VPU codec driver
> + *
> + * Copyright (C) 2024 Pengutronix, Marco Felsch <kernel@pengutronix.de>
> + * Copyright (C) 2025-2026 Paul Kocialkowski <paulk@sys-base.io>
> + */
> +
> +#include <linux/unaligned.h>
> +#include <linux/delay.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/v4l2-h264-enc-rbsp.h>
> +
> +#include "hantro.h"
> +#include "hantro_hw.h"
> +#include "hantro_vc8000e_regs.h"
> +
> +static int
> +hantro_vc8000e_h264_enc_state_constrain(struct v4l2_h264_enc *enc,
> +=09=09=09=09=09struct v4l2_h264_enc_state *state)
> +{
> +=09struct v4l2_ctrl_h264_sps *sps =3D &state->sps;
> +=09struct v4l2_ctrl_h264_pps *pps =3D &state->pps;
> +=09struct v4l2_ctrl_h264_encode_params *encode =3D &state->encode;
> +
> +=09/* SPS */
> +
> +=09if (V4L2_H264_SPS_HAS_CHROMA_FORMAT(sps)) {
> +=09=09sps->chroma_format_idc =3D 1;
> +=09=09sps->flags &=3D ~V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE;
> +=09=09sps->bit_depth_luma_minus8 =3D 0;
> +=09=09sps->bit_depth_chroma_minus8 =3D 0;
> +=09=09sps->flags &=3D ~V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPAS=
S;
> +=09}
> +
> +=09/* Only one reference frame is currently supported. */
> +=09if (sps->max_num_ref_frames > 1)
> +=09=09sps->max_num_ref_frames =3D 1;
> +
> +=09if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY)) {
> +=09=09sps->flags |=3D V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY;
> +=09=09sps->flags &=3D ~V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD;
> +=09}
> +
> +=09sps->flags |=3D V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE;
> +
> +=09/* PPS */
> +
> +=09/* Only one reference frame is currently supported. */
> +=09pps->num_ref_idx_l0_default_active_minus1 =3D 0;
> +=09pps->num_ref_idx_l1_default_active_minus1 =3D 0;
> +
> +=09/* Encode */
> +
> +=09/* Only a single bit is available for idr_pic_id. */
> +=09if (encode->flags & V4L2_H264_ENCODE_FLAG_IDR_PIC)
> +=09=09encode->idr_pic_id &=3D 1;
> +
> +=09/* The hardware doesn't allow overriding the active list numbers. */
> +=09if (encode->flags & V4L2_H264_SLICE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE)=
 {
> +=09=09encode->flags &=3D ~V4L2_H264_SLICE_FLAG_NUM_REF_IDX_ACTIVE_OVERRI=
DE;
> +
> +=09=09encode->num_ref_idx_l0_active_minus1 =3D 0;
> +=09=09encode->num_ref_idx_l1_active_minus1 =3D 0;
> +=09}
> +
> +=09/* Only a single bit is available for cabac_init_idc. */
> +=09if (encode->cabac_init_idc > 1)
> +=09=09encode->cabac_init_idc =3D 1;
> +
> +=09/* Only a single bit is available for disable_deblocking_filter_idc. =
*/
> +=09if (encode->disable_deblocking_filter_idc > 1)
> +=09=09encode->disable_deblocking_filter_idc =3D 1;
> +
> +=09return 0;
> +}
> +
> +static int
> +hantro_vc8000e_h264_enc_rec_buffer_alloc(struct v4l2_h264_enc *enc,
> +=09=09=09=09=09 struct v4l2_h264_enc_rec_buffer *buffer)
> +{
> +=09struct hantro_ctx *ctx =3D enc->private_data;
> +=09struct device *dev =3D ctx->dev->dev;
> +=09struct hantro_vc8000e_rec_buf *rec_buf;
> +=09unsigned int width_mbs, height_mbs;
> +
> +=09width_mbs =3D MB_WIDTH(ctx->src_fmt.width);
> +=09height_mbs =3D MB_HEIGHT(ctx->src_fmt.height);
> +
> +=09rec_buf =3D kzalloc(sizeof(*rec_buf), GFP_KERNEL);
> +=09if (!rec_buf)
> +=09=09goto error;
> +
> +=09rec_buf->luma.size =3D ctx->src_fmt.width * ctx->src_fmt.height;
> +=09rec_buf->luma.cpu =3D dma_alloc_coherent(dev, rec_buf->luma.size,
> +=09=09=09=09=09       &rec_buf->luma.dma, GFP_KERNEL);
> +=09if (!rec_buf->luma.cpu)
> +=09=09goto error;
> +
> +=09rec_buf->chroma.size =3D rec_buf->luma.size / 2;
> +=09rec_buf->chroma.cpu =3D dma_alloc_coherent(dev, rec_buf->chroma.size,
> +=09=09=09=09=09=09 &rec_buf->chroma.dma,
> +=09=09=09=09=09=09 GFP_KERNEL);
> +=09if (!rec_buf->chroma.cpu)
> +=09=09goto error;
> +
> +=09rec_buf->luma_4n.size =3D width_mbs * 4 * height_mbs * 4;
> +=09rec_buf->luma_4n.cpu =3D dma_alloc_coherent(dev, rec_buf->luma_4n.siz=
e,
> +=09=09=09=09=09=09  &rec_buf->luma_4n.dma,
> +=09=09=09=09=09=09  GFP_KERNEL);
> +=09if (!rec_buf->luma_4n.cpu)
> +=09=09goto error;
> +
> +=09rec_buf->colctbs.size =3D DIV_ROUND_UP(width_mbs * height_mbs, 2);
> +=09rec_buf->colctbs.cpu =3D dma_alloc_coherent(dev, rec_buf->colctbs.siz=
e,
> +=09=09=09=09=09=09  &rec_buf->colctbs.dma,
> +=09=09=09=09=09=09  GFP_KERNEL);
> +=09if (!rec_buf->colctbs.cpu)
> +=09=09goto error;
> +
> +=09buffer->private_data =3D rec_buf;
> +
> +=09return 0;
> +
> +error:
> +=09if (rec_buf)
> +=09=09kfree(rec_buf);
> +
> +=09return -ENOMEM;
> +}
> +
> +static int
> +hantro_vc8000e_h264_enc_rec_buffer_free(struct v4l2_h264_enc *enc,
> +=09=09=09=09=09struct v4l2_h264_enc_rec_buffer *buffer)
> +{
> +=09struct hantro_ctx *ctx =3D enc->private_data;
> +=09struct device *dev =3D ctx->dev->dev;
> +=09struct hantro_vc8000e_rec_buf *rec_buf =3D buffer->private_data;
> +
> +=09if (!rec_buf)
> +=09=09return -EINVAL;
> +
> +=09dma_free_coherent(dev, rec_buf->luma.size, rec_buf->luma.cpu,
> +=09=09=09  rec_buf->luma.dma);
> +
> +=09dma_free_coherent(dev, rec_buf->luma_4n.size, rec_buf->luma_4n.cpu,
> +=09=09=09  rec_buf->luma_4n.dma);
> +
> +=09dma_free_coherent(dev, rec_buf->chroma.size, rec_buf->chroma.cpu,
> +=09=09=09  rec_buf->chroma.dma);
> +
> +=09dma_free_coherent(dev, rec_buf->colctbs.size, rec_buf->colctbs.cpu,
> +=09=09=09  rec_buf->colctbs.dma);
> +
> +=09kfree(rec_buf);
> +=09buffer->private_data =3D NULL;
> +
> +=09return 0;
> +}
> +
> +static const struct v4l2_h264_enc_ops hantro_vc8000e_h264_enc_ops =3D {
> +=09.state_constrain=09=3D hantro_vc8000e_h264_enc_state_constrain,
> +=09.rec_buffer_alloc=09=3D hantro_vc8000e_h264_enc_rec_buffer_alloc,
> +=09.rec_buffer_free=09=3D hantro_vc8000e_h264_enc_rec_buffer_free,
> +};
> +
> +int hantro_vc8000e_h264_enc_init(struct hantro_ctx *ctx)
> +{
> +=09struct hantro_h264_enc_hw_ctx *h264_ctx =3D &ctx->h264_enc;
> +=09struct hantro_aux_buf *nal_tbl =3D &h264_ctx->nal_tbl;
> +=09struct v4l2_h264_enc *enc =3D &h264_ctx->enc;
> +=09struct device *dev =3D ctx->dev->dev;
> +
> +=09nal_tbl->size =3D ALIGN(MB_HEIGHT(ctx->src_fmt.height), 8);
> +=09nal_tbl->cpu =3D dma_alloc_coherent(dev, nal_tbl->size,
> +=09=09=09=09=09  &nal_tbl->dma, GFP_KERNEL);
> +=09if (!nal_tbl->cpu)
> +=09=09return -ENOMEM;
> +
> +=09enc->ops =3D &hantro_vc8000e_h264_enc_ops;
> +=09enc->private_data =3D ctx;
> +=09enc->format_mplane =3D &ctx->dst_fmt;
> +=09enc->timeperframe =3D &ctx->dst_timeperframe;
> +=09enc->ctrl_handler =3D &ctx->ctrl_handler;
> +=09enc->ref_slots_count_init =3D 2;
> +=09enc->flags =3D V4L2_H264_ENC_FLAG_INTER_PRED |
> +=09=09     V4L2_H264_ENC_FLAG_HW_SLICE_HEADER;
> +
> +=09return v4l2_h264_enc_init(enc);
> +}
> +
> +void hantro_vc8000e_h264_enc_exit(struct hantro_ctx *ctx)
> +{
> +=09struct hantro_h264_enc_hw_ctx *h264_ctx =3D &ctx->h264_enc;
> +=09struct hantro_aux_buf *nal_tbl =3D &h264_ctx->nal_tbl;
> +=09struct device *dev =3D ctx->dev->dev;
> +
> +=09if (nal_tbl->cpu)
> +=09=09dma_free_coherent(dev, nal_tbl->size, nal_tbl->cpu,
> +=09=09=09=09  nal_tbl->dma);
> +
> +=09v4l2_h264_enc_exit(&h264_ctx->enc);
> +}
> +
> +static int ref_setup(struct hantro_ctx *ctx)
> +{
> +=09struct hantro_h264_enc_hw_ctx *h264_ctx =3D &ctx->h264_enc;
> +=09struct hantro_vc8000e_regs *regs =3D &h264_ctx->vc8000e_regs;
> +=09struct v4l2_h264_enc *enc =3D &h264_ctx->enc;
> +=09struct v4l2_h264_enc_ref *ref =3D &enc->ref;
> +=09struct v4l2_h264_enc_state *state =3D &enc->state_active;
> +=09struct v4l2_ctrl_h264_encode_params *encode =3D &state->encode;
> +=09struct v4l2_h264_dpb_entry *dpb_entry;
> +=09struct v4l2_h264_enc_rec_buffer *buffer;
> +=09struct hantro_vc8000e_rec_buf *rec_buf;
> +=09bool ltr_present =3D false;
> +=09unsigned int index;
> +
> +=09regs->swreg193.nal_ref_idc =3D encode->nal_ref_idc !=3D 0;
> +
> +=09if (encode->flags & V4L2_H264_ENCODE_FLAG_LONG_TERM_REFERENCE) {
> +=09=09regs->swreg198.mark_current_longterm =3D 1;
> +=09=09/* We only get a single long-term reference without MMCO. */
> +=09=09regs->swreg194.cur_longtermidx =3D 0;
> +=09}
> +
> +=09regs->swreg193.l0_used_by_next_pic0 =3D 1;
> +=09regs->swreg193.l0_used_by_next_pic1 =3D 1;
> +=09regs->swreg194.l1_used_by_next_pic0 =3D 1;
> +=09regs->swreg194.l1_used_by_next_pic1 =3D 1;
> +
> +=09regs->swreg17.active_l0_cnt =3D ref->l0_active_count;
> +=09regs->swreg91.active_l1_cnt =3D ref->l1_active_count;
> +=09regs->swreg4.active_override_flag =3D 1;
> +
> +=09if (ref->l0_active_count > 0) {
> +=09=09index =3D ref->l0[0].index;
> +=09=09dpb_entry =3D &ref->dpb[index];
> +=09=09buffer =3D &ref->buffers[index];
> +=09=09rec_buf =3D buffer->private_data;
> +
> +=09=09regs->swreg18.refpic_recon_l0_y0 =3D rec_buf->luma.dma;
> +=09=09regs->swreg19.refpic_recon_l0_chroma0 =3D rec_buf->chroma.dma;
> +=09=09regs->swreg74.refpic_recon_l0_4n0_base =3D rec_buf->luma_4n.dma;
> +
> +=09=09regs->swreg17.l0_used_by_curr_pic0 =3D 1;
> +=09=09/* TODO: diff with wrap. */
> +=09=09regs->swreg17.l0_delta_poc0 =3D 1;
> +=09=09regs->swreg193.l0_delta_framenum0 =3D 1;
> +
> +=09=09if (dpb_entry->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM) {
> +=09=09=09regs->swreg17.l0_long_term_flag0 =3D 1;
> +=09=09=09regs->swreg198.l0_longtermidx0 =3D 0;
> +=09=09=09ltr_present =3D true;
> +=09=09}
> +=09}
> +
> +=09if (ref->l0_active_count > 1) {
> +=09=09index =3D ref->l0[1].index;
> +=09=09dpb_entry =3D &ref->dpb[index];
> +=09=09buffer =3D &ref->buffers[index];
> +=09=09rec_buf =3D buffer->private_data;
> +
> +=09=09regs->swreg20.refpic_recon_l0_y1 =3D rec_buf->luma.dma;
> +=09=09regs->swreg21.refpic_recon_l0_chroma1 =3D rec_buf->chroma.dma;
> +=09=09regs->swreg76.refpic_recon_l0_4n1_base =3D rec_buf->luma_4n.dma;
> +
> +=09=09regs->swreg17.l0_used_by_curr_pic1 =3D 1;
> +=09=09/* TODO: diff with wrap. */
> +=09=09regs->swreg17.l0_delta_poc1 =3D 1;
> +=09=09regs->swreg193.l0_delta_framenum1 =3D 1;
> +
> +=09=09if (dpb_entry->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM) {
> +=09=09=09regs->swreg17.l0_long_term_flag1 =3D 1;
> +=09=09=09regs->swreg198.l0_longtermidx1 =3D 0;
> +=09=09=09ltr_present =3D true;
> +=09=09}
> +=09}
> +
> +=09if (ltr_present)
> +=09=09regs->swreg91.long_term_ref_pics_present_flag =3D 1;
> +
> +=09return 0;
> +}
> +
> +static int lambda_setup(struct hantro_ctx *ctx)
> +{
> +=09struct hantro_h264_enc_hw_ctx *h264_ctx =3D &ctx->h264_enc;
> +=09struct hantro_vc8000e_regs *regs =3D &h264_ctx->vc8000e_regs;
> +
> +=09/* Intra SATD */
> +
> +=09regs->swreg125.intra_satd_lambda_0 =3D 0x47;
> +=09regs->swreg125.intra_satd_lambda_1 =3D 0x3f;
> +=09regs->swreg126.intra_satd_lambda_2 =3D 0x38;
> +=09regs->swreg126.intra_satd_lambda_3 =3D 0x32;
> +=09regs->swreg127.intra_satd_lambda_4 =3D 0;
> +=09regs->swreg127.intra_satd_lambda_5 =3D 0;
> +=09regs->swreg128.intra_satd_lambda_6 =3D 0;
> +=09regs->swreg128.intra_satd_lambda_7 =3D 0;
> +=09regs->swreg129.intra_satd_lambda_8 =3D 0;
> +=09regs->swreg129.intra_satd_lambda_9 =3D 0;
> +=09regs->swreg130.intra_satd_lambda_10 =3D 0;
> +=09regs->swreg130.intra_satd_lambda_11 =3D 0;
> +=09regs->swreg131.intra_satd_lambda_12 =3D 0;
> +=09regs->swreg131.intra_satd_lambda_13 =3D 0;
> +=09regs->swreg132.intra_satd_lambda_14 =3D 0;
> +=09regs->swreg132.intra_satd_lambda_15 =3D 0;
> +=09regs->swreg174.intra_satd_lambda_16 =3D 0x1c4;
> +=09regs->swreg174.intra_satd_lambda_17 =3D 0x192;
> +=09regs->swreg175.intra_satd_lambda_18 =3D 0x166;
> +=09regs->swreg175.intra_satd_lambda_19 =3D 0x13f;
> +=09regs->swreg176.intra_satd_lambda_20 =3D 0x11c;
> +=09regs->swreg176.intra_satd_lambda_21 =3D 0xfd;
> +=09regs->swreg177.intra_satd_lambda_22 =3D 0xe2;
> +=09regs->swreg177.intra_satd_lambda_23 =3D 0xc9;
> +=09regs->swreg178.intra_satd_lambda_24 =3D 0xb3;
> +=09regs->swreg178.intra_satd_lambda_25 =3D 0xa0;
> +=09regs->swreg179.intra_satd_lambda_26 =3D 0x8e;
> +=09regs->swreg179.intra_satd_lambda_27 =3D 0x7f;
> +=09regs->swreg180.intra_satd_lambda_28 =3D 0x71;
> +=09regs->swreg180.intra_satd_lambda_29 =3D 0x65;
> +=09regs->swreg181.intra_satd_lambda_30 =3D 0x5a;
> +=09regs->swreg181.intra_satd_lambda_31 =3D 0x50;
> +
> +=09/* Inter SATD */
> +
> +=09regs->swreg28.lambda_satd_me_0 =3D 0x24;
> +=09regs->swreg28.lambda_satd_me_1 =3D 0x20;
> +=09regs->swreg29.lambda_satd_me_2 =3D 0x1c;
> +=09regs->swreg29.lambda_satd_me_3 =3D 0x19;
> +=09regs->swreg30.lambda_satd_me_4 =3D 0x16;
> +=09regs->swreg30.lambda_satd_me_5 =3D 0x14;
> +=09regs->swreg31.lambda_satd_me_6 =3D 0x12;
> +=09regs->swreg31.lambda_satd_me_7 =3D 0x10;
> +=09regs->swreg32.lambda_satd_me_8 =3D 0xe;
> +=09regs->swreg32.lambda_satd_me_9 =3D 0xd;
> +=09regs->swreg33.lambda_satd_me_10 =3D 0xb;
> +=09regs->swreg33.lambda_satd_me_11 =3D 0xa;
> +=09regs->swreg34.lambda_satd_me_12 =3D 0x9;
> +=09regs->swreg34.lambda_satd_me_13 =3D 0x8;
> +=09regs->swreg78.lambda_satd_me_14 =3D 0x7;
> +=09regs->swreg78.lambda_satd_me_15 =3D 0x6;
> +=09regs->swreg150.lambda_satd_me_16 =3D 0;
> +=09regs->swreg150.lambda_satd_me_17 =3D 0;
> +=09regs->swreg151.lambda_satd_me_18 =3D 0;
> +=09regs->swreg151.lambda_satd_me_19 =3D 0;
> +=09regs->swreg152.lambda_satd_me_20 =3D 0x88;
> +=09regs->swreg152.lambda_satd_me_21 =3D 0;
> +=09regs->swreg153.lambda_satd_me_22 =3D 0;
> +=09regs->swreg153.lambda_satd_me_23 =3D 0;
> +=09regs->swreg154.lambda_satd_me_24 =3D 0;
> +=09regs->swreg154.lambda_satd_me_25 =3D 0;
> +=09regs->swreg155.lambda_satd_me_26 =3D 0;
> +=09regs->swreg155.lambda_satd_me_27 =3D 0;
> +=09regs->swreg156.lambda_satd_me_28 =3D 0;
> +=09regs->swreg156.lambda_satd_me_29 =3D 0;
> +=09regs->swreg157.lambda_satd_me_30 =3D 0;
> +=09regs->swreg157.lambda_satd_me_31 =3D 0;
> +
> +=09/* Inter SSE */
> +
> +=09regs->swreg79.lambda_sse_me_0 =3D 0x4f;
> +=09regs->swreg122.lambda_sse_me_1 =3D 0x3f;
> +=09regs->swreg123.lambda_sse_me_2 =3D 0x32;
> +=09regs->swreg124.lambda_sse_me_3 =3D 0x28;
> +=09regs->swreg138.lambda_sse_me_4 =3D 0;
> +=09regs->swreg139.lambda_sse_me_5 =3D 0;
> +=09regs->swreg140.lambda_sse_me_6 =3D 0;
> +=09regs->swreg141.lambda_sse_me_7 =3D 0;
> +=09regs->swreg142.lambda_sse_me_8 =3D 0;
> +=09regs->swreg143.lambda_sse_me_9 =3D 0;
> +=09regs->swreg144.lambda_sse_me_10 =3D 0;
> +=09regs->swreg145.lambda_sse_me_11 =3D 0;
> +=09regs->swreg146.lambda_sse_me_12 =3D 0;
> +=09regs->swreg147.lambda_sse_me_13 =3D 0;
> +=09regs->swreg148.lambda_sse_me_14 =3D 0;
> +=09regs->swreg149.lambda_sse_me_15 =3D 0;
> +=09regs->swreg158.lambda_sse_me_16 =3D 0;
> +=09regs->swreg159.lambda_sse_me_17 =3D 0x800;
> +=09regs->swreg160.lambda_sse_me_18 =3D 0;
> +=09regs->swreg161.lambda_sse_me_19 =3D 0;
> +=09regs->swreg162.lambda_sse_me_20 =3D 0;
> +=09regs->swreg163.lambda_sse_me_21 =3D 0;
> +=09regs->swreg164.lambda_sse_me_22 =3D 0;
> +=09regs->swreg165.lambda_sse_me_23 =3D 0;
> +=09regs->swreg166.lambda_sse_me_24 =3D 0;
> +=09regs->swreg167.lambda_sse_me_25 =3D 0;
> +=09regs->swreg168.lambda_sse_me_26 =3D 0x13c;
> +=09regs->swreg169.lambda_sse_me_27 =3D 0xfb;
> +=09regs->swreg172.lambda_sse_me_30 =3D 0x7d;
> +=09regs->swreg173.lambda_sse_me_31 =3D 0x64;
> +
> +=09regs->swreg35.lambda_motion_sse =3D 0;
> +
> +=09if (regs->swreg214.hwabsqpsupport) {
> +=09=09/* Used for lambda calculation, different intra/inter value. */
> +=09=09regs->swreg170_qp_absolute.sse_qp_factor =3D 0x1f5c;
> +=09=09regs->swreg171_qp_absolute.sad_qp_factor =3D 0x2ccd;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static int areas_setup(struct hantro_ctx *ctx)
> +{
> +=09struct hantro_h264_enc_hw_ctx *h264_ctx =3D &ctx->h264_enc;
> +=09struct hantro_vc8000e_regs *regs =3D &h264_ctx->vc8000e_regs;
> +
> +=09/* Intra */
> +
> +=09regs->swreg23.intra_area_left =3D 0xff;
> +=09regs->swreg195.intra_area_left_msb =3D 1;
> +=09regs->swreg249.intra_area_left_msb2 =3D 1;
> +
> +=09regs->swreg23.intra_area_right =3D 0xff;
> +=09regs->swreg195.intra_area_right_msb =3D 1;
> +=09regs->swreg249.intra_area_right_msb2 =3D 1;
> +
> +=09regs->swreg23.intra_area_top =3D 0xff;
> +=09regs->swreg195.intra_area_top_msb =3D 1;
> +=09regs->swreg249.intra_area_top_msb2 =3D 1;
> +
> +=09regs->swreg23.intra_area_bottom =3D 0xff;
> +=09regs->swreg195.intra_area_bottom_msb =3D 1;
> +=09regs->swreg249.intra_area_bottom_msb2 =3D 1;
> +
> +=09/* IPCM1 */
> +
> +=09regs->swreg208_h264.ipcm1_left =3D 0x1ff;
> +=09regs->swreg249.ipcm1_left_msb =3D 1;
> +
> +=09regs->swreg209.ipcm1_right =3D 0x1ff;
> +=09regs->swreg249.ipcm1_right_msb =3D 1;
> +
> +=09regs->swreg209.ipcm1_top =3D 0x1ff;
> +=09regs->swreg209.ipcm1_bottom =3D 0x1ff;
> +
> +=09regs->swreg249.ipcm1_top_msb =3D 1;
> +=09regs->swreg249.ipcm1_bottom_msb =3D 1;
> +
> +=09/* IPCM2 */
> +
> +=09regs->swreg210.ipcm2_left =3D 0x1ff;
> +=09regs->swreg249.ipcm2_left_msb =3D 1;
> +
> +=09regs->swreg211.ipcm2_right =3D 0x1ff;
> +=09regs->swreg249.ipcm2_right_msb =3D 1;
> +
> +=09regs->swreg212.ipcm2_top =3D 0x1ff;
> +=09regs->swreg249.ipcm2_top_msb =3D 1;
> +
> +=09regs->swreg213.ipcm2_bottom =3D 0x1ff;
> +=09regs->swreg249.ipcm2_bottom_msb =3D 1;
> +
> +=09/* ROI1 */
> +
> +=09regs->swreg24.roi1_left =3D 0xff;
> +=09regs->swreg195.roi1_left_msb =3D 1;
> +=09regs->swreg249.roi1_left_msb2 =3D 1;
> +
> +=09regs->swreg24.roi1_right =3D 0xff;
> +=09regs->swreg195.roi1_right_msb =3D 1;
> +=09regs->swreg249.roi1_right_msb2 =3D 1;
> +
> +=09regs->swreg24.roi1_top =3D 0xff;
> +=09regs->swreg195.roi1_top_msb =3D 1;
> +=09regs->swreg249.roi1_top_msb2 =3D 1;
> +
> +=09regs->swreg24.roi1_bottom =3D 0xff;
> +=09regs->swreg195.roi1_bottom_msb =3D 1;
> +=09regs->swreg249.roi1_bottom_msb2 =3D 1;
> +
> +=09/* ROI2 */
> +
> +=09regs->swreg25.roi2_left =3D 0xff;
> +=09regs->swreg195.roi2_left_msb =3D 1;
> +=09regs->swreg249.roi2_left_msb2 =3D 1;
> +
> +=09regs->swreg25.roi2_right =3D 0xff;
> +=09regs->swreg195.roi2_right_msb =3D 1;
> +=09regs->swreg249.roi2_right_msb2 =3D 1;
> +
> +=09regs->swreg25.roi2_top =3D 0xff;
> +=09regs->swreg195.roi2_top_msb =3D 1;
> +=09regs->swreg249.roi2_top_msb2 =3D 1;
> +
> +=09regs->swreg25.roi2_bottom =3D 0xff;
> +=09regs->swreg195.roi2_bottom_msb =3D 1;
> +=09regs->swreg249.roi2_bottom_msb2 =3D 1;
> +
> +=09if (regs->swreg226.hwroi8support) {
> +=09=09/* ROI3 */
> +
> +=09=09regs->swreg252.roi3_left =3D 0x3ff;
> +=09=09regs->swreg252.roi3_right =3D 0x3ff;
> +=09=09regs->swreg252.roi3_top =3D 0x3ff;
> +=09=09regs->swreg253.roi3_bottom =3D 0x3ff;
> +
> +=09=09/* ROI4 */
> +
> +=09=09regs->swreg253.roi4_left =3D 0x3ff;
> +=09=09regs->swreg254.roi4_right =3D 0x3ff;
> +=09=09regs->swreg253.roi4_top =3D 0x3ff;
> +=09=09regs->swreg254.roi4_bottom =3D 0x3ff;
> +
> +=09=09/* ROI5 */
> +
> +=09=09regs->swreg254.roi5_left =3D 0x3ff;
> +=09=09regs->swreg255.roi5_right =3D 0x3ff;
> +=09=09regs->swreg255.roi5_top =3D 0x3ff;
> +=09=09regs->swreg255.roi5_bottom =3D 0x3ff;
> +
> +=09=09/* ROI6 */
> +
> +=09=09regs->swreg256.roi6_left =3D 0x3ff;
> +=09=09regs->swreg256.roi6_right =3D 0x3ff;
> +=09=09regs->swreg256.roi6_top =3D 0x3ff;
> +=09=09regs->swreg257.roi6_bottom =3D 0x3ff;
> +
> +=09=09/* ROI7 */
> +
> +=09=09regs->swreg257.roi7_left =3D 0x3ff;
> +=09=09regs->swreg258.roi7_right =3D 0x3ff;
> +=09=09regs->swreg257.roi7_top =3D 0x3ff;
> +=09=09regs->swreg258.roi7_bottom =3D 0x3ff;
> +
> +=09=09/* ROI8 */
> +
> +=09=09regs->swreg258.roi8_left =3D 0x3ff;
> +=09=09regs->swreg259.roi8_right =3D 0x3ff;
> +=09=09regs->swreg259.roi8_top =3D 0x3ff;
> +=09=09regs->swreg259.roi8_bottom =3D 0x3ff;
> +=09}
> +
> +=09return 0;
> +}
> +
> +int hantro_vc8000e_h264_enc_run(struct hantro_ctx *ctx)
> +{
> +=09struct hantro_dev *vpu =3D ctx->dev;
> +=09struct v4l2_pix_format_mplane *src_fmt =3D &ctx->src_fmt;
> +=09struct hantro_h264_enc_hw_ctx *h264_ctx =3D &ctx->h264_enc;
> +=09struct hantro_vc8000e_regs *regs =3D &h264_ctx->vc8000e_regs;
> +=09struct v4l2_h264_enc *enc =3D &h264_ctx->enc;
> +=09struct v4l2_h264_enc_state *state =3D &enc->state_active;
> +=09const struct v4l2_ctrl_h264_sps *sps;
> +=09const struct v4l2_ctrl_h264_pps *pps;
> +=09const struct v4l2_ctrl_h264_encode_params *encode;
> +=09struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +=09struct hantro_vc8000e_rec_buf *rec_buf;
> +=09const struct v4l2_format_info *info;
> +=09unsigned int luma_stride;
> +=09unsigned int chroma_stride;
> +=09int ret;
> +
> +=09hantro_start_prepare_run(ctx);
> +
> +=09info =3D v4l2_format_info(src_fmt->pixelformat);
> +=09if (!info)
> +=09=09return -EINVAL;
> +
> +=09src_buf =3D hantro_get_src_buf(ctx);
> +=09dst_buf =3D hantro_get_dst_buf(ctx);
> +
> +=09ret =3D v4l2_h264_enc_step(enc, dst_buf);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09sps =3D &state->sps;
> +=09pps =3D &state->pps;
> +=09encode =3D &state->encode;
> +
> +=09memset(regs, 0, sizeof(*regs));
> +
> +=09/* Read relevant read-only registers. */
> +=09hantro_vc8000e_swreg_read(vpu, regs, swreg0);
> +=09hantro_vc8000e_swreg_read(vpu, regs, swreg80);
> +=09hantro_vc8000e_swreg_read(vpu, regs, swreg214);
> +=09hantro_vc8000e_swreg_read(vpu, regs, swreg226);
> +=09hantro_vc8000e_swreg_read(vpu, regs, swreg287);
> +
> +=09/* Mode */
> +
> +=09if (!regs->swreg80.hwh264support)
> +=09=09return -ENODEV;
> +
> +=09regs->swreg4.mode =3D HANTRO_VC8000E_SWREG4_MODE_H264;
> +
> +=09/* Input */
> +
> +=09regs->swreg38.input_format =3D ctx->vpu_src_fmt->enc_fmt;
> +=09regs->swreg38.input_rotation =3D HANTRO_VC8000E_SWREG38_INPUT_ROTATIO=
N_0;
> +
> +=09luma_stride =3D src_fmt->plane_fmt[0].bytesperline;
> +
> +=09/*
> +=09 * The hardware seems to expect the luma stride to represent pixels p=
er
> +=09 * line for packed cases, instead of the usual bytes per line.
> +=09 */
> +=09if (info->comp_planes =3D=3D 1)
> +=09=09luma_stride /=3D info->bpp[0];
> +
> +=09regs->swreg210.input_lu_stride =3D luma_stride;
> +
> +=09if (info->comp_planes > 1) {
> +=09=09if (src_fmt->num_planes > 1)
> +=09=09=09chroma_stride =3D src_fmt->plane_fmt[1].bytesperline;
> +=09=09else if (info->comp_planes > 2)
> +=09=09=09chroma_stride =3D luma_stride / 2;
> +=09=09else
> +=09=09=09chroma_stride =3D luma_stride;
> +
> +=09=09regs->swreg211.input_ch_stride =3D chroma_stride;
> +=09}
> +
> +=09regs->swreg12.input_y_base =3D
> +=09=09vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
> +
> +=09if (info->comp_planes > 1) {
> +=09=09if (src_fmt->num_planes > 1)
> +=09=09=09regs->swreg13.input_cb_base =3D
> +=09=09=09=09vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf,
> +=09=09=09=09=09=09=09      1);
> +=09=09else
> +=09=09=09regs->swreg13.input_cb_base =3D
> +=09=09=09=09vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf,
> +=09=09=09=09=09=09=09      0) +
> +=09=09=09=09luma_stride * src_fmt->height;
> +=09}
> +
> +=09if (info->comp_planes > 2) {
> +=09=09if (src_fmt->num_planes > 1)
> +=09=09=09regs->swreg14.input_cr_base =3D
> +=09=09=09=09vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf,
> +=09=09=09=09=09=09=09      2);
> +=09=09else
> +=09=09=09regs->swreg14.input_cr_base =3D
> +=09=09=09=09vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf,
> +=09=09=09=09=09=09=09      0) +
> +=09=09=09=09luma_stride * src_fmt->height +
> +=09=09=09=09chroma_stride * src_fmt->height;
> +=09}
> +
> +=09/* Output */
> +
> +=09if (enc->rbsp_update & V4L2_H264_ENC_RBSP_UPDATE_START_CODE)
> +=09=09regs->swreg4.output_strm_mode =3D
> +=09=09=09HANTRO_VC8000E_SWREG4_OUTPUT_STRM_MODE_BYTE_STREAM;
> +=09else
> +=09=09regs->swreg4.output_strm_mode =3D
> +=09=09=09HANTRO_VC8000E_SWREG4_OUTPUT_STRM_MODE_NAL_STREAM;
> +
> +=09regs->swreg8.output_strm_base =3D
> +=09=09vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0) +
> +=09=09v4l2_h264_enc_rbsp_bytes_count(&enc->rbsp);
> +=09regs->swreg9.output_strm_buffer_limit =3D
> +=09=09vb2_plane_size(&dst_buf->vb2_buf, 0) -
> +=09=09v4l2_h264_enc_rbsp_bytes_count(&enc->rbsp);
> +
> +=09if (!regs->swreg9.output_strm_buffer_limit)
> +=09=09return -ENOMEM;
> +
> +=09regs->swreg10.size_tbl_base =3D h264_ctx->nal_tbl.dma;
> +=09regs->swreg6.nal_size_write =3D 1;
> +
> +=09regs->swreg196.num_ctb_rows_per_sync =3D 1;
> +
> +=09regs->swreg199.hash_type =3D HANTRO_VC8000E_SWREG199_HASH_TYPE_NONE;
> +
> +=09/* Picture */
> +
> +=09regs->swreg5.pic_width =3D src_fmt->width / 8;
> +=09regs->swreg5.pic_height =3D src_fmt->height / 8;
> +=09regs->swreg38.rowlength =3D src_fmt->width;
> +
> +=09regs->swreg281.chroma_format_idc =3D sps->chroma_format_idc;
> +=09regs->swreg38.output_bitwidth_lum =3D
> +=09=09HANTRO_VC8000E_SWREG38_OUTPUT_BITWIDTH_LUM_8_BIT;
> +
> +=09regs->swreg11.poc =3D enc->ref.pic_order_cnt;
> +=09regs->swreg277.pic_order_cnt_type =3D sps->pic_order_cnt_type;
> +=09if (!sps->pic_order_cnt_type)
> +=09=09regs->swreg277.log2_max_pic_order_cnt_lsb =3D
> +=09=09=09sps->log2_max_pic_order_cnt_lsb_minus4 + 4;
> +
> +=09regs->swreg192.framenum =3D encode->frame_num;
> +=09regs->swreg277.log2_max_frame_num =3D sps->log2_max_frame_num_minus4 =
+ 4;
> +
> +=09/* Reconstruction */
> +
> +=09regs->swreg212.ref_lu_stride =3D src_fmt->width * 4;
> +=09regs->swreg237.ref_ch_stride =3D src_fmt->width * 4;
> +=09regs->swreg213.ref_ds_lu_stride =3D src_fmt->width;
> +
> +=09rec_buf =3D enc->ref.buffer_current.private_data;
> +
> +=09regs->swreg15.recon_y_base =3D rec_buf->luma.dma;
> +=09regs->swreg16.recon_chroma_base =3D rec_buf->chroma.dma;
> +=09regs->swreg72.recon_luma_4n_base =3D rec_buf->luma_4n.dma;
> +=09regs->swreg114.colctbs_store_base =3D rec_buf->colctbs.dma;
> +
> +=09/* Reference */
> +
> +=09ret =3D ref_setup(ctx);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09/* Slice */
> +
> +=09if (encode->slice_type =3D=3D V4L2_H264_SLICE_TYPE_I)
> +=09=09regs->swreg5.frame_coding_type =3D
> +=09=09=09HANTRO_VC8000E_SWREG5_FRAME_CODING_TYPE_I;
> +=09else if (encode->slice_type =3D=3D V4L2_H264_SLICE_TYPE_P)
> +=09=09regs->swreg5.frame_coding_type =3D
> +=09=09=09HANTRO_VC8000E_SWREG5_FRAME_CODING_TYPE_P;
> +=09else
> +=09=09return -EINVAL;
> +
> +=09if (encode->flags & V4L2_H264_ENCODE_FLAG_IDR_PIC) {
> +=09=09regs->swreg191.nal_unit_type =3D V4L2_H264_NALU_TYPE_SLICE_IDR;
> +=09=09regs->swreg193.idr_pic_id =3D encode->idr_pic_id;
> +=09} else {
> +=09=09regs->swreg191.nal_unit_type =3D
> +=09=09=09V4L2_H264_NALU_TYPE_SLICE_NON_IDR;
> +=09}
> +
> +=09regs->swreg191.pps_id =3D encode->pic_parameter_set_id;
> +
> +=09/* Quantization */
> +
> +=09regs->swreg172.qp_min =3D state->qp_min;
> +=09regs->swreg173.qp_max =3D state->qp_max;
> +=09regs->swreg7.pic_init_qp =3D pps->pic_init_qp_minus26 + 26;
> +=09regs->swreg7.pic_qp =3D enc->rc.qp;
> +=09regs->swreg4.chroma_qp_offset =3D pps->chroma_qp_index_offset;
> +
> +=09/* Coding */
> +
> +=09if (pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE) {
> +=09=09regs->swreg193.entropy_coding_mode =3D 1;
> +=09=09regs->swreg7.cabac_init_flag =3D encode->cabac_init_idc;
> +=09}
> +
> +=09if (pps->flags & V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE)
> +=09=09regs->swreg193.transform8x8_enable =3D 1;
> +
> +=09if (pps->flags & V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT=
) {
> +=09=09regs->swreg5.pps_deblocking_filter_override_enabled_flag =3D 1;
> +=09=09regs->swreg5.slice_deblocking_filter_override_flag =3D 1;
> +
> +=09=09regs->swreg6.deblocking_filter_dis =3D
> +=09=09=09encode->disable_deblocking_filter_idc;
> +=09=09regs->swreg6.deblocking_tc_offset =3D
> +=09=09=09encode->slice_alpha_c0_offset_div2;
> +=09=09regs->swreg6.deblocking_beta_offset =3D
> +=09=09=09encode->slice_beta_offset_div2;
> +=09}
> +
> +=09regs->swreg4.min_trb_size =3D HANTRO_VC8000E_SWREG4_TRB_SIZE_4X4;
> +=09regs->swreg4.max_trb_size =3D HANTRO_VC8000E_SWREG4_TRB_SIZE_16X16;
> +=09regs->swreg4.min_cb_size =3D HANTRO_VC8000E_SWREG4_CB_SIZE_8X8;
> +=09regs->swreg4.max_cb_size =3D HANTRO_VC8000E_SWREG4_CB_SIZE_16X16;
> +=09regs->swreg4.max_trans_hierarchy_depth_inter =3D 2;
> +=09regs->swreg4.max_trans_hierarchy_depth_intra =3D 1;
> +
> +=09regs->swreg36.bits_est_1n_cu_penalty =3D 15;
> +=09regs->swreg35.bits_est_tu_split_penalty =3D 3;
> +
> +=09regs->swreg35.bits_est_bias_intra_cu_8 =3D 22;
> +=09regs->swreg35.bits_est_bias_intra_cu_16 =3D 40;
> +=09regs->swreg36.bits_est_bias_intra_cu_32 =3D 86;
> +=09regs->swreg36.bits_est_bias_intra_cu_64 =3D 304;
> +=09regs->swreg36.inter_skip_bias =3D 124;
> +
> +=09regs->swreg201.mean_thr0 =3D 5;
> +=09regs->swreg201.mean_thr1 =3D 5;
> +=09regs->swreg201.mean_thr2 =3D 5;
> +=09regs->swreg201.mean_thr3 =3D 5;
> +
> +=09regs->swreg203_h264.lum_dc_sum_thr =3D 5;
> +=09regs->swreg203_h264.cb_dc_sum_thr =3D 1;
> +=09regs->swreg203_h264.cr_dc_sum_thr =3D 1;
> +
> +=09regs->swreg26.intra_size_factor_0 =3D 506;
> +=09regs->swreg26.intra_size_factor_1 =3D 506;
> +=09regs->swreg26.intra_size_factor_2 =3D 709;
> +=09regs->swreg27.intra_size_factor_3 =3D 709;
> +
> +=09regs->swreg27.intra_mode_factor_0 =3D 24;
> +=09regs->swreg27.intra_mode_factor_1 =3D 12;
> +=09regs->swreg27.intra_mode_factor_2 =3D 48;
> +
> +=09regs->swreg182.qp_delta_gain =3D 313;
> +
> +=09/* Lambda */
> +
> +=09ret =3D lambda_setup(ctx);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09/* Areas */
> +
> +=09ret =3D areas_setup(ctx);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09/* Urgent thresholds */
> +
> +=09regs->swreg272.wr_urgent_disable_threshold =3D
> +=09=09HANTRO_VC8000E_SWREG272_URGENT_THRESHOLD_DISABLE;
> +=09regs->swreg272.wr_urgent_enable_threshold =3D
> +=09=09HANTRO_VC8000E_SWREG272_URGENT_THRESHOLD_DISABLE;
> +=09regs->swreg272.rd_urgent_disable_threshold =3D
> +=09=09HANTRO_VC8000E_SWREG272_URGENT_THRESHOLD_DISABLE;
> +=09regs->swreg272.rd_urgent_enable_threshold =3D
> +=09=09HANTRO_VC8000E_SWREG272_URGENT_THRESHOLD_DISABLE;
> +
> +=09/* AXI bus */
> +
> +=09regs->swreg81.max_burst =3D 16;
> +=09regs->swreg261.axi_read_outstanding_num =3D 64;
> +=09regs->swreg246.axi_write_outstanding_num =3D 64;
> +=09regs->swreg320.axi_burst_align_rd_lu_ref_prefetch =3D 1;
> +
> +=09/* Automatic clock gating */
> +
> +=09regs->swreg3.clock_gate_inter_h264_e =3D 1;
> +=09regs->swreg3.clock_gate_inter_h265_e =3D 1;
> +=09regs->swreg3.clock_gate_inter_e =3D 1;
> +=09regs->swreg3.clock_gate_encoder_h264_e =3D 1;
> +=09regs->swreg3.clock_gate_encoder_h265_e =3D 1;
> +=09regs->swreg3.clock_gate_encoder_e =3D 1;
> +
> +=09/* IRQ status */
> +
> +=09regs->swreg1.irq =3D 1;
> +=09regs->swreg1.frame_rdy_status =3D 1;
> +=09regs->swreg1.bus_error_status =3D 1;
> +=09regs->swreg1.sw_reset =3D 1;
> +=09regs->swreg1.buffer_full =3D 1;
> +=09regs->swreg1.timeout =3D 1;
> +=09regs->swreg1.irq_line_buffer =3D 1;
> +=09regs->swreg1.slice_rdy_status =3D 1;
> +
> +=09/* IRQ */
> +
> +=09regs->swreg1.irq_dis =3D 0;
> +=09regs->swreg1.timeout_int =3D 1;
> +
> +=09/* Register write */
> +
> +=09hantro_io_copy(vpu->enc_base, regs, sizeof(*regs));
> +
> +=09hantro_end_prepare_run(ctx);
> +
> +=09/* Enable */
> +
> +=09regs->swreg5.enable =3D 1;
> +
> +=09hantro_vc8000e_swreg_write(vpu, regs, swreg5);
> +
> +=09return 0;
> +}
> +
> +void hantro_vc8000e_h264_enc_done(struct hantro_ctx *ctx)
> +{
> +=09struct hantro_dev *vpu =3D ctx->dev;
> +=09struct hantro_h264_enc_hw_ctx *h264_ctx =3D &ctx->h264_enc;
> +=09struct hantro_vc8000e_regs *regs =3D &h264_ctx->vc8000e_regs;
> +=09struct v4l2_h264_enc *enc =3D &h264_ctx->enc;
> +=09struct vb2_v4l2_buffer *dst_buf =3D hantro_get_dst_buf(ctx);
> +=09u32 bytesused;
> +
> +=09hantro_vc8000e_swreg_read(vpu, regs, swreg9);
> +
> +=09bytesused =3D regs->swreg9.output_strm_buffer_limit +
> +=09=09    v4l2_h264_enc_rbsp_bytes_count(&enc->rbsp);
> +
> +=09vb2_set_plane_payload(&dst_buf->vb2_buf, 0, bytesused);
> +
> +=09v4l2_h264_enc_complete(enc, dst_buf);
> +}
> diff --git a/drivers/media/platform/verisilicon/hantro_vc8000e_regs.h b/d=
rivers/media/platform/verisilicon/hantro_vc8000e_regs.h
> new file mode 100644
> index 000000000000..fad100572708
> --- /dev/null
> +++ b/drivers/media/platform/verisilicon/hantro_vc8000e_regs.h
> @@ -0,0 +1,2129 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Hantro VPU codec driver
> + *
> + * Copyright (C) 2025-2026 Paul Kocialkowski <paulk@sys-base.io>
> + */
> +
> +#ifndef HANTRO_VC8000E_REGS_H_
> +#define HANTRO_VC8000E_REGS_H_
> +
> +#include <linux/types.h>
> +
> +#define HANTRO_VC8000E_SWREG_OFFSET(s) \
> +=09offsetof(struct hantro_vc8000e_regs, s)
> +
> +#define hantro_vc8000e_swreg_read(v, r, s) \
> +=09({ \
> +=09=09u32 *pointer =3D (u32 *)&(r)->s; \
> +=09=09*pointer =3D vepu_read(v, HANTRO_VC8000E_SWREG_OFFSET(s)); \
> +=09})
> +
> +#define hantro_vc8000e_swreg_write(v, r, s) \
> +=09({ \
> +=09=09u32 *pointer =3D (u32 *)&(r)->s; \
> +=09=09vepu_write(v, *pointer, HANTRO_VC8000E_SWREG_OFFSET(s)); \
> +=09})
> +
> +#define HANTRO_VC8000E_SWREG0_MAJOR_NUMBER_V6_0=09=090x60
> +#define HANTRO_VC8000E_SWREG0_MAJOR_NUMBER_V6_1=09=090x61
> +#define HANTRO_VC8000E_SWREG0_MAJOR_NUMBER_V6_2=09=090x62
> +#define HANTRO_VC8000E_SWREG0_PRODUCT_ID_VC8000E=090x8000
> +
> +#define HANTRO_VC8000E_SWREG4_OUTPUT_STRM_MODE_BYTE_STREAM=090x0
> +#define HANTRO_VC8000E_SWREG4_OUTPUT_STRM_MODE_NAL_STREAM=090x1
> +#define HANTRO_VC8000E_SWREG4_TRB_SIZE_4X4=09=09=090x0
> +#define HANTRO_VC8000E_SWREG4_TRB_SIZE_8X8=09=09=090x1
> +#define HANTRO_VC8000E_SWREG4_TRB_SIZE_16X16=09=09=090x2
> +#define HANTRO_VC8000E_SWREG4_TRB_SIZE_32X32=09=09=090x3
> +#define HANTRO_VC8000E_SWREG4_CB_SIZE_8X8=09=09=090x0
> +#define HANTRO_VC8000E_SWREG4_CB_SIZE_16X16=09=09=090x1
> +#define HANTRO_VC8000E_SWREG4_CB_SIZE_32X32=09=09=090x2
> +#define HANTRO_VC8000E_SWREG4_CB_SIZE_64X64=09=09=090x3
> +#define HANTRO_VC8000E_SWREG4_MODE_HEVC=09=09=09=090x1
> +#define HANTRO_VC8000E_SWREG4_MODE_H264=09=09=09=090x2
> +#define HANTRO_VC8000E_SWREG4_MODE_JPEG=09=09=09=090x4
> +
> +#define HANTRO_VC8000E_SWREG5_FRAME_CODING_TYPE_P=090x0
> +#define HANTRO_VC8000E_SWREG5_FRAME_CODING_TYPE_I=090x1
> +#define HANTRO_VC8000E_SWREG5_FRAME_CODING_TYPE_B=090x2
> +
> +#define HANTRO_VC8000E_SWREG36_OUTPUT_BITWIDTH_CHROMA_8_BIT=090x0
> +#define HANTRO_VC8000E_SWREG36_OUTPUT_BITWIDTH_CHROMA_9_BIT=090x1
> +#define HANTRO_VC8000E_SWREG36_OUTPUT_BITWIDTH_CHROMA_10_BIT=090x2
> +
> +#define HANTRO_VC8000E_SWREG38_OUTPUT_BITWIDTH_LUM_8_BIT=090x0
> +#define HANTRO_VC8000E_SWREG38_OUTPUT_BITWIDTH_LUM_9_BIT=090x1
> +#define HANTRO_VC8000E_SWREG38_OUTPUT_BITWIDTH_LUM_10_BIT=090x2
> +#define HANTRO_VC8000E_SWREG38_INPUT_ROTATION_0=09=09=090x0
> +#define HANTRO_VC8000E_SWREG38_INPUT_ROTATION_90=09=090x1
> +#define HANTRO_VC8000E_SWREG38_INPUT_ROTATION_270=09=090x2
> +#define HANTRO_VC8000E_SWREG38_INPUT_ROTATION_180=09=090x3
> +#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_YUV420P=09=090x0
> +#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_YUV420SP=09=090x1
> +#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_YUYV422=09=090x2
> +#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_UYVY422=09=090x3
> +#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_RGB565=09=090x4
> +#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_RGB555=09=090x5
> +#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_RGB444=09=090x6
> +#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_RGB888=09=090x7
> +#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_RGB101010=09=090x8
> +#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_I010=09=090x9
> +#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_P010=09=090xa
> +#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_PACKED10BITPLANAR=090xb
> +#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_Y0L2=09=090xc
> +#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_DAHUAHEVC=09=090xd
> +#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_DAHUAH264=09=090xe
> +
> +#define HANTRO_VC8000E_SWREG80_HWBUSWIDTH_32_BIT=090x0
> +#define HANTRO_VC8000E_SWREG80_HWBUSWIDTH_64_BIT=090x1
> +#define HANTRO_VC8000E_SWREG80_HWBUSWIDTH_128_BIT=090x2
> +#define HANTRO_VC8000E_SWREG80_HWBUS_AHB=09=090x1
> +#define HANTRO_VC8000E_SWREG80_HWBUS_OCP=09=090x2
> +#define HANTRO_VC8000E_SWREG80_HWBUS_AXI=09=090x3
> +#define HANTRO_VC8000E_SWREG80_HWBUS_PCI=09=090x4
> +#define HANTRO_VC8000E_SWREG80_HWBUS_AXIAHB=09=090x5
> +#define HANTRO_VC8000E_SWREG80_HWBUS_AXIAPB=09=090x6
> +
> +#define HANTRO_VC8000E_SWREG_ROI_QP_TYPE_DELTA=09=090x0
> +#define HANTRO_VC8000E_SWREG_ROI_QP_TYPE_ABSOLUTE=090x1
> +
> +#define HANTRO_VC8000E_SWREG181_RC_BLOCK_SIZE_64X64=090x0
> +#define HANTRO_VC8000E_SWREG181_RC_BLOCK_SIZE_32X32=090x1
> +#define HANTRO_VC8000E_SWREG181_RC_BLOCK_SIZE_16X16=090x2
> +
> +#define HANTRO_VC8000E_SWREG199_HASH_TYPE_NONE=09=090x0
> +#define HANTRO_VC8000E_SWREG199_HASH_TYPE_CRC32=09=090x1
> +#define HANTRO_VC8000E_SWREG199_HASH_TYPE_CHECKSUM32=090x2
> +
> +#define HANTRO_VC8000E_SWREG214_HWROIMAPVERSION_4_BPP=090x0
> +#define HANTRO_VC8000E_SWREG214_HWROIMAPVERSION_8_BPP=090x1
> +
> +#define HANTRO_VC8000E_SWREG226_HWINLOOPDSRATIO_1_1=09=09=090x0
> +#define HANTRO_VC8000E_SWREG226_HWINLOOPDSRATIO_1_2=09=09=090x1
> +#define HANTRO_VC8000E_SWREG226_BFRAME_ME4N_HOR_SEARCHRANGE_64=09=090x0
> +#define HANTRO_VC8000E_SWREG226_BFRAME_ME4N_HOR_SEARCHRANGE_128=09=090x1
> +#define HANTRO_VC8000E_SWREG226_BFRAME_ME4N_HOR_SEARCHRANGE_192=09=090x2
> +#define HANTRO_VC8000E_SWREG226_BFRAME_ME4N_HOR_SEARCHRANGE_256=09=090x3
> +#define HANTRO_VC8000E_SWREG226_HWP010REFSUPPORT_NORMAL=09=09=090x0
> +#define HANTRO_VC8000E_SWREG226_HWP010REFSUPPORT_TILED_P010=09=090x1
> +
> +#define HANTRO_VC8000E_SWREG272_URGENT_THRESHOLD_DISABLE=090xff
> +
> +#define HANTRO_VC8000E_SWREG281_CHROMA_FORMAT_IDC_400=090x0
> +#define HANTRO_VC8000E_SWREG281_CHROMA_FORMAT_IDC_420=090x1
> +
> +struct hantro_vc8000e_regs {

I like register structure, not everyone do, but I do and I think its good f=
irt
for group of 32 bit. But I also very like consistent code and this bring a =
third
style to this old driver. Please sync with Benjamin on the direction here a=
nd
find a direction. I think he was looking at buffered register, but not regm=
ap
and not bit field.

Nicolas

> +=09struct {
> +=09=09u32 minor_number=09: 8;
> +=09=09u32 major_number=09: 8;
> +=09=09u32 product_id=09=09: 16;
> +=09} swreg0;
> +
> +=09struct {
> +=09=09u32 irq=09=09=09=09: 1;
> +=09=09u32 irq_dis=09=09=09: 1;
> +=09=09u32 frame_rdy_status=09=09: 1;
> +=09=09u32 bus_error_status=09=09: 1;
> +=09=09u32 sw_reset=09=09=09: 1;
> +=09=09u32 buffer_full=09=09=09: 1;
> +=09=09u32 timeout=09=09=09: 1;
> +=09=09u32 irq_line_buffer=09=09: 1;
> +=09=09u32 slice_rdy_status=09=09: 1;
> +=09=09u32 irq_fuse_error=09=09: 1;
> +=09=09u32 reserved0=09=09=09: 1;
> +=09=09u32 timeout_int=09=09=09: 1;
> +=09=09u32 strm_segment_rdy_int=09: 1;
> +=09=09u32 reserved1=09=09=09: 19;
> +=09} swreg1;
> +
> +=09struct {
> +=09=09u32 ctb_rc_mem_out_swap=09=09: 4;
> +=09=09u32 roi_map_qp_delta_map_swap=09: 4;
> +=09=09u32 pic_swap=09=09=09: 4;
> +=09=09u32 strm_swap=09=09=09: 4;
> +=09=09u32 axi_read_id=09=09=09: 8;
> +=09=09u32 axi_write_id=09=09: 8;
> +=09} swreg2;
> +
> +=09struct {
> +=09=09u32 reserved0=09=09=09: 1;
> +=09=09u32 strm_segment_int=09=09: 1;
> +=09=09u32 line_buffer_int=09=09: 1;
> +=09=09u32 slice_int=09=09=09: 1;
> +=09=09u32 reserved1=09=09=09: 16;
> +=09=09u32 cu_info_mem_out_swap=09: 4;
> +=09=09u32 axi_rd_id_e=09=09=09: 1;
> +=09=09u32 axi_wr_id_e=09=09=09: 1;
> +=09=09u32 clock_gate_inter_h264_e=09: 1;
> +=09=09u32 clock_gate_inter_h265_e=09: 1;
> +=09=09u32 clock_gate_inter_e=09=09: 1;
> +=09=09u32 clock_gate_encoder_h264_e=09: 1;
> +=09=09u32 clock_gate_encoder_h265_e=09: 1;
> +=09=09u32 clock_gate_encoder_e=09: 1;
> +=09} swreg3;
> +
> +=09struct {
> +=09=09u32 max_trans_hierarchy_depth_inter=09: 3;
> +=09=09u32 max_trans_hierarchy_depth_intra=09: 3;
> +=09=09u32 sao_enable=09=09=09=09: 1;
> +=09=09u32 active_override_flag=09=09: 1;
> +=09=09u32 scaling_list_enabled_flag=09=09: 1;
> +=09=09u32 reserved0=09=09=09=09: 2;
> +=09=09u32 bw_linebuf_disable=09=09=09: 1;
> +=09=09u32 strong_intra_smoothing_enabled_flag=09: 1;
> +=09=09u32 chroma_qp_offset=09=09=09: 5;
> +=09=09u32 output_strm_mode=09=09=09: 1;
> +=09=09u32 max_trb_size=09=09=09: 2;
> +=09=09u32 min_trb_size=09=09=09: 2;
> +=09=09u32 max_cb_size=09=09=09=09: 2;
> +=09=09u32 min_cb_size=09=09=09=09: 2;
> +=09=09u32 reserved1=09=09=09=09: 2;
> +=09=09u32 mode=09=09=09=09: 3;
> +=09} swreg4;
> +
> +=09union {
> +=09=09struct {
> +=09=09=09u32 enable=09=09=09=09=09: 1;
> +=09=09=09u32 frame_coding_type=09=09=09=09: 2;
> +=09=09=09u32 ref_frames=09=09=09=09=09: 2;
> +=09=09=09u32 buffer_full_continue=09=09=09: 1;
> +=09=09=09u32 output_cu_info_enabled=09=09=09: 1;
> +=09=09=09u32 reserved0=09=09=09=09=09: 1;
> +=09=09=09u32 slice_deblocking_filter_override_flag=09: 1;
> +=09=09=09u32 pps_deblocking_filter_override_enabled_flag=09: 1;
> +=09=09=09u32 reserved1=09=09=09=09=09: 1;
> +=09=09=09u32 pic_height=09=09=09=09=09: 11;
> +=09=09=09u32 pic_width=09=09=09=09=09: 10;
> +=09=09} swreg5;
> +
> +=09=09struct {
> +=09=09=09u32 reserved=09=09: 8;
> +=09=09=09u32 jpeg_pic_height=09: 12;
> +=09=09=09u32 jpeg_pic_width=09: 12;
> +=09=09} swreg5_jpeg;
> +=09};
> +
> +=09struct {
> +=09=09u32 cu_qp_delta_enabled=09=09: 1;
> +=09=09u32 nal_size_write=09=09: 1;
> +=09=09u32 rps_id=09=09=09: 5;
> +=09=09u32 deblocking_beta_offset=09: 4;
> +=09=09u32 deblocking_tc_offset=09: 4;
> +=09=09u32 deblocking_filter_dis=09: 1;
> +=09=09u32 num_positive_pics=09=09: 2;
> +=09=09u32 num_negative_pics=09=09: 2;
> +=09=09u32 num_short_term_ref_pic_sets=09: 5;
> +=09=09u32 slice_size=09=09=09: 7;
> +=09} swreg6;
> +
> +=09struct {
> +=09=09u32 roi2_delta_qp=09=09: 4;
> +=09=09u32 roi1_delta_qp=09=09: 4;
> +=09=09u32 pic_qp=09=09=09: 6;
> +=09=09u32 diff_cu_qp_delta_depth=09: 2;
> +=09=09u32 reserved=09=09=09: 1;
> +=09=09u32 num_slices_ready=09=09: 8;
> +=09=09u32 cabac_init_flag=09=09: 1;
> +=09=09u32 pic_init_qp=09=09=09: 6;
> +=09} swreg7;
> +
> +=09struct {
> +=09=09u32 output_strm_base=09: 32;
> +=09} swreg8;
> +
> +=09struct {
> +=09=09u32 output_strm_buffer_limit=09: 32;
> +=09} swreg9;
> +
> +=09struct {
> +=09=09u32 size_tbl_base=09: 32;
> +=09} swreg10;
> +
> +=09struct {
> +=09=09u32 poc=09: 32;
> +=09} swreg11;
> +
> +=09struct {
> +=09=09u32 input_y_base=09: 32;
> +=09} swreg12;
> +
> +=09struct {
> +=09=09u32 input_cb_base=09: 32;
> +=09} swreg13;
> +
> +=09struct {
> +=09=09u32 input_cr_base=09: 32;
> +=09} swreg14;
> +
> +=09struct {
> +=09=09u32 recon_y_base=09: 32;
> +=09} swreg15;
> +
> +=09struct {
> +=09=09u32 recon_chroma_base=09: 32;
> +=09} swreg16;
> +
> +=09struct {
> +=09=09u32 l0_ref1_chroma_compressor_enable=09: 1;
> +=09=09u32 l0_ref1_luma_compressor_enable=09: 1;
> +=09=09u32 l0_ref0_chroma_compressor_enable=09: 1;
> +=09=09u32 l0_ref0_luma_compressor_enable=09: 1;
> +=09=09u32 recon_chroma_compressor_enable=09: 1;
> +=09=09u32 recon_luma_compressor_enable=09: 1;
> +=09=09u32 active_l0_cnt=09=09=09: 2;
> +=09=09u32 l0_used_by_curr_pic1=09=09: 1;
> +=09=09u32 l0_long_term_flag1=09=09=09: 1;
> +=09=09u32 l0_delta_poc1=09=09=09: 10;
> +=09=09u32 l0_used_by_curr_pic0=09=09: 1;
> +=09=09u32 l0_long_term_flag0=09=09=09: 1;
> +=09=09u32 l0_delta_poc0=09=09=09: 10;
> +=09} swreg17;
> +
> +=09union {
> +=09=09struct {
> +=09=09=09u32 refpic_recon_l0_y0=09: 32;
> +=09=09} swreg18;
> +
> +=09=09struct {
> +=09=09=09u32 jpeg_rst=09=09: 16;
> +=09=09=09u32 jpeg_rstint=09=09: 8;
> +=09=09=09u32 jpeg_mode=09=09: 1;
> +=09=09=09u32 jpeg_slice=09=09: 1;
> +=09=09=09u32 strm_startoffset=09: 6;
> +=09=09} swreg18_jpeg;
> +=09};
> +
> +=09union {
> +=09=09struct {
> +=09=09=09u32 refpic_recon_l0_chroma0=09: 32;
> +=09=09} swreg19;
> +
> +=09=09struct {
> +=09=09=09u32 strm_hdrrem1=09: 32;
> +=09=09} swreg19_jpeg;
> +=09};
> +
> +=09union {
> +=09=09struct {
> +=09=09=09u32 refpic_recon_l0_y1=09: 32;
> +=09=09} swreg20;
> +
> +=09=09struct {
> +=09=09=09u32 reserved=09=09: 8;
> +=09=09=09u32 ljpeg_pt=09=09: 3;
> +=09=09=09u32 ljpeg_psv=09=09: 3;
> +=09=09=09u32 ljpeg_format=09: 2;
> +=09=09=09u32 ljpeg_en=09=09: 1;
> +=09=09=09u32 jpeg_rowlength=09: 15;
> +=09=09} swreg20_jpeg;
> +=09};
> +
> +=09union {
> +=09=09struct {
> +=09=09=09u32 refpic_recon_l0_chroma1=09: 32;
> +=09=09} swreg21;
> +
> +=09=09struct {
> +=09=09=09u32 strm_hdrrem2=09: 32;
> +=09=09} swreg21_jpeg;
> +=09};
> +
> +=09struct {
> +=09=09u32 roi_area_enable=09: 1;
> +=09=09u32 roi_map_enable=09: 1;
> +=09=09u32 qadj_enable=09=09: 1;
> +=09=09u32 rc_enable=09=09: 1;
> +=09=09u32 cir_interval=09: 14;
> +=09=09u32 cir_start=09=09: 14;
> +=09} swreg22;
> +
> +=09struct {
> +=09=09u32 intra_area_bottom=09: 8;
> +=09=09u32 intra_area_top=09: 8;
> +=09=09u32 intra_area_right=09: 8;
> +=09=09u32 intra_area_left=09: 8;
> +=09} swreg23;
> +
> +=09struct {
> +=09=09u32 roi1_bottom=09: 8;
> +=09=09u32 roi1_top=09: 8;
> +=09=09u32 roi1_right=09: 8;
> +=09=09u32 roi1_left=09: 8;
> +=09} swreg24;
> +
> +=09struct {
> +=09=09u32 roi2_bottom=09: 8;
> +=09=09u32 roi2_top=09: 8;
> +=09=09u32 roi2_right=09: 8;
> +=09=09u32 roi2_left=09: 8;
> +=09} swreg25;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 2;
> +=09=09u32 intra_size_factor_2=09: 10;
> +=09=09u32 intra_size_factor_1=09: 10;
> +=09=09u32 intra_size_factor_0=09: 10;
> +=09} swreg26;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 4;
> +=09=09u32 intra_mode_factor_2=09: 7;
> +=09=09u32 intra_mode_factor_1=09: 6;
> +=09=09u32 intra_mode_factor_0=09: 5;
> +=09=09u32 intra_size_factor_3=09: 10;
> +=09} swreg27;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 6;
> +=09=09u32 lambda_satd_me_1=09: 13;
> +=09=09u32 lambda_satd_me_0=09: 13;
> +=09} swreg28;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 6;
> +=09=09u32 lambda_satd_me_3=09: 13;
> +=09=09u32 lambda_satd_me_2=09: 13;
> +=09} swreg29;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 6;
> +=09=09u32 lambda_satd_me_5=09: 13;
> +=09=09u32 lambda_satd_me_4=09: 13;
> +=09} swreg30;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 6;
> +=09=09u32 lambda_satd_me_7=09: 13;
> +=09=09u32 lambda_satd_me_6=09: 13;
> +=09} swreg31;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 6;
> +=09=09u32 lambda_satd_me_9=09: 13;
> +=09=09u32 lambda_satd_me_8=09: 13;
> +=09} swreg32;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 6;
> +=09=09u32 lambda_satd_me_11=09: 13;
> +=09=09u32 lambda_satd_me_10=09: 13;
> +=09} swreg33;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 6;
> +=09=09u32 lambda_satd_me_13=09: 13;
> +=09=09u32 lambda_satd_me_12=09: 13;
> +=09} swreg34;
> +
> +=09struct {
> +=09=09u32 bits_est_bias_intra_cu_16=09: 8;
> +=09=09u32 bits_est_bias_intra_cu_8=09: 7;
> +=09=09u32 bits_est_tu_split_penalty=09: 3;
> +=09=09u32 lambda_motion_sse=09=09: 14;
> +=09} swreg35;
> +
> +=09struct {
> +=09=09u32 output_bitwidth_chroma=09: 2;
> +=09=09u32 bits_est_1n_cu_penalty=09: 4;
> +=09=09u32 inter_skip_bias=09=09: 7;
> +=09=09u32 bits_est_bias_intra_cu_64=09: 10;
> +=09=09u32 bits_est_bias_intra_cu_32=09: 9;
> +=09} swreg36;
> +
> +=09struct {
> +=09=09u32 chroffset=09=09: 4;
> +=09=09u32 lambda_sao_luma=09: 14;
> +=09=09u32 lambda_sao_chroma=09: 14;
> +=09} swreg37;
> +
> +=09struct {
> +=09=09u32 mirror=09=09: 1;
> +=09=09u32 yfill=09=09: 3;
> +=09=09u32 xfill=09=09: 2;
> +=09=09u32 rowlength=09=09: 14;
> +=09=09u32 lumoffset=09=09: 4;
> +=09=09u32 output_bitwidth_lum=09: 2;
> +=09=09u32 input_rotation=09: 2;
> +=09=09u32 input_format=09: 4;
> +=09} swreg38;
> +
> +=09struct {
> +=09=09u32 rgbcoeffb=09: 16;
> +=09=09u32 rgbcoeffa=09: 16;
> +=09} swreg39;
> +
> +=09struct {
> +=09=09u32 rgbcoeffe=09: 16;
> +=09=09u32 rgbcoeffc=09: 16;
> +=09} swreg40;
> +
> +=09struct {
> +=09=09u32 reserved=09: 1;
> +=09=09u32 bmaskmsb=09: 5;
> +=09=09u32 gmaskmsb=09: 5;
> +=09=09u32 rmaskmsb=09: 5;
> +=09=09u32 rgbcoefff=09: 16;
> +=09} swreg41;
> +
> +=09struct {
> +=09=09u32 basescaledoutlum=09: 32;
> +=09} swreg42;
> +
> +=09struct {
> +=09=09u32 scale_mode=09=09: 2;
> +=09=09u32 scaledoutwidthmsb=09: 1;
> +=09=09u32 scaledoutwidthratio=09: 16;
> +=09=09u32 scaledoutwidth=09: 13;
> +=09} swreg43;
> +
> +=09struct {
> +=09=09u32 input_format_msb=09=09: 2;
> +=09=09u32 scaledoutheightratio=09: 16;
> +=09=09u32 scaledoutheight=09=09: 14;
> +=09} swreg44;
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09: 2;
> +=09=09u32 scaledout_format=09=09: 1;
> +=09=09u32 nalunitsize_swap=09=09: 4;
> +=09=09u32 scaledverticalcopy=09=09: 1;
> +=09=09u32 scaledhorizontalcopy=09: 1;
> +=09=09u32 vscale_weight_en=09=09: 1;
> +=09=09u32 scaledskiptoppixelrow=09: 2;
> +=09=09u32 scaledskipleftpixelcolumn=09: 2;
> +=09=09u32 encoded_ctb_number=09=09: 13;
> +=09=09u32 chroma_swap=09=09=09: 1;
> +=09=09u32 scaledout_swap=09=09: 4;
> +=09} swreg45;
> +
> +=09struct {
> +=09=09u32 compressedcoeff_base=09: 32;
> +=09} swreg46;
> +
> +=09struct {
> +=09=09u32 compressedcoeff_base_msb=09: 32;
> +=09} swreg47;
> +
> +=09struct {
> +=09=09u32 basescaledoutlum_msb=09: 32;
> +=09} swreg48;
> +
> +=09struct {
> +=09=09u32 refpic_recon_l0_y0_msb=09: 32;
> +=09} swreg49;
> +
> +=09struct {
> +=09=09u32 refpic_recon_l0_chroma0_msb=09: 32;
> +=09} swreg50;
> +
> +=09struct {
> +=09=09u32 refpic_recon_l0_y1_msb=09: 32;
> +=09} swreg51;
> +
> +=09struct {
> +=09=09u32 refpic_recon_l0_chroma1_msb=09: 32;
> +=09} swreg52;
> +
> +=09struct {
> +=09=09u32 input_y_base_msb=09: 32;
> +=09} swreg53;
> +
> +=09struct {
> +=09=09u32 input_cb_base_msb=09: 32;
> +=09} swreg54;
> +
> +=09struct {
> +=09=09u32 input_cr_base_msb=09: 32;
> +=09} swreg55;
> +
> +=09struct {
> +=09=09u32 recon_y_base_msb=09: 32;
> +=09} swreg56;
> +
> +=09struct {
> +=09=09u32 recon_chroma_base_msb=09: 32;
> +=09} swreg57;
> +
> +=09struct {
> +=09=09u32 size_tbl_base_msb=09: 32;
> +=09} swreg58;
> +
> +=09struct {
> +=09=09u32 output_strm_base_msb=09: 32;
> +=09} swreg59;
> +
> +=09struct {
> +=09=09u32 recon_luma_compress_table_base=09: 32;
> +=09} swreg60;
> +
> +=09struct {
> +=09=09u32 recon_luma_compress_table_base_msb=09: 32;
> +=09} swreg61;
> +
> +=09struct {
> +=09=09u32 recon_chroma_compress_table_base=09: 32;
> +=09} swreg62;
> +
> +=09struct {
> +=09=09u32 recon_chroma_compress_table_base_msb=09: 32;
> +=09} swreg63;
> +
> +=09struct {
> +=09=09u32 l0_ref0_luma_compress_table_base=09: 32;
> +=09} swreg64;
> +
> +=09struct {
> +=09=09u32 l0_ref0_luma_compress_table_base_msb=09: 32;
> +=09} swreg65;
> +
> +=09struct {
> +=09=09u32 l0_ref0_chroma_compress_table_base=09: 32;
> +=09} swreg66;
> +
> +=09struct {
> +=09=09u32 l0_ref0_chroma_compress_table_base_msb=09: 32;
> +=09} swreg67;
> +
> +=09struct {
> +=09=09u32 l0_ref1_luma_compress_table_base=09: 32;
> +=09} swreg68;
> +
> +=09struct {
> +=09=09u32 l0_ref1_luma_compress_table_base_msb=09: 32;
> +=09} swreg69;
> +
> +=09struct {
> +=09=09u32 l0_ref1_chroma_compress_table_base=09: 32;
> +=09} swreg70;
> +
> +=09struct {
> +=09=09u32 l0_ref1_chroma_compress_table_base_msb=09: 32;
> +=09} swreg71;
> +
> +=09struct {
> +=09=09u32 recon_luma_4n_base=09: 32;
> +=09} swreg72;
> +
> +=09struct {
> +=09=09u32 recon_luma_4n_base_msb=09: 32;
> +=09} swreg73;
> +
> +=09struct {
> +=09=09u32 refpic_recon_l0_4n0_base=09: 32;
> +=09} swreg74;
> +
> +=09struct {
> +=09=09u32 refpic_recon_l0_4n0_base_msb=09: 32;
> +=09} swreg75;
> +
> +=09struct {
> +=09=09u32 refpic_recon_l0_4n1_base=09: 32;
> +=09} swreg76;
> +
> +=09struct {
> +=09=09u32 refpic_recon_l0_4n1_base_msb=09: 32;
> +=09} swreg77;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 6;
> +=09=09u32 lambda_satd_me_15=09: 13;
> +=09=09u32 lambda_satd_me_14=09: 13;
> +=09} swreg78;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_0=09: 21;
> +=09} swreg79;
> +
> +=09struct {
> +=09=09u32 hwmaxvideowidth=09: 13;
> +=09=09u32 hwbuswidth=09=09: 2;
> +=09=09u32 hwjpegsupport=09: 1;
> +=09=09u32 hwtu32support=09: 1;
> +=09=09u32 hwrfcsupport=09: 1;
> +=09=09u32 hwprogrdosupport=09: 1;
> +=09=09u32 hwlinebufsupport=09: 1;
> +=09=09u32 hwcavlcsupport=09: 1;
> +=09=09u32 hwbus=09=09: 3;
> +=09=09u32 hwmain10support=09: 1;
> +=09=09u32 hwdenoisesupport=09: 1;
> +=09=09u32 hwvp9support=09: 1;
> +=09=09u32 hwhevcsupport=09: 1;
> +=09=09u32 hwrgbsupport=09: 1;
> +=09=09u32 hwbframesupport=09: 1;
> +=09=09u32 hwscalingsupport=09: 1;
> +=09=09u32 hwh264support=09: 1;
> +=09} swreg80;
> +
> +=09struct {
> +=09=09u32 timeout_cycles=09: 23;
> +=09=09u32 timeout_override_e=09: 1;
> +=09=09u32 max_burst=09=09: 8;
> +=09} swreg81;
> +
> +=09struct {
> +=09=09u32 hw_performance=09: 32;
> +=09} swreg82;
> +
> +=09struct {
> +=09=09u32 refpic_recon_l1_y0=09: 32;
> +=09} swreg83;
> +
> +=09struct {
> +=09=09u32 refpic_recon_l1_chroma0=09: 32;
> +=09} swreg84;
> +
> +=09struct {
> +=09=09u32 refpic_recon_l1_y1=09: 32;
> +=09} swreg85;
> +
> +=09struct {
> +=09=09u32 refpic_recon_l1_chroma1=09: 32;
> +=09} swreg86;
> +
> +=09struct {
> +=09=09u32 refpic_recon_l1_y0_msb=09: 32;
> +=09} swreg87;
> +
> +=09struct {
> +=09=09u32 refpic_recon_l1_chroma0_msb=09: 32;
> +=09} swreg88;
> +
> +=09struct {
> +=09=09u32 refpic_recon_l1_y1_msb=09: 32;
> +=09} swreg89;
> +
> +=09struct {
> +=09=09u32 refpic_recon_l1_chroma1_msb=09: 32;
> +=09} swreg90;
> +
> +=09struct {
> +=09=09u32 l1_ref1_chroma_compressor_enable=09: 1;
> +=09=09u32 l1_ref1_luma_compressor_enable=09: 1;
> +=09=09u32 l1_ref0_chroma_compressor_enable=09: 1;
> +=09=09u32 l1_ref0_luma_compressor_enable=09: 1;
> +=09=09u32 long_term_ref_pics_present_flag=09: 1;
> +=09=09u32 reserved=09=09=09=09: 1;
> +=09=09u32 active_l1_cnt=09=09=09: 2;
> +=09=09u32 l1_used_by_curr_pic1=09=09: 1;
> +=09=09u32 l1_long_term_flag1=09=09=09: 1;
> +=09=09u32 l1_delta_poc1=09=09=09: 10;
> +=09=09u32 l1_used_by_curr_pic0=09=09: 1;
> +=09=09u32 l1_long_term_flag0=09=09=09: 1;
> +=09=09u32 l1_delta_poc0=09=09=09: 10;
> +=09} swreg91;
> +
> +=09struct {
> +=09=09u32 refpic_recon_l1_4n0_base=09: 32;
> +=09} swreg92;
> +
> +=09struct {
> +=09=09u32 refpic_recon_l1_4n0_base_msb=09: 32;
> +=09} swreg93;
> +
> +=09struct {
> +=09=09u32 refpic_recon_l1_4n1_base=09: 32;
> +=09} swreg94;
> +
> +=09struct {
> +=09=09u32 refpic_recon_l1_4n1_base_msb=09: 32;
> +=09} swreg95;
> +
> +=09struct {
> +=09=09u32 l1_ref0_luma_compress_table_base=09: 32;
> +=09} swreg96;
> +
> +=09struct {
> +=09=09u32 l1_ref0_luma_compress_table_base_msb=09: 32;
> +=09} swreg97;
> +
> +=09struct {
> +=09=09u32 l1_ref0_chroma_compress_table_base=09: 32;
> +=09} swreg98;
> +
> +=09struct {
> +=09=09u32 l1_ref0_chroma_compress_table_base_msb=09: 32;
> +=09} swreg99;
> +
> +=09struct {
> +=09=09u32 l1_ref1_luma_compress_table_base=09: 32;
> +=09} swreg100;
> +
> +=09struct {
> +=09=09u32 l1_ref1_luma_compress_table_base_msb=09: 32;
> +=09} swreg101;
> +
> +=09struct {
> +=09=09u32 l1_ref1_chroma_compress_table_base=09: 32;
> +=09} swreg102;
> +
> +=09struct {
> +=09=09u32 l1_ref1_chroma_compress_table_base_msb=09: 32;
> +=09} swreg103;
> +
> +=09struct {
> +=09=09u32 ref_pic_list_modi_flag_l0=09: 1;
> +=09=09u32 list_entry_l0_pic0=09=09: 4;
> +=09=09u32 list_entry_l0_pic1=09=09: 4;
> +=09=09u32 reserved0=09=09=09: 7;
> +=09=09u32 ref_pic_list_modi_flag_l1=09: 1;
> +=09=09u32 list_entry_l1_pic0=09=09: 4;
> +=09=09u32 list_entry_l1_pic1=09=09: 4;
> +=09=09u32 reserved1=09=09=09: 4;
> +=09=09u32 rdo_level=09=09=09: 2;
> +=09=09u32 lists_modi_present_flag=09: 1;
> +=09} swreg104;
> +
> +=09struct {
> +=09=09u32 targetpicsize=09: 32;
> +=09} swreg105;
> +
> +=09struct {
> +=09=09u32 minpicsize=09: 32;
> +=09} swreg106;
> +
> +=09struct {
> +=09=09u32 maxpicsize=09: 32;
> +=09} swreg107;
> +
> +=09struct {
> +=09=09u32 nonzerocount=09: 24;
> +=09=09u32 averageqp=09=09: 8;
> +=09} swreg108;
> +
> +=09struct {
> +=09=09u32 roimapdeltaqpaddr=09: 32;
> +=09} swreg109;
> +
> +=09struct {
> +=09=09u32 roimapdeltaqpaddr_msb=09: 32;
> +=09} swreg110;
> +
> +=09struct {
> +=09=09u32 reserved=09: 12;
> +=09=09u32 intracu8num=09: 20;
> +=09} swreg111;
> +
> +=09struct {
> +=09=09u32 reserved=09: 12;
> +=09=09u32 skipcu8num=09: 20;
> +=09} swreg112;
> +
> +=09struct {
> +=09=09u32 pbframe4nrdcost=09: 32;
> +=09} swreg113;
> +
> +=09struct {
> +=09=09u32 colctbs_store_base=09: 32;
> +=09} swreg114;
> +
> +=09struct {
> +=09=09u32 colctbs_store_base_msb=09: 32;
> +=09} swreg115;
> +
> +=09struct {
> +=09=09u32 colctbs_load_base=09: 32;
> +=09} swreg116;
> +
> +=09struct {
> +=09=09u32 colctbs_load_base_msb=09: 32;
> +=09} swreg117;
> +
> +=09struct {
> +=09=09u32 ctbrcthrdmax=09: 16;
> +=09=09u32 ctbrcthrdmin=09: 16;
> +=09} swreg118;
> +
> +=09struct {
> +=09=09u32 ctbbitsmax=09: 16;
> +=09=09u32 ctbbitsmin=09: 16;
> +=09} swreg119;
> +
> +=09struct {
> +=09=09u32 totallcubits=09: 32;
> +=09} swreg120;
> +
> +=09struct {
> +=09=09u32 bitsratio=09: 32;
> +=09} swreg121;
> +
> +=09union {
> +=09=09struct {
> +=09=09=09u32 reserved=09=09: 11;
> +=09=09=09u32 lambda_sse_me_1=09: 21;
> +=09=09} swreg122;
> +
> +=09=09struct {
> +=09=09=09u32 av1_enable_order_hint=09=09: 1;
> +=09=09=09u32 av1_allow_update_cdf=09=09: 1;
> +=09=09=09u32 av1_interp_filter=09=09=09: 3;
> +=09=09=09u32 av1_switchable_motion_mode=09=09: 1;
> +=09=09=09u32 av1_cur_frame_force_integer_mv=09: 1;
> +=09=09=09u32 av1_enable_dual_filter=09=09: 1;
> +=09=09=09u32 av1_enable_interintra_compound=09: 1;
> +=09=09=09u32 av1_list1_ref_frame=09=09=09: 4;
> +=09=09=09u32 av1_list0_ref_frame=09=09=09: 4;
> +=09=09=09u32 av1_reference_mode=09=09=09: 2;
> +=09=09=09u32 av1_skip_mode_flag=09=09=09: 1;
> +=09=09=09u32 av1_allow_high_precision_mv=09=09: 1;
> +=09=09=09u32 av1_seg_enable=09=09=09: 1;
> +=09=09=09u32 av1_reduced_tx_set_used=09=09: 1;
> +=09=09=09u32 av1_tx_mode=09=09=09=09: 2;
> +=09=09=09u32 av1_enable_filter_intra=09=09: 1;
> +=09=09=09u32 av1_delta_q_res=09=09=09: 4;
> +=09=09=09u32 av1_coded_lossless=09=09=09: 1;
> +=09=09=09u32 av1_allow_intrabc=09=09=09: 1;
> +=09=09} swreg122_av1;
> +=09};
> +
> +=09union {
> +=09=09struct {
> +=09=09=09u32 ctbrc_qpdelta_flag_reverse=09: 1;
> +=09=09=09u32 reserved=09=09=09: 10;
> +=09=09=09u32 lambda_sse_me_2=09=09: 21;
> +=09=09} swreg123;
> +
> +=09=09struct {
> +=09=09=09u32 reserved=09=09=09: 1;
> +=09=09=09u32 av1_btxtypesearch=09=09: 1;
> +=09=09=09u32 av1_primary_ref_frame=09: 3;
> +=09=09=09u32 av1_sharpness_lvl=09=09: 3;
> +=09=09=09u32 av1_db_filter_lvl_v=09=09: 6;
> +=09=09=09u32 av1_db_filter_lvl_u=09=09: 6;
> +=09=09=09u32 av1_db_filter_lvl1=09=09: 6;
> +=09=09=09u32 av1_db_filter_lvl0=09=09: 6;
> +=09=09} swreg123_av1;
> +=09};
> +
> +=09union {
> +=09=09struct {
> +=09=09=09u32 reserved=09=09: 11;
> +=09=09=09u32 lambda_sse_me_3=09: 21;
> +=09=09} swreg124;
> +
> +=09=09struct {
> +=09=09=09u32 reserved=09=09=09: 15;
> +=09=09=09u32 av1_cdef_bits=09=09: 2;
> +=09=09=09u32 av1_cdef_uv_strengths=09: 6;
> +=09=09=09u32 av1_cdef_strengths=09=09: 6;
> +=09=09=09u32 av1_cdef_damping=09=09: 3;
> +=09=09} swreg124_av1;
> +=09};
> +
> +=09union {
> +=09=09struct {
> +=09=09=09u32 reserved=09=09: 4;
> +=09=09=09u32 intra_satd_lambda_1=09: 14;
> +=09=09=09u32 intra_satd_lambda_0=09: 14;
> +=09=09} swreg125;
> +
> +=09=09struct {
> +=09=09=09u32 av1_framectx_base=09: 32;
> +=09=09} swreg125_av1;
> +=09};
> +
> +=09union {
> +=09=09struct {
> +=09=09=09u32 reserved=09=09: 4;
> +=09=09=09u32 intra_satd_lambda_3=09: 14;
> +=09=09=09u32 intra_satd_lambda_2=09: 14;
> +=09=09} swreg126;
> +
> +=09=09struct {
> +=09=09=09u32 av1_framectx_base_msb=09: 32;
> +=09=09} swreg126_av1;
> +=09};
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 4;
> +=09=09u32 intra_satd_lambda_5=09: 14;
> +=09=09u32 intra_satd_lambda_4=09: 14;
> +=09} swreg127;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 4;
> +=09=09u32 intra_satd_lambda_7=09: 14;
> +=09=09u32 intra_satd_lambda_6=09: 14;
> +=09} swreg128;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 4;
> +=09=09u32 intra_satd_lambda_9=09: 14;
> +=09=09u32 intra_satd_lambda_8=09: 14;
> +=09} swreg129;
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09: 4;
> +=09=09u32 intra_satd_lambda_11=09: 14;
> +=09=09u32 intra_satd_lambda_10=09: 14;
> +=09} swreg130;
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09: 4;
> +=09=09u32 intra_satd_lambda_13=09: 14;
> +=09=09u32 intra_satd_lambda_12=09: 14;
> +=09} swreg131;
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09: 4;
> +=09=09u32 intra_satd_lambda_15=09: 14;
> +=09=09u32 intra_satd_lambda_14=09: 14;
> +=09} swreg132;
> +
> +=09struct {
> +=09=09u32 sse_div_256=09: 32;
> +=09} swreg133;
> +
> +=09struct {
> +=09=09u32 nr_mbnum_invert_reg=09=09: 16;
> +=09=09u32 reserved=09=09=09: 8;
> +=09=09u32 noise_low=09=09=09: 6;
> +=09=09u32 noise_reduction_enable=09: 2;
> +=09} swreg134;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 5;
> +=09=09u32 thresh_sigma_cur=09: 21;
> +=09=09u32 sliceqp_prev=09: 6;
> +=09} swreg135;
> +
> +=09struct {
> +=09=09u32 frame_sigma_calced=09: 16;
> +=09=09u32 sigma_cur=09=09: 16;
> +=09} swreg136;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 thresh_sigma_calced=09: 21;
> +=09} swreg137;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_4=09: 21;
> +=09} swreg138;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_5=09: 21;
> +=09} swreg139;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_6=09: 21;
> +=09} swreg140;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_7=09: 21;
> +=09} swreg141;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_8=09: 21;
> +=09} swreg142;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_9=09: 21;
> +=09} swreg143;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_10=09: 21;
> +=09} swreg144;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_11=09: 21;
> +=09} swreg145;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_12=09: 21;
> +=09} swreg146;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_13=09: 21;
> +=09} swreg147;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_14=09: 21;
> +=09} swreg148;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_15=09: 21;
> +=09} swreg149;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 6;
> +=09=09u32 lambda_satd_me_17=09: 13;
> +=09=09u32 lambda_satd_me_16=09: 13;
> +=09} swreg150;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 6;
> +=09=09u32 lambda_satd_me_19=09: 13;
> +=09=09u32 lambda_satd_me_18=09: 13;
> +=09} swreg151;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 6;
> +=09=09u32 lambda_satd_me_21=09: 13;
> +=09=09u32 lambda_satd_me_20=09: 13;
> +=09} swreg152;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 6;
> +=09=09u32 lambda_satd_me_23=09: 13;
> +=09=09u32 lambda_satd_me_22=09: 13;
> +=09} swreg153;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 6;
> +=09=09u32 lambda_satd_me_25=09: 13;
> +=09=09u32 lambda_satd_me_24=09: 13;
> +=09} swreg154;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 6;
> +=09=09u32 lambda_satd_me_27=09: 13;
> +=09=09u32 lambda_satd_me_26=09: 13;
> +=09} swreg155;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 6;
> +=09=09u32 lambda_satd_me_29=09: 13;
> +=09=09u32 lambda_satd_me_28=09: 13;
> +=09} swreg156;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 6;
> +=09=09u32 lambda_satd_me_31=09: 13;
> +=09=09u32 lambda_satd_me_30=09: 13;
> +=09} swreg157;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_16=09: 21;
> +=09} swreg158;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_17=09: 21;
> +=09} swreg159;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_18=09: 21;
> +=09} swreg160;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_19=09: 21;
> +=09} swreg161;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_20=09: 21;
> +=09} swreg162;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_21=09: 21;
> +=09} swreg163;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_22=09: 21;
> +=09} swreg164;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_23=09: 21;
> +=09} swreg165;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_24=09: 21;
> +=09} swreg166;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_25=09: 21;
> +=09} swreg167;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_26=09: 21;
> +=09} swreg168;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 lambda_sse_me_27=09: 21;
> +=09} swreg169;
> +
> +=09union {
> +=09=09struct {
> +=09=09=09u32 roi1_delta_qp_rc=09=09: 5;
> +=09=09=09u32 rc_ctbrc_sliceqpoffset=09: 6;
> +=09=09=09u32 lambda_sse_me_28=09=09: 21;
> +=09=09} swreg170_qp_delta;
> +
> +=09=09struct {
> +=09=09=09u32 roi1_qp_type=09: 1;
> +=09=09=09u32 roi1_qp_value=09: 7;
> +=09=09=09u32 sse_qp_factor=09: 15;
> +=09=09=09u32 reserved=09=09: 8;
> +=09=09=09u32 lambda_depth=09: 1;
> +=09=09} swreg170_qp_absolute;
> +=09};
> +
> +=09union {
> +=09=09struct {
> +=09=09=09u32 roi2_delta_qp_rc=09: 5;
> +=09=09=09u32 reserved=09=09: 6;
> +=09=09=09u32 lambda_sse_me_29=09: 21;
> +=09=09} swreg171_qp_delta;
> +
> +=09=09struct {
> +=09=09=09u32 roi2_qp_type=09: 1;
> +=09=09=09u32 roi2_qp_value=09: 7;
> +=09=09=09u32 sad_qp_factor=09: 15;
> +=09=09=09u32 reserved=09=09: 9;
> +=09=09} swreg171_qp_absolute;
> +=09};
> +
> +=09struct {
> +=09=09u32 complexity_offset=09: 5;
> +=09=09u32 qp_min=09=09: 6;
> +=09=09u32 lambda_sse_me_30=09: 21;
> +=09} swreg172;
> +
> +=09struct {
> +=09=09u32 rc_qpdelta_range=09: 4;
> +=09=09u32 reserved=09=09: 1;
> +=09=09u32 qp_max=09=09: 6;
> +=09=09u32 lambda_sse_me_31=09: 21;
> +=09} swreg173;
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09: 4;
> +=09=09u32 intra_satd_lambda_17=09: 14;
> +=09=09u32 intra_satd_lambda_16=09: 14;
> +=09} swreg174;
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09: 4;
> +=09=09u32 intra_satd_lambda_19=09: 14;
> +=09=09u32 intra_satd_lambda_18=09: 14;
> +=09} swreg175;
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09: 4;
> +=09=09u32 intra_satd_lambda_21=09: 14;
> +=09=09u32 intra_satd_lambda_20=09: 14;
> +=09} swreg176;
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09: 4;
> +=09=09u32 intra_satd_lambda_23=09: 14;
> +=09=09u32 intra_satd_lambda_22=09: 14;
> +=09} swreg177;
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09: 4;
> +=09=09u32 intra_satd_lambda_25=09: 14;
> +=09=09u32 intra_satd_lambda_24=09: 14;
> +=09} swreg178;
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09: 4;
> +=09=09u32 intra_satd_lambda_27=09: 14;
> +=09=09u32 intra_satd_lambda_26=09: 14;
> +=09} swreg179;
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09: 4;
> +=09=09u32 intra_satd_lambda_29=09: 14;
> +=09=09u32 intra_satd_lambda_28=09: 14;
> +=09} swreg180;
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09: 2;
> +=09=09u32 rc_block_size=09=09: 2;
> +=09=09u32 intra_satd_lambda_31=09: 14;
> +=09=09u32 intra_satd_lambda_30=09: 14;
> +=09} swreg181;
> +
> +=09struct {
> +=09=09u32 qp_delta_gain=09: 16;
> +=09=09u32 qp_fractional=09: 16;
> +=09} swreg182;
> +
> +=09struct {
> +=09=09u32 reserved=09: 6;
> +=09=09u32 qp_sum=09: 26;
> +=09} swreg183;
> +
> +=09struct {
> +=09=09u32 reserved=09: 12;
> +=09=09u32 qp_num=09: 20;
> +=09} swreg184;
> +
> +=09struct {
> +=09=09u32 timeout_cycles_msb=09: 9;
> +=09=09u32 pic_complexity=09: 23;
> +=09} swreg185;
> +
> +=09struct {
> +=09=09u32 cu_information_table_base=09: 32;
> +=09} swreg186;
> +
> +=09struct {
> +=09=09u32 cu_information_table_base_msb=09: 32;
> +=09} swreg187;
> +
> +=09struct {
> +=09=09u32 cu_information_base=09: 32;
> +=09} swreg188;
> +
> +=09struct {
> +=09=09u32 cu_information_base_msb=09: 32;
> +=09} swreg189;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 30;
> +=09=09u32 num_long_term_pics=09: 2;
> +=09} swreg190;
> +
> +=09struct {
> +=09=09u32 slice_header_size=09: 16;
> +=09=09u32 prefixnal_svc_ext=09: 1;
> +=09=09u32 pps_id=09=09: 6;
> +=09=09u32 nuh_temporal_id=09: 3;
> +=09=09u32 nal_unit_type=09: 6;
> +=09} swreg191;
> +
> +=09struct {
> +=09=09u32 framenum=09: 32;
> +=09} swreg192;
> +
> +=09struct {
> +=09=09u32 entropy_coding_mode=09=09: 1;
> +=09=09u32 transform8x8_enable=09=09: 1;
> +=09=09u32 idr_pic_id=09=09=09: 1;
> +=09=09u32 nal_ref_idc=09=09=09: 1;
> +=09=09u32 yfill_msb=09=09=09: 2;
> +=09=09u32 xfill_msb=09=09=09: 2;
> +=09=09u32 l0_used_by_next_pic1=09: 1;
> +=09=09u32 l0_delta_framenum1=09=09: 11;
> +=09=09u32 l0_used_by_next_pic0=09: 1;
> +=09=09u32 l0_delta_framenum0=09=09: 11;
> +=09} swreg193;
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09: 2;
> +=09=09u32 cur_longtermidx=09=09: 3;
> +=09=09u32 max_longtermidx_plus1=09: 3;
> +=09=09u32 l1_used_by_next_pic1=09: 1;
> +=09=09u32 l1_delta_framenum1=09=09: 11;
> +=09=09u32 l1_used_by_next_pic0=09: 1;
> +=09=09u32 l1_delta_framenum0=09=09: 11;
> +=09} swreg194;
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09: 2;
> +=09=09u32 pic_width_msb=09=09: 2;
> +=09=09u32 roi2_bottom_msb=09=09: 1;
> +=09=09u32 roi2_top_msb=09=09: 1;
> +=09=09u32 roi2_right_msb=09=09: 1;
> +=09=09u32 roi2_left_msb=09=09: 1;
> +=09=09u32 roi1_bottom_msb=09=09: 1;
> +=09=09u32 roi1_top_msb=09=09: 1;
> +=09=09u32 roi1_right_msb=09=09: 1;
> +=09=09u32 roi1_left_msb=09=09: 1;
> +=09=09u32 intra_area_bottom_msb=09: 1;
> +=09=09u32 intra_area_top_msb=09=09: 1;
> +=09=09u32 intra_area_right_msb=09: 1;
> +=09=09u32 intra_area_left_msb=09=09: 1;
> +=09=09u32 cir_interval_msb=09=09: 4;
> +=09=09u32 cir_start_msb=09=09: 4;
> +=09=09u32 slice_size_msb=09=09: 2;
> +=09=09u32 num_slices_ready_msb=09: 2;
> +=09=09u32 encoded_ctb_number_msb=09: 4;
> +=09} swreg195;
> +
> +=09struct {
> +=09=09u32 ctb_row_wr_ptr=09=09: 10;
> +=09=09u32 ctb_row_rd_ptr=09=09: 10;
> +=09=09u32 num_ctb_rows_per_sync=09: 9;
> +=09=09u32 input_buf_loopback_en=09: 1;
> +=09=09u32 low_latency_en=09=09: 1;
> +=09=09u32 low_latency_hw_sync_en=09: 1;
> +=09} swreg196;
> +
> +=09union {
> +=09=09struct {
> +=09=09=09u32 reserved=09=09: 2;
> +=09=09=09u32 l1_delta_poc0_msb=09: 10;
> +=09=09=09u32 l0_delta_poc1_msb=09: 10;
> +=09=09=09u32 l0_delta_poc0_msb=09: 10;
> +=09=09} swreg197;
> +
> +=09=09struct {
> +=09=09=09u32 ctb_row_rd_ptr_jpeg_msb=09: 5;
> +=09=09=09u32 ctb_row_wr_ptr_jpeg_msb=09: 5;
> +=09=09=09u32 reserved=09=09=09: 22;
> +=09=09} swreg197_jpeg;
> +=09};
> +
> +=09struct {
> +=09=09u32 l1_longtermidx1=09=09: 3;
> +=09=09u32 l1_longtermidx0=09=09: 3;
> +=09=09u32 l0_longtermidx1=09=09: 3;
> +=09=09u32 l0_longtermidx0=09=09: 3;
> +=09=09u32 mark_current_longterm=09: 1;
> +=09=09u32 l0_delta_framenum0_msb=09: 9;
> +=09=09u32 l1_delta_poc1_msb=09=09: 10;
> +=09} swreg198;
> +
> +=09struct {
> +=09=09u32 osd_alphablend_enable=09: 1;
> +=09=09u32 hash_offset=09=09=09: 2;
> +=09=09u32 hash_type=09=09=09: 2;
> +=09=09u32 l1_delta_framenum1_msb=09: 9;
> +=09=09u32 l1_delta_framenum0_msb=09: 9;
> +=09=09u32 l0_delta_framenum1_msb=09: 9;
> +=09} swreg199;
> +
> +=09struct {
> +=09=09u32 hash_val=09: 32;
> +=09} swreg200;
> +
> +=09struct {
> +=09=09u32 mean_thr3=09: 8;
> +=09=09u32 mean_thr2=09: 8;
> +=09=09u32 mean_thr1=09: 8;
> +=09=09u32 mean_thr0=09: 8;
> +=09} swreg201;
> +
> +=09struct {
> +=09=09u32 thr_dc_chroma_8x8=09: 16;
> +=09=09u32 thr_dc_lum_8x8=09: 16;
> +=09} swreg202;
> +
> +=09union {
> +=09=09struct {
> +=09=09=09u32 cr_dc_sum_thr=09: 8;
> +=09=09=09u32 cb_dc_sum_thr=09: 8;
> +=09=09=09u32 reserved=09=09: 8;
> +=09=09=09u32 lum_dc_sum_thr=09: 8;
> +=09=09} swreg203_h264;
> +
> +=09=09struct {
> +=09=09=09u32 thr_dc_chroma_16x16=09: 16;
> +=09=09=09u32 thr_dc_lum_16x16=09: 16;
> +=09=09} swreg203_hevc;
> +=09};
> +
> +=09struct {
> +=09=09u32 thr_dc_chroma_32x32=09: 16;
> +=09=09u32 thr_dc_lum_32x32=09: 16;
> +=09} swreg204;
> +
> +=09struct {
> +=09=09u32 thr_ac_num_chroma_8x8=09: 16;
> +=09=09u32 thr_ac_num_lum_8x8=09=09: 16;
> +=09} swreg205;
> +
> +=09struct {
> +=09=09u32 thr_ac_num_chroma_16x16=09: 16;
> +=09=09u32 thr_ac_num_lum_16x16=09: 16;
> +=09} swreg206;
> +
> +=09struct {
> +=09=09u32 thr_ac_num_chroma_32x32=09: 16;
> +=09=09u32 thr_ac_num_lum_32x32=09: 16;
> +=09} swreg207;
> +
> +=09union {
> +=09=09struct {
> +=09=09=09u32 reserved0=09=09=09: 3;
> +=09=09=09u32 skip_map_enable=09=09: 1;
> +=09=09=09u32 ipcm1_left=09=09=09: 9;
> +=09=09=09u32 enable_smart=09=09: 1;
> +=09=09=09u32 foreground_pixel_thx=09: 6;
> +=09=09=09u32 reserved1=09=09=09: 6;
> +=09=09=09u32 smart_qp=09=09=09: 6;
> +=09=09} swreg208_h264;
> +
> +=09=09struct {
> +=09=09=09u32 reserved=09=09=09: 3;
> +=09=09=09u32 skip_map_enable=09=09: 1;
> +=09=09=09u32 ipcm1_left=09=09=09: 9;
> +=09=09=09u32 enable_smart=09=09: 1;
> +=09=09=09u32 foreground_pixel_thx=09: 6;
> +=09=09=09u32 mdqpc=09=09=09: 6;
> +=09=09=09u32 mdqpy=09=09=09: 6;
> +=09=09} swreg208_hevc;
> +=09};
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 3;
> +=09=09u32 ipcm_map_enable=09: 1;
> +=09=09u32 pcm_filter_disable=09: 1;
> +=09=09u32 ipcm1_bottom=09: 9;
> +=09=09u32 ipcm1_top=09=09: 9;
> +=09=09u32 ipcm1_right=09=09: 9;
> +=09} swreg209;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 3;
> +=09=09u32 ipcm2_left=09=09: 9;
> +=09=09u32 input_lu_stride=09: 20;
> +=09} swreg210;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 3;
> +=09=09u32 ipcm2_right=09=09: 9;
> +=09=09u32 input_ch_stride=09: 20;
> +=09} swreg211;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 3;
> +=09=09u32 ipcm2_top=09=09: 9;
> +=09=09u32 ref_lu_stride=09: 20;
> +=09} swreg212;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 5;
> +=09=09u32 ipcm2_bottom=09: 9;
> +=09=09u32 ref_ds_lu_stride=09: 18;
> +=09} swreg213;
> +
> +=09struct {
> +=09=09u32 hwmaxvideowidthjpeg=09: 13;
> +=09=09u32 hwmaxvideowidthh264=09: 13;
> +=09=09u32 hwroimapversion=09: 3;
> +=09=09u32 hwintratu32support=09: 1;
> +=09=09u32 hwabsqpsupport=09: 1;
> +=09=09u32 hwljpegsupport=09: 1;
> +=09} swreg214;
> +
> +=09struct {
> +=09=09u32 totalarlen=09: 32;
> +=09} swreg215;
> +
> +=09struct {
> +=09=09u32 totalr=09: 32;
> +=09} swreg216;
> +
> +=09struct {
> +=09=09u32 totalar=09: 32;
> +=09} swreg217;
> +
> +=09struct {
> +=09=09u32 totalrlast=09: 32;
> +=09} swreg218;
> +
> +=09struct {
> +=09=09u32 totalawlen=09: 32;
> +=09} swreg219;
> +
> +=09struct {
> +=09=09u32 totalw=09: 32;
> +=09} swreg220;
> +
> +=09struct {
> +=09=09u32 totalaw=09: 32;
> +=09} swreg221;
> +
> +=09struct {
> +=09=09u32 totalwlast=09: 32;
> +=09} swreg222;
> +
> +=09struct {
> +=09=09u32 totalb=09: 32;
> +=09} swreg223;
> +
> +=09struct {
> +=09=09u32 cb_const_pixel=09: 10;
> +=09=09u32 cr_const_pixel=09: 10;
> +=09=09u32 skipframe_en=09: 1;
> +=09=09u32 ssim_en=09=09: 1;
> +=09=09u32 reserved=09=09: 9;
> +=09=09u32 chroma_const_en=09: 1;
> +=09} swreg224;
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09=09=09: 6;
> +=09=09u32 roimap_qpdelta_ver=09=09=09=09: 3;
> +=09=09u32 roimap_cuctrl_ver=09=09=09=09: 3;
> +=09=09u32 roimap_cuctrl_enable=09=09=09: 1;
> +=09=09u32 roimap_cuctrl_index_enable=09=09=09: 1;
> +=09=09u32 loop_filter_across_tiles_enabled_flag=09: 1;
> +=09=09u32 tiles_enabled_flag=09=09=09=09: 1;
> +=09=09u32 num_tile_rows=09=09=09=09: 8;
> +=09=09u32 num_tile_columns=09=09=09=09: 8;
> +=09} swreg225;
> +
> +=09struct {
> +=09=09u32 hwdynamicmaxtusize=09=09: 1;
> +=09=09u32 hwiframeonly=09=09: 1;
> +=09=09u32 hwstreamsegmentsupport=09: 1;
> +=09=09u32 hwstreambufchain=09=09: 1;
> +=09=09u32 hwinloopdsratio=09=09: 1;
> +=09=09u32 hwmultipasssupport=09=09: 1;
> +=09=09u32 hwrdoqsupport=09=09: 1;
> +=09=09u32 bframe_me4n_hor_searchrange=09: 2;
> +=09=09u32 hwroi8support=09=09: 1;
> +=09=09u32 hwgmvsupport=09=09: 1;
> +=09=09u32 hwjpeg422support=09=09: 1;
> +=09=09u32 hwctbrcversion=09=09: 3;
> +=09=09u32 me_vert_searchrange_h264=09: 6;
> +=09=09u32 me_vert_searchrange_hevc=09: 6;
> +=09=09u32 hwcuinforversion=09=09: 3;
> +=09=09u32 hwp010refsupport=09=09: 1;
> +=09=09u32 hwssimsupport=09=09: 1;
> +=09} swreg226;
> +
> +=09struct {
> +=09=09u32 ssim_y_numerator_lsb=09: 32;
> +=09} swreg227;
> +
> +=09struct {
> +=09=09u32 ssim_y_numerator_msb=09: 32;
> +=09} swreg228;
> +
> +=09struct {
> +=09=09u32 ssim_u_numerator_lsb=09: 32;
> +=09} swreg229;
> +
> +=09struct {
> +=09=09u32 ssim_u_numerator_msb=09: 32;
> +=09} swreg230;
> +
> +=09struct {
> +=09=09u32 ssim_v_numerator_lsb=09: 32;
> +=09} swreg231;
> +
> +=09struct {
> +=09=09u32 ssim_v_numerator_msb=09: 32;
> +=09} swreg232;
> +
> +=09struct {
> +=09=09u32 ssim_y_denominator=09: 32;
> +=09} swreg233;
> +
> +=09struct {
> +=09=09u32 ssim_uv_denominator=09: 32;
> +=09} swreg234;
> +
> +=09struct {
> +=09=09u32 rps_used_by_cur_1=09: 1;
> +=09=09u32 rps_used_by_cur_0=09: 1;
> +=09=09u32 rps_delta_poc_2=09: 10;
> +=09=09u32 rps_delta_poc_1=09: 10;
> +=09=09u32 rps_delta_poc_0=09: 10;
> +=09} swreg235;
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09=09: 12;
> +=09=09u32 p010_ref_enable=09=09=09: 1;
> +=09=09u32 short_term_ref_pic_set_sps_flag=09: 1;
> +=09=09u32 rps_pos_pic_num=09=09=09: 3;
> +=09=09u32 rps_neg_pic_num=09=09=09: 3;
> +=09=09u32 rps_used_by_cur_3=09=09=09: 1;
> +=09=09u32 rps_used_by_cur_2=09=09=09: 1;
> +=09=09u32 rps_delta_poc_3=09=09=09: 10;
> +=09} swreg236;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 dummyreaden=09=09: 1;
> +=09=09u32 ref_ch_stride=09: 20;
> +=09} swreg237;
> +
> +=09struct {
> +=09=09u32 dummyreadaddr=09: 32;
> +=09} swreg238;
> +
> +=09struct {
> +=09=09u32 current_ctb_mad_base=09: 32;
> +=09} swreg239;
> +
> +=09struct {
> +=09=09u32 current_ctb_mad_base_msb=09: 32;
> +=09} swreg240;
> +
> +=09struct {
> +=09=09u32 previous_ctb_mad_base=09: 32;
> +=09} swreg241;
> +
> +=09struct {
> +=09=09u32 previous_ctb_mad_base_msb=09: 32;
> +=09} swreg242;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 11;
> +=09=09u32 ctb_rc_model_param0=09: 21;
> +=09} swreg243;
> +
> +=09struct {
> +=09=09u32 reserved=09=09: 2;
> +=09=09u32 roi3_qp_type=09: 1;
> +=09=09u32 roi3_qp_value=09: 7;
> +=09=09u32 ctb_rc_model_param1=09: 22;
> +=09} swreg244;
> +
> +=09struct {
> +=09=09u32 rc_qpdelta_range_msb=09: 2;
> +=09=09u32 ctb_rc_row_factor=09=09: 16;
> +=09=09u32 ctb_rc_model_param_min=09: 14;
> +=09} swreg245;
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09: 3;
> +=09=09u32 ctb_rc_delay=09=09: 3;
> +=09=09u32 axi_write_outstanding_num=09: 8;
> +=09=09u32 ctb_rc_qp_step=09=09: 18;
> +=09} swreg246;
> +
> +=09struct {
> +=09=09u32 reserved0=09=09=09: 1;
> +=09=09u32 ctb_rc_prev_mad_valid=09: 1;
> +=09=09u32 reserved1=09=09=09: 4;
> +=09=09u32 prev_pic_lum_mad=09=09: 26;
> +=09} swreg247;
> +
> +=09struct {
> +=09=09u32 roi4_qp_type=09: 1;
> +=09=09u32 roi4_qp_value=09: 7;
> +=09=09u32 ctb_qp_sum_for_rc=09: 24;
> +=09} swreg248;
> +
> +=09union {
> +=09=09struct {
> +=09=09=09u32 reserved=09=09=09: 3;
> +=09=09=09u32 ipcm2_bottom_msb=09=09: 1;
> +=09=09=09u32 ipcm2_top_msb=09=09: 1;
> +=09=09=09u32 ipcm2_right_msb=09=09: 1;
> +=09=09=09u32 ipcm2_left_msb=09=09: 1;
> +=09=09=09u32 ipcm1_bottom_msb=09=09: 1;
> +=09=09=09u32 ipcm1_top_msb=09=09: 1;
> +=09=09=09u32 ipcm1_right_msb=09=09: 1;
> +=09=09=09u32 ipcm1_left_msb=09=09: 1;
> +=09=09=09u32 pic_width_msb2=09=09: 1;
> +=09=09=09u32 roi2_bottom_msb2=09=09: 1;
> +=09=09=09u32 roi2_top_msb2=09=09: 1;
> +=09=09=09u32 roi2_right_msb2=09=09: 1;
> +=09=09=09u32 roi2_left_msb2=09=09: 1;
> +=09=09=09u32 roi1_bottom_msb2=09=09: 1;
> +=09=09=09u32 roi1_top_msb2=09=09: 1;
> +=09=09=09u32 roi1_right_msb2=09=09: 1;
> +=09=09=09u32 roi1_left_msb2=09=09: 1;
> +=09=09=09u32 intra_area_bottom_msb2=09: 1;
> +=09=09=09u32 intra_area_top_msb2=09=09: 1;
> +=09=09=09u32 intra_area_right_msb2=09: 1;
> +=09=09=09u32 intra_area_left_msb2=09: 1;
> +=09=09=09u32 cir_interval_msb2=09=09: 2;
> +=09=09=09u32 cir_start_msb2=09=09: 2;
> +=09=09=09u32 slice_size_msb2=09=09: 1;
> +=09=09=09u32 num_slices_ready_msb2=09: 1;
> +=09=09=09u32 encoded_ctb_number_msb2=09: 2;
> +=09=09} swreg249;
> +
> +=09=09struct {
> +=09=09=09u32 reserved0=09=09: 5;
> +=09=09=09u32 jpeg_rowlength_msb=09: 2;
> +=09=09=09u32 jpeg_pic_height_msb=09: 2;
> +=09=09=09u32 jpeg_pic_width_msb=09: 2;
> +=09=09=09u32 reserved1=09=09: 21;
> +=09=09} swreg249_jpeg;
> +=09};
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09: 4;
> +=09=09u32 global_vertical_mv_l0=09: 14;
> +=09=09u32 global_horizontal_mv_l0=09: 14;
> +=09} swreg250;
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09: 4;
> +=09=09u32 global_vertical_mv_l1=09: 14;
> +=09=09u32 global_horizontal_mv_l1=09: 14;
> +=09} swreg251;
> +
> +=09struct {
> +=09=09u32 reserved=09: 2;
> +=09=09u32 roi3_right=09: 10;
> +=09=09u32 roi3_top=09: 10;
> +=09=09u32 roi3_left=09: 10;
> +=09} swreg252;
> +
> +=09struct {
> +=09=09u32 reserved=09: 2;
> +=09=09u32 roi4_top=09: 10;
> +=09=09u32 roi4_left=09: 10;
> +=09=09u32 roi3_bottom=09: 10;
> +=09} swreg253;
> +
> +=09struct {
> +=09=09u32 reserved=09: 2;
> +=09=09u32 roi5_left=09: 10;
> +=09=09u32 roi4_bottom=09: 10;
> +=09=09u32 roi4_right=09: 10;
> +=09} swreg254;
> +
> +=09struct {
> +=09=09u32 reserved=09: 2;
> +=09=09u32 roi5_bottom=09: 10;
> +=09=09u32 roi5_right=09: 10;
> +=09=09u32 roi5_top=09: 10;
> +=09} swreg255;
> +
> +=09struct {
> +=09=09u32 reserved=09: 2;
> +=09=09u32 roi6_right=09: 10;
> +=09=09u32 roi6_top=09: 10;
> +=09=09u32 roi6_left=09: 10;
> +=09} swreg256;
> +
> +=09struct {
> +=09=09u32 reserved=09: 2;
> +=09=09u32 roi7_top=09: 10;
> +=09=09u32 roi7_left=09: 10;
> +=09=09u32 roi6_bottom=09: 10;
> +=09} swreg257;
> +
> +=09struct {
> +=09=09u32 reserved=09: 2;
> +=09=09u32 roi8_left=09: 10;
> +=09=09u32 roi7_bottom=09: 10;
> +=09=09u32 roi7_right=09: 10;
> +=09} swreg258;
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09=09: 1;
> +=09=09u32 current_max_tu_size_decrease=09: 1;
> +=09=09u32 roi8_bottom=09=09=09=09: 10;
> +=09=09u32 roi8_right=09=09=09=09: 10;
> +=09=09u32 roi8_top=09=09=09=09: 10;
> +=09} swreg259;
> +
> +=09struct {
> +=09=09u32 roi5_qp_type=09: 1;
> +=09=09u32 roi5_qp_value=09: 7;
> +=09=09u32 roi6_qp_type=09: 1;
> +=09=09u32 roi6_qp_value=09: 7;
> +=09=09u32 roi7_qp_type=09: 1;
> +=09=09u32 roi7_qp_value=09: 7;
> +=09=09u32 roi8_qp_type=09: 1;
> +=09=09u32 roi8_qp_value=09: 7;
> +=09} swreg260;
> +
> +=09struct {
> +=09=09u32 motion_score_enable=09=09: 1;
> +=09=09u32 pass1_skip_cabac=09=09: 1;
> +=09=09u32 rdoq_enable=09=09=09: 1;
> +=09=09u32 multi_core_en=09=09: 1;
> +=09=09u32 axi_read_outstanding_num=09: 8;
> +=09=09u32 prp_in_loop_ds_ratio=09: 1;
> +=09=09u32 rgblumaoffset=09=09: 5;
> +=09=09u32 reserved=09=09=09: 14;
> +=09} swreg261;
> +
> +=09struct {
> +=09=09u32 lum_sse_div_256=09: 32;
> +=09} swreg262;
> +
> +=09struct {
> +=09=09u32 cb_sse_div_64=09: 32;
> +=09} swreg263;
> +
> +=09struct {
> +=09=09u32 cr_sse_div_64=09: 32;
> +=09} swreg264;
> +
> +=09struct {
> +=09=09u32 ddr_polling_interval=09: 16;
> +=09=09u32 ref_ready_threshold=09=09: 16;
> +=09} swreg265;
> +
> +=09struct {
> +=09=09u32 multicore_sync_l0_addr=09: 32;
> +=09} swreg266;
> +
> +=09struct {
> +=09=09u32 multicore_sync_l0_addr_msb=09: 32;
> +=09} swreg267;
> +
> +=09struct {
> +=09=09u32 multicore_sync_l1_addr=09: 32;
> +=09} swreg268;
> +
> +=09struct {
> +=09=09u32 multicore_sync_l1_addr_msb=09: 32;
> +=09} swreg269;
> +
> +=09struct {
> +=09=09u32 multicore_sync_rec_addr=09: 32;
> +=09} swreg270;
> +
> +=09struct {
> +=09=09u32 multicore_sync_rec_addr_msb=09: 32;
> +=09} swreg271;
> +
> +=09struct {
> +=09=09u32 wr_urgent_disable_threshold=09: 8;
> +=09=09u32 wr_urgent_enable_threshold=09: 8;
> +=09=09u32 rd_urgent_disable_threshold=09: 8;
> +=09=09u32 rd_urgent_enable_threshold=09: 8;
> +=09} swreg272;
> +
> +=09struct {
> +=09=09u32 roimap_cuctrl_index_addr=09: 32;
> +=09} swreg273;
> +
> +=09struct {
> +=09=09u32 roimap_cuctrl_index_addr_msb=09: 32;
> +=09} swreg274;
> +
> +=09struct {
> +=09=09u32 roimap_cuctrl_addr=09: 32;
> +=09} swreg275;
> +
> +=09struct {
> +=09=09u32 roimap_cuctrl_addr_msb=09: 32;
> +=09} swreg276;
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09: 5;
> +=09=09u32 syn_amount_per_loopback=09: 15;
> +=09=09u32 pic_order_cnt_type=09=09: 2;
> +=09=09u32 log2_max_frame_num=09=09: 5;
> +=09=09u32 log2_max_pic_order_cnt_lsb=09: 5;
> +=09} swreg277;
> +
> +=09struct {
> +=09=09u32 output_strm_buf1_base=09: 32;
> +=09} swreg278;
> +
> +=09struct {
> +=09=09u32 output_strm_buf1_base_msb=09: 32;
> +=09} swreg279;
> +
> +=09struct {
> +=09=09u32 output_strm_buffer1_limit=09: 32;
> +=09} swreg280;
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09: 2;
> +=09=09u32 chroma_format_idc=09=09: 2;
> +=09=09u32 num_ctb_rows_per_sync_msb=09: 6;
> +=09=09u32 strm_segment_wr_ptr=09=09: 10;
> +=09=09u32 strm_segment_rd_ptr=09=09: 10;
> +=09=09u32 strm_segment_en=09=09: 1;
> +=09=09u32 strm_segment_sw_sync_en=09: 1;
> +=09} swreg281;
> +
> +=09struct {
> +=09=09u32 strm_segment_size=09: 32;
> +=09} swreg282;
> +
> +=09struct {
> +=09=09u32 motion_score_l0_0=09: 32;
> +=09} swreg283;
> +
> +=09struct {
> +=09=09u32 motion_score_l0_1=09: 32;
> +=09} swreg284;
> +
> +=09struct {
> +=09=09u32 motion_score_l1_0=09: 32;
> +=09} swreg285;
> +
> +=09struct {
> +=09=09u32 motion_score_l1_1=09: 32;
> +=09} swreg286;
> +
> +=09struct {
> +=09=09u32 reserved0=09=09=09: 21;
> +=09=09u32 hwmonochromesupport=09=09: 1;
> +=09=09u32 hwmevertrangeprogramable=09: 1;
> +=09=09u32 hwctbrcmoremode=09=09: 1;
> +=09=09u32 reserved1=09=09=09: 4;
> +=09=09u32 hwcutreesupport=09=09: 1;
> +=09=09u32 hwscaler420support=09=09: 1;
> +=09=09u32 hwcscextensionsupport=09: 1;
> +=09=09u32 hwvideoheightext=09=09: 1;
> +=09} swreg287;
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09: 12;
> +=09=09u32 cuinfoversion=09=09: 3;
> +=09=09u32 ctb_qp_sum_for_rc_msb=09: 2;
> +=09=09u32 pic_complexity_msb=09=09: 4;
> +=09=09u32 qp_num_msb=09=09=09: 3;
> +=09=09u32 qp_sum_msb=09=09=09: 2;
> +=09=09u32 skipcu8num_msb=09=09: 3;
> +=09=09u32 intracu8num_msb=09=09: 3;
> +=09} swreg288;
> +
> +=09struct {
> +=09=09u32 rgbcoeffh=09: 16;
> +=09=09u32 rgbcoeffg=09: 16;
> +=09} swreg289;
> +
> +=09struct {
> +=09=09u32 totalarlen2=09: 32;
> +=09} swreg290;
> +
> +=09struct {
> +=09=09u32 totalr2=09: 32;
> +=09} swreg291;
> +
> +=09struct {
> +=09=09u32 totalar2=09: 32;
> +=09} swreg292;
> +
> +=09struct {
> +=09=09u32 totalrlast2=09: 32;
> +=09} swreg293;
> +
> +=09struct {
> +=09=09u32 totalawlen2=09: 32;
> +=09} swreg294;
> +
> +=09struct {
> +=09=09u32 totalw2=09: 32;
> +=09} swreg295;
> +
> +=09struct {
> +=09=09u32 totalaw2=09: 32;
> +=09} swreg296;
> +
> +=09struct {
> +=09=09u32 totalwlast2=09: 32;
> +=09} swreg297;
> +
> +=09struct {
> +=09=09u32 totalb2=09: 32;
> +=09} swreg298;
> +
> +=09struct {
> +=09=09u32 ext_sram_lum_fwd_base=09: 32;
> +=09} swreg299;
> +
> +=09struct {
> +=09=09u32 ext_sram_lum_fwd_base_msb=09: 32;
> +=09} swreg300;
> +
> +=09struct {
> +=09=09u32 ext_sram_lum_bwd_base=09: 32;
> +=09} swreg301;
> +
> +=09struct {
> +=09=09u32 ext_sram_lum_bwd_base_msb=09: 32;
> +=09} swreg302;
> +
> +=09struct {
> +=09=09u32 ext_sram_chr_fwd_base=09: 32;
> +=09} swreg303;
> +
> +=09struct {
> +=09=09u32 ext_sram_chr_fwd_base_msb=09: 32;
> +=09} swreg304;
> +
> +=09struct {
> +=09=09u32 ext_sram_chr_bwd_base=09: 32;
> +=09} swreg305;
> +
> +=09struct {
> +=09=09u32 ext_sram_chr_bwd_base_msb=09: 32;
> +=09} swreg306;
> +
> +=09struct {
> +=09=09u32 extlinebuffer_linecnt_chr_bwd=09: 8;
> +=09=09u32 extlinebuffer_linecnt_chr_fwd=09: 8;
> +=09=09u32 extlinebuffer_linecnt_lum_bwd=09: 8;
> +=09=09u32 extlinebuffer_linecnt_lum_fwd=09: 8;
> +=09} swreg307;
> +
> +=09struct {
> +=09=09u32 axi_strm_write_pending=09: 32;
> +=09} swreg308;
> +
> +=09struct {
> +=09=09u32 axi_recon_write_pending=09: 32;
> +=09} swreg309;
> +
> +=09struct {
> +=09=09u32 axi_rec4n_write_pending=09: 32;
> +=09} swreg310;
> +
> +=09struct {
> +=09=09u32 axi_prp_read_pending=09: 32;
> +=09} swreg311;
> +
> +=09struct {
> +=09=09u32 axi_ref_read_pending=09: 32;
> +=09} swreg312;
> +
> +=09struct {
> +=09=09u32 axi_ref4n_read_pending=09: 32;
> +=09} swreg313;
> +
> +=09struct {
> +=09=09u32 axi_rcroi_read_pending=09: 32;
> +=09} swreg314;
> +
> +=09struct {
> +=09=09u32 axi_read_channel_pending=09: 32;
> +=09} swreg315;
> +
> +=09struct {
> +=09=09u32 axi_write_channel_pending=09: 32;
> +=09} swreg316;
> +
> +=09struct {
> +=09=09u32 axi_total_pending=09: 32;
> +=09} swreg317;
> +
> +=09struct {
> +=09=09u32 hw_debug=09: 32;
> +=09} swreg318;
> +
> +=09struct {
> +=09=09u32 axi_burst_align_fuse_rd_lu_ref_prefetch=09: 4;
> +=09=09u32 axi_burst_align_fuse_rd_ch_ref_prefetch=09: 4;
> +=09=09u32 axi_burst_align_fuse_rd_prp=09=09=09: 4;
> +=09=09u32 axi_burst_align_fuse_rd_common=09=09: 4;
> +=09=09u32 axi_burst_align_fuse_wr_luma_ref=09=09: 4;
> +=09=09u32 axi_burst_align_fuse_wr_chroma_ref=09=09: 4;
> +=09=09u32 axi_burst_align_fuse_wr_stream=09=09: 4;
> +=09=09u32 axi_burst_align_fuse_wr_common=09=09: 4;
> +=09} swreg319;
> +
> +=09struct {
> +=09=09u32 axi_burst_align_rd_lu_ref_prefetch=09: 4;
> +=09=09u32 axi_burst_align_rd_ch_ref_prefetch=09: 4;
> +=09=09u32 axi_burst_align_rd_prp=09=09: 4;
> +=09=09u32 axi_burst_align_rd_common=09=09: 4;
> +=09=09u32 axi_burst_align_wr_luma_ref=09=09: 4;
> +=09=09u32 axi_burst_align_wr_chroma_ref=09: 4;
> +=09=09u32 axi_burst_align_wr_stream=09=09: 4;
> +=09=09u32 axi_burst_align_wr_common=09=09: 4;
> +=09} swreg320;
> +
> +=09struct {
> +=09=09u32 reserved=09=09=09=09: 26;
> +=09=09u32 me_assigned_vert_search_range=09: 6;
> +=09} swreg321;
> +} __packed;
> +
> +#endif /* HANTRO_VC8000E_REGS_H_ */

--=-6CcgTW6DhSHdgYxHsiLb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavzObgAKCRDZQZRRKWBy
9PMKAP9Hg7c7Kqhx9tM7T2QoLHUnfDph2gboqdbZJ9qKbUHpOwEA2+58Ndudqa6z
jHIJgvr7K76XJc8hCFL2qvJ4hPJm4AA=
=zyOg
-----END PGP SIGNATURE-----

--=-6CcgTW6DhSHdgYxHsiLb--
