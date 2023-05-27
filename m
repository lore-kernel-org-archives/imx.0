Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2054513AC0;
	Sat, 27 May 2023 18:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685210836; x=1716746836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FkYq7eU5WMsNN0PRanMNALd8mV/EiUIsSiOJmaD8sZM=;
  b=VtxDt4sjQbdQQkbqwBFHxWhmpe883p9tGMgloK7tg5r1c3We1PZe9OII
   1L9t5V06PZ3PBpXJCtytYAqo0RRS1bK3L6el6+afG6te7OoXbCD4D7j9X
   bskox14OSJPNPiMGsqG+FS07Uy54J0PxVPiMNZVt/WYBKwgo6bWpisn4S
   K94Bd203Heqig0TVix5EFgxsXnHNaBM4ZOamDE0T1FjfYsTSaD0NLlbf6
   nc81DSR4GCwlKDQP6+fmwhLd1Xp9XGF53EaEeMbICzMEn5/BntGGnmNMO
   zaJZrXTYo/rWKR9ePFODW0A5X0EsMTBleEDb9dnzliEdGIny6U9FQ2TkE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="334053117"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="334053117"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 11:07:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="829857787"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="829857787"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 May 2023 11:07:11 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2yJq-000K7C-2j;
	Sat, 27 May 2023 18:07:10 +0000
Date: Sun, 28 May 2023 02:06:29 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>, vkoul@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	peng.fan@nxp.com, joy.zou@nxp.com, shenwei.wang@nxp.com,
	imx@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 11/12] dmaengine: fsl-edma: integrate v3 support
Message-ID: <202305280115.V6ATKDcU-lkp@intel.com>
References: <20230526143639.1037099-12-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526143639.1037099-12-Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on robh/for-next linus/master v6.4-rc3 next-20230525]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dmaengine-fsl-edma-clean-up-EXPORT_SYMBOL_GPL-in-fsl-edma-common-c/20230526-224442
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20230526143639.1037099-12-Frank.Li%40nxp.com
patch subject: [PATCH v1 11/12] dmaengine: fsl-edma: integrate v3 support
config: i386-randconfig-s003-20230526 (https://download.01.org/0day-ci/archive/20230528/202305280115.V6ATKDcU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/1f79fc46f07a6ea3dbd002b3b46dbc3019bc1aa6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Frank-Li/dmaengine-fsl-edma-clean-up-EXPORT_SYMBOL_GPL-in-fsl-edma-common-c/20230526-224442
        git checkout 1f79fc46f07a6ea3dbd002b3b46dbc3019bc1aa6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/dma/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305280115.V6ATKDcU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma/fsl-edma-common.c:76:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/dma/fsl-edma-common.c:76:15: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/dma/fsl-edma-common.c:76:15: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-edma-common.c:76:15: sparse:     got restricted __le32 *
   drivers/dma/fsl-edma-common.c:93:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:93:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/dma/fsl-edma-common.c:93:9: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-edma-common.c:93:9: sparse:     got restricted __le32 *
   drivers/dma/fsl-edma-common.c:96:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:96:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/dma/fsl-edma-common.c:96:33: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-edma-common.c:96:33: sparse:     got restricted __le32 *
   drivers/dma/fsl-edma-common.c:97:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:97:17: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/dma/fsl-edma-common.c:97:17: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-edma-common.c:97:17: sparse:     got restricted __le32 *
   drivers/dma/fsl-edma-common.c:99:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:99:15: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/dma/fsl-edma-common.c:99:15: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-edma-common.c:99:15: sparse:     got restricted __le32 *
   drivers/dma/fsl-edma-common.c:101:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:101:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/dma/fsl-edma-common.c:101:9: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-edma-common.c:101:9: sparse:     got restricted __le32 *
   drivers/dma/fsl-edma-common.c:126:19: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:126:19: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/dma/fsl-edma-common.c:126:19: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-edma-common.c:126:19: sparse:     got restricted __le32 *
   drivers/dma/fsl-edma-common.c:133:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:133:17: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/dma/fsl-edma-common.c:133:17: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-edma-common.c:133:17: sparse:     got restricted __le32 *
   drivers/dma/fsl-edma-common.c:136:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:136:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/dma/fsl-edma-common.c:136:9: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-edma-common.c:136:9: sparse:     got restricted __le32 *
   drivers/dma/fsl-edma-common.c:435:9: sparse: sparse: cast from restricted __le32
   drivers/dma/fsl-edma-common.c:435:9: sparse: sparse: cast from restricted __le32
   drivers/dma/fsl-edma-common.c:436:9: sparse: sparse: cast from restricted __le32
   drivers/dma/fsl-edma-common.c:436:9: sparse: sparse: cast from restricted __le32
   drivers/dma/fsl-edma-common.c:438:9: sparse: sparse: cast from restricted __le16
   drivers/dma/fsl-edma-common.c:438:9: sparse: sparse: cast from restricted __le16
   drivers/dma/fsl-edma-common.c:439:9: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] soff @@
   drivers/dma/fsl-edma-common.c:439:9: sparse:     expected unsigned short [usertype] val
   drivers/dma/fsl-edma-common.c:439:9: sparse:     got restricted __le16 [usertype] soff
   drivers/dma/fsl-edma-common.c:439:9: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le16 [usertype] soff @@
   drivers/dma/fsl-edma-common.c:439:9: sparse:     expected unsigned int [usertype] val
   drivers/dma/fsl-edma-common.c:439:9: sparse:     got restricted __le16 [usertype] soff
   drivers/dma/fsl-edma-common.c:441:9: sparse: sparse: cast from restricted __le32
   drivers/dma/fsl-edma-common.c:441:9: sparse: sparse: cast from restricted __le32
   drivers/dma/fsl-edma-common.c:442:9: sparse: sparse: cast from restricted __le32
   drivers/dma/fsl-edma-common.c:442:9: sparse: sparse: cast from restricted __le32
   drivers/dma/fsl-edma-common.c:444:9: sparse: sparse: cast from restricted __le16
   drivers/dma/fsl-edma-common.c:444:9: sparse: sparse: cast from restricted __le16
   drivers/dma/fsl-edma-common.c:445:9: sparse: sparse: cast from restricted __le16
   drivers/dma/fsl-edma-common.c:445:9: sparse: sparse: cast from restricted __le16
   drivers/dma/fsl-edma-common.c:446:9: sparse: sparse: cast from restricted __le16
   drivers/dma/fsl-edma-common.c:446:9: sparse: sparse: cast from restricted __le16
   drivers/dma/fsl-edma-common.c:448:9: sparse: sparse: cast from restricted __le32
   drivers/dma/fsl-edma-common.c:448:9: sparse: sparse: cast from restricted __le32
   drivers/dma/fsl-edma-common.c:456:9: sparse: sparse: cast from restricted __le16
   drivers/dma/fsl-edma-common.c:456:9: sparse: sparse: cast from restricted __le16
