Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCC02C11EF
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 21:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767734223; cv=none; b=P9b6mFugxyaf7Z5EK+Ozh7CJZGm7xvdBeP37i2NXVzw/1F/Fr52zjTCFuUD/f9YdDOAXM7buKQzPixFRIp94joK3cBg79CxHMlD38Okt6bz6PIttAKCUVD/N0IRMGs6N3iHoCfPD7pCdTj78YZm7kLWTFl0ZJ3EK1ON0XhwSG5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767734223; c=relaxed/simple;
	bh=jHtip6V0HkmReJlbFx/rwoJf80cFxyWcmUxx3DEgCFQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D85hbQ+0qNhVCaKu73AG0Bl8JDyBGxeZdTnwWk5MvF+TeLBAKCe7uZNcWesHrm6zP5cASwDBImF/Z4RAsvN40F0qHQB9QG7Lb5Dvti8jDjkGjGfhdbiTFlnXf9bMuTxLkQEYMgvN7ks4Uc80P87SVc+0sqZEM22WrAJXsyjH81k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ctYlEOEA; arc=none smtp.client-ip=209.85.222.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ctYlEOEA"
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-8ba3ffd54dbso181606485a.1
        for <imx@lists.linux.dev>; Tue, 06 Jan 2026 13:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767734221; x=1768339021; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7TV2WRsatUGScTT5wRm1AbQhvqUeZU8Yk5dVGjwGAag=;
        b=ctYlEOEAyIifs5uJcJycikwx5w9W4cKGUoOo5d/ARFFFtq5jJ6xOu076c8WOzjO591
         8JH3amk7U+CoLlh7UuPhhE1HyPd4gItTVhNsioS/9dbdL3/9mA8gcBNqBGxdFlJy7wec
         Qbmnb+f/mmlOgQL9s4vzOoYeiINoBvgtazFTYJdkMz7iYl7JrGpGy+zUh81/KD0DOmAZ
         492mStfliZuaQbVKpttxeJRJucqNaiU76jBaDPIwLebNM5y6/IFzpy3crRpiog29AQcd
         90ma0TrnqngW+66UNFFR2mjhaNHT8ITXa3OR5MHZqTteUBbWGdNpTJE1Ztqf8vP9RazC
         80YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767734221; x=1768339021;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TV2WRsatUGScTT5wRm1AbQhvqUeZU8Yk5dVGjwGAag=;
        b=Dsf75KUQZ9doBxbPNFG6mMtCX7rvlg7eZvE6MDUXALvKWUsLTiVHEeeAH5002bFy+m
         nLUNuKfxGYmzfBwvjgLurUG+DWrC0P+zQjHrL7pABGWAdHae5bDpphBMRA+5/YvE9TUn
         5Q7Vq4ubhr7ydji3dW5gMv3BnO/JlovGYR78ttwtBpcHInmer3bbLWI8zPuygO1AGmMq
         7Wqbmqo7yxC7BfF2Ec4UhGFgVNFslEbB73i9rK1ss1OnNitUnOBragI2+BHmcXh3zMS9
         TV5MA8ZJrkVmuz4e4TJsYgJwMYsK/0jjbuqtjo5Ahu4lKykAAfNy6nkQKijcY3ISRXIk
         QSdg==
X-Forwarded-Encrypted: i=1; AJvYcCWonXBRzQSzPnDv0EIXx4vmaaa05UgFRve2dveurkGLC4/2SIu+69sOqduTV/KaDgXScSE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDJKCYQf+U7PxhQ7wTiVfLyw9sX957gXqhSJMOpvpj0DTZZaIP
	Tw9+n+YdFp0n58mSaUdrF21SpK2qc3WtG94Hx5g1FpJoqeuqspSb5lVvdxx2ftQObnw=
X-Gm-Gg: AY/fxX5M7RTGQZ77gHazoDDMzHeIawTCBmhtm/FE7m302CLcp8+h32sGDMgUb08j0Xp
	AM++jb+eAXUe+ZnBNV2EYMMi2ucWyF8CD50Js9+e59lSG7FWDo4/oIyrVyb7pwi+hxTp26UtYT7
	FIRJBUV6ZigmgyDWMdi7kv+wTKRhFC5VouJvhT50mFvpTMMT5urbCEJ94kDlrmcKE9i3r8eo9rP
	C/XOf9L2eD3Zz4Remys5vQKMUB8WpnBR6QmVqrifDe6kVSoZzT9Ndqfj++WSrWU/Vo8VB1Hnktx
	f6F+gF55Fw927JQ3NEW96+6wxrD5oJGHR1yhg73jP+b0YpZ+sTZiyFAgd6kdohanEKasa5XIYux
	ukAoCwJ24WgFGNE6SfyjF3nqAKL8EV5X5YtiWCA2H5BbEaqK709L8Ykh2Djzocerzgo+4jkuhAm
	385NtPCErGYR2IJFQX
