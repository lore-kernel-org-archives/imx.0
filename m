Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A6B13C67D
	for <imx@lists.linux.dev>; Fri, 26 Apr 2024 07:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714115597; cv=none; b=mTnvMqVIhuVFpsyUKHdlIaV4hv+rhPLxefM6NR4tXWpsnvqlwPwVj1l4ufaDNYjnYMRPrk5FjzLsMFSCBp545u/gl4ntqtH7jcvT6oAz3CTnLIXG0xpxP9w+zOy+odArmeQOWTe+VOBiegndEFKpzBFRkkpBwELmOHB3lKpB97M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714115597; c=relaxed/simple;
	bh=rOzcluYKG2hrpYV20L/nT3C1eaey2DRuJJlwnc12FaY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tJZCk1wFwTwjNcga7skNW34mhK34DLo4gH3u8hQEPMTR6pdKlucCvXMsL7Qktig2QTxSs5RD5YeUmmQG2GVD45Qse3L8v/0HBtU8yKPV5w3BwEKnXbIE7HrrfMuOO1BVvOuuuXuOfs3jSSVXxZtTK4ukZZFtWn0QHKsuatoXkRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODc5wRHi; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODc5wRHi"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41ba1ba5592so486275e9.1
        for <imx@lists.linux.dev>; Fri, 26 Apr 2024 00:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714115594; x=1714720394; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rOzcluYKG2hrpYV20L/nT3C1eaey2DRuJJlwnc12FaY=;
        b=ODc5wRHiPDikrQpZ/AV71OEHv325qHTuHos+KTe3b6pwG0M1GvQjK1ClW3T4CPdLJf
         1SIlbOfUOi3x0wtYzADyiq9j9I5RyXVkUXk/kzedo4h6w2mT+Vvxw8wTTJ7sKi7/B1EK
         uvk0mS4y85SK0N9xgSVBcW4TFkG3vF8loYEpWkNDGCpurP3CPqukNCLzC8WaVxveroxj
         aVwo+lrztt9I4DTce8Gi63QkTZcPWsxCNaJM88Ewp4Ivb+tvBT6ao0A/qPHugcmrSahY
         qIetlylPkze0bdLxXoFLdeuwg985xPC+/C+FfLa/JMUIvVm4wT5M+SO9x41gq0//nXvE
         VH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714115594; x=1714720394;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rOzcluYKG2hrpYV20L/nT3C1eaey2DRuJJlwnc12FaY=;
        b=VlEcvuOgDEZmBLTEIDFt/7aUeSH4ermUsABJswNEjyAUvrbcHi+Y7x3dw7GOTRcrl8
         ej/BjqPh9984qNHdZatKMy0SUTXMUUiB94EFIB4OCjM3dL2RDEOu19BVJ5s7wMYgb7at
         ci6bXegHwIvbAwYAMd/T77PwhpJNN892c+7ol6qaHhql/cK18UbjcjwCfprNFbISfgLN
         ZfmrPubBKZ41tUT1LXmauIg96K3e5KpdQJTW+5uSrkgcwF5i2P5xbaRVd1cz4MLnXItB
         k/JIXS7S3MVuB3ZJD6nyd7v/T+J9DNKP2oTM5DtRJms/ROzbVYxwySRKG5KiXnUK1uhQ
         yMBw==
X-Forwarded-Encrypted: i=1; AJvYcCXd+8w3p6+uQeGYc1aWgX9wZyotzQd1bgqS0fPzzhuIxUWuHt9/4RGzideOmrhtNGvGuSRnrjgkI45K89QjCqKDS/IR
X-Gm-Message-State: AOJu0Yx0/OxKOoB8zdvzb7gPj6oXcTox2fYVvyK8Rnu9cAjfrXHpBAih
	rCNCe4sfe4pTJL927Ht78ZEYb7yVoxXUhSjABp9ET6g9FmoRYBdO
X-Google-Smtp-Source: AGHT+IELlRH0sOWJdCsZIYCDl7Yx1dPCBTVH9urrSlrGNcaa6bxDZs6XhcNcgT5jQ3DLLvUE/MRRMg==
X-Received: by 2002:a05:600c:3553:b0:418:d6f2:a97a with SMTP id i19-20020a05600c355300b00418d6f2a97amr1481428wmq.13.1714115594183;
        Fri, 26 Apr 2024 00:13:14 -0700 (PDT)
Received: from ?IPv6:2001:a61:3481:2201:6106:96db:d27b:d2c2? ([2001:a61:3481:2201:6106:96db:d27b:d2c2])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c35c700b0041638a085d3sm33449748wmq.15.2024.04.26.00.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 00:13:13 -0700 (PDT)
Message-ID: <2630ef8c8363b4fa772a2ff2c95cf115ad3c509d.camel@gmail.com>
Subject: Re: [PATCH 0/3] iio: cleanup masklength usage
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: David Lechner <dlechner@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date: Fri, 26 Apr 2024 09:13:13 +0200
In-Reply-To: <20240425-b4-iio-masklength-cleanup-v1-0-d3d16318274d@baylibre.com>
References: 
	<20240425-b4-iio-masklength-cleanup-v1-0-d3d16318274d@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2024-04-25 at 10:03 -0500, David Lechner wrote:
> While working on other patches I noticed that a few drivers are setting
> the masklength field of struct iio_dev even though it is marked as
> [INTERN]. It looks like maybe this was not always the case, but we can
> safely clean it up now without breaking anything.
>=20
> ---
> David Lechner (3):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iio: adc: ad7266: don't set masklength
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iio: adc: mxs-lradc-adc: don't set masklen=
gth
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iio: buffer: initialize masklength accumul=
ator to 0
>=20
> =C2=A0drivers/iio/adc/ad7266.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1 -
> =C2=A0drivers/iio/adc/mxs-lradc-adc.c=C2=A0=C2=A0 | 1 -
> =C2=A0drivers/iio/industrialio-buffer.c | 2 +-
> =C2=A03 files changed, 1 insertion(+), 3 deletions(-)
> ---
> base-commit: b80ad8e3cd2712b78b98804d1f59199680d8ed91
> change-id: 20240425-b4-iio-masklength-cleanup-86b632b19901
>=20

Hi David,

Nice cleanup. The patches look good to me but there's one thing missing :).=
 As you
correctly noted, the field should be internal to the IIO core and drivers s=
hould not
touch it. Hence, you need to make sure not driver is using it so we can mov=
e it into
struct iio_dev_opaque [1]. That's the place all the intern fields should, e=
ventually,
end up.

Now, quite some drivers in the trigger handler will read the masklength for=
 looping
with for_each_set_bit(). Hence, the straight thing would be an helper to ge=
t it.
Maybe there's a clever way...

I know this is more work than what you had in mind but I think it should be=
 fairly
simple (hopefully) and since you started it :), maybe we can get the whole =
thing done
and remove another [INTERN] member from the iio_dev struct.

[1]: https://elixir.bootlin.com/linux/latest/source/include/linux/iio/iio-o=
paque.h#L42

- Nuno S=C3=A1
