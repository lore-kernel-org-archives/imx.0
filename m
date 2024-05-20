Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF40A136E37
	for <imx@lists.linux.dev>; Mon, 20 May 2024 15:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716220544; cv=none; b=TCk+jtWtxAvcWKtpD50wiLLCEY5e0T4xi+zB1+v/FCXQ9I93gTLxhXOQcBl9Y+dT/NB769g3B/DQ5H1Jx1z1uLIbrf7nnu2wd5tzpJVhvWRoXgs8kL+Rt2rWpFCnaMyaP01synz95wAl2oIfnpPYYrE4ovSI5JqSdXTtl7sL92M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716220544; c=relaxed/simple;
	bh=PKOTCzh7s/Hlw+lCPuwNY7ZQb0fnb29mRHIC+H6JoNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JXL8rijhoBSSyvjje1S2f6b4m3J52wjIEmaHQGhMLmMA8hRoOzYP6YNA/jq/67UIurmXRQvksKn4pwVCWcpixQSgIWAXsjKxQd+pgcCm3wHK5Zml4mmnCvTeDYh4MK/lCLo5HRMZ8Cg6BUVc6NmmvmpPikBH6WA87nLYWfc/RiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mg8M8EHo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mg8M8EHo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716220543; x=1747756543;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=PKOTCzh7s/Hlw+lCPuwNY7ZQb0fnb29mRHIC+H6JoNQ=;
  b=mg8M8EHonEG9iIMfm5PudNyIRXC1T+aDIHzPF6vnvgh1jbgA8Hrpwc+i
   9SfPSBmnTTLSZdyepGIQNyfR8l+/Yx/b8wzN73lmQLyixNwRJmUyFy44G
   bEXptH69qz+S3oqEc19gE429RV+fvHJ7DUXl7G4mFsTzu0qX1d9cXL27z
   3Zxsr8EChJ7OOzmGbnOoRwy9FollX4NJCsM7LzkZwCGVGVxIixBJ4RBVB
   2BM91t1YIKdEYnznBZK7/vRkw9kYbs1uNVAS1jr9U/S09E+Nae2a4xb7L
   4QTuv4N4voqQSnIJhTHt1U55YA1gGkMWTkFuOHzuNHZyX9ql8B9Sj3wjR
   Q==;
X-CSE-ConnectionGUID: Aw9yWDPNSIq0jXX40qit+g==
X-CSE-MsgGUID: So4KsFhWRzeOncARUdocrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12233873"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="12233873"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 08:55:42 -0700
X-CSE-ConnectionGUID: Zk9AkXmXQXCmMVOXmQSITw==
X-CSE-MsgGUID: 9ILVEuteSYeDWdkOJH4GYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="37346120"
Received: from daliomra-mobl3.amr.corp.intel.com (HELO [10.125.109.51]) ([10.125.109.51])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 08:55:39 -0700
Message-ID: <77e9221e-05d2-453f-9ce1-ff4a4b53d09d@linux.intel.com>
Date: Mon, 20 May 2024 10:55:38 -0500
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
References: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
 <87jzjpe5vh.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87jzjpe5vh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/19/24 18:31, Kuninori Morimoto wrote:
> Current DCPM is checking CPU side availability only, but it should also
> check Codec availability. But because of long DPCM operation history,
> it is possible that the some Codec driver check have been bypassed.
> 
> It should be error, but let's add grace time to update driver.
> 
> This patch indicates warning in above case. Each applicable driver need
> to update during this grace time.

...

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
> +				 "System requests playback, but not available (%s)."
> +				 " Please update Codec driver\n",
> +				 dai_link->stream_name);
> +		if ((dai_link->dpcm_capture || dai_link->capture_only) &&
> +		     !has_capture_both)
> +			dev_warn(rtd->card->dev,
> +				 "System requests capture, but not available (%s)."
> +				 " Please update Codec driver\n",
> +				 dai_link->stream_name);
> +

I mentioned in my previous feedback that this isn't quite right. There
are cases where the CPU dai reports capabilities that the codec DAI does
not support - e.g. when the AEC reference is generated in firmware on
the host DSP.

And sure enough we get that warning in the first test:

https://sof-ci.01.org/linuxpr/PR5005/build3040/devicetest/index.html?model=GLK_BOB_DA7219-ipc3&testcase=verify-kernel-boot-log

May 20 13:35:38 jf-glk-bob-da7219-1 kernel: sof_da7219 glk_da7219_def:
System requests capture, but not available (SSP1-Codec). Please update
Codec driver

For those systems, trying to match CPU and codec dais is not going to
work. Either we skip this verification or we have an escape mechanism to
avoid triggering errors.
