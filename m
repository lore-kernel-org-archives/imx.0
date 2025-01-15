Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978DF5223
	for <imx@lists.linux.dev>; Wed, 15 Jan 2025 08:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736930018; cv=none; b=hadtSZOQbxQKKqr5ELXX64c6BHSRPv4f7Xi97/LVy1aQ65VHkfB2TvhrjKeGFT84UStSXNxL0aFc0A9/tcFpsVrpJ5JFyrjvk5cFp1Wsrhr6ABms63aXyVGLLZAFnel1Es/YNyL+Rvn8S8IosfzUd0np8MBj+T2GxQ5jLjy04ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736930018; c=relaxed/simple;
	bh=rr5s78EC3w/9YyGhSVI4b1y7Fm81akbFuF8CSzmLsUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pINOfkbx8sj3sDVmNVAPC3CmNjPn/Mjy+mS9qMgqwZmqOniwBqqwTNHzYDQxpctenziS8uOj/b9Y/LL4cxGmm1upq0+njMXx2ftOiDlan631B1V1b4WRM7bbi0FKN7922elC0CJUR7pJcgacz0QbiyHZjULm4CfVG6qGAWLrNhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdeZTvwn; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdeZTvwn"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43690d4605dso44351195e9.0
        for <imx@lists.linux.dev>; Wed, 15 Jan 2025 00:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736930015; x=1737534815; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jRbGA5hfKNQNoBMn6E9hxMPXAsQYQxuMoAfdDX+Ku3E=;
        b=cdeZTvwnBDxu1MflbW/rkkIDWp2/x8ON9uYxgQtslUj5ABmoycHkSAw6MPU01NX/tD
         MnnTVWOTiyzjcDEQSlvr1HTwGsbv4UZf+uJAhOgo197EvPdwtK1WIqhWqOYsXYDLnMej
         NMIMbmJO3tmZb7S7QElhdELvlhTbldn1x7r2Fy1xL+BVLNBNvfbR5OuSJbm2osKXaoOu
         z6yvOKb4dXuz9V9BpzfLQrCXugZLcJCIkWiTrU7cX066s9v/8hZ3RqjmNqAofGKD+zkk
         3UuqI8XJEqOZ8WwT19HgSarSEMPoKjXYhD7qgl0HDKADBDVP8PCJ2ch5YpTkf4VwbcZJ
         5Jvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736930015; x=1737534815;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jRbGA5hfKNQNoBMn6E9hxMPXAsQYQxuMoAfdDX+Ku3E=;
        b=aB4nnJg8ywkAVJ3kclT1zAvgJ2L9IP8YNcawSZ40Gf3a+WqnBGyrRcdespbypGFdMS
         9Wz6Vdf0bmO9RPA7HQGCCHqdptC0FVfp1V2vwjgx2qF1mz7VVTHqC56xODVDmfWIiHDO
         dsM7T8wYj5YenNKhr/4g9M/LR8797X4LDEGab4HK3xSh04Chx8oc4RorBsj/mlVVAnkJ
         WrO/iXps84lakfcA7iAmJfHkWwjPkcARF4wiBQy9/ApxYEa7dQR6aWj3Jmeq96GIOuuB
         96EEgilzzTQGYJS4dFTc3IWXESjaZ5uSmd77Mul/YxoY8GGnj2I4eTdRhPvuZSSe6XPg
         ww6Q==
X-Forwarded-Encrypted: i=1; AJvYcCViHQxL9kJqF8le4z8h6NL9wnPIVF9HwxDxtBiER7siYlad9LZd5NxbLl1A/uc80mhlhqs=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh7ErxyRZ2C1EgXMeLu4xh6GptpYk+QgzvoiSk55CF3vbs9tZ8
	B2bLtSe8ibSIxVL0YRNgcN0AAYRRh2udTdY0z6aVyABykSkwrP1d
X-Gm-Gg: ASbGncszKUw+xzIQk2nGCRKswo3vqUIrAphKG0O99Zq+XXIaZGLmOtpS6qgCLFY+jGA
	71oKgPGpIn1ShbI0OrGX/KXta+t8n6XBuYZw9QKZCDFt1B9NAJCd0XPeH6VryJUiQjTKbPfo5Kv
	/+BBn0e3vJD/CahqKylW2fgpwKe67E2GrKhYnGp5xMoct0Rd0vN4662wqgJosBdbyzQPH7oNLoS
	FSdv/6Cqt2kYUL1IDj9iyCML3H+b5VVP0dfF8O+jL9pdZjTaes/w8xCPZkQk3matgE/hz4e/5H4
	yIG7ZZge
