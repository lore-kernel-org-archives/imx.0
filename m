Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC381411C8;
	Tue, 22 Oct 2024 19:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729626127; cv=none; b=NUY8nsuOBrkXLGNlBThpUam6Zy2bqr6+r/Z315y9IAqj4W1F4kqJs8geUuTfs5DV+TVlsgtIFD2d8et67VzTDCwNyafot4z2alLNFlcowqFupOvnZlISWzIdMB+yupkR5CxfYuUihTx7X5G8IlhEoloMNETaysq3SzINLg9h5cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729626127; c=relaxed/simple;
	bh=QQc7sW7+SBjdpzhiB9fl4wHUT1zzT8I+K0VfEb+0Hro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CuL+0CY8T02+JrHT5Kdvktq7sJchEleC/KpFEar3LxHa+CjiGq09flrbQ0TPvw/PGyBdwhE4fkl5VRO+U00Mr42A3dHecBhb8mP/Sou9ZOma7WW0HBhe9YMYIgjctR3gPPDy1OgMTw/IcgK2AYv+u638jxzs5DzdzWCzIgzk2i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z8vobBDM; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z8vobBDM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729626126; x=1761162126;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QQc7sW7+SBjdpzhiB9fl4wHUT1zzT8I+K0VfEb+0Hro=;
  b=Z8vobBDMFpNujEGOhO+9Vk3HRSfs66dojAIBNfEdTQmdJQAGhWRw8rBW
   bNlrPBmlqYuQ/B+SFX91LhhwmsctJk8Is/W9vBE1XoIBZiN3DbXNXzNgs
   KP0BMRqHdeARr1E9TT5qWmxFP29+9xHWbzR2+xq4QVeTwCo1pv3nQ3TIm
   h7Iu0oLMZeMPIqSdQAkHJFsMaayq1Q77t0eqecI/Q8g0h2xozggsM5wfa
   pds4ynxnYSaKGVd04eraoo6OeiYyXVaQOUnlm9wzRtlm7ko99UYf35rK0
   jdwgTupPN45iGR1jsZOYDv1Kh+4TfJYdA70QTnzH+K8ViEm+2HkTnxAxD
   w==;
X-CSE-ConnectionGUID: W3LOJ/ixS1uSJSGo6N9/3w==
X-CSE-MsgGUID: H5D+iU9zTHyei/cZ4kVXOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28964348"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28964348"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 12:42:06 -0700
X-CSE-ConnectionGUID: 2NPEaIm3TUqbE4Fuzm0g3Q==
X-CSE-MsgGUID: zh7g0qZTSpKyd6aucQOrKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="84567463"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Oct 2024 12:42:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3KlS-000U1g-1I;
	Tue, 22 Oct 2024 19:41:58 +0000
Date: Wed, 23 Oct 2024 03:41:08 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Abraham I <kishon@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/4] PCI: dwc: ep: Add bus_addr_base for outbound
 window
Message-ID: <202410230328.BTHareG1-lkp@intel.com>
References: <20241021-pcie_ep_range-v3-1-b13526eb0089@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021-pcie_ep_range-v3-1-b13526eb0089@nxp.com>

Hi Frank,

kernel test robot noticed the following build errors:

[auto build test ERROR on afb15ca28055352101286046c1f9f01fdaa1ace1]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/PCI-dwc-ep-Add-bus_addr_base-for-outbound-window/20241022-041043
base:   afb15ca28055352101286046c1f9f01fdaa1ace1
patch link:    https://lore.kernel.org/r/20241021-pcie_ep_range-v3-1-b13526eb0089%40nxp.com
patch subject: [PATCH v3 1/4] PCI: dwc: ep: Add bus_addr_base for outbound window
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20241023/202410230328.BTHareG1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410230328.BTHareG1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410230328.BTHareG1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/dwc/pcie-designware-ep.c: In function 'dw_pcie_ep_init':
>> drivers/pci/controller/dwc/pcie-designware-ep.c:885:49: error: passing argument 3 of 'of_property_read_reg' from incompatible pointer type [-Wincompatible-pointer-types]
     885 |                 of_property_read_reg(np, index, &ep->bus_addr_base, NULL);
         |                                                 ^~~~~~~~~~~~~~~~~~
         |                                                 |
         |                                                 phys_addr_t * {aka unsigned int *}
   In file included from drivers/pci/controller/dwc/pcie-designware-ep.c:12:
   include/linux/of_address.h:75:64: note: expected 'u64 *' {aka 'long long unsigned int *'} but argument is of type 'phys_addr_t *' {aka 'unsigned int *'}
      75 | int of_property_read_reg(struct device_node *np, int idx, u64 *addr, u64 *size);
         |                                                           ~~~~~^~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/of_property_read_reg +885 drivers/pci/controller/dwc/pcie-designware-ep.c

   846	
   847	/**
   848	 * dw_pcie_ep_init - Initialize the endpoint device
   849	 * @ep: DWC EP device
   850	 *
   851	 * Initialize the endpoint device. Allocate resources and create the EPC
   852	 * device with the endpoint framework.
   853	 *
   854	 * Return: 0 if success, errno otherwise.
   855	 */
   856	int dw_pcie_ep_init(struct dw_pcie_ep *ep)
   857	{
   858		int ret;
   859		struct resource *res;
   860		struct pci_epc *epc;
   861		struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
   862		struct device *dev = pci->dev;
   863		struct platform_device *pdev = to_platform_device(dev);
   864		struct device_node *np = dev->of_node;
   865		int index;
   866	
   867		INIT_LIST_HEAD(&ep->func_list);
   868	
   869		ret = dw_pcie_get_resources(pci);
   870		if (ret)
   871			return ret;
   872	
   873		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "addr_space");
   874		if (!res)
   875			return -EINVAL;
   876	
   877		ep->phys_base = res->start;
   878		ep->bus_addr_base = ep->phys_base;
   879	
   880		if (pci->using_dtbus_info) {
   881			index = of_property_match_string(np, "reg-names", "addr_space");
   882			if (index < 0)
   883				return -EINVAL;
   884	
 > 885			of_property_read_reg(np, index, &ep->bus_addr_base, NULL);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
