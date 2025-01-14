Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8352361C2
	for <imx@lists.linux.dev>; Tue, 14 Jan 2025 11:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736855910; cv=none; b=gf780rItU0wy5pKpT+gpasQ8Oz04HwzsxtO5E444u/XfjmaPHYVxPRfZ75EMIfZCUjJB9L3Snl03sBBLujBY8xFK9cCHlJ6l6PJ/PvlUDhe9oJie+Bfj7V7jgschzN455JmQ7v189ROqmpYVyUAxtOfpM0myCnRbkFchWm3Viss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736855910; c=relaxed/simple;
	bh=cAoPGZ5WniJLhFe6ZhvWTcohnLZfgZFpQiLS6/wxIUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PdEo2DqJ8ScdNKRuSECyZOwt/b9hRCkMxiSRHtsSHTn97d0R+jk6gj+dAN7V8tXFqzn7ePtw1fYXUuwfVFJdPqRbXpCT9EM3LTtqJjmOhptGnwI7q4N/eVeuaRSb4YhHRodivgEZvYgiilldN/m1dQyO+AFsT1tAbcPtP52KFcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwrNpWS1; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwrNpWS1"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaee0b309adso885990966b.3
        for <imx@lists.linux.dev>; Tue, 14 Jan 2025 03:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736855907; x=1737460707; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=keaeHuBnA6yPk+ht4Eab1BXo8HSV7VPRSpTgBTborOU=;
        b=FwrNpWS154DEeqs2cMD08/vuRv03fgwqWEPLIbojFRdsB+18OpGh36dKmIumXXe4gZ
         FmsPUD7PytDzL4RnJM7Z9xIlZ21vx9Q+MQiJCVwK8112NEYlVtE18jhzClUj2Kla98Jj
         bkkEVYtsf0KB+GQJtc+KsoTkh/8/Z7mUYsafCjzBSBFe9HmFTPz2LxbkKjf76pvcgoBe
         j96Oq4Ckf/HAL6aKCjCu0iLjjkzy9QhxCY+sLixaBxuMhqFuNCWEsy3avuXw/nh0rku2
         9Lp558fvbpAgPUhQ4HdlSxTiXNNZ3KsyS4M2Jv+jY/3z9pg3o5pFRhHSmpeKKATZiDEG
         KjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736855907; x=1737460707;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=keaeHuBnA6yPk+ht4Eab1BXo8HSV7VPRSpTgBTborOU=;
        b=Lkzqxs9txlTvnrnC0E8K7wqcBd0K4dX51zg/jtWTmWDJRu3zOHwasGzms75XZTrrtl
         jKPITcArzeFDillueIEyAJFN0mu4NJtstVGFCBkoysUMShbdqKvijf9pmH8PG+5t41O5
         JvYOnxE+Hts7bPFfQFCfeBqMKvNBno3ub2/sksdc705yKeOFgn+BdB9RXYZWFJTFcIba
         jHdwYKCb5+HYXy/3HE06LvjpxdBIBzZwo6YHY5K4UY07ZZSkmPlA6KDqrblZZ/Bq6KzF
         yPWvrbfCDcv8aaWLdP1Asl3wH4NhzYTNpYOasJiHUfQk27XAjGVJ8+6LmL8RGTPWfLFE
         Y8KA==
X-Forwarded-Encrypted: i=1; AJvYcCUf1Np0JXK8PN4PmkCqSDntkRFeLMwyzAoHAVhhAGOSLR0a8mYTmI8ak3u4tuSAJhGCzEk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRX3h74lkco9kNnOH8m6vXsgMsmYtauew93VxA0q7UPLYr7H4K
	7WSyeVFEn8ZvExsVehFKRiVIelU04LXm6NG3oFBGZc0uQrft5O/4
X-Gm-Gg: ASbGncsrkZiPDzdccfmq7+XuCyGZdN+wbdjYB/fQr0ht4rZodeM7qa1Ioby3WzggMgk
	hztkM2tJNjA/dm7FzHPz4jNEdl8dfqZWDvLCrYWQCFINJD0zCSfkgek4qQOaJ9Ovomg0WALn0SP
	dKutwVAGcNeb3q7x711mLh6ohOHm3Ergc9ft8lEqGYkXo3cN7zGq8aBfsZ7imBMxSCPtSbC488r
	mwitn3LSvhtsYATnvzT6be12K6IXCyBPSQBkGJz2pwxxvczTNsGXqo3
X-Google-Smtp-Source: AGHT+IHTulWCj2YYnNBcefAEaJouVTvuufskMNNQK2TUTyQ/FQiVcwIMr5PX23StjL4mn4QQ41c9+g==
X-Received: by 2002:a17:907:6d01:b0:aab:d8de:64ed with SMTP id a640c23a62f3a-ab2ab6fcf85mr2426598466b.25.1736855906651;
        Tue, 14 Jan 2025 03:58:26 -0800 (PST)
Received: from eichest-laptop ([77.109.188.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90dacf1sm629151066b.63.2025.01.14.03.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 03:58:26 -0800 (PST)
Date: Tue, 14 Jan 2025 12:58:24 +0100
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
Message-ID: <Z4ZRYMf_uJW4poW9@eichest-laptop>
References: <20250113094654.12998-1-eichest@gmail.com>
 <CAA+D8ANvKQKJhn6qKbPhQeXPD5kxUo3Hg-FBLkDMOaWLTA8vVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8ANvKQKJhn6qKbPhQeXPD5kxUo3Hg-FBLkDMOaWLTA8vVg@mail.gmail.com>

Hi Shengjiu Wang,

On Tue, Jan 14, 2025 at 03:49:10PM +0800, Shengjiu Wang wrote:
> On Mon, Jan 13, 2025 at 5:54 PM Stefan Eichenberger <eichest@gmail.com> wrote:
> >
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> >
> > Currently, the flags for the ACM clocks are set to 0. This configuration
> > causes the fsl-sai audio driver to fail when attempting to set the
> > sysclk, returning an EINVAL error. The following error messages
> > highlight the issue:
> > fsl-sai 59090000.sai: ASoC: error at snd_soc_dai_set_sysclk on 59090000.sai: -22
> > imx-hdmi sound-hdmi: failed to set cpu sysclk: -22
> 
> The reason for this error is that the current clock parent can't
> support the rate
> you require (I think you want 11289600).
> 
> We can configure the dts to provide such source, for example:
> 
>  &sai5 {
> +       assigned-clocks = <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
> +                       <&acm IMX_ADMA_ACM_AUD_CLK1_SEL>,
> +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
> +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
> +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
> +                       <&sai5_lpcg 0>;
> +       assigned-clock-parents = <&aud_pll_div0_lpcg 0>, <&aud_rec1_lpcg 0>;
> +       assigned-clock-rates = <0>, <0>, <786432000>, <49152000>, <12288000>,
> +                                <722534400>, <45158400>, <11289600>,
> +                               <49152000>;
>         status = "okay";
>  };
> 
> Then your case should work.
> 
> >
> > By setting the flag CLK_SET_RATE_NO_REPARENT, we signal that the ACM
> 
> I don't think CLK_SET_RATE_NO_REPARENT is a good choice. which will cause
> the driver don't get an error from clk_set_rate().

Thanks for the proposal, I will try it out tomorrow. Isn't this a
problem if other SAIs use the same clock source but with different
rates? 

If we have to define fixed rates in the DTS or else the clock driver
will return an error, isn't that a problem? Maybe I should change the
sai driver so that it ignores the failure and just takes the rate
configured? In the end audio works, even if it can't set the requested
rate.

Regards,
Stefan
