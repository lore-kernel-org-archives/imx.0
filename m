Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD0B374CB;
	Fri, 17 Nov 2023 19:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxIjU2nt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700250689; x=1731786689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zKdyI8VrTxA4IvbpNNIgKVi2kEP1Fa0rMuHNhxW8lII=;
  b=DxIjU2ntAJDQm/XfqsvxpeMybjPGEAG9zBc+eh/YOAfm18rfnDu5e1Rs
   +ONYu4XnfaCMzxM7lrsg/5U89YNXpFU8qatdGIgHVDtoVz6R5ZXCzxUT+
   JUiWfP7qHII/9ksJfK3hj3iVvkf0X4n4s17j2Xd54ddpUdqUsEQrlAlQS
   IG3NM10zCzXUBVQSOKJGl49s7y3bI00N3jF+bstfuZOIRN5tbkbAfGNZ3
   PNSvLKZUKvfBJfkAtEqaIcqFFdYi5cXK61j2ndf1pTTS+ak3OsNiUEOHN
   LcX4OC8crGVNJ0Twn7/zOO2cXVq2gdwIdjp+DektCMec/y1P+T5Ne+K/C
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="457859776"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="457859776"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 11:51:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="13586974"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Nov 2023 11:51:25 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r44s6-00035f-13;
	Fri, 17 Nov 2023 19:51:22 +0000
Date: Sat, 18 Nov 2023 03:50:46 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>, vkoul@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org, imx@lists.linux.dev, joy.zou@nxp.com,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	peng.fan@nxp.com, robh+dt@kernel.org, shenwei.wang@nxp.com
Subject: Re: [PATCH v2 1/5] dmaengine: fsl-edma: involve help macro
 fsl_edma_set(get)_tcd()
