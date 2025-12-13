Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B322848A4;
	Sat, 13 Dec 2025 22:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765665513; cv=none; b=AWnuFgGQHqJcfft1X16bau/coRc4UfyBGeKmmjX3WwYU6yhMCrrr3af7wsju4JH31QlTLnQgm59z6/5hcnlRqPeo3LfgptyoLAL3xoG4AnQ6CacRrMZjHxzKUH7sXRZUMPvD84jbNR4Ylq2AJQ7r7lZ3BkEpVyRauHPUBco9LC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765665513; c=relaxed/simple;
	bh=x9IUiptFECE3cW/GDCvzyiGlrgVLo6L8ed3LxBK68RM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bcBf+gumpcixHAGRtGC+vgnvjTcpoUqAwv7T9K85wgoaCbdtx9jkXowaXIVxT7C8k69UVtLIWkwAvqCet1X1G0MwvDCVQZUulnrSyKZuKHRx+hueHQszkHWH+VSGvYq0dhiiEisDnz91zuQGWgqOpf2uIiyrT5OsYp4qmnSmJ9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OiGo8Vo9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OiGo8Vo9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765665512; x=1797201512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x9IUiptFECE3cW/GDCvzyiGlrgVLo6L8ed3LxBK68RM=;
  b=OiGo8Vo9K/9PbCkHQpb8LrVvtlFljBJS4HZDnPPonzolItgK0v7839TA
   W96yUSEAUXElNjHc/NGL+09zUwbioJsRUszF4UuIx26ldOnkV1a0LYcIq
   /7qM0wOuve/b40PnBNaTcd6l0Rnob17ZU90b3P4CSmfffUiwo4vEIdnpi
   vKLNydM6YpcJ8kxHvZo9hV0E9HPrP9lxE128nyXKac+KXcijwE04iOqAm
   m26tdHub6+65o+aF/uRckukQ6bxUmDHt+GNv66iF425zN4EtdzWJVR8ll
   VQLXVAkH9MhaRtUCUb1qoihzobgpJ06vm5cMcghPM87rtZyC7z3s32wri
   g==;
X-CSE-ConnectionGUID: ZqGn5DuvSyaNpY5Hc5MdoA==
X-CSE-MsgGUID: 09TyLLSKS+OfkthlSjzD5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67584998"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67584998"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 14:38:30 -0800
X-CSE-ConnectionGUID: C5+MoIrRSh6bNB54VCqnTg==
X-CSE-MsgGUID: oGNlm5zrS7S3sfRx771FLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="202300259"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Dec 2025 14:38:26 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUYFr-000000008HD-3sy5;
	Sat, 13 Dec 2025 22:38:23 +0000
Date: Sun, 14 Dec 2025 06:38:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?iso-8859-1?Q?J=E9r=E9mie?= Dautheribes <jeremie.dautheribes@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	"Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 6/8] gpio: aaeon: Add GPIO driver for SRG-IMX8PL MCU
Message-ID: <202512140637.VrfgC1Tj-lkp@intel.com>
References: <20251212-dev-b4-aaeon-mcu-driver-v1-6-6bd65bc8ef12@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-dev-b4-aaeon-mcu-driver-v1-6-6bd65bc8ef12@bootlin.com>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on d358e5254674b70f34c847715ca509e46eb81e6f]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Perrot-Schneider-Electric/dt-bindings-vendor-prefixes-Add-AAEON-vendor-prefix/20251212-154458
base:   d358e5254674b70f34c847715ca509e46eb81e6f
patch link:    https://lore.kernel.org/r/20251212-dev-b4-aaeon-mcu-driver-v1-6-6bd65bc8ef12%40bootlin.com
patch subject: [PATCH 6/8] gpio: aaeon: Add GPIO driver for SRG-IMX8PL MCU
config: mips-randconfig-r051-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140637.VrfgC1Tj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140637.VrfgC1Tj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140637.VrfgC1Tj-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "aaeon_mcu_i2c_xfer" [drivers/gpio/gpio-aaeon-mcu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
