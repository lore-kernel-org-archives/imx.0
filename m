Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ACF1649DD
	for <imx@lists.linux.dev>; Fri, 21 Jun 2024 06:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718951794; cv=none; b=ou4G5R9ukT7PPg9uzEZeKcZn6B6aW1pVldix+D1rtB/fgzdQ3axqQsU2WEhwiCD2XT72rMMKS6ZAEvFW0vR+PWXD2U4PbQDXeShvZMNpT92cnh3DNsqTrPtYI5xjcisCuDgeR9leLDDG9XeUkZ0cCJLEFLkYX5jmdJGhj7mYlpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718951794; c=relaxed/simple;
	bh=CVS282gt2BZWPwQPDlqAhA+HA7+K+GqzDLs7+w8xVd8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E99/KssCDUnkAXurqJEMHshx0BTFD6QhdQnpxhgLoN/37roaeTCSjJEIRKshAvVkGKOiAnbsp/4ikIMBdsKMF4VKqnaPKXHQhl7AR5sVzS4o2xnnoCahtvgON0p7uejONLFcaoEuJ/YBjmNrrMaxUn+AyI1TpK26GzD3KCMXVJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ryeqm40l; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ryeqm40l"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ec50a5e230so640851fa.0
        for <imx@lists.linux.dev>; Thu, 20 Jun 2024 23:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718951790; x=1719556590; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t84QCKmcGG6leq57fUocwApo4rYAfiNNtCvL1L6ActE=;
        b=Ryeqm40ll3y9aBhpDVqONZAizpfiGnWXbp41w4xMEutCn+z8mZI3EDAlLOR9zCWQQj
         /bGTWMeTn8ibdfJqDDZQ8PLDHbZMRK9rybe2N9V+NJRbhhPYeeio1SOksBzAX2sASebh
         xb/gZVnfaNBQBe3hCQvLi5iWsi9rDQZJvJM0/oXDcrcotVEo3MMs4z08wF6iFgi3ZjRt
         yHaDUrKYmpy0k+/A4w8Uga+xpT2IW/RpU+cbB+BQ4AtFVRxCjpR47s2s73Z9ln+Q9jXT
         7MwWk2yJkgFzAU7xbXWwwvwNaK4Bmp12kA4Jj3qxgZ6nP5CuVvTBa5G67c0uRhuzafQq
         eJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718951790; x=1719556590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t84QCKmcGG6leq57fUocwApo4rYAfiNNtCvL1L6ActE=;
        b=KLaaX70tmhXxg+X3vAp0sCkWvI55n0XunkX6BRZehGClboAxooHb/nH922V+HfkSXq
         ApMU5jVHzS5NvFPtNIsIgtqdU4s9T9Atv8AjEY442TWDB2zMUFeatW5OX3kxjC/6mm1Z
         t/Sh5EnMVX+HqYctuF3+FjoRmF7xks6FvqEyWxLdXncYwdDC2HERK1EeBsB2IxMo+Nxq
         zNAiENtsTys+WMQyzdCkJrsSo9T/1J7qknMn1FCf9NrR0fB211gZvWkR1zIWK030Z40U
         O8kuo6uz0ZEs24OHx3B7nLfHqoFIl3Ag5Z9CJDE6v/EX8Ek3RWfIWxFKxxhUEpso4d39
         ZYsA==
X-Forwarded-Encrypted: i=1; AJvYcCW/XV/cFfY9kdEahfz2ALV7MDGtOHyz3IPynb9JDk7ZjxgtWOwwHaVjhypcpps3nUV2qbeaViupoiaUYcHXYDCiaHtp
X-Gm-Message-State: AOJu0YxjbTQXqoZCnQ6JpgVDsZMtCa4OwpbYK/PdonpIq/nFCUySGDBr
	V6BgpA/NPYTBoaSFitK5c7FFNFwSC4p5FG0dW0PPimlYWXLlffZoV4nBe1JBKE8=
X-Google-Smtp-Source: AGHT+IHNQA4rAEB1gsQiFKB1DRLQUV1eNXrZZZgNrFk1UE4XSqGk74c+o2JCR/eCFrAouqmLHi/0MA==
X-Received: by 2002:a2e:a0d6:0:b0:2ec:28ae:288 with SMTP id 38308e7fff4ca-2ec3cfea4f5mr49183721fa.39.1718951790215;
        Thu, 20 Jun 2024 23:36:30 -0700 (PDT)
Received: from linaro.org ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42481747c76sm15065785e9.0.2024.06.20.23.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 23:36:29 -0700 (PDT)
Date: Fri, 21 Jun 2024 09:36:28 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: p.zabel@pengutronix.de, abelvesa@kernel.org, peng.fan@nxp.com,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	marex@denx.de, linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v8 0/5] clk: imx: clk-audiomix: Improvement for audiomix
Message-ID: <ZnUfbEBDaKqIJU0r@linaro.org>
References: <1718350923-21392-1-git-send-email-shengjiu.wang@nxp.com>
 <171895121238.3616871.12573343188535489268.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171895121238.3616871.12573343188535489268.b4-ty@linaro.org>

On 24-06-21 09:26:52, Abel Vesa wrote:
> 
> On Fri, 14 Jun 2024 15:41:58 +0800, Shengjiu Wang wrote:
> > Some improvement for audiomix driver:
> > Add CLK_SET_RATE_PARENT flags for clocks
> > Correct parent clock for earc_phy and audpll clocks.
> > Add reset controller for EARC function, use the auxiliary device
> > framework:
> > https://lore.kernel.org/lkml/b86c83a520f0c45a60249468fa92b1de.sboyd@kernel.org/
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/5] dt-bindings: clock: imx8mp: Add #reset-cells property
>       commit: d7d9ef1f40dc0639ba0901097139fcdc4bedb32e
> [2/5] clk: imx: clk-audiomix: Add reset controller
>       commit: 6f0e817175c5b2e453f7ad6a4e9a8a7fd904ee4a
> [3/5] reset: imx8mp-audiomix: Add AudioMix Block Control reset driver
>       commit: b7604e8b805a6e52161ff98728122005e6975a46

Dropped the this one. Needs to go through different tree.

> [4/5] clk: imx: clk-audiomix: Add CLK_SET_RATE_PARENT flags for clocks
>       commit: 163e678c0b24d0e45f617f4496c4ae9b1afd8d63
> [5/5] clk: imx: clk-audiomix: Correct parent clock for earc_phy and audpll
>       commit: 22fb849ead1b109f868e83b309223d906e4b7d96
> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 
