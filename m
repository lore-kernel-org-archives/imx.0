Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96833F8EDE
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 08:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784016582; cv=none; b=Wq+J2URyogn+JpFq0zUo4g3xzyGertyboJcjBo9o3kmHgGjJg/7lxGnWTJgB0BdjLO1oQfrOv90YV4yImUVtLG2Vpev2xs6GAHdxuxWgUqSCBrHVSLhm4A2UdLITLcBEwzEWY4tCkHFyAlcXjRttv5WyGCLeyCpm9FTnK8yXQZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784016582; c=relaxed/simple;
	bh=CSopGfg/2uqJ9qyI6V5MUClcNoSB2YHdurPLNoXQC8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bsqedo5Lj66zad19vHl+VEOcRdlNUWPzLeT1JA4PKJOW8QieByS6J6RezTKQtEVeZ0eA7Dig2+5gnVmNfOqCCr1Z7OlpSBIRx6LMTL/ampgP9B6NPZBlJvm9hjqlUpwjtB8wSZok3g4jYiyIWRhfQRQY5lfVPDwoQgHPKQGKdYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=abdjSF3t; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="abdjSF3t"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so29542515e9.1
        for <imx@lists.linux.dev>; Tue, 14 Jul 2026 01:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784016577; x=1784621377; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aM36wlhWe5Za+7EYg7RTzmmHOw7LMbYpoEaZIu5nkYI=;
        b=abdjSF3tTGi4TsIzv9XmbMp0DFlCUg0Q2zOZXtyCvwQW4utCvP8gqbomHCkDm2EWWT
         JzMCYwbnJvZSRyJPogD9yP7wjvXmJz4lTUBxl02kBorUdbNC5DlhpVlZQzoQKhS2dxcI
         JsLJtVMHyr4Tl3z3daXJVfz0GRqw8H1gm6NZAzul+FiAnszQtjQ06BbZWFKeLxkxxD4u
         +FF4BBaYb5uCiJLtYHR4H9eozebz/faTjB/nzlUkhJvopNV23oc9iPESynx4BNi7r6Qd
         yJbY8EorNhd2puSGk7iGPu5kccjGxv42UglmC90m6ej9Ft3Lj9DpY3DjBkmvjMn/tlQp
         vpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784016577; x=1784621377;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aM36wlhWe5Za+7EYg7RTzmmHOw7LMbYpoEaZIu5nkYI=;
        b=N7m3Knm+TYrqIpMuxmNUnoqpFCs56sgpXoHqq8z7mR3ap8lNfuASqBwjPBK5uog7DS
         LDMyPyoHn1Gzh/bCoCVI3IHVEDjCWVkqz/bPpEEh/0lsZuloZo9TJpJvPxucljOgOhPI
         nDhYz5XcGSlNzm80pK1+GiIpM8rbxl1xEuSl0lwk5r48oCeBx9wkQ4WHJSA1iWmbDCMz
         soqzrST6u1nq5JlZVB+UueclLMiJ4iDPdv+cQZm6BZOKpZeaXgxZYM0FkhhwcEAhfQ6V
         w7rmr8sH5rIIue1ugk8FwKe5ZMinLidWWj+/lXaLlGagAwm1xma9qE+lNwU2TBC4JCr8
         KVrg==
X-Forwarded-Encrypted: i=1; AHgh+RrcS3eH6cAOydk1RBI5ux396BxXkrl1s+WAUE7bXoxng0yV4GhT4unLyh9WcjErJZRFKF0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/FjQGLwzc2/QsMSms6yoHyZUZjosaZpXj1vNKDADPt094Hr5A
	A8NCBraOF50GrT8yW+P14CeSYg0JjX8JTu1H8+zilnx3ZHGJ5+5Zkb3TyiFRiLL5lKMQ4SkYZcK
	IHoYT
X-Gm-Gg: AfdE7cmc9Bjw8zrZoYSMf5+KmjpfyLsupmhhsLAjN+Nfo9zgSQEMG3Wxsh9ghVhZGEI
	eVZ6cdfLpiLKohS4eZAR0j51ODR68i7X4tDxtxaldGpqAQo7/uyva5iuS18ngqSqYP7Ge9BGP23
	PTQzbKuGT4YRwUxcBUMuuM8drVqAlUPAd8ERQAIrZztmTEgZ8SRcttNobsNLg2nGj0KYP2osOwC
	qu6/NhVyUuiOC35z9RMRnZqRfjWe9BkHw5v9R+/WtGOmE7pjtOHzmwGsk5kylszESvBp4mJ/4qr
	LSJjg9sI8S+mzqvf07mfsXYg8D1hltzpG4mDGj5MuG5kyyQ6RPwb/5ArZUSg2jsmsIflNLWNPr3
	epJ/etQMreCKWedWGdn+fQX3XPoYhOB8pAjB+2baxu26P8i2tr9X4k7zzIiocDfEcXLIhPu8VS9
	x4Qhb/utmOfYL9ToxmPKYP7y7AwbO8n5Ni840Cu/8VApF+K6lkL/EFssCfd9eyKyXBbC9RsE8Wn
	gBr
