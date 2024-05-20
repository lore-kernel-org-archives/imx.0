Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAFF3611A
	for <imx@lists.linux.dev>; Mon, 20 May 2024 23:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716248576; cv=none; b=BIKEKI+koBulGLGk/QRaocG5TH8bcfuSrQLHMUCNsIh4fAqObmlX6d+5Kg13IY5n+JwOQ0d3dKvaPxTbrzPqWjSKeLm01KS8nQIdz2g1GjH5LRGm1KjCcTkKrMUy5p+/3XOJK+Ju5LFFE3mmo3wXLgXix4AqKaV3xz4XwEBVOTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716248576; c=relaxed/simple;
	bh=LvhNE47HwRc9IiFLm1WRvgRimgtExT7XKlEYXYcZPSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=huTkjKVZMpnpldGA15bJ8zwLKJH+5tBkhotjCV4bONIeYFx66GPNERabo4UVDnAqcHQs1OJevv+g2ZSxWTuYG+Q6dfRW3ye7JfIFGrKDxzeKGIQZcCYEP7RuokpsdCsvVRKEocdTbGLTTWmkdaQqeRgTFtLaFc3ialTAHKE++wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HWlyz+zM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWlyz+zM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716248575; x=1747784575;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LvhNE47HwRc9IiFLm1WRvgRimgtExT7XKlEYXYcZPSw=;
  b=HWlyz+zMEk5rJl92lP3TcRAAjveJ+FhS7nUZ3zA0TyGDkZ2ktocU4BL9
   cUrhGJvcvgTTBAE68oF+lXNtHrvxlo8yjk8rVLSRKRXgRUDElbniE24/5
   NX+U7ePN7B6IDQW8cJPXMdA5GwV/lYxjukCHHN83sc6dM7wI72mVsTYgc
   45XqvYp8rEYwprWb2pX6xJk4lIvZOFVQmnGtFm7aYhHJrHqU78v7gObqS
   tFUPYzAvSMXXkmqu+DGdxQNo+dfH7/fKwp1rWVSm86h8yczK1Q4BhHwd4
   c2uETG4ZwmvzS3T1zmwenpOdhWv2Ap5Vsp07q0B1rMJUd68Aii8vo1qGg
   A==;
X-CSE-ConnectionGUID: krbs5pe6S1GCRekf2CqdBw==
X-CSE-MsgGUID: 6Do4NgWNSJKlZhPv3wzNdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23550046"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="23550046"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 16:42:55 -0700
X-CSE-ConnectionGUID: b0vyrOh3RVCjrDoQ8W4qOg==
X-CSE-MsgGUID: kStHjqW3TkGraF/ISJU4lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="55952024"
Received: from ldmartin-desk2.corp.intel.com (HELO [10.125.109.115]) ([10.125.109.115])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 16:42:51 -0700
Message-ID: <7b430ea3-3ce8-4ef9-8440-bac02993f676@linux.intel.com>
Date: Mon, 20 May 2024 18:42:49 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ASoC: soc-pcm: Indicate warning if CPU / Codec
 availability mismatch
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
References: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
 <87jzjpe5vh.wl-kuninori.morimoto.gx@renesas.com>
 <77e9221e-05d2-453f-9ce1-ff4a4b53d09d@linux.intel.com>
 <87y184cbed.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87y184cbed.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>> I mentioned in my previous feedback that this isn't quite right. There
>> are cases where the CPU dai reports capabilities that the codec DAI does
>> not support - e.g. when the AEC reference is generated in firmware on
>> the host DSP.
> 
> Hmm... I thought all issue was solved...
> 
>> For those systems, trying to match CPU and codec dais is not going to
>> work. Either we skip this verification or we have an escape mechanism to
>> avoid triggering errors.
> 
> Sorry, but I'm not 100% understand about your situation.
> Why Codec can't have channels_min ?
> If the Codec can flexibly adjust to paired CPU, Codec can have full channels
> support, like dummy DAI ? This means verification is based on CPU only.
> Is it not enough ?  and/or Can you show me the driver ?
> 
> 	static struct snd_soc_dai_driver dummy_dai = {
> 		...
> 		.playback = {
> =>			.channels_min	= 1,
> =>			.channels_max	= 384,
> 			...
> 		},
> 		.capture = {
> 			...
> =>			.channels_min	= 1,
> =>			.channels_max	= 384,
> 			...
> 		 },
> 		...
> 	};

We cannot change the Maxim amplifier driver, it's used in a variety of
usages and platforms, and there's no reason to create a fake capture dai
just to reflect the use of a capture stream on the CPU side on some
Chromebooks.

The dailinks used for amplifiers in
sound/soc/intel/boards/sof_boards_helpers.c set dpcm_capture always

	link->dpcm_capture = 1; /* feedback stream or firmware-generated echo
reference */

which means that this test will fail:

if ((dai_link->dpcm_capture || dai_link->capture_only) &&
		     !has_capture_both)

I don't disagree that the unconditional use of dpcm_capture isn't very
elegant, but it is what it is. This platform has been around since 2019
and still has about 6 or 7 years of support, so we can't break it with
stricter criteria.

