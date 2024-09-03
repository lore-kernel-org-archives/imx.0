Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED9018BB8C
	for <imx@lists.linux.dev>; Tue,  3 Sep 2024 16:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725380797; cv=none; b=e7s0O/vMcc78vD3ngrL6T+0tC7bt3tQwY6wC4QBvOK2Uukp5Tl97BguwHbaoGa4DjAq5j8IHSzR2ZrupQQPTivj0f51h/9se8EZhNZmXyiCYDJc4iFTEJC5yR8IwQrK9EFnKzK6NFM8B7lQFos74CmfMBreravSIBYAWZAc6ZTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725380797; c=relaxed/simple;
	bh=UOv3nGBodylOb27x6wUuPaSgFW/EFvgkUlcBYJybAeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ivoq98UZf9yhbvJdtYahIcUd5oP5kE1sECXWuLOZJSzwvwKpznD4vSUaowP3d8B/+a0IY+6FI3dU3dPmhy4kUC/jcAUaWds6bjsFtcqKVxkdVUtmJlZxj+6n4Q9Eu8/5QfTkj0kec8Etvzi+LRPGAgDiF10IRViyYNcCfn9Hzqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pZpfkHMb; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pZpfkHMb"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f3f07ac2dcso62319831fa.2
        for <imx@lists.linux.dev>; Tue, 03 Sep 2024 09:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725380792; x=1725985592; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UOv3nGBodylOb27x6wUuPaSgFW/EFvgkUlcBYJybAeI=;
        b=pZpfkHMb6dsxP8dfpCkXt++Z4kNvlfaOfane/3ZsBTwOt6hqzvxDBvjy6UjuYuF+Wa
         Iz0F+TxMxmzv/xDjo+3wNKRuIx5uum/nc5ledYNeZp2vGd5+Zi67fM2qEgLWPZEmzAV2
         QAkrMe9Gixb3S5YH5iQNf5B/3UwNdlTDXkce+LxW4bojpMTHg9PVnckeo9rzkEYHfAWp
         fs+pIh3AZDV554dApGt+vaEhgBvro+c/8tQdxafVwql1OIzN7KuKWPSyKROtMbcYW7jq
         LCUk14Tw2TxhWlDkmS59RP73mTdfxU8Tqx4+FSpoHeLJyZZROyRzEr802B6Om52qwuFD
         ohRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725380792; x=1725985592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOv3nGBodylOb27x6wUuPaSgFW/EFvgkUlcBYJybAeI=;
        b=sXVEAtNKSYeEvWB17m2xWSz89L47730j/JqTHkzYGbrxQEDzOZ6A6b/3sZAXCCcWoG
         297Vuvp6kFWErEGIldO9Xtm1O24xm0G938iB+sXnWyJiCLU93XbUPgh/nz4XpXN6G9pU
         uG4tEyD9KJj8eIM0bKJOtNXTwAhltPz0rucI4DfFFTW5x3rQJNVg27oavWT+E5voFUWU
         izIH7ZQ/VtF1kgKqnYhhmOBA//885/+p6x9v+09HvtbdzXga61sCEIMn8/JfgywoaWEZ
         zn6CF0TMrb8TASsUUfdzTLvwLdJ7pCCUVFfH3nLx2A1EFONU/LSvwgtWTcJqphreTOjb
         wLQA==
X-Forwarded-Encrypted: i=1; AJvYcCV9QFWSwJz3b7oJyzSgV8tbx4dleJCxy1VOciExJBE9cs+r+WtQFqmFZluzxGhhrTqCpUg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRJMHe1GoOPteA0J1AToBtQlEb4Ary0l2jtE7azzAPdp6S1Rz9
	ivtPLHb+jAuS7F2E+DF79X9AvcpuLz5E1QD6xa90IJMKJWSaYAwi8N5kFVR0eHY=
X-Google-Smtp-Source: AGHT+IFCPzPWsIsRmfp2poLwXGcq+zOJurAsgdC/lf6de+f8XfxHhQkaO8lDI8J140bhx3OvbcsO8A==
X-Received: by 2002:a2e:a586:0:b0:2f1:929b:af03 with SMTP id 38308e7fff4ca-2f6104f2590mr118378621fa.30.1725380791999;
        Tue, 03 Sep 2024 09:26:31 -0700 (PDT)
Received: from localhost (p5dc68f76.dip0.t-ipconnect.de. [93.198.143.118])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c24733a74bsm4511685a12.86.2024.09.03.09.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 09:26:31 -0700 (PDT)
Date: Tue, 3 Sep 2024 18:26:30 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Arnd Bergmann <arnd@arndb.de>, Fabio Estevam <festevam@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] pmdomain: imx93-pd: replace dev_err() with
 dev_err_probe()
Message-ID: <zdxpskhxcxujlk7tjch7p5opsflwchkq7b5m6ctjrsxm2tpnkm@wbnp6l7hkfuf>
References: <20240825143428.556439-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u6lwchy2mevlhl22"
Content-Disposition: inline
In-Reply-To: <20240825143428.556439-1-dario.binacchi@amarulasolutions.com>


--u6lwchy2mevlhl22
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, Aug 25, 2024 at 04:34:00PM +0200, Dario Binacchi wrote:
> This way, the code becomes more compact, and dev_err_probe() is used in
> every error path of the probe() function.
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Another improvement worth mentioning is that the new output mentions the
error code returned by clk_bulk_prepare_enable(). If you respin this
series you might want to consider adding that to the commit log. Even
without that added:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--u6lwchy2mevlhl22
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbXOLMACgkQj4D7WH0S
/k4MTwf8CKDh6NgmbHBsY9tSR6bBFLp6nyZQQ27Ac4ud4PT+VOlbzn8OqxthvyB1
Zsx0kL2Dgw63ODu3M5WaDWzeUgMdfcTEs9GMm7xdA7oGwlnGp/mRfVaUaxXBxve1
xtbuBzWP3fcJD5eUojO/CU2gu2V0N+s5E2X12sXbxqdY3BnScEvayCcKG949DM9r
05rUBLycEh3aSEF4eDUkkUGR6qsGo0KmCh540xHH+NVZ1Zo3GBX68eIiynGvAmAE
WDEHTNrBz0exPXIUTeYpKLNMpgjaaR6WcZMIVlMDu4EK8WEvW3YUnEbDEUmVADNL
E+u6u/HzJYmeRrVIOXsczn1ow78WqQ==
=1sbS
-----END PGP SIGNATURE-----

--u6lwchy2mevlhl22--
