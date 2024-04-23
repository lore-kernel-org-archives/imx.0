Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B47A13CA83
	for <imx@lists.linux.dev>; Tue, 23 Apr 2024 15:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713887825; cv=none; b=Kw8osqz3s13l/3zseHPK0cg2GXWvtRhiIYoQk9iakVGVFSp4MCxZmy94GCFv940mRrNABkfBWSQg6OKiAvqX6qGYPDSgNtAAlOF86vii3ihYMDtS0vY0J/oCIPkuh97KZmm8fFeh4oyAErsyX4nj7sQcLcUFmoJOkiwdKe87kLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713887825; c=relaxed/simple;
	bh=Ao7OtFR6Y/gnMao2EDCJiWEcU30WgANyFzpo/uxrtFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=coiHfoBgCrd36QBESezXw7WF+Pm9uwiYnzd8ZX4wWnsLhntiehoXoDGdx0XL6mdT3nftXMB+D1gptqn28hq9YIUCCVfRzOKjehkJ2WfPwFJLu+iz+7tUauENiX6X4Do1xRRsTG/v8m/+BNnE5zSH2EbM/U4Aw3io4oSBjmCRhvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MSsE+BT1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MSsE+BT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713887823; x=1745423823;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ao7OtFR6Y/gnMao2EDCJiWEcU30WgANyFzpo/uxrtFM=;
  b=MSsE+BT1kNZxX6g5LujAKTSonjhCtQ+Il/KqmhM5Agaqz/I26H54Z7y3
   JdBCdMEve0vVs7E9MzP7jEfMiN8t68i+H4eBSKkorOx6gv19ZKPbQ6OE3
   izHSl1DpyhoFaj/gDMfPLxB8nsMpR6v0IV1OsywIfqFq0xACJGa/0Hk0C
   639TH4v/otxX1oaku6Q2MYBcfkXSC+M23A63kaC5xXerVFxp01RzWntOk
   y44ESu2retvYxqaIux00XCDVLFcnf4mYZt5qLiVfqcbZqA8BKMc1H2WWW
   VMHfYgC5BenMZ7hUkYWpnBocYGzB+xyaDuP28IZjhyQ9855lM/JIC/C/J
   Q==;
X-CSE-ConnectionGUID: A/jecN7OSkOd01BC7nCLPw==
X-CSE-MsgGUID: AYTJ1J05QHGH6sHnN/YR4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="12415288"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="12415288"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 08:57:03 -0700
X-CSE-ConnectionGUID: vO5xSsY6RmKdl51eWK21mg==
X-CSE-MsgGUID: en4GCTrdSViTMNvF3cDOIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="28865302"
Received: from alexkiru-mobl.amr.corp.intel.com (HELO [10.212.38.129]) ([10.212.38.129])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 08:57:03 -0700
Message-ID: <735d6dbc-86e4-4747-9bd9-2574ead7d039@linux.intel.com>
Date: Tue, 23 Apr 2024 10:57:01 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 <89f8f0be-2534-46c8-9058-cabea4f68568@linux.intel.com>
 <9d1eda85-32a0-4e53-86ca-ce3137439bd7@kernel.org>
 <d046d195-6fa3-4c52-bc5f-3e5e763bc692@linux.intel.com>
 <138ac465-1576-4e86-a05d-63f8acc6fb70@kernel.org>
 <3acfbe3c-8b83-4c40-83c2-437f963fd25a@linux.intel.com>
 <7490bce3-3bd6-4beb-b8be-d47a6b0a30f0@kernel.org>
 <eaa0c99a-3b41-4444-906c-d2f005d326b9@linux.intel.com>
 <aef907ab-1087-4f49-bea4-d43ee6cebb73@kernel.org>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <aef907ab-1087-4f49-bea4-d43ee6cebb73@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> Are we talking about basic C now? Of course it does not mean that and I
> already explained what is the goal of this - the static or global memory
> in the driver can be moved to rodata.

the dsp_ops used by the Intel drivers cannot be moved to rodata in all
cases. the baseline is constant, all extensions for TGL+ are dynamically
allocated and modified.


