Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAC01474C7
	for <imx@lists.linux.dev>; Wed,  3 Apr 2024 12:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712148630; cv=none; b=bulLZezr1/ofBUzfQ5ymFHT+IpF8HjxcI5ljQQlluTN2QK31ca3A5Wx93IQ6KsG9Kqv/ZRlY/as999BN2gCQXiObslD+SonMlXAWWY+c5JP3CUzUwFhZVK1r+OcAFE64Sf8oth2GXR8Mg0rhXqz8d1EGTqHVw24JT9/FFOQIq1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712148630; c=relaxed/simple;
	bh=D/FfpbAsiof89LgUZ4/UlHEJN8aXS0QySDUDCd5cFgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qf9AGkv3PXXPzirMrd9bLLldFPJjTchyNLdNJwSwIyBX5H5Si9H3kLZo0EMqAhmXWaY5sXyiU9NHYAZIAd9xk0/6Zy003aCuZmMAE6VXlkWhY4KKaS7vHK8RO7h8zcItuOC7jxUQyPOor+wWERGf5Wrn4zs1OX18llaPGKXZWyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TtO+xowu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TtO+xowu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712148629; x=1743684629;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=D/FfpbAsiof89LgUZ4/UlHEJN8aXS0QySDUDCd5cFgU=;
  b=TtO+xowu/soTqSx6iXJOUFuZpASPEUyEIRoCYPeHUiFzxTmqbbr33ww9
   Kxv0mQ9Fkq68ReLcUGXCvK6rq+mdjYwkQJTk3sw1WmMbMb91hXQfek8NY
   FYY7pUyApIghBreegOxoI9poHAQZkY33Z0EgkYIWMlLyofOc5Zy2bvHAm
   Y4s/ZWLoU8heqA6mpYJeprfVInVH/eRGRXuhSQ5hVFnu9p66XWdY3BBDN
   MJ5mg+wnZbOcgZbHI7eRk+uV0kX4EcG75aJv/wnHQ+PPPf3YV84jEKxc/
   a/OY8P0rE42YmZqwBOWO727FaNg/ayMuFlnDQ+EWpPi8TsZ8Yyy4XdHyK
   A==;
X-CSE-ConnectionGUID: 9VsMyEm1Rm+2Gci65hQKyQ==
X-CSE-MsgGUID: /8L/Q7xmSwSBBBLc178guQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7539343"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7539343"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 05:50:28 -0700
X-CSE-ConnectionGUID: /D+wW3RkS/a6+yA0ZGswww==
X-CSE-MsgGUID: J/jGeT/nQbCMDRSoTLK5iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18343238"
Received: from makulkar-mobl1.amr.corp.intel.com (HELO [10.212.52.18]) ([10.212.52.18])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 05:50:26 -0700
Message-ID: <2cb2f96f-836c-4816-86f8-2262c2dd1ce3@linux.intel.com>
Date: Tue, 2 Apr 2024 09:09:23 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/16] ASoC: soc-core: Replace dpcm_playback/capture to
 playback/capture_only
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
 <87msqdudn7.wl-kuninori.morimoto.gx@renesas.com>
 <1a42ebbb-1e1f-4ecf-a1ec-7af292f7ff96@linux.intel.com>
 <871q7o8y0d.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <871q7o8y0d.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/1/24 18:27, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis
> 
> Thank you for the feedback
> 
>>>  			/* convert non BE into BE */
>>> -			if (!dai_link->no_pcm) {
>>> -				dai_link->no_pcm = 1;
>>> -
>>> -				if (dai_link->dpcm_playback)
>>> -					dev_warn(card->dev,
>>> -						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_playback=1\n",
>>> -						 dai_link->name);
>>> -				if (dai_link->dpcm_capture)
>>> -					dev_warn(card->dev,
>>> -						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_capture=1\n",
>>> -						 dai_link->name);
>>> -
>>> -				/* convert normal link into DPCM one */
>>> -				if (!(dai_link->dpcm_playback ||
>>> -				      dai_link->dpcm_capture)) {
>>> -					dai_link->dpcm_playback = !dai_link->capture_only;
>>> -					dai_link->dpcm_capture = !dai_link->playback_only;
>>> -				}
>>> -			}
>>> +			dai_link->no_pcm = 1;
> (snip)
>> It's not clear to me how this is related to the
>> dpcm_playback/dpcm_capture removal.
> 
> In my understanding, if "dai_link->no_pcm" was 0, it sets no_pcm and
> convert setting to BE. If no_pcm was 1, it is BE anyway. So no_pcm will
> be 1 anyway after this code.
> And then, dpcm_playback/capture is no longer needed.
> So it just set no_pcm = 1 here. But am I wrong ??

The problem is that the patchset is supposed to be only about removal of
flags to align on one set, but then we also have "simplifications" or
removal of checks without explanations.

It would be far less invasive if we only replaced flags and had
iso-functionality. Then we can discuss the merits of simplifications.
