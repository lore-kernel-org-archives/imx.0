Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B732E7391;
	Fri, 29 May 2026 04:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780029643; cv=none; b=LUAnR7dUGQ/H5ZkBJ2C5WI4qmpqf4uTrDCGGn17WTK0W5/NryNwMgQNPRrmJ5LeZZK1kXmFEf/bDv86PcX+536Ct5X+BmChNnBFiuQVP+VscFTs80T4RgTA2SK53aGsGM2PPAnkRvltdICtpNweG5cNRptQj8wr982u7QsG15dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780029643; c=relaxed/simple;
	bh=rBMM6X8A/PFcOJEVlKnW82fg6ov8GtuamsqALNG/gAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b6KCP54I0y7kOyrsh/HJIhFAtTziyTPf+dyltyeZeDTy1yfB5vjyfeXoaJSKN38z2SjuOKiiF+68A6LmvBBo0qVkjo9zA6uE8cAe7xCDPUe2yWCSdsWNhlLYBAk0/bfc1ywu/bE0x2eUeZrQhRm469TnZJRHPCzbpz/Q1hYtJTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYpjqum4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYpjqum4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780029642; x=1811565642;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rBMM6X8A/PFcOJEVlKnW82fg6ov8GtuamsqALNG/gAg=;
  b=fYpjqum4LStq/3IDf+efjo6Uc0HY36lzQRGh5XmQPswtD9Rb2ttQZ616
   Wbv/d2gnmLMaGlO5X9Kzs4+HcVU8Ed2pCKRozXsQjn3VZ6NPAdgKVvQnF
   rXAfcQkyYQZNa+3jjHXczz0gNQ4hlXTvR71fcyjlQv/w7up7hjbszVqwz
   0BSHGDi2F1RjbPSYBIlz0urXPYoFas7rxeMnIraQUNasUIBjeq0Iw5F/4
   fWME9HvkBHSJu/7aYWnwwyOKhgSusF9xP/HzA6B2BQ/RP6hultBlll/sN
   eRAaihY35nnu+ztuAb2ENHRHLMjYgYI5ICNivhi3jLUFV0giEAjgE+V6Q
   A==;
X-CSE-ConnectionGUID: dtGOv6qLQxylsM5JoTA7lA==
X-CSE-MsgGUID: tUCTSAOBRiq50P9TpQ6Ejg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80939756"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="80939756"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 21:40:41 -0700
X-CSE-ConnectionGUID: cWE2aSUJS1+uC/FGOLesOg==
X-CSE-MsgGUID: 6awdJtHgR5GH4dlhTTl3qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="238558658"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 May 2026 21:40:39 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSp1R-000000006lq-13rC;
	Fri, 29 May 2026 04:40:37 +0000
Date: Fri, 29 May 2026 12:40:04 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, imx@lists.linux.dev, frank.li@nxp.com,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH -next] firmware: imx: se_ctrl: serialize command receiver
 registration
Message-ID: <202605291211.iAxyywQe-lkp@intel.com>
References: <20260528091634.3331090-1-pankaj.gupta@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528091634.3331090-1-pankaj.gupta@nxp.com>

Hi Pankaj,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260527]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Gupta/firmware-imx-se_ctrl-serialize-command-receiver-registration/20260528-172942
base:   next-20260527
patch link:    https://lore.kernel.org/r/20260528091634.3331090-1-pankaj.gupta%40nxp.com
patch subject: [PATCH -next] firmware: imx: se_ctrl: serialize command receiver registration
config: s390-randconfig-r121-20260529 (https://download.01.org/0day-ci/archive/20260529/202605291211.iAxyywQe-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291211.iAxyywQe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605291211.iAxyywQe-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/imx/se_ctrl.c: In function 'se_ioctl':
>> drivers/firmware/imx/se_ctrl.c:933:1: error: label at end of compound statement
    out_enable_cmd_rcv:
    ^~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [m]:
   - PINCTRL_STMFX [=m] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


vim +933 drivers/firmware/imx/se_ctrl.c

   905	
   906	/* IOCTL entry point of a character device */
   907	static long se_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
   908	{
   909		struct se_if_device_ctx *dev_ctx = fp->private_data;
   910		struct se_if_priv *priv = dev_ctx->priv;
   911		void __user *uarg = (void __user *)arg;
   912		long err;
   913	
   914		/* Prevent race during change of device context */
   915		scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
   916			switch (cmd) {
   917			case SE_IOCTL_ENABLE_CMD_RCV:
   918				scoped_guard(mutex, &priv->priv_dev_ctx->fops_lock) {
   919					if (priv->cmd_receiver_clbk_hdl.dev_ctx) {
   920						err = -EBUSY;
   921						goto out_enable_cmd_rcv;
   922					}
   923					priv->cmd_receiver_clbk_hdl.rx_msg =
   924									kzalloc(MAX_NVM_MSG_LEN,
   925										GFP_KERNEL);
   926					if (!priv->cmd_receiver_clbk_hdl.rx_msg) {
   927						err = -ENOMEM;
   928						goto out_enable_cmd_rcv;
   929					}
   930					priv->cmd_receiver_clbk_hdl.rx_msg_sz = MAX_NVM_MSG_LEN;
   931					priv->cmd_receiver_clbk_hdl.dev_ctx = dev_ctx;
   932					err = 0;
 > 933	out_enable_cmd_rcv:
   934				}
   935				break;
   936			case SE_IOCTL_GET_MU_INFO:
   937				err = se_ioctl_get_mu_info(dev_ctx, uarg);
   938				break;
   939			case SE_IOCTL_SETUP_IOBUF:
   940				err = se_ioctl_setup_iobuf_handler(dev_ctx, uarg);
   941				break;
   942			case SE_IOCTL_GET_SOC_INFO:
   943				err = se_ioctl_get_se_soc_info_handler(dev_ctx, uarg);
   944				break;
   945			case SE_IOCTL_CMD_SEND_RCV_RSP:
   946				err = se_ioctl_cmd_snd_rcv_rsp_handler(dev_ctx, uarg);
   947				break;
   948			default:
   949				err = -EINVAL;
   950				dev_dbg(priv->dev, "%s: IOCTL %.8x not supported.",
   951					dev_ctx->devname, cmd);
   952			}
   953		}
   954	
   955		return err;
   956	}
   957	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
