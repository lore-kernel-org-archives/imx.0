Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B62018BBAE
	for <imx@lists.linux.dev>; Fri, 29 Aug 2025 20:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756498045; cv=none; b=N4vSAhRDLNd3UugbYMNsbdz8vj/LDWaJcXO6atxvasRe5W9yIEm7JdFDoe6vgFmfk5SdbgQyGCOZn9laYphaN5oBY5xxu+WN0s/jsaEP1S+qEgHBFwg3yeHYgCgNHTR6TtJEpmQ5Ei1rMg74GF/A+9z9/+OHNhIzopkXTmgs3Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756498045; c=relaxed/simple;
	bh=7qYDpn+rwMtXUF+JzwjRCMstZnhe2mh2jSO0ckR1Qco=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hLiLCwUOlN1KjfPvAvFJt7SzqoaJUK/VfaZ7/+7EpFZD9z4HK8OaPdyO+FPsaqkKn3RTLKKSJmJMTpjTei0cK2+oPxOB4IRB8cB6jUcgZ199oqXAmisFJ6FI6kWkZCaC1iRlBjKu245etljc35dg06w81XhdWqRMGX3F9/Auz7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=kiFz0aub; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="kiFz0aub"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7e870689dedso158800585a.3
        for <imx@lists.linux.dev>; Fri, 29 Aug 2025 13:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1756498042; x=1757102842; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7mVucHPb5ysrmzzkidCX5VCEdnwiQvgze17nPNBDCT0=;
        b=kiFz0aub1IbFElWyCjGMoa3HfYG2/S8Afd44XVBAHnwM6wyKvP2WMOP2VMDlSbf6rF
         lmPOHsRFAAwfGqKdNUCzQIZhuMwW/cfnMf2LP9EPzko0/5xRa07IaAdAzI9MiLn2jt/I
         3K+5dOrQq4aVpV/1FePw/d9LCgpFGIH1jRhFsCw62JT7mvIYp+CUgetnsgeRKySdgDQl
         BliL+zhLKHzb3er/QStcndSOvbn21UPDdeBB33TWHZt2aNaL/tVs//PnGdQhwaVOG9Kd
         OMkeTHq1pnKc04FiZ61qNJS87l42T6O4DI99rIElq7rxqwkNcjj7Lnm7P1S7Gd25QnvJ
         7o8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756498042; x=1757102842;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mVucHPb5ysrmzzkidCX5VCEdnwiQvgze17nPNBDCT0=;
        b=D2XclHaz6n2vKkGjv1Zv1yBPOg3uEw9FXJDmkaOjKmAJgaXZ9UzBFTRJdovdRvoL4O
         Fmywv4OdYx0TVTiXeDLMfOoNzVS8Lsw0o70JHtIpxJdD5OGNi4ca7Gg8CwryEcQAs/iY
         ae09SMW3ddwTQ3c9icJ61jnLj1WYYHNBazedKkpzSXZypXFd5rzIC6omweMgNERRFnkY
         L3VszMg/3CNCWDyy7p9XY1X5CFkt1DROEaBUSnVwp9/AJLeONoh3FMVrWoI7347CJca9
         zXzKM/WEvlfb6cK4m3Xw8Ga31FugFvSpuEzkQHEnIKHxFZyG1mtC5333P2Zi+6K1ud+n
         Hn4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVsvcVJS7hJll/BL5orJmMKJoCQ0/LgB7HWQNPMs67A+zQyV+T1Vg60V/qFx3HuaIEXRPw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTe2s90bcZG+EG4YUNCSKTqsXkfTheq11S6FStTIX3nkSLnGH7
	r73R8OXg0RMFZymvFs9tKfEkzyBDXNCHWaBK84gF1m4K/kAGLV959RKDJ2fOVdX8yS8=
X-Gm-Gg: ASbGncsN5QzIbimTlbPDl04dLScs/jcEVx2garwzD7x9unFaR7phftizwMoTpdYDVOM
	JtSgS5rCKeWYN6l2RrFQXsqnPVzlbLmlD1XPVRKXKHTPVMLXc6X/V3UQ+yd9u8ZorR938T6fBF9
	JDcs4tgnd6dLMt97fIFMqhgjhWF/bycItiiYKns5W2CUZpuasG7eCiz/59//v5fi0XhuFYJw4RE
	oVQhLqN8MFrC3aO7xFSqjsT95jcvkWOOFb96hpHVVxj2jWN3I9QLtrNyIZO2eToiFvCsyrOgyNt
	6IAa1ttlR1yfe80SfWCRT9BcIENNmKVGwcyKgT6PPqqLh45RybO7mPT61ZaGsTQUBQtHt6+yKWH
	ppUBIZNYWOhNn4pmzqyXOwiaZhUy2EKRaZIoKmA==
