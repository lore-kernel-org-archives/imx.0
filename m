Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B21347D5;
	Tue, 19 Sep 2023 21:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695160061; x=1726696061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WS9L3QFPXiqwWBLJkP/BjE61p/kydfJWxwHndNJas9s=;
  b=gyDl9WmqHRONy88rGPpqyV1Q0f8GqveFc+hm6/bIKKKOkU3M7IV6OiXb
   nILCaWoG79qd+dFG0InGR/KvWCo57CdMNTFRyJD/aQYHv9YT86PiZZnks
   XYcDYlnq9qsf10F6OfCoij7IMLe/n4q8L8spJEZseJUG7RY0wRA2v/AIx
   3FxD1yL0lwtAabFfYumVWvidk9lvNCGX9woFUpTsuKPogezcX1nvo1DXY
   6WyGIigL44nbAhNVr261WctWNycQEoigLvGAvnmbrMyKoEIVfSH3dRcfv
   9FoFjlAy96qSsPjnVnQix4/Cd35LAAfTV4cNKTOSjm7wPUtBdnE9r4oBf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="360315087"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="360315087"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 14:47:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="993320987"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="993320987"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 19 Sep 2023 14:47:38 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiiZE-0007xU-08;
	Tue, 19 Sep 2023 21:47:36 +0000
Date: Wed, 20 Sep 2023 05:47:07 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>, vkoul@kernel.org,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	imx@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] dmaengine: fsl-edma: add trace event support
Message-ID: <202309200524.QTINjSsC-lkp@intel.com>
References: <20230919151430.2919042-3-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919151430.2919042-3-Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on linus/master v6.6-rc2 next-20230919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dmaengine-fsl-emda-add-debugfs-support/20230920-010257
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20230919151430.2919042-3-Frank.Li%40nxp.com
patch subject: [PATCH v2 2/2] dmaengine: fsl-edma: add trace event support
config: arc-randconfig-001-20230920 (https://download.01.org/0day-ci/archive/20230920/202309200524.QTINjSsC-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309200524.QTINjSsC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200524.QTINjSsC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from drivers/dma/fsl-edma-trace.h:134,
                    from drivers/dma/fsl-edma-common.h:238,
                    from drivers/dma/fsl-edma-trace.c:4:
   drivers/dma/./fsl-edma-trace.h: In function 'trace_raw_output_edma_log_io':
>> drivers/dma/./fsl-edma-trace.h:28:19: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=]
      28 |         TP_printk("offset %08lx: value %08x",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   drivers/dma/./fsl-edma-trace.h:28:9: note: in expansion of macro 'TP_printk'
      28 |         TP_printk("offset %08lx: value %08x",
         |         ^~~~~~~~~
   In file included from include/trace/trace_events.h:237:
   drivers/dma/./fsl-edma-trace.h:28:31: note: format string is defined here
      28 |         TP_printk("offset %08lx: value %08x",
         |                           ~~~~^
         |                               |
         |                               long unsigned int
         |                           %08x


vim +28 drivers/dma/./fsl-edma-trace.h

    14	
    15	DECLARE_EVENT_CLASS(edma_log_io,
    16		TP_PROTO(struct fsl_edma_engine *edma, void __iomem *addr, u32 value),
    17		TP_ARGS(edma, addr, value),
    18		TP_STRUCT__entry(
    19			__field(struct fsl_edma_engine *, edma)
    20			__field(void __iomem *, addr)
    21			__field(u32, value)
    22		),
    23		TP_fast_assign(
    24			__entry->edma = edma;
    25			__entry->addr = addr;
    26			__entry->value = value;
    27		),
  > 28		TP_printk("offset %08lx: value %08x",
    29			__entry->addr - __entry->edma->membase, __entry->value)
    30	);
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
