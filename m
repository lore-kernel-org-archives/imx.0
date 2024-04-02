Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CD585639
	for <imx@lists.linux.dev>; Tue,  2 Apr 2024 14:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712066688; cv=none; b=T3HJaNdrlGr74NYynVgug7MmJaSkm3Q0P7fczVr7bED4vgohK6z97ChoAgh1zYX2LT1JY3S54qIckWWIam0763xjjcT24eoO1i75Pht9Q3926am3+1yDR1JLdryHYywlB2inrvoLZMNtRzViofM+y4T7C/2pIM7ht2qVTmeOJkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712066688; c=relaxed/simple;
	bh=B/oDAGN+zjg91RMbs4nINoQUVzqt8+57JpoK0VRIYFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ksS82KtQvGASD0GHiMeBA+0EykLd7GI07gEdfdOgDENnDKm3m8HX+paVV7KeXPVOwWA/X3fB6oINVX0WoFUz2QpyLvoPwTA6Dz0B7EebWYImOWNSDvTgMMI+oZPD4KiZs8JjHFZHYg4Z9EypVkUoYG0uaZNC50FoL02RVfrugNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F9uh1YlN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9uh1YlN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712066687; x=1743602687;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=B/oDAGN+zjg91RMbs4nINoQUVzqt8+57JpoK0VRIYFA=;
  b=F9uh1YlN/KG1nee7ZcY2cOSQu3unM4GItBKjy3eAGme7ug/eXj7cdYLr
   WRAYp4BVQyt7Dzf16qF86eGmIApRUtd7CRMKwSLrUxMXHBmokLsYyWGmF
   W6qFTT908A67fF1338LgJekIaTZedVuX0NX8t6cPDXvSRpKIEEBWC5zDy
   ng9f426jcrY7YqjzbLuUhZG/p1mYc5heqA2hnOPeNvuJxQ/gismE7mJg3
   PG3ZJfZAq6uZFXKLa2Set4jXTeeBG2M8Iy15a89KZ9NBMs/KoENZO3OZn
   KqH0WEP3+3jBUQsueoPxsOkzQtoYNxKG+1miZDk5973KxGzTGvPp7l399
   g==;
X-CSE-ConnectionGUID: yAWP8QRES8241KOVNz7PxQ==
X-CSE-MsgGUID: anUy3BFyRCmnNmRUOLpVeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7079712"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7079712"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 07:04:46 -0700
X-CSE-ConnectionGUID: j631GgZBSPWk9Tr6MaUbvg==
X-CSE-MsgGUID: RS3FGhSFQRC5DVEGrLhdJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="18052994"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 07:04:38 -0700
Message-ID: <25c75790-3866-4e48-bf66-b5406df6e707@linux.intel.com>
Date: Tue, 2 Apr 2024 16:04:35 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/16] ASoC: Intel: Replace dpcm_playback/capture to
 playback/capture_only
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
 Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org,
 imx@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
 <87r0fpudnq.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87r0fpudnq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/2024 2:31 AM, Kuninori Morimoto wrote:
> soc_get_playback_capture() is now handling DPCM and normal comprehensively
> for playback/capture stream. We can use playback/capture_only flag
> instead of using dpcm_playback/capture. This patch replace these.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

...

> diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
> index b94835448b1b..34a9b2e52451 100644
> --- a/sound/soc/intel/boards/sof_sdw.c
> +++ b/sound/soc/intel/boards/sof_sdw.c
> @@ -1151,8 +1151,8 @@ static void init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links
>   	dai_links->num_cpus = cpus_num;
>   	dai_links->codecs = codecs;
>   	dai_links->num_codecs = codecs_num;
> -	dai_links->dpcm_playback = playback;
> -	dai_links->dpcm_capture = capture;
> +	dai_links->playback_only = !playback;
> +	dai_links->capture_only = !capture;

Above seems weird? Should probably be:

	dai_links->playback_only = playback && !capture;
	dai_links->capture_only = capture && !playback;


and while at it, I still wonder if it is best way to go about this 
change, because it causes problems like one above due to need to do 
boolean logic to know which direction is enabled. I would just modify 
struct snd_soc_dai_link to have fields like:
int playback_enabled;
int capture_enabled;
which would be far more understandable. And if we don't want to have two 
variables then perhaps something like:
#define ASOC_ENDPOINT_DISABLED BIT(0)
#define ASOC_ENDPOINT_PLAYBACK BIT(1)
#define ASOC_ENDPOINT_CAPTURE BIT(2)
#define ASOC_ENDPOINT_BIDIRECTIONAL (ENDPOINT_PLAYBACK | ENDPOINT_CAPTURE)

struct snd_soc_dai_link {
	(...)
	
	int endpoint_type:2; // see ASOC_ENDPOINT

	(...)
};


I like the idea of removing the duplication of variables, but if we are 
trying to simplify things, let's try to not complicate them at the same 
time.

Thanks,
Amadeusz
