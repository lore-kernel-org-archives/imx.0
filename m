Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22CE18FDAF;
	Thu,  7 Nov 2024 17:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731000934; cv=none; b=RG9Jwa1lgV4r8F/uymfVfTeAg/d9sooI2YIMTfkrNRYR5Dtp2DhAg3Xac1GUsdXWoNhRvWIO/hCo7DFWqf7Jz5lmzia1AAjsH2Xkwb9ijLSvcDiR5y5jzMN/jmnEOADkB5bdrUCC/Mb5pLFYbL1zYQqnLUJBiCKZEmYlxCvjdl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731000934; c=relaxed/simple;
	bh=Fh7b2FLtKZz1fA4g8oA+3ghKoAEai4NjPZV7Xf1oozk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZHJiL3ABaplvLfFFzWEglCIbcr/eNy0xc7b+9Pew48tTL+ZLz7gj3SOi1ioHqSqz8UIp33dlBBa/cA+IthwtB4n6DDqkkGlrm0vNeVq8aGrZNddmiVbSaAagXFTqHHEPMKjC/CNU8gWFKm6xmagzPl2CHFNhOAXGCGkm9ayWIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aRcWTz16; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aRcWTz16"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731000932; x=1762536932;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fh7b2FLtKZz1fA4g8oA+3ghKoAEai4NjPZV7Xf1oozk=;
  b=aRcWTz16TUHgBzLWg7iZNieF6DjCw66a2RX85jQE0dCPCXEJlXrBH+tv
   a/0w4fNlNKDcftFLXUpLJJDxIzLVSgT4G3gnZvIvUpiiCe5LGJEi9spI8
   oG9SonGjWDL7Yd3poXDH1MImoz41g81PSyqrUzX2Gid1KvRA17ETXzFgh
   jyRjNTrUcwubLtx1QnbWVeazfQXLqhLwAI33z17Acaxz17Y3gApvhab8U
   Yt+Q4Uqtnoso3hsOFOPCfdSO6+yX8vaikvzoxLhukADI2A7aXsMVfh9EG
   9KCHvla1eDL/o3m41ca45xYAPZ3zIal8RHx58n/XeQTHHK7greuw1NDej
   g==;
X-CSE-ConnectionGUID: f/vcK5lJT22RAuA+0x8L0A==
X-CSE-MsgGUID: sM6Utl74Qp6MlJx4NsH4FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30281678"
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="30281678"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 09:35:31 -0800
X-CSE-ConnectionGUID: sRYe6437RISlO9BLWn+mog==
X-CSE-MsgGUID: Hd+P5H2JSPSX7Ag2FJXLJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="84786005"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Nov 2024 09:35:27 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t96Pk-000qY8-39;
	Thu, 07 Nov 2024 17:35:24 +0000
Date: Fri, 8 Nov 2024 01:35:20 +0800
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
Message-ID: <202411080130.F3kATjgU-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Vabhav-Sharma/dt-bindings-firmware-imx-add-nvmem-phandle/20241107-134504
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241107-secvio-v3-4-ea27f1e9ced4%40nxp.com
patch subject: [PATCH v3 4/4] firmware: imx: secvio: Add support for SNVS secvio and tamper via SCFW
config: nios2-randconfig-r131-20241107 (https://download.01.org/0day-ci/archive/20241108/202411080130.F3kATjgU-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241108/202411080130.F3kATjgU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411080130.F3kATjgU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/imx/imx-scu-secvio.c:59:15: sparse: sparse: symbol 'scdev' was not declared. Should it be static?
>> drivers/firmware/imx/imx-scu-secvio.c:387:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void * @@
   drivers/firmware/imx/imx-scu-secvio.c:387:37: sparse:     expected void [noderef] __user *to
   drivers/firmware/imx/imx-scu-secvio.c:387:37: sparse:     got void *
>> drivers/firmware/imx/imx-scu-secvio.c:399:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/firmware/imx/imx-scu-secvio.c:399:46: sparse:     expected void const [noderef] __user *from
   drivers/firmware/imx/imx-scu-secvio.c:399:46: sparse:     got void *

vim +/scdev +59 drivers/firmware/imx/imx-scu-secvio.c

    56	
    57	static struct platform_driver imx_secvio_sc_driver;
  > 58	struct platform_device *pdev;
  > 59	struct device *scdev;
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
