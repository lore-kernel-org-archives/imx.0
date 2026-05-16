Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811CB31717C
	for <imx@lists.linux.dev>; Sat, 16 May 2026 06:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778911932; cv=none; b=EK1TFlIMFzxpm3m/AeFOVMQSYbZsmy8GIILB3s1+V1+eQiL/W3T+KngDmZZ2QpJzKNxAZI7/hpa9M8K+/3LPDeHSeVRFZWqAIOemaWmsYjytwdEeVW1QcDVRztQxdZw+JOYzw1gWlTXmHUZT7HpVOrr/HFDSfqy+s1MkKXFYqhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778911932; c=relaxed/simple;
	bh=4yYhdbMRVR+CRAUgoSq49OIwIUWB/tSKLi036gr3kHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YDqw+MjTWm5KrcK5TBfM/+i6ImldrdkBdpBx7+Sh6FhQiy5FrLAYRItlwP9JkAdp74ym8Seb+Qx8f93PG4LSkUa9El+L29edWIXySDt4G1UJ/bhAiuzjQnsBdtfkELJ6hE0n5ojh+KRKqfktclsWFWt+h0CXG1vSZVP5+GwfV0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=KXsuCoeE; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="KXsuCoeE"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-449de065cb3so399948f8f.2
        for <imx@lists.linux.dev>; Fri, 15 May 2026 23:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778911929; x=1779516729; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0HSemYvAyg7oF7KkWKvgahNXBgqxEPfiGmMTx54Opx8=;
        b=KXsuCoeE1JCQn4Bz4DSjRrq+8H8kLWcpBisS73OqWKPuvqU+PSXwVELXyea28QqteO
         1WQLeyj/i4CVmmz+HQmsX9QvOwXcdhETBy+go3iNQ6vNQmEt8eplv6V8QlCJQXVBabbX
         IYdby/JvgLifnx6SffNFzkhbpdhbXXdSgO6dw01vzgVJfDig7JvxB40NsHXGw5CMEMGS
         Xx/a+/8uNLXV6OWy9jkah56mV5tq4XvcSaaHnCjKfl6IADG+kkPc/qOASg431II62Nve
         MkkTvueqYssZsi70hA1ZNFhh6grXNqhqHFgmGipS8ftCkMXS+rNCwczMaupyP+RBXm8Q
         eiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778911929; x=1779516729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HSemYvAyg7oF7KkWKvgahNXBgqxEPfiGmMTx54Opx8=;
        b=sjMlzxf5R1CKwxkZ4cuSJ7qw9UtwvOlkBEcHW/99P4JX5OBnnPEjcGDl64bP3K4Gqz
         ioBA4DsHJmXuBwnva09kscXV2JuylgjzWRalupihZwi1JMdUHlYaNhyMsZ1eoYeHxt7l
         +TI+7DFFksBx2/8Z7TTbHRfi1triDigLY7Mag1UzG2geofR9Vp9WsVFoZzqRtWdKOyU7
         4+DHg3QwMTlVVrnfIcFZXFNvt7/vm+wLPTwHDI+FwDNsrsh3tncwwEgrZcMupn6tWLG7
         YHwwUlLZyMqhYYi/5ty3r0o128wjs7CXTddDp8DVQrqPaeEKTx7Kfco0AefYq/vyDCFu
         RPtg==
X-Forwarded-Encrypted: i=1; AFNElJ+xfqchqoctWuwLk1AyEhpl1SaNR2lX9prBHw/+zl2z4yevoIQjy4qp6MjPnXq+P3WNfX8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdccVW1XAaPEeSjSfjChurd7aZgiIouTldOkuXi3+1H6nFbZx5
	F7Yh3xe+NYarXKuuKkqxla+SWDUzPK5CG/Aufwow/5UWF3fx7eLG2c+KPl/wyNctbKs=
