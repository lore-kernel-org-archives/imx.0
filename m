Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C3F2036EF
	for <imx@lists.linux.dev>; Tue, 29 Oct 2024 08:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730189267; cv=none; b=iNY+e3QXRhm1KVTBeaBDCHer1ms8RSrLKxmI7GF4EsMDHBP7jiP+HnW4/LrTuGFMlaJG5RSoWLAAhU1D3zjHd4awuyyi/uP4uE2bPngaYrTY7c81eAAJ0F61VuiKh+oYxZS2pxIL7FWyeEjluwywc+yF9bA4nj9XtzxKg2WMrgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730189267; c=relaxed/simple;
	bh=fz7RRww98aR7+TFIOi8xsXZBrEV8mkiqw5q+W3z+x50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CwPo9sOiz481xgoslTH/XHt3oymyogCR+rustZGJhZE3BGR7e9IFPINbGdIDwkMeWyjhRGT4zw4I+dqwqh12rgzmV4ZBP9iKpL4S9rhxwYw1ypyY1TyQVy7k7GadxhdU1r3jUqMXXoP37cXTmNgnzSXCi5BTqjMxJqRnUDvQCBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uFqJ0cwH; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uFqJ0cwH"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so51199505e9.1
        for <imx@lists.linux.dev>; Tue, 29 Oct 2024 01:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730189264; x=1730794064; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fz7RRww98aR7+TFIOi8xsXZBrEV8mkiqw5q+W3z+x50=;
        b=uFqJ0cwH29Xtva8tX3O5NMU/JDnC1e+7Qdot0i4Z29nAsr10tCqS3EDpcs8CY6IMth
         Q8ENNYdQaKJxDvYycr9fuv6E7VsO5zNWTHsPTrfQoczJ/mQlcqR+qrVhVQzW+2YONOYS
         fvfWES7xaj6nu0aKWh31OVrsHa1VJt/W8A++aZTUexHuVGSAfGUryluKmfI1FQTZ0eiJ
         lyJ7AZAdr/uo1ScEHNzGi8kUogU0FwgQwWH67ITVAf1K34KB/TKKDiZOzDetm1JoxRbF
         O1a0vaWz/NEt4iUPYlVpP7pCK2SCZ+83vqguXhyAaammGKWMk6+tVNLm1BxLbuNv+26q
         j+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730189264; x=1730794064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fz7RRww98aR7+TFIOi8xsXZBrEV8mkiqw5q+W3z+x50=;
        b=FeF7x3KXKPPTblS8O1jtVnGDtIh3owGbf4qzrFUbZaWU1pkX5wTDG/GTg8BxXIqlpZ
         0xo2hn5LitZf5hugcG5BlsmSErM485a6rDwy2OR4xEKliBV4qdK9ArMU00cNaiUdjf8I
         ss5GhU01lqsz4DVLN1XB3oyS4AQmTTSLQaTdJ/4bGcNPFs7FrmAmhts9zA42kWR0h5tY
         hMPz9P+ptiqALN8fd0j5VgzEJAPBY5pwIgICE+nihEXWJVUeqpnIBI7QpnDWRssANBVo
         kyt29pXBg16Epe7+Gk3OX5Ju6C55Hov+H5dKz0pc/ZuM/SXu2OGHEfxqmd/iEpCQtHe+
         JPsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJO6/cEgeaHu0ugZURn/CPyzvzhoRqOJSo0PK4HrxMQQifq56BOsPaSy8B8ha0XXkwi/s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4Nm8UReLnro5s8YeERb4LmmmDb5Rd/CSYddf2Hoo10kDXvn+0
	e8P2Y+upcGuWm7BtDIfNUvyw8ZktGo9G0Oo4Fn75ta7Ya8QOltxt+cVNme+U66M=
X-Google-Smtp-Source: AGHT+IHdtLAytGreUBiJVRVj0CzK2hX+LtTYIjY1HGXyXgeH85JAHHDcJqmfe2WqX6/D5uWSIjYTxg==
X-Received: by 2002:a05:600c:4f51:b0:42c:a574:6360 with SMTP id 5b1f17b1804b1-4319ad2d6aamr98759075e9.29.1730189264124;
        Tue, 29 Oct 2024 01:07:44 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b9294dsm11699741f8f.105.2024.10.29.01.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 01:07:43 -0700 (PDT)
Date: Tue, 29 Oct 2024 09:07:42 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, pratikmanvar09@gmail.com, francesco@dolcini.it
Subject: Re: [PATCH v3 2/3] pwm: imx27: Use clk_bulk_*() API to simplify
 clock handling
Message-ID: <zbtjpemahkpoabonf2td2i62qrlbb2xv7wlw3te752h6hgnsjm@ba7sdyqgbvms>
References: <20240910-pwm-v3-0-fbb047896618@nxp.com>
 <20240910-pwm-v3-2-fbb047896618@nxp.com>
 <7kplk52i7e2nha5ym4loza5oc3lwghifjfk3aut24w3hjagfk3@zusb2naeaevw>
 <ZxfMZobFdBA7ffhU@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bgnhgnnffifnsrec"
Content-Disposition: inline
In-Reply-To: <ZxfMZobFdBA7ffhU@lizhi-Precision-Tower-5810>


--bgnhgnnffifnsrec
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/3] pwm: imx27: Use clk_bulk_*() API to simplify
 clock handling
MIME-Version: 1.0

Hello,

On Tue, Oct 22, 2024 at 12:01:42PM -0400, Frank Li wrote:
> On Tue, Oct 22, 2024 at 08:53:40AM +0200, Uwe Kleine-K=F6nig wrote:
> > I applied just this patch to
> > https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/=
for-next
> > . The others are still under discussion, right?
>=20
> Yes, thanks. I think 32k is not necessary and need more research.

OK, thanks for confirming, I discard these from patchwork.

Best regards
Uwe

--bgnhgnnffifnsrec
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcgl8wACgkQj4D7WH0S
/k6ehwf/fyJogWx9JiTzSrjVr39U4buCC6TCylJbTGIiYDJGRW71DmfsuQ1S8OP7
nsN41Lb2xbF4Gn0s1IgZph5+a47bIwqzDINtl7YJ6Zj4HuHMC3dDE6GNjCi7uHr7
JvWfImw8m0R9jvEPL25ukoSgqFNeBYJHYVssLk86hZWC4ffVePMXpTzGQNVgMxey
LsUqNa65gIVzdxzBETe7bE0qZeidDFssFVBBBT0AduDDbB3NGpD9lb0Qa7Du3V0T
4ci550yhekpPrtartCbPKvFb6cfcOvT/mOdNqhAM12F3g3WOnx8au/XT1TMgu6o8
A880c+BSCnfEAgpF9xctUfVlLQL8Ow==
=EBhu
-----END PGP SIGNATURE-----

--bgnhgnnffifnsrec--
