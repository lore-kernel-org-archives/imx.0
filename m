Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8D61AC44D;
	Sat, 13 Dec 2025 00:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765586812; cv=none; b=Dhd8uMW8xas1VBFOhK3TR0T3nqTiuCF/rycxgTpwClzzZALSPas+hP1hz6MMUtsYyuSqvKisX11ZCY8ZlfPrMKTJWzFS/ajBapG2f0uw8mSNb6S3LyCdX2kthF8AjZMtYcp41jWlMmLy/Us440usLQoHVzVpSLUkzpN4hAhwiCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765586812; c=relaxed/simple;
	bh=wV3WXJc3+d6bM49wEkpG/NLZBLxgviHc0aQEcd+t/4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glGdAhQJU5Y/8LDPwLjKnDMeBkvFLeysbIef2QxQKv51q/oTQ+o/GkBfB+C+r8mOqFMPGn4JCMTvwzebeJzqDFQKGf6PX9UfYI/Gh4gxOiTFlwIv88sWsBLXpyZFrnP4BsEfkgA4NZXuJxS804Z+HEqpq9bDQ8bucReuipOyAVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mKDSKc4T; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mKDSKc4T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765586811; x=1797122811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wV3WXJc3+d6bM49wEkpG/NLZBLxgviHc0aQEcd+t/4g=;
  b=mKDSKc4TPS3uLrqGkwRCx9es19uUlk+nspRmMPqWINdksHj5Er8XgyZl
   js4tJ0pb6Zfi13P7a50xUx8CWlUIddOvnOG8gcwzytjHxF3JZpZQwrPSZ
   uLnw+mkw/soB8/GiDZaxqH9q/vuUIAGhaKebdTVcUeK/oogQBapJ1EY4h
   eFdYnBwqfDh6sIMrRc986nrWmR+yVtg5fnXVEhjidighQXaaIW6OgSzKh
   eSuZJg020BeJF3zcWdU+8UwUPhq2U7/A4xKjXNz2MvmU+YjT/j6WkXtsw
   WLVlQzmKNK9XWh/avcZY8Dw86ssWGsV0o2c4bURGhl5rT/LMP9cribF/k
   g==;
X-CSE-ConnectionGUID: qSPmDRScS2ONAYW85qlgYQ==
X-CSE-MsgGUID: +6pcyqqdSza7yOLHB1s4tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="79048680"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="79048680"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 16:46:50 -0800
X-CSE-ConnectionGUID: tt3I3KZqSZuuahiBnNcB8g==
X-CSE-MsgGUID: 9yZwtd6JR9GAv8YStBIaOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="227880562"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Dec 2025 16:46:44 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUDmU-000000006rB-2NaC;
	Sat, 13 Dec 2025 00:46:42 +0000
Date: Sat, 13 Dec 2025 08:45:52 +0800
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
Subject: Re: [PATCH v21 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Message-ID: <202512130836.yv66kq5e-lkp@intel.com>
References: <20251212-imx-se-if-v21-3-ee7d6052d848@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-imx-se-if-v21-3-ee7d6052d848@nxp.com>

Hi Pankaj,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4a26e7032d7d57c998598c08a034872d6f0d3945]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Gupta/Documentation-firmware-add-imx-se-to-other_interfaces/20251212-172535
base:   4a26e7032d7d57c998598c08a034872d6f0d3945
patch link:    https://lore.kernel.org/r/20251212-imx-se-if-v21-3-ee7d6052d848%40nxp.com
patch subject: [PATCH v21 3/7] firmware: imx: add driver for NXP EdgeLock Enclave
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20251213/202512130836.yv66kq5e-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130836.yv66kq5e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130836.yv66kq5e-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/firmware/imx/se_ctrl.c: In function 'get_se_soc_info':
>> drivers/firmware/imx/se_ctrl.c:168:13: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     168 |         if (FIELD_GET(DEV_GETINFO_MIN_VER_MASK, var_se_info.soc_rev))
         |             ^~~~~~~~~
   drivers/firmware/imx/se_ctrl.c: At top level:
   drivers/firmware/imx/se_ctrl.c:374:12: warning: 'se_resume' defined but not used [-Wunused-function]
     374 | static int se_resume(struct device *dev)
         |            ^~~~~~~~~
>> drivers/firmware/imx/se_ctrl.c:357:12: warning: 'se_suspend' defined but not used [-Wunused-function]
     357 | static int se_suspend(struct device *dev)
         |            ^~~~~~~~~~
--
   In file included from drivers/firmware/imx/ele_base_msg.h:14,
                    from drivers/firmware/imx/ele_common.c:6:
   drivers/firmware/imx/ele_common.c: In function 'se_val_rsp_hdr_n_status':
>> drivers/firmware/imx/se_ctrl.h:16:41: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
      16 | #define RES_STATUS(x)                   FIELD_GET(0x000000ff, x)
         |                                         ^~~~~~~~~
   drivers/firmware/imx/ele_common.c:241:18: note: in expansion of macro 'RES_STATUS'
     241 |         status = RES_STATUS(msg->data[0]);
         |                  ^~~~~~~~~~
--
   drivers/firmware/imx/ele_base_msg.c: In function 'ele_get_info':
