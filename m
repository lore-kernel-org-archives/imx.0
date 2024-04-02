Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16198146A78
	for <imx@lists.linux.dev>; Wed,  3 Apr 2024 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712148632; cv=none; b=M4YAZnLvAWRq0/lIGq27jzvuKOZIRSns8iCZ7T1xYXatEE5R7mJqENPAIjgkrTG1SkSqICx1OmCne+FlhADqtU28nJMLMOOzfHPyrLQJdDQKC1nJHtTMj9qVkta8gxpnpiEtZ4LaB5X68fBQDsaG60sd499tj4C+lOACQnbqJgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712148632; c=relaxed/simple;
	bh=Yd/6Gbpag1vTI2OOLqRqO6ZI0sVmA5/QE1SmwNXPKsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IuZf02D7bloO8AAzCJtE+xqpBLfI3PlwaUmUkjiuJoZhJSK6m1sYdxBdNiGboyopWcjEWH53GbnWiXhvar+nmya8vGyXmTioU85Agt4uPZBJIEfD+GiLt4D6MVUvBVaJbDR6LP1Czg6kVL47++UEftyHA2qK63UDMN2zc4ybaP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSt1qLNA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSt1qLNA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712148631; x=1743684631;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Yd/6Gbpag1vTI2OOLqRqO6ZI0sVmA5/QE1SmwNXPKsI=;
  b=ZSt1qLNAu5LL0c7g9HmKgrl2KVLotY+yrNmsqqlvvzWFo5dVzn7VHfiT
   eW+rgvN/CQVTws7qw7ZOBC4M7Q3WDsK5YuAxTsR+oUMkMVaaZG4oJND/v
   bVD93EruBxkBsNO2w2IuessEodXfGN5qu3UMMrkX85LD4y1+S6PltwB7W
   yG6K1XGsgW9Mc6wz3I4svEvAo29hTTNosvGHjKpkuGgeaE69+Sv0aUoVC
   FjhbdKg8qw9tnjMfV9CrGT9KJjK2Wa8+VuWvVHWr5Qyivl9d+Q4yKY+fY
   nyyRNVG6AQ+d43PvIbz3hUB6iybUdD2tUC8oT6oK43izKclM7+NIXWVxg
   g==;
X-CSE-ConnectionGUID: Zg/oOfeFS/+1GRKZo2CHBg==
X-CSE-MsgGUID: SonOu8wlT4O/+vDI/6nIXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7539355"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7539355"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 05:50:31 -0700
X-CSE-ConnectionGUID: A39AzG6RQqGoBfvyRqzbOA==
X-CSE-MsgGUID: tuUeZuvUTk29WVSEVJrlRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18343252"
Received: from makulkar-mobl1.amr.corp.intel.com (HELO [10.212.52.18]) ([10.212.52.18])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 05:50:28 -0700
Message-ID: <4c40b4bc-f2bd-45b7-8b14-456ddf1be94b@linux.intel.com>
Date: Tue, 2 Apr 2024 09:13:55 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/16] ASoC: remove snd_soc_dai_link_set_capabilities()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
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
 <87h6gludmj.wl-kuninori.morimoto.gx@renesas.com>
 <54ace545-8cdc-49aa-8214-5f07bee0e2f6@linux.intel.com>
 <87y19w7gjq.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87y19w7gjq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/1/24 19:29, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis
> 
>>> snd_soc_dai_link_set_capabilities() checks all CPU/Codec DAI (Y)(Z)
>>> for Playback/Capture (X) and checks its validation (A), and setup
>>> dpcm_playback/capture flags (a).
>>>
>>> 	void snd_soc_dai_link_set_capabilities(...)
>>> 	{
>>> 		...
>>> (X)		for_each_pcm_streams(direction) {
>>> 			...
>>> (Y)			for_each_link_cpus(dai_link, i, cpu) {
>>> 				...
>>> (A)				if (... snd_soc_dai_stream_valid(...)) {
>>> 					...
>>> 				}
>>> 			}
>>> (Z)			for_each_link_codecs(dai_link, i, codec) {
>>> 				...
>>> (A)				if (... snd_soc_dai_stream_valid(...)) {
>>> 					...
>>> 				}
>>> 			}
>>> 			...
>>> 		}
>>>
>>> (a)		dai_link->dpcm_playback = supported[...];
>>> (a)		dai_link->dpcm_capture  = supported[...];
>>> 	}
>>>
>>> This validation check will be automatically done on new
>>> soc_get_playback_capture(). snd_soc_dai_link_set_capabilities() is no
>>> longer needed. Let's remove it.
>>
>> Humm, this is really hard to review.
>>
>> soc_get_playback_capture() used to do a verification of the match
>> between dailink and dais, and now it doesn't have it any longer and this
>> patch removes the checks?
> 
> Hmm..., Maybe I'm misunderstanding ?
> I think this patch is very clear to remove, because it is 100% duplicate
> code. Maybe this mutual misunderstanding is based [01/15] review ?
> I think we need to dig it first.

I agree this looks like duplicate code, but why can't we remove it first
*before* any code modification?

It's very hard to review because it comes as the 13th patch of a series
and you've already removed similar code earlier which precisely checked
the consistency between dailink and dais.

In this function, it's a similar case btw where the settings provided by
the machine drivers are overridden by the framework, so that's another
case of collision between machine driver and framework. Which of the two
should be trusted?

