Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF042586E8;
	Thu,  4 Dec 2025 04:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764822535; cv=none; b=BIunnWQQ+Eq13+RE7E0Y2JrdLErOLdmH+xZ7axZnDOEoVSqFSCavyhmwk1LZaQJdUe4UuxRkLogUmHVK+sfeuGYpwoxQU/z1aZHNDfdYZyiAqkwsW497L22iGYPenN3vNEnbRYx9wnpJO3naaAzs811ZAGl9HFLBtGJ/l75exLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764822535; c=relaxed/simple;
	bh=fu4Otl1HGi7uqxldCp6FC+mJwbMpk4YSIaDzkvRP9rU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CL+lcHawyl7lXpP2iO2U15fDEFVNgp4yn7ZGe2Cs/Sgz17EYmvSRPMUtcFsh4fEcmidbEe52hTw5s5BeGvmbwedhJ4wxwNC0qfAxESg7yqb3Ra04vnfyyGov10qTKZ0c+/cCm8ckFYlKp5SUhRl198zW/jq450Itb3v6WJApnu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aNF5vYvL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aNF5vYvL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764822534; x=1796358534;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fu4Otl1HGi7uqxldCp6FC+mJwbMpk4YSIaDzkvRP9rU=;
  b=aNF5vYvLDM4bQBNe9ff+Hr4F540rlGWo87OQXvyOuyPuR4N8fBsYCs95
   +Kaa+o2Rr7dH/tkIPV4weABtw1IHgriW1+SxhCN4J+dMGCulRm1F0ES3E
   HK8K+U2XU9KhCQDuwSDR9DjUiJNzzwSMyaT4dGgOQCeHq/UQAC5qQ2Bfm
   GGoNX8Q/HQWameLMN72rdIR2+xeKkOXwLLXIWCpsDChTWhL3DCOHVE5zn
   7t6anu96CK8KLl5X7U6jp+AKJ6hH/tAhCCgWJTzLFeovhXonQbmigOW+L
   5pL2ANXRKeZQSUrW+A/YlOO/HxKkU+wxmekPqYQ2WM22w76+g4fqeD8EN
   w==;
X-CSE-ConnectionGUID: soLMmHfbRKSoGxV3AUY4Wg==
X-CSE-MsgGUID: b2v/Dtn1TvOxdbJqz1G5Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77939820"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="77939820"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 20:28:53 -0800
X-CSE-ConnectionGUID: emaq0chZQvCufN9+C+JBvA==
X-CSE-MsgGUID: 5T152UeURjmuiR2QhfUVmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="199360138"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Dec 2025 20:28:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR0xR-00000000DRN-1pJI;
	Thu, 04 Dec 2025 04:28:45 +0000
Date: Thu, 4 Dec 2025 12:28:05 +0800
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
Subject: Re: [PATCH v20 5/7] firmware: drivers: imx: adds miscdev
Message-ID: <202512041241.yDXC2vpg-lkp@intel.com>
References: <20251203-imx-se-if-v20-5-a04a25c4255f@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-imx-se-if-v20-5-a04a25c4255f@nxp.com>

