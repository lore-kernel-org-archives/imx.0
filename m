Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A812E8DFC
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 19:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773950025; cv=none; b=XzfEo+gp5BQz7ZwNHtimmBa7eTOW3SbeynG+ii+zn5Pmr69Jnf25AMFFhzYTPnbUt9Q1Ny2QtINR+Zb5wCFW7H9BbXs5OObqXmNqPH+i0LrsogXCGUzV1Ad6Vz5KukFtFUHY1PHajBkGUujbloeo6EEH/Ae5fp2Gw6NJlQtK7l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773950025; c=relaxed/simple;
	bh=v6+Qt58QS3RO8MzE0P2vRxK3tDaBa02ALoenRmy4fBY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CQo2C+ywdJuG8kNIk8sYW26J7oSqJteSLPBIZwMGcn89XUdib5vyvYaE6B3yXuWWJgdyNKgmbCpoDYkdkCxZXucBrEiqNdM69+EaZIIpsjJgEHEYDQn6hBgC5m64Q8THR3xlV5l+8hfsr0KZ8879mua48Hyk9McNbjzwr33a6SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=nEghuRIK; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="nEghuRIK"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cb4136d865so181047685a.1
        for <imx@lists.linux.dev>; Thu, 19 Mar 2026 12:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773950023; x=1774554823; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YhWNc1Vjc+LamDy9uWXZKku/PYKqtLuRD4QgrfI4wXc=;
        b=nEghuRIKCOqbTlxd/6yXGSvFLatTbAOJU+hq/DM7acVEHnJpBGhji7hL/avOvo3nEZ
         vfol9i+XoJ+R1iB6OZypHMjP43FBZh0AtyC9/UUueHqLy2ed3/yZRYVjdJ7cIiyyzOfa
         fPF0plNR+V3QibCNdWqK9d9z8hW+Infh472JcHrMeV6xl0bFGFG71lp5km2sXqtuAaBp
         qc6+X850/vo7EAx1ML6QpfaPGBfaq94OPaOJdWmBnWcoF7QWLM3MrCu4HgfHnGrlCCs0
         5zJSSlFnyYBcrHTmjcZNgno7KC6636kUfNCZIZPFSqgHWT96DgbtKTTaR2NdP/D+uJqH
         EsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773950023; x=1774554823;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhWNc1Vjc+LamDy9uWXZKku/PYKqtLuRD4QgrfI4wXc=;
        b=dLyUdrmdpexJUylBeYAdYnPdzA0zUj+o5FMfB+3ensgKETDCReOMj2ZENRNS6PI5ZJ
         izA1LHw1SNT4gKaQNuFxRs9L9gIA864Ol0j4MYuvo+B5P7ITS/vbD4Tnx3gIOybEINkG
         nba3hZsL8QNor2miuD13P8uKokLRtUClBQBGl7gmVdgPPrOxcWqk2xndswaQqJNS5ZeA
         sPGgOpcbUXs6lAmNrBJOSoazfg9aZOE0Yi5CJ4f0LlCrMUgPzL35N/6v5VoLfFsBYfkF
         i1NynjtL2GL0bEHfGX6DOyyyRkciBhNbHxzoy5pZ3v+cIdk3pABJeH2SeitgclhRX3EX
         goWw==
X-Forwarded-Encrypted: i=1; AJvYcCXYaBrbYZXwFWKeDtGFytdqg5lXU9c/CdGnuFqaWacm+E9kauoxFycfy27Y75+6dd66WpA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfN9vssCV7HwAVmmleOWZERVS3Ftf/3fu+dul9V3ZmNE2fRhU1
	t9qgspOVMLsEa1MEUeFt/hWORTHZxDRELXMNZ2+j4d75WYx0SwXblrpubf5rxH+A6YE=