X-Received: by 2002:a05:600c:6304:b0:493:bb23:152a with SMTP id 5b1f17b1804b1-49485739980mr44250605e9.34.1784016576650;
        Tue, 14 Jul 2026 01:09:36 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4950a2f9402sm61598235e9.13.2026.07.14.01.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 01:09:35 -0700 (PDT)
Date: Tue, 14 Jul 2026 10:09:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v1 07/20] gpio: Add missing OF module annotations
Message-ID: <alXtMOwKmsfM0LDE@monoceros>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
 <72f0871dda4d65bb2b6ff8827da6a3b2dfdffab6.1784013063.git.u.kleine-koenig@baylibre.com>
 <20260714073425.CA6181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="db73lwnkw6hdook6"
Content-Disposition: inline
In-Reply-To: <20260714073425.CA6181F000E9@smtp.kernel.org>


--db73lwnkw6hdook6
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 07/20] gpio: Add missing OF module annotations
MIME-Version: 1.0

Hello,

On Tue, Jul 14, 2026 at 07:34:25AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [High] Missing MODULE_DEVICE_TABLE export for the mpc52xx_simple_gpioch=
ip_match table.
> --
>=20
> --- Patch [7]: [PATCH v1 07/20] gpio: Add missing OF module annotations -=
--
> commit 292bbbdcede3ce86fe1309d514a852f272c27bac
> Author: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@baylibre.co=
m>
>=20
> gpio: Add missing OF module annotations
>=20
> A driver module matching devices using an of device id table is supposed
> to declare that in the module's metadata. Add this information for
> several drivers that failed to declare these.
>=20
> [ ... ]
>=20
> > diff --git a/drivers/gpio/gpio-mpc5200.c b/drivers/gpio/gpio-mpc5200.c
> > index 00f209157fd0f..2c828bc922ae3 100644
> > --- a/drivers/gpio/gpio-mpc5200.c
> > +++ b/drivers/gpio/gpio-mpc5200.c
> > @@ -180,6 +180,7 @@ static const struct of_device_id mpc52xx_wkup_gpioc=
hip_match[] =3D {
> >  	{ .compatible =3D "fsl,mpc5200-gpio-wkup", },
> >  	{}
> >  };
> > +MODULE_DEVICE_TABLE(of, mpc52xx_wkup_gpiochip_match);
> > =20
> >  static struct platform_driver mpc52xx_wkup_gpiochip_driver =3D {
> >  	.driver =3D {
>=20
> [Severity: High]
> This isn't a bug introduced by this patch, but since the patch focuses on
> adding missing OF module annotations, should it also add one for the seco=
nd
> match table in this same file?

Ah, this is snaky, there are two drivers in that file and thus two
of_device_id arrays. My script only handles the first, so the style fixes
are missing here, too.

I will wait a bit for further review and then address this in a v2.

Best regards
Uwe

--db73lwnkw6hdook6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpV7rwACgkQj4D7WH0S
/k4XaAgAr47ojbzXcjqsjF1FttUvP817tdDTOildKlkxSlYP4gIjsiIubgQYdwg7
MpSLhXX5sDIJmMklwzM5pALU2Ct5LQu6t/1MjKG6XHftyRj2LwgKbU2FbG2NNn+G
JAQs0CdGH4mfmhux9mvhe39b0V4h5S3bpRe1lA2Iv9ex/dGL4bNEto3cM7QD31Ap
FCw8wFkpbaZbBBppVbdK7o5utKerY5rA2f7Ns2vVPkLNhMx9ps61j4d8FB2BKaoJ
0rPe6NVzC81WjsrwZUhpwUHucCbjsqHGxQrl7j3TaX77dy5pOXi9WxhTGNodm5JR
z0Im+LrSjd/VfmFscgr6z0IU+KWrhA==
=3L74
-----END PGP SIGNATURE-----

--db73lwnkw6hdook6--
