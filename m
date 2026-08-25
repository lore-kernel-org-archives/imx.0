Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0503E3147
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787646751; cv=none; b=nGvpYtlUQE0FPSPk8839b5dbHhP3fNdkEknU7flzsOvcNMXmbXPdWVqsMQ7J9CN4CLVJ77f7rtFz4fjE5fcJlv0+OXmmuwTUa+dGceqRaPsVKJ8IiSUtTsWQ3zPeuotRbR0osunBObrVpSbxM+xHV68htUwW0ZwVKOsi3UX11LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787646751; c=relaxed/simple;
	bh=BvmmOIR737EjiK/CBJK1dwXBIwsPS1i17yPukRjji44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+VAJxkHUiK4+Oky0Etz2YRUcmhEgGIs92al6D3na43IIMYpF5FEVjtbgWd1hhGV6LITNQ8U3fwH9jWyplawdJLrStaBZcewswNRWmdNGtKiB+WbiDcl1MzduqJXal4vzvic+WPN5rEjcW6TkNmt5xU1bMxa9SkpLduQigsQRDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=i6H0pxhm; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="i6H0pxhm"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c197eaaab00so743298666b.0
        for <imx@lists.linux.dev>; Tue, 25 Aug 2026 01:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787646747; x=1788251547; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lD7UStE/XOr8A5NJ+GnuX9Z5tu/0sy2nS7RxI5FuuYU=;
        b=i6H0pxhmxdj/O1Tq6eX0ggGGa7YNaam/Wg+4r2M3SO6tG8VGpBm6jYn7OmcSdrA3tR
         nCpxm+3UF/OHNiV+Ti+1gfzvNKdtrABBI2c64mCZP1NDWLMH9IxNj1uMxcRSASb4Ryv4
         lo72H3UD0TbVlOHFi2PVApNdbF1h/OF0DBZDNbafYWwSHUFCwTI4Jw4m9b6m4PKkpLMA
         Cvjzl6r0x2ApKF1ad+sdCN9TvvasRa1zQbDI8twtO7GGsDQfzg9Ypz5CS0nwU3PDDAEC
         pDIf4FD0keKA6RbpJD7HwvLRTY8UVuY7FHMY5KOAbs/AOX7lqN7+Wblp1cH3uc+WctPd
         aBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787646747; x=1788251547;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lD7UStE/XOr8A5NJ+GnuX9Z5tu/0sy2nS7RxI5FuuYU=;
        b=d03QFgtv5ZhIpS2D0R+q/82XIQkeqKQLr//6HwP8BQm4py1uIyaFHRaYQfkELdcU0d
         ykuDa9L6MdnqX4fGdJZgczlrBareyz8RNLmtWvdU2VHhQRDOTZ/Jm+AmU4DwJZmGo0dm
         10iQloHhAgDJIiOYCwNNk1a1yLgaP1eQ686jijhgM9SgI43/OKaBZbMzNRtau5dM2Env
         xIyLF0NxxHJDoVVW2NWMf983PBKqQH9JckpyT3LKpAR1ELMOMaXkbecqb9jGErq2UrhV
         3AdOiBU9yDLSPqvBfwHjWKeLjdFYezf7tIPybSOpNJ9rJuHrFQ/NCcfB2jsS7vPBcmUr
         OJVg==
X-Forwarded-Encrypted: i=1; AHgh+RodREE6K2ii69Fc7BiAH2sYocdBbtl9k+Po+F1gpUs5/L4qHMPPSMdOz1cassJn9rPy6Rc=@lists.linux.dev
X-Gm-Message-State: AFuF++lq/UhqYmpKk9rGcDytowVKhX4Nt2qLrm4BuuYspMEY0Az2SHXK
	E15IPFW2j7gmmJ6yidrXPJLX/QV/ZmQiPu+AdixHDDvrgclPsDXgmeEgmfhoYPb99oI=
X-Gm-Gg: AR+sD13ib9mx3KaJPzmHLP0EXi4js+4wS8beA4IHLGned42DqqfHORIExZlsAYy0wzY
	MclqJfAaFasXtJS4aUCrcvshciUSGYH3263JtJD2io3JDwN8taherwJema9j2l+yu6uFGl1tKzm
	Y9q0uLpsMmClsLR9/eWM2aMbhfLpR4oGpBPoDEuF94n+i9HM3beafWXwdWsTpfpiIQZ7ckaModd
	pmHPAJWobpvDprJPdHXV2eF6Ata9J4QL7LIvMAM96gbanAI2C8qlCi8EyzAYHTmfWhDgTiuW292
	sAC86KYViIpJszKRxPx0KYngpmzL/Wn8Q6rEpY3aLPoP7BP6TXiBsgmJTkMyILzUPaT5Bjl+y/J
	nAQ6rrk43WbP7qGVfyeDM6yuR1QOKV8w/mZt+o4ljxZw9wr+ESiCcTpRn4s2Q4VQ2yrCDZL/IKj
	/toDWLkFSLSSC3KIKvWnbDLvYdhwyMD+4KgGh9uq/1ac+iq8hfGl7O7i1/Zfq58G9VzOVo0BG4m
	R5AG8VFZOCZT3wT+f4UGSlDvQO98MJmjl9t9d2UliTasUYtlSDgpU2q+3ZICg==
