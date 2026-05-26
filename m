Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3971B30F80C;
	Tue, 26 May 2026 15:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809687; cv=none; b=YHOkSo/b/AUi6FuMXJQKZAlNtcIHAhodis7g63Q1GJ0FKX6UD2chK0M56bHZ+f7n4GI3GaeYHi8fUSbP/Xu5qNwSRowoaBCMIeicvxDFZATN81DAAXjBodyAbdQQ4CjAFUp0VN3FnjSoeTQVwNtAmlk/vBIClT0RVx6SP0v67o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809687; c=relaxed/simple;
	bh=E79158MvxGreWA6gb3I3ClURfhJ6QZHv2Py6tZuQVOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDZx27paq8BBJ/FfdLqGymD8xI5TvW7lv7ARvpAVN3qoFZyq2x1oxfSM9C+6N5ZI49ePlEduQTcyTArCpaXp2y1upG8cyT5mPoMGt5f97WyRHPTeFshbEGMOXaU5auz9D61HygSqVxgOnhTEFx3EX6nTp21vGqnr96WSH8aYhHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXKpyi0T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXKpyi0T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A3091F000E9;
	Tue, 26 May 2026 15:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779809685;
	bh=NZL5JxJsiTCoCm2lKtnn2UECrdAHXWzTP8LDNGKPBMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QXKpyi0TZD8Tcj6Q9+hRh1av4YyrjQoxXv7CHD4/qNsbUk/ZxWHo06eRo8VBF3JT1
	 sMyvxnW7II4T8lcikr/B+TmGWjrzoYWgH2PMwi9iHP+FXQr4JhiHhm/DrfaP/7CbUH
	 FA97D7ylMEgiY48ezmMEMtzNc8qbEjdjcIxzTutaM7eq+LCv2QK/Z3RW8o7n9hYmeX
	 +XTqXY9WlIFVga7LWVXtH1NOED7HsaqI1KFOYUefmch6iQlQMiOWPnUlCJckR+6e0s
	 82bc1ONsQn9M5lUdZEV5lfqDp2eRwsMk+DDsVtGnKhtwT/yZWn3LxcAG5Y6AuplxDC
	 xKgafFy1tOf2A==
Date: Tue, 26 May 2026 16:34:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
	festevam@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz,
	tiwai@suse.com, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] ASoC: imx-rpmsg: Support headphone jack detection
Message-ID: <1f4d888d-7c1d-4ea9-9357-e8424bf9ba40@sirena.org.uk>
References: <20260526053815.140008-1-chancel.liu@nxp.com>
 <20260526053815.140008-3-chancel.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NyFsfh5e6+CEA30G"
Content-Disposition: inline
In-Reply-To: <20260526053815.140008-3-chancel.liu@nxp.com>
X-Cookie: You are fairminded, just and loving.


--NyFsfh5e6+CEA30G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 26, 2026 at 02:38:14PM +0900, Chancel Liu wrote:
> Add headphone jack detection support for i.MX RPMSG audio cards.
> When the "hp-det-gpios" property is present in the device tree node,
> use simple_util_init_jack() from the ASoC simple card utilities to
> register a headphone jack with GPIO-based insertion detection.

> +#include <sound/simple_card_utils.h>

We need to ensure that SND_SIMPLE_CARD_UTILS is selected.

> +	if (of_property_present(np, "hp-det-gpios")) {
> +		ret = simple_util_init_jack(&data->card, &data->hp_jack,
> +					    1, NULL, "Headphone Jack");
> +		if (ret)
> +			goto fail;
> +	}
>  fail:

The interaction with deferred probe is a bit fun here, we're doing this
after registering the card which might defer via unbind_card_list now.
late_probe() might be safer, everything should be mostly up by then.

--NyFsfh5e6+CEA30G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVvY8ACgkQJNaLcl1U
h9C4vwf/ajjHtHHhwPmt99KXLyiz8M117WQigkzPq5aOFos1o0Q2SFypW9w7t5mH
PCYraLdPYViSdlibqfXT1fnGrZmvK4Q6xrIphv+FNZakAeEoU/Sm9yKjVMpP11l+
bZrhqp6WDUMfgLsZOCmRCwsJDolW+ZN1OWHHk2vROMGve54/FzP9NXgU+BHkuw3n
7uINB550fzB6XfEMNyifdUxVCfdolaOFmbTEp/NUbQ3pYC20prZQb2jDDmN/jvcq
GHByGL7MqID2+G5snfxn5yjOhcgsw2S7kXHlSK+3LFxR4MP1VNAdEauzXD2gXv2e
9jieq1ygWvOXB5BIqgsLjPS3zrVa4A==
=4uBe
-----END PGP SIGNATURE-----

--NyFsfh5e6+CEA30G--
