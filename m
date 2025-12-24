Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0D3279907
	for <imx@lists.linux.dev>; Wed, 24 Dec 2025 19:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766603886; cv=none; b=seVLVioJ4gv5IjOOW8QPtuz9IBEBskJQrFkqkJj/TGG3dY1F+wp+/xEF/pmqzB677DGP6shybFlOrDdQoTj9i8FN/lV8iVBsW+l03gQlKqkCzwObpPJ9nGRwiZOuiq8vM79UY1yqVmnWHtDj6v+VOba8/qJKZ2A+YrFpVEjMY8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766603886; c=relaxed/simple;
	bh=xZg5eUrmrvQkn5kS5Z5StXMcG2MdDw+ySiCbxKWmi3o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ITJn0QPWSZb0bKeEDQlClq9SUUqsPgOJWFHUEJ8wtjEYVxmuDiis+WOh/pIuqLMQT5TPahqo1i/XL7+m/N+G5JsXgn1LUaM0X82APQUNDsENAKvK2WHsxX/BwfLbRe7w5XHo2abAT9bXWtGE1gG7fbMTZbef2/npxxT9J3Xy90s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=Scog6fPp; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="Scog6fPp"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8b31a665ba5so691565485a.2
        for <imx@lists.linux.dev>; Wed, 24 Dec 2025 11:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766603884; x=1767208684; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xZg5eUrmrvQkn5kS5Z5StXMcG2MdDw+ySiCbxKWmi3o=;
        b=Scog6fPpK5UNmRLBc+r1S8YxnOBzbTHXag98c4fjlLKB+MWUgdIZgsdy6UPx8QOq8K
         wSIDmYFwSygEIvL74kv/q78+EgQstTVEfdRa5VDIoyHLXOo0EO2+uw7esxeKex1sWc71
         B1f/F0CxNomMgASqiKdJqffQs+ym98G3v9mXWQ9tGBfk5gdN9cBFwGae+M0C55veB61k
         To8gsEe2TULkmJ2woBUCuds//ObBeyf647dX3+72oDl3Yvhq/sj+RdbVOsDNi9nUqRAF
         oJvZQz1BraD209x8kG6AZLZ7GooAnnDwda6ed/HTVY5328VsaMzI9kZrK1WabVPmtJN6
         PJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766603884; x=1767208684;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZg5eUrmrvQkn5kS5Z5StXMcG2MdDw+ySiCbxKWmi3o=;
        b=FKEaha7wZwDx7YbNlcm5WXdfR4Sbesy4ibkd6i8z2U6hPbu9p2xUiWt/x1/RB5x/1v
         rDTYptRX+KN3/SdmbwoCjYyNWYfRGyd8GcPXh4xeN8AZRHRWAz8zTrW+uAn+L5XIgZRC
         bjlV8trPPdwpa02zl0D4/kFoosf03/l5992lXTKbVHvFM2KMUgVtTQXjSScdfksACU3c
         r7brlpIf6BrGwTV4umgcyFA9TwzrOIOmIzwbRoI8MseB8L+HYzCuLc1ykICTI8dfAOrl
         LNzvF63T89ws9t3dFXsLcdMz9hIWAUGXIVftR0kKu/c7f5EPm1P7l406Pe9jF8+M0+mV
         Z9HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbOHC6YuGDcIh1E5BFehFC/Sd5ManaVVvvNXXZKLZRouCDgxnjpmOUjGKblfWFtVHoYLI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPngmM6Vp855YC5ef64TTEAlSrKCFiiaRGHl5AVs1H0KJmcUfS
	iVEhDGETe4nqm7NXwSvIJPbGvX4a03iR7XuQYvOc5gj0mT1JHaiBSUCqh7wCTbSy27g=
X-Gm-Gg: AY/fxX7VBLymdo7lLXW6UB0GktSCi3sJA7xXyjVK0stiG5ZF+a6mcmUXZ/AYYw1eJry
	FMOc5+epvPkvuKNr51iD0M+xZWa7MFo0+ceMS6pvKSDokPnq+GYxhQaXrEGHnPA1bBweVDPCR6m
	QAIa7FUYJi+1XPb7OaWFivlJvoGzIBLNQgZXolLT0tdTJloPZP6AhYDqgBEp5IT1kfWZtKeFRJr
	CHoSMrDYAF0BAU+SaCX3bmUu7ZW19qCexfMmDfPauijNyyUdoX40LV7u+dcbnN3WJm1ErsKpHEb
	UYlSC6Ww4Lz0v2GeaKdGZZ4BKZ5ew/Lu+DaTyVrVGZ2xYJymhUFXWNM2mT8IHxeF6MfUF9t/p7a
	E95DzM8khOnVA729bXgLQymlateGHV5CTFFLhGi34ZdIPN/lemLbctXNoe+TnKU2rKh2cq7lg52
	Iidd5p4ycpTXGlPjtR
X-Google-Smtp-Source: AGHT+IFE+lwyQ0lBVNQN9AauKUiupd6cPnSEIMOpaIWg/SbEk3o4rIkkKVIUe+K1qw6hZBgNQd+vpA==
X-Received: by 2002:a05:620a:4843:b0:8c0:cca6:8522 with SMTP id af79cd13be357-8c0cca68539mr1707477185a.37.1766603883870;
        Wed, 24 Dec 2025 11:18:03 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9623feb0sm136297056d6.2.2025.12.24.11.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 11:18:03 -0800 (PST)
Message-ID: <b6ae2f157fb6fd0b80602f363b99dab1dc0b1cc6.camel@ndufresne.ca>
Subject: Re: [PATCH v4 1/3] media: docs: dev-decoder: Trigger dynamic source
 change for colorspace
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, Frank.li@nxp.com, 	xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 24 Dec 2025 14:18:02 -0500
In-Reply-To: <20251217030227.1546-2-ming.qian@oss.nxp.com>
References: <20251217030227.1546-1-ming.qian@oss.nxp.com>
	 <20251217030227.1546-2-ming.qian@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-n17ZtuMY6Flq/RX7bbkp"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-n17ZtuMY6Flq/RX7bbkp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 17 d=C3=A9cembre 2025 =C3=A0 11:02 +0800, ming.qian@oss.nxp.com=
 a =C3=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> If colorspace changes, the client needs to renegotiate the pipeline,
> otherwise the decoded frame may not be displayed correctly.
>=20
> So add colorspace as a trigger parameter for dynamic resolution change.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0Documentation/userspace-api/media/v4l/dev-decoder.rst | 5 ++++-
> =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> index eb662ced0ab4..2beb6ba1b3c2 100644
> --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> @@ -933,7 +933,10 @@ reflected by corresponding queries):
> =C2=A0
> =C2=A0* the minimum number of buffers needed for decoding,
> =C2=A0
> -* bit-depth of the bitstream has been changed.
> +* bit-depth of the bitstream has been changed,
> +
> +* colorspace of the bitstream has been changed, but it doesn't require
> +=C2=A0 buffer reallocation.
> =C2=A0
> =C2=A0Whenever that happens, the decoder must proceed as follows:
> =C2=A0

--=-n17ZtuMY6Flq/RX7bbkp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUw8agAKCRDZQZRRKWBy
9CHGAP9gEAjecV8PUMv/Zb5o06iitW7EtgLf6x+mn9znVa2a7wEA6gnPxAGouGcD
1gWVb5hh/gTP+c0avA3fnMj4aV97VQc=
=oB75
-----END PGP SIGNATURE-----

--=-n17ZtuMY6Flq/RX7bbkp--
