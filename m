Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A233513BC38
	for <imx@lists.linux.dev>; Thu, 23 May 2024 13:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716469413; cv=none; b=qdmCYJobz8o7vWVmgx9JlnKhutO1P6SUaSZAm9xqvah8f6+R6rffAGdrPpJjjsenepBL9/3TYQWsoIQtyDwyLrAdxLHpEfr45WSXZNTJB3mrQOUc6MWUOSnrIFOo0R35YUX8kg0WSRgKTb4YBVtQ+VJ0+OAZrl1l+6zns2WIhHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716469413; c=relaxed/simple;
	bh=jw4sR51kSbW7rHYB3afXhuNhtkpAyEH1zeZVnVImweU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nDzPzQ2ZCYKkkd2uejk1SC9QrOMp2joASQbomVZD43VyrWuT6BNJupUOAnAHGmabeYy9U3+0mrKPyLsfVA8bTVp0JHFt1OjyLEU/QNC11wD7AlfCF4BSC0jNNPqc58q5cqjfN+2aLKbUY2XxX4RtbvkbMPNzAaZNEiOL78EyfeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fGPGWWSc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGPGWWSc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716469413; x=1748005413;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jw4sR51kSbW7rHYB3afXhuNhtkpAyEH1zeZVnVImweU=;
  b=fGPGWWSccPwk7eVse1GXrTNb7pqV7AcE2m834Y2ieLNB234e+EAO7/Ti
   t8Y/mfbRq5pC4ouH8X7IBxjqdw1xwyx2z9Z0WNFKUc+wbtgbjFgdFwCfn
   JIDPhB5YQ6faWW/K6i2bKJiTyjXM8uy4AltpptrTbXYCKxXHgF7fItTld
   BYQkzkVHrZ6rGm49Z9JeAdIMEhqM2uQlrFgjqm8jqCsTFJrJUzm3NwTd1
   ObKf6jbH8roHL0Emh2ZEn3yHtsDjcD0Im/zn5oKQrb//QdbM/WL6K+5F5
   O3wlwaLwhtafgY/9pL7t0csnitcgcaavr/dKLB80TUenFJmh3TnWDmWn+
   g==;
X-CSE-ConnectionGUID: KSojqnEpSIC4izzMqlhlDQ==
X-CSE-MsgGUID: jrEaXqJzSJmkmifhKkSKeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12632721"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="12632721"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 06:03:32 -0700
X-CSE-ConnectionGUID: c61xu0+GRl2iSbzHX4p83g==
X-CSE-MsgGUID: E1Ph9vJrQzqtcOJwbDdmDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="33550436"
Received: from unknown (HELO [10.125.110.41]) ([10.125.110.41])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 06:03:29 -0700
Message-ID: <37615d72-762e-4ec7-b625-e275a96b2780@linux.intel.com>
Date: Wed, 22 May 2024 08:35:31 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ASoC: soc-pcm: Indicate warning if CPU / Codec
 availability mismatch
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
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
 Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
 <87jzjpe5vh.wl-kuninori.morimoto.gx@renesas.com>
 <77e9221e-05d2-453f-9ce1-ff4a4b53d09d@linux.intel.com>
 <87y184cbed.wl-kuninori.morimoto.gx@renesas.com>
 <7b430ea3-3ce8-4ef9-8440-bac02993f676@linux.intel.com>
 <875xv8c6dn.wl-kuninori.morimoto.gx@renesas.com>
 <3e67d62d-fe08-4f55-ab5b-ece8a57154f9@linux.intel.com>
 <1f8e6e3c-a116-48d8-991f-4184d1eebc79@sirena.org.uk>
 <ec063ea9-3d72-457a-9c73-46c5f5b1f6e4@linux.intel.com>
 <37341c4c-3a99-4f71-99b3-efda2d2008e8@sirena.org.uk>
 <878r023epy.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <878r023epy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> In case of ignoring Codec check on DPCM, it allows unexpected direction,
> I think. For example if it is not using dummy DAI, and in case of CPU can
> playback/capture, Codec can playback, and user expect playback only,
> in this case unexpected "capture" will be available. He need to add
> playback_only flag, but it is not good for me.
> 
> Can we avoid validation check if DAI has some kind of new flag, like
> ignore_pair ?
> 
> pseudo code is like this
> 
> 	if (valid(cpu, PLAYBACK))
> 		has_cpu_playback = 1;
> 
> 	if (valid(cpu, CAPTURE))
> 		has_cpu_capture = 1;
> 
> 	if (valid(codec, PLAYBACK))
> 		has_codec_playback = 1;
> 
> 	if (valid(codec, CAPTURE))
> 		has_codec_capture = 1;
> 
> 	if (cpu->ignore_pair) {
> 		has_codec_playback = 1;
> 		has_codec_capture  = 1;
> 	}
> 
> 	if (codec->ignore_pair) {
> 		has_cpu_playback = 1;
> 		has_cpu_capture  = 1;
> 	}
> 
> Or more detail ignore_pair_playback, ignore_pair_capture

There are two options
a) we don't even try to test the codec-cpu match in terms of
capabilities. That means the same behavior as today.
b) we add a chicken bit for platforms to disable the codec-cpu match if
it breaks specific platforms.

The problem with b) is that we don't know what platforms will break. I
reported one example that was caught by our CI, but there could be
additional Chromebooks impacted, who knows.

My vote is a).
