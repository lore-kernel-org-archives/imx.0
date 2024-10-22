Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48021C9DC9;
	Tue, 22 Oct 2024 18:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729620601; cv=none; b=d7NBEzvlQJIgcwlNeST859Wv7gtK7GxoOex0HMCz5H4rHg2gshsBCSVY1cIW1XFBxfRCHg6E+gYNpFk6SVHgVvvOX0XBb1r4zHviBdYEHWmTFoUL/HqLiGpy3issmOfaOk6dVpq7WYH2FHcdLXzc+yuBB40z2MOhgexGHDcEy3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729620601; c=relaxed/simple;
	bh=OYH9WPNs01cYeqbOUy3BVBhL9OiM6lYYx0bzKdkMt4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCJ4EF9HL72TVOgw+xVWqhdbonFTaG84E8Jn5lP6RtMrUhomzFVcmrhecrnFHG5BcBk2syITG5lfhlNHx6CZbgGKTFeEnzYuCc1FMXhoS6rLK50BuB0zi/kmO/VSB4b3UbaGE1ZDYvq0sa2elbNOId79eI7Xxo5ehocgf6k7+Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MC1CwyNT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MC1CwyNT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729620600; x=1761156600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OYH9WPNs01cYeqbOUy3BVBhL9OiM6lYYx0bzKdkMt4Y=;
  b=MC1CwyNTPHlss5NvyboHFendtvU7wj/Ln/zT8nBbCCNHftJLOFmqwJQO
   sBog2dqQYfI6GJuu1sOx7xwqM7FChK7aVVPQbFiE7TkRjNWe8pCVA0XIG
   KOoppy+hr4kfIglKaflBGYC3Jo/aRiNg4remKjgv30gbj63nDPDMnev60
   KQ6jO2Qx9cZN4NaFGUFtayD2tUQ0S9WtWp180HrkGKb8KD9FjbQvql/L3
   /k05viCLcZFTj15AfkjWWLgBz1Q70M8HAYuMWAU42ktFmEc4+q5l/pjNt
   VvJr1z1P2G6OnjckPo1TPzGlNJz9a8mkV0kJBtiRGnQriIZEk804lra9M
   A==;
X-CSE-ConnectionGUID: pgHNWxxMTMmM3R8izSHvqQ==
X-CSE-MsgGUID: 82d18x4dTJajND6yi3mxSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32869489"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32869489"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 11:09:57 -0700
X-CSE-ConnectionGUID: ED0qKapQQDK2hjuRPfgUpg==
X-CSE-MsgGUID: fzS0ty/STD6leYXJa+oPDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="80363723"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Oct 2024 11:09:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3JKJ-000TvB-1G;
	Tue, 22 Oct 2024 18:09:51 +0000
Date: Wed, 23 Oct 2024 02:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aisheng Dong <aisheng.dong@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/4] clk: imx: lpcg-scu: SW workaround for errata
 (e10858)
Message-ID: <202410230141.3xLvkclt-lkp@intel.com>
References: <20241018-imx-clk-v1-v2-1-92c0b66ca970@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018-imx-clk-v1-v2-1-92c0b66ca970@nxp.com>

Hi Peng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d61a00525464bfc5fe92c6ad713350988e492b88]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/clk-imx-lpcg-scu-SW-workaround-for-errata-e10858/20241018-175440
base:   d61a00525464bfc5fe92c6ad713350988e492b88
patch link:    https://lore.kernel.org/r/20241018-imx-clk-v1-v2-1-92c0b66ca970%40nxp.com
patch subject: [PATCH v2 1/4] clk: imx: lpcg-scu: SW workaround for errata (e10858)
config: arm64-randconfig-r061-20241022 (https://download.01.org/0day-ci/archive/20241023/202410230141.3xLvkclt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410230141.3xLvkclt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410230141.3xLvkclt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/imx/clk-lpcg-scu.c: In function 'lpcg_e10858_writel':
>> drivers/clk/imx/clk-lpcg-scu.c:49:13: warning: variable 'reg1' set but not used [-Wunused-but-set-variable]
      49 |         u32 reg1;
         |             ^~~~


vim +/reg1 +49 drivers/clk/imx/clk-lpcg-scu.c

    45	
    46	/* e10858 -LPCG clock gating register synchronization errata */
    47	static void lpcg_e10858_writel(unsigned long rate, void __iomem *reg, u32 val)
    48	{
  > 49		u32 reg1;
    50	
    51		writel(val, reg);
    52	
    53		if (rate >= 24 * HZ_PER_MHZ || rate == 0) {
    54			/*
    55			 * The time taken to access the LPCG registers from the AP core
    56			 * through the interconnect is longer than the minimum delay
    57			 * of 4 clock cycles required by the errata.
    58			 * Adding a readl will provide sufficient delay to prevent
    59			 * back-to-back writes.
    60			 */
    61			reg1 = readl(reg);
    62		} else {
    63			/*
    64			 * For clocks running below 24MHz, wait a minimum of
    65			 * 4 clock cycles.
    66			 */
    67			ndelay(4 * (DIV_ROUND_UP(1000 * HZ_PER_MHZ, rate)));
    68		}
    69	}
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
