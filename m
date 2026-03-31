Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513AC194C98
	for <imx@lists.linux.dev>; Tue, 31 Mar 2026 14:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774968848; cv=none; b=iXm7i2XAuG5taiEx9EBhms0dKfJwYR/+7qSlloOGqMfXMfQivQ5pJWEf/LZeUVVBlpafjqrqZrI2UF9UPrnMKp5mgxJqGeD1AnazinchzymLPG8qI8zW8CpDleRmcO2yNu5MHzlbzHayVb5r36TOd/HkS7fHA/brbx1OTNi5dBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774968848; c=relaxed/simple;
	bh=4UGmf50+gfLnZc6+u6iDl6NicmkmuoVpuu9aSS4dDAY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LNs+hUIBOyo0nz55QkWmOQqSbLPpz5JhlvAewBnmsmsrJHRmZu6XVMdKecWRaG9NsguvhfeNf084jI3dMDtr8BDmJW9xwHzP23PH1jD3UkHHMRRhjiWNu1WBr2KTw9K24e3szMv6i9pAT+b0ySrU+Ermi7ZEGNWtJYD6XifAxcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ck14aDTO; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ck14aDTO"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-899a9f445cbso66173286d6.0
        for <imx@lists.linux.dev>; Tue, 31 Mar 2026 07:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774968846; x=1775573646; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xn5zNT1spHRq0DkkC+7339Y+wwjQRD78iQTIrf+3mdw=;
        b=ck14aDTO5XHz0RI+bv300IdwOC25bFm27LuvXc0lujfEFybSj3sz2UOlNjEd3H4dPZ
         D2VRg1g8qX8r9tyJOOIxgF0OJdjDhhFX4lvzHO8kQKn4im+of4dgJiXt9Ye5VfZw0VE8
         llht3Ousf4S1wIBpiv6UkpZXU5UHoyxSfJfZsE43dZhQo389Y/zwC5pRMPLAGK/9IeyN
         nQtxlN5l/jrtIbeEqVqVDx18GYlC+SABeNuRqJxZnp30DbKssM86KOc5RcW8deWKR3N5
         0uWd2ASZDu5m+y+1csIxspOLffp/s/PhBHLwCGs5v1L0NKPUqze/mwKP+wmvxysMcHyR
         apvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774968846; x=1775573646;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xn5zNT1spHRq0DkkC+7339Y+wwjQRD78iQTIrf+3mdw=;
        b=V2wslNN7Thk2x1JbAbar1EecVUOVdmAJky1D98mBTwCedLzX9xGZScCd3JfJIENGVO
         B9LFuzcRCB1059EyRQA5MCz4ywlaA9PxX5S730S7ChNqQ67LXQJgbwXs0FaMxsTouUh8
         bkAqX5x8oonFecj1UqU8hMW4zXAq4ixTUTEmnkIxvZsnYIKaXCS6b87h0aEYpMgKTsyL
         LVXrL2ndvr1URGrFXt5VZvYS09uMRUZFOS7x2y3dS1KDx4xhV3TXng8KcaG/VDqFXhNG
         yYtqnLuyIvSmIvfUtsiXYQ5ixp1GxhsHwaKG2i/pFGlTuJ9Rvlwm41+46BuCd9ceM2WI
         FSHA==
X-Forwarded-Encrypted: i=1; AJvYcCWSYKckgUVi4Y+tkvQm7D9x904fy4pbxZNR5sXsPk3MhWslZQ+qD8grlbb2X9m3PhSTdwo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTYGuQ9uFsRyFYo5w0gwHZcrTneBix7Ry6WO9WtarOAr/3RCe/
	dK/SI/xj7C+vnBePssj6PI2X3xLPNky4joeNOFAwdgTyWY8s/obQfdLgZxQkxI0EbDU=
X-Gm-Gg: ATEYQzzd+/4taCgXXTc1xb84WoJJ7gqXfdmnuo79ziSY0Ehsc3es+m2gCLsO/5PsRZ2
	qtREBvfDXNhpHpm6jFrwKhF8ftqldJ57levJfEg15i9ZPwVOdidUe71fNW9h/FJRVoK+mYZD9Zf
	CLBQzShiBg0pVNMGI6fL5Z9U48t67XBWMdGTsPN1H1qO2sWSvWPl+uaU+xqcE3+VUdZe0I0niQO
	LZotIDJfZRfB7MX6x52mrh/FGVifhYPHeTQVBXIOw7OgB1SRHsgE7Gym7AC/rNyAU6J8M8kTR76
	I+zU7W5Mv/7R5cj4NfLjOanKKUGm+KmRxMtEK6ijQlOfLGT2H1JTgzdAszfHtcMPM8IYIwHmmIe
	zF+sKS2xldvi9ApoKNzLLPZD6lus6il9tnS88gBxSJEQA4LleVqMzaReXgVcCmLXc/227XkhL++
	s06M7ilRZpYKf/MWjVHwnm+j7ESSQC
