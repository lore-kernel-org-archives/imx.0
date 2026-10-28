Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793174662;
	b=mJ34eWTNjYVocQtLNTDY7N+PtJY8Ot/9tI+qreIr6/XgMwADQn6mAOdhv+FsrT5uvPaF
	 Grp/4aCwaCWXYegQ4XNovq9cO+VZhymfEYMbSBi2VL5wnplCIL/ChYF9RCqZDM59vv4QS
	 x6S0XjpYYyEBaFCAR/Blg/njntCXq3hmV8uebXNW3In4wbPNpGuUK1Bzob7jmcg1Zz0B/
	 AuzKokQabDhct6F0HjHgVC/jlG/vPG8x5wV3sqhQRv7JttIW3jbEKdCPUv+TL8fsVCRta
	 DZTAbqp+Ma3sCoL1lYHwvJNZCOtabQaxoTxTewCDlNaHKx3f9/jwjeUC4DEHYF5LixA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793174662;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=QYUY+SzuyzidMIs5wvcWQ+wJedzQHVpapr2RX4nAS3g=;
	b=RPlYAsIDRS8pkMLOoKpzlciA12yJqSC9VUpTBGhXW3imKJJNU0aUUAPhNzIs7giZOo9G
	 ZRDodPLQGYnSley6/ViXfRIbeaMIoHXPMbbXyEtSRs7miOou2cVpmN+TWp7byBy1/sPOm
	 BPPyRw3geKMVhwdMONFaNuGvRzJpJcmWQvIby6LI8ySISq/mfpjobvYqh0KhwTtDLv5/3
	 +8iZMq+UH8GYMPtqcD34CY1FWECPXZPSMFC5VPhemdgKz0b2i/YI0HUdsA46aEKGYDzU1
	 RcxiYsKMvLAEfCtsHpHeAZ9SX32xVMQvDcpVVDGolOJJilLpwu/DIvKl1a4NeEbdmiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PSBniF0w;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E799606A31A
	for <imx@lists.linux.dev>; Wed, 28 Oct 2026 08:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E799606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PSBniF0w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793174661; x=1824710661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GlCrv/Z8ykZTWKLkjrgizpbqqqsL18IOZ9JsGj4pQww=;
  b=PSBniF0wd7ppMixld2UUoEB73b1yiGoF8vRXQw+G1YSVuOdfGa10kRy1
   PP038b2/20WyHj8Za8s3lOK6A5CKledqp9kljtVsDUOiHC+eGA3zA2vlM
   MT+/FAI3eBlmS2C57vmTMY/nyWjYUaQySkZWV1rFyvAhDua/Nh3xd3GdY
   sWwjrfJ8DDi7yQFTihVA+9UVxHpxbl2/Ir0XbFIFvaF+ALvnRLsnNW4NV
   s/AYwI6IkDwqYskbzcKE+gmmy5RrHX+JztLgLKfgdsnx3gKVSDAKY0OQJ
   fttgekcrMV59ncuafHN6jde7skpkm3TP+u/EPoo8Z96VcipDy/1yMDhB8
   Q==;
X-CSE-ConnectionGUID: OVm31sWWR2WmaTajQPzxLg==
X-CSE-MsgGUID: E75wPLojSWiAZfOUe9WyWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1780744"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1780744"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 01:04:20 -0700
X-CSE-ConnectionGUID: 3U2XXT5qQFSCkgAuKxEChg==
X-CSE-MsgGUID: XN/qcR2yR4S9jibXAKAjrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4852263"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 01:04:11 -0700
Date: Wed, 28 Oct 2026 10:04:08 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Longfang Liu <liulongfang@huawei.com>,
	Andy Shevchenko <andy@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	=?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org,
	Frank Li <Frank.li@oss.nxp.com>
Subject: Re: [PATCH v3 1/2] dmaengine: virt-dma: share the DMAengine
 synchronization callback
Message-ID: <auGseGw39K115Zfi@ashevche-desk.local>
References: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
 <20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 27, 2026 at 12:22:26PM -0600, James Hilliard wrote:
> Several virt-dma drivers implement device_synchronize with a wrapper that
> only converts the DMA channel and calls vchan_synchronize(). Provide
> vchan_dma_synchronize() with the DMAengine callback signature so these
> drivers can assign it directly.
> 
> Document the requirement to stop the channel and prevent new callbacks
> before synchronization, and the context in which the callback wait may
> run. Replace the equivalent wrappers in the existing drivers with the
> shared helper, preserving their callback-wait and descriptor-cleanup
> behavior.

...

>  drivers/dma/hsu/hsu.c                          |  9 +--------
>  drivers/dma/idma64.c                           |  9 +--------

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com> # hsu, idma64, virt-dma

-- 
With Best Regards,
Andy Shevchenko


