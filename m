Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4BA1F176;
	Mon, 20 May 2024 14:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716215458; cv=none; b=NdoUIOCbbmLmpzvj7ieCtUFaaxfQv2TPJdfMBuQEIM8u1r3Z/aXgQ3lEAWrOQW/NNeMPhs3Da534gULY4fIUFPFRxpY8BNSx+L8DHH4lIee0Y+wxuE/WlmglZ1javrScUU/yjiC7WacMSfTRl7IxeVrQ8NzFWuAdwPtmaux7B+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716215458; c=relaxed/simple;
	bh=SA50Fidzaz+mQH+bd4BSpNCTlc4jQcQBqvPT1vMijp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvbYrqZjVSqz+Q7ipG7djgZK5UI9VhCI5Ut5qXOrtoXSkH8Q2Suc1YlqVDVn3SD/4s2OgIBgAcHNCGWUnXwsxZKu3eVhevUzzGGSAJTf4lM8yyuwxv14wGAFe81yNqmeQUMynq14MGtamwv4zvLg+H3Es4zaY/dodtGCj8VlEYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fo3XfVq+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fo3XfVq+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56422C2BD10;
	Mon, 20 May 2024 14:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716215457;
	bh=SA50Fidzaz+mQH+bd4BSpNCTlc4jQcQBqvPT1vMijp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fo3XfVq+o7CD87oXYLqm9K+VV720K+jMHJXMdVFVb/dscRtHBFfgzLA2W3r/5Bwev
	 eUJyoTIydmqZPJNXNnr1Hi5EdMyiTs82P9BbIutCWzKt6okW7n6Jg15hFwzJ58CCIu
	 9loBZGTMh3ksvs6U98dsUMnBuHPlnIbnvuivRuzroBTPl3TN9q/HDMYX5IDmxJna6v
	 U7xhOuaEbhE0sGEYeKDbqO9sS7GN8dyd4oyp+JmDi2oNgCtVaTIApuvPmfI3npgJKG
	 reFcJoEBpvP7F9pffC69yjZa5fOZEZmokxVJv65n5g/jJ+odqHZSD4KVgO155TYqVN
	 OmeSSriog0vKg==
Date: Mon, 20 May 2024 15:30:47 +0100
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
Subject: Re: [PATCH v3 0/3] ASoC: grace time for DPCM cleanup
Message-ID: <c2ba9a4a-0e01-43f5-8490-10aea6de72c5@sirena.org.uk>
References: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mdhF2muS7x2E9waK"
Content-Disposition: inline
In-Reply-To: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: We are what we are.


--mdhF2muS7x2E9waK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 19, 2024 at 11:30:44PM +0000, Kuninori Morimoto wrote:

> v2 -> v3
> 	- tidyup typo (reuqsts -> requests)
> 	- add Tested-by on git-log

I was kind of expecting Jerome's patch to get integrated into the
series?

--mdhF2muS7x2E9waK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZLXpYACgkQJNaLcl1U
h9CfQgf+LcB+1TKTBBA4hHpYhXN55tgh5Tu/21cm4fdCMW3GjrjcSq4zBWcQEI71
fgrl9ssXbVBDhI4FVPBaPgrwXl7cbf9CfDjnWrXhja7OiLrQjILTZI+lz17mg82b
9bBgi7vrB5m23qpjzRf+UwT7ykNyTCUMI/OMSSOsIsRXNmBD87QPPvwaWESi9Xhp
AjUgzqMDOJ7/mjU/LL2ecau88tEoBNRSB5D1XKlCh/EFqnElQGiaYRtJLEjHVE85
/4Jl0B0qL571d4qhJRaR42NBKO4v5tPb10baDaCu4d6qnN0kb6kT8WqeFkUHpY+U
gtCaVVyxvsVNnoCkyMEauISRQmD5VQ==
=/+yS
-----END PGP SIGNATURE-----

--mdhF2muS7x2E9waK--
