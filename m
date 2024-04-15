Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B249E745D5
	for <imx@lists.linux.dev>; Mon, 15 Apr 2024 14:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713190765; cv=none; b=Vrs/Yur+ffaQmAMN2GGWAjlm7GwpW1e8Q47cDxqnMVOMt3I6FAkqBhIxwwdqQRXGx+5RkNej++IKMriU1Z/brR+sNNIBq2n3y5SAIGiXxk7xwBrBZbwVZpbgOfhKv51v2u1NxFnXrqtjIEX/9Cs1+OPU87NdsBB7yFpQy4eNq34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713190765; c=relaxed/simple;
	bh=WU5KDltuTt9aQCPYXF9+eq8jRI7Tg8SGbP0xqq6dmYs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KlAFA/sll742PK4ekbpHHURnUsgC2bJjP699ZRQUzUaT89nfUEiyMNnu84C5HwSoYbMWC/ptJE8SfwW1rbZImIB3B7lrYuckZHA+SmBQGEJgqaguHiAE3GX7cxY1fAgxL3tYZexgMRzM/X75WeKgdX+Nc7gpQZBR0HxRvHpNsCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9G6dTMk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9G6dTMk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713190763; x=1744726763;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=WU5KDltuTt9aQCPYXF9+eq8jRI7Tg8SGbP0xqq6dmYs=;
  b=I9G6dTMkSZCwWMKZq1UbQS5rcThRTeX6e1U56iYK0+SQG842MO5DM/B0
   RGE5+9R2kqzK0Xxu5zS4XIzVE3DEHyLBuyqUxXpBF+8QEKcbsdkjI20SE
   z5URpM8cMfwvucZ5wT28gIdnc89h2nZCHhIDg9eG6R7dzeMkIghZAFEJx
   VtVLeKA83efxgkDbjQWqorLbGkHV0vPbHWrFQarRovNpef2JUVfIbg4re
   pG1aadXCeAcmXDuJHlprAzPq+NR9oPJGLo9PT2Lxx5Vsjgm4QpxRRyXl7
   vJxw5KiW/j0nHaztG8recoSxZ68ZziXqxU3wWjufcNAZxnKU4sMxR3k1x
   g==;
X-CSE-ConnectionGUID: ajvpljXFRhKMWdv0olmOdA==
X-CSE-MsgGUID: XXXro+PsR9qCQWEBO729mw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8443594"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8443594"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 07:19:23 -0700
X-CSE-ConnectionGUID: 1TdWzhgfSOmUQ40OtUKQlA==
X-CSE-MsgGUID: dlzDrL9kQtGH1m7YQEahRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="26347149"
Received: from sadhupha-mobl.amr.corp.intel.com (HELO [10.212.11.252]) ([10.212.11.252])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 07:19:22 -0700
Message-ID: <89f8f0be-2534-46c8-9058-cabea4f68568@linux.intel.com>
Date: Mon, 15 Apr 2024 09:19:21 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/14] ASoC: Constify local snd_sof_dsp_ops
To: Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240414-n-const-ops-var-v1-0-8f53ee5d981c@kernel.org>
Content-Language: en-US
In-Reply-To: <20240414-n-const-ops-var-v1-0-8f53ee5d981c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> The core code does not modify the 'struct snd_sof_dsp_ops' passed via
> pointer in various places, so this can be made pointer to const.

The structure itself is NOT always const - the initialization itself
does have platform-specific changes, so what do we really gain from all
this?

some commit messages say the code is "a bit safer", but I personally
find the 'const' more confusing since the information that the structure
can be modified during initialization is lost.

