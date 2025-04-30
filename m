Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3876E218AB9
	for <imx@lists.linux.dev>; Wed, 30 Apr 2025 09:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004556; cv=none; b=MWHU6SS+c8oMImgE+rPpn4uQRUDfp5NdDXHm+bf77H+QwT4UZYRUcxLlbHfznx2Sr1U3e5W5bcSThAfwfa4GbMvVeB644bAay9kR4lv4bnr56DWCDVV3P0+bLBnlYS7B9/bJTbe9nw3pZOLpYth82eQXFNyXuRGNWPr7R+QNYFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004556; c=relaxed/simple;
	bh=WtneIc0QDfp7DDBdSDxXokPJOzOSITmmPNHBQnSD4cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbmmHdtKxVhIay9flSfzssYiuY1owA7veuNPs3r3nm/NVf7Ggl++15/U9qH+ylNWX5PvZTdWCERBeJSOxcUugFgbUZptxqAVpG09gysGFxpluPpjMINJz0nZoPaZMgUnlpAsSkgAmJHn7/VxJn1vNHZ/oonIXGRbiEt024FNokg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iV548P0f; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iV548P0f"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c266c1389so5216884f8f.1
        for <imx@lists.linux.dev>; Wed, 30 Apr 2025 02:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746004552; x=1746609352; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iGp+BEJIsu8tiMnSTnVm5SKGOdus+/7Cz1jcp7uu/9c=;
        b=iV548P0fXDxNhzwFLtcVTHBmr7BaXunOkOu+0aBUoa+dzC1IC6jtGlJjznsqQTEl5J
         xikg/jCPCHKXX10kOK9EqQLtouNi6zg702p/uunqQa9YR6WzY+HSxsJHA7hY/5eQQG3Z
         ozCY////Lg21FSSamE83NWU+iIIELXh/kPWaQ4DMTuSl2p07WNiPW5Z7wZC+th9DwoOf
         2xHBu/yH1FHJhbH8xp1Wc521R0L37A74Hrhd6Aw+AcGrXZqszN6iMKR8rdUXtGsHPXYN
         zc6+dePDwqtZp1csfG6Pkf9hwyclFFQG/vPYaIZElmbc8Qup8utKLSV0bpCwXK0nh465
         tIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746004552; x=1746609352;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iGp+BEJIsu8tiMnSTnVm5SKGOdus+/7Cz1jcp7uu/9c=;
        b=AZmiLGSqPTX6YoR6s/uHxuDaIOiBksh6Nes88Z96flLzI7M+aJet1Dbrj0GtYusiGj
         1mylAImDeyEnQQcd0wONBL3q+y3RhNhaacgshFMzBTVmas030sfbSICLQUMIXaVcP6dA
         4rtiFwaBF2spFdpYtQJ7bfgmVv2JdCjbaKJBMkO7tXGKjR+FSFALcKkPF86mnjWiN+L6
         3fvJYdMd9GYc9MphZ/88+pBgPPXIXUMPk8YVrIqEOqlqCuFukcmJP1Eutx55uCs9XVTa
         RU6SKha1KDjKo8wZj0SL9iUkmLd+Kw2McdsUcPo5B6V5EI9rVKIsoh+EXFHz+/DVpwQ4
         +KOg==
X-Forwarded-Encrypted: i=1; AJvYcCWOUJTyhjdiJdI0GyCVaqbJ0OxxSOBtwo2eirqN92A20UFmxgMQizXDPRG5LQ1LniBtndQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7w6gnG2mdutPVznfuI1hxjR79jPuI9XqCGgEdAwA2KQhZ7r5A
	GFu9Dqi38onY4gmwLTjxbg2Eeoy03W0ibkx3Q0fUTl2E4dzOEuYqIyiuLxeX70U=
X-Gm-Gg: ASbGncuJculRtH1rJZE9fOY9brVByvjuAKwH+6w5od4iqIH0Nr87gyzEHfbt/hOpTTh
	U8DNnVFhxWU6irMTMIwnrX3ZCdospmgRluPW7lDfW+yJR2GNkj1MLFNa9kFUwGQA7qNl5j7Ut+i
	uvc2AaEu4qlms4rzD/HPB+voYR/bexXZ9h3O8tfhnaRNi1LmB82RrxLYOfASIT2L7EfiRMl87xT
	dgWfma1JA39eX9FqTrH2M468LbHt+smlsR9dUlAaB6dLrIdsjArqsCmJbTZGDRMwXWAvVE3WhqG
	VE0633I/EkP1/cyStZsf8c1PTCdZ+F5qbuOSgKZS6Rivag5lwzqxLFu7GkLwv9pWTar8O2MJ0DM
	3TGc=