X-Gm-Gg: ATEYQzygkvrSPZNi/jxOvTIUcwaEyFVE2iLEuOjQpQLB2WlEU/CEJrTjghex2Zaalau
	HyuHcNLLvDbTuJ+yl68w4bA/KY+RmMHr+nqIC9ox8Jc4GEvpLxJFoOOIpYy2D3z6y5VFLG97dZK
	5kjttEJ6tN8OIxHjGcxPT3lkGVdLAFEQK68twdg7wRue2zkS0mswvvLD6sbF/qbX8l+3e0J0cGx
	54JFvspnjxpkhwBTJ52vce1D7lY5/6buEeSJqKIV8uCvlxxefrYQuZAxVphyNHx/SXPFpBox/rN
	w4f+lNwgJrMylIsjJRiYXuGRJAiNQZY6QChOzBP8OCdtmM6OOvyeIgd62+uqnarz9/slf9p8ooq
	OHMl7M41fOAqwcLTUhsN4g72fV4DXuL55Xp1RUo7MWrV6mJzMf2g/9JPrv6cTBI8VTgEuUzHvo3
	46mpynx/4Nb1kCGKzmn89KPyX8bxxT
X-Received: by 2002:a05:620a:708e:b0:8cd:c050:7db6 with SMTP id af79cd13be357-8cfc7f6a470mr74114185a.49.1773950023287;
        Thu, 19 Mar 2026 12:53:43 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc90bb1c7sm3480885a.35.2026.03.19.12.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 12:53:42 -0700 (PDT)
Message-ID: <24867f578a64b1dd6ea55eea47fe7c4a854e5a58.camel@ndufresne.ca>
Subject: Re: [PATCH v4 2/4] media: imx-jpeg: Use devm_pm_runtime_enable()
 helper
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, 	Frank.li@nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 19 Mar 2026 15:53:40 -0400
In-Reply-To: <20260203082349.1082-3-ming.qian@oss.nxp.com>
References: <20260203082349.1082-1-ming.qian@oss.nxp.com>
	 <20260203082349.1082-3-ming.qian@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-8ILH7WDBQi0ijJCZzATq"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-8ILH7WDBQi0ijJCZzATq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 03 f=C3=A9vrier 2026 =C3=A0 16:23 +0800, ming.qian@oss.nxp.com a =
=C3=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> Use devm_pm_runtime_enable() to simplify probe and exit paths.
>=20
> No functional change.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 15 ++++++++++++---
> =C2=A01 file changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/med=
ia/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 39022c1bf36d..877e6c4f7406 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -2971,12 +2971,22 @@ static int mxc_jpeg_probe(struct platform_device =
*pdev)
> =C2=A0			=C2=A0 jpeg->dec_vdev->minor);
> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, jpeg);
> -	pm_runtime_enable(dev);
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable runtime PM: %d\n", ret);
> +		goto err_pm;
> +	}
> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> +err_pm:
> +	video_unregister_device(jpeg->dec_vdev);
> +	/* set NULL to prevent double-free */
> +	jpeg->dec_vdev =3D NULL;
> =C2=A0err_vdev_register:
> -	video_device_release(jpeg->dec_vdev);
> +	/* Only release if allocation succeeded but registration failed */
> +	if (jpeg->dec_vdev)
> +		video_device_release(jpeg->dec_vdev);
> =C2=A0
> =C2=A0err_vdev_alloc:
> =C2=A0	v4l2_m2m_release(jpeg->m2m_dev);
> @@ -3047,7 +3057,6 @@ static void mxc_jpeg_remove(struct platform_device =
*pdev)
> =C2=A0
> =C2=A0	mxc_jpeg_free_slot_data(jpeg);
> =C2=A0
> -	pm_runtime_disable(&pdev->dev);
> =C2=A0	video_unregister_device(jpeg->dec_vdev);
> =C2=A0	v4l2_m2m_release(jpeg->m2m_dev);
> =C2=A0	v4l2_device_unregister(&jpeg->v4l2_dev);

--=-8ILH7WDBQi0ijJCZzATq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxURAAKCRDZQZRRKWBy
9HGOAP9x9uCXnIeQXoRzJWIGjr07Fij2NUuyHkDuiL5QrZD4tgD+K4d2XKoSsfpX
wea5NI21IVEx5NJdUp7XmXeNCPU7ngY=
=lQDp
-----END PGP SIGNATURE-----

--=-8ILH7WDBQi0ijJCZzATq--