X-Google-Smtp-Source: AGHT+IE8DhCsJH0EvyAuK4Vz9280U37BMOETV4y3Nv5wsQvwvjEYFAHtOUrIGVOTCD1Tn4oDmElK+g==
X-Received: by 2002:a05:620a:a119:b0:7e7:faaa:e7c9 with SMTP id af79cd13be357-7ea10f7492bmr3210665085a.12.1756498042375;
        Fri, 29 Aug 2025 13:07:22 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:5a76::5ac? ([2606:6d00:11:5a76::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc15c83bbasm232495085a.60.2025.08.29.13.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 13:07:21 -0700 (PDT)
Message-ID: <ede4226a80e27c8b047b0eb25fe8f5ba90214d12.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: Drop the sequence header after seek for
 VC1L
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc: sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, xiahong.bao@nxp.com, 	eagle.zhou@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Fri, 29 Aug 2025 16:07:19 -0400
In-Reply-To: <20250725080712.1705-1-ming.qian@oss.nxp.com>
References: <20250725080712.1705-1-ming.qian@oss.nxp.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-lmqDXEuDoXQ5YOWLo31s"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-lmqDXEuDoXQ5YOWLo31s
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 25 juillet 2025 =C3=A0 16:07 +0800, ming.qian@oss.nxp.com a =C3=
=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> For Simple and Main Profiles of VC-1 format stream, the amphion vpu
> requires driver to discard the sequence header, but insert a custom
> sequence start code at the beginning.
> The first buffer after a seek always contains only the sequence header.
> But vpu_vb_is_codecconfig() always return false as there is currently no
> flag indicating that the buffer contains only sequence header data and
> not frame data.
> So driver needs to drop the first buffer after seek, otherwise the driver
> will treat the sequence header as a frame, which will cause the image to
> be corrupted after the vpu decodes.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> =C2=A0drivers/media/platform/amphion/vpu_malone.c | 4 +---
> =C2=A01 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/=
platform/amphion/vpu_malone.c
> index ba688566dffd..a4c423600d70 100644
> --- a/drivers/media/platform/amphion/vpu_malone.c
> +++ b/drivers/media/platform/amphion/vpu_malone.c
> @@ -1373,11 +1373,9 @@ static int vpu_malone_insert_scode_vc1_l_seq(struc=
t malone_scode_t *scode)
> =C2=A0	int size =3D 0;
> =C2=A0	u8 rcv_seqhdr[MALONE_VC1_RCV_SEQ_HEADER_LEN];
> =C2=A0
> -	if (vpu_vb_is_codecconfig(to_vb2_v4l2_buffer(scode->vb)))

Please remove vpu_vb_is_codecconfig() entirely, it always returns false, so=
 its
miss-leading.

> -		scode->need_data =3D 0;
> +	scode->need_data =3D 0;
> =C2=A0	if (scode->inst->total_input_count)
> =C2=A0		return 0;
> -	scode->need_data =3D 0;

I only remember testing this once quickly on Exynos 4 and I had no clue wha=
t
Annex G vs J was and most likley the MFC firmware was detecting it. Checkin=
g
quickly, I'm not sure GStreamer actually support both, despite the v4l2 wra=
pper
pretending. I would expect one to be used in ASF/ISOMP4/AVI, and the other =
used
in MPEG Transport Stream. GStreamer does not support VC1 in MPEG TS.

Have you tested this with FFMPEG ? It only maps annex G.

In general, I don't mind the the change if this is correct userspace behavi=
or.
If ffmpeg and gstreamer don't agree though, we'll have to rethink. GStreame=
r
code back in the days was design in a way that it should not matter if the
header is split or not. This limitation came with lower latency decoder lat=
er,
but none had VC1.

Please test both userspace, and lets see if this solution is acceptable. ff=
mpeg
have ffplay and you can seek with your keyboard arrows.

Nicolas

> =C2=A0
> =C2=A0	ret =3D vpu_malone_insert_scode_seq(scode, MALONE_CODEC_ID_VC1_SIM=
PLE, sizeof(rcv_seqhdr));
> =C2=A0	if (ret < 0)

--=-lmqDXEuDoXQ5YOWLo31s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLIIdwAKCRDZQZRRKWBy
9AwxAQCJh1T0bFehpk0F+AD8I2rT9QoDpnwtdP+Y3WjH20xOpgD+PqJE3+yMnDsA
UjNnQYnMYU2r4Puchu4W9nu8fZiitQQ=
=rWlj
-----END PGP SIGNATURE-----

--=-lmqDXEuDoXQ5YOWLo31s--