X-Google-Smtp-Source: AGHT+IFkPR//rOgO0Nj6VP0et5o5R5weTdk43Q9O48THz0Bb0Mc82kvtuhKb+SHshn3v5YQdadMBLQ==
X-Received: by 2002:a05:6000:2284:b0:3a0:8c68:19b7 with SMTP id ffacd0b85a97d-3a08f7985d0mr2116855f8f.3.1746004552519;
        Wed, 30 Apr 2025 02:15:52 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cc4025sm16666218f8f.56.2025.04.30.02.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 02:15:52 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:15:50 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengfei Li <pengfei.li_1@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ye.li@nxp.com, joy.zou@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RESEND v6 2/2] thermal: imx91: Add support for i.MX91
 thermal monitoring unit
Message-ID: <aBHqRu7qmDlXyFeR@mai.linaro.org>
References: <20250407-imx91tmu-v6-0-e48c2aa3ae44@nxp.com>
 <20250407-imx91tmu-v6-2-e48c2aa3ae44@nxp.com>
 <aAIkAF_AHta8_vuS@mai.linaro.org>
 <aAJtwxBtBX4ofy/o@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aAJtwxBtBX4ofy/o@lizhi-Precision-Tower-5810>

On Fri, Apr 18, 2025 at 11:20:35AM -0400, Frank Li wrote:

[ ... ]

> > > +static int imx91_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
> > > +{
> > > +	struct imx91_tmu *tmu = thermal_zone_device_priv(tz);
> > > +	s16 data;
> > > +	int ret;
> > > +
> > > +	ret = pm_runtime_resume_and_get(tmu->dev);
> > > +	if (ret < 0)
> > > +		return ret;
> >
> > Why using pm_runtime* all over the place ?
> >
> > It would make sense to have in the probe/remove functions (or in the set_mode -
> > enabled / disabled), suspend / resume but the other place it does not make
> > sense IMO. If the sensor is enabled by the set_mode function and then
> > pm_runtime_get() is called, then the ref is taken during all the time the
> > sensor is in use, so others pm_runtime_get / pm_runtime_put will be helpless,
> > no ?
> >
> >
> > > +	/* DATA0 is 16bit signed number */
> > > +	data = readw_relaxed(tmu->base + IMX91_TMU_DATA0);
> > > +	*temp = imx91_tmu_to_mcelsius(data);
> > > +	if (*temp < IMX91_TMU_TEMP_LOW_LIMIT || *temp > IMX91_TMU_TEMP_HIGH_LIMIT)
> > > +		ret = -EAGAIN;
> >
> > When the measured temperature can be out of limits ?
> 
> It is safety check. It may be caused by incorrect calibration data or some
> glitch at ref voltage.

In which circumstances do that can happen ? At boot time or any time at runtime ?

> > > +	if (*temp <= tmu->high && tmu->enable) {
> >
> > I suggest to provide a change in the thermal core to return -EAGAIN if the
> > thermal zone is not enabled when calling thermal_zone_get_temp() and get rid of the tmu->enable
> >
> > > +		writel_relaxed(IMX91_TMU_STAT0_THR1_IF, tmu->base + IMX91_TMU_STAT0 + REG_CLR);
> > > +		writel_relaxed(IMX91_TMU_CTRL0_THR1_IE, tmu->base + IMX91_TMU_CTRL0 + REG_SET);
> > > +	}
> >
> > For my understanding what are for these REG_CLR and REG_SET in this function?
> 
> REG_CLR\REG_SET is offset 8\4 for each register, which used clear\set only
> some bits without touch other value
> 
> 	SET register work as
> 
> 	val = readl(reg);
> 	val |= mask;
>         writel (val, reg);
> 
> the benenfit of use CLR/SET register make code simple and it is atomic change
> one bit.

Actually, I meant what are they for and why are they in the get_temp() function ?

> > > +	pm_runtime_put(tmu->dev);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int imx91_tmu_set_trips(struct thermal_zone_device *tz, int low, int high)
> > > +{
> > > +	struct imx91_tmu *tmu = thermal_zone_device_priv(tz);
> > > +	int val;
> > > +	int ret;
> > > +
> > > +	ret = pm_runtime_resume_and_get(tmu->dev);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	if (high >= IMX91_TMU_TEMP_HIGH_LIMIT)
> > > +		return -EINVAL;
> > > +
> > > +	writel_relaxed(IMX91_TMU_CTRL0_THR1_IE, tmu->base + IMX91_TMU_CTRL0 + REG_CLR);
> > > +
> > > +	/* Comparator1 for temperature threshold */
> > > +	writel_relaxed(IMX91_TMU_THR_CTRL01_THR1_MASK, tmu->base + IMX91_TMU_THR_CTRL01 + REG_CLR);
> > > +	val = FIELD_PREP(IMX91_TMU_THR_CTRL01_THR1_MASK, imx91_tmu_from_mcelsius(high));
> > > +	writel_relaxed(val, tmu->base + IMX91_TMU_THR_CTRL01 + REG_SET);
> > > +
> > > +	writel_relaxed(IMX91_TMU_STAT0_THR1_IF, tmu->base + IMX91_TMU_STAT0 + REG_CLR);
> > > +
> > > +	tmu->high = high;
> >
> > Why is 'high' needed?
> 
> Need re-enable irq when tempture below high.

You should not need that. There may be something wrong with the
temperature threshold interrupt routine.

[ ... ]

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
