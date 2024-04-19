Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0238121F
	for <imx@lists.linux.dev>; Fri, 19 Apr 2024 13:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713533236; cv=none; b=tnINLXJeENT3klxyR1Zhsltj18Uwyt/p0FvjEfl4njLekQKaawM6QuqWwI2NCogNGCr2fLR/oXlbDuEFNOV14uyg5gf5MMOD4ZbNFkOjpu+USjUHPcWVeNyxveXHmjDNiBkTl3z6VFji6bd9lqofHlIf7vTSObQGw9H1fPJGxZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713533236; c=relaxed/simple;
	bh=Qnz9KkLZ0F/VZJLWO9UAiA4GTOIoA6FKmFggsIBghb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FXb4wEqU98iB8nBi8z+pBcO/be2wFuJT9HCRca2LXWFIe9t2555PGHJ4jzjY8ARkrI4LH80YlDb49DKwHHcdEYTxviKg0MrivjqkUdTOfmhTMyBbeTrdI47N6xK9wE9031e+xRvjnf+Ob/C26VS/HcL6d7x7l6hDvlySJsenmRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TtnKJzOp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TtnKJzOp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713533235; x=1745069235;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Qnz9KkLZ0F/VZJLWO9UAiA4GTOIoA6FKmFggsIBghb0=;
  b=TtnKJzOpiIe+soN1mnfmg+5vOZyeXT8AMWLKKaEBAHd+i/aZ+N0VFXon
   KPHwbhl9C5fbQum7oU4wUCOps3LZ+/zhoqFJtqgZGYuowexPnbo13wr52
   FUlWN/6UBxF2EfM9fI0NPpf/NtbqipZ8aJsImtKXEl6S7LTqkJSUGUiOD
   Q1uQL+1keHxYK76nMJfnU+o29XKidNY8GxwWE7Mn/icpn/OeqKUn+3Gsy
   UnHyMvgKTe4HWZ98XS9VVJZWHZpHKROopaQHc61M+ACGTUUERhMWkvuum
   8fFA79aSeTwv6VFTNI/csn/UGSPpyT6OPRxjqlJ8nrfRULEjNqG3X4mQy
   w==;
X-CSE-ConnectionGUID: jwGDXSGHTeWIVoh/Xl4dgA==
X-CSE-MsgGUID: seMAAIMxQ3Cyqg38tiEcEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="34531852"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="34531852"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 06:27:14 -0700
X-CSE-ConnectionGUID: QABg7rpFSuq0ZKNqFoAQ5A==
X-CSE-MsgGUID: 17elK82rR4SPLD6Vg+dLhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23312212"
Received: from ymahendr-mobl1.amr.corp.intel.com (HELO [10.212.85.57]) ([10.212.85.57])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 06:27:10 -0700
Message-ID: <92054f87-dded-4b66-8108-8b2a10909883@linux.intel.com>
Date: Fri, 19 Apr 2024 08:17:17 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/23] ASoC: soc-pcm: cleanup
 soc_get_playback_capture()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
 <87frvj8g2v.wl-kuninori.morimoto.gx@renesas.com>
 <a1f63065-6d8a-404f-b4be-331d829f802f@linux.intel.com>
 <87ttjytayy.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87ttjytayy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>>> (X) part is for DPCM, and it checks playback/capture availability
>>> if dai_link has dpcm_playback/capture flag (a)(b).
>>> This availability check should be available not only for DPCM, but for
>>> all connections. But it is not mandatory option. Let's name it as
>>> assertion.
>>
>> I don't follow the 'not mandatory option'. Why not make these
>> 'assertions' mandatory? What happens in case the the option is not present?
> 
> The big reason why "assertion flag" is not mandatory is that non-DPCM doesn't
> have such flag before. I can't add such flags to all of non-DPCM,
> because I don't know which direction (playback/capture) is available on
> each DAIs.

Your explanation seems to contradict the sentence above "This
availability check should be available not only for DPCM, but for all
connections."

Can we actually do this 'availability check' for non-DPCM connections.

>>> In case of having assertion flag, non specific side will be disabled.
>>
>> Not following the wording, multiple negatives and not clear on what
>> 'side' refers to (direction or DPCM/non-DPCM).
> 
> How about this ?
> 
> 	If either playback or capture assertion flag was presented,
> 	not presented direction will be disabled by ASoC even if
> 	it was available.

Did you mean

"
The playback (resp. capture) direction will be disabled by ASoC if the
playback_assertion (resp. capture) flag is false - even if this
direction was available at the DAI level
"


> (playback_xxx, capture_xxx)
> 
> (0, 0) : Both are not must item. available direction is used as-is.
>          But it will be error if nothing was available.

That new wording makes me even more confused. What does 'available'
refer to and at which level is this?

This seems also to contradict the definitions above, "available
direction is used as-is" is not aligned with "not presented direction
will be disabled by ASoC even if it was available".
> (1, 0) : DAI must support selected direction.
> (0, 1)   Not selected direction will be disabled even though it was available
> 
> (1, 1) : Both must be supported.

