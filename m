Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9961384BF;
	Sat,  7 Sep 2024 09:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725701481; cv=none; b=F3Chskd1RyG5fe+1mJt8Sj5IANR1LtWC5fpSbsyc6sB4RejBy+AZHzs/ow0AwhGf/zPe8GoJpncl0UlawQXhbtY1NaMDKLSUXAK61V32KkidjdhCKaZSmzp4h4YVwNUITn3iVU8RKIyAatOSxlvqLcHXDspyxdfmdnWr0XDKCNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725701481; c=relaxed/simple;
	bh=5rgiPfSgiSkQ2a20vad2k+7ksMwZjw8Ed0gNn4udwEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmVOxEdOd2D+rJN2avH/KQ6Cwhre4XWa+9SgStTJeFlaYqSiOjJJAVQ4jUJ9fWxofVlYuAsp5Xfq1d95sWcPtPiLyv7yITAfRRqmvQKOtOaSMwWiwKKLPllQ4JRD/Ham4ifjXd9DDU9knt5i/9eLBPbnPXztlrr1ifLFW9rUuqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTjOT54Q; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTjOT54Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725701479; x=1757237479;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5rgiPfSgiSkQ2a20vad2k+7ksMwZjw8Ed0gNn4udwEQ=;
  b=GTjOT54QTbBGdbt3/EggxU3PAwHDPvCEIIme4R290iI8ph+M2Bs2iWMh
   4FzoExwejON45AWmCOaFKz3G/Uq+qczRh8He6xPZQfhIpSDNbfCslxmnb
   CLu8o0XaSVonceKEDlKq7tPimoJfRWYA/rjYQnd9g6QtjpL3JfsO64tj9
   mjavKwQGsdlvEk4S4CBsEZY84INLsViA/DxLDBO8cn7STdS/2FFn/7lJc
   9/k0aTuF8pZIdG1vi36hgcXS8kZgAtyjakyG+yvtOndxn0b9MmFLG4FOG
   /k3emKCKSEySFyw6K1oPMSBEQsX6nAROoIlFstd126BuLboCsAc4yCzzD
   g==;
X-CSE-ConnectionGUID: ZAx8cm9dTkS24dth4y6SjA==
X-CSE-MsgGUID: TtXxa97ESn+R9GYabSgaVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="13420514"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="13420514"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 02:31:17 -0700
X-CSE-ConnectionGUID: AV1+//C3THmHFO36yo6i8Q==
X-CSE-MsgGUID: C4FsPBRpTSmt2Sbvslxpiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="66510215"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Sep 2024 02:31:14 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smrmh-000COC-1S;
	Sat, 07 Sep 2024 09:31:11 +0000
Date: Sat, 7 Sep 2024 17:30:44 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
Message-ID: <202409071746.fBgS0kyW-lkp@intel.com>
References: <20240906063857.2223442-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906063857.2223442-1-alexander.stein@ew.tq-group.com>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240905]
[cannot apply to v6.11-rc6 v6.11-rc5 v6.11-rc4 linus/master v6.11-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Stein/drm-imx-Add-missing-DRM_BRIDGE_CONNECTOR-dependency/20240906-144116
base:   next-20240905
patch link:    https://lore.kernel.org/r/20240906063857.2223442-1-alexander.stein%40ew.tq-group.com
patch subject: [PATCH 1/1] drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
config: alpha-kismet-CONFIG_DRM_BRIDGE_CONNECTOR-CONFIG_DRM_IMX_LDB-0-0 (https://download.01.org/0day-ci/archive/20240907/202409071746.fBgS0kyW-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240907/202409071746.fBgS0kyW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071746.fBgS0kyW-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_LDB
   WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_IMX_LDB [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y] && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
