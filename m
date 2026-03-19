Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6673FB7C9
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 20:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773953402; cv=none; b=gSFdb4UPDIqeh0rGDyiYzrQ2brhWnMqQirbylXGRSQwKrwCKdInZaSAWFx/aa5FlqPEgoYnY3npRvTFSTRwBrAlcHHhHBOkd4mwncOvu81Mc8NB/pC5+dW6je7ecFACNTOrVlQcv9Ga6VJxf/WaAa+DvPDlWENDziZAoOoxXhzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773953402; c=relaxed/simple;
	bh=l305ltgLMdtMBCZvuBvAjIK8atGZ3/0+tZ1sV2Pj/ek=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jMKI3lxzas+gY9b6+LW8EW7qWBaZK6Q6/IuSvDj3vPbio4K0DQ+ua26iSfBGr3G+t7hLNSl40TmtyP6UeuybQ3uKtPFhzZa0Ekh5Smeoj4ToqGwXcCbj9/Dn6zwivZdwHCKHnFKUozvOmF9Crs43XvUQwET/kBZIrOb0FHLPfoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=XUz8NEmO; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="XUz8NEmO"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50917e02472so14672311cf.2
        for <imx@lists.linux.dev>; Thu, 19 Mar 2026 13:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773953397; x=1774558197; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P0AE6ezNpya7RR7FjT2PYnGrtSfyWo+dZi1jY1xEvZs=;
        b=XUz8NEmOXO7L7zmBRrJdZw3lSO/lh3Y9lCZCyxJXF+hQ9ugiycS9d9SRiWp38UNC8W
         3HiGjnNh3nhCFi2NHXgp6icsA4OqFVXZsdkMXI3px+e4506WRlOoSkj5p4J+3nlThk9A
         +06+zrR5F9ZNhTm/Xc7uGlQD/Y7qEpp9VWuGvPeu58PLf4hFda5JlLOAX6DXF6ZSC2hX
         tchp/qcGLoEmt7CgSrM2KnWt5Sn4pRPs4aRW6cfZoIyvhBWMIigzEeK0AFcXpPvp15jA
         JBY4O/8sX7o5sYMjL+tNsNkzM37c9W5VcHLFN+c0/FUe/fru4KjUcdy6bZTFyTtnWlEQ
         Ylug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773953397; x=1774558197;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0AE6ezNpya7RR7FjT2PYnGrtSfyWo+dZi1jY1xEvZs=;
        b=Zh8A58wBnpFen9KGa+1Ko791RfEqkqynWwgwGWmsNdwDvTTaSE4iXAdkJB+Jg+M9/X
         aIEHnXM2mONXwlBqbZX8Ft0FM1rIqOyxUQTk59SCd1iL/PY6aKZMK1p/N3ryZpeO+mbT
         Lfs+P7wT4l97/P9D6gjnhcwNbHEjxu/DMxn1CO98g0HxpMZhsVPt6jS4ayHt6AR27vLp
         2p8AksS7nR9N0eZTsIKtbtyoRGGk2G08PpJGy5UZaokaY31TWAAUqsS9TrJ3RVEDkTvC
         CTX+RKQFEBWppH9+CMfNYPrNa0r+1dPKLpQWgZcidQx5U+lv8Kpl1ljdkt8FSUtw/z1q
         ovxw==
X-Forwarded-Encrypted: i=1; AJvYcCXYojAlPu6TJ22aRt+U+zVYSsHKS3iLXJVUxtaphIOdQ+Ex4JdxTk/gSs1o7WTH0piiERI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzlzd6W5YC83LAJslDGzsZuwvpBT5D03JwKucnEgGY1oY+VcT5p
	CADWDsaqCCy639a6MUGPTQJy/aqsPPMhR7rxAH0lmgxYxQKbAKGYxmei3X3VQPxMNzs=
X-Gm-Gg: ATEYQzyD5iBpLwgJeqFQs4IUcFtoOTF8YP37pG7KBWQXXSDgqi+o/ak9Wv/kYimzIXZ
	4zgN2di+jQiUmVY1tyn2B7XpQb1L+CNDW8AtktlV2cJxRw4/n5BYQEcY0VQRroda11POQOVuzB+
	eCzbY6cpufaaxihLR6ewv1omSkqP+7Wwf0Dqx69Qg35+OmT8CoQQAr1LYURh3usiyDJSMTgaTI5
	uQ36QkopJXt6ShEMTE1Bz6XIvHmezhAly9PdpS0dgOK+2DAj1kYv0K3x+oTLZuXIHBwKAOubYxc
	0I3aZHMpM/DXQE8ZAwdvIgkuXG/AOISsgQg3ithQSzVdJ/MAJ3MGMInfOMsEybt0pYEVIqtpr0S
	Wb1Zw9xCQeFIimlnPsU4aod6Q9wcZJXG/lzs4zj6KKPVlPHym9d+R4SM3aUYdgDwJVW6R6Rkh9u
	cp8rDM+AIqdYlkc4CUGNbA4+xu9etY
