Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E3B1BD9D2;
	Wed, 30 Oct 2024 17:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730309251; cv=none; b=I4nEzRj/S/O6jH+OYriTB6Zmfio3b/3/oHJjD7zgu+ZdbSYviX4z8ZE8B1S1McTNOfr3Qvc2ypPHgs1qe0AKdm7J1S1hBaam6+KMdSRypK/Iv5yM674+m0+8Mou44BoYzF4x9eQk3ADyMqZCsVoomE760412rEpwPSSNyttfLcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730309251; c=relaxed/simple;
	bh=cNl2/fGvTSjZNQLFBkNM+rzYZRnqnD+u3xoD1T4iY6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLqfffzJQNuyMdG7VV2OAFQTIzhbKyNU67OtC57keoqF1vFvMbNxSPZlZ6yjGcZ7pcleeYBFVfRKE+4ullz3tMzBA8wBa6eHLdE2QVSgMi7kMLhM4LGWZiaMuxPBjpNu0W8I3PXJvtgfo07e0/7d1M8WlbsLyH0JCKd9sqrV4P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BqaG4V9P; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BqaG4V9P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730309249; x=1761845249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cNl2/fGvTSjZNQLFBkNM+rzYZRnqnD+u3xoD1T4iY6s=;
  b=BqaG4V9PIgfJlyir7u/5ea9LTsd5nGrtcHBBKi4jRjRpcbnB54AjPRkK
   /Gjs0/94+GHvbcunnB2LkF09TuI/VgJI2jIaOndlXwcGEDuYeP8NF2bvK
   Kfr5WO4HNWQoSQqZhA/boXLZQjYsjKFDoiJyBsCWPHJJuKParvYR4HgwS
   2OCZuQcv8piuVYUp92Ket3EckSMoQBnfHyv3mwkPYxpxsda+SaKrEL9S7
   d48yMHhxADbXeeCmzG3ueG82FtvqfWwuBiPaUhwDjgVY0qhhBA/yqvaEs
   HpCzs5yT7ZGD5MwrwYrrZfbX+6P7h66hn7mY6oavJFd3NlQ/xyqJFHqC7
   g==;
X-CSE-ConnectionGUID: 0FZkKewmTOitNi9xjY6tqQ==
X-CSE-MsgGUID: qTzP48IRRaKhHbUCL0iVPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="29921830"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="29921830"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 10:27:29 -0700
X-CSE-ConnectionGUID: 6PCfgC5OTUS4DQd1LF/Lxg==
X-CSE-MsgGUID: qrB5aKwZRLOcSUPXwHEs7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="87169933"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Oct 2024 10:27:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6CTb-000f8v-2x;
	Wed, 30 Oct 2024 17:27:23 +0000
Date: Thu, 31 Oct 2024 01:26:45 +0800
From: kernel test robot <lkp@intel.com>
To: alice.guo@oss.nxp.com, alexander.stein@ew.tq-group.com,
	wahrenst@gmx.net, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	"alice.guo" <alice.guo@nxp.com>
Subject: Re: [PATCH v3] soc: imx: Add SoC device register for i.MX9
Message-ID: <202410310126.WFKQ7LtM-lkp@intel.com>
References: <20241030091336.3901440-1-alice.guo@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030091336.3901440-1-alice.guo@oss.nxp.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.12-rc5 next-20241030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/alice-guo-oss-nxp-com/soc-imx-Add-SoC-device-register-for-i-MX9/20241030-171525
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20241030091336.3901440-1-alice.guo%40oss.nxp.com
patch subject: [PATCH v3] soc: imx: Add SoC device register for i.MX9
config: x86_64-buildonly-randconfig-002-20241030 (https://download.01.org/0day-ci/archive/20241031/202410310126.WFKQ7LtM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410310126.WFKQ7LtM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410310126.WFKQ7LtM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/soc-imx9.c:84:34: warning: 'imx9_soc_match' defined but not used [-Wunused-const-variable=]
      84 | static const struct of_device_id imx9_soc_match[] = {
         |                                  ^~~~~~~~~~~~~~


vim +/imx9_soc_match +84 drivers/soc/imx/soc-imx9.c

    83	
  > 84	static const struct of_device_id imx9_soc_match[] = {
    85		{ .compatible = "fsl,imx93", },
    86		{ .compatible = "fsl,imx95", },
    87		{ }
    88	};
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
