Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B8E1EF080;
	Mon, 20 Jan 2025 19:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737402239; cv=none; b=CVdoCuCwDu6qVX328/m0pOEWQCPVDYQrystTTPtTFmjaQg8fLEPqX7hVSESlxxzlDZro7ZNPwyHsVNcVPOusSZPl8APdyB2s99ZDMf1A0q+W3rFL8b1v/wkCMsm1xyBEYp4QmpezEnY56j26bu2eiAmEKCld6fbtNeXDw3VPtIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737402239; c=relaxed/simple;
	bh=KIwQ96tcbKsNvtTiJ7Sp5Kac727a4bUVsOQMTqS4RJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQN4G7KOr+a/jKa2ADdkxMbovmJZhV1ld43V7IohPjhXTlIdqaRjEbDjil99U/nZiN6ymSCC/cj0iObcv6dZmsQO5f3BsDzcYRS6rQcQ5eXt98+jggcakyspO30RdUjY0WMvbjpVcBYCEGBJd9t1lJQQ54uL3DXdy4PBB+1I5/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KkIDy/mE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KkIDy/mE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737402238; x=1768938238;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KIwQ96tcbKsNvtTiJ7Sp5Kac727a4bUVsOQMTqS4RJg=;
  b=KkIDy/mEqlsA/s5AP5l3MwAqc80Ixp04bTbTyVPkcV15J5kstDJivrED
   PelqBEczZDZEwto0ff32PTFQiWbqpfhaCVnzVzY+sa4ROvuenH+ru4LZG
   Nj+XQaudKmUT80ZWajJ9ueR90xvuGNrwkII/BH2xTrNSIR4Ta2WVc+IoW
   q9ba1v9iy0oUowG+x4IieUjcUsv0c6sr/bWoUrRFQ7BMCNy16YPl4FBGP
   zVn2pqueJMbc6p1R+tmK+D3O9BAuCYbOd1lJiGTaE2wIWF4PMKExch1a+
   ZB5bbYGnLTVy3os+h3oQKggbzhMlrXtyh/991cmYEpFRDGJo1zIWgLU2X
   w==;
X-CSE-ConnectionGUID: 9QgIs4ypTgml+M2hnFHX8w==
X-CSE-MsgGUID: CybPZVwkSmK2pwt1clH55Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37681902"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="37681902"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 11:43:57 -0800
X-CSE-ConnectionGUID: zmRDdNRTRJ6GTy6M+h+jzQ==
X-CSE-MsgGUID: kPy9akuURPWUJQvFuXE8rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="106419830"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Jan 2025 11:43:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZxgd-000Wvf-2W;
	Mon, 20 Jan 2025 19:43:51 +0000
Date: Tue, 21 Jan 2025 03:43:09 +0800
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
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v12 4/5] firmware: imx: add driver for NXP EdgeLock
 Enclave
Message-ID: <202501210346.wYxcOI66-lkp@intel.com>
References: <20250120-imx-se-if-v12-4-c5ec9754570c@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-imx-se-if-v12-4-c5ec9754570c@nxp.com>

Hi Pankaj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Gupta/Documentation-firmware-add-imx-se-to-other_interfaces/20250120-193050
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250120-imx-se-if-v12-4-c5ec9754570c%40nxp.com
patch subject: [PATCH v12 4/5] firmware: imx: add driver for NXP EdgeLock Enclave
config: arm64-randconfig-002-20250121 (https://download.01.org/0day-ci/archive/20250121/202501210346.wYxcOI66-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210346.wYxcOI66-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210346.wYxcOI66-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/imx/se_ctrl.c:505:12: warning: 'se_resume' defined but not used [-Wunused-function]
     505 | static int se_resume(struct device *dev)
         |            ^~~~~~~~~
>> drivers/firmware/imx/se_ctrl.c:491:12: warning: 'se_suspend' defined but not used [-Wunused-function]
     491 | static int se_suspend(struct device *dev)
         |            ^~~~~~~~~~
   drivers/firmware/imx/se_ctrl.c:228:12: warning: 'se_load_firmware' defined but not used [-Wunused-function]
     228 | static int se_load_firmware(struct se_if_priv *priv)
         |            ^~~~~~~~~~~~~~~~


vim +/se_resume +505 drivers/firmware/imx/se_ctrl.c

   490	
 > 491	static int se_suspend(struct device *dev)
   492	{
   493		struct se_if_priv *priv = dev_get_drvdata(dev);
   494		struct se_fw_load_info *load_fw;
   495		int ret = 0;
   496	
   497		load_fw = get_load_fw_instance(priv);
   498	
   499		if (load_fw->imem_mgmt)
   500			ret = se_save_imem_state(priv, &load_fw->imem);
   501	
   502		return ret;
   503	}
   504	
 > 505	static int se_resume(struct device *dev)
   506	{
   507		struct se_if_priv *priv = dev_get_drvdata(dev);
   508		struct se_fw_load_info *load_fw;
   509	
   510		load_fw = get_load_fw_instance(priv);
   511	
   512		if (load_fw->imem_mgmt)
   513			se_restore_imem_state(priv, &load_fw->imem);
   514	
   515		return 0;
   516	}
   517	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
