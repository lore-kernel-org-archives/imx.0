Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833967477;
	Thu,  5 Oct 2023 10:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WpIW4eUK"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696502583; x=1728038583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GqKe2kbO3tMy/0EgmQO31nknlkfPS8TEimBu+0qpdrE=;
  b=WpIW4eUK7568iej4NZigY+kb5qu9yxzFLRWKKJL0/MGBKbKufXRw2jIc
   bc1zz2rq/PcxweuEiwbBSloUqyxe9XoV+9nyrvZpbAiOxilTJpOcVi25e
   bQ15vinj7we3CkM4Ib2EI5m6wiZPUM0kKnf7ePI2/vmNzqveFJeP6FahC
   wCh5XQwGV/+kPnoGHH8rV8C4pcuiqU8nir6cq1LyS5oq6pEB+CZLfdirL
   xghfOQUbG2uTsvGGgVrWNWMoICzUoW5EqiMLgMZvIId3Jx6oeq2OEekS+
   8KDkUg5Y9L66gOE/d7p4vcOILZj4mtsaWinUzO4lmILbxkgpVsr+IhW6x
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="380743617"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="380743617"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 03:42:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="786921899"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="786921899"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Oct 2023 03:42:54 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoLoi-000LJS-2I;
	Thu, 05 Oct 2023 10:42:52 +0000
Date: Thu, 5 Oct 2023 18:42:18 +0800
From: kernel test robot <lkp@intel.com>
To: Shenwei Wang <shenwei.wang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Mario Castaneda <mario.ignacio.castaneda.lopez@nxp.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-imx: request high frequency mode
Message-ID: <202310051811.Rltsgr8J-lkp@intel.com>
References: <20231004195442.414766-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004195442.414766-1-shenwei.wang@nxp.com>

Hi Shenwei,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenwei-Wang/net-stmmac-dwmac-imx-request-high-frequency-mode/20231005-035606
base:   net/main
patch link:    https://lore.kernel.org/r/20231004195442.414766-1-shenwei.wang%40nxp.com
patch subject: [PATCH net] net: stmmac: dwmac-imx: request high frequency mode
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231005/202310051811.Rltsgr8J-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310051811.Rltsgr8J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310051811.Rltsgr8J-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c:9:10: fatal error: linux/busfreq-imx.h: No such file or directory
       9 | #include <linux/busfreq-imx.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +9 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c

   > 9	#include <linux/busfreq-imx.h>
    10	#include <linux/clk.h>
    11	#include <linux/gpio/consumer.h>
    12	#include <linux/kernel.h>
    13	#include <linux/mfd/syscon.h>
    14	#include <linux/module.h>
    15	#include <linux/of.h>
    16	#include <linux/of_net.h>
    17	#include <linux/phy.h>
    18	#include <linux/platform_device.h>
    19	#include <linux/pm_wakeirq.h>
    20	#include <linux/regmap.h>
    21	#include <linux/slab.h>
    22	#include <linux/stmmac.h>
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
