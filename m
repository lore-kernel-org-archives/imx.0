Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288F71C286
	for <imx@lists.linux.dev>; Mon, 22 Apr 2024 21:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713820212; cv=none; b=HaYsfvjBLl+RCxf4Md9JRQtsG8Y74STeIB3qNvRNZ+cA6724AH0ic1nRy74uEO/fJ10DszVOXo5jiw3Ti4QasGK/r4ygxwkTiIK2Fo9Mrm2v0+dJmYwBeEEmUSUzFW4FsVnE3uYQ/ObX5/or+bQzqe+gRrG+w1dfvRN7+LlNfOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713820212; c=relaxed/simple;
	bh=xkzr9t0PiSOdV/YhktL0c5g9YLvJ/o3qHjC7xj1JhxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=m8crf1NO3K5UDQj9+gaXI/mZmfr9A2XVp5l/lAfLpoirlgw5wDHCfwAnUSuDgJ8b5ocjkFNXDf3oLTKEC/MI9vjVATCYwAiPOyalQWbeq/TwbusOzertiF8dNy8PJJJw47KzO5B+oro2vYRPy0DZNZ5YcWlHQp/f2/7+BpIv8Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C79/VYe9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C79/VYe9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713820211; x=1745356211;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=xkzr9t0PiSOdV/YhktL0c5g9YLvJ/o3qHjC7xj1JhxE=;
  b=C79/VYe95wyGgIL74eluWpa4BbI74yLHpBYT4M1HvpI4VV6RA3C1yGe9
   psED2Cwhj1QhFZ+aGvUYVIVQvL3m0CNfry3vnnjZGrQOIrN8NwZKBoPyQ
   C9i7O8faMFxtaDtHekCWYQBxRl9FOscd1x+mhSqXTLmpRpS6wNwal65IX
   od3Eri7glSV89hkxSOuywYo0KKiO6WQrTkjvO4rZSaDSiKzJYUcPBcdvA
   fZDR4k4DQpps09Y6IOzwuwXv1Es5DyX6nOhXVwDZUyCpRbOm4LoQcOM9S
   ymM5r+DJpsbwuYtu5J91tPuT9AryP3xNQBISOnWFlfrj2Zqy3YFGO/WV2
   g==;
X-CSE-ConnectionGUID: Mg316BwoSL6jQhsBlPjcXQ==
X-CSE-MsgGUID: 90J3D2QWQJO4BMOL6uK8gQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="19933716"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="19933716"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 14:10:10 -0700
X-CSE-ConnectionGUID: 0slg/LF+Q/OTgUwn2iL9FA==
X-CSE-MsgGUID: aDlAGt+2S9Oh4QeyVXSomw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="28591780"
Received: from leozhang-mobl.amr.corp.intel.com (HELO [10.212.37.174]) ([10.212.37.174])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 14:10:08 -0700
Message-ID: <09b16c5f-12c1-46c8-ba52-2a7fe4756c44@linux.intel.com>
Date: Mon, 22 Apr 2024 16:10:07 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/23] ASoC: Replace dpcm_playback/capture to
 playback/capture_assertion
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
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
 Mark Brown <broonie@kernel.org>, Maso Huang <maso.huang@mediatek.com>,
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
 linux-sound@vger.kernel.org, Brent Lu <brent.lu@intel.com>
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Morimoto-san,

> When we use DPCM, we need to set dpcm_playback/capture flag.
> If these flag are set, soc_get_playback_capture() will check its
> availability, but non DPCM doesn't need such special flags.
> 
> OTOH, it cares playback/capture_only flag. It is needed.
> 
> This patch adds new assertion flag, and convert current dpcm_playback
> dpcm_capture flag and playback/capture_only flag to it.

The Intel CI flags a regression on a CometLake "Helios" Chromebook with
this patchset

https://github.com/thesofproject/linux/pull/4937

Apr 19 14:01:22 jf-cml-hel-rt5682-07 kernel:  SSP1-Codec: SSP1-Codec
capture assertion check error
Apr 19 14:01:22 jf-cml-hel-rt5682-07 kernel: sof_rt5682 cml_rt5682_def:
ASoC: can't create pcm SSP1-Codec :-22

https://github.com/thesofproject/linux/pull/4937

I don't have any specific knowledge on this device, hope Brent Lu can
shed some light on what is so special about this SSP1.

Regards,
-Pierre
