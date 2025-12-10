Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679E52FE078;
	Wed, 10 Dec 2025 03:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765336968; cv=none; b=qB6MV3RFqIrEO6ZcR0E6811IZwTdw25GOJtZ5C7iD9quHX5l1gCYohfS2mBu6yWhL4PsOJuoMjug3Vz3vFhgFGCj5iulV/YG/G5QJJCk4xAJhgLK6yfqE8flXPTGiLAkI83T0OkFIlT+hD21ZkBH6jsVxZEgpP6hcRzhXR18t/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765336968; c=relaxed/simple;
	bh=sbK6QaAAL/wmX/O+pHRM7+O7HDJ2oB98YPlC02WA7ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cftYn1tJerBsD/5h5L1fWwZ6Awi4aAStmdMUqVjNJyAFHjmoa1/1XLrIq8SKLRHSfv1qjpbBivmt3qlXcuY5PhLZFPrOPGfZHhyif8FgEf3CjX5ShW21CU33MCKvD6FukOi30+7UhedUcvzXYrSqICLloHRIuHSURcuwZ5Xyaro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFcHSi9r; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFcHSi9r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765336965; x=1796872965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sbK6QaAAL/wmX/O+pHRM7+O7HDJ2oB98YPlC02WA7ZY=;
  b=fFcHSi9rf9LHyb4SfHD4j+h/qmAe8y2nGLhi5fej3AZFRlMpGYINTFBa
   Z6fgRN6mkvEcWtqfO/Zq0DXOcTpCDUssDG52A4rKMeCdwVS2MhmF+3Esw
   SD/B/okPdFKmns9YC/VVAoWpwjjplgAiXSfPsKo+K/UZXyXiQl1s1KWzN
   QSf/vv/uPU8yQltZsh6l7U1saZIFHoX5uUe/AwGHXfgVEEVYOH0WbcSou
   YTUaSmvNGbMLjVNrW3zEPNX4jrjN6Doe5D3P30tbp5KN9NKf9uONdTd72
   FLAg/zZH/5xrYZggvvfdTJgsX+CeL6af0s23q+gUcuwmRPa6Kh5eLqViE
   Q==;
X-CSE-ConnectionGUID: PJH6VfUzTRuMxy8SUn605g==
X-CSE-MsgGUID: +ivWK31EQ9KW8XTidPU5tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="70924159"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="70924159"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 19:22:40 -0800
X-CSE-ConnectionGUID: WYKkJPvESyiVYjKEhqmbCg==
X-CSE-MsgGUID: fLPQvF/0QWWiF2ZdVeX+ig==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Dec 2025 19:22:37 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTAmg-000000002bh-3uju;
	Wed, 10 Dec 2025 03:22:34 +0000
Date: Wed, 10 Dec 2025 11:21:47 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>, ulf.hansson@linaro.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] pmdomain: imx: Fix reference count leak in
 imx_gpc_probe()
Message-ID: <202512101101.zAlerEtu-lkp@intel.com>
References: <20251209081909.24982-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209081909.24982-1-vulab@iscas.ac.cn>

Hi Wentao,

kernel test robot noticed the following build errors:

