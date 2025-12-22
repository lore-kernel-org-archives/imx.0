Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F295F17B43F;
	Mon, 22 Dec 2025 12:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766405481; cv=none; b=j6ei/pTTS4I9gvd/wDlDGONkiT0cT9uiBNY9Sz4nVPiOTAf1YH+GIYC2+2BaaFH+et0bDZEWm2iV4es+j6H8k878+aic+UoVAXFVMhp2MJ11c44b7kLyJd9uOPJzSaqJioPi9xfc4sqbCbRi8Q+skK4mhXiKnnfoYlgaC9RtfkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766405481; c=relaxed/simple;
	bh=qYqS5AOmgZbKh2/+9KAewAbPsoBCxm2V4OOSlP4vuaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/z87TtE/wCjRCmGYBZPz2ZPTU9YFXhirLla6PmkoqeZterttUG6a/almLo7WX5byIMOFXgL/xJvMC42Zd9vGAWsBgNMa60WUIa2Ax4gbQ2W9OAaguw/ENt22FxKTY2JR12j45b0vqDZaxMM+FjYLFZC9gUgdgOHlF5XHiGiCfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUOuym0D; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUOuym0D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766405480; x=1797941480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qYqS5AOmgZbKh2/+9KAewAbPsoBCxm2V4OOSlP4vuaw=;
  b=fUOuym0Dwh+NXydW6rs5CxdZVllT9vhutBUVvaHVUgkz4oTVJLRXeD6B
   SmFlB0j+1h3NgIe+C2DWPn7r9KqHw9r1nHeqnqqgHGSRm1WYD27MmXlns
   N+lQ+sJWSf1SDFL2W002ZhUJm/t2se+1tlNUszzIR2bRQ0ZhMq84B+9wZ
   3kuMx9thRucB5ciCB69j5FxoDoazq1eMb3PZ68jl9QXiH4hRDobjtpgSJ
   Zajv2RPHNCTzEUO5GhIHihC5eT2uWNYTpUiQVcy+a9O3SJYbO6/JIjV3D
   WoZP2vGHoUJfOFqW27oiXEZuRd0tQBRsN2qsSqTPK67Wfxee2z5SNEvxt
   w==;
X-CSE-ConnectionGUID: U9BlpczlSgKKocTE5hJZqA==
X-CSE-MsgGUID: 6fFOah27TU6SWMH1KwZTjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67453699"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="67453699"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 04:11:19 -0800
X-CSE-ConnectionGUID: kph5wOWtQZOOe3dIXRQTUw==
X-CSE-MsgGUID: 4LdxMEzZR06DSIP2Qn1fpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="199270460"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 22 Dec 2025 04:11:16 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXekr-000000000Uf-0nOg;
	Mon, 22 Dec 2025 12:11:13 +0000
Date: Mon, 22 Dec 2025 20:11:06 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v23 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Message-ID: <202512222045.Ldg7WTWR-lkp@intel.com>
References: <20251219-imx-se-if-v23-3-5c6773d00318@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-imx-se-if-v23-3-5c6773d00318@nxp.com>

Hi Pankaj,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4a26e7032d7d57c998598c08a034872d6f0d3945]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Gupta/Documentation-firmware-add-imx-se-to-other_interfaces/20251219-132830
base:   4a26e7032d7d57c998598c08a034872d6f0d3945
patch link:    https://lore.kernel.org/r/20251219-imx-se-if-v23-3-5c6773d00318%40nxp.com
patch subject: [PATCH v23 3/7] firmware: imx: add driver for NXP EdgeLock Enclave
config: arm-randconfig-r054-20251222 (https://download.01.org/0day-ci/archive/20251222/202512222045.Ldg7WTWR-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512222045.Ldg7WTWR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512222045.Ldg7WTWR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/imx/se_ctrl.c:343:9: error: incompatible pointer types passing 'phys_addr_t *' (aka 'unsigned int *') to parameter of type 'dma_addr_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
     343 |                                                                 &load_fw->imem.phyaddr,
         |                                                                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:707:15: note: passing argument to parameter 'dma_handle' here
     707 |                 dma_addr_t *dma_handle, gfp_t gfp)
         |                             ^
   1 error generated.


