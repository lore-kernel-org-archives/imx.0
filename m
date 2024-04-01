Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9547B1C0DE7
	for <imx@lists.linux.dev>; Mon,  1 Apr 2024 16:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711989051; cv=none; b=IcDdMjzYF6G8vPRgCJQf7Rm0sxjexRIpAFh+Flegl10RQ8Rar9enIOYqeB3m6bXVinjEnsFwyz5R2RQLXgCZSBlkNvClTpAnCTJA99nQJu+hqCpPQCdBYJmHVLq3SMFapPRLEk8mtY81PrAMSY97qNU6fbW42tt75MCQloIxu1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711989051; c=relaxed/simple;
	bh=eTX/7NaNoXDzfyhrzqmm6Ups4VgCiQZr26N1KsucA/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qIeQPiSW3XERSoE42R/MkrSOiQ4h/ZzGxx5r3JRjDEzP0iIhOOudanHhDj/o852YbHX4tV+xEMwtBiILviuV7cwe3LmUVC2QzyUjCTsSEKI1K6K8QsVwZ7afbY14V/7BET2BMuU6NmVr8lSX6v/TVUAfzN1QTOAwZ6lcL8zTYI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SIR3iuSg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SIR3iuSg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711989050; x=1743525050;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=eTX/7NaNoXDzfyhrzqmm6Ups4VgCiQZr26N1KsucA/U=;
  b=SIR3iuSgGE45E9Yqg4nq9MJhlKuAU6367M2QK0Kcwjqz3V9xQaitCaq7
   fgeWQg3YsPx7O2EF0+3Hbe3PLsSIE5VYL2UG7sA813fdMb0apG7NAxigr
   Wl/ivbV3NUoK0rllBG1sVSg+2Oa1Pr+GHihne4M58bXCPecAqjjfUUMWB
   U4s6I6h3hWxlEgs0wjXxbCn3UWOZOLOVhTTEJBK95/I0Dwbt2G1hmyvHj
   VaMKfrt73/oYxHK7VsQEfilO8buYDR+x6e0n6Tuu1JnHeICebz8MfnhLu
   kLv/1AxSwdAJA0wvRoF2HmGvLLrVWpFnQcrDx3bhH6lR5OWdxNBpet+sM
   Q==;
X-CSE-ConnectionGUID: FGVnPCGuTWmQTZjItDEuPw==
X-CSE-MsgGUID: YwgB6T3sQue1QAENpSXWrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="10083779"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="10083779"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 09:30:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="18224594"
Received: from anahar-mobl.amr.corp.intel.com (HELO [10.212.2.239]) ([10.212.2.239])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 09:30:47 -0700
Message-ID: <54ace545-8cdc-49aa-8214-5f07bee0e2f6@linux.intel.com>
Date: Mon, 1 Apr 2024 11:26:43 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/16] ASoC: remove snd_soc_dai_link_set_capabilities()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87h6gludmj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/31/24 19:32, Kuninori Morimoto wrote:
> snd_soc_dai_link_set_capabilities() checks all CPU/Codec DAI (Y)(Z)
> for Playback/Capture (X) and checks its validation (A), and setup
> dpcm_playback/capture flags (a).
> 
> 	void snd_soc_dai_link_set_capabilities(...)
> 	{
> 		...
> (X)		for_each_pcm_streams(direction) {
> 			...
> (Y)			for_each_link_cpus(dai_link, i, cpu) {
> 				...
> (A)				if (... snd_soc_dai_stream_valid(...)) {
> 					...
> 				}
> 			}
> (Z)			for_each_link_codecs(dai_link, i, codec) {
> 				...
> (A)				if (... snd_soc_dai_stream_valid(...)) {
> 					...
> 				}
> 			}
> 			...
> 		}
> 
> (a)		dai_link->dpcm_playback = supported[...];
> (a)		dai_link->dpcm_capture  = supported[...];
> 	}
> 
> This validation check will be automatically done on new
> soc_get_playback_capture(). snd_soc_dai_link_set_capabilities() is no
> longer needed. Let's remove it.

Humm, this is really hard to review.

soc_get_playback_capture() used to do a verification of the match
between dailink and dais, and now it doesn't have it any longer and this
patch removes the checks?

