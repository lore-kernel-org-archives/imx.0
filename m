Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5887C249E4
	for <imx@lists.linux.dev>; Mon,  1 Apr 2024 16:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711989047; cv=none; b=ZJh3JvZPQNvYH4JLA1mQrGXtn1Tm117cdK8Cl7dZlwNMYH6Xf6Kth1Qnz9z7YiM9LkcSXfcU5+fBHlXDCT/6T1QtiJ1IACXy93cbCbkh+7E7tKn6tSPVKaP+Y2JWqWRgII+Gp3RVPre6wQmQKumAJmKD97V58hWfiLz4Piwsjx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711989047; c=relaxed/simple;
	bh=X6o+CiRuRbPSoFA1uNV4CraaV9Ro04bAs5btj8iowP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=etJlMpEoYBpKKN1OHVT2yVT3x+sidp8u9KhCbMpfrn/JRPj1C9F2VIR64lmSs/ka1siqDnwiMZM//42CsejJJZKGyu/tRotoolsxt2MWwk5DZ6tbqFiceMQDkt7ICRw6TzZY34LDxvNB/I350HNfVqZIQpuqB4ngDiGyalKyv2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fldC04eF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fldC04eF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711989046; x=1743525046;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=X6o+CiRuRbPSoFA1uNV4CraaV9Ro04bAs5btj8iowP0=;
  b=fldC04eF+7QwaiTDUeHTA4MiEuHBmtHeuLOrPVccXP+3gnlEdNHwkAmm
   fT2aRCjd7ihHmFXgezckpNUB6nH1b++wh6uaVO4ODCrjswQaqBJ3nYoWE
   ZtTiXMgUGrgveZl7Kk2Feup2NNHkIzCQ8ystZ7jKnAWvMZDTsIBU00M/y
   KfUU6myRnlKwo0D/30dEGScoI/UqNxZiM6cnk8IoNBsBug6J1PZvhm3u9
   vz0eMlaWchd4MX/GCcxIlQDWZRD1RjKKZJ7RnzTL/kMA0bYH+5Zb+Pbbe
   OMl5KWCieZiZXHwxxi+Tc5Qb/b1DHQX4ptLeFCvRQGCQPbRJIqZu1nflm
   A==;
X-CSE-ConnectionGUID: cRGw1joEQuqBBbPHlpvD1w==
X-CSE-MsgGUID: lEUgQL+ASSebogFfbK26mw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="10083747"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="10083747"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 09:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="18224587"
Received: from anahar-mobl.amr.corp.intel.com (HELO [10.212.2.239]) ([10.212.2.239])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 09:30:43 -0700
Message-ID: <1a42ebbb-1e1f-4ecf-a1ec-7af292f7ff96@linux.intel.com>
Date: Mon, 1 Apr 2024 11:22:07 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/16] ASoC: soc-core: Replace dpcm_playback/capture to
 playback/capture_only
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
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
 <87msqdudn7.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87msqdudn7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/31/24 19:31, Kuninori Morimoto wrote:
> soc_get_playback_capture() is now handling DPCM and normal comprehensively
> for playback/capture stream. We can use playback/capture_only flag
> instead of using dpcm_playback/capture. This patch replace these.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---
>  sound/soc/soc-core.c | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 3ab6626ad680..b168cf642092 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2000,25 +2000,7 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
>  				dai_link->platforms->name = component->name;
>  
>  			/* convert non BE into BE */
> -			if (!dai_link->no_pcm) {
> -				dai_link->no_pcm = 1;
> -
> -				if (dai_link->dpcm_playback)
> -					dev_warn(card->dev,
> -						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_playback=1\n",
> -						 dai_link->name);
> -				if (dai_link->dpcm_capture)
> -					dev_warn(card->dev,
> -						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_capture=1\n",
> -						 dai_link->name);
> -
> -				/* convert normal link into DPCM one */
> -				if (!(dai_link->dpcm_playback ||
> -				      dai_link->dpcm_capture)) {
> -					dai_link->dpcm_playback = !dai_link->capture_only;
> -					dai_link->dpcm_capture = !dai_link->playback_only;
> -				}
> -			}
> +			dai_link->no_pcm = 1;
>  
>  			/*
>  			 * override any BE fixups

Not following this last change either, the code used to be conditional

                        /* convert non BE into BE */
			if (!dai_link->no_pcm) {
				dai_link->no_pcm = 1;

and not it's unconditional

                        dai_link->no_pcm = 1;

It's not clear to me how this is related to the
dpcm_playback/dpcm_capture removal.