vim +343 drivers/firmware/imx/se_ctrl.c

   266	
   267	static int se_if_probe(struct platform_device *pdev)
   268	{
   269		const struct se_soc_info *se_info;
   270		const struct se_if_node *if_node;
   271		struct se_fw_load_info *load_fw;
   272		struct device *dev = &pdev->dev;
   273		struct se_if_priv *priv;
   274		int ret;
   275	
   276		if_node = device_get_match_data(dev);
   277		if (!if_node)
   278			return -EINVAL;
   279	
   280		se_info = if_node->se_info;
   281	
   282		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   283		if (!priv)
   284			return -ENOMEM;
   285	
   286		priv->dev = dev;
   287		priv->if_defs = &if_node->if_defs;
   288		dev_set_drvdata(dev, priv);
   289	
   290		ret = devm_add_action_or_reset(dev, se_if_probe_cleanup, pdev);
   291		if (ret)
   292			return ret;
   293	
   294		/* Mailbox client configuration */
   295		priv->se_mb_cl.dev		= dev;
   296		priv->se_mb_cl.tx_block		= false;
   297		priv->se_mb_cl.knows_txdone	= true;
   298		priv->se_mb_cl.rx_callback	= se_if_rx_callback;
   299	
   300		ret = se_if_request_channel(dev, &priv->tx_chan, &priv->se_mb_cl, MBOX_TX_NAME);
   301		if (ret)
   302			return ret;
   303	
   304		ret = se_if_request_channel(dev, &priv->rx_chan, &priv->se_mb_cl, MBOX_RX_NAME);
   305		if (ret)
   306			return ret;
   307	
   308		mutex_init(&priv->se_if_cmd_lock);
   309	
   310		init_completion(&priv->waiting_rsp_clbk_hdl.done);
   311		init_completion(&priv->cmd_receiver_clbk_hdl.done);
   312	
   313		if (if_node->pool_name) {
   314			priv->mem_pool = of_gen_pool_get(dev->of_node, if_node->pool_name, 0);
   315			if (!priv->mem_pool)
   316				return dev_err_probe(dev, -ENOMEM,
   317						     "Unable to get sram pool = %s.",
   318						     if_node->pool_name);
   319		}
   320	
   321		if (if_node->reserved_dma_ranges) {
   322			ret = of_reserved_mem_device_init(dev);
   323			if (ret)
   324				return dev_err_probe(dev, ret,
   325						    "Failed to init reserved memory region.");
   326		}
   327	
   328		if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
   329			ret = get_se_soc_info(priv, se_info);
   330			if (ret)
   331				return dev_err_probe(dev, ret, "Failed to fetch SoC Info.");
   332		}
   333	
   334		/* By default, there is no pending FW to be loaded.*/
   335		if (se_info->se_fw_img_nm.seco_fw_nm_in_rfs) {
   336			load_fw = get_load_fw_instance(priv);
   337			load_fw->se_fw_img_nm = &se_info->se_fw_img_nm;
   338			load_fw->is_fw_tobe_loaded = true;
   339	
   340			if (load_fw->se_fw_img_nm->prim_fw_nm_in_rfs) {
   341				/* allocate buffer where SE store encrypted IMEM */
   342				load_fw->imem.buf = dmam_alloc_coherent(priv->dev, ELE_IMEM_SIZE,
 > 343									&load_fw->imem.phyaddr,
   344									GFP_KERNEL);
   345				if (!load_fw->imem.buf)
   346					return dev_err_probe(dev, -ENOMEM,
   347							     "dmam-alloc-failed: To store encr-IMEM.");
   348				load_fw->imem_mgmt = true;
   349			}
   350		}
   351		dev_info(dev, "i.MX secure-enclave: %s0 interface to firmware, configured.",
   352			 get_se_if_name(priv->if_defs->se_if_type));
   353	
   354		return ret;
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
