Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76F11514DA
	for <imx@lists.linux.dev>; Tue, 10 Sep 2024 07:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725954816; cv=none; b=cCEJIaMTDTAZAFNWUkO7GoMh+mdgh9O4U5t8ZE+YU1gtDwKxxJczP6bnu14BYZIRnW6Bn6Bma8AkINI7FSDMXAQZtjdi4ICs6FGdVcRwfb2p8eT1tlxkAfmREXUsC3JkwCjzzt1y4I7CbdvLXptx5BDHRDm62pYI+tmYoxCDXZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725954816; c=relaxed/simple;
	bh=3kOckCJ3zJfAps2h/AwmdsA7upGrvE/ZTS/+vHfJdls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtRHyH/ZYmN4cUmHG9uHsT2M3wm21DU2KEuzRHhr1AuJdSlTkLTximKeQUmV7elHNSBaVUw1fZA+MQoUF1DQJWfxCk3GXmQhScn6iRKnuV8nuQjU/YvwuMx4W1Yv/GzMcnDRCI4mVWKmXB1Qquxa0K76avqFH7lmrmqUFI2HKP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hOSvvkPY; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hOSvvkPY"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-374ca65cafdso3252528f8f.2
        for <imx@lists.linux.dev>; Tue, 10 Sep 2024 00:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725954813; x=1726559613; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=shoX2ARTnjAfwts3W5+XviwrSe8VQj1wXkGxD3NKmZs=;
        b=hOSvvkPYKh/EuliLNVBAn6hAST3uYlVX0d9SkONfCvqFPZyW4uqpXgkTPXhk2MAVs+
         4KNI7IFSpw4JbudVYFLrPzPujqIMIbemZ3+geAmyz6JE/VYQhR+kyQbvsREhMJO8dXNC
         7gfBCFmakD4mMEtOjcNCj5QKw4J0d7ocPnXSV/SFOdR5JOxn+mbJDYTeuv0LPhZpXEvk
         YRbrfzn4+Cxhy7PrUqJP8Jij1jqRB3w2RqcUIDOSvJbHVhWMZnspaIiPUk/6s3lTSsY2
         x7ErRp2mojDpUY36zgENgOOvwaoic9R/piLIWdZG1xmJeA0X9fG6js/M7Ek9n3kruJxu
         wfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725954813; x=1726559613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shoX2ARTnjAfwts3W5+XviwrSe8VQj1wXkGxD3NKmZs=;
        b=l6MYn5ckzsNBGw+iqzr6SGc6khISBiwckA8fNjhx0pX9+rYiIvWgxXMEoggoRfH4ua
         Py1zzjkxC/YjVrQzxl/hlIJMbJPZTB4OCBLV8Eae96bnc6Ued4dKWZQSbMeENIa8W+ry
         cYIJ7zn37dq/aUtEFmzIiQ1poxQAvmJdEn875XXzHGzZMRIxEzp7w3kbcbG7emf1NKMb
         GcxkxvracO6b4rAHNYJwx8lcXcdujq4Oz2h66osjJQzFR9M1TUy671zqz1Mxu5DG0S+c
         toGIL1q/AfHefORW3lRVGxH53clpdP87osFapriATcdEpIHKb2GOv4pO3G3+h3pLlrAG
         9J8g==
X-Forwarded-Encrypted: i=1; AJvYcCUIj8LYCPI71sVtB8jxJMztznGpNxcEzekJhXf+t9FKNu2veDyKngmvbRpNxGx/gZVZWl4=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo9JSmcC88qnBNcuxn3OqpiVl2kwdwLPRfPqGV4dAS5PFKdAXG
	Cv5IUPVuiTVmCr/y7cIVmQkseuVCZLbzD2+tvh1CS2Xridpf99Fb+KH2VLoR7N8=
X-Google-Smtp-Source: AGHT+IENMdK/5AhA0KPXv0+AeOKMK0xU54Nn7FZkq6MEXkPuzfuPWq4a9kCnG4gHdakaS6NMNLo7Ng==
X-Received: by 2002:a05:6000:cc:b0:374:c269:df79 with SMTP id ffacd0b85a97d-378949f7e28mr5958326f8f.22.1725954812902;
        Tue, 10 Sep 2024 00:53:32 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3789566550asm8072849f8f.35.2024.09.10.00.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 00:53:32 -0700 (PDT)
Date: Tue, 10 Sep 2024 09:53:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Marek Vasut <marex@denx.de>
Cc: Frank Li <Frank.Li@nxp.com>, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, festevam@gmail.com, francesco@dolcini.it, imx@lists.linux.dev, 
	jun.li@nxp.com, kernel@pengutronix.de, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	p.zabel@pengutronix.de, pratikmanvar09@gmail.com, robh@kernel.org, 
	s.hauer@pengutronix.de, shawnguo@kernel.org, xiaoning.wang@nxp.com
Subject: Re: [PATCH v4 1/1] pwm: imx27: workaround of the pwm output bug when
 decrease the duty cycle
Message-ID: <clldpp6n5qsbrfjwpkz6cwidmvf6ujezlg3qim5dtiahte4dch@2ccocj2y3lql>
References: <20240909193855.2394830-1-Frank.Li@nxp.com>
 <cceb5ece-3aba-45d1-a5e3-3419245f345b@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rpeo6evaheq2e44v"
Content-Disposition: inline
In-Reply-To: <cceb5ece-3aba-45d1-a5e3-3419245f345b@denx.de>


--rpeo6evaheq2e44v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2024 at 10:19:59PM +0200, Marek Vasut wrote:
> On 9/9/24 9:38 PM, Frank Li wrote:
>=20
> [...]
>=20
> > +	 * Use __raw_writel() to minimize the interval between two writes to
> > +	 * the SAR register to increase the fastest pwm frequency supported.
> > +	 *
> > +	 * When the PWM period is longer than 2us(or <500KHz), this workaround
> > +	 * can solve this problem. No software workaround is available If PMW
>=20
> PWM , typo

Also s/If/if/

Best regards
Uwe

--rpeo6evaheq2e44v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbf+vgACgkQj4D7WH0S
/k48Mgf/ej11u9TqWoVQMnxHQnd+sK3E4TxjbvJ49leMpYo65cIequfyssgC5AU2
q8HPIPPGlohEk5qoTrFcCaTERiJMycBwkC+UZZ8cZFSXY1UCKLkTq6gmJLo0S73g
0aiNCTbJEYi+ERu3cX4RdOD3c7pjMuKRLuGcqZxqAgs1omiZIty4SkNzyrDKzYIO
pV+jP644liIs2kiwTZoYv5IpOVYUH2gtyt/GrthBdeHUpRCw6F6zh38Ercx8isj5
eXhYt/8lGVMuvI2HKpqt6iaFdQUh/smjBsv61PfuRMUr/yrSGtnc0VRE4WQhyZse
DwxLj2CPzFp91Ns2HHmEZDKYA5nldw==
=lYwG
-----END PGP SIGNATURE-----

--rpeo6evaheq2e44v--