X-Google-Smtp-Source: AGHT+IF7Dra5d6ki8O3COk+SLqWcJq2xaGIUHP116tcbjhTFS3reuK1GgRmhqIcUq60sOxi9rfERQw==
X-Received: by 2002:a05:600c:3b99:b0:434:f925:f5c9 with SMTP id 5b1f17b1804b1-436e266dfe9mr223940145e9.6.1736930014457;
        Wed, 15 Jan 2025 00:33:34 -0800 (PST)
Received: from eichest-laptop (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c749a127sm15360785e9.7.2025.01.15.00.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 00:33:34 -0800 (PST)
Date: Wed, 15 Jan 2025 09:33:32 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, shengjiu.wang@nxp.com,
	francesco.dolcini@toradex.com, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] clk: imx: imx8-acm: fix flags for acm clocks
Message-ID: <Z4dy3LiEAQ_gkQGG@eichest-laptop>
References: <20250113094654.12998-1-eichest@gmail.com>
 <CAA+D8ANvKQKJhn6qKbPhQeXPD5kxUo3Hg-FBLkDMOaWLTA8vVg@mail.gmail.com>
 <Z4ZRYMf_uJW4poW9@eichest-laptop>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4ZRYMf_uJW4poW9@eichest-laptop>

Hi Shengjiu Wang,

On Tue, Jan 14, 2025 at 12:58:24PM +0100, Stefan Eichenberger wrote:
> Hi Shengjiu Wang,
> 
> On Tue, Jan 14, 2025 at 03:49:10PM +0800, Shengjiu Wang wrote:
> > On Mon, Jan 13, 2025 at 5:54 PM Stefan Eichenberger <eichest@gmail.com> wrote:
> > >
> > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > >
> > > Currently, the flags for the ACM clocks are set to 0. This configuration
> > > causes the fsl-sai audio driver to fail when attempting to set the
> > > sysclk, returning an EINVAL error. The following error messages
> > > highlight the issue:
> > > fsl-sai 59090000.sai: ASoC: error at snd_soc_dai_set_sysclk on 59090000.sai: -22
> > > imx-hdmi sound-hdmi: failed to set cpu sysclk: -22
> > 
> > The reason for this error is that the current clock parent can't
> > support the rate
> > you require (I think you want 11289600).
> > 
> > We can configure the dts to provide such source, for example:
> > 
> >  &sai5 {
> > +       assigned-clocks = <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
> > +                       <&acm IMX_ADMA_ACM_AUD_CLK1_SEL>,
> > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
> > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
> > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
> > +                       <&sai5_lpcg 0>;
> > +       assigned-clock-parents = <&aud_pll_div0_lpcg 0>, <&aud_rec1_lpcg 0>;
> > +       assigned-clock-rates = <0>, <0>, <786432000>, <49152000>, <12288000>,
> > +                                <722534400>, <45158400>, <11289600>,
> > +                               <49152000>;
> >         status = "okay";
> >  };
> > 
> > Then your case should work.
> > 
> > >
> > > By setting the flag CLK_SET_RATE_NO_REPARENT, we signal that the ACM
> > 
> > I don't think CLK_SET_RATE_NO_REPARENT is a good choice. which will cause
> > the driver don't get an error from clk_set_rate().
> 
> Thanks for the proposal, I will try it out tomorrow. Isn't this a
> problem if other SAIs use the same clock source but with different
> rates? 
> 
> If we have to define fixed rates in the DTS or else the clock driver
> will return an error, isn't that a problem? Maybe I should change the
> sai driver so that it ignores the failure and just takes the rate
> configured? In the end audio works, even if it can't set the requested
> rate.

The following clock tree change would allow the driver to work
in our scenario:
&sai5 {
	assigned-clocks = <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
			  <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>;
	assigned-clock-parents = <&aud_pll_div1_lpcg 0>;
	assigned-clock-rates = <0>, <11289600>;
};

However, this means we have to switch the parent clock to the audio pll
1. For the simple setup with two SAIs, one for analog audio and one for
HDMI this wouldn't be a problem. But I'm not sure if this is a good
solution if a customer would add a third SAI which requires again a
different parent clock rate.

One potential solution could be that the SAI driver tries to first
derive the clock from the current parent and only if this fails it tries
to modify its parent clock. What do you think about this solution?

Regards,
Stefan

