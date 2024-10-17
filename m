Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447F61C1751
	for <imx@lists.linux.dev>; Thu, 17 Oct 2024 06:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729148307; cv=none; b=RID+JAYgVQaSna2/LD9wfTB/7ZSa57UbTpVYDu9dcsAIFd8DelmeJehoOS7vl090rB05EV6qBerUnBIYVNdTcUbCh+1grau3bTpFug5HS9zk5H7bmOJ/uqRQvq8Pixks+hUSJ3GcLhhNg6Gyfw0W1FOuWua+tReG8eA+pUqN4z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729148307; c=relaxed/simple;
	bh=eikXMQQTQFtDuJEmxx594Z1tR3sjWpjfu06Fxs5TST8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWvlikJR83aVY88H6SGxkzxo0wwiLouyZeNNn4ohLKGCu+B/3jvjWw1bnIqJvKssESIR+6vWcnKqN25QvNN4mYObbMlMP2+yQSQ81R5LK6ELE+36JhT8jDFO+NKF9lRuemvxrvVuhrhVMbe6+aIbGKyDnbfS7f3tv5+Prqj/FTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1YxIBXBJ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1YxIBXBJ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43152b79d25so6074965e9.1
        for <imx@lists.linux.dev>; Wed, 16 Oct 2024 23:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729148303; x=1729753103; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yeLvVHAahzMmmigQ0rhyHbTviJd4gJG97Yv+5p31+60=;
        b=1YxIBXBJM0GObUr0iZReheFACamdSIyfpthy21IYiZ7sH5k/qpOuX1cPbm42WzPcMh
         V6pzaMACFHISLiEzeU7l0lt7SKyLfwpc7SHq8VhkBtrbk5dupMRy7y/onQcN/5kePZ0n
         lfhyLczKFbowRz/rX0YuwAgX6CIERxr+AqJ0kO2Z7gOkmhjhVmwBzgckGKsToSSQXYjS
         5Pz+HCSaETkeVwR2TK8Nau4WLtBU1457pxQajcpFqn3jxodU4xf/0iysqkHiRCqnjq8v
         ukB5IR/AF4u1z7hPCpk2thLrN8i1ca3P7C2Q1iAGM0hzPuaqA8buUcDLE84bP/yxhATH
         0g2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729148303; x=1729753103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yeLvVHAahzMmmigQ0rhyHbTviJd4gJG97Yv+5p31+60=;
        b=qT1Q21B0eTuqZ0keYiCGeReicSRh+wjVLDFRJrkgf7ioNdw2wy8a34zutVydFJv9Eq
         7TUeo0hVd5pspw1rqrWpedCeL5SE3DH1UFsYKtbyqPN3RMDs4sCFun3umgjxomSk5m69
         MJpAK+LEPMkz53KX7i0qsF7e+jrIMEKtOdSQ/KUzMdxxxWRdSRLEjldkxfe4z7BI2zGU
         4hQBeXCkPPReGCqn5U34AgeGVMXQAUYfe9zucF0Wxzm0gmUjpjNy6XiWLAYoyPlpaJIL
         Hu8L5mauepjgR05rVH3oN8UZUt+Lftr1oBTCxs6j2r7dnfGYYqJF6bs5Zi6im9KpWRHe
         YtUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD1KYzvm+0W3pmw/tHDfjS2DNBEjvhSyk/zzMK46WjuvOGkRGSfcp4aLpUFb7s3I4P07I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHh3cwB4XwaFGXhTGgkvl3OOydPy1R9mzym9dBIYhcxAs9eI7j
	N41almLNexB+qjrKCZ4YHsVz6Hm532O8Z74jnQCBSMamAYMhRMq9+FSWocOUV2Q=
X-Google-Smtp-Source: AGHT+IE3taqIWL9QmJ5JHNSmCD5QX4JIPb6rHSNX0e4A6iWAkyFY2s5keuSgw/xpQbIvUxwI/i+2GA==
X-Received: by 2002:adf:fe89:0:b0:37d:5129:f454 with SMTP id ffacd0b85a97d-37d551d4fd9mr13656287f8f.15.1729148303407;
        Wed, 16 Oct 2024 23:58:23 -0700 (PDT)
Received: from localhost (p509151f9.dip0.t-ipconnect.de. [80.145.81.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa87bbesm6283069f8f.41.2024.10.16.23.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 23:58:22 -0700 (PDT)
Date: Thu, 17 Oct 2024 08:58:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Frank Li <Frank.li@nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com, 
	francesco@dolcini.it, imx@lists.linux.dev, jun.li@nxp.com, kernel@pengutronix.de, 
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, marex@denx.de, p.zabel@pengutronix.de, 
	pratikmanvar09@gmail.com, robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org, 
	xiaoning.wang@nxp.com
Subject: Re: [PATCH v8 1/1] pwm: imx27: workaround of the pwm output bug when
 decrease the duty cycle
Message-ID: <pz267mfsmohgthip52s7qeeo6xvw6w65eug23jw2qoghfnudzo@kjbp3brumgy3>
References: <20241008194123.1943141-1-Frank.Li@nxp.com>
 <Zw/maOfa12uoJlO6@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vtagf2jnmwccljol"
Content-Disposition: inline
In-Reply-To: <Zw/maOfa12uoJlO6@lizhi-Precision-Tower-5810>


--vtagf2jnmwccljol
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v8 1/1] pwm: imx27: workaround of the pwm output bug when
 decrease the duty cycle
MIME-Version: 1.0

Hello Frank,

On Wed, Oct 16, 2024 at 12:14:32PM -0400, Frank Li wrote:
> 	Do you satisfy for what my merged comments's results and do you
> have other comments about this workaround?

I think it's good enough even without the comment that Marek requested
and applied it to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-next
as-is.

(Although the mathematical pedant inside me shivers when reading things like

	2us = 500 kHz

:-) .)

Best regards
Uwe

--vtagf2jnmwccljol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcQtYoACgkQj4D7WH0S
/k4bBwf/ZEIHwRC7YoX/I8XH4VxCiCkGMwD9TeUVYDdhckzALnmiXnP+2zqBHwk4
9Z0G/bDToAY9yy/hDPxvjcZAmlZFKesEJhX+yUQC9O2xxmmTsDO9iq23brROR3ce
yzmVt/HMVPdZmXLkZHAOeGN5R7OkC2cSLcCeQ7sHuKS2X+K5fSPahweUGmw/OT+Q
a0OxO/bBIkCA8H5JdG5E0zg7e10WCFqbP+HtqQxF0mcJNcKmlGNjr2LkxB/2PXUD
GxuhwRr8Yl5bYjEq+dmUQN2v26jCyizjDLXMaRyPJKfSF3OArfz/17QLPtKy0Rk3
OdYSAeOz0ag/O42mOaDPegULR4B7Yw==
=KwPb
-----END PGP SIGNATURE-----

--vtagf2jnmwccljol--
