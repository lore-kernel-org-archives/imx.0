Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51D9612EB;
	Wed, 19 Jun 2024 11:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718794875; cv=none; b=S8WzGa7ZnAWn4+PaLTWPctzcOOZb+NRKnrsfJfAbjckTWzqNdU3RuQ70nCNLBh42qLTcoTti/fafYl30aptXmnQGbyLJeqT4SkQhniLJVV6AAbdc+TDTKP2bAV654xYwQBNAbFMlwf7p1POfuoxGEGi/RRTnsrx18FBtJOoyfOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718794875; c=relaxed/simple;
	bh=wV3LwNiIkukhZS1LfFIfEtDSB8xpDVKZ9+NbICekbT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oo9UnIP/YjzrjZdyzF0C8gZ5FgD1VLi4bF4PGD8C+650FLbRgS0pnrfQV/3zF4tySbJ80gqi1AsSU2cJE496Pb2/4+08dtlY60AjQu0iQXL+PNKaLtXz0fVvFDTA3LriXiIDKjGxIH9bgkpyz/g6GbGdDDR0v4/pbolrIhJokXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fwb3x8y0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fwb3x8y0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C301C2BBFC;
	Wed, 19 Jun 2024 11:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718794875;
	bh=wV3LwNiIkukhZS1LfFIfEtDSB8xpDVKZ9+NbICekbT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fwb3x8y0vt3PQhoI6ECI5rtqj/iau8k765t71XQQ87w34sDFSmKorGgLwfmis087j
	 RCCIL75jZQkMh04MdWBTKIW74y3GDKiFn3J24ffzUGWVds+InqpviRvGnnwRIbUJ0D
	 1dZJKdrq3Rzg1DgVvsOMBZu9+RA7KqnqksmxPteHYpLgykLrp1q8YO/Aa+5aUHxWDh
	 q2tCFNEsvdBYXn9lp7A5Gft6zJ+VN0Fa7wrESKoDz0BJXX4Hc/cPaq4nvgq7dgI+I1
	 10fucWe4lo8FDsF0hKxCcQgRQt8bfi7/P8U/RcjzSSy7y17TDkHOymPFI2JRmjyI1A
	 xsn4kIWtg+CtQ==
Date: Wed, 19 Jun 2024 12:01:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?utf-8?B?IkFtYWRldXN6IFPFgmF3acWEc2tpIg==?= <amadeuszx.slawinski@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Brent Lu <brent.lu@intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>, Jiawei Wang <me@jwang.link>,
	Jonathan Corbet <corbet@lwn.net>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
	Xiubo Li <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org,
	imx@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v5 0/4] ASoC: grace time for DPCM cleanup
Message-ID: <71a31778-5709-4342-b813-75899ed4e90f@sirena.org.uk>
References: <87bk4oqerx.wl-kuninori.morimoto.gx@renesas.com>
 <6bf6adc9-9620-4ace-97c9-7de0cedd7d07@sirena.org.uk>
 <877celwmvh.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d4Pd4HMwg9L5DQDu"
Content-Disposition: inline
In-Reply-To: <877celwmvh.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Don't I know you?


--d4Pd4HMwg9L5DQDu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 19, 2024 at 04:57:22AM +0000, Kuninori Morimoto wrote:

> > This doesn't apply against current code, please check and resend (it's
> > simple-card and audio-graph-card2 that conflict).

> Ah, I guess you used "v5 original" patch-set.
> "v5 resend" patch-set or today's "v6" patch-set should be OK.

Oh, if you mark something as a resend then it sounds like it should be
exactly the same as it was before, if you've rebased you should increase
the version number.

--d4Pd4HMwg9L5DQDu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZyum4ACgkQJNaLcl1U
h9CY0gf9HLsXbwCJULJAm9FlV4eh/DYA7VbD8zXkipHVgvH0XIpxP3UGX+Bsl79r
Zoieqsq8m08fTI7MNaw0TIsb77di3O/LpWoxTfi56fDpBPmWPsS70cv0NO7eL5lb
AJHsWzfAdtzyRT8gUTJoUIimYvB8kwxuEpMhN6VRgIpTYZulN2JiBTfD+XypCdjY
ZCqFYh2GAISbrciQD5SVh0cLI9jkkF2OudyeY4rq8IIPGE8tggGuqDqjpUa79DNB
vyhxa0rCnlfjshMjFHgPfjHVytb7MuzSueN25L5iQvty/q/hzLX7C3dH9d3zRJWm
VFd4p0vPpH3kOL7x1+pzcUmVveO/mQ==
=OSUR
-----END PGP SIGNATURE-----

--d4Pd4HMwg9L5DQDu--
