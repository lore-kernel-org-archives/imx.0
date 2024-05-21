Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A33143890;
	Tue, 21 May 2024 15:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716304374; cv=none; b=aGt1H264A6QT809bc2p0FCpNcO6RxbEo/7DolBO8oXyPD1fed0qWvUwVYLaT0pQWcQb9CP8kusT9by2pBnJAj8qnBZvleViCYD/LyOKfGHcXsldgzK8AdQqd1fuAjMzFkPafdL5r6mAefE5P54jt4HVEukQ9/7ymD1+Z3S6by30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716304374; c=relaxed/simple;
	bh=gwzm8gYv8P6IYrQiWO8fD3QwjoBID6lrcbsigknNT9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CcW+85LCWAAVxsj2wM+fIIA9z2wlCeel/6cjEU6KVh4i8vMk805X0wn2ooukxDiZ8AH9cnUNY2/My3Cz43nNUUWq5WYYsPfs8netABTA0uKse/DLh3VCUH5QyL5IKC1zNf3PRS89Ss6ATREqnVf2eL0F/pXry5E3+62M+laKxH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pFQKgmI8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pFQKgmI8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850C3C2BD11;
	Tue, 21 May 2024 15:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716304373;
	bh=gwzm8gYv8P6IYrQiWO8fD3QwjoBID6lrcbsigknNT9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pFQKgmI8fZQmR3X2wWT5+znBzGtX7oIU07rSTYW8weSCst+9eb2MeisG27oFiEgeU
	 UrGZ3Wel3StymxOt9CVZguX2OWDz42J77okxSGqY+i7vUiU6q9kDGhR91AVJRVZYqi
	 KXvIS4LRWu23oV9F0gd71JtzzT4NvFrYwJfOHDnek/JSWYtvQjq33UQqSKuVaPDD5/
	 b4CCvtWVtJ0/pHCPRupYO6uFwFNKBIMAdscugU3JRV74/0pfiKLi5VNftmBl/aOzWz
	 j41gJee/nqJKBiPVPO+00+P4zKrJ8PyFUvH6zNS8t/iSswsyUrjD36z+mpI7AxVsSK
	 xmwErKjp2+RLg==
Date: Tue, 21 May 2024 16:12:42 +0100
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
Message-ID: <1f8e6e3c-a116-48d8-991f-4184d1eebc79@sirena.org.uk>
References: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
 <87jzjpe5vh.wl-kuninori.morimoto.gx@renesas.com>
 <77e9221e-05d2-453f-9ce1-ff4a4b53d09d@linux.intel.com>
 <87y184cbed.wl-kuninori.morimoto.gx@renesas.com>
 <7b430ea3-3ce8-4ef9-8440-bac02993f676@linux.intel.com>
 <875xv8c6dn.wl-kuninori.morimoto.gx@renesas.com>
 <3e67d62d-fe08-4f55-ab5b-ece8a57154f9@linux.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FlFpgoAWr8SBAUi2"
Content-Disposition: inline
In-Reply-To: <3e67d62d-fe08-4f55-ab5b-ece8a57154f9@linux.intel.com>
X-Cookie: Eloquence is logic on fire.


--FlFpgoAWr8SBAUi2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2024 at 08:43:09AM -0500, Pierre-Louis Bossart wrote:

> allow me to give you another counter example, beyond the AEC reference I
> mentioned earlier. It's not uncommon for CPU DAIs to have loopback
> capabilities, which are used for tests on boards where the codec has no
> capture capabilities. I think it's a feature that needs to be allowed,
> not a 'wrong setting'.

This is something we could do properly if we had full digital routing
rather than bolting things on the side of the CPU<->CODEC model - having
these things where we have to take a CODEC into account even though
we're not actually using it is one of the big issues with DPCM.

--FlFpgoAWr8SBAUi2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZMuekACgkQJNaLcl1U
h9DXkAf/eKMKj9h8NR0eOAHhBEz4f302YpC54diLp0fUojlrg6wrqu+2jlSPQoT/
HWwDANuUGnWfWOOZVMge1aR43syvN4Qy6O8VBKwSy+1xDmgKOskO0zhC6p47NBlH
R99K+UmqxzXeoUmY29epW66azaj+q0MJXMla5WqiaaylWCV4tsyNCwIosHqaj5c/
kjfB+wibx5JXQRQfVRJtq3ajHSGuwDZV/yysCObfkoJLcvRbjEWF86aMFHNoycCe
5GNB1TsJYSOyP0qKGpBgBUGtN+IlBH/oSFk1A3y0a6Ok8CbHdEpe6FpNgzHAvI2v
SBMQmUSZ9dNcTTF7FDUo/45LZrXKng==
=EuNB
-----END PGP SIGNATURE-----

--FlFpgoAWr8SBAUi2--
