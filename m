Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965803B7B83;
	Mon, 16 Mar 2026 15:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676632; cv=none; b=oBCEAYGl0vQDho7+hZzWZrpoXMxXDlvOLo3uDbsqrtMoyr4vf9tuVBZrLdJN1iR7Vlioub2/gV1VmpIG13T9yE//5WxFBky89Ro+AtvVVPy1uTY9TVmMaN1v2c9i2uZnMFSbLx2tWblM9jsSRRCmBws6A0yLunBrWF651poq9OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676632; c=relaxed/simple;
	bh=PbKrBXthjNGfFtArOSneEVU2S5ohT/HxHPM5k6fcTws=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QZ0r9IGhUYfyBDK5r32jSf6MRWhU/uMLS44GqR/g4gB2yT790vZpVokgcl1+dZ6VpqSa4nKn01WGqH1e7eH5V9EwZasOaM0kqevPfKleVLSqQJ3n+IhwRQ1w4THbbukVh0N2lfrG1GxsZ8rV4VtqW48XCEXhMq7dhcoDErh5aRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=F+wuM52t; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="F+wuM52t"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A108BC55044;
	Mon, 16 Mar 2026 15:57:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD4A66004F;
	Mon, 16 Mar 2026 15:57:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D680103721F0;
	Mon, 16 Mar 2026 16:56:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773676624; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gPWg45628wXOGTSku2sZt3UN9TbvmDc1uinjnNPjXiQ=;
	b=F+wuM52tfsJOst/pUkIjwdenzlZY0QftTQ/4NOcFwfqocdMH+NJh258BZnrMoKeqLFNMEN
	bc/L1DGDGBOGFcp6+xGMrdsjDhxpeU3BPexd032tb2bOu45ca1ox4QhIawUCc6kJ+bA9VX
	oPm7oNiLCUTiYQCqCHB3fegsu43UgYV3WkEKQGcGp0ATgB7Uei6Cs5z4mzzsVUCjPaNFO9
	bKAx3EK1UM87DtIQX3KE3czU4JqXiKI0pEai0IcEfkeyeuv+wzPiiAq6ziT/0PdsYdWFbD
	JdtYjZRq09Tc1bq2iZhxGh7dMNzhhgNtvzkx6mw29MT90ATt/4M2/hLnjYz6eA==
Date: Mon, 16 Mar 2026 16:56:37 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Martin =?UTF-8?B?UG92acOFwqFlcg==?=" <povik+lin@cutebit.org>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrei Simion
 <andrei.simion@microchip.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Benson Leung <bleung@chromium.org>, Biju
 Das <biju.das.jz@bp.renesas.com>, Cezary Rojewski
 <cezary.rojewski@intel.com>, Cheng-Yi Chiang <cychiang@chromium.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Cyril Chao <Cyril.Chao@mediatek.com>, Dan
 Carpenter <dan.carpenter@linaro.org>, Daniel Baluta
 <daniel.baluta@nxp.com>, Daniel Mack <daniel@zonque.org>, Fabio Estevam
 <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Guenter Roeck <groeck@chromium.org>, Haojian
 Zhuang <haojian.zhuang@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Nicolin Chen
 <nicoleotsuka@gmail.com>, Oder Chiou <oder_chiou@realtek.com>, Olivier
 Moysan <olivier.moysan@foss.st.com>, Orson Zhai <orsonzhai@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Ray Jui <rjui@broadcom.com>, Robert
 Jarzmik <robert.jarzmik@free.fr>, Sascha Hauer <s.hauer@pengutronix.de>,
 Scott Branden <sbranden@broadcom.com>, Sheetal <sheetal@nvidia.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Srinivas Kandagatla
 <srini@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi
 Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, Tim Bird
 <tim.bird@sony.com>, Tzung-Bi Shih <tzungbi@kernel.org>, Venkata Prasad
 Potturu <venkataprasad.potturu@amd.com>, Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 01/29] ASoC: soc-component: re-add
 pcm_new()/pcm_free()
Message-ID: <20260316165637.7b09fa9b@bootlin.com>
In-Reply-To: <87a4w8lde4.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
	<87a4w8lde4.wl-kuninori.morimoto.gx@renesas.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Kuninori,

On Mon, 16 Mar 2026 02:24:43 +0000
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Because old pcm_new()/pcm_free() didn't care about parameter component,
> to avoid name collisions, we have added pcm_construct()/pcm_destruct() by
> commit c64bfc9066007 ("ASoC: soc-core: add new pcm_construct/pcm_destruct")
> 
> Because all driver switch to new pcm_construct()/pcm_destruct(), old
> pcm_new()/pcm_free() were remoted by commit e9067bb502787 ("ASoC:

s/remoted/removed

> soc-component: remove snd_pcm_ops from component driver")
> 
> But naming of pcm_construct()/pcm_destruct() are not goot. re-add
> pcm_new()/pcm_free(), and switch to use it, again.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc-component.h        |  4 ++++
>  sound/soc/generic/audio-graph-card.c |  1 +
>  sound/soc/soc-component.c            | 10 +++++++++-
>  3 files changed, 14 insertions(+), 1 deletion(-)

Nothing more than the typo,

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
