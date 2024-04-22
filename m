Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2106A1BC30
	for <imx@lists.linux.dev>; Mon, 22 Apr 2024 20:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713818580; cv=none; b=fnxDo7zn3es7RRFP9t35bWhszw8GOWqNRtSBRoBFBCPuE9BP/FEnkurq64kwae+eoVxTenEG6FZ7eWEmDyHVWGvjDwTkSs4jcp7OpMmTLcpo7/DKoN4xXWiwmFD7PF21XtNUnoW6Wals7Vckz//qom249VMQkuGxKp13zK/ZrEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713818580; c=relaxed/simple;
	bh=mqvvD4M+5zrVu9tFt8LtTjqLGdgftrUuwLZoC1BIpFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b+ZH4v80YBQiFuiNuxCvazoQVaG751HXbZXCj6YLHZ80jFk4OAMjqKBYbGGkFINgdULk7SiiCX6ireiUL9DipWilDHVzmPGWLkLXpqS1+tP7AycITGFA4dhYAniQ23cWS68o6jN2oKo5a6q2vxmPIAPeWUPArSuhPGFGGp31a7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kv5GocMB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kv5GocMB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713818579; x=1745354579;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mqvvD4M+5zrVu9tFt8LtTjqLGdgftrUuwLZoC1BIpFI=;
  b=Kv5GocMBnQB5o9ZdEutJ7apqWSmCMSdvhq8lPGqBD7p8ddVsMrbm8OaW
   in7D8xUytBjZsGVliTlOwh6X9obfOqoxBKxO7VCN9vG8yG7QeO/4/71Mj
   3ZQ3z1gmnPE710MU1Sxm5PWIgYqRviAvJ4NZ4i7ZVGMG8vccoQrK+qy7X
   u7s+PsOIoWMMz9Ewbh/xwszIWnYb1CT4wG2/xMv/ZSPz1S5tsruTzxLfb
   S/LnTXqCkxLBEKA5y5fpWUJDsNB6BOlR5sF3KB2T5qSCs/BFoeLOg6vIS
   TGGEePr2Ca7q3FNirEckXDLcCNA8WmMceilaH4/cYF23W2/eGL7Re3q/W
   g==;
X-CSE-ConnectionGUID: ptkHbRDXQnK36j3KfzHc1A==
X-CSE-MsgGUID: wt1ZaZRvTGmb0XfnMDQGqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9234802"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="9234802"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 13:42:18 -0700
X-CSE-ConnectionGUID: rSzjNxCYSl20z5E0RZYZ6g==
X-CSE-MsgGUID: uIIvBbpfTemBmMRl7pKJ5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="24747861"
Received: from leozhang-mobl.amr.corp.intel.com (HELO [10.212.37.174]) ([10.212.37.174])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 13:42:14 -0700
Message-ID: <93294e52-97e5-4441-a849-867429da6573@linux.intel.com>
Date: Mon, 22 Apr 2024 15:12:04 -0500
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
 <92054f87-dded-4b66-8108-8b2a10909883@linux.intel.com>
 <87edaym2cg.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87edaym2cg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Morimoto-san,

> I still wondering why dpcm_xxx flag itself is needed.

That's an excellent question indeed. And since you started a historical
review, we can get a lot of information.

> (A) Before, it checks channels_min for DPCM, same as current non-DPCM.
> This is very clear for me. Let's name this as "validation check"
> 
> 	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
> 		if (cpu_dai->driver->playback.channels_min)
> 			playback = 1;
> 		if (cpu_dai->driver->capture.channels_min)
> 			capture = 1;
> 
> (B) commit 1e9de42f4324b91ce2e9da0939cab8fc6ae93893
> ("Explicitly set BE DAI link supported stream directions") force use to
> dpcm_xxx flag
> 
> 	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
> 		playback = rtd->dai_link->dpcm_playback;
> 		capture = rtd->dai_link->dpcm_capture;

