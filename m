Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7D8142906
	for <imx@lists.linux.dev>; Mon,  8 Apr 2024 17:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712596981; cv=none; b=KQtzYyvFjE7F5Fp58/GiABFhLVRdavMBkhXFOGJjRtZ8scyZxoMPQIzccG266OjiLXDGLsArETeC5uZ2WHOMZBmMHaJtIGuZTaTTYuwUOmZ4fA5xnq0uBT7xTzKKAn1mNVJDq3ShSZOiwppxHqor6MSXwuVvOrwnFP1LupGwEYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712596981; c=relaxed/simple;
	bh=9YZUFujOhMTTG62YTRxcfo0Pxm72VS2PmasBoZHfmRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nkOvg8ttw3rEbSOMiUYrmhPuPEye8n3demROehpOAt9RmgVyHfCWfD0m2pI/Qy6AJUcIW4XlXkaUuUwGIVLGo332PO1Dy2Scw1qQBewxoxDRi2zUWy6kQZDhpfIWtmSvqfx8oCP0jq2kdEfHbPCAaJX0F3qztS0S4/9OXX8U1E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/lLj6tO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/lLj6tO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712596979; x=1744132979;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9YZUFujOhMTTG62YTRxcfo0Pxm72VS2PmasBoZHfmRw=;
  b=M/lLj6tONj5+KriC41hsThKGT5lJ0EeXzHlsJNAPXt0TUsburfZCy8O6
   fcdSYie0Dbpyr8+CXtUduB8blUZH6VREXHr2DkGsqPiecwkbL3nJmJNWw
   063CnuGqlNkewrYwBLDfVhvvF9C4JzNWU3swUkpQxVh2GbMOP4nJa8kmX
   iiIeD50vmcVMQdifWg3AAJPIhFFJz5Bu3VNvhdI9FBXqg43nYT/tImslv
   acFTSsZa66Jhsy07OAe2PO2nNfSr2QfeDu2mO76zp7/DBDqkl0ocqCx3j
   jQTytVco7zgIlcWQjFZtxnwvFwP7ojP0pxQzw1MJ1j1N0eOlrb/4bLMho
   Q==;
X-CSE-ConnectionGUID: GfAHbEPuTdKURx8U+XNNFg==
X-CSE-MsgGUID: II4beaT7SNaz42xa+BRBsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7757446"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7757446"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 10:22:59 -0700
X-CSE-ConnectionGUID: fG6IZotJT4u76Vx3qwpS7A==
X-CSE-MsgGUID: izqID2hnQtuQZJDnjXRadA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="24697450"
Received: from shahsmit-mobl1.amr.corp.intel.com (HELO [10.212.101.141]) ([10.212.101.141])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 10:22:56 -0700
Message-ID: <acf98b6b-7c18-4f1e-ab8f-039c88679ab9@linux.intel.com>
Date: Mon, 8 Apr 2024 10:34:25 -0500
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
 <600cef67-ad90-4b67-8da7-2006339d430b@linux.intel.com>
 <874jch99m5.wl-kuninori.morimoto.gx@renesas.com>
 <40e23972-6745-48e2-81ae-4b93f2ee2dcc@linux.intel.com>
 <875xwwr60a.wl-kuninori.morimoto.gx@renesas.com>
 <87sezwecf1.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87sezwecf1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/7/24 22:55, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis, again
> 
>> dpcm_xxx is used to declare that the DAI/dailink is possible to use
>> playback/capture. For example dpcm_playback means the DAI / dailink
>> should playback-able, if not it is error.
>>
>> xxx_only is used to limit the playback/capture.
>> For example the DAI / dailink can use both playback and capture,
>> but want to use playback only for some reasons, we can use playback_only.
> 
> My pervious patch-set was "try to merge dpcm_xxx and xxx_only flag",
> but next patch will be "expand assertion flag to all connection".
> This "assertion flag" was originaly dpcm_xxx.
> 
> In next patch-set, it will assume for example current "dpcm_playback"
> as "playback_assertion". It can be used not only for DPCM, but
> all connection, but is not mandatory option.
> 
> Its pseudo code is like below, but what do you think ?
> 
> 	soc_get_playback_capture(...)
> 	{
> 		...
> 		/*
> 		 * get HW / DAI availability
> 		 */
> 		for_each_rtd_ch_maps(...) {
> 			...
> 			has_playback = xxx;
> 			has_capture  = xxx;
> 		}
> 
> 		/*
> 		 * "xxx_assersion" was "dpcm_xxx" before, but expand to
> 		 * all connection. It is not mandatory option.
> 		 * It will be error if dai_link has xxx_assersion flag,
> 		 * but DAI was not valid
> 		 */
> 		if (dai_link->playback_assertion && !has_playback) {
> 			dev_err(rtd->dev, ...);
> 			return -EINVAL;
>  		}
> 		if (dai_link->capture_assertion  && !has_capture) {
> 			dev_err(rtd->dev, ...);
> 			return -EINVAL;
> 		}
> 
> 		/*
> 		 * xxx_only flag limits availability. It will indicate warning
> 		 * if DAI was not valid.
> 		 */
> 		if (dai_link->playback_only) {
> 			if (!has_capture)
> 				dev_warn(rtd->dev, ...);
> 			has_capture = 0;
> 		}
> 
> 		if (dai_link->capture_only) {
> 			if (!has_playback)
> 				dev_warn(rtd->dev, ...);
> 			has_playback = 0;
> 		}
> 
> 		/*
> 		 * No Playback, No Capture is error
> 		 */
> 		if (!has_playback && !has_capture) {
> 			dev_err(rtd->dev, ...);
> 			return -EINVAL;
> 		}
> 		...
> 	}

The code looks fine, but what are we trying to achieve?
I thought the idea was to have a single field at the dailink, and with
the example above we would still have two - just like today.
This looks like a lot of code churn in many drivers for limited
benefits. Or I am missing something?
