Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379A383CC1
	for <imx@lists.linux.dev>; Thu, 23 May 2024 22:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716504237; cv=none; b=qoTbKE/Q7v0HgN/BcZccw66fZU0b3KOXXusm+3ZFuxGOMd3rNP9NgL6J3g+r/fa7iycg3U50WjlRdhD4muXJ/41m9uRodqFoMsk1U+bFiOFH0Lq911LQ1kOph4jmm362nKtxmEjCkYGr7q8lxfwZYjFK8uzQ00yBma776v9eDe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716504237; c=relaxed/simple;
	bh=DeRznDUy6+k12p/OKJsq9wS5q2D71jokILR4vUud1xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sVBgJdYBdEtx2aRl3ubrmkCqh6TI8x3wVcD12vdraD3w6w51ngI+f5rPjhVyZ3wRITzVyj56U1WAofalZzXBu++7wq0dbeaTnXO2KkT++JRtwY1NboHwbFJVYY4yFKc9Z/j8RKEkTD4Wp0n4WHDNh/Qm4gjdNh2XkbAvK41jwBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5FOhzpV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5FOhzpV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716504236; x=1748040236;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=DeRznDUy6+k12p/OKJsq9wS5q2D71jokILR4vUud1xk=;
  b=C5FOhzpV5PDfwoazcz/7FjRKQZkaNmJBCkkqRjAaOEdE9cxUgHn1jtoy
   vcwcrcDpzuzJs29X0NGnVWALmUWS05+EcsHVy+kSgygkuLPbRRbzTdiJp
   Y4d5QtSO1H5LbRmWLBJYsNjgJCPHEX5mjDCZUkbw2Id6EaD+i7S7PMMVv
   JepGNIaqvD0cvwRL2a8U+rvThV9xUoQfm7If5yGBOc0ju1WsHTvXGpsiq
   vfxqR638y988Cnp0WvDz+1qk/sXiL/dBEGtj/tZZ723blnoWm7dCOk11/
   kNDCuxT3YeYDDcG15c0z1DP1TI1BSl1bOtyw4vQsplFGHFg8oFgo2mLD2
   A==;
X-CSE-ConnectionGUID: h01z/F3LSxqgrwJZlJZKgA==
X-CSE-MsgGUID: 6fH4dAAsSmml+zbcHWIoFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="24267624"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="24267624"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 15:43:55 -0700
X-CSE-ConnectionGUID: tUWROIX/RrmqrcPvdGAnBQ==
X-CSE-MsgGUID: yZHJsThDQ2GV8X3EiMTVRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="64641111"
Received: from unknown (HELO [10.125.110.41]) ([10.125.110.41])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 15:43:53 -0700
Message-ID: <179eb2b1-0103-4105-ae66-fd0a86bd9fd1@linux.intel.com>
Date: Thu, 23 May 2024 17:43:52 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] ASoC: grace time for DPCM cleanup
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
 linux-sound@vger.kernel.org
References: <871q5tnuok.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <871q5tnuok.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Morimoto-san,

> This is v4 of DPCM cleanup
> 
> As we discussed in [1], we don't need to use dpcm_playback/capture flag,
> so we remove it. But we have been using it for 10 years, some driver might
> get damage. The most likely case is that the device/driver can use both
> playback/capture, but have only one flag, and not using xxx_only flag.
> [1/3] patch indicates warning in such case.
> 
> These adds grace time for DPCM cleanup.
> I'm not sure when dpcm_xxx will be removed, and Codec check bypass will be
> error, but maybe v6.11 or v6.12 ?

We're already finding warnings on all Intel SoundWire platforms:

The DAIs are declared as supporting playback AND capture, but in
practice they can only support one direction at a time.

The direction is defined by the dailink when it includes specific DAIs.

So if you don't mind I'd prefer it if we shared a patch with you to be
included in a v5, to make sure at least the Intel platforms tested in CI
are all ok from Day1, otherwise we're going to get lots of noise
reported for no good reason.
Shouldn't take long.
