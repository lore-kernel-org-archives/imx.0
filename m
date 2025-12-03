Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B1F299AA3;
	Wed,  3 Dec 2025 07:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764745226; cv=none; b=ejPqy3sGkkmL4Oa/4bP4/+2x0TH/WMEVkGoavycT+U1zpra++Zp7IUGS5A+jDnE6Gxu1f4dGMGsAtOCY/E0ObR8v2i+RsXcFt0OgJn0vSGV3zwo+vp6GWUKLcSwdWP5zYAPegsWCV85NWp9pcdHKKMIfF8qOpCfsXtwhlMljyuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764745226; c=relaxed/simple;
	bh=BbpnT+nHAKfc3yROfFOj29+WeIOEVrl1j2gKJu3ZWdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ixv7Abe8ncAmh7w8j0cUkGiN2x5QfsFeDVNc2O3VxWvaukDikPmIniTAJNSXs9i2avYhXfNKSDB8E+LubPkgYxwHK29fvudV2Tq9hCqLZGZQVwpWZI42H/Z+uF3+WyNCmLLICtQ6kUWh3FdbaZYjomE+8qrCfsuFaro4py5DfOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PDKB+LlS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PDKB+LlS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764745225; x=1796281225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BbpnT+nHAKfc3yROfFOj29+WeIOEVrl1j2gKJu3ZWdA=;
  b=PDKB+LlSAJUJMojYDyYIsRMuBijCYriopOr2tqQcjU0+UoTGZOZ4u1Xu
   vAbe6gV3ZNAhDEwdL8sryv5qSW0iJgVMc+hLDB6geFaHcKH4grjBq7Yg5
   Of5saBQpG5UVQkz7rGZHhQqQGJSH6afKCeBoah8KeJ8IZHauJ5tsV5vbL
   5DBzg/5Jusv5ftOZ410CxCb96b3xEY9fb9K0lX8aAAHGwIsJkKrXSXL07
   Xm4IA9tyF6St18Q+JqAIrFfZ8afDVKIQmwUiLyZxGUq9RNWJ0zpUbudH3
   mq3b8N2AGUgwU/YpdM2+YgRVzSbOVo5Tqha7NjQ4hQNguNP+pJrI+z9GL
   w==;
X-CSE-ConnectionGUID: uBzVOKLsS5mLOCnA+sk+AA==
X-CSE-MsgGUID: yI2YKVrLTSmE4h/0PrjcRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="54280050"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="54280050"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 23:00:24 -0800
X-CSE-ConnectionGUID: vttOtOV4SHi8K8SNjtneyg==
X-CSE-MsgGUID: 8k+m/DnYQPiasvfEOKvb7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="225271918"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Dec 2025 23:00:20 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQgqX-00000000AgD-22Pq;
	Wed, 03 Dec 2025 07:00:17 +0000
Date: Wed, 3 Dec 2025 14:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: Carlos Song <carlos.song@nxp.com>, frank.li@nxp.com, mkl@pengutronix.de,
	broonie@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, kees@kernel.org,
	gustavoars@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-spi@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, Carlos Song <carlos.song@nxp.com>
Subject: Re: [PATCH v2 5/6] spi: imx: support dynamic burst length for ECSPI
 DMA mode
Message-ID: <202512031425.cmBJXuXy-lkp@intel.com>
References: <20251202075503.2448339-6-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202075503.2448339-6-carlos.song@nxp.com>

Hi Carlos,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.18]
[also build test ERROR on linus/master next-20251202]
[cannot apply to shawnguo/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Carlos-Song/spi-imx-group-spi_imx_dma_configure-with-spi_imx_dma_transfer/20251202-160030
base:   v6.18
patch link:    https://lore.kernel.org/r/20251202075503.2448339-6-carlos.song%40nxp.com
patch subject: [PATCH v2 5/6] spi: imx: support dynamic burst length for ECSPI DMA mode
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20251203/202512031425.cmBJXuXy-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031425.cmBJXuXy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031425.cmBJXuXy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-imx.c:144:34: error: 'counted_by' attribute is not allowed for a non-array field
     144 |         struct dma_data_package *dma_data __counted_by(dma_package_num);
         |                                  ^~~~~~~~


vim +/counted_by +144 drivers/spi/spi-imx.c

   107	
   108	struct spi_imx_data {
   109		struct spi_controller *controller;
   110		struct device *dev;
   111	
   112		struct completion xfer_done;
   113		void __iomem *base;
   114		unsigned long base_phys;
   115	
   116		struct clk *clk_per;
   117		struct clk *clk_ipg;
   118		unsigned long spi_clk;
   119		unsigned int spi_bus_clk;
   120	
   121		unsigned int bits_per_word;
   122		unsigned int spi_drctl;
   123	
   124		unsigned int count, remainder;
   125		void (*tx)(struct spi_imx_data *spi_imx);
   126		void (*rx)(struct spi_imx_data *spi_imx);
   127		void *rx_buf;
   128		const void *tx_buf;
   129		unsigned int txfifo; /* number of words pushed in tx FIFO */
   130		unsigned int dynamic_burst;
   131		bool rx_only;
   132	
   133		/* Target mode */
   134		bool target_mode;
   135		bool target_aborted;
   136		unsigned int target_burst;
   137	
   138		/* DMA */
   139		bool usedma;
   140		u32 wml;
   141		struct completion dma_rx_completion;
   142		struct completion dma_tx_completion;
   143		size_t dma_package_num;
 > 144		struct dma_data_package *dma_data __counted_by(dma_package_num);
   145		int rx_offset;
   146	
   147		const struct spi_imx_devtype_data *devtype_data;
   148	};
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
