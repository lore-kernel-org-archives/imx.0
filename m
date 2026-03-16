Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9F83264C2
	for <imx@lists.linux.dev>; Mon, 16 Mar 2026 16:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676984; cv=none; b=ROORO2AvIvbjVJq900RZOhbQmOTXxC9qJDkwi5eEADIHXuMLpM4ak9xlaOr4xGRG814vRwtWbQlMlWmPbLOtN5fZEoCd/ITa7q/tJuIX5zia9vCvhY2PAzCYkx7cnNVfd0+ohv+RDXuWS2e/f9xsCJanb7VVoDAfSexxVrq4D7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676984; c=relaxed/simple;
	bh=JWFlxi2LHIDQFtuhUGbzlyFQ9+QEhBC7dSDu76hq14o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b3u20D4c0xbd7MrMy5FuZZzuYmyOTPsrXs8fYa8wnIBwndbbtbewR6ka8cap3fq6eRR6gfd6+b6QfUky1zX9riucUlY8iSaNCwiX1zGvr2goLYJexvmosEsUd4sUwIVsGiaHUDEhxeF1B3BhkBsa0BO1Kz5/rv0RyJb9lEyXrYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hRov49+R; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hRov49+R"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3587A4E425E0;
	Mon, 16 Mar 2026 16:03:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 023905FC4A;
	Mon, 16 Mar 2026 16:03:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED4941037217D;
	Mon, 16 Mar 2026 17:02:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773676976; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JRFhZA6RpNl4twhrOS1z1aXcDqh2qmtqkiRwKT2JAi0=;
	b=hRov49+RaCqqtbZzX+h/bHw6O8UCuWrYcgIVi8QjLacZ24aXZkMsT1C9bCtKpvWKnAK+fq
	R9iVPicLOOm0VKSiMWSxH7K7h840kqg8bk0W0NVUlp5k1roLJwGkRm8D6kntOlPPwHdozv
	aAU8mPSHy3flSYQ7wYk8rusdEDP9gNdoxKqTtjWiWfSdUTVntiRKOFn8VV3S/AcDI8H1dE
	QokAokBMBuu+aXko55AKaiAo/yO73lOVAkWgJQbo1H7/EC3dAcoS+iaPKIfoNxa7ihptzd
	Zg2BlqQFqpkipOa/url3HS1Si3uWLMrvTxnSEflCC4WyJGRDV93+tSTdl0ycpw==
Date: Mon, 16 Mar 2026 17:02:33 +0100
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
Subject: Re: [PATCH v2 29/29] ASoC: soc-component: remove
 pcm_construct()/pcm_destruct()
Message-ID: <20260316170233.22060df9@bootlin.com>
In-Reply-To: <875x6wjyoa.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
	<875x6wjyoa.wl-kuninori.morimoto.gx@renesas.com>
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

On Mon, 16 Mar 2026 02:27:57 +0000
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> All driver have switched to use pcm_new()/pcm_free(), let's remove
> pcm_construct()/pcm_destruct().
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc-component.h        |  4 ----
>  sound/soc/generic/audio-graph-card.c |  3 +--
>  sound/soc/soc-component.c            | 10 +---------
>  3 files changed, 2 insertions(+), 15 deletions(-)
> 

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
