Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B786B2737E0
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 06:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768804681; cv=none; b=PWmDY/zr6dpHVRWOmmAUK9nKqVfPafvE5mSWP1/Az1JhWJ2ijJO628ASvhwWUIjPRQYUFHtTFKRDETgtCLLqB5BhPn4pZA1Z59BXLVhxLFMS0mEiiy1ScaXzS7qREoU1gp8L4/y6bFB6NPBr1RMiHRNDRn9okKYcYoaZc6SIgA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768804681; c=relaxed/simple;
	bh=VQIElQkHzSoB4CojSAcKrVgZGqKfDuF8onKxP7DS2/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=iOtQf54sSavsVwVzJgxTGmjqnwiu66h9W2ixKf8GLiMnHV+UWDF2ofVSCyGTmRfptWDVBBeGX2+Catgb/3i+k079nuuF0XMgABKrSorKbsue4g7VjLstZCXnk62KqMQE2szr3Sc17axGST1mkbm4o6zyO4FC61i2r7CQkYeaVf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NIGEwW17; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NIGEwW17"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47ee807a4c5so28426775e9.2
        for <imx@lists.linux.dev>; Sun, 18 Jan 2026 22:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768804677; x=1769409477; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CbWcz9mMKDIu3Eeo2pw/1X+znIUuGvzIKZFjWHoDt0Q=;
        b=NIGEwW17t2PsjE0k2UKSb0PfB3WjUq4zLY04vSQ2azWIcSzME1/8RLEcGhG3uh3ewd
         MKKWiXSnZDz5EHO8DT6QA8NCBmLvWqOM5xUh2DcLmQU9Fl4w52ZrCXWycdblL1KYch8V
         ZCYYp65PnuX/oBcYlAS4vzBaMM2Wcni+CTfNm43o16+PMsL3Of30GGdM0MtPZy1EdnTf
         yWwwshnZFvmZdqwIbfun9eqLb7uF045DnbNWmOaU6wys8aQrWgrUV4scvXXCvKzRl0ji
         a94q0CEVm+FceifviQDcWJHSEWbaEftEN6BBysaK6CFrT60aIkESRkih5UTUOsPbe4Hs
         mv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768804677; x=1769409477;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbWcz9mMKDIu3Eeo2pw/1X+znIUuGvzIKZFjWHoDt0Q=;
        b=jSF81023WXDyiZnOxTkaDt33VS4u8xa7R6Ga6Su8SAHMaYXab+1aMwPtqW84Lz2nc1
         0XD3Zyt9zlsxVve3SlsUQbg3Nr1bx7RV3Tj19a+1qrKzvOMxt1TSlIoDe8kOtM2V275A
         2PVlZ8bydG3SUIwKwQj2pwue5Ab6uoaDNg83CTMJkQ/QG7rHytX/MBMkxtDA05GjxCeL
         BBtruzJDS7h4J0q68H+67F0VjYEwRFprVxLSZpmxOU7K8p1Ws011Y1qT5rb0ECNtSAIN
         EuW7mllJVN/c6wehcy+FthpaUjj4eZb6i7SGWmpJDyeNcALP0GuZGkHaPBTCAWFFC/3l
         vCqA==
X-Forwarded-Encrypted: i=1; AJvYcCWRpYVI+tWJ/6rdHXrar4Tpo+NF0cY5KANe/O2qRTq9Irf/ykEM9WRdY528Ix51M7plGkE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwF+93KpzbQzqGzV018CeoMm9fj/dgsDA50XlT1svlrYuYuXaYf
	gB/I8Q2JYmlHZqGbpleCRi8I6vVxLST2ZkSThyzN+FigIn8oxubunfH2KXgV/AO3FGc=
X-Gm-Gg: AY/fxX6CWBk2Dxxtngw7q0BPHy1bLIGA+hAUKYIXaqjKrrNHc2ETyKDJKGIUd5ZFfFv
	7u5t/9g2aP+h0lkM2JIQvC+1eD6H4B9n3nYxkrVjRV0yl8+8UFMQV4YgB6oFEJbQpVTJv3uUldK
	DdeE3cYWUwCgMXbMi9suBdrE7K1IAHH2RaJLVRRnu3n5zo2OpKbk3t/gSrAMiy+pyxHM4ErIQ86
	g+/ZT4qp5j8FYIHdvNiky6yWOUroqM5bOk73ekfjSZQhKmcTyzhmU0sTYl6i7wgKALpVeszxXlt
	+xyHru6VKkWPFIsVzmBPEIZYoDo+GBcjVVwMqRg+/YIgBGEZYRhO1NYfu4g7InQk7Xzz9yX/JP4
	DoG83XfTGQFR43QUNEDhKZ4wYgOv+QeOqEjjFGCsvCghG2rHKhfJrEgkMWJOGzlTido7g1y825X
	ZlnADR3YmV5AF8kiCYF10Jt66UG6Q=