X-Google-Smtp-Source: AGHT+IEDtBcDNf5d5I+gsrvmMoXJBR0rE9MDwk2UybQnSIliOc1+CIFRNYrlBfOAksp85cLAttnjyw==
X-Received: by 2002:a05:620a:1a19:b0:8a3:cd9e:e3fd with SMTP id af79cd13be357-8c389379de1mr33587185a.9.1767734220893;
        Tue, 06 Jan 2026 13:17:00 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f5438f6sm235814385a.53.2026.01.06.13.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 13:17:00 -0800 (PST)
Message-ID: <71b286c20cd7806d9788043d11958b4eeeaa819b.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: Drop min_queued_buffers assignment
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, Frank.li@nxp.com, 	xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Tue, 06 Jan 2026 16:16:58 -0500
In-Reply-To: <20251223062754.836-1-ming.qian@oss.nxp.com>
References: <20251223062754.836-1-ming.qian@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-bX9K4x8lN/AiWznT4ldN"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-bX9K4x8lN/AiWznT4ldN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 23 d=C3=A9cembre 2025 =C3=A0 14:27 +0800, ming.qian@oss.nxp.com a =
=C3=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> The min_queued_buffers field controls when start_streaming() is called
> by the vb2 core (it delays the callback until at least N buffers are
> queued). Setting it to 1 affects the timing of start_streaming(), which
> breaks the seek flow in decoder scenarios and causes test failures.
>=20
> The current driver implementation does not rely on this minimum buffer
> requirement and handles streaming start correctly with the default
> value of 0, so remove these assignments.
>=20
> Fixes: 3cd084519c6f ("media: amphion: add vpu v4l2 m2m support")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: stable@vger.kernel.org

> ---
> =C2=A0drivers/media/platform/amphion/vpu_v4l2.c | 2 --
> =C2=A01 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/amphion/vpu_v4l2.c
> b/drivers/media/platform/amphion/vpu_v4l2.c
> index 47dff9a35bb4..1fb887b9098c 100644
> --- a/drivers/media/platform/amphion/vpu_v4l2.c
> +++ b/drivers/media/platform/amphion/vpu_v4l2.c
> @@ -670,7 +670,6 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_=
queue
> *src_vq, struct vb2_q
> =C2=A0		src_vq->mem_ops =3D &vb2_vmalloc_memops;
> =C2=A0	src_vq->drv_priv =3D inst;
> =C2=A0	src_vq->buf_struct_size =3D sizeof(struct vpu_vb2_buffer);
> -	src_vq->min_queued_buffers =3D 1;
> =C2=A0	src_vq->dev =3D inst->vpu->dev;
> =C2=A0	src_vq->lock =3D &inst->lock;
> =C2=A0	ret =3D vb2_queue_init(src_vq);
> @@ -687,7 +686,6 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_=
queue
> *src_vq, struct vb2_q
> =C2=A0		dst_vq->mem_ops =3D &vb2_vmalloc_memops;
> =C2=A0	dst_vq->drv_priv =3D inst;
> =C2=A0	dst_vq->buf_struct_size =3D sizeof(struct vpu_vb2_buffer);
> -	dst_vq->min_queued_buffers =3D 1;
> =C2=A0	dst_vq->dev =3D inst->vpu->dev;
> =C2=A0	dst_vq->lock =3D &inst->lock;
> =C2=A0	ret =3D vb2_queue_init(dst_vq);

--=-bX9K4x8lN/AiWznT4ldN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaV17ywAKCRDZQZRRKWBy
9AJvAQCOUqkKAoFddF4SylaesLlyIFIg1BJfhSG9YtxlQRDd0QEAx2tLbQPMsfkV
5Q0sfD2HPdhP0VQqRwP28tOY0jXrQgo=
=Wyl7
-----END PGP SIGNATURE-----

--=-bX9K4x8lN/AiWznT4ldN--
