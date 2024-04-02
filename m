Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06BC146D53
	for <imx@lists.linux.dev>; Wed,  3 Apr 2024 12:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712148628; cv=none; b=g4ua4/ihJeQe8EaTntoLS4SFKnr8P+iQ7dfoVRxyTuwRHjHNEw3U7lER8U8isv5qmpTWbqFTqOcWRtGCbzusDWWz2BjtJkdEQ2a4iM2iKOj6fMFA7j0rwet1abs5nvkp3qzMZe/x0Gdn2OxLzc5q6izehvDoHoqduuz06lhNNcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712148628; c=relaxed/simple;
	bh=kMKCTwKn8cIKYzkCfS7drdn8LHov9ndMuinvA3lbcgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LlMfV9CxQep5JcrieAZAIsN+6Q5T72Pz1emRvrhEwQzHPPzgCOPJD9hSqZSuMxtxTPXSj2165Zo2frjB9NOk6QXwb1lQgdGzbBDrK5hv8575jUMLCqROdY+b4FUvZMOsO2U4jd52oxvdtOlg2fHbvG5TWEhMVzxkulHzbtYzhxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DqGa2Er6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DqGa2Er6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712148627; x=1743684627;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kMKCTwKn8cIKYzkCfS7drdn8LHov9ndMuinvA3lbcgw=;
  b=DqGa2Er6X3qO3pn9KbSr+190MOxRfHyrDe+/hsWzJTudpbcJ5+Zo+QkF
   lx2G7n9Ew6+swkaiYP0Znq1ZP8fAJdz2wmqRffKOeAeG4OJyYwxWLwjvu
   2x2V6rg9stypDtwS7qyfew3065nx7HH2Z+NDXpIwAbpxAkCtAZ0DH+yn3
   dfFZVYvD0LtwOHMzBYu28vXLG9fwam2jUKDAXH4x9U6gTe7wluS0OIwbE
   Xg9RyddNta9WD+pHnXa+zNt26HYEULvRYhuDsConOmAhmR0qWMsZfxtDI
   byDZPbrQD8yONh6LRdyDRZaD8OJrYKNMIsB5z3ipS5DGz8pq1W9KCosIG
   w==;
X-CSE-ConnectionGUID: yAN0Di3gQ2KUzJhDOsAMeA==
X-CSE-MsgGUID: ZV0bB82nQu+B6hl1lTWPow==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7539319"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7539319"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 05:50:26 -0700
X-CSE-ConnectionGUID: hVk+VsPMTNGqw+pBvOSqyw==
X-CSE-MsgGUID: RwciptEsRAWsX8VxQF1m0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18343230"
Received: from makulkar-mobl1.amr.corp.intel.com (HELO [10.212.52.18]) ([10.212.52.18])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 05:50:24 -0700
Message-ID: <27d79c07-4ff9-48f4-9785-2643a8c5f4c5@linux.intel.com>
Date: Tue, 2 Apr 2024 09:06:16 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] ASoC: soc-pcm.c: cleanup
 soc_get_playback_capture()
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
 <87y19xudor.wl-kuninori.morimoto.gx@renesas.com>
 <b4b37541-b67f-4593-9fd5-fc6242a0673a@linux.intel.com>
 <87zfuc7gya.wl-kuninori.morimoto.gx@renesas.com>
 <87ttkk9se3.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87ttkk9se3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/2/24 01:43, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis, again
> 
>>> The problem I have is with the following code (not shown with diff)
>>>
>>> 	if (dai_link->playback_only)
>>> 		has_capture = 0;
>>>
>>> 	if (dai_link->capture_only)
>>> 		has_playback = 0;
>>>
>>> So with this grand unification, all the loops above may make a decision
>>> that could be overridden by these two branches.
>>>
>>> This was not the case before for DPCM, all the 'has_capture' and
>>> 'has_playback' variables were used as a verification of the dai_link
>>> settings with an error thrown e.g. if the dpcm_playback was set without
>>> any DAIs supporting playback.
> 
> Hmm... above 2 branches are used for DPCM too before.

Not really, playback_only and capture_only were never set so those two
branches were always false.
> 
>>> Now the dailink settings are used unconditionally. There is one warning
>>> added if there are no settings for a dailink, but we've lost the
>>> detection of a mismatch between dailink and the set of cpu/codec dais
>>> that are part of this dailink.
> 
> Does this mean, for example you want to have warning/error by dpcm_playback
> flag if you are thinking it can use playback , but FE or BE playback was
> not valid ?

Again we had a verification that if the dpcm_playback was set at the
dailink level, it was actually supported by the dais.

We seem to have lost this verification. We only have an error when there
are no settings at all.

> 
> If so, yes indeed this patch removes such flags.
> But I wonder why you want to get it in case of DPCM only ?

It's helpful to detect invalid configurations. And I see to reason why
the removal of flags should change the functionality.

> I can understand if all case want to have it.
> 
> Then, I think we can check _only for this purpose too ?
> 
> (A)	if dai_link has playback_only        -> it should have has_playback
> (B)	if dai_link has capture_only         -> it should have has_capture
> (C)	if dai_link don't have both xxx_only -> it should have both has_xxx
> 
> I think we already have (A)(B) check. We want to add (C) check ?
> 
> If my understanding was correct, the things dpcm_xxx flag can do is also
> can do by xxx_only flag. But dpcm_xxx flag is used only DPCM, but xxx_only
> flag is used on all cases.

I am only concerned about mismatches between dailinks and dai
capabilities. The logic above is fine, but it's in the scope of the
dailink only.

