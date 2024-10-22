Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE37146A9F
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 06:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729580026; cv=none; b=iu+mwVaxAEcDcfMCpIPB5OKbEbwbvrmImeCdX8zPGrPikp7S+Yc8FffmdQKl1qbkdLSb7Vaysa0r+hNxDZ7DdIYajBf/F7G7/HrMoKDRBCi+B4rOTxNbm28urPgF8KIh2dJJ0p4QEX/o0V1Ay34WZO01d1cFvJSBkoxqHVuC9iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729580026; c=relaxed/simple;
	bh=5uEPeXTznO+zq/VrowXIv/nZTT75BAURDha2R40cA8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AtCysS5D5q7CgWGxAP258T8kNvqJU3Y1GMZPukXtpgrBHwI8wgWdmnMsOclbOD3aceAtihRjNDJz7a5PvjRpku+aFAEkvYSDbTufdOaXsiMwynh4lDut22Fh5+IJ6Rbncu9M2xsW9fQMOpw6IP2lWCmpQPdeX5r5g1wDXp1pVNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CAVanvv0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CAVanvv0"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso44375225e9.1
        for <imx@lists.linux.dev>; Mon, 21 Oct 2024 23:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729580022; x=1730184822; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1gGKS5/KjNKqMu0CnZ1nG3vuEUT3rVS9BxXtvnX9ivk=;
        b=CAVanvv0VB2S9jDwFJXFzFTxg2HJhFkfSAU/K0Fd+6/L3qxY0YPgyfWUWaa8JpKXYT
         Y8d4THWLSje3cVkMYM9I/2VzJV05REHl+0HKO4dVZ9jzet3jkR+/d1hB96LZWBFl+lHs
         qVfeAh8GkpsSkesTs6tNx6agwUaYktfxbq5vUpRHVyUIJHRUm6NxWLWCDWZWuMcnrdt7
         JM8eD2RsfuZGoS5tZSd7BiO45fKuRpNLxCDQoy4kpxldj7DnvB4X+rYj5Gca7kO+leDB
         p90B7cq9ezfCkWf6ORSP2GLRugwwyxNc/TS1uMzt3j/k6DIJoQAyMjLeMBJlcO+yhete
         CYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729580022; x=1730184822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gGKS5/KjNKqMu0CnZ1nG3vuEUT3rVS9BxXtvnX9ivk=;
        b=WmliDNj200rjycaAmAjjjOTBfHR6qnBiW2bOGf6OEKhfVan6Y7kP9wagqwBFfpIhE1
         qo3eKhNKnVatoiDjV7/iy5pjwtkUNAXcjLKvAByeCMR9Kr9b3ISEjhB/mucSBSDQQLjZ
         CzW0NdEURz0ZbT/UTB+cj1ygqc5HfnmXDtZ5k+Cx9zqdKXNqpGPP75mY1oEwdiL2mfgj
         wVkSign703k6cd5461hJOnxMrEr/+DDVO3Wnup6PsjyROsTQfnfoLS4y2SuiMyyrz7yq
         jOtyy0Vl4mV+NUibPL1n/lqVCalQslXWGPmX08i0xDJN3YggdRsjG12DPy9Zy/EswwOB
         UHJA==
X-Forwarded-Encrypted: i=1; AJvYcCU45iJ+a9RLqGlANV+DmmtL1xoCi06F052/jfcqZqxRYPn6ZXuycl2I3KkDyrKloIHbKc4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIRD0A8HW/TmyyaLzsTVPza28OiX+F0b/2OX53mwMbla6X3JdX
	y+bMHhyvSWMedXySur6Nvaa55lnSD7kdhVnMfFg/dbVNoWDrOP6ocuhLv5a4f2Y=
