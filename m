Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116722C0F63;
	Wed,  3 Dec 2025 21:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764797079; cv=none; b=a09/Di79nsYpRsaAhJO48xaEP070vbZfHt8W7xbhQf04n7LJ0ZSq7iLrNb91hFhRgxt48KjHn9ZbhofUZmVJ8PcAzJQNjTe6MfYKp2yvSWRSBDUXb0wrbNjp7zWEQa9pUS3lGBgupPmN08Se4B2FtO2dT9UZD7UI8xoXs/KiXqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764797079; c=relaxed/simple;
	bh=0TehpwgFZ2L8M4iWs7xHgPxQr72Xb7Q3ZhPC0FXXTEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gN4Cv+g9TJDSR3Eoavc+C9BYk/87htSzcSHLC3mhVeDlWv+8/T9gl5IyzIN5v5HTHorWBCCwQsi4Aeh9ekSXE8vVhYIwmNJ/AjDiHvHOSD75YaQ4JEoF4dL0kU+zxJBcMAPXE7SB72E7pSi2che66f+WD9Kpjgv18wPicFp0teI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvFqfl35; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvFqfl35"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764797078; x=1796333078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0TehpwgFZ2L8M4iWs7xHgPxQr72Xb7Q3ZhPC0FXXTEo=;
  b=JvFqfl35xRQz+oAYNwQGW9OwMlU9OIzPoXWinRHee99TLl2m5sSf65eo
   CQrswNyzTQWlGkPFx7BXtV7OJlztoAIplF59ci4nsXJnWJn6CgKiZ8jgz
   taZ8iXYxIcrOwTIw/I2VD3gk5JzN4LJXZlY4mSKLmEzSd6x19Uf3pJv5U
   Rm1YlHnpXsPsN0L1lQqT7dJLL9RbsOfD1kHnd0xPBoOdIvDp39u9G95d+
   dSDu8Klorby4p1OT20WQi47hwg2LSwuHzlt354q5HFmb9GzUQqR5laNZT
   qFdGzLji8RpawTNMwD4Gii7d041j0N4pOwcWDmFI9g1FuKU4ezGFKlv9h
   A==;
X-CSE-ConnectionGUID: C6+Vg7GSToudAFhaTQxH/w==
X-CSE-MsgGUID: G5fkSnofRIuQ8n7ZMr1EhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="65806346"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="65806346"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 13:24:37 -0800
X-CSE-ConnectionGUID: uz3TUeTUSdeOiDsdaabYbA==
X-CSE-MsgGUID: Zf8w5r/eR8+XlNXN/lfV6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="194716772"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Dec 2025 13:24:34 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQuKt-00000000DAL-1ZRz;
	Wed, 03 Dec 2025 21:24:31 +0000
Date: Thu, 4 Dec 2025 05:24:24 +0800
From: kernel test robot <lkp@intel.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <frank.li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver
Message-ID: <202512040546.yLIh1wBH-lkp@intel.com>
References: <20251203-csi_formatter-v1-2-eb9e1147b49e@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-csi_formatter-v1-2-eb9e1147b49e@nxp.com>

Hi Guoniu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1f2353f5a1af995efbf7bea44341aa0d03460b28]

url:    https://github.com/intel-lab-lkp/linux/commits/Guoniu-Zhou/media-dt-bindings-Add-CSI-Pixel-Formatter-DT-bindings/20251203-143208
base:   1f2353f5a1af995efbf7bea44341aa0d03460b28
patch link:    https://lore.kernel.org/r/20251203-csi_formatter-v1-2-eb9e1147b49e%40nxp.com
patch subject: [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20251204/202512040546.yLIh1wBH-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512040546.yLIh1wBH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512040546.yLIh1wBH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/nxp/imx9-csi-formatter.c:763:12: warning: 'csi_formatter_system_resume' defined but not used [-Wunused-function]
     763 | static int csi_formatter_system_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/nxp/imx9-csi-formatter.c:758:12: warning: 'csi_formatter_system_suspend' defined but not used [-Wunused-function]
     758 | static int csi_formatter_system_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/csi_formatter_system_resume +763 drivers/media/platform/nxp/imx9-csi-formatter.c

   753	
   754	/* -----------------------------------------------------------------------------
   755	 * Suspend/resume
   756	 */
   757	
 > 758	static int csi_formatter_system_suspend(struct device *dev)
   759	{
   760		return pm_runtime_force_suspend(dev);
   761	}
   762	
 > 763	static int csi_formatter_system_resume(struct device *dev)
   764	{
   765		int ret;
   766	
   767		ret = pm_runtime_force_resume(dev);
   768		if (ret < 0) {
   769			dev_err(dev, "force resume %s failed!\n", dev_name(dev));
   770			return ret;
   771		}
   772	
   773		return 0;
   774	}
   775	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
