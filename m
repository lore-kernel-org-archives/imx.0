Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492F218E361;
	Fri,  6 Dec 2024 17:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733507107; cv=none; b=InUeTOuO8QStVDqeYGJo0X66Oxb2k5D3tKKAuFDQzZS4myZNPH0ZI8SyeV5RNI0AagVoDahEPOCaPknmVItH5IOwc4gf94p08P212Ep2LyZkl9+/Sngn048oqcJagPgR6dzMA9BWcXGG3DsiA6oTaRsr2Lr5yjTrGAEX9Ei/lNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733507107; c=relaxed/simple;
	bh=vlNGMkQtRJVFoqeWyR5VVwsR/4xTRvRmeXtD9OqxIFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQgbZyyMrjlFEfdjzCHHK0vRNBFhAu6bBq6twAQjQX080Zug+KiTWsLJhS6Uc9Wzi0Bm+yYE+IB4uLX6mc9BRj8friNXwqZ3f4rh/dy5uQkYhzdi7CbJU8YRJPovhxqvfeq1c409Czs4X8Y4YaYzDSarmYid2cMoOLviDxg1Apw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZOTxkdFn; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZOTxkdFn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733507104; x=1765043104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vlNGMkQtRJVFoqeWyR5VVwsR/4xTRvRmeXtD9OqxIFc=;
  b=ZOTxkdFnrUnCt3lluJ9KI/Ewn/jirXI+dYVMBjAbNyzsgEFNgT4aPDo+
   S9AK2MRs18/Ksjrr+urKPwDB+jXhLjEIWjJ7WWZACgDL5bg3CxVKSdfSk
   ufZq1VWIrbUEubjuzprAd35P1TrxVN04NRLf0taobHHpHwbbCUpxCwzRj
   DjCpZHilq1NKZzb9nXwtBM8aJSZcqx+mLyfIwIkDTHHfeEzQ8obka872G
   x4YCOpOmpDaLNchlZRlfBOniOWQzFOWZ3oa3DMWSYvuYz4UDJIjalw1z+
   H+RyQvZ8ObrfMgRijSwMBBWVCjzeAsexg8pRa90lJAZ32cOfMP7CYX1eM
   w==;
X-CSE-ConnectionGUID: sQzfT2j5QEudGPygFhNbFQ==
X-CSE-MsgGUID: rLyeUPuFS3+3NjcKcJx1/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33999113"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="33999113"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 09:45:04 -0800
X-CSE-ConnectionGUID: +7LaT3YuQJqTnzuTU58faA==
X-CSE-MsgGUID: YHtzXtNUQxC1JwVHbSM5Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="95272272"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Dec 2024 09:44:59 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJcNt-00028N-0z;
	Fri, 06 Dec 2024 17:44:57 +0000
Date: Sat, 7 Dec 2024 01:44:51 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?unknown-8bit?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Frank <Li@nxp.com>,
	"open list:PCI DRIVER FOR NXP LAYERSCAPE GEN4 CONTROLLER" <linux-pci@vger.kernel.org>,
	"moderated list:PCI DRIVER FOR NXP LAYERSCAPE GEN4 CONTROLLER" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: PCI: mobiveil: convert
 mobiveil-pcie.txt to yaml format
Message-ID: <202412070127.BkBJhnZ4-lkp@intel.com>
References: <20241205201423.3430862-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205201423.3430862-1-Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.13-rc1 next-20241206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dt-bindings-PCI-mobiveil-convert-mobiveil-pcie-txt-to-yaml-format/20241206-041830
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20241205201423.3430862-1-Frank.Li%40nxp.com
patch subject: [PATCH 1/1] dt-bindings: PCI: mobiveil: convert mobiveil-pcie.txt to yaml format
reproduce: (https://download.01.org/0day-ci/archive/20241207/202412070127.BkBJhnZ4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070127.BkBJhnZ4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/hwmon/isl28022.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pci/mobiveil-pcie.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pci/layerscape-pcie-gen4.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