X-Received: by 2002:a05:6214:27cb:b0:89c:ca30:6b92 with SMTP id 6a1803df08f44-89ce8f8d2fcmr240762806d6.56.1774968846090;
        Tue, 31 Mar 2026 07:54:06 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecb5cb14bsm89054306d6.1.2026.03.31.07.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:54:05 -0700 (PDT)
Message-ID: <079b1630abe5dd22e032797fc12925c9c79ea305.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 1/7] media: v4l2-ctrls: Add V4L2_CID_MEMORY_USAGE
 control
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Frank Li <Frank.li@nxp.com>, ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, 	sebastian.fricke@collabora.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, 	kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com, 
	eagle.zhou@nxp.com, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Tue, 31 Mar 2026 10:54:03 -0400
In-Reply-To: <acvbOo17tU-s20BS@lizhi-Precision-Tower-5810>
References: <20260331072347.253-1-ming.qian@oss.nxp.com>
	 <20260331072347.253-2-ming.qian@oss.nxp.com>
	 <acvbOo17tU-s20BS@lizhi-Precision-Tower-5810>
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
	protocol="application/pgp-signature"; boundary="=-L4QS/jCTQxYv029Nq/FW"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-L4QS/jCTQxYv029Nq/FW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 31 mars 2026 =C3=A0 10:33 -0400, Frank Li a =C3=A9crit=C2=A0:
> On Tue, Mar 31, 2026 at 03:23:11PM +0800, ming.qian@oss.nxp.com=C2=A0wrot=
e:
> > From: Ming Qian <ming.qian@oss.nxp.com>
> >=20
> > Add a new read-only control V4L2_CID_MEMORY_USAGE that allows
> > applications to query the total amount of memory currently used
> > by a device instance.
> >=20
> > This control reports the memory consumption in bytes, including
> > internal buffers, intermediate processing data, and other
> > driver-managed allocations. Applications can use this information
> > for debugging, resource monitoring, or making informed decisions
> > about buffer allocation strategies.
> >=20
> > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > ---
>=20
> Not sure why not export these information by debugfs, or any benefit vs
> debugfs?

There is also a on-going proposal that uses fdinfo.

Nicolas

>=20
> Generanlly document should be first patch, then driver change.
>=20
> Frank
>=20
> > =C2=A0drivers/media/v4l2-core/v4l2-ctrls-defs.c | 8 ++++++++
> > =C2=A0include/uapi/linux/v4l2-controls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 4 +++-
> > =C2=A02 files changed, 11 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/=
v4l2-core/v4l2-ctrls-defs.c
> > index 551426c4cd01..053db78ff661 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -831,6 +831,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> > =C2=A0	case V4L2_CID_ALPHA_COMPONENT:		return "Alpha Component";
> > =C2=A0	case V4L2_CID_COLORFX_CBCR:		return "Color Effects, CbCr";
> > =C2=A0	case V4L2_CID_COLORFX_RGB:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "Color Effects, RGB";
> > +	case V4L2_CID_MEMORY_USAGE:		return "Memory Usage";
> >=20
> > =C2=A0	/*
> > =C2=A0	 * Codec controls
> > @@ -1476,6 +1477,13 @@ void v4l2_ctrl_fill(u32 id, const char **name, e=
num v4l2_ctrl_type *type,
> > =C2=A0		*min =3D 0;
> > =C2=A0		*max =3D 0xffff;
> > =C2=A0		break;
> > +	case V4L2_CID_MEMORY_USAGE:
> > +		*type =3D V4L2_CTRL_TYPE_INTEGER64;
> > +		*flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +		*min =3D 0;
> > +		*max =3D S64_MAX;
> > +		*step =3D 1;
> > +		break;
> > =C2=A0	case V4L2_CID_FLASH_FAULT:
> > =C2=A0	case V4L2_CID_JPEG_ACTIVE_MARKER:
> > =C2=A0	case V4L2_CID_3A_LOCK:
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4=
l2-controls.h
> > index 68dd0c4e47b2..02c6f960d38e 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -110,8 +110,10 @@ enum v4l2_colorfx {
> > =C2=A0#define V4L2_CID_COLORFX_CBCR			(V4L2_CID_BASE+42)
> > =C2=A0#define V4L2_CID_COLORFX_RGB			(V4L2_CID_BASE+43)
> >=20
> > +#define V4L2_CID_MEMORY_USAGE			(V4L2_CID_BASE+44)
> > +
> > =C2=A0/* last CID + 1 */
> > -#define V4L2_CID_LASTP1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (V4L2_CID_BASE+44)
> > +#define V4L2_CID_LASTP1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (V4L2_CID_BASE+45)
> >=20
> > =C2=A0/* USER-class private control IDs */
> >=20
> > --
> > 2.53.0
> >=20

--=-L4QS/jCTQxYv029Nq/FW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCacvgCwAKCRDZQZRRKWBy
9HhiAP9pxmgO01Tw2u1jmX3JDGf0HUlwoJFHITjsspschCXhGwEA2CLSZfwaGF3P
FBjvjpv8iG0M2472UaZ+ET35dRy4DwA=
=NB0B
-----END PGP SIGNATURE-----

--=-L4QS/jCTQxYv029Nq/FW--
