Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E23D629;
	Fri,  8 Nov 2024 00:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731026505; cv=none; b=k0dAcCjerifKd/RlBRZZJ67taTAZRI5WSqpOHOvb1yrRo9xseioyxudPZoAO+Dkjz2Rv96nopy7FCZ+K1n6PzRokhtp5Jd95uIATIir5z37IfK8sDAGMLtcuhcma/929NrNtuvD/Gw3vQBeI8f17BxWRAxBNKX3+AW8Pv+NBja0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731026505; c=relaxed/simple;
	bh=CmUZRygZ4UPlGvskAJ81DD3Jq3d1Dpg5a2sXaVTWYtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARKz5vhqlgW5Pdpv2Coj38bKNVBYjg4zI5UpsgUdFvWvl5BONWiMKp+CohQeXttm8CE3tIKERyF4eXQbSZpFEqMi/fZf562/3yb0V3s7RpKAsopgheq+XsjTPqMlHGBhGNAdQeZRXx5Uwf+UOdmMXk02q1GGi1Ecs4PmpnU+T10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ChWLQF3x; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ChWLQF3x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731026503; x=1762562503;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CmUZRygZ4UPlGvskAJ81DD3Jq3d1Dpg5a2sXaVTWYtw=;
  b=ChWLQF3x+VyuswCEzPCmz4jYZ2DiSlOR7hOBF7eM9FWxo6tQ9FEsxLLu
   gPZgc1Aq58mnS5AEGTqzj7mNd5HQkeXQWtRMdYNYlWJAR6+5cXpuBbG8E
   CvS5BzqJyEe1QLF5RwfM5q5fufnwNbFpnWWYT86d2Qwm9zjKNSkTn4twT
   /hr9U4tn0QCii/c3J5n5hosX8XSqsoHvehHjuVg/Apc/PNyP7Z4/yC++q
   wl1fVvH7RtOIhv9lghZIuUCCzRzJYMooCZPec0TYPS1wEJqjGz0+ZOfqz
   vTttNX1hGcJ6qh+IzPvDOdYhO7CtMMBJiwyMdbABM1HA2UjnIgky354TE
   g==;
X-CSE-ConnectionGUID: Kmr/yhNIQZiwFxBMKPXBFA==
X-CSE-MsgGUID: /sGmzkmeSt6qjjM0fN8KJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30856137"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30856137"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 16:41:43 -0800
X-CSE-ConnectionGUID: VyAfSg8xRomwEzapJ8OcTQ==
X-CSE-MsgGUID: kE2IlYXWRomBOPH8xMoSuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="89943431"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Nov 2024 16:41:39 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9D4C-000qpW-2d;
	Fri, 08 Nov 2024 00:41:36 +0000
Date: Fri, 8 Nov 2024 08:41:02 +0800
From: kernel test robot <lkp@intel.com>
To: Vabhav Sharma <vabhav.sharma@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, frank.li@nxp.com,
	pankaj.gupta@nxp.com, daniel.baluta@nxp.com,
	silvano.dininno@nxp.com, V.Sethi@nxp.com,
	meenakshi.aggarwal@nxp.com, Vabhav Sharma <vabhav.sharma@nxp.com>,
	Franck LENORMAND <franck.lenormand@nxp.com>
Subject: Re: [PATCH v3 4/4] firmware: imx: secvio: Add support for SNVS
 secvio and tamper via SCFW
Message-ID: <202411080826.ovlSnU8b-lkp@intel.com>
References: <20241107-secvio-v3-4-ea27f1e9ced4@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107-secvio-v3-4-ea27f1e9ced4@nxp.com>

Hi Vabhav,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Vabhav-Sharma/dt-bindings-firmware-imx-add-nvmem-phandle/20241107-134504
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241107-secvio-v3-4-ea27f1e9ced4%40nxp.com
patch subject: [PATCH v3 4/4] firmware: imx: secvio: Add support for SNVS secvio and tamper via SCFW
config: csky-randconfig-001-20241108 (https://download.01.org/0day-ci/archive/20241108/202411080826.ovlSnU8b-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411080826.ovlSnU8b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411080826.ovlSnU8b-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/firmware/imx/imx-scu.o: in function `imx_scu_probe':
>> imx-scu.c:(.text+0x3dc): undefined reference to `imx_scu_secvio_init'
>> csky-linux-ld: imx-scu.c:(.text+0x460): undefined reference to `imx_scu_secvio_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
