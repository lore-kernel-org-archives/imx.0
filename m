Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6CF13B59B
	for <imx@lists.linux.dev>; Fri,  5 Jul 2024 08:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720168629; cv=none; b=D+zPssKMHiVHCJL/FwzcWRw2wYUUBr4XKlHlTWQGK3XgQu6U3hxkb9EUKzsbCQQcIf8MZHdSda/DttmFEWqWCG2gY5akujoBU79gZ5+593qJfDKB4Cywbf8Jbo/i5J7FIUcLNINcJs58IawabWEEV0rBPYojYChBaNO3Do7Gzf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720168629; c=relaxed/simple;
	bh=N8rCHa1I4sgFtzb1vM3z2YWBnAsUvprjZ+nJxT2CuHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rGlsluWbfLiacfuCcGQwwjqKRODwZHNeEe0DWyLnTOM2v71iCjjqfNSnZvS4HTtZHwNQxVw4K2ye/H52EgEVXd2lB79/i1X3yo6Cl+5tCK97fXvuiZ5/c3Jl+3EL08/NbeAHQYLbMoemKVLoQzlslolWrI9KRppLizmMVd7r/gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TAF+i/Tc; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TAF+i/Tc"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6fd513f18bso149316066b.3
        for <imx@lists.linux.dev>; Fri, 05 Jul 2024 01:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720168625; x=1720773425; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N8rCHa1I4sgFtzb1vM3z2YWBnAsUvprjZ+nJxT2CuHU=;
        b=TAF+i/Tc6iQbXAADXebtLxGMVf9+l968Tj2dKkyqD6RtXvst3DLz3Su7cxVYArSad4
         pIjCNkpKiphyu2fnzBbcK59R9p6HRm/nk4KA21jb82VtnLQizqmjjPDOVgAh8VKGIaGG
         2wZdYd0TqfFVNiaMHKHw2KJkbiyUSl3UxzcBWSXyGx2554bseCqejfGIVevakvCmMpnJ
         lPnzacygKS0nmMgp9R/WQaEudXT2yqNCwQk/9FWjf0LDza2RZDUPPGDersByXVVVRGvH
         cp0B07eoghg0KUFvzRlcmag7/fSv1bN9tSqhv9WXgYwX+0s0/6WydKZBiOT1gmUdXES2
         MoXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720168625; x=1720773425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8rCHa1I4sgFtzb1vM3z2YWBnAsUvprjZ+nJxT2CuHU=;
        b=q4dRqRlvC8nsNOgfrFh91Qju53iPP8PKUQij1Q2hC/tCUbOb1N11rqxDpcEhu++2Q0
         0EoSRYQvd10noG+79mZwy6KprYPuIzpNnzibzAkJcXAjBgOPviYmAOyiwCTHphkscK7N
         VZuRmdlPdjyXMTnn3XyVcGNnWZhPIHM5QmQw4l96CCsAWITFmrAVWEea6pkZHcM8D/iY
         hopBBW3573audwENwZcpsDbZ6d7/8DcuMO78joRB1yXDzG2VO74d+nUK+Davhp5456IX
         GJLhfZFFWYS6UwPS71ywcw6BwXQzmWqFpH2bILC1bTw5ZatKRuENW/vvjphJWYM4LzAS
         oOKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPcGuMSHHIsjJMxpH1BCRns70iOXOKKZoMBsvyyRuC8Q8tqpoNKpXTD1ayZxDeBBY09Co2ZSkZG0sgjNa1rML7wltC
X-Gm-Message-State: AOJu0YzsNxeGhzdY9W9DDSFgV/cC2ghHBMlGKU7U3YP9p1BVf3kX8NSm
	rzzMJUe9xVE0Fe4csIw3hzGq8ZKH73eiGocsrruwMOZpSbgWtJJ77jF3x296AFs=
X-Google-Smtp-Source: AGHT+IFXFoWhebyQr0YuYTGjy3MLP45R+JoDvwfT0VEQ9Xipcm+cS/RYvVODpxwLxGtYhBStzQssyQ==
X-Received: by 2002:a17:907:3f8e:b0:a72:4d91:6223 with SMTP id a640c23a62f3a-a77ba712396mr273313666b.62.1720168625352;
        Fri, 05 Jul 2024 01:37:05 -0700 (PDT)
Received: from localhost (p50915e7b.dip0.t-ipconnect.de. [80.145.94.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aafba04asm661823066b.97.2024.07.05.01.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 01:37:04 -0700 (PDT)
Date: Fri, 5 Jul 2024 10:37:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-pwm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Subject: Re: [PATCH v2] pwm: imx-tpm: Enable pinctrl setting for sleep state
Message-ID: <uai2zamrzwoqqs5hdhszokti7jldta3jxeurronrsxxqbkd4rj@vl63xy5gmm7i>
References: <20240702164514.11007-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lzkne5ihs23cswnk"
Content-Disposition: inline
In-Reply-To: <20240702164514.11007-1-shenwei.wang@nxp.com>


--lzkne5ihs23cswnk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Jul 02, 2024 at 11:45:14AM -0500, Shenwei Wang wrote:
> Apply the pinctrl setting of sleep state when system enters
> suspend state.
> Restore to the default pinctrl setting when system resumes.
>=20
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---

I applied this patch to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E

Thanks for your contribution
Uwe

--lzkne5ihs23cswnk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmaHsK0ACgkQj4D7WH0S
/k6kpQf/Sil4hCVBSHGfXe4/yB7Y2iSISkBFv+Wb/GBq+HHHjM6cx6tA3O9I5X5Y
G/PvSSt07CGpzjzGGpRK06hDVuqxQoYj3A1iqtTSEjuqW3ui+QqDG1RZ7ScE05GR
VpAslfs8cb+AivFgy2IIlsEgFKkR7qYfFwFFKyMeKIqUh8JQlynD2G0pFpNxKv3z
pey5Z2lgttmUhnzIBfityangmUl5Csqzh3MtfOMRsUk35ypyNvQK5Egjmi2QXBdo
g1tZWkCv6S8z0eFpFO5yC30+WQi/Fi88fpcu/TUBAmAqGnpMPE545E3YNIJ1018F
UiiDyQHhYQ8jfkKJF9naDJMAFeCSwg==
=pREe
-----END PGP SIGNATURE-----

--lzkne5ihs23cswnk--
