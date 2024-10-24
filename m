Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CDB1FF60E
	for <imx@lists.linux.dev>; Thu, 24 Oct 2024 17:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729790794; cv=none; b=LeVwVxuEM0oKQgJa9zTEG44OI518cvX67hkcQEaFzDx7wddVXLhFE499vfoFzcpueOtrawo3uG8D/RfBgde0JExm+eirMD2sju+OWskozx0Rt2I7B2i/75hB8TGlvDkIk8nGNoXuICVX8UoGWv0LvwZDUOWp1U1zvA5ByS7U0lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729790794; c=relaxed/simple;
	bh=RwEePPnICKDq/hGzPzFY9TDugPuK4+JiAhBYXPj1EVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qBQhWj/XmZhRr0u84Jyew7S5/E2/gfQkIVogI868ZykIAXP0jxsMiwCLpMW++upB8/yKo72/IgBOqh+F2oRrdsMSPFmAtW7x4Za5gMXrLplAqX/mVUMbqe5UD8K1byJhWQ3ZUxhjn9AKpfRkbUgAjgZR1LgcEXdRQvfaGiKvXR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KVeIRsda; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KVeIRsda"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso16105605e9.0
        for <imx@lists.linux.dev>; Thu, 24 Oct 2024 10:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729790789; x=1730395589; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=df4TNSGzSNKm0QFOAhtHpnlWhy9nagHU1mwVeiJhueE=;
        b=KVeIRsdaAVHLsRs1NCQdnCTIca0qnmfAmObHRruqPjdOTtEzewqEg8WVvPBzRF7GFN
         XxghvmNKAOkEqkYfxo4p5ZiJqxAsPio9PAHf1Wm3rlaus2VPLmE9FwlfqCbS+o/4mxUP
         5WoTmCWr7w2iBPTJUfL2yVu3WsrVwRLNF7f9TjRp+uPuOng+pcMIxRFPTh4h6WXGdOqD
         9bRXa3FnhI3Zbi2y/infCqXDIGQD5Ts4/menNPxWGm0XlJolERnY+QkaXObSl5pXJVLi
         d2r8rDZFD7gi8xeu3mnc61yHxfmcTKe374o0ZuYuQNq+L8fu8TRlXjPY65uUWHvqTdCk
         2ffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729790789; x=1730395589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=df4TNSGzSNKm0QFOAhtHpnlWhy9nagHU1mwVeiJhueE=;
        b=SRwSn9ppyX5kbDFirMxcx9hwMmxXyDB/g1EkNkLipBnJ3FDVgk7VBGlqaWm51iDiDw
         nLjmn7kEDU8/s3P1Laqs59YkVBMwiYemDY6QK8f+IT7PpQCE8Nz5GMKA94Jw5kMsoZ2b
         E4LrdDNiKYaGDvryRJc0jQ3g0D5Vbt782mDlvmEZad3HPpcfzK7guIUPjv6nm5KODDnb
         jzB45GobVNUBfPx/RyBWdbMsa2uVVFkzfSpDiouCyskwDTlj6ujytisUVwb8ZdzHMaie
         qNLnGJhFgdOqWx8eIs4mQQtHRRrSU81t7JmCRd3/R8nVnFrmlsT3E+UsQyq3uOSjTUpG
         iKIg==
X-Forwarded-Encrypted: i=1; AJvYcCWh5kJ38wpSfcgZKNt/d+5xPdpsVMLceuMA2N7Hqxv1+xAPX/WWLH30P9lpmLfp0SARauA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfrvIvL2QGMgckB96wFiCRUsPCsAKuU7SladqPdgWcXX63+Ckc
	Ml4qnl0wVZ3HFI+0dQ1hJWqbK6W1LDPoAie6jEuOfT4cOp82Ul1PT+8djMOZn3Q=
X-Google-Smtp-Source: AGHT+IERuGJIotkBPQnG/sDjxSCMdboz8SG9EaUnlFwZt5gyjZXzk4XrIIAOtG10KxDOLzg+kXRQFQ==
X-Received: by 2002:a5d:4cc3:0:b0:37d:46fa:d1d7 with SMTP id ffacd0b85a97d-37efcf91b9emr6075835f8f.57.1729790789509;
        Thu, 24 Oct 2024 10:26:29 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bb15sm11814624f8f.99.2024.10.24.10.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 10:26:29 -0700 (PDT)
Date: Thu, 24 Oct 2024 19:26:28 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>, 
	Michael Trimarchi <michael@amarulasolutions.com>, linux-pm@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Sascha Hauer <s.hauer@pengutronix.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pmdomain: imx: gpcv2: replace dev_err() with
 dev_err_probe()
Message-ID: <4vws5lnu4efupunha74pdlgtd754w6n2loymgywrxhwm2rqic2@gz4efozdrpqm>
References: <20241024103540.3482216-1-dario.binacchi@amarulasolutions.com>
 <20241024110123.wix35njjbh3nx7kn@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ow3mz7ffba4wu6es"
Content-Disposition: inline
In-Reply-To: <20241024110123.wix35njjbh3nx7kn@pengutronix.de>


--ow3mz7ffba4wu6es
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pmdomain: imx: gpcv2: replace dev_err() with
 dev_err_probe()
MIME-Version: 1.0

Hallo Marco,

On Thu, Oct 24, 2024 at 01:01:23PM +0200, Marco Felsch wrote:
> On 24-10-24, Dario Binacchi wrote:
> > The patch standardizes the probe() code by replacing the two occurrences
> > of dev_err() with dev_err_probe(). Indeed, dev_err_probe() was used in =
all
> > other error paths of the probe() function.
>=20
> I assume that this paths aren't using dev_err_probe because these paths
> can't return EPROBE_DEFER and therefore dev_err_probe() would use
> dev_err() anyway.

Note that dev_err_probe() has advantages even if the error code isn't
EPROBE_DEFER. In this case it's mentioning the error code.

See also commits
	7065f92255bb ("driver core: Clarify that dev_err_probe() is OK even w/out =
-EPROBE_DEFER")
	532888a59505 ("driver core: Better advertise dev_err_probe()")

Best regards
Uwe


--ow3mz7ffba4wu6es
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcag0EACgkQj4D7WH0S
/k7z5wf8CJItP63PC6N/D5K9sQTx0ydliUNv7dA1lUSVuiADSLncCZVZu3zmSuiZ
6Ta9uxNeZuOyJSAtq5mXX70s8vNrRycm/rYxPoZNvvB62ZHQOyweWF0f0Ce1AwGn
keWSqZ3/B9mNSgtSqmyEi3HHcx61NbjjO230wOBvNKfUElyL4ozrgbzFv2qbLZYF
Nt5xFEoEQiw0riAk7lgyOazrA/6D5ZyJ60YZ5AdifNXgDLfU5OkRmpVh4/eOGKD0
x/Rn15dujV72q8n+ZyXqyifZUbnGVTXYWnNzNwqwcPT/y2ESWjPMC6uyeUwiEMuo
xHEVQMNz7SHRR8PmDEwbI/fmJdDOjg==
=kHdL
-----END PGP SIGNATURE-----

--ow3mz7ffba4wu6es--
