Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E2343ADF
	for <imx@lists.linux.dev>; Tue, 26 Mar 2024 09:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711444585; cv=none; b=lHIyCLefTxK99eOjj1PFp0L6OyKHKKOmlGsal/jMFmyjz2El+G22mEhigi1ZXyiGclkdjyIp4qDxwDgKSmqbNzBSCWiLnYeK98hoF9B5nIxjC1IdWJALeO6JNamQmSFWxaS/FqZNJekyMe5v+OMx4WJqxrKHXPeCbzGvpIooXu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711444585; c=relaxed/simple;
	bh=bedNodAL0epS6BTRsXC3wvUj3ZKA55DLlAXiTh5Pi8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CRgw4gaCyx+5S+kQKsAnmmFyUKEPw8AbpRXkChlY4TOWLlk7dnvMHXcSgMG43++ShQNWlfXiDbJ/A2U315Li1jYr8JRDWi0PXiK8IS/dTzPodXoYwErJsYxnjXY5qYq5fb2CT0+75XPOezaM1l/h52sujnaouRKMxOrTmLt1SfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1iSVUWx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1iSVUWx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711444584; x=1742980584;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=bedNodAL0epS6BTRsXC3wvUj3ZKA55DLlAXiTh5Pi8k=;
  b=Q1iSVUWx4bbWIbvcHT0uDUuuC+ORqw/5Pp9SWOMagzxfOsH/oCKo47j2
   yvVIUE6kbrbmlPq6+LqbLlx4sL6uiYzKzUzESj9vO0sj+ka4TcnvVn80e
   N3qHtBr7+XVBVgVeM7pX6LuMezlG7oigDSipoanzKxOdxE3XoZ8OfcwZm
   pJXv6ywX2MYc7O5CH4u6mL9hdcgfJgZWr9EfMMbh8Oud/Lyc4SgwJBLLn
   u3lwWQK1HWZTVJU0S9e4Av/OqNLMX3BhihzTJo2p0XWaldMbWnHYmsNDw
   sQuAj+vBCe23laizKMbsKc4ZdZIhT8FS7xe/EBxCtYfOQCAEIIBsBAXwM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="7082135"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="7082135"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 02:15:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="16564237"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 02:15:28 -0700
Message-ID: <80b9d7ed-5ddf-488b-8839-a96f85cfe9e0@linux.intel.com>
Date: Tue, 26 Mar 2024 10:15:26 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/15] ASoC: Intel/avs: replace dpcm_playback/capture to
 playback/capture_only
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
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
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org,
 imx@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
 <87bk7353m7.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87bk7353m7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/2024 5:37 AM, Kuninori Morimoto wrote:
> soc_get_playback_capture() is now handling DPCM and normal comprehensively
> for playback/capture stream. We can use playback/capture_only flag
> instead of using dpcm_playback/capture. This patch replace these.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

ASoC: Intel: avs: boards: Replace dpcm_playback/capture to 
playback/capture_only

Fix prefix and start commit title from capital letter, otherwise seems good.
