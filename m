Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1D2226EF3;
	Tue, 10 Dec 2024 05:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733808232; cv=none; b=JFJh+2Xfs4FVFu5mxwFnp2UvHukrKzkgydZwcDzZl4RMrUxl28oNCo7XgZ3Ls7kbq5igH7vVJw9ZjIIMal4VZ4Gin3Wek4gcWT5oYPuOLjTYxnAXK0BiblzkBLxxjD+woTjRtCPQoPcm11LB5XXh/RKbYfOSy2ziujld9u+N2BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733808232; c=relaxed/simple;
	bh=+yvIxadNHP2tMjc38a6nuEX5dE9n2JekZyl1HOaVL4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/IFApbZQt4ajt/9CY9wXNi5sZuSuAHfBEqoAYnoGZJ8yB5t/HmtHFlmeukJUodDNuv6HsWgC5QDnkOUd0P5A08AWtRBhneXMENgtFlNp8DYraobUgmiS3wH2wFj5wIKvY7BRc8wKE1xgKSdY/TURFi6xpSzmBHa//SySy46N6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h3QpNI84; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h3QpNI84"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733808231; x=1765344231;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+yvIxadNHP2tMjc38a6nuEX5dE9n2JekZyl1HOaVL4I=;
  b=h3QpNI84o4cXamOJUIDAXd13JmtZIK3MhiVTm19byiFwozBlXGJX5iXq
   kgDhAkCzirNxDZzbmpRp6VzjZ/cww01Np/lvhJJt43MVcn/RjFSAQAenz
   1zSNZlTPrQdHg3Q9p5hsIzIgkRu3+JPdLMpM5m0ifd/dNdvVhB2tIHUSX
   FedcIQANvrtKsGboHs3RlBw1KbQHiYPYjiYU/G/tgiJcBlxu+5qFWcYDA
   FtuSAnr6zxe+j1fF+c3syVGxYs8/B4zZ9Z1FbZhuKmc0Be6FvHK65Y/Tq
   PCeXO/kb0vcbob7z3mNNvkkqNKHRFpPyTIB5T5XExd8rdwvcFJImGuYua
   Q==;
X-CSE-ConnectionGUID: gybU5xvZS42MGmypjdE5rQ==
X-CSE-MsgGUID: IbMlL313RbycCuTR35rwsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="56616476"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="56616476"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 21:23:50 -0800
X-CSE-ConnectionGUID: SyTKH2znT7iIfSGI/sbSmg==
X-CSE-MsgGUID: 8BL6lDlHTTuI51xf1CTxPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="95134854"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Dec 2024 21:23:45 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKsil-00058Z-1M;
	Tue, 10 Dec 2024 05:23:43 +0000
Date: Tue, 10 Dec 2024 13:22:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH v6 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <202412101248.CBSpbBCZ-lkp@intel.com>
References: <20241206070955.1503412-3-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206070955.1503412-3-ciprianmarian.costea@oss.nxp.com>

Hi Ciprian,

kernel test robot noticed the following build errors:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on robh/for-next linus/master v6.13-rc2 next-20241209]
[cannot apply to arm64/for-next/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ciprian-Costea/dt-bindings-rtc-add-schema-for-NXP-S32G2-S32G3-SoCs/20241206-151308
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20241206070955.1503412-3-ciprianmarian.costea%40oss.nxp.com
patch subject: [PATCH v6 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241210/202412101248.CBSpbBCZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412101248.CBSpbBCZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412101248.CBSpbBCZ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__udivdi3" [drivers/rtc/rtc-s32g.ko] undefined!
>> ERROR: modpost: "__divdi3" [drivers/rtc/rtc-s32g.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