Message-ID: <202311180346.xzja9J4E-lkp@intel.com>
References: <20231116222743.2984776-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116222743.2984776-2-Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on linus/master v6.7-rc1 next-20231117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dmaengine-fsl-edma-involve-help-macro-fsl_edma_set-get-_tcd/20231117-062946
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20231116222743.2984776-2-Frank.Li%40nxp.com
patch subject: [PATCH v2 1/5] dmaengine: fsl-edma: involve help macro fsl_edma_set(get)_tcd()
config: x86_64-randconfig-r113-20231117 (https://download.01.org/0day-ci/archive/20231118/202311180346.xzja9J4E-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311180346.xzja9J4E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311180346.xzja9J4E-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma/fsl-edma-common.c:76:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:93:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:100:22: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:101:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:104:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:106:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:131:19: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:137:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:140:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/dma/fsl-edma-common.c:361:26: sparse: sparse: cast to restricted __le16
   drivers/dma/fsl-edma-common.c:361:26: sparse: sparse: cast from restricted __le32
>> drivers/dma/fsl-edma-common.c:364:33: sparse: sparse: cast to restricted __le32
   drivers/dma/fsl-edma-common.c:364:33: sparse: sparse: cast from restricted __le16
   drivers/dma/fsl-edma-common.c:377:26: sparse: sparse: cast to restricted __le16
   drivers/dma/fsl-edma-common.c:377:26: sparse: sparse: cast from restricted __le32
   drivers/dma/fsl-edma-common.c:381:33: sparse: sparse: cast to restricted __le32
   drivers/dma/fsl-edma-common.c:381:33: sparse: sparse: cast from restricted __le16
   drivers/dma/fsl-edma-common.c:384:36: sparse: sparse: cast to restricted __le16
   drivers/dma/fsl-edma-common.c:384:36: sparse: sparse: cast from restricted __le32
   drivers/dma/fsl-edma-common.c:386:36: sparse: sparse: cast to restricted __le16
   drivers/dma/fsl-edma-common.c:386:36: sparse: sparse: cast from restricted __le32
   drivers/dma/fsl-edma-common.c:457:15: sparse: sparse: cast to restricted __le32
   drivers/dma/fsl-edma-common.c:457:15: sparse: sparse: cast from restricted __le16
   drivers/dma/fsl-edma-common.c:461:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] csr @@     got restricted __le32 [usertype] @@
   drivers/dma/fsl-edma-common.c:461:17: sparse:     expected restricted __le16 [usertype] csr
   drivers/dma/fsl-edma-common.c:461:17: sparse:     got restricted __le32 [usertype]
   drivers/dma/fsl-edma-common.c:473:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:473:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:496:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] saddr @@     got restricted __le16 [usertype] @@
   drivers/dma/fsl-edma-common.c:496:9: sparse:     expected restricted __le32 [usertype] saddr
   drivers/dma/fsl-edma-common.c:496:9: sparse:     got restricted __le16 [usertype]
   drivers/dma/fsl-edma-common.c:497:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] daddr @@     got restricted __le16 [usertype] @@
   drivers/dma/fsl-edma-common.c:497:9: sparse:     expected restricted __le32 [usertype] daddr
   drivers/dma/fsl-edma-common.c:497:9: sparse:     got restricted __le16 [usertype]
   drivers/dma/fsl-edma-common.c:499:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] attr @@     got restricted __le32 [usertype] @@
   drivers/dma/fsl-edma-common.c:499:9: sparse:     expected restricted __le16 [usertype] attr
   drivers/dma/fsl-edma-common.c:499:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/fsl-edma-common.c:501:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] soff @@     got restricted __le32 [usertype] @@
   drivers/dma/fsl-edma-common.c:501:9: sparse:     expected restricted __le16 [usertype] soff
   drivers/dma/fsl-edma-common.c:501:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/fsl-edma-common.c:518:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] nbytes @@     got restricted __le16 [usertype] @@
   drivers/dma/fsl-edma-common.c:518:9: sparse:     expected restricted __le32 [usertype] nbytes
   drivers/dma/fsl-edma-common.c:518:9: sparse:     got restricted __le16 [usertype]
   drivers/dma/fsl-edma-common.c:519:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] slast @@     got restricted __le16 [usertype] @@
   drivers/dma/fsl-edma-common.c:519:9: sparse:     expected restricted __le32 [usertype] slast
   drivers/dma/fsl-edma-common.c:519:9: sparse:     got restricted __le16 [usertype]
   drivers/dma/fsl-edma-common.c:521:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] citer @@     got restricted __le32 [usertype] @@
   drivers/dma/fsl-edma-common.c:521:9: sparse:     expected restricted __le16 [usertype] citer
   drivers/dma/fsl-edma-common.c:521:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/fsl-edma-common.c:522:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] doff @@     got restricted __le32 [usertype] @@
   drivers/dma/fsl-edma-common.c:522:9: sparse:     expected restricted __le16 [usertype] doff
   drivers/dma/fsl-edma-common.c:522:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/fsl-edma-common.c:524:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] dlast_sga @@     got restricted __le16 [usertype] @@
   drivers/dma/fsl-edma-common.c:524:9: sparse:     expected restricted __le32 [usertype] dlast_sga
   drivers/dma/fsl-edma-common.c:524:9: sparse:     got restricted __le16 [usertype]
   drivers/dma/fsl-edma-common.c:526:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] biter @@     got restricted __le32 [usertype] @@
   drivers/dma/fsl-edma-common.c:526:9: sparse:     expected restricted __le16 [usertype] biter
   drivers/dma/fsl-edma-common.c:526:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/fsl-edma-common.c:543:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] csr @@     got restricted __le32 [usertype] @@
   drivers/dma/fsl-edma-common.c:543:9: sparse:     expected restricted __le16 [usertype] csr
   drivers/dma/fsl-edma-common.c:543:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/fsl-edma-common.c:496:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] saddr @@     got restricted __le16 [usertype] @@
   drivers/dma/fsl-edma-common.c:496:9: sparse:     expected restricted __le32 [usertype] saddr
   drivers/dma/fsl-edma-common.c:496:9: sparse:     got restricted __le16 [usertype]
   drivers/dma/fsl-edma-common.c:497:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] daddr @@     got restricted __le16 [usertype] @@
   drivers/dma/fsl-edma-common.c:497:9: sparse:     expected restricted __le32 [usertype] daddr
   drivers/dma/fsl-edma-common.c:497:9: sparse:     got restricted __le16 [usertype]
   drivers/dma/fsl-edma-common.c:499:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] attr @@     got restricted __le32 [usertype] @@
   drivers/dma/fsl-edma-common.c:499:9: sparse:     expected restricted __le16 [usertype] attr
   drivers/dma/fsl-edma-common.c:499:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/fsl-edma-common.c:501:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] soff @@     got restricted __le32 [usertype] @@
   drivers/dma/fsl-edma-common.c:501:9: sparse:     expected restricted __le16 [usertype] soff
   drivers/dma/fsl-edma-common.c:501:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/fsl-edma-common.c:518:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] nbytes @@     got restricted __le16 [usertype] @@
   drivers/dma/fsl-edma-common.c:518:9: sparse:     expected restricted __le32 [usertype] nbytes
   drivers/dma/fsl-edma-common.c:518:9: sparse:     got restricted __le16 [usertype]
   drivers/dma/fsl-edma-common.c:519:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] slast @@     got restricted __le16 [usertype] @@
   drivers/dma/fsl-edma-common.c:519:9: sparse:     expected restricted __le32 [usertype] slast
   drivers/dma/fsl-edma-common.c:519:9: sparse:     got restricted __le16 [usertype]
   drivers/dma/fsl-edma-common.c:521:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] citer @@     got restricted __le32 [usertype] @@
   drivers/dma/fsl-edma-common.c:521:9: sparse:     expected restricted __le16 [usertype] citer
   drivers/dma/fsl-edma-common.c:521:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/fsl-edma-common.c:522:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] doff @@     got restricted __le32 [usertype] @@
   drivers/dma/fsl-edma-common.c:522:9: sparse:     expected restricted __le16 [usertype] doff
   drivers/dma/fsl-edma-common.c:522:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/fsl-edma-common.c:524:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] dlast_sga @@     got restricted __le16 [usertype] @@
   drivers/dma/fsl-edma-common.c:524:9: sparse:     expected restricted __le32 [usertype] dlast_sga
   drivers/dma/fsl-edma-common.c:524:9: sparse:     got restricted __le16 [usertype]
   drivers/dma/fsl-edma-common.c:526:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] biter @@     got restricted __le32 [usertype] @@
   drivers/dma/fsl-edma-common.c:526:9: sparse:     expected restricted __le16 [usertype] biter
   drivers/dma/fsl-edma-common.c:526:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/fsl-edma-common.c:543:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] csr @@     got restricted __le32 [usertype] @@
   drivers/dma/fsl-edma-common.c:543:9: sparse:     expected restricted __le16 [usertype] csr
   drivers/dma/fsl-edma-common.c:543:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/fsl-edma-common.c:496:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] saddr @@     got restricted __le16 [usertype] @@
   drivers/dma/fsl-edma-common.c:496:9: sparse:     expected restricted __le32 [usertype] saddr
   drivers/dma/fsl-edma-common.c:496:9: sparse:     got restricted __le16 [usertype]
   drivers/dma/fsl-edma-common.c:497:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] daddr @@     got restricted __le16 [usertype] @@
   drivers/dma/fsl-edma-common.c:497:9: sparse:     expected restricted __le32 [usertype] daddr
   drivers/dma/fsl-edma-common.c:497:9: sparse:     got restricted __le16 [usertype]
   drivers/dma/fsl-edma-common.c:499:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] attr @@     got restricted __le32 [usertype] @@
   drivers/dma/fsl-edma-common.c:499:9: sparse:     expected restricted __le16 [usertype] attr
   drivers/dma/fsl-edma-common.c:499:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/fsl-edma-common.c:501:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] soff @@     got restricted __le32 [usertype] @@
   drivers/dma/fsl-edma-common.c:501:9: sparse:     expected restricted __le16 [usertype] soff
   drivers/dma/fsl-edma-common.c:501:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/fsl-edma-common.c:518:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] nbytes @@     got restricted __le16 [usertype] @@
   drivers/dma/fsl-edma-common.c:518:9: sparse:     expected restricted __le32 [usertype] nbytes
   drivers/dma/fsl-edma-common.c:518:9: sparse:     got restricted __le16 [usertype]
   drivers/dma/fsl-edma-common.c:519:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] slast @@     got restricted __le16 [usertype] @@
   drivers/dma/fsl-edma-common.c:519:9: sparse:     expected restricted __le32 [usertype] slast
   drivers/dma/fsl-edma-common.c:519:9: sparse:     got restricted __le16 [usertype]

