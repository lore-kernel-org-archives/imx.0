Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5803F3AE1A9
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 21:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782769185; cv=none; b=BjsAF0pXsjHrVSBGN0ecjjbvZU2HJlj1db7CIHE7k5tNOlLtNZUXzLtcv37d+hD7MLVR2YEznD2E4I9LRxIiVWPemwghVaYCSu5RzMQzXw9FV0684rWxlXuYXDcX7zJpK78b28ItlYmQueqjrvEPkngzesGolIj33maHRCEMIws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782769185; c=relaxed/simple;
	bh=CzRyrS92zt83M2sYdEICZ35wOjTejnYKo5xP1UvTJBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DWYjZY0YMoV8lqxa9t2YSXvOGGLwUWIvw65CodRbIckkrNIfIHSwkzXK+x9NOeKQX2BytqSPZ2x4DjULHdAxenEZRsITrsa2pJ+4AblnqMzWiiGseveKF2jGcaQyV1wAWYn/akrixnPAOF0nnwtLnVwkNMPgYUbuHzOGLRgaD3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=aqLGmFWO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="aqLGmFWO"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b6f1b14bso3407895e9.0
        for <imx@lists.linux.dev>; Mon, 29 Jun 2026 14:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782769182; x=1783373982; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5j/JMV1yfh/YR/oT6Vo6fxFZTTv2P3Ka0Eqjwg4hJFs=;
        b=aqLGmFWO0OP7ZueG/ZskdrTeKgYtZwL9wa+r3iEOgTYK/wnsue9wnv26bNsjH9h8gD
         J3UCFh8N5m7OQPvUwRr948ADH9TQuDDbRavUzSRgBKT/Da15Wv+QZDibMOZxpVxt7kk+
         vxwyU+LIrdkTbvvqAewxiTM6xWDiH9PI3YOhSQrk8JB6p3WMLNIWEmqElayUI6T3MLlN
         vMQ5CjdWE+IxplJV3zUJQ3PTxcQONgKD5mBuiigg9c3BYjAYdFk8oafQqeCvogRGEEpb
         jut8jkL49+1cvXco1I89FKCsRz+lL/l0lRvUmdIgSrhdIJnaHHuQQtKzThdI5xOmTMK7
         QsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782769182; x=1783373982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5j/JMV1yfh/YR/oT6Vo6fxFZTTv2P3Ka0Eqjwg4hJFs=;
        b=OgGH+A8KXgzsYPUBG+IGk/ZfcIhb6v70hJ9eY071hyi71CIawGq+4ZNwDT9XWjFYnc
         YADlel2Ur1ZIv5wgRjmsXNKmSWXKmxSZAdB61sjuSrQVl6Foy9TGJMBphwYs0ZYTh4ta
         i0Jbt3ksH4WsGvWk1bTrfU+tGJMYodyiVdmTY1eKw43yU0uNMsagdrNnFKyhmUpi0MVC
         1/ksVd0icUTeLH3la8oKGbwmc5d1Rs3lWXmKqcSryq8vuh7jHxG/AGF2k60tDs8g0J+v
         0Ri0tSOhnJjV1vS5dXWfAetHklyMKiMqe22GW4zttDWTgCyqh4vVqj+uIPLaYSSjiDel
         7wkg==
X-Forwarded-Encrypted: i=1; AFNElJ8R+KLZSHCZc0hoJ3ORlf5WHx+0S5T7bAVUHDZL4u4Uyc02hZaLq6NmaHT2hmgObOTXrnE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTNaPxTdiN7jO2+A5qy3kWiwP8Axzv47kl54jHrEEw7jzMtjd+
	GHeGF8H3nVwjqFOd1m4aI7MNgoFC6pi5b+LqVdNwHCsrhsPEPeUZVfmz6SB8h0hkdyA=
