Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F28C1EB37
	for <imx@lists.linux.dev>; Mon,  1 Apr 2024 16:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711989055; cv=none; b=iSvtZEcuACBj53EXPpOITnBU03n2yaniSEk1RAg45Cu6nfA7L1Yq8HRlYctMaOaZxX1yOihaceIEXS2h5kXorusVale8Ge/PP/eOdRFlpr2HKvs4MrIxku3tqj60sIgQolqGQ2CxjA5Nx8XyBq6x1FinemmXZMPqWP3z7g5IpgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711989055; c=relaxed/simple;
	bh=AczA0vvBlhEgaTyRAAogpcX/Z5MI2QUY4sUERwvz+hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pUTqmpxq0+k5xZwkUniJieDBClpBIFTgoqY8tu+93hQHL029ELMuyQ7eFwEUmpeA74fN8h0bo5LGFC+sinBJKljVkuC2S5OxTZxZMgtbFW00guei9JOLy+B6FgTi1ZMPHPdTipX+4RO15s2h2NHw5XcZW22TN0RUeTfcoZNm3Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ObFcEjHG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ObFcEjHG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711989053; x=1743525053;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=AczA0vvBlhEgaTyRAAogpcX/Z5MI2QUY4sUERwvz+hk=;
  b=ObFcEjHGwb40lU+SM8V7Z/rFMR+R4PRpLeMPz8oVfS1eWpn0+Fm64gN3
   y/Y8f3Dk90f44t/9TRHUqoyCKZBCMqbQG5NHmnY5ZWlvky9pu9stIvfeh
   0YpaH9ugK4yyySCwFikP0/1oOQnDIifW/NTK2g6XTe7DpmGC+4CZX6jIr
   hT9yE0U4z80J7sQtXAPlMrIDoOVSxYpHBHCA1YroubG7UZYzLr/5LVBCu
   0pG8e50VRAGa/XVx38GJ7HJyipKfT/bmKSFqAu9v7as8HUcTwwxP9D1Yg
   mTb2jiLkdSvs4gdCjIRX7QiQ4nNDV1BRg6/f8J9PakWvxuzrP+YKclZ0P
   g==;
X-CSE-ConnectionGUID: 9RnrP/r+Qkeye/9beQlWgg==
X-CSE-MsgGUID: fkxTX2GmSleo/kMMtykqxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="10083806"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="10083806"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 09:30:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="18224603"
Received: from anahar-mobl.amr.corp.intel.com (HELO [10.212.2.239]) ([10.212.2.239])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 09:30:49 -0700
Message-ID: <94a85305-2761-458f-84c9-4d76e59ae11c@linux.intel.com>
Date: Mon, 1 Apr 2024 11:28:50 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/16] ASoC: soc-pcm: indicate warning if DPCM BE Codec
 has no settings
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
 <87edbpudm9.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87edbpudm9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/31/24 19:32, Kuninori Morimoto wrote:
> Historically, ASoC doesn't have validation check for DPCM BE Codec,
> but it should have. Current ASoC is ignoring it same as before,
> but let's indicate the warning about that.
> 
> This warning and code should be removed and cleanuped if DPCM BE Codec
> has necessary settings.
> One of the big user which doesn't have it is Intel.
> 
> 	--- sound/soc/codecs/hda.c ---
> 
> 	static struct snd_soc_dai_driver card_binder_dai = {
> 		.id = -1,
> 		.name = "codec-probing-DAI",
> +		.capture.channels_min = 1,
> +		.playback.channels_min = 1,
> 	};
> 
> 	--- sound/pci/hda/patch_hdmi.c ---
> 
> 	static int generic_hdmi_build_pcms(...)
> 	{
> 		...
> 		for (...) {
> 			...
> +			pstr->channels_min = 1;
> 		}
> 
> 		return 0;
> 	}
> 
> Link: https://lore.kernel.org/r/ab3f0c0a-62fd-a468-b3cf-0e4b59bac6ae@linux.intel.com
> Cc: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-pcm.c | 31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index ac42c089815b..95a5e28dead3 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2796,7 +2796,6 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
>  	struct snd_soc_dai_link_ch_map *ch_maps;
>  	struct snd_soc_dai *cpu_dai;
>  	struct snd_soc_dai *codec_dai;
> -	struct snd_soc_dai *dummy_dai = snd_soc_find_dai(&snd_soc_dummy_dlc);
>  	int cpu_playback;
>  	int cpu_capture;
>  	int has_playback = 0;
> @@ -2817,24 +2816,36 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
>  	 *	soc.h :: [dai_link->ch_maps Image sample]
>  	 */
>  	for_each_rtd_ch_maps(rtd, i, ch_maps) {
> -		cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
> -		codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
> +		int cpu_play_t, cpu_capture_t;
> +		int codec_play_t, codec_capture_t;
> +
> +		cpu_dai		= snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
> +		codec_dai	= snd_soc_rtd_to_codec(rtd, ch_maps->codec);
> +
> +		cpu_play_t	= snd_soc_dai_stream_valid(cpu_dai,   cpu_playback);
> +		codec_play_t	= snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK);
> +
> +		cpu_capture_t	= snd_soc_dai_stream_valid(cpu_dai,   cpu_capture);
> +		codec_capture_t	= snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE);
>  
>  		/*
> -		 * FIXME
> +		 * FIXME / CLEAN-UP-ME
>  		 *
>  		 * DPCM BE Codec has been no checked before.
>  		 * It should be checked, but it breaks compatibility.
>  		 * It ignores BE Codec here, so far.
>  		 */
> -		if (dai_link->no_pcm)
> -			codec_dai = dummy_dai;
> +		if ((dai_link->no_pcm) &&
> +		    (!codec_play_t && !codec_capture_t)) {
> +			dev_warn_once(rtd->dev, "DCPM BE Codec has no stream settings (%s)\n",
> +				      codec_dai->name);
> +			codec_play_t	= 1;
> +			codec_capture_t	= 1;
> +		}
>  
> -		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_playback) &&
> -		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK))
> +		if (cpu_play_t && codec_play_t)
>  			has_playback = 1;
> -		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_capture) &&
> -		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE))
> +		if (cpu_capture_t && codec_capture_t)
>  			has_capture = 1;
>  	}

All that code should be added earlier, and there's still the issue that
all this code is now overridden by the dai_link settings.
