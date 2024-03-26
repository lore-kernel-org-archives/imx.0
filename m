Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBDA70CDA
	for <imx@lists.linux.dev>; Tue, 26 Mar 2024 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711455950; cv=none; b=mLsnn5DyVtOWEzP0FV1TGPhYqTiiS8hFZY2rwpmggWVeDHR5HNaP2n98trKi2FpBNpJVPJCe8yqiujRS8yBYJKWN50W/dpjBBdIaSL7+QSc9GsXQOpImhZwdUhmesKDX3cupaLti2EaWIppvL8YqRwirNFPRx/D6GkHeCrFwmfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711455950; c=relaxed/simple;
	bh=4/FUC3PgeGbPj/ACm7P2erlBnN7nF3Qy/MNNSPLifnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VJlK4MI87yyZn2x3HEX8/ohq8VrgRZFtynqLSX/Br//DU5MBzX3aS1jUOGjV2PvMQH971g6ipPcP0WaEH95pOcRTrvPanv3t59YUoAW7QXSS1Id7oQKdEusslaB5+iFnTyFNHpN0tIhUFJ4OLMLAzsqzFo2mgdyjY2Src9VUBzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mMZXRHFN; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mMZXRHFN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711455949; x=1742991949;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=4/FUC3PgeGbPj/ACm7P2erlBnN7nF3Qy/MNNSPLifnI=;
  b=mMZXRHFNQDbzw08D5xPP8nlDeu9EiarPYstgjkqnGu/Z/7bHyvKIhE72
   H/+Pfl6ZJaTYI7c2H2LcVk3rr+sHsDmDZhOFSlwhAcDNdYTGAy3vXF+rk
   j5eYvxsiJPeCQSZomQACrGFOdkbh/m3VLAjXf4DyNpXy0ke8DAMiCwILB
   7XIGKg05w3ULCyCUAS9nMjDls4VCxLXSSzWJcRV6ZCqXVO/8p5GVxDrD3
   FBtb8ebDGXOq+1fYPd7eKvi99u1lT1antL8P3+9TqEhT3POBWzEmtmnje
   QlK27D0lh7lf430HkUAKCXXo5k66X7WqV4NpzDuFcqAoa4gJuiLofSaKY
   w==;
X-CSE-ConnectionGUID: bnuzN+7FT9G+x+dZzn9ZuQ==
X-CSE-MsgGUID: bxddS2PHQdCV/vlQk1sfIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10299237"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="10299237"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 05:25:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="47099724"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 05:25:41 -0700
Message-ID: <83d63442-ae4c-4e5e-a610-c0c0be54d50e@linux.intel.com>
Date: Tue, 26 Mar 2024 13:25:38 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] ASoC: replace dpcm_playback/capture to
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
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/2024 5:35 AM, Kuninori Morimoto wrote:
> 
> Hi Mark
> 
> When we use DPCM, we need to set dpcm_playback/capture flag.
> If these flag are set, soc_get_playback_capture() will check its
> availability, but non DPCM case is checked without special flags.
> 
> OTOH, it cares playback/capture_only flag. It is needed.
> 
> This patch remove DPCM special flag, and replace it playback/capture_only
> flag if needed.
> 

One general note, I wonder if playback/capture_only should be renamed to 
something more descriptive, current names are a bit weird from use case 
point of view. I mean no flags, means both capture and playback are 
enabled. Then you do something like playback_only = 1, which effectively 
affects capture stream. Notice that flag is named playback, but affects 
capture. Perhaps, something like capture_disabled, playback_disabled 
would make more sense? This would also make more sense to me for 
something like playback_only = 1; capture_only = 1; which while weird 
doesn't instantly seem that wrong, while disable on both directions 
instantly seems broken.


