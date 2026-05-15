Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57B53DE45D;
	Fri, 15 May 2026 18:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778868138; cv=none; b=PdKYilsje+HE2GhNm5pyQQEgRt1HgCB64qyWQNRGGGEX3WOF/v7o76ZaCn+Z5EM3Inv3CJCBQrJWvd4GBauqH/WgDqFIcUjyipuRtB9apErrTHPvw5At1NJm5OLE+ncQAfY6nUVVFumzXlA89I191hFDopsqa9xFn42f1J+El4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778868138; c=relaxed/simple;
	bh=j2imBNA9kvMMXbSFIfoSRYPytViu7sjBy7OK4+iCV/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=davZtvr5FyFx9zd1bIDtpnVuiu0N3oYqvfa4jr4gOGO+yEGUO5lK4+yWwjcou5aMHYVKNANskfSZElwwIoJXwN0uTY5hxFjnTx4SJLozW9fMcs470zqu+/LqNCfWsbOEOJ5MuZWm+Vo8SqN2ebolEpjxNxbzOjymi92gdT4KqvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=baADlfA0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="baADlfA0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778868136; x=1810404136;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j2imBNA9kvMMXbSFIfoSRYPytViu7sjBy7OK4+iCV/4=;
  b=baADlfA0lIrcHOf3emDhOREK+OrB7IUJ21sHvLPGNLz3hVKUkj7ZhjCe
   gO5weIv51sf4igVw5UqpNA7SS8zXVlyOQ49+gFpV+H/SjMmVJinB3e0MS
   EFc3lQpaFrN2iY/S2HlxqQKn6H8saf5tIr/3DPugyBhORnwegD+smWWnl
   /t6Lz6UyMTqFA9lPi9ottzho+DZdm/dYgS+yuUcNnlaTiLK3IAJ/jgoUC
   jGdT/IeZZR1N/hzTfmdqlr+o7CHQXwlscKh9i8yGeEjRCg1Xwg/Q6PHXB
   O97RppukMn599lvRiuEnUueU+UZ0409PndkkAVVNkEpT7T5P+lV7U2UmQ
   A==;
X-CSE-ConnectionGUID: cT74tO65S/aIzDpVgHm2DA==
X-CSE-MsgGUID: /u3PxT3mSgSffdIhrMR/WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="83443393"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="83443393"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 11:02:16 -0700
X-CSE-ConnectionGUID: lyJEzLiPRWeV7hriYmFJVQ==
X-CSE-MsgGUID: aLS7/RxtRP+FXHW5dhqtng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="237892226"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 15 May 2026 11:02:13 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNwrF-000000002Tj-1W4K;
	Fri, 15 May 2026 18:01:58 +0000
Date: Sat, 16 May 2026 02:01:08 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 1/1] media: v4l2-common: Add helper function
 media_bus_fmt_to_csi2_(bpp|dt)()
Message-ID: <202605160116.STJsNWSa-lkp@intel.com>
References: <20260513205949.105444-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513205949.105444-1-Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on media-tree/master sailus-media-tree/master linus/master v7.1-rc3 next-20260508]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/media-v4l2-common-Add-helper-function-media_bus_fmt_to_csi2_-bpp-dt/20260515-161325
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20260513205949.105444-1-Frank.Li%40nxp.com
patch subject: [PATCH v4 1/1] media: v4l2-common: Add helper function media_bus_fmt_to_csi2_(bpp|dt)()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260516/202605160116.STJsNWSa-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160116.STJsNWSa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160116.STJsNWSa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/rockchip/rkisp1/rkisp1-common.c:8:
>> include/media/mipi-csi2.h:58:1: error: unknown type name 'u32'
      58 | u32 media_bus_fmt_to_csi2_dt(int bus_fmt);
         | ^~~
   include/media/mipi-csi2.h:71:1: error: unknown type name 'u32'
      71 | u32 media_bus_fmt_to_csi2_bpp(int bus_fmt);
         | ^~~


vim +/u32 +58 include/media/mipi-csi2.h

    49	
    50	/**
    51	 * media_bus_fmt_to_csi2_dt - Get MIPI CSI2 data type from media bus format
    52	 *
    53	 * @bus_fmt: media bus format identifier (MEDIA_BUS_FMT_*)
    54	 *
    55	 * return MIPI CSI2 data type MIPI_CSI2_DT_*, MIPI_CSI2_DT_INVALIDATE means
    56	 * can't get data type from bus_fmt.
    57	 */
  > 58	u32 media_bus_fmt_to_csi2_dt(int bus_fmt);
    59	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