Hi Pankaj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4a26e7032d7d57c998598c08a034872d6f0d3945]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Gupta/Documentation-firmware-add-imx-se-to-other_interfaces/20251203-145202
base:   4a26e7032d7d57c998598c08a034872d6f0d3945
patch link:    https://lore.kernel.org/r/20251203-imx-se-if-v20-5-a04a25c4255f%40nxp.com
patch subject: [PATCH v20 5/7] firmware: drivers: imx: adds miscdev
config: arm64-randconfig-r132-20251204 (https://download.01.org/0day-ci/archive/20251204/202512041241.yDXC2vpg-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 734a912d0f025559fcf76bde9aaaeb0383c1625a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512041241.yDXC2vpg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512041241.yDXC2vpg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/imx/se_ctrl.c:517:40: sparse: sparse: cast removes address space '__user' of expression
   drivers/firmware/imx/se_ctrl.c:745:48: sparse: sparse: cast removes address space '__user' of expression

vim +/__user +517 drivers/firmware/imx/se_ctrl.c

   491	
   492	static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
   493						    u64 arg)
   494	{
   495		struct se_ioctl_cmd_snd_rcv_rsp_info cmd_snd_rcv_rsp_info = {0};
   496		struct se_api_msg *tx_msg __free(kfree) = NULL;
   497		struct se_api_msg *rx_msg __free(kfree) = NULL;
   498		struct se_if_priv *priv = dev_ctx->priv;
   499		int err = 0;
   500	
   501		if (copy_from_user(&cmd_snd_rcv_rsp_info, (u8 __user *)arg,
   502				   sizeof(cmd_snd_rcv_rsp_info))) {
   503			dev_err(priv->dev,
   504				"%s: Failed to copy cmd_snd_rcv_rsp_info from user.",
   505				dev_ctx->devname);
   506			err = -EFAULT;
   507			goto exit;
   508		}
   509	
   510		if (cmd_snd_rcv_rsp_info.tx_buf_sz < SE_MU_HDR_SZ) {
   511			dev_err(priv->dev, "%s: User buffer too small(%d < %d)",
   512				dev_ctx->devname, cmd_snd_rcv_rsp_info.tx_buf_sz, SE_MU_HDR_SZ);
   513			err = -ENOSPC;
   514			goto exit;
   515		}
   516	
 > 517		err = se_chk_tx_msg_hdr(priv, (struct se_msg_hdr *)cmd_snd_rcv_rsp_info.tx_buf);
   518		if (err)
   519			goto exit;
   520	
   521		rx_msg = kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
   522		if (!rx_msg) {
   523			err = -ENOMEM;
   524			goto exit;
   525		}
   526	
   527		tx_msg = memdup_user(cmd_snd_rcv_rsp_info.tx_buf,
   528				     cmd_snd_rcv_rsp_info.tx_buf_sz);
   529		if (IS_ERR(tx_msg)) {
   530			err = PTR_ERR(tx_msg);
   531			goto exit;
   532		}
   533	
   534		if (tx_msg->header.tag != priv->if_defs->cmd_tag) {
   535			err = -EINVAL;
   536			goto exit;
   537		}
   538	
   539		if (tx_msg->header.ver == priv->if_defs->fw_api_ver &&
   540		    get_load_fw_instance(priv)->is_fw_tobe_loaded) {
   541			err = se_load_firmware(priv);
   542			if (err) {
   543				dev_err(priv->dev, "Could not send msg as FW is not loaded.");
   544				err = -EPERM;
   545				goto exit;
   546			}
   547		}
   548		set_se_rcv_msg_timeout(priv, SE_RCV_MSG_LONG_TIMEOUT);
   549	
   550		err = ele_msg_send_rcv(dev_ctx, tx_msg, cmd_snd_rcv_rsp_info.tx_buf_sz,
   551				       rx_msg, cmd_snd_rcv_rsp_info.rx_buf_sz);
   552		if (err < 0)
   553			goto exit;
   554	
   555		dev_dbg(priv->dev, "%s: %s %s.", dev_ctx->devname, __func__,
   556			"message received, start transmit to user");
   557	
   558		/* We may need to copy the output data to user before
   559		 * delivering the completion message.
   560		 */
   561		err = se_dev_ctx_cpy_out_data(dev_ctx);
   562		if (err < 0)
   563			goto exit;
   564	
   565		/* Copy data from the buffer */
   566		print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4, rx_msg,
   567				     cmd_snd_rcv_rsp_info.rx_buf_sz, false);
   568	
   569		if (copy_to_user(cmd_snd_rcv_rsp_info.rx_buf, rx_msg,
   570				 cmd_snd_rcv_rsp_info.rx_buf_sz)) {
   571			dev_err(priv->dev, "%s: Failed to copy to user.", dev_ctx->devname);
   572			err = -EFAULT;
   573		}
   574	
   575	exit:
   576	
   577		/* shared memory is allocated before this IOCTL */
   578		se_dev_ctx_shared_mem_cleanup(dev_ctx);
   579	
   580		if (copy_to_user((void __user *)arg, &cmd_snd_rcv_rsp_info,
   581				 sizeof(cmd_snd_rcv_rsp_info))) {
   582			dev_err(priv->dev, "%s: Failed to copy cmd_snd_rcv_rsp_info from user.",
   583				dev_ctx->devname);
   584			err = -EFAULT;
   585		}
   586	
   587		return err;
   588	}
   589	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