X-Google-Smtp-Source: AGHT+IFyICfACBpi7T/crxG0x8ivlGRMR53KD4SiK/OFtztf44if/Rm8vT9be/4sTTsfE2WW+prIog==
X-Received: by 2002:a05:600c:6012:b0:431:5ba2:2450 with SMTP id 5b1f17b1804b1-4316169391dmr102908315e9.33.1729580022314;
        Mon, 21 Oct 2024 23:53:42 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f58ae0asm78563945e9.23.2024.10.21.23.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 23:53:41 -0700 (PDT)
Date: Tue, 22 Oct 2024 08:53:40 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, pratikmanvar09@gmail.com, francesco@dolcini.it
Subject: Re: [PATCH v3 2/3] pwm: imx27: Use clk_bulk_*() API to simplify
 clock handling
Message-ID: <7kplk52i7e2nha5ym4loza5oc3lwghifjfk3aut24w3hjagfk3@zusb2naeaevw>
References: <20240910-pwm-v3-0-fbb047896618@nxp.com>
 <20240910-pwm-v3-2-fbb047896618@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v4u73livoku4nk7u"
Content-Disposition: inline
In-Reply-To: <20240910-pwm-v3-2-fbb047896618@nxp.com>


--v4u73livoku4nk7u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/3] pwm: imx27: Use clk_bulk_*() API to simplify
 clock handling
MIME-Version: 1.0

Hello,

On Tue, Sep 10, 2024 at 03:07:19PM -0400, Frank Li wrote:
> @@ -229,7 +209,7 @@ static int pwm_imx27_apply(struct pwm_chip *chip, str=
uct pwm_device *pwm,
>  	int ret;
>  	u32 cr;
> =20
> -	clkrate =3D clk_get_rate(imx->clk_per);
> +	clkrate =3D clk_get_rate(imx->clks[PWM_IMX27_PER].clk);
>  	c =3D clkrate * state->period;

Unrelated to this patch: clk_get_rate() should only be called on enabled
clocks. Given that further down in that function (see next hunk)
pwm_imx27_clk_prepare_enable() (or clk_bulk_prepare_enable()
respectively) is called, that clk might be off?!

>  	do_div(c, NSEC_PER_SEC);
> @@ -259,7 +239,7 @@ static int pwm_imx27_apply(struct pwm_chip *chip, str=
uct pwm_device *pwm,
>  	if (pwm->state.enabled) {
>  		pwm_imx27_wait_fifo_slot(chip, pwm);
>  	} else {
> -		ret =3D pwm_imx27_clk_prepare_enable(imx);
> +		ret =3D clk_bulk_prepare_enable(imx->clks_cnt, imx->clks);
>  		if (ret)
>  			return ret;
> =20

I applied just this patch to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E The others are still under discussion, right?

I see you signed your patch (which is fine!), but I couldn't find your
key, neither on hkps://keys.openpgp.org/ nor on
hkps://keyserver.ubuntu.com nor in the kernel keyring. At least the
first two should be easy to fix.

Best regards
Uwe

--v4u73livoku4nk7u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcXS/EACgkQj4D7WH0S
/k5sBggAqO4ZT0/OYhnXz4EtDfNYkq7vy4oX9E/FFWF7QqEm7Q6PfyrY6lOanGOX
imauNxmocF70rk2IX9aPaAmzQiou3jGgb+9JfG6ZubDfSzlm9FSqPxHramxmY2up
HnSCux8OpU/OZ8PfdGwDrv6NP4lDwRBBT0JUS4p/ojwCr0gW+kgEpI8oL88jI598
eBiweBQlFM7rOFMsIuVsyhr9yz5GPwxcsDoLdQ6Fi95zA/ZqdRlLT7b26VZhiMFt
x1bnfHOK08RaZX+uFDttyYB1wkW2gzopZrHhG8i7hNVz7QdWdxm8DPW8gHtg8Xmo
uwjcm7qBXbwwl2Vq3Rk0K2ZMme9zKw==
=bPF5
-----END PGP SIGNATURE-----

--v4u73livoku4nk7u--