X-Received: by 2002:a17:907:9445:b0:c21:6f8c:2335 with SMTP id a640c23a62f3a-c24e5ff7a2bmr571761466b.16.1787646746723;
        Tue, 25 Aug 2026 01:32:26 -0700 (PDT)
Received: from localhost (p200300f65f19a904037016a565660d5e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:370:16a5:6566:d5e])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c249686e37bsm1692467466b.55.2026.08.25.01.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:32:25 -0700 (PDT)
Date: Tue, 25 Aug 2026 10:32:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] module: add SCMI device table alias support
Message-ID: <ao1SHx440b6OxUDm@monoceros>
References: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
 <20260820194850.459739-2-johannes.goede@oss.qualcomm.com>
 <aow2GFAfy84k-N2B@monoceros>
 <1bf5984a-d1d2-4763-bb4c-b17ae8360192@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nfxdkmmv4cdosfpl"
Content-Disposition: inline
In-Reply-To: <1bf5984a-d1d2-4763-bb4c-b17ae8360192@oss.qualcomm.com>


--nfxdkmmv4cdosfpl
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/3] module: add SCMI device table alias support
MIME-Version: 1.0

Hello Hans,

On Mon, Aug 24, 2026 at 04:58:43PM +0200, Hans de Goede wrote:
> On 24-Aug-26 14:22, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > I just replied to v2 and only then found out there is a v3 already.
> > There is something wrong with my mail filtering, sorry.
>=20
> Not sure if it is your filtering, v2 is somewhat old
> and I only just revived this series.
>=20
> I'll add you to the Cc list for v4.

If you don't make the mess that is mod_devicetable.h worse, there is no
need. I'm already overwhelmed with mail ...

> >> +};
> >> +
> >> +#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
> >> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devic=
etable.h
> >> index a397213bedac..d241421c36aa 100644
> >> --- a/include/linux/mod_devicetable.h
> >> +++ b/include/linux/mod_devicetable.h
> >> @@ -49,6 +49,7 @@
> >>  #include "device-id/pnp.h"
> >>  #include "device-id/rio.h"
> >>  #include "device-id/rpmsg.h"
> >> +#include "device-id/scmi.h"
> >=20
> > Please don't add new includes to mod_devicetable.h. That header is ugly
> > and each include makes it worse. Just add <linux/device-id/scmi.h> to
> > the modpost source.
>=20
> Hmm, I did that at first, but that is quite ugly also because
> file2alias.c, does:
>=20
> #include "../../include/linux/mod_devicetable.h"
>=20
> So I ended up needing to change that to:
>=20
> #include "../../include/linux/device-id/scmi.h"
> #include "../../include/linux/mod_devicetable.h"
>=20
> my thinking was that the purpose would be to move other
> consumers of mod_devicetable.h to directly include
> linux/device-id/*.h"
>=20
> And keep mod_devicetable.h as a file which includes all
> of them for use in devicetable-offsets.c + file2alias.c
>=20
> But I can see how actually getting there will be a long time
> in the making and in the mean time this will cause longer
> compile times.

Yeah, I'm still pondering a bit if I should start dropping #includes
=66rom mod_devicetable.h or if that is more annoying. Fighting new
includers for mod_devicetable.h itself seems to be a tough task, too.

> So if you're saying the somewhat ugly thing of adding
> linux/device-id/scmi.h directly to devicetable-offsets.c +
> file2alias.c is the right thing to do, then I'm happy to
> do that for v4.
>=20
> If I'm reading your comment correctly, that is what you
> want me to do, right ?

Yes. I agree it's not pretty, but IMHO better bearable.

Best regards
Uwe

--nfxdkmmv4cdosfpl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqNUxYACgkQj4D7WH0S
/k5wCgf/eIWRfjCexiKewtXq3u4X6kYeqNfHxU/aHRvaG2XAS6E+1RPly2vZKqRP
S+yKDqswE2AFauvgqGNf+U3VjCqnf6AQdButjabhaAkBoumLTSz8unOA54k89HjY
ThBXcUmVtt1D5s/rBi0lh/Ak4BpU9pSqJgw4CwLS0P6hESLiGfqhrD0P3E+/KghH
Le7l4PIbYdhN0xCAObN5xv6Hd95e/k3i5+zG2kmjw8VZAHvQ8eixXynbI6Ch0MOV
6TXmQs1gWz+lqtKVk6SSdOwjQFynbbDGAJdAIkys9CxZxwOGSoJyq6rcnQMn5+t8
awDppaPW9PyQKN759eqifr7kB/XR0Q==
=xnLj
-----END PGP SIGNATURE-----

--nfxdkmmv4cdosfpl--