--
>> drivers/dma/fsl-edma-main.c:61:16: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/dma/fsl-edma-main.c:61:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/dma/fsl-edma-main.c:61:16: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-edma-main.c:61:16: sparse:     got restricted __le32 *
   drivers/dma/fsl-edma-main.c:65:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-main.c:65:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/dma/fsl-edma-main.c:65:9: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-edma-main.c:65:9: sparse:     got restricted __le32 *

vim +/__iomem +76 drivers/dma/fsl-edma-common.c

    70	
    71	static void fsl_edma3_enable_request(struct fsl_edma_chan *fsl_chan)
    72	{
    73		u32 val, flags;
    74	
    75		flags = fsl_edma_drvflags(fsl_chan);
  > 76		val = edma_readl_chreg(fsl_chan, ch_sbr);
    77		/* Remote/local swapped wrongly on iMX8 QM Audio edma */
    78		if (flags & FSL_EDMA_DRV_QUIRK_SWAPPED) {
    79			if (!fsl_chan->is_rxchan)
    80				val |= EDMA_V3_CH_SBR_RD;
    81			else
    82				val |= EDMA_V3_CH_SBR_WR;
    83		} else {
    84			if (fsl_chan->is_rxchan)
    85				val |= EDMA_V3_CH_SBR_RD;
    86			else
    87				val |= EDMA_V3_CH_SBR_WR;
    88		}
    89	
    90		if (fsl_chan->is_remote)
    91			val &= ~(EDMA_V3_CH_SBR_RD | EDMA_V3_CH_SBR_WR);
    92	
    93		edma_writel_chreg(fsl_chan, val, ch_sbr);
    94	
    95		if ((flags & (FSL_EDMA_DRV_AXI | FSL_EDMA_DRV_HAS_CHMUX)) &&
    96		    fsl_chan->srcid && !edma_readl_chreg(fsl_chan, ch_mux))
    97			edma_writel_chreg(fsl_chan, fsl_chan->srcid, ch_mux);
    98	
    99		val = edma_readl_chreg(fsl_chan, ch_csr);
   100		val |= EDMA_V3_CH_CSR_ERQ;
   101		edma_writel_chreg(fsl_chan, val, ch_csr);
   102	}
   103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
