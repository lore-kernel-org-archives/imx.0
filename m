Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80321BBBF5;
	Wed, 14 Aug 2024 17:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723655869; cv=none; b=pMBWl/ncBJwsP9KAx30I5R65+FMKNS3/MhXYxLY9ahps09JTZt9e+IXziY2d5U3kDFr+791Ck/PWx76CcAR+ihpX3sUi89a6LckCZHQnQVGetdpagExX5Ul/SaFyZ7pYRz9MKo1mzRJLVzMY7IHqrt7ak1AdnRaoISV4tT6dP4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723655869; c=relaxed/simple;
	bh=rEu6m51mLJsHkqucNBcJN52s3Hg6hddb6JHwXoo14DE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WAnsX7cX3GuBn9lMsqjY3lR5r2DnNAr7wFtNIVO9UmWjk42RmSS94H4JISeuwmHafySLRGpJcbABvot9FclIMtMxnTyMkQ4oOMs+0U4q2mTZX//clTJbNFLLeyUgop1WEOQtazEp/5iinOfPzFIy+aTnT/4jlkhCZ+IYzCFxJV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HX0XUif2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HX0XUif2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D792C116B1;
	Wed, 14 Aug 2024 17:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723655869;
	bh=rEu6m51mLJsHkqucNBcJN52s3Hg6hddb6JHwXoo14DE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HX0XUif2hk6qIfYgBbAgNWpnkg2Dw79rOq1FwuSNt565wB2DozWNVihe5nxgx5MI5
	 /QE40/IiQ6Vuj0TQlv37+ICQZmbYjAxhAqgh0jPedSbqra8pdx2201iy30Y7oIkEBJ
	 f1503gFLBO1xDTwP1MsxMoDT4XxLnoM8GKBONT0SjiDBU23dS0Q3H8HvIAI3ExuFum
	 dWOxMSJ/EMAILVRIgDZgTalVPXpRm8XyDq2zrV1dCiEitot4djogaPg4DGs++YJNqJ
	 az2LKk8+OF3y7HWGQDB09aLV/btb3gDguHfXlqPU4WA04ZXvmBtK+3XJ+spgxCT6fz
	 wcLguZYUd4IpQ==
Date: Wed, 14 Aug 2024 18:17:39 +0100
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
Subject: Re: [PATCH v7 4/4] ASoC: Intel: sof_sdw: use playback/capture_only
 flags
Message-ID: <ee24e5e3-06e6-4b74-bdbc-2127ca3f181e@sirena.org.uk>
References: <87cymvlmki.wl-kuninori.morimoto.gx@renesas.com>
 <877cd3lmid.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HvPVidfg2tXyw8uc"
Content-Disposition: inline
In-Reply-To: <877cd3lmid.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Disks travel in packs.


--HvPVidfg2tXyw8uc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 01:03:07AM +0000, Kuninori Morimoto wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>=20
> Prepare for removal of dpcm_playback and dpcm_capture flags in
> dailinks.

This seems like it needs a rebase against my current tree.

--HvPVidfg2tXyw8uc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma85rIACgkQJNaLcl1U
h9BNpwf/R/W2jVheMM7Go8zARx5qE9ZAxy04R0yuJIsXG9C42Qyw/FnB0k9GMFY5
vf3an9eEz6BQD5f6P6XZtqVzkugi9vqxI780U1xY1M7+FLqGmrGho6owrVZTirvP
wU1zMfj/KP5uXD5L3bLdirMAtr42gdV37iMetexlscKe/ldia8BLlxj+33FPbqU5
zXZ7wt0ywVjJ8tRIqBqJ2i30kw7BLuh0nsEdEVrESTxHJExY/iMRJh3MnjGGvo73
UKhTKqkaypgB0xqP+8uQs8Q3YIZD4l9xqmAB7NmihOPsIPTE8zqpUid1f63gh7jq
gi4ZnZChkxWlvL7qOVO73UpVl/L7hw==
=4IqZ
-----END PGP SIGNATURE-----

--HvPVidfg2tXyw8uc--
