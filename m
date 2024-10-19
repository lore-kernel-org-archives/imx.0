Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1A01DF749;
	Sat, 19 Oct 2024 09:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729331076; cv=none; b=eHUK+K/GOOCRn0mOHBNmqN6FAbOMrzZbhDAlECGBedx+rqHnO9sEU7ZFPtzjWDOV1igBJdzxqgmmryB/qT2wbUzejVgpb+eQkG4VNVS0Oo+d2s1IZr0OkvFqevAKGxIjmH1pwYiefl/EIKSwB0rk0qy78UGzjLYYwxGN3KzaU4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729331076; c=relaxed/simple;
	bh=8JKQHEed5f/WTiLw6VZKnZcCY2h2Gs+L+t+SxwiypVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QoFi2UOgVSy4xGb+EK3lE1WbM8aTWW6dK3Foe25HXDIqwlbJWV8N8QMeyboTOdjyw7hPuJWt4HaMu0Fuasp/MKM6YDGKQEQfHfyY/TUHhJC1ZcTnTmglVJ52aqKu0vHeTlWYy7RnNLld00zP/8NrdT9ZxcCbi8u9Cph9P2DjPBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KmtXEji8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KmtXEji8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729331074; x=1760867074;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8JKQHEed5f/WTiLw6VZKnZcCY2h2Gs+L+t+SxwiypVI=;
  b=KmtXEji8021L45NqyP9tAGLyZQzQklEApwwlo2vIfG0JRNrhc3eyT3Nu
   bCPDaRyozcTq6jUuu0EjWcXZQXIizlu6rnSc/MxiubkN+NvCNXtqwygbv
   K7rBPlhFRdWCvFowuzIk3/nG6fvIK2I7xLAepP1wDgzqB4O0YPCOK+sFl
   BMPN2OERJaopkZ8eH7/EBqGTDo4KgVgLWPpE/jdEUTLPENH6ULw8I05MV
   upVIWoL72NFMNUdyabwPfZnilBWd4LNbIOp7jf2V/u9nObVVaYI7wwiln
   UXsM8p3XBE1oE94kPZdhT24l9hsAV7ckJIt98G0HSgmuDlcvgP14QMWSQ
   A==;
X-CSE-ConnectionGUID: rCQGA1YJRByqoZRdAbH0eA==
X-CSE-MsgGUID: 7rRUTEGoS7KyHiJjDrudJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28995781"
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="28995781"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 02:44:32 -0700
X-CSE-ConnectionGUID: BACNGPuUQ1WafYM+UNO0rg==
X-CSE-MsgGUID: OQg0m7ppRs2uezzrmdjyyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="79145234"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Oct 2024 02:44:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t260X-000OsF-20;
	Sat, 19 Oct 2024 09:44:25 +0000
Date: Sat, 19 Oct 2024 17:43:52 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Fang <wei.fang@nxp.com>, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.oltean@nxp.com,
	claudiu.manoil@nxp.com, xiaoning.wang@nxp.com, Frank.Li@nxp.com,
	christophe.leroy@csgroup.eu, linux@armlinux.org.uk,
	bhelgaas@google.com, horms@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, imx@lists.linux.dev,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 net-next 06/13] net: enetc: build enetc_pf_common.c as
 a separate module
Message-ID: <202410191715.TQmESUy9-lkp@intel.com>
References: <20241017074637.1265584-7-wei.fang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017074637.1265584-7-wei.fang@nxp.com>

Hi Wei,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Fang/dt-bindings-net-add-compatible-string-for-i-MX95-EMDIO/20241017-160848
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241017074637.1265584-7-wei.fang%40nxp.com
patch subject: [PATCH v3 net-next 06/13] net: enetc: build enetc_pf_common.c as a separate module
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20241019/202410191715.TQmESUy9-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410191715.TQmESUy9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191715.TQmESUy9-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/net/ethernet/freescale/enetc/enetc_pf_common.o: in function `enetc_pf_netdev_setup':
>> enetc_pf_common.c:(.text+0x55e): undefined reference to `enetc_set_ethtool_ops'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