X-Gm-Gg: AfdE7ckkXoooNhPN8GrfVSiYbkY2mb/xfeB4jMjzJwcQETQ/9nTDtfckMLnTkCeLLOD
	g7VXfKDm3wFvTqvbFdg2CfFlu59AMeeZeStDy17eRBNimw3eBciPHuD8jdqgq/D+BtvQ4geKWc+
	k4Mc7EjRLdjtSJrjnurhPsl8YYtk/0OLZtzeZXuCD4+7ZPgeE5YPqOBvuRHIy2JKY7nKjene653
	nO1di9FLDzfRyEMb84dc3vzXfUxhxY7djPdSGQwEYCR7y0ztFDcW/f+POUAFZmAWafUZpySPVpT
	5o7ENtlzTldB/u+2XGYvmjqwABdNV08ZSIa3DHFuRVKnbIKmeSqz8nAyt0+v/KfLM5Xda4v07E/
	0Qx0dokzqWSVCGJc7tOqcHJozJmIgqNfEj3OOQL0PCzWeZ70PLpt3YZEHUM8IyW/GgMM1mqYPgH
	HKubft/EPgJwADaNJECT+RQqVfO3ve
X-Received: by 2002:a05:600c:5298:b0:492:40df:d49c with SMTP id 5b1f17b1804b1-493b82ac618mr19908775e9.23.1782769181800;
        Mon, 29 Jun 2026 14:39:41 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493b8d04907sm15984025e9.9.2026.06.29.14.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 14:39:40 -0700 (PDT)
Date: Mon, 29 Jun 2026 23:39:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Frank.Li@oss.nxp.com
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH] ARM: imx: Drop obsolte stuff from common.h
Message-ID: <akLlvHMcVpXDsS9l@monoceros>
References: <20260623104557.1801727-2-u.kleine-koenig@baylibre.com>
 <178276752372.2498119.8965955961315145259.b4-ty@b4>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2gwl24wibjwtmlgx"
Content-Disposition: inline
In-Reply-To: <178276752372.2498119.8965955961315145259.b4-ty@b4>


--2gwl24wibjwtmlgx
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ARM: imx: Drop obsolte stuff from common.h
MIME-Version: 1.0

Hello Frank,

On Mon, Jun 29, 2026 at 05:12:07PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
>=20
> On Tue, 23 Jun 2026 12:45:57 +0200, Uwe Kleine-K=F6nig (The Capable Hub) =
wrote:
> > i.MX21 (and thus imx21_init_early()) is gone since v5.10-rc1 (commit
> > 4b563a066611 ("ARM: imx: Remove imx21 support")).
> >=20
> > The init_irq() functions are gone since v5.12-rc5 (commit e2c1b0ff38c9
> > ("ARM: imx: avic: Convert to using IRQCHIP_DECLARE")).
> >=20
> > And mxc_device_init() was removed for v5.10-rc1 (in commit 8485adf17a15
> > ("ARM: imx: Remove imx device directory")).
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [1/1] ARM: imx: Drop obsolte stuff from common.h
                           ^
There is an 'e' missing ---'  (i.e. s/obsolte/obsolete/).

If you want to fix-up that's great, if not, I can live with the shame
:-)

Best regards
Uwe

--2gwl24wibjwtmlgx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpC5hgACgkQj4D7WH0S
/k6/KAgAsFaXtrgz86LeL9gRjNk69aMhxBj55LBjrfYQkRcd2ELw8fKZOVe6XiiE
dyikdqZgsrSNIkQOyRYd7vHkUJRvPXeK4tpsumhoKIZdz3OPQdrZXPoKxlxcobEr
GMwo4CV0bFXSg0clo1tjsLUXoAOTgBDhYx3++XDKO6imyBblkmRy5oIBUPTjGfGx
Eszyi8SPkrmR4HFtXDyhtWX7+KxaiI0bc5wrhlDMLI1jAF+EIn3R6zE/8ZoP55RA
6J5Jr3HrtUM0iVShCgC5VKL6Uwp9t8Dj1G4o4ulHQk5a64uSsK+z7uGmQXAoLg6y
zMSUuSV1yhBv6kbgWFAbnLQuETkBYA==
=iJG9
-----END PGP SIGNATURE-----

--2gwl24wibjwtmlgx--
