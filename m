Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65AF1482E7;
	Tue, 21 May 2024 19:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716321389; cv=none; b=No/9Gcz6unCVeyhA6DPqzxUG4FNDf834k01Lawp8IjowLrVMDVgA5sD+Q9qpJRghKpM4vw80wXbCYz4xz9GDuQSJNqkAuSR+sT7r9Qf4bpi6yl9w0aVvnDUmQwEkmR0Ia7JIrVPAhqF025WP/6cU3UOWDdzk/E3osuHC4dsF9p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716321389; c=relaxed/simple;
	bh=BhR7n9A/hSqg4/BjNXMPwn9gJKzWQmPCd5l+efcQRkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVjqgGSLzSuPnuLtjfG8zoxTJEv7HlBqLx5EoEh7mGZZG6OmbfXn+VjiWtT+BrVsljIxv9QVWEHZareGOEz+U+IDj3Zo9waPCwc6tzSqRAq52EYm5il9Js9Bf9Q9PbrkdDORzqFxEHrEglZFfArSgwpqS9XaF8OhOllad21vq1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NUmO8bdx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NUmO8bdx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF613C2BD11;
	Tue, 21 May 2024 19:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716321389;
	bh=BhR7n9A/hSqg4/BjNXMPwn9gJKzWQmPCd5l+efcQRkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NUmO8bdxgcWu4thN41iyc7eSn2Nl1fuII0/mdbLdlOGmQQriQsunnpYTXKjbCYNFV
	 IjrQMqOW/AROaYsjg5T+sx4wCif3Y1UzeH4oGRRX5mb9CyVmw1NwFcqy7lpZinO6yW
	 unhi+iwOO/X+ebWKfpGEaljuKq2zWzDNzFA7+VNxSoHIVr58tGTI5Wsx9RodFvr0dt
	 vPDBPoWJqQ8v0pbnLXfW2pxNrEBaeORv8e243hc+KCymNU8mY1EjkBqO5hxUwzhUoF
	 j5j0HL8ahnLqxZNaZqgcMf3mfbjS1GrV154ExctmcnECUhAi7DrQ7foulQVXhWAQYG
	 Zldui32xVgovQ==
Date: Tue, 21 May 2024 20:56:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
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
Subject: Re: [PATCH v3 2/3] ASoC: soc-pcm: Indicate warning if CPU / Codec
 availability mismatch
Message-ID: <37341c4c-3a99-4f71-99b3-efda2d2008e8@sirena.org.uk>
References: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
 <87jzjpe5vh.wl-kuninori.morimoto.gx@renesas.com>
 <77e9221e-05d2-453f-9ce1-ff4a4b53d09d@linux.intel.com>
 <87y184cbed.wl-kuninori.morimoto.gx@renesas.com>
 <7b430ea3-3ce8-4ef9-8440-bac02993f676@linux.intel.com>
 <875xv8c6dn.wl-kuninori.morimoto.gx@renesas.com>
 <3e67d62d-fe08-4f55-ab5b-ece8a57154f9@linux.intel.com>
 <1f8e6e3c-a116-48d8-991f-4184d1eebc79@sirena.org.uk>
 <ec063ea9-3d72-457a-9c73-46c5f5b1f6e4@linux.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="COqvHqSoIZIRRzxC"
Content-Disposition: inline
In-Reply-To: <ec063ea9-3d72-457a-9c73-46c5f5b1f6e4@linux.intel.com>
X-Cookie: Eloquence is logic on fire.


--COqvHqSoIZIRRzxC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2024 at 11:03:41AM -0500, Pierre-Louis Bossart wrote:
> On 5/21/24 10:12, Mark Brown wrote:
> > On Tue, May 21, 2024 at 08:43:09AM -0500, Pierre-Louis Bossart wrote:

> > This is something we could do properly if we had full digital routing
> > rather than bolting things on the side of the CPU<->CODEC model - having
> > these things where we have to take a CODEC into account even though
> > we're not actually using it is one of the big issues with DPCM.

> No disagreement here, these echo references and loopbacks are ugly to
> support with the dependency between playback and capture directions that
> isn't well handled, e.g. if someone starts to capture before playback
> started.

> For now we're kind of stuck, what I would suggest is just to remove the
> extra check that both CPU and codec dai can support a direction, and
> move on with the other cleanups suggested by Morimoto-san.

Oh, I agree - my point is that as things stand the framework really
can't cope with what needs expressing so we need these things that don't
look quite right.

--COqvHqSoIZIRRzxC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZM/GEACgkQJNaLcl1U
h9CbEwf+MX3lQGK6hBcVLpF+lVcF5S6m6ku4LP0SgqRtocRWZXyW/66qCKgj8Bs3
k7c6uA/iYDef1tOTreWMVfWahBd3K+Gd8NXeRJRoDH3/xl/ga9F2FIkLLv6L3FxD
UeP57BQYJbH5gcbMMS833UEKIIzwvyc5zzeYnt/zHq8i3QhwH2/FFwFrY9WuAREY
hiv9ZN3NnLKO3P9AHvmzt0tPwcQcyH3bIWMKTWC+PYNIJIVCprvfXMW5yM2hgyAm
H9b3NE5JE1bpQ6aiTALtNpGWrbpdxR9h++OatHCJX/tSIW4Us2DtMbz8QmSmZ3to
pi8H/vVGJfoJqKn77s/eP4L4D2Lz/A==
=GKWS
-----END PGP SIGNATURE-----

--COqvHqSoIZIRRzxC--
