Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481F6146D53
	for <imx@lists.linux.dev>; Wed,  3 Apr 2024 12:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712148626; cv=none; b=GqJHMokjdZV/oeo0ZlkhxgSRoZcVUfmXoxNsHI0d10WLwhV2z0jjvyhz6cwHH4W1ib1o4SI7n5e4mw4cIvkIpixG5B3vBFPEGHDsBfB8NZs/r1hc8s2uGDYNV3EZcajhyZGEUZbQDbJjMHAs0Tk0CRFtZdJBtm/H+bo7appXhZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712148626; c=relaxed/simple;
	bh=4umRmk03vF9fr1bGI0vLvaFyerPGebWSjguYoGPrI8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=blqLiggC+5J9+xFznqvbtd9+MhgXPWcFKBLeTcvC4pxzkG66SvyYFDWxpt7MU55HjBpzuYWjYxDhE7X8/iy2gJZcuXKJbbD/tlC3kbCwYLcOO2xfJ1tjPAncK2BCV/mSr071N62OeaRtMD7Rtm2ocJnRgy9953rfBsQOVKE61tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CJtssfwa; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CJtssfwa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712148625; x=1743684625;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4umRmk03vF9fr1bGI0vLvaFyerPGebWSjguYoGPrI8c=;
  b=CJtssfwaryP91S9BreV/7sQNcvcpcXJDLpX5sD/A26kSy4uRlEMWOq+C
   FRQpU7VXMn48+3gTuFyvhKuDUAHQu/J5tU4nqORKFjV2f0m7Jl7TyYLaz
   1nzK/KoZHCdlcVRaap7Vzhqgz7lxUfHUuQzQDqoDlKyVoFgA0LDPB5s/f
   kZ11LY4DYMefYDZhikCSarSlntXH3wtguJsq+Rt4xVirtXKmPz/fVvgZH
   KuLMqS694yIDW7mJR4VgtY7wLbWvHTC3z9WPWQLk+2QwFJzmDl07YW2HU
   WtJKABk61JEN6Gw0FIdO2dOQ9U68KrtkPNo1menx9vqRj52zL+ur8WCJU
   A==;
X-CSE-ConnectionGUID: m9sPR2HnQh2hbWWut2TyIw==
X-CSE-MsgGUID: o80aJVbeQaWk95SIs1Krmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7539298"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7539298"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 05:50:25 -0700
X-CSE-ConnectionGUID: BYDsrZNkTaC/LT2slJN6iw==
X-CSE-MsgGUID: /OB8Lz1iQYq2CjAHV31VPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18343217"
Received: from makulkar-mobl1.amr.corp.intel.com (HELO [10.212.52.18]) ([10.212.52.18])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 05:50:22 -0700
Message-ID: <600cef67-ad90-4b67-8da7-2006339d430b@linux.intel.com>
Date: Tue, 2 Apr 2024 09:02:26 -0500
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87zfuc7gya.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/1/24 19:21, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis
> 
> Thank you for your review
> 
>> The problem I have is with the following code (not shown with diff)
>>
>> 	if (dai_link->playback_only)
>> 		has_capture = 0;
>>
>> 	if (dai_link->capture_only)
>> 		has_playback = 0;
>>
>> So with this grand unification, all the loops above may make a decision
>> that could be overridden by these two branches.
>>
>> This was not the case before for DPCM, all the 'has_capture' and
>> 'has_playback' variables were used as a verification of the dai_link
>> settings with an error thrown e.g. if the dpcm_playback was set without
>> any DAIs supporting playback.
> 
> I could understand so far.
> 
>> Now the dailink settings are used unconditionally. There is one warning
>> added if there are no settings for a dailink, but we've lost the
>> detection of a mismatch between dailink and the set of cpu/codec dais
>> that are part of this dailink.
> 
> But sorry I could understand this.
> 
> 	"There is one warning added if there are no settings for a dailink"
> 
> By [01/16] patch ? I think no warning is added. Or do you mean by [15/16]
> patch ?

Yes I looked at the entire series, it's just too complicated to look
with diff.

> 
> 	"we've lost the detection of a mismatch between dailink and the
> 	 set of cpu/codec dais that are part of this dailink"
> 
> Sorry I couldn't understand about this.
> Which mismatch detection we lost ?? Concrete sample / code / image
> is very helpful for me to well understanding.

With the older code, if the dpcm_playback was set for the dailink but
there isn't any dai connected to support playback, an error was thrown.

With the new code, if playback_only is set but there isn't any dai
connected, there is no error thrown, is there?

The point is that these flags are sometimes set in the machine driver,
sometimes set in the framework, and the open is which one has the priority.
