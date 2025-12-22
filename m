Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E82248F5C;
	Mon, 22 Dec 2025 02:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766369158; cv=none; b=DO3I3w3jqzsDBgR0bGItMte98Gc6tro2pWScGKu6KzrZIy8E3nJ3YkBzDkY/UULbzQGm+eEeXLV/BcKq3hSNWJaPuVmrpiiNfmo1ct3j4oYbFFPfjL4fn2S1iYSyfajV2a/m9DSTNui+tCowgYEHYMu+wIZIMJ4Vhr06+wHNNyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766369158; c=relaxed/simple;
	bh=74Ut1XHK0Vm4PFNeT//uEB30ynxJ0edLsHANsPIf0HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQllRadUgCPhAwjvpcC1AbboVZHodvKwZR6y+raUOVcStuqTCXlMmE0fGoQyFKQDX8620bDgTGoxhJcmhL1UymwnOy8/r6Hxmbqcvr7MoXf3BfLo9kHHqUb7fNdcbKtOFTM9v/r9nygwG+ulUwSe7nac7/WV2soyX6UX+UOBYbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aS5C+Cq4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aS5C+Cq4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766369156; x=1797905156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=74Ut1XHK0Vm4PFNeT//uEB30ynxJ0edLsHANsPIf0HY=;
  b=aS5C+Cq4daRQr5kEiMNanZZBQZdlFnGNUkSGtVktj1sjy7zFnskhYUjV
   xdLtZTfOzXkRKmNMFEoSsCCAL0cE+mbUy6Rt+zs7Dau1d4iX7/bMwLToM
   IAVCtJ0RhihZiq+Zn64QvbOWspBI13ujp/9Jg9Aoh8uA5I+rzfn1H6qyU
   34zeqnUF72ymZG6xSAprxVH4K+V0K3GBP3WAHt1Zs1TnAoqZwbPiznCAE
   gl1IWRVuLrQBBnkBEqXrT+58Kdm+8fhtVP7fPfBUtbMNzACbvAhjP11hI
   /QBSamFhR/4Qoyvl+LApEdR+1sd3WyCBao+UmARLBHbep47fO8yiJrYRr
   Q==;
X-CSE-ConnectionGUID: OLi4P90MRBCZR2e0DSD9Rg==
X-CSE-MsgGUID: voDBJ0bkTr+5r4adf16WYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68380077"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68380077"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 18:05:56 -0800
X-CSE-ConnectionGUID: yyog3z2hQm6/itLrAJirFQ==
X-CSE-MsgGUID: G27CFI2eSW6N9+rNHGbJrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="203873738"
Received: from lkp-server02.sh.intel.com (HELO 9d662e18a02b) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 21 Dec 2025 18:05:52 -0800
Received: from kbuild by 9d662e18a02b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXVIY-0000000003B-2U6u;
	Mon, 22 Dec 2025 02:05:35 +0000
Date: Mon, 22 Dec 2025 10:03:00 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v23 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Message-ID: <202512220932.Gu4LnMge-lkp@intel.com>
References: <20251219-imx-se-if-v23-3-5c6773d00318@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-imx-se-if-v23-3-5c6773d00318@nxp.com>

Hi Pankaj,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4a26e7032d7d57c998598c08a034872d6f0d3945]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Gupta/Documentation-firmware-add-imx-se-to-other_interfaces/20251219-132830
base:   4a26e7032d7d57c998598c08a034872d6f0d3945
patch link:    https://lore.kernel.org/r/20251219-imx-se-if-v23-3-5c6773d00318%40nxp.com
patch subject: [PATCH v23 3/7] firmware: imx: add driver for NXP EdgeLock Enclave
config: xtensa-randconfig-001-20251221 (https://download.01.org/0day-ci/archive/20251222/202512220932.Gu4LnMge-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220932.Gu4LnMge-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220932.Gu4LnMge-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/firmware/imx/ele_base_msg.h:14,
                    from drivers/firmware/imx/ele_common.c:6:
   drivers/firmware/imx/ele_common.c: In function 'se_val_rsp_hdr_n_status':
>> drivers/firmware/imx/se_ctrl.h:16:25: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
    #define RES_STATUS(x)   FIELD_GET(0x000000ff, x)
                            ^~~~~~~~~
   drivers/firmware/imx/ele_common.c:241:11: note: in expansion of macro 'RES_STATUS'
     status = RES_STATUS(msg->data[0]);
              ^~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/firmware/imx/se_ctrl.c: In function 'get_se_soc_info':
>> drivers/firmware/imx/se_ctrl.c:168:6: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     if (FIELD_GET(DEV_GETINFO_MIN_VER_MASK, var_se_info.soc_rev))
         ^~~~~~~~~
   At top level:
   drivers/firmware/imx/se_ctrl.c:374:12: warning: 'se_resume' defined but not used [-Wunused-function]
    static int se_resume(struct device *dev)
               ^~~~~~~~~
   drivers/firmware/imx/se_ctrl.c:357:12: warning: 'se_suspend' defined but not used [-Wunused-function]
    static int se_suspend(struct device *dev)
               ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +16 drivers/firmware/imx/se_ctrl.h

    15	
  > 16	#define RES_STATUS(x)			FIELD_GET(0x000000ff, x)
    17	#define MAX_NVM_MSG_LEN			(256)
    18	#define MESSAGING_VERSION_6		0x6
    19	#define MESSAGING_VERSION_7		0x7
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
