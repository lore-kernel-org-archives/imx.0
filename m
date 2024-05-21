Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1100514A8E
	for <imx@lists.linux.dev>; Tue, 21 May 2024 15:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716303849; cv=none; b=mGqJJ9a3brXNLSsFzbzsIGS8LPkDZ6YOqlHfgG2bQ3tt+n8TG3/jR4AZs+FJYqNOKFFjPfE2xqcPVwWtxQKei28toKDuNZYYteEiH2SrpV++37kEpuRv++K+mv6tcXoBA8mxd+wys1EB5iKfCRgEa6ERXrfGiZdNphg5rpdC0Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716303849; c=relaxed/simple;
	bh=QH+jxpZJ7+q25EINDFGxXNJP1mlcv08ZKRhlur3HLdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=krEtOWu0E2cILM6gCgsCr1HRHDoMNztBmiBMTL3K2lVppecBCqoQdrF1maHtuxCbcUKjPfn85QKjF/mUhTLTVpsdiuJ6cm9xzciW/SNAj/0QiCcaXxb3U1AoBYLFmxojyW0v4Vm4MHnWN5Ji1iB9GsXkdN+RbwSmzrIuHgYyunA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VwrDZn7I; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VwrDZn7I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716303848; x=1747839848;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QH+jxpZJ7+q25EINDFGxXNJP1mlcv08ZKRhlur3HLdU=;
  b=VwrDZn7IxqoRCbNH6t54S+mssjW0xm/0REOgo7ooUQTGp1OBfHf/uHT5
   OfpaUEgnZRTVvNO8c4cnRTNP7Jw2LjX9Jms+rdjFGO2ZhVtHzR0YWoBiH
   nDS0/sON1UvG0Pi+Xv9Maxy8ZP6S9nSr8FrEI1vtoBLd9Vui11NUtrMSo
   uIsOqf5uuI/kccBCxr9cwrgGhd6TGYJSsFg2uU4Kt+4UXkJPhHqqAzNaq
   8k3g4fTWfZbYvuO/93Ytb2+NulpcTLhWTwVDDwyEACHrh2OlvG5khM0Qr
   w7oSdM1SANIBajKiKayIYLcivfjQLRp920+eEFoQR+HmJ9yC13a8kvMlK
   A==;
X-CSE-ConnectionGUID: 5s5r6MR8QiWUBgN9+nS+og==
X-CSE-MsgGUID: okxeye06R4aUpcp8GgdULQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="16343160"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="16343160"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 08:04:07 -0700
X-CSE-ConnectionGUID: M2q3kxPiQWuVHkmLFXUSjA==
X-CSE-MsgGUID: o4ITyljUTQKDVHRYws8yvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="33369001"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO [10.125.109.138]) ([10.125.109.138])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 08:04:04 -0700
Message-ID: <3e67d62d-fe08-4f55-ab5b-ece8a57154f9@linux.intel.com>
Date: Tue, 21 May 2024 08:43:09 -0500
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
 <7b430ea3-3ce8-4ef9-8440-bac02993f676@linux.intel.com>
 <875xv8c6dn.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <875xv8c6dn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/20/24 20:15, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis, Mark
> 
>> We cannot change the Maxim amplifier driver, it's used in a variety of
>> usages and platforms, and there's no reason to create a fake capture dai
>> just to reflect the use of a capture stream on the CPU side on some
>> Chromebooks.
> 
> Why cannot ??
> There is no effect to user if Maxim driver has full channel setting same as
> dammy DAI. It will be handled together with CPU, and system gets CPU
> channels as-is.

That would be changing the meaning and purpose of a 'dummy dai'

A 'dummy dai' has historically been used when data was
transmitted/received but the control of that DAI was done externally
with a sideband interface.

Here there is just no hardware for capture in the Maxim amp.

Adding a pretend DAI for the sake of adding a stricter 'sanity check'
does not sound good to me.

>> I don't disagree that the unconditional use of dpcm_capture isn't very
>> elegant, but it is what it is. This platform has been around since 2019
>> and still has about 6 or 7 years of support, so we can't break it with
>> stricter criteria.
> 
> My opinion is that working without channels settings is wrong.
> I can understand that it was working in long years, but it is working with
> wrong settings. So justify a wrong-settings is not good idea for me.
> And I don't think it is stricter criteria, it becomes *sane* criteria, IMO.
> 
> Because it was working with wrong-settings, we need to makes it sane.
> This is the reason why it has grace time.

allow me to give you another counter example, beyond the AEC reference I
mentioned earlier. It's not uncommon for CPU DAIs to have loopback
capabilities, which are used for tests on boards where the codec has no
capture capabilities. I think it's a feature that needs to be allowed,
not a 'wrong setting'.
