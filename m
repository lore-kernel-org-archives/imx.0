Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D9315A857;
	Tue, 18 Jun 2024 13:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718716813; cv=none; b=V+goFblHFWzZncsaRqNQrTsPLzfLrEAMjOIhZss7MX2fNKh74a6Lh5YE+p9PxZueCusxpnJHWFqsX/dRpzIpdhBjFmTryJIWT7Grh6P0sDOn9QzvC8dCOzjuKbnB4B2LfK+/BVbCl05azrvGuEzhDmhP6IRWzXAOyfpcGEcF4iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718716813; c=relaxed/simple;
	bh=iGI7rBJgHu8DUEHU/uaWXIvRgpjCEyXg+PI+OEEUOBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Djfd+eVvt/HCGTbycfN8wis4xAq3YZnbNqIvWdO6+eCcbEKimaprnNyYF6rUSpBr3f2HPVzg50pO84/M0crvtZtJmh3MwLwtNcIO1slrNZExa2o4g289VeDPVMABJvxeX9HZaxOVuLKt67fTqoylTrdHcsNh0XdFUDvH+yaKy9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YaQRLVof; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YaQRLVof"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE65BC3277B;
	Tue, 18 Jun 2024 13:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718716812;
	bh=iGI7rBJgHu8DUEHU/uaWXIvRgpjCEyXg+PI+OEEUOBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YaQRLVof/ZQnet0TvACOwyCCYrbmTv719c70lp/aFvnFh7gwRByME3Xc6l+v8DKet
	 R3FPcyFypjIlzmjAMiCp4xMKSIQuosdI+lUd4MeNDgX1df9cc3OLCpvKYnq8gt22m8
	 m/8wTmCEEQpu/7DPd+RUqxqKxB7jd5MWU8357PDDNJ9rkv99r/c3Pctz5eLjBG6pUh
	 qBSVkge7YkpreHJ3Ew21CKyXhSMdg5d6xrcv1d/aNrAQX6kOjUZ0+ZjdnVG7wtJr20
	 z4ttEKpGo2IOBn9N795cHmVNPRbEyhfi5jcXpd7OFNUYT5TZEfxVAhhidqPAXcOL60
	 Fbn++5te5qWGA==
Date: Tue, 18 Jun 2024 14:20:01 +0100
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
Message-ID: <6bf6adc9-9620-4ace-97c9-7de0cedd7d07@sirena.org.uk>
References: <87bk4oqerx.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e5HrHBf54JKzRBsN"
Content-Disposition: inline
In-Reply-To: <87bk4oqerx.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: If you can read this, you're too close.


--e5HrHBf54JKzRBsN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 30, 2024 at 01:17:39AM +0000, Kuninori Morimoto wrote:

> As we discussed in [1], we don't need to use dpcm_playback/capture flag,
> so we remove it. But we have been using it for 10 years, some driver might
> get damage. The most likely case is that the device/driver can use both
> playback/capture, but have only one flag, and not using xxx_only flag.
> [1/3] patch indicates warning in such case.

This doesn't apply against current code, please check and resend (it's
simple-card and audio-graph-card2 that conflict).

--e5HrHBf54JKzRBsN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZxiYEACgkQJNaLcl1U
h9CT2Af/TIz3sGLRzIL23jSsjCN+Qsm7udl7I62HN0gip2VR9e0+otYDtGfJcXWp
zrVbznJTkkSt4SsAxfiucjtkhY+1m4IKnMmpSWwlgLqiDJiuFad2qVfWOsY6d+NY
3DNOj2KtwsvBhMpTTvsoX9H1r0iRcU9saFz0Os14iDcjbf2UAOO31vFaAqz8SMlN
05CFIk/QPU7k9iZN6iqrFkXlTya/VOJzGKPEqGq7pQ37+h4n2d6vLv2zCd/6l4at
fCMT2H+VgTGLQOcfA2ifL+q6KRlSm2A0ZIJk98lI2yNWUwEGdSK+Teea1J55K3MC
3ka6NLcUh4KixXZZgooMqJRn2KtHsA==
=Jc6T
-----END PGP SIGNATURE-----

--e5HrHBf54JKzRBsN--
