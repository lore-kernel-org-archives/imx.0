Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6811D95BE;
	Tue, 29 Oct 2024 17:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730221586; cv=none; b=pWLsXy6JeAn8UD9v3j+Q3hNqL2VzC3i8+IKf6tWeqfbMRIW3NIZnWTJLfKLiWVLwISsgxGe38uxsweJMecxp48A1X+Dd7HUtruHcHuTpaC2vmjWRJEoZDoIk4xJs/dY4DZsJLf+3KOLbG7p+Wcw6/8O6r4Ff05+8nPC7B6MxlUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730221586; c=relaxed/simple;
	bh=GFsoyu+gSq/aSU9jlBlwuMAGi0F5EJzjk+vasvk+KMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lKbcyeAE+IA/xDpTnLMeC8ZKtOmh0k9hKNkgZHB2t0mtGMOB3cwcBxSR44sVxJawOREYaFFUO1JMOvCLvzmlTcx1lbqg2+8KHI+NnSClZObrpljC5mFUVG2AM0IQ5osXLVe/J4/dBpIaPS4GkL1aaY5AE17kLQP1wIyItQk7nn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CoXb2OaQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CoXb2OaQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730221585; x=1761757585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GFsoyu+gSq/aSU9jlBlwuMAGi0F5EJzjk+vasvk+KMY=;
  b=CoXb2OaQaPpPqBDVSyMgYWPwQ9fTd3SggvjSwEvEONIgmtUDK4EtUq1b
   NFViL4olDbFpa5F8LWqXd+0v4S1kfs1Grqu1PpkyvhudtTCzfmh72AM/h
   oh4h2Ey6qObreR9iHUj3YA9GYkufyi74TLDL2pd7iFYusrUwnWuqOC6EB
   ajFPLpXhmIxUSLzySFF9/wfOfn24FvOoKzvraddmc8yJk7cm2Ob1t5FXn
   M7BvU7p6G4YDBTEqN6ra/SID0MMIHPAdRtj96bc0XB3fB7vHYSK4tylIn
   TJxRLK0FcXaoRhqrG/PuPoC4e+AI3g2bxeKwEqcxXTGW2dczJEQ16cA5F
   Q==;
X-CSE-ConnectionGUID: I1nNnle5Qlav62AGNyYzIA==
X-CSE-MsgGUID: +JZ6TF74QcWz5hVXJ5fLlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52435491"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52435491"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 10:06:23 -0700
X-CSE-ConnectionGUID: 7q9ZxRnpTnuEDnhZdkCFQg==
X-CSE-MsgGUID: WNsgyM8oS1ez1aK6WXHuiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="81945398"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Oct 2024 10:06:17 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5pfc-000dvO-0Q;
	Tue, 29 Oct 2024 17:06:16 +0000
Date: Wed, 30 Oct 2024 01:05:34 +0800
From: kernel test robot <lkp@intel.com>
To: alice.guo@oss.nxp.com, wahrenst@gmx.net, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	"alice.guo" <alice.guo@nxp.com>
Subject: Re: [PATCH v2] soc: imx: Add SoC device register for i.MX9
Message-ID: <202410300019.uWGJaR4m-lkp@intel.com>
References: <20241029083406.3888861-1-alice.guo@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029083406.3888861-1-alice.guo@oss.nxp.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.12-rc5 next-20241029]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/alice-guo-oss-nxp-com/soc-imx-Add-SoC-device-register-for-i-MX9/20241029-163718
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20241029083406.3888861-1-alice.guo%40oss.nxp.com
patch subject: [PATCH v2] soc: imx: Add SoC device register for i.MX9
config: arm-randconfig-002-20241029 (https://download.01.org/0day-ci/archive/20241030/202410300019.uWGJaR4m-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300019.uWGJaR4m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300019.uWGJaR4m-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/soc/imx/soc-imx9.c:8:
   drivers/soc/imx/soc-imx9.c: In function 'imx9_soc_device_register':
>> include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 3 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:462:25: note: in definition of macro 'printk_index_wrap'
     462 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:533:9: note: in expansion of macro 'printk'
     533 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:533:16: note: in expansion of macro 'KERN_ERR'
     533 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/soc/imx/soc-imx9.c:48:17: note: in expansion of macro 'pr_err'
      48 |                 pr_err("%s: SMC failed: %d\n", __func__, res.a0);
         |                 ^~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a7 Joe Perches 2012-07-30  4  
04d2c8c83d0e3ac Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3ac Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3ac Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
