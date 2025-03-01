Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0B81E4929;
	Sat,  1 Mar 2025 21:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740865593; cv=none; b=rqSQfTKhuqAMAU0fg8OnHd89XjoDWt7cLG9hiz21QWZSddoRiCvSBMxIoeRF85j1QuKIe7t68dyA0ZpagPRahZOA85euruAc4vi+JGSHyEuhGnl8G281ioC1v1uXsv7+gAlgGAm/Byrtk5Mrvbwbn/mrcMlAALRWUllQrycFRow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740865593; c=relaxed/simple;
	bh=6l1uC5pceOA+uIFkP/26PTWpP7l3GTDpEwiEC3W1O4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TjGMIEB0DJ5LD2A0+qIZydyGv0QYUdls8XcILqnOXiOYNxM2LYnZ4wsWhEViw6SEd7tQ2uWQo8nMlLDXel7cMpPHS77lhdKuQIUWuD49rGQtcXiW7PUfyRt7DMYU5CGzHhofAPI+WMl96gOFDxsO3S4W+rNlA9+D2YrhK0bksxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJj9+dme; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJj9+dme"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740865593; x=1772401593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6l1uC5pceOA+uIFkP/26PTWpP7l3GTDpEwiEC3W1O4E=;
  b=fJj9+dmeXPNTyDpF34nYK/fdU8ZWUM62y3TF0YxEv0IOoZUZnDQoJkWU
   PhlUxGdwpOmcAKY+sva15PvYa+yAPOu4l6QaHW4k02PM0FRoDTUGNO81D
   lLY9mLbKZit05OBOPpE90j57tpoObOyaDfXgtDJNHiIWoDF+V1zR5IF98
   ut8SOcNI5GrNDa9ydWJ4z6zDmM5m7pWy8xRltUVxSC6OjeRweVblJd5pA
   Y/MwFozBpKRuHI4GuNPbF8Cq4cyfwpgjRRhkZ6+6dwZ3nba3bF9nM9p+0
   6mo+hTWW+QUxzSg5SkLG+BjT5YXWeZ71czaEgllwOzG8cgd11R2WCBklJ
   g==;
X-CSE-ConnectionGUID: PGvc/Ph8RQWQ6I3FnwlwYw==
X-CSE-MsgGUID: FU6/8+v4R5+mqf1Ax1kUdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="59316344"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="59316344"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 13:46:32 -0800
X-CSE-ConnectionGUID: 7J9dfahmT5WnwjSLafCx7Q==
X-CSE-MsgGUID: YQEx4K2USDqm09yvEVjOqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="148453162"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Mar 2025 13:46:26 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toUfA-000GjY-01;
	Sat, 01 Mar 2025 21:46:24 +0000
Date: Sun, 2 Mar 2025 05:45:30 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Marek Vasut <marex@denx.de>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: Re: [PATCH 4/9] drm/panthor: Implement optional reset
Message-ID: <202503020521.MBUsoVte-lkp@intel.com>
References: <20250227170012.124768-5-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227170012.124768-5-marex@denx.de>

Hi Marek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on robh/for-next arm64/for-next/core kvmarm/next rockchip/for-next soc/for-next linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/dt-bindings-reset-imx95-gpu-blk-ctrl-Document-Freescale-i-MX95-GPU-reset/20250228-011031
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20250227170012.124768-5-marex%40denx.de
patch subject: [PATCH 4/9] drm/panthor: Implement optional reset
config: x86_64-kismet-CONFIG_RESET_SIMPLE-CONFIG_DRM_PANTHOR-0-0 (https://download.01.org/0day-ci/archive/20250302/202503020521.MBUsoVte-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250302/202503020521.MBUsoVte-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020521.MBUsoVte-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESET_SIMPLE when selected by DRM_PANTHOR
   WARNING: unmet direct dependencies detected for RESET_SIMPLE
     Depends on [n]: RESET_CONTROLLER [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - DRM_PANTHOR [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARM || ARM64 || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=n] && MMU [=y] && SOC_IMX9 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