vim +361 drivers/dma/fsl-edma-common.c

   348	
   349	static size_t fsl_edma_desc_residue(struct fsl_edma_chan *fsl_chan,
   350			struct virt_dma_desc *vdesc, bool in_progress)
   351	{
   352		struct fsl_edma_desc *edesc = fsl_chan->edesc;
   353		enum dma_transfer_direction dir = edesc->dirn;
   354		dma_addr_t cur_addr, dma_addr;
   355		size_t len, size;
   356		u32 nbytes = 0;
   357		int i;
   358	
   359		/* calculate the total size in this desc */
   360		for (len = i = 0; i < fsl_chan->edesc->n_tcds; i++) {
 > 361			nbytes = fsl_edma_get_tcd_to_cpu(fsl_chan, edesc->tcd[i].vtcd, nbytes);
   362			if (nbytes & (EDMA_V3_TCD_NBYTES_DMLOE | EDMA_V3_TCD_NBYTES_SMLOE))
   363				nbytes = EDMA_V3_TCD_NBYTES_MLOFF_NBYTES(nbytes);
 > 364			len += nbytes * fsl_edma_get_tcd_to_cpu(fsl_chan, edesc->tcd[i].vtcd, biter);
   365		}
   366	
   367		if (!in_progress)
   368			return len;
   369	
   370		if (dir == DMA_MEM_TO_DEV)
   371			cur_addr = edma_read_tcdreg(fsl_chan, saddr);
   372		else
   373			cur_addr = edma_read_tcdreg(fsl_chan, daddr);
   374	
   375		/* figure out the finished and calculate the residue */
   376		for (i = 0; i < fsl_chan->edesc->n_tcds; i++) {
   377			nbytes = fsl_edma_get_tcd_to_cpu(fsl_chan, edesc->tcd[i].vtcd, nbytes);
   378			if (nbytes & (EDMA_V3_TCD_NBYTES_DMLOE | EDMA_V3_TCD_NBYTES_SMLOE))
   379				nbytes = EDMA_V3_TCD_NBYTES_MLOFF_NBYTES(nbytes);
   380	
   381			size = nbytes * fsl_edma_get_tcd_to_cpu(fsl_chan, edesc->tcd[i].vtcd, biter);
   382	
   383			if (dir == DMA_MEM_TO_DEV)
   384				dma_addr = fsl_edma_get_tcd_to_cpu(fsl_chan, edesc->tcd[i].vtcd, saddr);
   385			else
   386				dma_addr = fsl_edma_get_tcd_to_cpu(fsl_chan, edesc->tcd[i].vtcd, daddr);
   387	
   388			len -= size;
   389			if (cur_addr >= dma_addr && cur_addr < dma_addr + size) {
   390				len += dma_addr + size - cur_addr;
   391				break;
   392			}
   393		}
   394	
   395		return len;
   396	}
   397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
