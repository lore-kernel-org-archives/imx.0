Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D571B3952
	for <imx@lists.linux.dev>; Mon, 25 Nov 2024 18:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732559124; cv=none; b=ST4uBULO4tOvAJnYNkZlS7bTPoRRwWG+ZueUw5isd+UsFy+eZlzHmndQNjtY5dS7Jfofr6xCsg2m5EBkL4VvroljGeKCbbNz3MDoWNlXi2kyCRYEvsL1QydKOutuxKPTbx+YhhfemSw1gsg/rD4W8XZ+u9soVoipKxaThZIDzco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732559124; c=relaxed/simple;
	bh=6aRiboS4Jxrz+jvRtPC54qrBkrsY/RgG6OavSsJocjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nAO3Czx0LIi+C+woUIpuqM5h0gV0OIRhlKtxQjyQ5/BoKaUq+w7ujo8Pb+4RWNEaE148QzmTXmVPx68ykktc+e3pfweA0wKSPSbiY+w74RL5LcrHfeG3VTReEiKbwF62pkb2UdzCNywP1zcfkgd08qfm098WGi5cMGF8TsoJNSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MbMpOUL2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MbMpOUL2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732559123; x=1764095123;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6aRiboS4Jxrz+jvRtPC54qrBkrsY/RgG6OavSsJocjI=;
  b=MbMpOUL2HKaN+LI80BJoH8EIXn9/B4j5pQ0sqXIzeheakdqYICalE1uH
   myW/N+fIfXLm2KS+GWFGDPoUG5LENaJS5miIz0FZCyjWUMuC+4thP0wSy
   qtDZeaokUBVoQKgpDoIkbpF3a4D3dYHFB62MH3lsLxVtBMtWYDH6T81KA
   9kUlyADMiRJhE23kmekDx0pdTAAtalHQsSqDniD4CSoXQmzw8+JiROUpn
   fvR93Ky+H1R/fBwlm8izMtZJ5Hiu0d9RGY87ur7klFWVnj0xUXyw/Fa+K
   +4vtCmMiPwOAOHssN0x4LphGNczE5E8jCV0fdClzFQNN1jRNYBNYtADvk
   Q==;
X-CSE-ConnectionGUID: SHZUZxq0THW9nfx1M+zCHw==
X-CSE-MsgGUID: 19zajmrVRyOYo0Wpf4gO3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="43751852"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="43751852"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 10:25:00 -0800
X-CSE-ConnectionGUID: INFUjcOqQSy+Joj9bnk6cA==
X-CSE-MsgGUID: OMdoFMV9SvODLT5m/kOgjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="95440526"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.245.115.59])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 10:24:55 -0800
Message-ID: <8bd461ba-7fbe-4f1b-91cf-d33483cb4930@intel.com>
Date: Mon, 25 Nov 2024 20:24:48 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-esdhc-imx: enable 'SDHCI_QUIRK_NO_LED' quirk
 for S32G
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
 Haibo Chen <haibo.chen@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 linux-mmc@vger.kernel.org, s32@nxp.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>
References: <20241125083357.1041949-1-ciprianmarian.costea@oss.nxp.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20241125083357.1041949-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/11/24 10:33, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Enable 'SDHCI_QUIRK_NO_LED' quirk for S32G2/S32G3 SoCs.
> S32G SDHCI controller does not have a LED signal line.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index d55d045ef236..e23177ea9d91 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -304,6 +304,7 @@ static struct esdhc_soc_data usdhc_s32g2_data = {
>  			| ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200
>  			| ESDHC_FLAG_HS400 | ESDHC_FLAG_HS400_ES
>  			| ESDHC_FLAG_SKIP_ERR004536 | ESDHC_FLAG_SKIP_CD_WAKE,
> +	.quirks = SDHCI_QUIRK_NO_LED,
>  };
>  
>  static struct esdhc_soc_data usdhc_imx7ulp_data = {

