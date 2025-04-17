Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678DE23F26A;
	Thu, 17 Apr 2025 12:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744893565; cv=none; b=qawesyLCpcqWnH+j9JFmaAvJye0Qp5hkqloDaLWGW6LDK+VhZU4AIxw8CyV0MO3yzFQOSHlDQRouy4GyXiE9zdTSmb4mAfHt9/uNM/mRE26SC5VTWDjhcfrc3uvA6TWLOLIxlKI9LaaB0cODhdk3mg0mfpHo9xPWDmxcVwKcNaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744893565; c=relaxed/simple;
	bh=Q6ls8nXfCLbg6Gn8VXIwtK9f14Vv3gsPMNnsuO1EQsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZkFKhisPn8Q4C/1ogPM1ykD4twyTWT4Q1fNkWJXFsi2sDsas3uV4RlM1y8w6hThhsZiWVl8L2mCsByVyZqDlXzHfpHUVd055hFZCQEqD37kZ+DJSJuj0V4DCZBXEB+Kc8Wwcg79j7L7N1BUumeGY75kqYmTMdmSkImvWriY0d3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UM7kBt8u; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UM7kBt8u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744893563; x=1776429563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q6ls8nXfCLbg6Gn8VXIwtK9f14Vv3gsPMNnsuO1EQsY=;
  b=UM7kBt8uwhDQ2rYT21MZ/DGqn80UOMO0uajotMHHeiDEVgpAxHHBC/wy
   EaHKxBLpXHQ1nTyPKWNGToS3bzlkX0ZqsbD/EjeEaNSelu5VCSvC+T9NR
   bpDupROXXOd6xy7px2RlCzjYyAzjOSpduAUyHbLVnglcj2ZJyL7Q5J42U
   6mjcMWRmrmqmzsjjpaEdQvqhapdh0xbKAeEgnfUQS/kf/aLHfaeDJAIaW
   wNETXrn683t0LwzpZoT0p+kuhJlcYBbr1PbC4Lvmo2g8UMo+4LgcQGfE1
   5LEeHGYoC5kSHSvyg6OogwzPIBWMJAawUzvuJdvRp2yzW3SOHav40YfKR
   Q==;
X-CSE-ConnectionGUID: V6CWxwvIS16tYeBcu+PWpA==
X-CSE-MsgGUID: vKr0BD6iQLq80x7vmR7p1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="64015063"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="64015063"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 05:39:22 -0700
X-CSE-ConnectionGUID: v43BFzS3RQ+0avd8i/dxCQ==
X-CSE-MsgGUID: NzuJVe9/TEiFihEIZEYzkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="135757965"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Apr 2025 05:39:21 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5OWU-000Mim-0S;
	Thu, 17 Apr 2025 12:39:18 +0000
Date: Thu, 17 Apr 2025 20:38:33 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Yang <xu.yang_2@nxp.com>, krzk@kernel.org, myungjoo.ham@samsung.com,
	cw00.choi@samsung.com, robh@kernel.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 2/3] extcon: ptn5150: Add Type-C orientation switch
 support
Message-ID: <202504172041.B86u6VMO-lkp@intel.com>
References: <20250416105940.1572672-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416105940.1572672-2-xu.yang_2@nxp.com>

Hi Xu,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk-dt/for-next]
[also build test ERROR on chanwoo-extcon/extcon-next linus/master v6.15-rc2 next-20250417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Yang/extcon-ptn5150-Add-Type-C-orientation-switch-support/20250416-185917
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git for-next
patch link:    https://lore.kernel.org/r/20250416105940.1572672-2-xu.yang_2%40nxp.com
patch subject: [PATCH 2/3] extcon: ptn5150: Add Type-C orientation switch support
config: csky-randconfig-001-20250417 (https://download.01.org/0day-ci/archive/20250417/202504172041.B86u6VMO-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504172041.B86u6VMO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504172041.B86u6VMO-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "typec_switch_set" [drivers/extcon/extcon-ptn5150.ko] undefined!
>> ERROR: modpost: "fwnode_typec_switch_get" [drivers/extcon/extcon-ptn5150.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
