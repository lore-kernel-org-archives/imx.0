Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56E11C302B;
	Thu, 28 Nov 2024 21:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732828712; cv=none; b=vDGUaWfRXiq0KGzqgJquTNboInnr68KKwQEMsCLwdNBqtUPfutZSHM/7eJCYwD43D7BeeznwV6zFP9QZFLrSxdkhOYZQ9/El0Cmlpd7Ms4kkBdv/tf5SXVt47WGRN3HW2NKayJeh4owsG/+Je60JQyxkc+TdpDH6ww0eaGZwhHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732828712; c=relaxed/simple;
	bh=GO+N933rH1qIyupawKjaT9KoZU7mSDCkyHjVeWZvROM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mEgO1HsBKLv8kKOsNFPpCsxBB+cml2lHcwwSknvhP8Ge3DIIwu6WGqDe3n7xEB9OxIhHO+Ewu5H7JtgjLWhnyyp3MnVnc43XMZaMBPulVl/FiUo61UVtdpnVMNL07RJBTxyjjQKjHe82nEGFrQ1CHlq7Z1yMDjtbVovs7phRJyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JmJCxTUv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmJCxTUv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732828710; x=1764364710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GO+N933rH1qIyupawKjaT9KoZU7mSDCkyHjVeWZvROM=;
  b=JmJCxTUvqqnXbuh/E0lPMpYe/fCyw4jJCjhJ0dqERCTe6WBgOy0ZHLsX
   YNg4NwqK2VG9bX9+x1crRGUueyzDCj2PIqxszV07BQexB2BA7rq65kFQf
   4YxgWsUFO3d2wo3VccD6POp51l5U1YL1YV16CRS1hLSc+3caB32NT8+NW
   v4HkSuLzdmuyQWS7XZ8utMvXrmigxxXKnnzyGwKJjxUES0ok59M6aKnpd
   16S1YLleIXLivZM+oXVgMDWMvpTKCbtOpQMMPOGw17zqUYF9d1/EdQFju
   DAsEYELoNjsm9VZPiRaxJnP2Xa5S9ztkiCpB1ZrvxwlGftvNcysQPFYe4
   g==;
X-CSE-ConnectionGUID: HJCy1uiPTGiBA9n+jUB8vQ==
X-CSE-MsgGUID: tmHpD7ByR/WsNlN4JUPVrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="36999187"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="36999187"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 13:18:30 -0800
X-CSE-ConnectionGUID: yuXQn1uPTdemmEhda96acg==
X-CSE-MsgGUID: 9FrGQozmT5m6JkP2rMIpxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="129819816"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Nov 2024 13:18:26 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGlu3-000A3b-1H;
	Thu, 28 Nov 2024 21:18:23 +0000
Date: Fri, 29 Nov 2024 05:18:02 +0800
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
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH v5 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <202411290700.vbqI1pTY-lkp@intel.com>
References: <20241126114940.421143-3-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126114940.421143-3-ciprianmarian.costea@oss.nxp.com>

Hi Ciprian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on arm64/for-next/core linus/master v6.12]
[cannot apply to abelloni/rtc-next next-20241128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ciprian-Costea/dt-bindings-rtc-add-schema-for-NXP-S32G2-S32G3-SoCs/20241128-100010
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241126114940.421143-3-ciprianmarian.costea%40oss.nxp.com
patch subject: [PATCH v5 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20241129/202411290700.vbqI1pTY-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290700.vbqI1pTY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290700.vbqI1pTY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-s32g.c:109: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Convert a number of seconds to a value suitable for RTCVAL in our clock's


vim +109 drivers/rtc/rtc-s32g.c

   107	
   108	/**
 > 109	 * Convert a number of seconds to a value suitable for RTCVAL in our clock's
   110	 * current configuration.
   111	 * @rtcval: The value to go into RTCVAL[RTCVAL]
   112	 * Returns: 0 for success, -EINVAL if @seconds push the counter past the
   113	 *          32bit register range
   114	 */
   115	static int sec_to_rtcval(const struct rtc_priv *priv,
   116				 unsigned long seconds, u32 *rtcval)
   117	{
   118		u32 delta_cnt;
   119	
   120		if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, RTCCNT_MAX_VAL))
   121			return -EINVAL;
   122	
   123		/*
   124		 * RTCCNT is read-only; we must return a value relative to the
   125		 * current value of the counter (and hope we don't linger around
   126		 * too much before we get to enable the interrupt)
   127		 */
   128		delta_cnt = seconds * priv->rtc_hz;
   129		*rtcval = delta_cnt + ioread32(priv->rtc_base + RTCCNT_OFFSET);
   130	
   131		return 0;
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
