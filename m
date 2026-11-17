Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949571;
	b=cx/l/QFbHduTOK/Yl/ZqbmamJzIhjr5lPLKQtTDSO/S1g0c3R22Kdpo2h7kvg7q5joO3
	 4M6yu7ivI15dPr6u/I0VjF0U0hKNtdc+cdGVF0zc7aMyVpyEGmMJJzr0cuZblRc+mVdCj
	 biqQSYhp78zz2TJ7c6zo7VztunWRQ6fu8fZ7co3QCepCOC4E6vcpP/aU9OvfntgEGpOBW
	 g3TS6l32OHWa1b3qdE3z5v5nevPM9SqD47T1ap67kZAwI2qpZuhpvl9i4wTUPlpK+GFj0
	 kDUAlSa98Aw4+1BoeDiXJhSOqj1fMZKUJRxXaTIBiFG32F7ebgzkGsYi/aGBsgXhwsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949571;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=HtvTu/64ettxzPxkBEvKYZ34ZkkbT9fHPhc3+fZwto0=;
	b=WNiYctj7W44hEoAMTm2fOyLMDk8W5LqTFOJaRqS1mvQuD77gXLbl3xTMh/4jXAX3VZQd
	 /Wpv64w3om8EX5DH+OLNeNKRtPmoq26YGGn3LP3lkx9SBJ6QbKGObHW4fc7nE8mNlE73w
	 d7kmAkS8eCZUsP2+AUDS4oFryVkd/q8iTSVADOObv6AcnLDY5J0PTSKBsSseK2U2tOFtA
	 dVAhwV+tOR86os1ZDy7WI21X1dMpUDa5HUUvryb6AjiNeSO8lzfzak/lyllmm6jE1TKv+
	 13SqcJUDRZcUmZhQByjkTJj77177NMVacMb/oeUsEs1/rHxGw0MJz84kffW+k/uQLzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=lPt5x4V8;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEE7606A31C
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 21:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AEE7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=lPt5x4V8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794949568;
	bh=ZbD9FwnOoOQeC1E98ztkUVdqmp6pvxce5xq0Ue6S3KI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=lPt5x4V8aOdwRhqhcsDubH/sIdh16mL5AfebH6UXaLc0JLoXVC8nRITRN13oIAWY3
	 7uDhKnSgX2PuuxE3eu13N/Zx+Aiga+bMWqZkOuU79rBaowHCmRlHq7bBK0zAn9agDx
	 QGLrFsQArkBXg0+a+m60QhqsnDzF3K68nJC0/VbgSTe1Fdsz9V4dq2JdaYlqEq6TWn
	 Y9qFBx5/BCgkh0UVlw38/SFJZqG/+TA+8J6f4JL6XpzuGZja9RJfnyxlGX5iO6Qsvs
	 ZUAVE0t6WLoMFxeWICZsswSsBSiCaWLXe3lulXfk8UpUmfLaOV4rsorZ8QbvMPcMt1
	 iXs9Fa99mEUOg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C8B0C17E05D6;
	Tue, 17 Nov 2026 22:06:06 +0100 (CET)
Message-ID: <760e33e8de1f139be7dba2270313c80aeb53c1d3.camel@collabora.com>
Subject: Re: [PATCH 01/14] media: h264: Add a more generic reflist builder
 init
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
Date: Tue, 17 Nov 2026 16:06:05 -0500
In-Reply-To: <20260522101653.2565125-2-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
	 <20260522101653.2565125-2-paulk@sys-base.io>
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
	protocol="application/pgp-signature"; boundary="=-ZjSFNpEuHw1qtBTWERh5"
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

--=-ZjSFNpEuHw1qtBTWERh5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 22 mai 2026 =C3=A0 12:16 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> This should become part of a larger reflist builder rework.

Maybe a tiny bit more meet would help? What am I reviewing, what is this ne=
w
builder used for?
>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  drivers/media/v4l2-core/v4l2-h264.c | 69 +++++++++++++++++++++++++++++
>  include/media/v4l2-h264.h           |  7 +++
>  2 files changed, 76 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/v4l2-cor=
e/v4l2-h264.c
> index c00197d095e7..4e5a177ca2c7 100644
> --- a/drivers/media/v4l2-core/v4l2-h264.c
> +++ b/drivers/media/v4l2-core/v4l2-h264.c
> @@ -105,6 +105,75 @@ v4l2_h264_init_reflist_builder(struct v4l2_h264_refl=
ist_builder *b,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_h264_init_reflist_builder);
> =20
> +void
> +v4l2_h264_init_reflist_builder_gen(struct v4l2_h264_reflist_builder *b,
> +=09=09const struct v4l2_ctrl_h264_sps *sps,
> +=09=09const struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES],
> +=09=09unsigned int pic_order_count, unsigned int frame_num, unsigned int=
 fields)

Add a doc comment.

