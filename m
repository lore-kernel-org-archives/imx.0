Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4602018651
	for <imx@lists.linux.dev>; Fri, 17 May 2024 12:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715948490; cv=none; b=O2c5DaWgqwtxOIu7cgepBNSm0eyY5cI8U94ceWK6jhygo+4Eztg8qibqDc+tl6fNA2sviJAm5CaYlBLy9pw30+lBa8gnJjIFmbM65JbhaWvpeRwXmUagU4XtH+Y/ZCtbE8bZ0KsH6oLk8Nbzg98jhfJ2zQT6ssqtuxxdI1arWbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715948490; c=relaxed/simple;
	bh=0zScnIpnsGRX1Oi7eM5XsUx+A0rHJkPgN5WDQ8boGdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VfGXcOG8pBJJvoHOt9D9Q6vfqHBVs6C/cWOE0u0fiJPx7swOPtblL9AwCZ+MnHCdI7WdVCKBRUOv15oscDj4UztOaWofBDWN1LU1hUjN0C+7B9gUWev6eVKrV6ddKEB3T/F9NJXwh7vAYToWa5Q47QUszbqzXeF7hfQN7mAr4Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JCWCVB1D; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JCWCVB1D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715948488; x=1747484488;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=0zScnIpnsGRX1Oi7eM5XsUx+A0rHJkPgN5WDQ8boGdM=;
  b=JCWCVB1DVqfUsZ45CRol/VIaMjQxHIpT7sy2gTRRxP+gkFyxAr8kZKk3
   MuwPJwkfWmAc37r3GXaGOTU/GZhA2A4Rez67urMm3b2U/h62acGNOCbQa
   8SViVIfawm9XjT7AdcqqwoJu+t2cCTjfYeo6YI+XhmJEfgrA2k50cdr6M
   4rnbQMIRD4oQr4W+/VL0opvb72qA5Njxngu0ytd1Dyzrfus0YhL/RLcNT
   jSeN/MGo+Ob+rSHcqQ5EithKKzCRO7qHbUJFZY5Rg+OjDVGDrI3BnIUAZ
   hw8mQGLWCT/pFz7SQzvij5Bv2kaD5fScY6zxQywqygTIlH2iUPUZStGZj
   w==;
X-CSE-ConnectionGUID: FCnGMFReRvOQlWPCuoCLOg==
X-CSE-MsgGUID: DD7QjXU4R5eT0JYWrNT97A==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12310201"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="12310201"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 05:21:27 -0700
X-CSE-ConnectionGUID: zqm/qtSYTs+/hgFOoBkEdA==
X-CSE-MsgGUID: hjS93XpzQb2MxB2ZTGfyjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="32315488"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 05:21:18 -0700
Message-ID: <b9cc6106-4f5e-4fd5-b5f4-bc3ed6fbe300@linux.intel.com>
Date: Fri, 17 May 2024 14:21:15 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ASoC: soc-pcm: Indicate warning if CPU / Codec
 availability mismatch
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Jiawei Wang <me@jwang.link>, Jonathan Corbet <corbet@lwn.net>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <87o79azh65.wl-kuninori.morimoto.gx@renesas.com>
 <87le4ezh53.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87le4ezh53.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/2024 2:31 AM, Kuninori Morimoto wrote:
> Current DCPM is checking CPU side availability only, but it should also
> check Codec availability. But because of long DPCM operation history,
> it is possible that the some Codec driver check have been bypassed.
> 
> It should be error, but let's add grace time to update driver.
> 
> This patch indicates warning in above case. Each applicable driver need
> to update during this grace time.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/soc-pcm.c | 45 +++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index c4d80cad5982..5729912ceff9 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2795,6 +2795,7 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
>   {
>   	struct snd_soc_dai_link *dai_link = rtd->dai_link;
>   	struct snd_soc_dai *cpu_dai;
> +	struct snd_soc_dai *codec_dai;
>   	struct snd_soc_dai_link_ch_map *ch_maps;
>   	int has_playback = 0;
>   	int has_capture  = 0;
> @@ -2806,15 +2807,25 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
>   	}
>   
>   	if (dai_link->dynamic || dai_link->no_pcm) {
> +		int has_playback_both = 0;
> +		int has_capture_both = 0;
>   
>   		for_each_rtd_ch_maps(rtd, i, ch_maps) {
>   			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
> +			codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
>   
>   			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_PLAYBACK))
>   				has_playback = 1;
>   
>   			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_CAPTURE))
>   				has_capture = 1;
> +
> +			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
> +			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK))
> +				has_playback_both = 1;
> +			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
> +			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_CAPTURE))
> +				has_capture_both = 1;
>   		}
>   
>   		/*
> @@ -2850,9 +2861,39 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
>   				has_playback = 0;
>   			}
>   		}
> -	} else {
> -		struct snd_soc_dai *codec_dai;
>   
> +		/*
> +		 * REMOVE ME
> +		 *
> +		 * Current DPCM is checking CPU side only, but both CPU and Codec should be
> +		 * checked. Indicate warning if there was CPU / Codec mismatch.
> +		 * To keep compatibility, warning only for now.
> +		 */
> +		if ((dai_link->dpcm_playback || dai_link->playback_only) &&
> +		    !has_playback_both)
> +			dev_warn(rtd->card->dev,
> +				 "System reuqsts playback, but not available (%s)."

Typo: reuqsts -> requests

> +				 " Please update Codec driver\n",
> +				 dai_link->stream_name);
> +		if ((dai_link->dpcm_capture || dai_link->capture_only) &&
> +		     !has_capture_both)
> +			dev_warn(rtd->card->dev,
> +				 "System reuqsts capture, but not available (%s)."

Same here.

> +				 " Please update Codec driver\n",
> +				 dai_link->stream_name);
> +
> +		/*
> +		 * REMOVE ME
> +		 *
> +		 * In case of there was no dpcm_xxx flag, and CPU / Codec mismatch,
> +		 * follow new style
> +		 */
> +		if (!dai_link->dpcm_playback && has_playback)
> +			has_playback = has_playback_both;
> +		if (!dai_link->dpcm_capture && has_capture)
> +			has_capture = has_capture_both;
> +
> +	} else {
>   		/* Adapt stream for codec2codec links */
>   		int cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
>   		int cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);

