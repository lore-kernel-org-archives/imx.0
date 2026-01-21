Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31540322B77;
	Wed, 21 Jan 2026 19:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769023026; cv=none; b=pcIfDRL3UK4/1Cl//BFmybzYpm8We3nOFXtXdwH9CNUqaLtiQgZZWJifKjIdqyFUwZ0d+HCdNT1kDwzS3P5oiRt3uu061U+jnx6qOunKp8ljk211x141x2oK61HGmlEdkc+iz1Yw7GEWWBaF02OpCxoTB0w00kgtZrxxFtN1K6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769023026; c=relaxed/simple;
	bh=WKT4K2OWmXphrsrK+FZH1Be2GwH/CcJ9u3AFpmT0jUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLIt/DtAU0Zfz4yur72JN0W1HRR9UWSDR5Ca5E1MFjl/Lyh2qf1kcO7selklxlc5gR6VzUQnSn7Q2ZCGyHQLD/qcg0dXQ0IHXRcSBIHnUYqNaDcDzjfyyE2RXzIftA14nvvc5uYW9Fr7OAOYtkb6BKI4G+TlYHhsGDdPbmsBVrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S7vgo0dO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7vgo0dO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769023024; x=1800559024;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WKT4K2OWmXphrsrK+FZH1Be2GwH/CcJ9u3AFpmT0jUc=;
  b=S7vgo0dOM4IOJB0wGE6TAsDGsvJMY4WIGGOaKsi8cOh6s/h0bHMxOo0w
   lGgq3byDl/N0atmKCDR2Ckgw8ETSpZTqoeiBvGmP6auDvzM/8u77MUT1h
   LNrf1jUQUydniLoJH5mpkARVyviyHKlB9lDd+yitKLb+2dkkRVIi14NbG
   5Z5AFeTQNm5nPHYTHxGfo73YkIfKODWx9aW2y1PFE+j5WreqMNYAZwZkm
   MI1LekXXiQr5sZ7Tzpjq3Oy8PwV2nqEsQUT/GR35dToYG4tsBMRt8X8q4
   PnrQHlapxbHVTe4sS172EAktqKajVV1ww6BIvyQBxSuQHMjB1v7aCExuC
   A==;
X-CSE-ConnectionGUID: JsFRGpVOQxWRIlyr4+7baA==
X-CSE-MsgGUID: IWvLvs9jSiOWSN/Y9++iZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70425234"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70425234"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 11:17:04 -0800
X-CSE-ConnectionGUID: Sl+Ls0l+QDGO8dgpVVM22g==
X-CSE-MsgGUID: lCBgPaCASaOclwJwG4zQLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="211550219"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Jan 2026 11:16:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vidhI-00000000RgL-3W1o;
	Wed, 21 Jan 2026 19:16:56 +0000
Date: Thu, 22 Jan 2026 03:16:16 +0800
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
Subject: Re: [PATCH v24 5/7] firmware: drivers: imx: adds miscdev
Message-ID: <202601220225.eSj782As-lkp@intel.com>
References: <20260121-imx-se-if-v24-5-c5222df51cc2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-imx-se-if-v24-5-c5222df51cc2@nxp.com>