> +{
> +=09int cur_frame_num, max_frame_num;
> +=09unsigned int i;
> +
> +=09max_frame_num =3D 1 << (sps->log2_max_frame_num_minus4 + 4);
> +=09cur_frame_num =3D frame_num;
> +
> +=09memset(b, 0, sizeof(*b));
> +=09b->cur_pic_order_count =3D pic_order_count;
> +=09b->cur_pic_fields =3D fields;
> +
> +=09for (i =3D 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
> +=09=09if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> +=09=09=09continue;
> +
> +=09=09if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
> +=09=09=09b->refs[i].longterm =3D true;
> +
> +=09=09/*
> +=09=09 * Handle frame_num wraparound as described in section
> +=09=09 * '8.2.4.1 Decoding process for picture numbers' of the spec.
> +=09=09 * For long term references, frame_num is set to
> +=09=09 * long_term_frame_idx which requires no wrapping.
> +=09=09 */
> +=09=09if (!b->refs[i].longterm && dpb[i].frame_num > cur_frame_num)
> +=09=09=09b->refs[i].frame_num =3D (int)dpb[i].frame_num -
> +=09=09=09=09=09       max_frame_num;
> +=09=09else
> +=09=09=09b->refs[i].frame_num =3D dpb[i].frame_num;
> +
> +=09=09b->refs[i].top_field_order_cnt =3D dpb[i].top_field_order_cnt;
> +=09=09b->refs[i].bottom_field_order_cnt =3D dpb[i].bottom_field_order_cn=
t;
> +
> +=09=09if (b->cur_pic_fields =3D=3D V4L2_H264_FRAME_REF) {
> +=09=09=09u8 fields =3D V4L2_H264_FRAME_REF;
> +
> +=09=09=09b->unordered_reflist[b->num_valid].index =3D i;
> +=09=09=09b->unordered_reflist[b->num_valid].fields =3D fields;
> +=09=09=09b->num_valid++;
> +=09=09=09continue;
> +=09=09}
> +
> +=09=09if (dpb[i].fields & V4L2_H264_TOP_FIELD_REF) {
> +=09=09=09u8 fields =3D V4L2_H264_TOP_FIELD_REF;
> +
> +=09=09=09b->unordered_reflist[b->num_valid].index =3D i;
> +=09=09=09b->unordered_reflist[b->num_valid].fields =3D fields;
> +=09=09=09b->num_valid++;
> +=09=09}
> +
> +=09=09if (dpb[i].fields & V4L2_H264_BOTTOM_FIELD_REF) {
> +=09=09=09u8 fields =3D V4L2_H264_BOTTOM_FIELD_REF;
> +
> +=09=09=09b->unordered_reflist[b->num_valid].index =3D i;
> +=09=09=09b->unordered_reflist[b->num_valid].fields =3D fields;
> +=09=09=09b->num_valid++;
> +=09=09}
> +=09}
> +
> +=09for (i =3D b->num_valid; i < ARRAY_SIZE(b->unordered_reflist); i++)
> +=09=09b->unordered_reflist[i].index =3D i;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_h264_init_reflist_builder_gen);
> +
>  static s32 v4l2_h264_get_poc(const struct v4l2_h264_reflist_builder *b,
>  =09=09=09     const struct v4l2_h264_reference *ref)
>  {
> diff --git a/include/media/v4l2-h264.h b/include/media/v4l2-h264.h
> index 0d9eaa956123..1833c0556963 100644
> --- a/include/media/v4l2-h264.h
> +++ b/include/media/v4l2-h264.h
> @@ -42,6 +42,7 @@ struct v4l2_h264_reflist_builder {
>  =09u8 cur_pic_fields;
> =20
>  =09struct v4l2_h264_reference unordered_reflist[V4L2_H264_REF_LIST_LEN];
> +=09/* FIXME: confusing with valid flag (active is checked). Proper termi=
nology is "used" */

Just drop a patch before that rename it?

>  =09u8 num_valid;

>  };
> =20
> @@ -51,6 +52,12 @@ v4l2_h264_init_reflist_builder(struct v4l2_h264_reflis=
t_builder *b,
>  =09=09const struct v4l2_ctrl_h264_sps *sps,
>  =09=09const struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES]);
> =20
> +void
> +v4l2_h264_init_reflist_builder_gen(struct v4l2_h264_reflist_builder *b,
> +=09=09const struct v4l2_ctrl_h264_sps *sps,
> +=09=09const struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES],
> +=09=09unsigned int pic_order_count, unsigned int frame_num, unsigned int=
 fields);
> +
>  /**
>   * v4l2_h264_build_b_ref_lists() - Build the B0/B1 reference lists
>   *

--=-ZjSFNpEuHw1qtBTWERh5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavzBvQAKCRDZQZRRKWBy
9BtfAQDuX6YWkZlnq7Kl+f+bMXt1CF2vU/q45B92Be31HwQATAEAp6eHgUOWcmtf
VOnv8NvHgu6jahauAoGMYcbg1POycAE=
=uvaF
-----END PGP SIGNATURE-----

--=-ZjSFNpEuHw1qtBTWERh5--