[auto build test ERROR on shawnguo/for-next]
[also build test ERROR on linus/master v6.18 next-20251209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Liang/pmdomain-imx-Fix-reference-count-leak-in-imx_gpc_probe/20251209-162152
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20251209081909.24982-1-vulab%40iscas.ac.cn
patch subject: [PATCH v2] pmdomain: imx: Fix reference count leak in imx_gpc_probe()
config: arm-randconfig-003-20251210 (https://download.01.org/0day-ci/archive/20251210/202512101101.zAlerEtu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512101101.zAlerEtu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512101101.zAlerEtu-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pmdomain/imx/gpc.c: In function 'imx_gpc_probe':
>> drivers/pmdomain/imx/gpc.c:405:9: error: cleanup argument not a function
     struct device_node *pgc_node __free(pgc_node);
            ^~~~~~~~~~~


vim +405 drivers/pmdomain/imx/gpc.c

   401	
   402	static int imx_gpc_probe(struct platform_device *pdev)
   403	{
   404		const struct imx_gpc_dt_data *of_id_data = device_get_match_data(&pdev->dev);
 > 405		struct device_node *pgc_node __free(pgc_node);
   406		struct regmap *regmap;
   407		void __iomem *base;
   408		int ret;
   409	
   410		pgc_node = of_get_child_by_name(pdev->dev.of_node, "pgc");
   411	
   412		/* bail out if DT too old and doesn't provide the necessary info */
   413		if (!of_property_present(pdev->dev.of_node, "#power-domain-cells") &&
   414		    !pgc_node)
   415			return 0;
   416	
   417		base = devm_platform_ioremap_resource(pdev, 0);
   418		if (IS_ERR(base))
   419			return PTR_ERR(base);
   420	
   421		regmap = devm_regmap_init_mmio_clk(&pdev->dev, NULL, base,
   422						   &imx_gpc_regmap_config);
   423		if (IS_ERR(regmap)) {
   424			ret = PTR_ERR(regmap);
   425			dev_err(&pdev->dev, "failed to init regmap: %d\n",
   426				ret);
   427			return ret;
   428		}
   429	
   430		/*
   431		 * Disable PU power down by runtime PM if ERR009619 is present.
   432		 *
   433		 * The PRE clock will be paused for several cycles when turning on the
   434		 * PU domain LDO from power down state. If PRE is in use at that time,
   435		 * the IPU/PRG cannot get the correct display data from the PRE.
   436		 *
   437		 * This is not a concern when the whole system enters suspend state, so
   438		 * it's safe to power down PU in this case.
   439		 */
   440		if (of_id_data->err009619_present)
   441			imx_gpc_domains[GPC_PGC_DOMAIN_PU].base.flags |=
   442					GENPD_FLAG_RPM_ALWAYS_ON;
   443	
   444		/* Keep DISP always on if ERR006287 is present */
   445		if (of_id_data->err006287_present)
   446			imx_gpc_domains[GPC_PGC_DOMAIN_DISPLAY].base.flags |=
   447					GENPD_FLAG_ALWAYS_ON;
   448	
   449		if (!pgc_node) {
   450			ret = imx_gpc_old_dt_init(&pdev->dev, regmap,
   451						  of_id_data->num_domains);
   452			if (ret)
   453				return ret;
   454		} else {
   455			struct imx_pm_domain *domain;
   456			struct platform_device *pd_pdev;
   457			struct clk *ipg_clk;
   458			unsigned int ipg_rate_mhz;
   459			int domain_index;
   460	
   461			ipg_clk = devm_clk_get(&pdev->dev, "ipg");
   462			if (IS_ERR(ipg_clk))
   463				return PTR_ERR(ipg_clk);
   464			ipg_rate_mhz = clk_get_rate(ipg_clk) / 1000000;
   465	
   466			for_each_child_of_node_scoped(pgc_node, np) {
   467				ret = of_property_read_u32(np, "reg", &domain_index);
   468				if (ret)
   469					return ret;
   470	
   471				if (domain_index >= of_id_data->num_domains)
   472					continue;
   473	
   474				pd_pdev = platform_device_alloc("imx-pgc-power-domain",
   475								domain_index);
   476				if (!pd_pdev)
   477					return -ENOMEM;
   478	
   479				ret = platform_device_add_data(pd_pdev,
   480							       &imx_gpc_domains[domain_index],
   481							       sizeof(imx_gpc_domains[domain_index]));
   482				if (ret) {
   483					platform_device_put(pd_pdev);
   484					return ret;
   485				}
   486				domain = pd_pdev->dev.platform_data;
   487				domain->regmap = regmap;
   488				domain->ipg_rate_mhz = ipg_rate_mhz;
   489	
   490				pd_pdev->dev.parent = &pdev->dev;
   491				pd_pdev->dev.of_node = np;
   492				pd_pdev->dev.fwnode = of_fwnode_handle(np);
   493	
   494				ret = platform_device_add(pd_pdev);
   495				if (ret) {
   496					platform_device_put(pd_pdev);
   497					return ret;
   498				}
   499			}
   500		}
   501	
   502		return 0;
   503	}
   504	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