X-Received: by 2002:a05:600c:37c8:b0:47e:e87f:4bba with SMTP id 5b1f17b1804b1-4801eb0e1cfmr109058555e9.29.1768804677011;
        Sun, 18 Jan 2026 22:37:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe6d9a7sm75156405e9.17.2026.01.18.22.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 22:37:56 -0800 (PST)
Date: Mon, 19 Jan 2026 09:37:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Shengjiu Wang <shengjiu.wang@nxp.com>,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] ASoC: fsl_audmix: Add support for i.MX952 platform
Message-ID: <202601170203.upPyGvI2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116101648.377952-3-shengjiu.wang@nxp.com>

Hi Shengjiu,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengjiu-Wang/ASoC-dt-bindings-fsl-audmix-Add-support-for-i-MX952-platform/20260116-182050
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260116101648.377952-3-shengjiu.wang%40nxp.com
patch subject: [PATCH 2/2] ASoC: fsl_audmix: Add support for i.MX952 platform
config: s390-randconfig-r071-20260116 (https://download.01.org/0day-ci/archive/20260117/202601170203.upPyGvI2-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601170203.upPyGvI2-lkp@intel.com/

smatch warnings:
sound/soc/fsl/fsl_audmix.c:522 fsl_audmix_probe() warn: missing error code 'ret'

vim +/ret +522 sound/soc/fsl/fsl_audmix.c

be1df61cf06efb Viorel Suman  2019-01-22  465  static int fsl_audmix_probe(struct platform_device *pdev)
be1df61cf06efb Viorel Suman  2019-01-22  466  {
0c44e9e9e61cde Shengjiu Wang 2026-01-16  467  	const struct fsl_audmix_soc_data *soc_data;
62be484f7ad844 Viorel Suman  2019-04-10  468  	struct device *dev = &pdev->dev;
be1df61cf06efb Viorel Suman  2019-01-22  469  	struct fsl_audmix *priv;
be1df61cf06efb Viorel Suman  2019-01-22  470  	void __iomem *regs;
be1df61cf06efb Viorel Suman  2019-01-22  471  	int ret;
f2a36a78423ee8 Viorel Suman  2019-04-10  472  
62be484f7ad844 Viorel Suman  2019-04-10  473  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
be1df61cf06efb Viorel Suman  2019-01-22  474  	if (!priv)
be1df61cf06efb Viorel Suman  2019-01-22  475  		return -ENOMEM;
be1df61cf06efb Viorel Suman  2019-01-22  476  
be1df61cf06efb Viorel Suman  2019-01-22  477  	/* Get the addresses */
959bb6b54d7086 YueHaibing    2019-07-27  478  	regs = devm_platform_ioremap_resource(pdev, 0);
be1df61cf06efb Viorel Suman  2019-01-22  479  	if (IS_ERR(regs))
be1df61cf06efb Viorel Suman  2019-01-22  480  		return PTR_ERR(regs);
be1df61cf06efb Viorel Suman  2019-01-22  481  
3feaba79d8f701 Shengjiu Wang 2021-03-24  482  	priv->regmap = devm_regmap_init_mmio(dev, regs, &fsl_audmix_regmap_config);
be1df61cf06efb Viorel Suman  2019-01-22  483  	if (IS_ERR(priv->regmap)) {
62be484f7ad844 Viorel Suman  2019-04-10  484  		dev_err(dev, "failed to init regmap\n");
be1df61cf06efb Viorel Suman  2019-01-22  485  		return PTR_ERR(priv->regmap);
be1df61cf06efb Viorel Suman  2019-01-22  486  	}
be1df61cf06efb Viorel Suman  2019-01-22  487  
62be484f7ad844 Viorel Suman  2019-04-10  488  	priv->ipg_clk = devm_clk_get(dev, "ipg");
be1df61cf06efb Viorel Suman  2019-01-22  489  	if (IS_ERR(priv->ipg_clk)) {
62be484f7ad844 Viorel Suman  2019-04-10  490  		dev_err(dev, "failed to get ipg clock\n");
be1df61cf06efb Viorel Suman  2019-01-22  491  		return PTR_ERR(priv->ipg_clk);
be1df61cf06efb Viorel Suman  2019-01-22  492  	}
be1df61cf06efb Viorel Suman  2019-01-22  493  
fe965096c9495d Shengjiu Wang 2019-11-11  494  	spin_lock_init(&priv->lock);
be1df61cf06efb Viorel Suman  2019-01-22  495  	platform_set_drvdata(pdev, priv);
62be484f7ad844 Viorel Suman  2019-04-10  496  	pm_runtime_enable(dev);
be1df61cf06efb Viorel Suman  2019-01-22  497  
62be484f7ad844 Viorel Suman  2019-04-10  498  	ret = devm_snd_soc_register_component(dev, &fsl_audmix_component,
be1df61cf06efb Viorel Suman  2019-01-22  499  					      fsl_audmix_dai,
be1df61cf06efb Viorel Suman  2019-01-22  500  					      ARRAY_SIZE(fsl_audmix_dai));
be1df61cf06efb Viorel Suman  2019-01-22  501  	if (ret) {
62be484f7ad844 Viorel Suman  2019-04-10  502  		dev_err(dev, "failed to register ASoC DAI\n");
77fffa742285f2 Chuhong Yuan  2019-12-03  503  		goto err_disable_pm;
be1df61cf06efb Viorel Suman  2019-01-22  504  	}
be1df61cf06efb Viorel Suman  2019-01-22  505  
294a60e5e98300 Shengjiu Wang 2025-02-26  506  	/*
294a60e5e98300 Shengjiu Wang 2025-02-26  507  	 * If dais property exist, then register the imx-audmix card driver.
294a60e5e98300 Shengjiu Wang 2025-02-26  508  	 * otherwise, it should be linked by audio graph card.
294a60e5e98300 Shengjiu Wang 2025-02-26  509  	 */
294a60e5e98300 Shengjiu Wang 2025-02-26  510  	if (of_find_property(pdev->dev.of_node, "dais", NULL)) {
5057d108d69a55 Fabio Estevam 2020-12-02  511  		priv->pdev = platform_device_register_data(dev, "imx-audmix", 0, NULL, 0);
be1df61cf06efb Viorel Suman  2019-01-22  512  		if (IS_ERR(priv->pdev)) {
be1df61cf06efb Viorel Suman  2019-01-22  513  			ret = PTR_ERR(priv->pdev);
5057d108d69a55 Fabio Estevam 2020-12-02  514  			dev_err(dev, "failed to register platform: %d\n", ret);
77fffa742285f2 Chuhong Yuan  2019-12-03  515  			goto err_disable_pm;
be1df61cf06efb Viorel Suman  2019-01-22  516  		}
294a60e5e98300 Shengjiu Wang 2025-02-26  517  	}
be1df61cf06efb Viorel Suman  2019-01-22  518  
0c44e9e9e61cde Shengjiu Wang 2026-01-16  519  	soc_data = of_device_get_match_data(dev);
0c44e9e9e61cde Shengjiu Wang 2026-01-16  520  	if (!soc_data) {
0c44e9e9e61cde Shengjiu Wang 2026-01-16  521  		dev_err(dev, "failed to match device\n");
0c44e9e9e61cde Shengjiu Wang 2026-01-16 @522  		goto err_disable_pm;

missing error code.

0c44e9e9e61cde Shengjiu Wang 2026-01-16  523  	}
0c44e9e9e61cde Shengjiu Wang 2026-01-16  524  
0c44e9e9e61cde Shengjiu Wang 2026-01-16  525  	if (of_property_read_bool(pdev->dev.of_node, "fsl,amix-bypass") &&
0c44e9e9e61cde Shengjiu Wang 2026-01-16  526  	    soc_data->bypass_index > 0) {
0c44e9e9e61cde Shengjiu Wang 2026-01-16  527  		ret = scmi_imx_misc_ctrl_set(soc_data->bypass_index, 0);
0c44e9e9e61cde Shengjiu Wang 2026-01-16  528  		if (ret)
0c44e9e9e61cde Shengjiu Wang 2026-01-16  529  			goto err_disable_pm;
0c44e9e9e61cde Shengjiu Wang 2026-01-16  530  	}
0c44e9e9e61cde Shengjiu Wang 2026-01-16  531  
77fffa742285f2 Chuhong Yuan  2019-12-03  532  	return 0;
77fffa742285f2 Chuhong Yuan  2019-12-03  533  
77fffa742285f2 Chuhong Yuan  2019-12-03  534  err_disable_pm:
77fffa742285f2 Chuhong Yuan  2019-12-03  535  	pm_runtime_disable(dev);
be1df61cf06efb Viorel Suman  2019-01-22  536  	return ret;
be1df61cf06efb Viorel Suman  2019-01-22  537  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