X-Received: by 2002:ac8:7f43:0:b0:509:481:536d with SMTP id d75a77b69052e-50b3753b698mr10051231cf.59.1773953397275;
        Thu, 19 Mar 2026 13:49:57 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36d0671csm5413341cf.10.2026.03.19.13.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 13:49:56 -0700 (PDT)
Message-ID: <ffe1c9db59092ac196e9ad1fdbebe73b75d3fcb4.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: Fix race between m2m job_abort and
 device_run
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, Frank.li@nxp.com, 	xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 19 Mar 2026 16:49:55 -0400
In-Reply-To: <20260306065951.837-1-ming.qian@oss.nxp.com>
References: <20260306065951.837-1-ming.qian@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-NtmVNV443a/7/iP6AJJn"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-NtmVNV443a/7/iP6AJJn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 06 mars 2026 =C3=A0 14:59 +0800, ming.qian@oss.nxp.com a =C3=A9=
crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> Fix kernel panic caused by race condition where v4l2_m2m_ctx_release()
> frees m2m_ctx while v4l2_m2m_try_run() is about to call device_run
> with the same context.
>=20
> Race sequence:
> =C2=A0 v4l2_m2m_try_run():=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 v4l2_m2m_ctx_release():
> =C2=A0=C2=A0=C2=A0 lock/unlock=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_m2m=
_cancel_job()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job_abort()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 v4l2_m2m_job_finish()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(m2m_ctx)=C2=A0 <-=
 frees ctx
> =C2=A0=C2=A0=C2=A0 device_run()=C2=A0 <- use-after-free crash at 0x538
>=20
> Crash trace:
> =C2=A0 Unable to handle kernel read from unreadable memory at virtual add=
ress
> =C2=A0 0000000000000538
> =C2=A0 v4l2_m2m_try_run+0x78/0x138
> =C2=A0 v4l2_m2m_device_run_work+0x14/0x20
>=20
> The amphion vpu driver does not rely on the m2m framework's device_run
> callback to perform encode/decode operations.
>=20
> Fix the race by preventing m2m framework job scheduling entirely:
> - Add job_ready callback returning 0 (no jobs ready for m2m framework)
> - Remove job_abort callback to avoid the race condition
>=20
> Fixes: 3cd084519c6f ("media: amphion: add vpu v4l2 m2m support")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Ok, I guess that also reduce the overhead of scheduling jobs too.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/amphion/vpu_v4l2.c | 9 +++------
> =C2=A01 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/pl=
atform/amphion/vpu_v4l2.c
> index 64fc88d89ccc..7cccc994fc50 100644
> --- a/drivers/media/platform/amphion/vpu_v4l2.c
> +++ b/drivers/media/platform/amphion/vpu_v4l2.c
> @@ -447,17 +447,14 @@ static void vpu_m2m_device_run(void *priv)
> =C2=A0{
> =C2=A0}
> =C2=A0
> -static void vpu_m2m_job_abort(void *priv)
> +static int vpu_m2m_job_ready(void *priv)
> =C2=A0{
> -	struct vpu_inst *inst =3D priv;
> -	struct v4l2_m2m_ctx *m2m_ctx =3D inst->fh.m2m_ctx;
> -
> -	v4l2_m2m_job_finish(m2m_ctx->m2m_dev, m2m_ctx);
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static const struct v4l2_m2m_ops vpu_m2m_ops =3D {
> =C2=A0	.device_run =3D vpu_m2m_device_run,
> -	.job_abort =3D vpu_m2m_job_abort
> +	.job_ready =3D vpu_m2m_job_ready,
> =C2=A0};
> =C2=A0
> =C2=A0static int vpu_vb2_queue_setup(struct vb2_queue *vq,
>=20
> base-commit: f505e978d1a0442adbbde48aed38c084ddea6d6e
> prerequisite-patch-id: 0000000000000000000000000000000000000000

Not sure why this line ...

Nicolas

--=-NtmVNV443a/7/iP6AJJn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxhcwAKCRDZQZRRKWBy
9HjYAP0S0YE21EwzVQU1/zKYJbvHM7WGRp6aud37nxGkL7LXVAD/QVLAcoFXLtH9
khW4FVX+kR4xvQStun2japJcuFbnQg0=
=Af7N
-----END PGP SIGNATURE-----

--=-NtmVNV443a/7/iP6AJJn--
