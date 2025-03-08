Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E6E219E8
	for <imx@lists.linux.dev>; Sat,  8 Mar 2025 11:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741432618; cv=none; b=VSWHdcm7F3M5noH7V8bdFJ5R9/IwHxJX16cDlfvu7JOqbH0ZPgYx06Vb2gbEDznRsc3uoQWVYlM4qoykRVJRhgL6ZDj7DM0f2HZnq5Shq3oSxf/5rkXQuUzK9fz2cqAzgHGoTRaSQOj+nLOjSNxWLednmKY2KcPu2zT5Jk50c0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741432618; c=relaxed/simple;
	bh=35PK044zhRJSOQiaouAVLe+G/m0iBfFY8Bz1PKym3Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JmXznPmfDzfM3kYv5okX1o4ZMOaWasEI4eDUSzZTc4Dznx9sgEeZ0Sw+dWnTPKcjML0/IOoWKmlnEJ7cDUkksQei9QORMJsSZ1CMCE1KzBGPBtDpH2Mz1LhoGDGyk5C1+aWlSbPqOaumGy8AJHyhQ2+vKpZ/Ns/vZYDxYaRaiaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WfxHDiKK; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WfxHDiKK"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-391342fc1f6so1598193f8f.1
        for <imx@lists.linux.dev>; Sat, 08 Mar 2025 03:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741432615; x=1742037415; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=odTe+QCpdgzS7pZYMqfnj3e7lRiCe9qDfEzk0N/TmTU=;
        b=WfxHDiKKeOkKaXhpD95eBaKzj+88sZNN5BM3BRYVDkJ+LglA0aPM7dCnuEcN0m2lh8
         X9tNnbbaY3DC7pcm7wqaPIjR08nOh857KN4gJST7UWnGwjljCHG+ilPdE4eooFJQfcmR
         KHbmGhdi7N313RCOOlPPn1KYBPmmP/xNR6e7p6D6gQ8unX8ioXRM2hDoYmumC47wvxgr
         SFSaq4oH7YEhrdJcJ4RkoTztUsAFUwIpOt6zCWQodE98jnbvIrARJ4TENofIv8WVO93P
         flhqh43q8oERA1rUYO05dw+O1WkeMOyGpuBOOeYSZKld5bZGUoxgiHdtfjqwt88wGIaW
         XfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741432615; x=1742037415;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odTe+QCpdgzS7pZYMqfnj3e7lRiCe9qDfEzk0N/TmTU=;
        b=sSwRTpH93vfIkpr+Qqot4eO+ROjwEfbZdDhfWvxtrk5kjofrKy2uTArPcBnp0+BDbS
         im8xSyCcXLHJPh6uZg71UehwwYfNtyvUrC50zoZAyvAbY56/xQcW4bE3EaJBECOWFFS1
         KwU45CTIoFM8ILUWBHR1qGWMhN9/o9wvgV8Yvy0oPxc0gvAreCdcaoV9ms/yMdzqQUG9
         RXXA++qAtmxqzau6hEPgGYf1kY+LIkMxt/3sKbq8b+E8DVzWQnRztWdFnx4TSmty8zEI
         vmQDg3//qfgOnG+s5i3/rphEc+D7uu9SvoZr4qG8xfH3w/wG1Hq2PWgRTol/xj2QGu6N
         U3dw==
X-Forwarded-Encrypted: i=1; AJvYcCUIyPIsOPMwEeeTLvt6QGWht8VuyNoZWG3O8f0WLrNA+8sUlzk8KyaZ+qq9V7q4k4Rqta4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4/0Qe/RkDM5wMofKRpJ87nAdwqCdhUQ3lGtC506beSqr1mGVm
	H+s7NHs0ibIAJgH78AiNpD9HOtoGKfZXoQmXpmkBkvR7kOqYE8732ZqC6WqPoc4=
X-Gm-Gg: ASbGncuUX4vT43sEuUu7pPzk82DHGFTiVbMJyG+ZkjVTjuuXa/3NSE5ZHtjD59U8yTs
	3e+uqq7QGikCGGShUmwCCu56bCci1qofJiJWvf5+rekV8PpC6POUy2HQ6xKH5poOqEfmvm3G51u
	qVYC95xWRn7Noq2nM/PQPnemi7gZhI8q/MzgbTg7/8/iseZKWifDorpcAxPlRKT5Vst9yIo2Qsk
	SJQSEdMWPqM7kZAGd0a/QyS+ZCbPHYnU5HdXzHvYq3nuu4XOT0zJDtJ5S5vT9jRjw1S7okb3Wl+
	2W5pEG7FEJ9xSX6Ah0sQNFTLn79g/vdGANS9yQo1tPSbl7mjng==