>> drivers/firmware/imx/ele_base_msg.c:77:47: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      77 |                 gen_pool_free(priv->mem_pool, (u64)get_info_data,
         |                                               ^


vim +/FIELD_GET +168 drivers/firmware/imx/se_ctrl.c

   137	
   138	static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se_info)
   139	{
   140		struct se_fw_load_info *load_fw = get_load_fw_instance(priv);
   141		struct soc_device_attribute *attr;
   142		u8 data[MAX_SOC_INFO_DATA_SZ];
   143		struct ele_dev_info *s_info;
   144		struct soc_device *sdev;
   145		int err = 0;
   146	
   147		/*
   148		 * This function should be called once.
   149		 * Check if the se_soc_rev is zero to continue.
   150		 */
   151		if (var_se_info.soc_rev)
   152			return err;
   153	
   154		err = ele_fetch_soc_info(priv, &data);
   155		if (err < 0)
   156			return dev_err_probe(priv->dev, err, "Failed to fetch SoC Info.");
   157		s_info = (void *)data;
   158		var_se_info.soc_rev = s_info->d_info.soc_rev;
   159		load_fw->imem.state = s_info->d_addn_info.imem_state;
   160	
   161		if (!se_info->soc_register)
   162			return 0;
   163	
   164		attr = devm_kzalloc(priv->dev, sizeof(*attr), GFP_KERNEL);
   165		if (!attr)
   166			return -ENOMEM;
   167	
 > 168		if (FIELD_GET(DEV_GETINFO_MIN_VER_MASK, var_se_info.soc_rev))
   169			attr->revision = devm_kasprintf(priv->dev, GFP_KERNEL, "%x.%x",
   170							FIELD_GET(DEV_GETINFO_MIN_VER_MASK,
   171								  var_se_info.soc_rev),
   172							FIELD_GET(DEV_GETINFO_MAJ_VER_MASK,
   173								  var_se_info.soc_rev));
   174		else
   175			attr->revision = devm_kasprintf(priv->dev, GFP_KERNEL, "%x",
   176							FIELD_GET(DEV_GETINFO_MAJ_VER_MASK,
   177								  var_se_info.soc_rev));
   178	
   179		switch (se_info->soc_id) {
   180		case SOC_ID_OF_IMX8ULP:
   181			attr->soc_id = "i.MX8ULP";
   182			break;
   183		case SOC_ID_OF_IMX93:
   184			attr->soc_id = "i.MX93";
   185			break;
   186		}
   187	
   188		err = of_property_read_string(of_root, "model", &attr->machine);
   189		if (err)
   190			return -EINVAL;
   191	
   192		attr->family = "Freescale i.MX";
   193	
   194		attr->serial_number = devm_kasprintf(priv->dev,
   195						     GFP_KERNEL, "%016llX",
   196						     GET_SERIAL_NUM_FROM_UID(s_info->d_info.uid,
   197									     MAX_UID_SIZE >> 2));
   198	
   199		sdev = soc_device_register(attr);
   200		if (IS_ERR(sdev))
   201			return PTR_ERR(sdev);
   202	
   203		return 0;
   204	}
   205	
   206	/* interface for managed res to free a mailbox channel */
   207	static void if_mbox_free_channel(void *mbox_chan)
   208	{
   209		mbox_free_channel(mbox_chan);
   210	}
   211	
   212	static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
   213					 struct mbox_client *cl, const char *name)
   214	{
   215		struct mbox_chan *t_chan;
   216		int ret = 0;
   217	
   218		t_chan = mbox_request_channel_byname(cl, name);
   219		if (IS_ERR(t_chan))
   220			return dev_err_probe(dev, PTR_ERR(t_chan),
   221					     "Failed to request %s channel.", name);
   222	
   223		ret = devm_add_action_or_reset(dev, if_mbox_free_channel, t_chan);
   224		if (ret)
   225			return dev_err_probe(dev, -EPERM,
   226					     "Failed to add-action for removal of mbox: %s\n",
   227					     name);
   228		*chan = t_chan;
   229	
   230		return ret;
   231	}
   232	
   233	static void se_if_probe_cleanup(void *plat_dev)
   234	{
   235		struct platform_device *pdev = plat_dev;
   236		struct se_fw_load_info *load_fw;
   237		struct device *dev = &pdev->dev;
   238		struct se_if_priv *priv;
   239	
   240		priv = dev_get_drvdata(dev);
   241		load_fw = get_load_fw_instance(priv);
   242	
   243		/*
   244		 * In se_if_request_channel(), passed the clean-up functional
   245		 * pointer reference as action to devm_add_action_or_reset().
   246		 * No need to free the mbox channels here.
   247		 */
   248	
   249		/*
   250		 * free the buffer in se remove, previously allocated
   251		 * in se probe to store encrypted IMEM
   252		 */
   253		if (load_fw && load_fw->imem.buf) {
   254			dmam_free_coherent(dev, ELE_IMEM_SIZE, load_fw->imem.buf,
   255					   load_fw->imem.phyaddr);
   256			load_fw->imem.buf = NULL;
   257		}
   258	
   259		/*
   260		 * No need to check, if reserved memory is allocated
   261		 * before calling for its release. Or clearing the
   262		 * un-set bit.
   263		 */
   264		of_reserved_mem_device_release(dev);
   265	}
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
   343									&load_fw->imem.phyaddr,
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
 > 357	static int se_suspend(struct device *dev)
   358	{
   359		struct se_if_priv *priv = dev_get_drvdata(dev);
   360		struct se_fw_load_info *load_fw;
   361		int ret = 0;
   362	
   363		load_fw = get_load_fw_instance(priv);
   364	
   365		if (load_fw->imem_mgmt) {
   366			ret = se_save_imem_state(priv, &load_fw->imem);
   367			if (ret)
   368				dev_err(dev, "Failure saving IMEM state[0x%x]", ret);
   369		}
   370	
   371		return 0;
   372	}
   373	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
