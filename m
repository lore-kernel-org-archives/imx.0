Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A91F3E3142
	for <imx@lists.linux.dev>; Fri, 26 Jun 2026 13:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782482305; cv=none; b=pB9OPvG+IPXwQdUtO3ONqs3K7IRAimOsq46y5iD2hcXKzOTGfdB2ilO/NZOfi31iuoy/vYKXYS3KGRo3Goj9XtvWx0AerNd7hctFe5qOpasiTY/WiJJtf867zKyWdiSBL7Vza4FGIc23zeI8NU5UyvAJTyCLhSkXgGxtLNPhaXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782482305; c=relaxed/simple;
	bh=/WCcy2mMxh3czGC0dprku4jfYTdMIC0iKhzoyaVwlFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YPay8smcb8f6ffsdm7Eak1Sie0mIe92K2M0AeFQL+qtrGHXmCF8Q5JaE7FfAZ5T7SR0S/WXVQqxNufrtHeMcD1SKF8jy6h80iY9q+G9Q1/8YowhLnhrI//J1WZIxTnzFUM8p6rnZz6rxKku9a1y7dJMuM7p4knw07jL1oSIQ4QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ouNDgKLp; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ouNDgKLp"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49263703c6eso9304505e9.0
        for <imx@lists.linux.dev>; Fri, 26 Jun 2026 06:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782482301; x=1783087101; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YYBimURlHUn+mpSz1R9LJBKjen+CWJXOrvIJURfJyEU=;
        b=ouNDgKLpy7UHi97aRjBZZOlneh+n9yhfSjgthcYCcxXyXbYcbWFPPuO8noUmZJiIEj
         T6j2Omju97l5BHFxxQQldiQ9f8W97N8aiIAr2c2FIXuVAIQAv0fUBeyZsp+slmtkdLXj
         a7KXMbSC+2TIGG3LiajN39N3ipA3tzgrVuRQiCY+A+WniPRFySvawDaoVVTmJ2kQhraq
         VnqKCm/fOomd8KYRaKcIYvVQ2u6pp2Zh0V+qJNcJ8ZAn++J8SRpjl7velmc74hg7gRBe
         89hNjDxRxDcYinAx830TTkge8SSmCNm7q7EYoj623M/f1WA3Ok/EugDq2qqj73K+wHBk
         74kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782482301; x=1783087101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYBimURlHUn+mpSz1R9LJBKjen+CWJXOrvIJURfJyEU=;
        b=UWFcOJHHTCHDA9f+J8SNynsrYZtYFjxVenEXREKkN6ZCzOSFjG0UA2+5vSLAIehpxx
         75g7QbN4PTMJx3LkFVU5kscqNXaSgfy8oiUmrz+7hXujEv+ZhjWeo8Q/KzpxzlwxlaAd
         onMHLnQmm8menIsNEiP+GIT8PMyEei1NZRUU/Md19HI2ieb/QjMFcrc796rVfxypYtML
         LFRJPHsj5ULFji3BL+efI5duZrgF11mnPchnXtS9IZeXaPyRvqayDUMakExgowmUALss
         zDHasMngJp+qOnje+SCzEpdK8HMa6bzi8Tf/nq7b4ixawCDWopcDo3F8iTYPeIknKzzT
         590Q==
X-Forwarded-Encrypted: i=1; AFNElJ/gKZ4BhYV3xBsq/Hz5YC8AiF5zSwgGNJrw81LjFZcwsalTR84VtTGbTBf7xtlHuTH1KyQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnjDpu2gvZgSifrT+ildkJ1sBaThScOAmzH9YA4ywgj6OV3Zgj
	cBAZDE8eqtpOJ9Tk1MbhFG6KE29V9Ulb+Ey/sFINPgNHGeIwgEhoieY8CzlCW+/WwtoPATlxvmj
	k5Kb8
