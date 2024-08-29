Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F014188014
	for <imx@lists.linux.dev>; Thu, 29 Aug 2024 07:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724917885; cv=none; b=lQ0a7wRwfblxb7l1Te4gkpCdNndaKC9WBOG73AhW2qjPkmof3HPVVLdC24JxcGbWQd8detbzPsnZ7Lcfd1oNMeBRi2QMhR6Vjn14BeRqensAtkhCMHk1D2mv4GQX0PpDGzKnVVaRYUiRRplSD8hYUbo2jI3w7ZfydxoYLuB/cwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724917885; c=relaxed/simple;
	bh=b1iu5bBGMN/WRY5McVNmPa0sPk6pBt+y0aWDnZ8I4ZY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=W4ju3n9YhgqCJ+u14nerk1hKq8a1bsx9sI7ahSGg/F4qgacBj2XxX69H8swfckd8sR3Id6nRxh7D06i4lWv6PwBC2DiFsibJVnP1Mi3V8cN/l4WWuA1ZqXFxka3prtZWS3kB7GKPOSNLvGfWpANh2uTQ7Ir9WxY0EYyKmdD6/5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GAplEYkq; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GAplEYkq"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5a10835487fso404448a12.1
        for <imx@lists.linux.dev>; Thu, 29 Aug 2024 00:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724917882; x=1725522682; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNl66AlqwT4cAqEjUDGMGS3KRyt0fVfw/DJnltkCvlg=;
        b=GAplEYkqHHn1cCxI1hCjjUTt0Jh+3v/XxhV4bjxjdo2r7bwC5+PqzSlO4S27MWB8lE
         dqgPl0bgHdHOA+Kah85ZBQyg6q23ySCtth4pTD3U502p8IDIh/V5S8PF6oQS5oRLa9br
         3GkkRdIuoPqbXFTpsQAZFr8WtSjxM5e6xEADWHKs5fEhJkjTFNkcrU9Ch6M5+ix83TN0
         WdaKiU5TMIOZ5ZHprylSojziQKt6eRzWc0M1yTHfWlHnf2foahc9S8tOTH8wB4s0PSHq
         h2BH5hN3upGJGDu7oIpHrkvbMhj4x7wHE8/alV1+2JdjndOx3h1m9K1VsC10V4LtzeuA
         TpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724917882; x=1725522682;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fNl66AlqwT4cAqEjUDGMGS3KRyt0fVfw/DJnltkCvlg=;
        b=kp1OexnKkUpuP7Hby9vbPsuJhpuxibvBGPpt1cEC83MEyR8balOhtyQlDLb/EUi8HC
         VlRAhjyQdP1kQEpPWL96jFuAXpAV583zqgQKVTC22gxzbu11o8vrBBWh9YjNXsjC+B20
         tCPIUk68JyV7vM3eOtJJgezfDKMPnPwtdiG4Y+JG+a394qYgfdU9JDCm5lZ6W9to0JX/
         izAob4PKHKr09atrK7rEWDVsQxCKoWYTMyF8BUUVLWRwvkUSHbnBV7KfVH1e20+c06Ki
         rOY1pjbVLFlD0DbIWJ7iq6aYuf3Bnbj2pO7ck017Ym98xX1hEoZ8AP2PreQgJ+s4ML9L
         3LWg==
X-Forwarded-Encrypted: i=1; AJvYcCXOdDR6pEtbwH/jfXjPeiznBC6vGr+3IKXQYLsXlmiKMGCNk0BKgdxHhQupZbFP5iEDkGQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0R1Vk3eS6137GIXn6uQp/iwrJz8oF+9QatptMCVWP4E+EByPa
	YyBEqBlzaQ3udJnItIePgkShVrhGFaj167wvxSK9CjTWTA3RAOmTlx9Rs05Jy0nstr/3XUJlqJe
	C
X-Google-Smtp-Source: AGHT+IG8huFuC9IMIewGRzZFbVOx39XRXGgjaUUrnzV5sW03EE5Zh6Qoa3HKistxnMgRVRVgwscq8A==
X-Received: by 2002:a05:6402:268e:b0:5bf:dd0:93ad with SMTP id 4fb4d7f45d1cf-5c21ed8e66bmr1506357a12.27.1724917882000;
        Thu, 29 Aug 2024 00:51:22 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226ce4fb9sm387010a12.87.2024.08.29.00.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 00:51:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
 sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
 shengjiu.wang@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <1720600860-18866-1-git-send-email-shengjiu.wang@nxp.com>
References: <1720600860-18866-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] clk: imx: imx8: Use clk_hw pointer for self
 registered clock in clk_parent_data
Message-Id: <172491788069.2543084.96108740575044278.b4-ty@linaro.org>
Date: Thu, 29 Aug 2024 10:51:20 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 10 Jul 2024 16:41:00 +0800, Shengjiu Wang wrote:
> "acm_aud_clk0_sel" and "acm_aud_clk1_sel" are registered by this ACM
> driver, but they are the parent clocks for other clocks, in order to
> use assigned-clock-parents in device tree, the ".fw_name" can't be used,
> need to assign the clk_hw pointer for the imx8qm_mclk_sels[],
> imx8qxp_mclk_sels[], imx8dxl_mclk_sels[].
> 
> 
> [...]

Applied, thanks!

[1/1] clk: imx: imx8: Use clk_hw pointer for self registered clock in clk_parent_data
      commit: 35121e9def072aaa2361572829e4f71f80dd6e8d

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

