Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D175E249E4
	for <imx@lists.linux.dev>; Mon,  1 Apr 2024 16:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711989045; cv=none; b=PwaNfcL/xzZgxNaB1K7lAPvqHGiy37IgMbBR0YSKGDxOudGLIiyzZZE4uWlX2bh4NzgJiQH1zzunvYPk5sJzSWdSUxIQ4X6R56/wG63plxTnwvsY+MSaM5jPBdhzPv41oAY4QntjkjIm2hebr4PVxVqHAjXtbs44KxKXNVuqEQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711989045; c=relaxed/simple;
	bh=We8RhjSoQyKJDk6eS1AbKIbMbdXENaZJi6/IEW4ighM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dcjxtXogPpnOG2dxjKf7PleWllp44YGqW8TPIhyFa062GrvjJr1zKnK5XwWLSr1JIVVPbJH0sDAZ4sXg5jO+7XdT8X2lq7aIEgO/uWRhiZsYF8FneUzmRRShqhWSAtjM5PX1LezyNVlU40/qgDU8FxLguPLAdtYREQRFxEh5NRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jkpdvfc4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jkpdvfc4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711989044; x=1743525044;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=We8RhjSoQyKJDk6eS1AbKIbMbdXENaZJi6/IEW4ighM=;
  b=Jkpdvfc48++oFBuevvSmVcIU0PgKYbH+q0S1EBMTtMW/Nh+f8CJjzJiH
   nGxeWSTPM1OOCSCUh6sMNj+Ws4YYMZAaM+Mvwj15mk+B7lq8qFmYvy4e2
   Vbb//QrIIj+vdLuxh6htcXRB+iJ/GdlSb7/oRIPneYcqlQS7eHmxRcan2
   tXW7PKwdSNuxiMfD0zwVSiXjybAbTpyG4L3WTbBezJ02tIE7UUn5AWwR7
   6IkdBrHLH/1L9GxyhHoXjdrU7PiAtpRXXTtU2r4OS6TxNjiIrn8b3bC1c
   p6Uh7ZuJn307hKeoo/8/spSCi5oysNtbe+w8niVbGfLP1s0xyACWiTi32
   Q==;
X-CSE-ConnectionGUID: Xl7iNAxSTT2mG6iDabFDQA==
X-CSE-MsgGUID: MtqgLXhlQDGbVvKeMuWNzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="10083724"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="10083724"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 09:30:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="18224578"
Received: from anahar-mobl.amr.corp.intel.com (HELO [10.212.2.239]) ([10.212.2.239])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 09:30:41 -0700
Message-ID: <2b75ffc8-cb97-4a5a-bb3d-34b9e9fc3bc5@linux.intel.com>
Date: Mon, 1 Apr 2024 11:12:16 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/16] ASoC: sof: Replace dpcm_playback/capture to
 playback/capture_only
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
 <87ttkludo3.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87ttkludo3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/31/24 19:31, Kuninori Morimoto wrote:
> soc_get_playback_capture() is now handling DPCM and normal comprehensively
> for playback/capture stream. We can use playback/capture_only flag
> instead of using dpcm_playback/capture. This patch replace these.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/sof/nocodec.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
> index 34aa8a7cfc7d..a0105c31723c 100644
> --- a/sound/soc/sof/nocodec.c
> +++ b/sound/soc/sof/nocodec.c
> @@ -55,10 +55,6 @@ static int sof_nocodec_bes_setup(struct device *dev,
>  		links[i].no_pcm = 1;
>  		links[i].cpus->dai_name = drv[i].name;
>  		links[i].platforms->name = dev_name(dev->parent);
> -		if (drv[i].playback.channels_min)
> -			links[i].dpcm_playback = 1;
> -		if (drv[i].capture.channels_min)
> -			links[i].dpcm_capture = 1;

Sorry, I don't see where this functionality is now moved?
soc_get_playback_capture() doesn't seem to have any logic based on the
channels_min value?

>  
>  		links[i].be_hw_params_fixup = sof_pcm_dai_link_fixup;
>  	}