X-Gm-Gg: AfdE7ck4ifixYJQkdR9eSHDsL24oCyehzj10/RRXVnC3wYeMEY+94rBcMqlCb4IC8/H
	9t2/63150eQ9Csmpo0Ob5KCQvAmfYS1pkl4Y0IvS9jawTfVR66b2v6AiDb/20kSaxhpB7rctN9h
	5ZOjZQJbtbbX//F050UrDAqxcCv6LPoewM3Q5Dt02oqZilqLRGXrmx85dcruOklFrERnQnYvZCo
	3oyAGKHTI+38AUKclkrSzOKSDItG+yOL0nuPL628fDLisPnL9mZLb5uZ2oApaSg5uiV7UXkkdu2
	NtMFuVHr5b0GsxFtQV306tYvsLuOJDNLOARb5Xm712KIsEn1ETkVkSmGDvACnOg7n3o+89++mE+
	DEli44JD/pCYCC+Z56ZObPjRMua0PrC+DPz+Y/qsraUdydHhmxStSyWbnuRB1BFFLAaJ9DKJTfE
	y7pqZsgLOx6BAYd7WtU0ZjZ9T+6jB9I1eLHOPnT/yUBrN1u6zojIEiBljQ87ay7cocM70HEHr9S
	N5i
X-Received: by 2002:a05:600c:a403:b0:490:d9d0:51c8 with SMTP id 5b1f17b1804b1-4926689207cmr87782145e9.18.1782482301348;
        Fri, 26 Jun 2026 06:58:21 -0700 (PDT)
Received: from localhost (p200300f65f47db04b3606a871f5f1c38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b360:6a87:1f5f:1c38])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4926c27fcdfsm53888345e9.1.2026.06.26.06.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 06:58:20 -0700 (PDT)
Date: Fri, 26 Jun 2026 15:58:19 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v1 4/6] power: Use named initializers for
 platform_device_id arrays
Message-ID: <aj6EzGn2Ds2offEc@monoceros>
References: <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
 <20260529110229.9474D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xs4ntcqafh3l4ivh"
Content-Disposition: inline
In-Reply-To: <20260529110229.9474D1F00893@smtp.kernel.org>


--xs4ntcqafh3l4ivh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 4/6] power: Use named initializers for
 platform_device_id arrays
MIME-Version: 1.0

On Fri, May 29, 2026 at 11:02:29AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The explicit `.driver_data` initialization `TYPE_MAX8998` for `ma=
x8998-battery` was silently dropped without mention in the commit message.
> --
>=20
> commit 02f2c38ebeef8dff34934050c70916818fb36a18
> Author: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@baylibre.co=
m>
>=20
> power: Use named initializers for platform_device_id arrays
>=20
> This commit updates various power supply and reset drivers to use named
> initializers for platform_device_id arrays. It also unifies spacing and
> comma usage across these array definitions.
>=20
> > diff --git a/drivers/power/supply/max8998_charger.c b/drivers/power/sup=
ply/max8998_charger.c
> > index 418b882b163d1..b0eda2b51e7f0 100644
> > --- a/drivers/power/supply/max8998_charger.c
> > +++ b/drivers/power/supply/max8998_charger.c
> > @@ -188,7 +188,7 @@ static int max8998_battery_probe(struct platform_de=
vice *pdev)
> >  }
> > =20
> >  static const struct platform_device_id max8998_battery_id[] =3D {
> > -	{ "max8998-battery", TYPE_MAX8998 },
> > +	{ .name =3D "max8998-battery" },
>=20
> [Severity: Low]
> Is it intentional that the TYPE_MAX8998 driver data assignment was dropped
> here?

Yes, it was intentional, but that change doesn't fit to the commit log.

The driver doesn't use the value in .driver_data, so the change is fine
in principle. Given that the patch was already applied, I think it's
fine to keep it as is, but of course I'm open to respin with that detail
fixed.

Best regards
Uwe

--xs4ntcqafh3l4ivh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmo+hXgACgkQj4D7WH0S
/k6jhgf/Q3MgW/5Ove9zmOEESBkVHo1SCbxx6nWy8QX8dmvjpdl+RdVZU5xFML+1
Brut08xdhimi9SlqRNUJgr/fx8JPw6xoioNua4dp4WMHUq5gSF01/q9hcb9E9DT2
6Et1r2jIIBmiP1n8xUBMzNZBPJo6xxLCrrNazcv0k/SikarAYN13Q5qzy7Ne1hs/
k3YDPctRG3L0b3EsKT6EBjEIYRb8k/6VZ7DXkHwDNr8Esd3a7RaJtA9Q2asuul9n
Nb82sJaM+4En2s7JaYc1rFIKuMOcXGg+EEY3PDbj+pPjDAcsKP/TCxaEMgZqNUg6
eRpQR74nP96QqaCP/pQln5tD+KKgZA==
=OSso
-----END PGP SIGNATURE-----

--xs4ntcqafh3l4ivh--
