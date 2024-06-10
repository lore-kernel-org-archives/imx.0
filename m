Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED9F14B97E
	for <imx@lists.linux.dev>; Mon, 10 Jun 2024 16:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718038403; cv=none; b=e0UkH/nJotIfmigke3JTKWwUXSgJGd3FBLwRxavK1xIkt406G8DJPYZBV2pXwpBhylOPmEQvAUWnbfJj8CZQvb1srjuTU55UAwdmDgr2cg+YbFWvhguyTIY3ttbODmIkb0/qEKtT7hFeiDg8wDj9XMJBAjBaQDrT/5LcAHh1aPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718038403; c=relaxed/simple;
	bh=BES8ee5sXlc5zmrxJY2BlnRPRIoI2IPGXq+EX3VR1No=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WR0f1g4bPgnRolVH3+Dv+W9lJfIhq7p22j6QynLNMlmFH9S+DY0f7FGlQTk7K4AK71P9QO/QzM3nk7cfwyPZR+Zx8zljpu9YK/s9M/Pdx9K2dN0eRnetGQFelZOqLKF7KZE1lWYzmW8ZVf0NwFSvPwS/k86fG9QiBa5fjnOJEwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=M3LCzvGm; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="M3LCzvGm"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6f09eaf420so220380066b.3
        for <imx@lists.linux.dev>; Mon, 10 Jun 2024 09:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718038399; x=1718643199; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BES8ee5sXlc5zmrxJY2BlnRPRIoI2IPGXq+EX3VR1No=;
        b=M3LCzvGmmhNwjkS+1EzoV90DUcuzSFJZeibZv7RiirqyInHDVE2kQiF1r++FiVN34H
         UBl0s/yBa6qTSRNc5AU9mAh2dVSHPEk3NDD5Dx3SlWAvSH/oYKGdV6f5N9LccytQV4Bt
         tuygJMpvFJR0PhqHE0A6kcCblxZf0q9H6aZ84ASmcpdinLNAUiFMxOIPqF61hsPOGI9V
         P0rZuh4qWfcmPEERYJiqb/umgKSV0sgEnaWu6+MT+VOVPPVFtae6dDxURIVVSe7+VlD6
         ubltdgB2lPYlklyOvDlrzf6cDE+NppzQmf5GXUgmLytS/3lRPa+NWPv0PGVzkWZllQuf
         V+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718038399; x=1718643199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BES8ee5sXlc5zmrxJY2BlnRPRIoI2IPGXq+EX3VR1No=;
        b=p5EM9niokikQUr952G7LAxRegJu58gjlrEYn7WvO4odvJrl9lZCuHjEkT5eQ46y3b9
         j+UicUrG+g79KWHBT/R7dMhAFPryFSsZQ+J43N9ERkOYJN2bXRO7vLZj4WZkqwLGas+W
         DjEwgFRgfvlcQI797wC4bpMxkGRhcnllu+aX7q197mcO6MPmo9nBX4TtC2/3qjIS+WCr
         N7mJ7Vx+5sCVbqhJt3AF5yVcoeI5QVHcPUKQd91kVyX5NWg5vSy+2tU+Na559AYlKzQW
         wIyCXPgIr47yKyH8moxP5WetOYZte2BrHvbpxzMKQhKs1DB9gXidTTfoZirHsRJ2vlMP
         eZFA==
X-Forwarded-Encrypted: i=1; AJvYcCXxPYJ22/asjcEkn1iPUPRptcGNDRwujswsgQvD5uJJj7mkmgjZh5IZX2eR2np+Shsasu+aj1C3huc+t/x+I6LYzI1v
X-Gm-Message-State: AOJu0Yw+De1r+TqI4Q7U9ZDvNH7YWptUensYPNoLvKAHrnM9mbiUT5V+
	UC7IeFB0QbhqAYVamwdOkJGhRET+yoJ76oD2/ARAyRzOLdmqkwG2JMW67XuAO/A=
X-Google-Smtp-Source: AGHT+IFEYSFuraPOa+WYVzdaL+ESVBNKCRmo08LglRUMqvJEaK4g/mE7UxIj5Y6FmBNmUXmvs8sJdQ==
X-Received: by 2002:a17:906:e20c:b0:a6f:26a5:9f5f with SMTP id a640c23a62f3a-a6f26a5a0a5mr142869266b.42.1718038398698;
        Mon, 10 Jun 2024 09:53:18 -0700 (PDT)
Received: from localhost (p200300f65f283b00ca876ee5dd3d1e3b.dip0.t-ipconnect.de. [2003:f6:5f28:3b00:ca87:6ee5:dd3d:1e3b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f20563a26sm133567866b.129.2024.06.10.09.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 09:53:18 -0700 (PDT)
Date: Mon, 10 Jun 2024 18:53:16 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pwm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] pwm: add missing MODULE_DESCRIPTION() macros
Message-ID: <t4xkx7mmokgj3lqmcl222s223obdahpqp6sqxgwaohisbqlbib@vitt25ggsezf>
References: <20240610-md-drivers-pwm-v2-1-b337cfaa70ea@quicinc.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lp35xxqvbjr4igp3"
Content-Disposition: inline
In-Reply-To: <20240610-md-drivers-pwm-v2-1-b337cfaa70ea@quicinc.com>


--lp35xxqvbjr4igp3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Jeff,

On Mon, Jun 10, 2024 at 07:51:15AM -0700, Jeff Johnson wrote:
> make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-imx1.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-imx27.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-intel-l=
gm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-mediate=
k.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-pxa.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-samsung=
=2Eo
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-spear.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-viscont=
i.o
>=20
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Thanks for the respin. Applied for next to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

Thanks
Uwe

--lp35xxqvbjr4igp3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZnL3kACgkQj4D7WH0S
/k7Y/gf+Oi0+dsAnW1E2XuJ43To/HG6xmMhALT1XJIHtAS1SRiuCRQ/KVw0Y07Ik
Nr5ZJapzijm9o/YiKy3vJyMVEjozrO7E3AummZ24ZMBL7Ggz3EroPRAj8+l2v60k
oz7i+Vs34vCraZGsPucTn52EuCnRMBh53fhz6bsKVKtOzNUD33k6c4V/BN9bIHfd
MJpqwTO3ejnSMAUdC6ZPJc7ZTeddyiPi6u/I1UIm43Gud/1XGcnVXx7PL34kwB2R
ng5cjCPGoiBYXfftDskl72+f2upFM5eJfueti5qqlGaT/C+wUxXQG3w5TGadSPmM
00uycs1SX65h65o8xSssTRGIFQtOuQ==
=OGvB
-----END PGP SIGNATURE-----

--lp35xxqvbjr4igp3--