X-Gm-Gg: Acq92OHd09LtGVRwie1GiDPai3N/KC0+U8QQNl06RALnt1bCjcIQ71s36eKRZkjkKl+
	aDJDC0S5/N7gCUCDd7aQjGBawE/wOpN8ElbqBYfGpXlPne+1ONoR2zN+6JlK93yUXzT7HhKi3wB
	C1mWoQQ/X7AaPW2ckqWuMfNd9/2aN6fvRmhP6uch3XjlOR8Tq045orAyGMVSd7XAX+XCALeqxmf
	bbRHtsRuWREot9w2R4btvdBzhtCHF9PVV5DCZJhEyed4tTqlfs2Lth3Thg5tj3F3UP52piRR1vQ
	RbBSuHwg/8B/BoR+R/NGIqs9tRnF5S3z8MrqplNYYj00mXBaCUTaFD1QrnCGarunj+3alYCOPXl
	juCW9uNCOVATwIvUuD9b+eCRK8wZxYdGpIGPyzgjXEEzRehKAJJQh2mkAP9lFE6UKma7QYStjlo
	8fHfIzS670rVHuVn+4qTUH/X9yGPrGbGMEXuCiLUo=
X-Received: by 2002:a05:6000:1ac7:b0:43f:e272:edff with SMTP id ffacd0b85a97d-45e5c57d308mr9641215f8f.4.1778911928801;
        Fri, 15 May 2026 23:12:08 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45d9ed2f738sm19944411f8f.16.2026.05.15.23.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 23:12:08 -0700 (PDT)
Date: Sat, 16 May 2026 08:12:06 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@gmail.com>, James Ogletree <jogletre@opensource.cirrus.com>, 
	Fred Treven <fred.treven@cirrus.com>, Ben Bright <ben.bright@cirrus.com>, 
	Support Opensource <support.opensource@diasemi.com>, Andy Shevchenko <andy@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Samuel Kayode <samkay014@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-omap@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] mfd: Use named initializers for arrays of
 i2c_device_data
Message-ID: <aggJiZk8Kp-309q7@monoceros>
References: <20260515095839.4005460-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2sdvcea3fsfmjq6y"
Content-Disposition: inline
In-Reply-To: <20260515095839.4005460-2-u.kleine-koenig@baylibre.com>


--2sdvcea3fsfmjq6y
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] mfd: Use named initializers for arrays of
 i2c_device_data
MIME-Version: 1.0

On Fri, May 15, 2026 at 11:58:39AM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
> index 6a7b7a697fb7..fb23d5ed1f26 100644
> --- a/drivers/mfd/tps65910.c
> +++ b/drivers/mfd/tps65910.c
> @@ -518,8 +518,8 @@ static int tps65910_i2c_probe(struct i2c_client *i2c)
>  }
> =20
>  static const struct i2c_device_id tps65910_i2c_id[] =3D {
> -       { "tps65910", TPS65910 },
> -       { "tps65911", TPS65911 },
> +       { .name =3D "tps65910", .driver_data =3D TPS65910 },
> +       { .name =3D "tps65911", .driver_data =3D TPS65911 },
>         { }
>  };
> =20

The indention in this hunk uses spaces instead of tabs (both with and
without my patch). I fixed that in my tree, so if it comes to a v2 the
indention will be fixed there.

> [...]
> diff --git a/drivers/mfd/wm8400-core.c b/drivers/mfd/wm8400-core.c
> index 8ecfe878a5ba..1c0ba450ef9b 100644
> --- a/drivers/mfd/wm8400-core.c
> +++ b/drivers/mfd/wm8400-core.c
> @@ -135,7 +135,7 @@ static int wm8400_i2c_probe(struct i2c_client *i2c)
>  }
> =20
>  static const struct i2c_device_id wm8400_i2c_id[] =3D {
> -       { "wm8400" },
> +       { .name =3D "wm8400" },
>         { }
>  };
> =20

ditto.

Best regards
Uwe

--2sdvcea3fsfmjq6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoICrIACgkQj4D7WH0S
/k7niwf+L8OYV1m8gjYa2gWHbcQnsCJgzdFKCpbXliu2T5EWq+pQK9qpV9Z1VizU
c2aUOPFJ5EiekEJu5DCu2EP0hYSk7XVsIzj1X6S2yAUDcUn5KFqmgkRAQsZKxRUN
To4/9O43tr+/WYuyUT/kM1mZFYHw3kubucsATq5rprulQ8SwNsFWG1hADna3KAHe
VE+iBDWGgcWuextWGVmh9DL+KyuYXcHSYZ6jwMkUkzdTGE6XIJeZ4AgCXM5X6wl/
9G5OpBfgo0IXSCrfxQRCx2Rq617B5x7i9u3851/XC/G8l04/lZOsk8vW92H4tVvR
IqdTaRQtvMJ/Itv6B4DadpEPZbkW2g==
=AyjU
-----END PGP SIGNATURE-----

--2sdvcea3fsfmjq6y--
