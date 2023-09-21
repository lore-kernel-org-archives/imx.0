Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AB39463;
	Thu, 21 Sep 2023 09:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695290063; x=1726826063;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mbUdodE1BmLOs31TQrxblmvCAcsSquPUpWxbLRjO6lY=;
  b=Yen+vtV8pOyw/ogHWxaJktUmuTViq5tA38vp5LmYdXY/Njqj8bFHR4L4
   bevOkQoHPlSnkeSngOiKehAnU4jtr5s6yiX/QDxDbds+1vaDtEKnh0/19
   SSgnZXq+ajEyv39OaOyhE+raFKtyMMov/fTTeJegjvc7jlRJgRUgZ94kc
   7vssFWbKGn46R1HXjiqgjC/dmFuqALBZuvympIQTVXu9Wh5jCh84s5h8+
   UNakINAykD3SYlDbODris+k7+Umicz8BQL79/04AcYZFbEG9klNojsgJd
   F/XiRWEmxfkPg/mMqOECkPxPU1g9cVVFzDwBYUDUrVOx5jXz+aQ0KZL5P
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466782203"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="466782203"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 02:54:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="740556538"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="740556538"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Sep 2023 02:54:18 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjGO0-0009qK-1b;
	Thu, 21 Sep 2023 09:54:16 +0000
Date: Thu, 21 Sep 2023 17:54:01 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	"open list:FREESCALE eDMA DRIVER" <imx@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/1] dmaengine: fsl-dma: fix DMA error when enabling sg
 if 'DONE' bit is set
Message-ID: <202309211717.aYksVles-lkp@intel.com>
References: <20230920203741.3184727-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920203741.3184727-1-Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc2 next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dmaengine-fsl-dma-fix-DMA-error-when-enabling-sg-if-DONE-bit-is-set/20230921-043838
base:   linus/master
patch link:    https://lore.kernel.org/r/20230920203741.3184727-1-Frank.Li%40nxp.com
patch subject: [PATCH 1/1] dmaengine: fsl-dma: fix DMA error when enabling sg if 'DONE' bit is set
config: i386-randconfig-062-20230921 (https://download.01.org/0day-ci/archive/20230921/202309211717.aYksVles-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309211717.aYksVles-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309211717.aYksVles-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma/fsl-edma-common.c:76:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:93:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:96:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:98:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:100:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:125:19: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:131:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:134:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/dma/fsl-edma-common.c:463:21: sparse: sparse: restricted __le16 degrades to integer
   drivers/dma/fsl-edma-common.c:465:21: sparse: sparse: restricted __le16 degrades to integer
   drivers/dma/fsl-edma-common.c:466:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:466:17: sparse: sparse: cast removes address space '__iomem' of expression

vim +463 drivers/dma/fsl-edma-common.c

   422	
   423	static void fsl_edma_set_tcd_regs(struct fsl_edma_chan *fsl_chan,
   424					  struct fsl_edma_hw_tcd *tcd)
   425	{
   426		u16 csr = 0;
   427	
   428		/*
   429		 * TCD parameters are stored in struct fsl_edma_hw_tcd in little
   430		 * endian format. However, we need to load the TCD registers in
   431		 * big- or little-endian obeying the eDMA engine model endian,
   432		 * and this is performed from specific edma_write functions
   433		 */
   434		edma_write_tcdreg(fsl_chan, 0, csr);
   435	
   436		edma_write_tcdreg(fsl_chan, tcd->saddr, saddr);
   437		edma_write_tcdreg(fsl_chan, tcd->daddr, daddr);
   438	
   439		edma_write_tcdreg(fsl_chan, tcd->attr, attr);
   440		edma_write_tcdreg(fsl_chan, tcd->soff, soff);
   441	
   442		edma_write_tcdreg(fsl_chan, tcd->nbytes, nbytes);
   443		edma_write_tcdreg(fsl_chan, tcd->slast, slast);
   444	
   445		edma_write_tcdreg(fsl_chan, tcd->citer, citer);
   446		edma_write_tcdreg(fsl_chan, tcd->biter, biter);
   447		edma_write_tcdreg(fsl_chan, tcd->doff, doff);
   448	
   449		edma_write_tcdreg(fsl_chan, tcd->dlast_sga, dlast_sga);
   450	
   451		if (fsl_chan->is_sw) {
   452			csr = le16_to_cpu(tcd->csr);
   453			csr |= EDMA_TCD_CSR_START;
   454			tcd->csr = cpu_to_le16(csr);
   455		}
   456	
   457		/*
   458		 * Must clear CHn_CSR[DONE] bit before enable TCDn_CSR[ESG] at EDMAv3
   459		 * eDMAv4 have not such requirement.
   460		 * Change MLINK need clear CHn_CSR[DONE] for both eDMAv3 and eDMAv4.
   461		 */
   462		if (((fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_CLEAR_DONE_E_SG) &&
 > 463			(tcd->csr & EDMA_TCD_CSR_E_SG)) ||
   464		    ((fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_CLEAR_DONE_E_LINK) &&
   465			(tcd->csr & EDMA_TCD_CSR_E_LINK)))
   466			edma_writel_chreg(fsl_chan, edma_readl_chreg(fsl_chan, ch_csr), ch_csr);
   467	
   468	
   469		edma_write_tcdreg(fsl_chan, tcd->csr, csr);
   470	}
   471	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