The reason for this (B) addition is very clear from the commit message

"
Some BE DAIs can be "dummy" (when the DSP is controlling the DAI) and as
such wont have set a minimum number of playback or capture channels
required for BE DAI registration (to establish supported stream directions).
"

So (B) introduced these dpcm_xxx flags as override mechanisms, where the
dailink information matters more than the dai information.

> (C) 9b5db059366ae2087e07892b5fc108f81f4ec189
> ("ASoC: soc-pcm: dpcm: Only allow playback/capture if supported")
> checks channels_min (= validation check) again
> 
> 	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
> 		cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> 		...
> 		playback = rtd->dai_link->dpcm_playback &&
> 			snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_PLAYBACK);
> 		capture = rtd->dai_link->dpcm_capture &&
> 			snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_CAPTURE);

It helps to look at the commit message in detail:

"
Normally the dpcm_playback/capture parameter should match the
capabilities of the CPU DAI. However, there is no way to set that
parameter from the device tree (e.g. with simple-audio-card or
qcom sound cards). dpcm_playback/capture are always both set to 1.
"

This is where the direction changed from "dpcm_xxx" being override of
DAI capabilities to "dpcm_xxx" being required to match DAI capabilities,
because some machine drivers incorrectly did an override that made no
sense...

(C) is essentially (A) && (B)

Clearly there's a contradiction. If (C) was the correct solution, then
it would revert the direction in (A) and report an error for dummy dais.

It's been my question from the beginning of this thread, when the
direction information can come from 2 sources, which one do we trust?

> (D) b73287f0b0745961b14e5ebcce92cc8ed24d4d52
> ("ASoC: soc-pcm: dpcm: fix playback/capture checks") expanded it to
> multi connection.

You really want to look at

(E) 4f8721542f7b75954bfad98c51aa59d683d35b50
("ASoC: core: use less strict tests for dailink capabilities")

"
This patch modifies the snd_soc_dai_link_set_capabilities() helper so
that the dpcm_playback (resp. dpcm_capture) dailink capabilities are set
if at least one dai supports playback (resp. capture).

Likewise the checks are modified so that an error is reported only
when dpcm_playback (resp. dpcm_capture) is set but none of the CPU
DAIs support playback (resp. capture).
"

This one has not fundamentally changed the reasons why (C) was
introduced, the requirement is that dpcm_xxx be aligned with at least
ONE DAI capability. It's still not clear how dummy-dais would be handled
since the number of channels may or may not be set for those dummy-dais.

> So, I would say nothing has changed, but become more complicated.

It's not really become more complicated, the open is which of (B) or (C)
are correct.

> Or if (B) added dpcm_xxx as "option flag", it was understandable for me.
> like this
> 
> 	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
> 		playback = (cpu_dai->driver->playback.channels_min > 0) ||
> 			   rtd->dai_link->dpcm_playback;
> 		capture  = (cpu_dai->driver->capture.channels_min  > 0) ||
> 			   rtd->dai_link->dpcm_capture;

That would essentially revert (C), since the direction would ignore the
actual capabilities of the DAI.

IMHO, we should really try with this revert and go back to the initial
definition of (A), where dpcm_xxx is an optional escape mechanism to
allow machine drivers to set the direction. I would guess that would
impact mostly DT/simple-card users and Qualcomm, if the commit message
of (C) is still relevant.

Then we can discuss about merging code and removing flags. For now we
have different directions/opinions on something that's 10 years old,
last modified 4 years ago. We will break lots of eggs if we don't first
agree on what works and what doesn't.

This 23-patch code merge/simplification is premature at this point IMHO,
we should first land in a state where everyone is happy with how
dpcm_xxx flags need to be handled. We can merge dpcm_xxx and xxx_only
flags later when we understand what they are supposed to do...

And now I need a coffee refill :-)

Regards,
-Pierre
