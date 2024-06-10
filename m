Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862191876;
	Mon, 10 Jun 2024 01:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717983242; cv=none; b=ROVh7EGknkyfXw54SGVuMXcX7qeiUfjfFbY3HDQ9QDWlH7OGXFNEl+g5X2SHLATYeMaayTA2ciXw4YnN1FGd/0dw+Cuu+LUoVKUBXCXPr7fO1iBoYwJYOLTvzmnd0evoyvK/ystgOKELS4SC00GUVk/Q/kFbZaZ6f6JS5oI4zmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717983242; c=relaxed/simple;
	bh=Q4HDVCK0RP5fR7/9Wm1KAIacjGw3JnIYUq6KRiAmIbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWmCLxXA9qwLKxrRWI8SSAXFKQXP2QlW1l15ohMJiGcXVU0htZvKCSZ92lA7DaDu2ByWoWP0VlJw4cQ5r0I/lRNrbQXlTw/YAxOOYmxgdiLJ5toXQ3aXQ/QweOwwH0DSyzked5sEJ5sPN+l2emEydqAeEnol5fXZJs+i0dUVzw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XumhwjRT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XumhwjRT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717983240; x=1749519240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q4HDVCK0RP5fR7/9Wm1KAIacjGw3JnIYUq6KRiAmIbw=;
  b=XumhwjRTSXtfXBtNURnG4nT6B1i5E9TUJ7bjBtEbPmO/wAroSPd3+TdI
   hG2DybNrk+fKknvmLeL9MF7JOYwHGyvFEOjdSfqBNnl9gsDnQeuHq1dwe
   /tzE8TtVWR6ILFuS1dxrOuTqdmeq8z4s2HJqkjw6qpM9zUvEnnpmsqY6w
   jXwnc/a7H0PfJwfyIXh6oRI+65mmzlBNQWEwkgCVPF+oL6QkmhilQ2LUl
   WgHpf2ON433dEQ83cRw44lsIN0dYXrdNL/HyzE4F+i6lddp6NSgfnTjAi
   oXGqz4oZA2O/PdzZQEkUtX8GSBhV/3vgNwB5EQFnd8u/3qSbN9EeTVCrD
   Q==;
X-CSE-ConnectionGUID: Oovbw7xUR+mJpMsUOGUtHg==
X-CSE-MsgGUID: +Tshy6nOQSOyPXF/FY6pyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14784627"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="14784627"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 18:34:00 -0700
X-CSE-ConnectionGUID: hfqCE1wcSFO2cLj3EjMQqQ==
X-CSE-MsgGUID: EZWbifg8TvK4d6fSj4yRgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="44030684"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Jun 2024 18:33:57 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGTv0-0001kE-0l;
	Mon, 10 Jun 2024 01:33:54 +0000
Date: Mon, 10 Jun 2024 09:33:26 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
	Marco Contenti <marco.c@variscite.com>,
	Nate Drude <nate.d@variscite.com>,
	FrancescoFerraro <francesco.f@variscite.com>,
	Harshesh Valera <harshesh.v@variscite.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v3 3/4] arm64: dts: freescale: Add support for the
 Variscite i.MX8MP DART8MCustomBoard
Message-ID: <202406100920.2CdVa6rb-lkp@intel.com>
References: <20240608180447.31378-4-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240608180447.31378-4-laurent.pinchart@ideasonboard.com>

Hi Laurent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 41f93a496af2696d970cbcb3814261a9b32dbaa2]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurent-Pinchart/dt-bindings-arm-fsl-Add-Variscite-DT8MCustomBoard-with-DART-MX8M-PLUS/20240609-020751
base:   41f93a496af2696d970cbcb3814261a9b32dbaa2
patch link:    https://lore.kernel.org/r/20240608180447.31378-4-laurent.pinchart%40ideasonboard.com
patch subject: [PATCH v3 3/4] arm64: dts: freescale: Add support for the Variscite i.MX8MP DART8MCustomBoard
config: arm64-randconfig-051-20240609 (https://download.01.org/0day-ci/archive/20240610/202406100920.2CdVa6rb-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406100920.2CdVa6rb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406100920.2CdVa6rb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   ti,x-plate-ohms: size (2) error for type uint32-array
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: touch@0: ti,settle-delay-usec: b'\x00\x96' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: touch@0: ti,debounce-tol: b'\x00\x03' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: touch@0: ti,debounce-rep: b'\x00\x01' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: touch@0: ti,x-plate-ohms: size is 16, expected 32
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: /soc@0/bus@30800000/spba-bus@30800000/spi@30820000/touch@0: failed to match any schema with compatible: ['ti,tsc2046']
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: interrupt-controller@32fc2000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