Hi Pankaj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6c790212c588fddeb0d852f2790840753bb604b1]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Gupta/Documentation-firmware-add-imx-se-to-other_interfaces/20260121-171044
base:   6c790212c588fddeb0d852f2790840753bb604b1
patch link:    https://lore.kernel.org/r/20260121-imx-se-if-v24-5-c5222df51cc2%40nxp.com
patch subject: [PATCH v24 5/7] firmware: drivers: imx: adds miscdev
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260122/202601220225.eSj782As-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220225.eSj782As-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601220225.eSj782As-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/imx/se_ctrl.c: In function 'se_ioctl_cmd_snd_rcv_rsp_handler':
>> drivers/firmware/imx/se_ctrl.c:504:51: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     504 |         if (copy_from_user(&cmd_snd_rcv_rsp_info, (u8 __user *)arg,
         |                                                   ^
   drivers/firmware/imx/se_ctrl.c:585:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     585 |         if (copy_to_user((void __user *)arg, &cmd_snd_rcv_rsp_info,
         |                          ^
   drivers/firmware/imx/se_ctrl.c: In function 'se_ioctl_get_mu_info':
   drivers/firmware/imx/se_ctrl.c:619:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     619 |         if (copy_to_user((u8 __user *)arg, &if_info, sizeof(if_info))) {
         |                          ^
   drivers/firmware/imx/se_ctrl.c: In function 'se_ioctl_setup_iobuf_handler':
   drivers/firmware/imx/se_ctrl.c:640:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     640 |         if (copy_from_user(&io, (u8 __user *)arg, sizeof(io))) {
         |                                 ^
   drivers/firmware/imx/se_ctrl.c:702:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     702 |         if (copy_to_user((u8 __user *)arg, &io, sizeof(io))) {
         |                          ^
   drivers/firmware/imx/se_ctrl.c: In function 'se_ioctl_get_se_soc_info_handler':
   drivers/firmware/imx/se_ctrl.c:720:28: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     720 |         err = copy_to_user((u8 __user *)arg, (u8 *)(&soc_info), sizeof(soc_info));
         |                            ^


vim +504 drivers/firmware/imx/se_ctrl.c

   496	
   497	static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
   498						    u64 arg)
   499	{
   500		struct se_ioctl_cmd_snd_rcv_rsp_info cmd_snd_rcv_rsp_info = {0};
   501		struct se_if_priv *priv = dev_ctx->priv;
   502		int err = 0;
   503	
 > 504		if (copy_from_user(&cmd_snd_rcv_rsp_info, (u8 __user *)arg,
   505				   sizeof(cmd_snd_rcv_rsp_info))) {
   506			dev_err(priv->dev,
   507				"%s: Failed to copy cmd_snd_rcv_rsp_info from user.",
   508				dev_ctx->devname);
   509			err = -EFAULT;
   510			goto exit;
   511		}
   512	
   513		if (cmd_snd_rcv_rsp_info.tx_buf_sz < SE_MU_HDR_SZ) {
   514			dev_err(priv->dev, "%s: User buffer too small(%d < %d)",
   515				dev_ctx->devname, cmd_snd_rcv_rsp_info.tx_buf_sz, SE_MU_HDR_SZ);
   516			err = -ENOSPC;
   517			goto exit;
   518		}
   519	
   520		err = se_chk_tx_msg_hdr(priv, (struct se_msg_hdr *)cmd_snd_rcv_rsp_info.tx_buf);
   521		if (err)
   522			goto exit;
   523	
   524		struct se_api_msg *rx_msg __free(kfree) =
   525			kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
   526		if (!rx_msg) {
   527			err = -ENOMEM;
   528			goto exit;
   529		}
   530	
   531		struct se_api_msg *tx_msg __free(kfree) =
   532			memdup_user(cmd_snd_rcv_rsp_info.tx_buf,
   533				    cmd_snd_rcv_rsp_info.tx_buf_sz);
   534		if (IS_ERR(tx_msg)) {
   535			err = PTR_ERR(tx_msg);
   536			goto exit;
   537		}
   538	
   539		if (tx_msg->header.tag != priv->if_defs->cmd_tag) {
   540			err = -EINVAL;
   541			goto exit;
   542		}
   543	
   544		if (tx_msg->header.ver == priv->if_defs->fw_api_ver &&
   545		    get_load_fw_instance(priv)->is_fw_tobe_loaded) {
   546			err = se_load_firmware(priv);
   547			if (err) {
   548				dev_err(priv->dev, "Could not send msg as FW is not loaded.");
   549				err = -EPERM;
   550				goto exit;
   551			}
   552		}
   553		set_se_rcv_msg_timeout(priv, SE_RCV_MSG_LONG_TIMEOUT);
   554	
   555		err = ele_msg_send_rcv(dev_ctx, tx_msg, cmd_snd_rcv_rsp_info.tx_buf_sz,
   556				       rx_msg, cmd_snd_rcv_rsp_info.rx_buf_sz);
   557		if (err < 0)
   558			goto exit;
   559	
   560		dev_dbg(priv->dev, "%s: %s %s.", dev_ctx->devname, __func__,
   561			"message received, start transmit to user");
   562	
   563		/* We may need to copy the output data to user before
   564		 * delivering the completion message.
   565		 */
   566		err = se_dev_ctx_cpy_out_data(dev_ctx);
   567		if (err < 0)
   568			goto exit;
   569	
   570		/* Copy data from the buffer */
   571		print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4, rx_msg,
   572				     cmd_snd_rcv_rsp_info.rx_buf_sz, false);
   573	
   574		if (copy_to_user(cmd_snd_rcv_rsp_info.rx_buf, rx_msg,
   575				 cmd_snd_rcv_rsp_info.rx_buf_sz)) {
   576			dev_err(priv->dev, "%s: Failed to copy to user.", dev_ctx->devname);
   577			err = -EFAULT;
   578		}
   579	
   580	exit:
   581	
   582		/* shared memory is allocated before this IOCTL */
   583		se_dev_ctx_shared_mem_cleanup(dev_ctx);
   584	
   585		if (copy_to_user((void __user *)arg, &cmd_snd_rcv_rsp_info,
   586				 sizeof(cmd_snd_rcv_rsp_info))) {
   587			dev_err(priv->dev, "%s: Failed to copy cmd_snd_rcv_rsp_info from user.",
   588				dev_ctx->devname);
   589			err = -EFAULT;
   590		}
   591	
   592		return err;
   593	}
   594	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