X-Google-Smtp-Source: AGHT+IES9A/DM5q9+xpQ/azO1/CCZOZDGbLMXDiSNwMFzi323GWfkzfORaMdcK4cgfYh0S+U1GwP6g==
X-Received: by 2002:a05:6000:188d:b0:391:3d12:9afa with SMTP id ffacd0b85a97d-3913d129dffmr1275139f8f.21.1741432614998;
        Sat, 08 Mar 2025 03:16:54 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfb799fsm8396239f8f.2.2025.03.08.03.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 03:16:54 -0800 (PST)
Date: Sat, 8 Mar 2025 14:16:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stanley Chu <yschu@nuvoton.com>
Cc: linux-i3c@lists.infradead.org, imx@lists.linux.dev
Subject: [bug report] i3c: master: svc: Fix npcm845 FIFO empty issue
Message-ID: <029e5ac0-5444-4a8e-bca4-cec55950d2b9@stanley.mountain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Stanley Chu,

Commit 4008a74e0f9b ("i3c: master: svc: Fix npcm845 FIFO empty
issue") from Mar 6, 2025 (linux-next), leads to the following Smatch
static checker warning:

drivers/i3c/master/svc-i3c-master.c:1002 svc_i3c_master_do_daa_locked() warn: error code type promoted to positive: 'dyn_addr'
drivers/i3c/master/svc-i3c-master.c:1085 svc_i3c_master_do_daa_locked() error: uninitialized symbol 'dyn_addr'.

drivers/i3c/master/svc-i3c-master.c
   939  static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
   940                                          u8 *addrs, unsigned int *count)
   941  {
   942          u64 prov_id[SVC_I3C_MAX_DEVS] = {}, nacking_prov_id = 0;
   943          unsigned int dev_nb = 0, last_addr = 0, dyn_addr;
   944          u32 reg;
   945          int ret, i;
   946  
   947          svc_i3c_master_flush_fifo(master);
   948  
   949          while (true) {
   950                  /* clean SVC_I3C_MINT_IBIWON w1c bits */
   951                  writel(SVC_I3C_MINT_IBIWON, master->regs + SVC_I3C_MSTATUS);
   952  
   953                  /* SVC_I3C_MCTRL_REQUEST_PROC_DAA have two mode, ENTER DAA or PROCESS DAA.
   954                   *
   955                   * ENTER DAA:
   956                   *   1 will issue START, 7E, ENTDAA, and then emits 7E/R to process first target.
   957                   *   2 Stops just before the new Dynamic Address (DA) is to be emitted.
   958                   *
   959                   * PROCESS DAA:
   960                   *   1 The DA is written using MWDATAB or ADDR bits 6:0.
   961                   *   2 ProcessDAA is requested again to write the new address, and then starts the
   962                   *     next (START, 7E, ENTDAA)  unless marked to STOP; an MSTATUS indicating NACK
   963                   *     means DA was not accepted (e.g. parity error). If PROCESSDAA is NACKed on the
   964                   *     7E/R, which means no more Slaves need a DA, then a COMPLETE will be signaled
   965                   *     (along with DONE), and a STOP issued automatically.
   966                   */
   967                  writel(SVC_I3C_MCTRL_REQUEST_PROC_DAA |
   968                         SVC_I3C_MCTRL_TYPE_I3C |
   969                         SVC_I3C_MCTRL_IBIRESP_NACK |
   970                         SVC_I3C_MCTRL_DIR(SVC_I3C_MCTRL_DIR_WRITE),
   971                         master->regs + SVC_I3C_MCTRL);
   972  
   973                  /*
   974                   * Either one slave will send its ID, or the assignment process
   975                   * is done.
   976                   */
   977                  ret = readl_poll_timeout_atomic(master->regs + SVC_I3C_MSTATUS,
   978                                                  reg,
   979                                                  SVC_I3C_MSTATUS_RXPEND(reg) |
   980                                                  SVC_I3C_MSTATUS_MCTRLDONE(reg),
   981                                                  1, 1000);
   982                  if (ret)
   983                          break;
   984  
   985                  if (SVC_I3C_MSTATUS_RXPEND(reg)) {
   986                          u8 data[6];
   987  
   988                          /*
   989                           * One slave sends its ID to request for address assignment,
   990                           * prefilling the dynamic address can reduce SCL clock stalls
   991                           * and also fix the SVC_I3C_QUIRK_FIFO_EMPTY quirk.
   992                           *
   993                           * Ideally, prefilling before the processDAA command is better.
   994                           * However, it requires an additional check to write the dyn_addr
   995                           * at the right time because the driver needs to write the processDAA
   996                           * command twice for one assignment.
   997                           * Prefilling here is safe and efficient because the FIFO starts
   998                           * filling within a few hundred nanoseconds, which is significantly
   999                           * faster compared to the 64 SCL clock cycles.
  1000                           */
  1001                          dyn_addr = i3c_master_get_free_addr(&master->base, last_addr + 1);
  1002                          if (dyn_addr < 0)
  1003                                  return -ENOSPC;

dyn_addr is unsigned so it can't be negative.  Also why return -ENOSPC
instead of propagating the error code?


  1004  
  1005                          writel(dyn_addr, master->regs + SVC_I3C_MWDATAB);
  1006  
  1007                          /*
  1008                           * We only care about the 48-bit provisioned ID yet to
  1009                           * be sure a device does not nack an address twice.
  1010                           * Otherwise, we would just need to flush the RX FIFO.
  1011                           */
  1012                          ret = svc_i3c_master_readb(master, data, 6);
  1013                          if (ret)
  1014                                  break;
  1015  
  1016                          for (i = 0; i < 6; i++)
  1017                                  prov_id[dev_nb] |= (u64)(data[i]) << (8 * (5 - i));
  1018  
  1019                          /* We do not care about the BCR and DCR yet */
  1020                          ret = svc_i3c_master_readb(master, data, 2);
  1021                          if (ret)
  1022                                  break;
  1023                  } else if (SVC_I3C_MSTATUS_IBIWON(reg)) {
  1024                          ret = svc_i3c_master_handle_ibi_won(master, reg);
  1025                          if (ret)
  1026                                  break;
  1027                          continue;
  1028                  } else if (SVC_I3C_MSTATUS_MCTRLDONE(reg)) {
  1029                          if (SVC_I3C_MSTATUS_STATE_IDLE(reg) &&
  1030                              SVC_I3C_MSTATUS_COMPLETE(reg)) {
  1031                                  /*
  1032                                   * All devices received and acked they dynamic
  1033                                   * address, this is the natural end of the DAA
  1034                                   * procedure.
  1035                                   *
  1036                                   * Hardware will auto emit STOP at this case.
  1037                                   */
  1038                                  *count = dev_nb;
  1039                                  return 0;
  1040  
  1041                          } else if (SVC_I3C_MSTATUS_NACKED(reg)) {
  1042                                  /* No I3C devices attached */
  1043                                  if (dev_nb == 0) {
  1044                                          /*
  1045                                           * Hardware can't treat first NACK for ENTAA as normal
  1046                                           * COMPLETE. So need manual emit STOP.
  1047                                           */
  1048                                          ret = 0;
  1049                                          *count = 0;
  1050                                          break;
  1051                                  }
  1052  
  1053                                  /*
  1054                                   * A slave device nacked the address, this is
  1055                                   * allowed only once, DAA will be stopped and
  1056                                   * then resumed. The same device is supposed to
  1057                                   * answer again immediately and shall ack the
  1058                                   * address this time.
  1059                                   */
  1060                                  if (prov_id[dev_nb] == nacking_prov_id) {
  1061                                          ret = -EIO;
  1062                                          break;
  1063                                  }
  1064  
  1065                                  dev_nb--;
  1066                                  nacking_prov_id = prov_id[dev_nb];
  1067                                  svc_i3c_master_emit_stop(master);
  1068  
  1069                                  continue;
  1070                          } else {
  1071                                  break;
  1072                          }
  1073                  }

There isn't an else statement here.  dyn_addr could be uninitialized on
else.

  1074  
  1075                  /* Wait for the slave to be ready to receive its address */
  1076                  ret = readl_poll_timeout_atomic(master->regs + SVC_I3C_MSTATUS,
  1077                                                  reg,
  1078                                                  SVC_I3C_MSTATUS_MCTRLDONE(reg) &&
  1079                                                  SVC_I3C_MSTATUS_STATE_DAA(reg) &&
  1080                                                  SVC_I3C_MSTATUS_BETWEEN(reg),
  1081                                                  0, 1000);
  1082                  if (ret)
  1083                          break;
  1084  
  1085                  addrs[dev_nb] = dyn_addr;
                                        ^^^^^^^^

  1086                  dev_dbg(master->dev, "DAA: device %d assigned to 0x%02x\n",
  1086                  dev_dbg(master->dev, "DAA: device %d assigned to 0x%02x\n",
  1087                          dev_nb, addrs[dev_nb]);
  1088                  last_addr = addrs[dev_nb++];
  1089          }
  1090  
  1091          /* Need manual issue STOP except for Complete condition */
  1092          svc_i3c_master_emit_stop(master);
  1093          svc_i3c_master_flush_fifo(master);
  1094  
  1095          return ret;
  1096  }

regards,
dan carpenter
