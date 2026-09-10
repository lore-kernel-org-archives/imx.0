Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853AA3E2746
	for <imx@lists.linux.dev>; Thu, 10 Sep 2026 12:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789042501; cv=none; b=WAZG6sI9MEX5pLw9+xWkS7UhPb5TCoyJdwt83T2zzShNvEUKfUFRVZLw3WUYoieN4733jaGqmmUGB18vd33AB0k2/Ss6orvNVrhtbizNAfkXyMZtmbqGy/Vb61zXJkHnbqTDjEA1jKjWP6CM4wDTEgF2uB/XI9EUiM/6Zh0Lz5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789042501; c=relaxed/simple;
	bh=3nQyaecZsUcB0GBTRpE9wQWbqnay97vHqbl+yHN7CCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y3ZqLYMdSEbrHc43yuqFxKNmC4odIAekFrUw0ZYLRxHs1sR1+lxxnTdWB9BGaryvS0/vDU4V4UjvHt8cKDwbGS8usDCGaWqErtCvjzv93XSIJc9KbPaYV9rX8xJdhSReNLa5Pf5/my0pQs3qj7/QMULjD91aDUPlquZDdsIBpxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQYwjcwA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQYwjcwA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789042498; x=1820578498;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3nQyaecZsUcB0GBTRpE9wQWbqnay97vHqbl+yHN7CCU=;
  b=KQYwjcwA11lLAVfNVMchRrbnQt6vWkBWEV9BGfu262XCg86bLIOso8qB
   Eavh5+0ClQgLULBLToYyun2jtoIsQRvMnsh1hSQbY3Oo/OEn+NQmdVa0x
   vOAAHijTSb/Un1rAtv/nXGSNzW4Masl3A3UYeMnw8WMsNw8ZYO7/gjAej
   y74MY45z5IhXCUE6UdS0JpLm4QSuHQLvdMHbMl7MsBKL6nlzAc+0GqCmJ
   lYlQD8UgbjNSGINpSXxDl1ki7R+ByThWU999RGH/L+B4i1E9VG1ka9z29
   zKI82BLuDBTAUMRr4d5yxQDwOYpGPzb1t12VcmXP4RUVYOaDlHP3VUzST
   g==;
X-CSE-ConnectionGUID: PZBhC+THQnek3TDisYKmoQ==
X-CSE-MsgGUID: RPcz/tTqQqOevYzGScRAPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99820845"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="99820845"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 05:14:55 -0700
X-CSE-ConnectionGUID: JHhdoNf+SL+ErBQi7rLG2A==
X-CSE-MsgGUID: Ev10l9m3SDumG8ViUn8H6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="269843818"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.173]) ([10.245.245.173])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 05:14:49 -0700
Message-ID: <2e719483-4e2a-46a2-a3fd-0c89bd1420e2@linux.intel.com>
Date: Thu, 10 Sep 2026 15:15:00 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: Bound the panic filename print to its array
 size
To: =?UTF-8?B?yJh0ZWZhbiBHaGXIm3U=?= <stefanghetu9@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260909204042.46656-1-stefanghetu9@gmail.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20260909204042.46656-1-stefanghetu9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09/09/2026 23:40, Ștefan Ghețu wrote:
> struct sof_ipc_panic_info carries the panic location as a fixed 32 byte
> array, and include/sound/sof/trace.h documents that the "filename array
> will not include null terminator if fully filled".
> 
> sof_print_oops_and_stack() prints it with an unbounded %s, so firmware
> that fills all 32 bytes leaves printk() with no terminator to stop at
> within the array. It continues into the adjacent linenum field and, if
> that holds no zero byte either, past the end of the structure into the
> caller's stack frame, since every IPC3 dbg_dump callback passes a stack
> allocated struct sof_ipc_panic_info.
> 
> Use %.*s with SOF_TRACE_FILENAME_SIZE so the print honours the
> documented bound.

Same thing as for the ASoC: SOF: ipc3: bound firmware-supplied ext
header size.

The firmware internally constructs this and it makes sure that it is
terminated.

To change that you need to compromise the system first and when you are
there you don't need a compromised firmware.

We trust that the firmware has not been compromised as if it is it means
that the whole system has been already compromised.

> 
> Fixes: c16211d6226d ("ASoC: SOF: Add Sound Open Firmware driver core")
> Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>
> ---
>  sound/soc/sof/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
> index 2d394389c945..9b0850e87bf6 100644
> --- a/sound/soc/sof/core.c
> +++ b/sound/soc/sof/core.c
> @@ -152,7 +152,8 @@ void sof_print_oops_and_stack(struct snd_sof_dev *sdev, const char *level,
>  	dev_printk(level, sdev->dev, "trace point: %#010x\n", tracep_code);
>  
>  out:
> -	dev_printk(level, sdev->dev, "panic at %s:%d\n", panic_info->filename,
> +	dev_printk(level, sdev->dev, "panic at %.*s:%d\n",
> +		   SOF_TRACE_FILENAME_SIZE, panic_info->filename,
>  		   panic_info->linenum);
>  	sof_oops(sdev, level, oops);
>  	sof_stack(sdev, level, oops, stack, stack_words);

-- 
Péter

