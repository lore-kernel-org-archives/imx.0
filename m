Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD289303C99
	for <imx@lists.linux.dev>; Mon, 18 Aug 2025 08:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755506857; cv=none; b=Mu8KUbHgZbrn9fDCnwguE0QqeloImzzjZhlG97atIMAtUbdiXwzlnDLa3LPCzDv5rxVrtl9cbTfPU2Mnx/wOw7Qlx4www/xvgywW5Fa58+entbw/iiiTKeaDoJBLE3QMSo5V7GfiEAOGwroIR8aN7ernYiq6y9GSySPpggdGvGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755506857; c=relaxed/simple;
	bh=cfhhhzhQxZrXxPloRoYunXy+b+gOmZJrF1u84C5Mzbs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Iuu7BeAwcEMoA10Gd4bObGEl+vcEJmUBh4+dc6hPP0S0nc0hlzU7iIGB7+Vl1xoP5On/dq5EbZaenEJAYU3c5HNB6cAlq+BxSJjfiFdfXIMne8dMEzrViRPmJcE3RKrK8LfCiA+6tYHhUBVGotKp/IPSpkZuOmxjKA8H3Ln8rBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iI+XSIv/; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iI+XSIv/"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61a54560c1fso47291a12.0
        for <imx@lists.linux.dev>; Mon, 18 Aug 2025 01:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755506854; x=1756111654; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0L7vCqnemiga4MJSGEdKnywkyS4sL50zcZbVWgOu40=;
        b=iI+XSIv/iMaBjTqO7bLv0Mc6MphLg0WBFs3aU39EgDceDpKuP00XAXPTpCgUqUEMrV
         jOWX1cfpN6vEHgtjhl0OS0XGk9NJsooUiccntwVuqo36/5oKnNVzlHfGUseBBRvS2rbE
         nSk4P/kI/NqvbCQIhnXhQsR7yLh36abzqld8ZFl+vGrggWrxVm/y1umx0cDX0nITeyat
         FgVZEJ/nP8B6yeQlRa8Oj2vwbDlU0S9nf9FGxxkEZMGbJsfm9uX1Hd38ip5UqDoPiHN2
         UcgE3e7EvM3kAlCJMyPZ9wQkCSO7nGnMThGCV5p8AlVxHNOG87JugTKaSSkrEMT5+Xw4
         jUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755506854; x=1756111654;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0L7vCqnemiga4MJSGEdKnywkyS4sL50zcZbVWgOu40=;
        b=cu9Os2ZP4RN4BxAL+PWcV4o61niQSUDYPAhOgnPp4RLAVpZZZ/G7AAAuqcXslhDKQ6
         rD13O9HJO4VjQZtPqxdTIrVHCOcQTZgsKt7vwn3appMU+8hSuYL0tu6MwNVMJWUafDfF
         Wib+PiUf1AjC+FHgdR7DxrDissh6v6r4bLiTG3Nblo0U2e2ONmabsjUTHrdPP1GaRPd5
         k20It9ZPwlbID1SVV0REWXL0vqF5+smVwGtCLwXdO4vXb8EC+J279tL2poWqEFwRZnS1
         T2AtTKuLRJz6LRgm5Fwhz2iFlKtjTIAINPR0wK5R3EcKBA0JyYdiuZpLZqy9ClzXHjAu
         EqDg==
X-Forwarded-Encrypted: i=1; AJvYcCUW9kNu2jyp8A19XTvd0xVZ2o15/QErJTVeE+MpXgfdFdSftRGsDedoWfg7gWLSQJ6HxBc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxYRSNPS9r0rMryvBEhUSyZd7QRMyWFR8D342zrLEuXi57aM8u0
	7mMKrp+jyTfx2GHRU6OFUma0oupw/9N1fehII2QWNah52qz7meiseIGvFinnYUNmV4Q=
X-Gm-Gg: ASbGnctmoHmxFFcGUgaGSL3HhTxQTwOFkEqxF5l2vBDvD2wWMgcaEYdJ3tGnja0Z/dD
	QULBgG1BfqTfNTB3JCVkRwzLy7EQZvHO927kfXsvDxv0wlx80VJr2TLgTnItyVwm0odjAknq/z9
	4vGeEqRAIePghUeBvXtfldtH7+mPhRdSd/aCj6UrFuBhCtB1CHRRKLjR47LiCir3p+PA5dwncOh
	HFRopCTbqa+zSzcor/vNr7sUpviIgjUValqLLbSxGFm2IGXGZESvVh2K7odQ6iWp+6TxzJDy0xI
	5x3EpkYOirUPA3ETHxC+GbfIT8/NihVVKwbiNB8qIrFnrzmOi4m67jHUkPHgpPlNX4rlV3JWbPe
	bY8VJM05S6aG2ZiXvlPFXqnnarVrWvxyXsbwuEIo=
X-Google-Smtp-Source: AGHT+IHknpi+jVcAiHPe7qLq8tMu11yKP03M4lXkXrorN3kjMjAvXVfdd/sJwjbdKxYg4VZrpI7G9w==
X-Received: by 2002:a05:6402:1d54:b0:615:5cc1:3446 with SMTP id 4fb4d7f45d1cf-618b0f1c504mr4641443a12.5.1755506853905;
        Mon, 18 Aug 2025 01:47:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618af9da68fsm6627647a12.22.2025.08.18.01.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:47:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org, 
 cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, 
 martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org, 
 catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
 ravi.patel@samsung.com, Inbaraj E <inbaraj.e@samsung.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, alim.akhtar@samsung.com, 
 linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de, 
 festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250814140943.22531-3-inbaraj.e@samsung.com>
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
 <CGME20250814141009epcas5p153e4aacfc1ead3db8c9bb647c6e5c7c4@epcas5p1.samsung.com>
 <20250814140943.22531-3-inbaraj.e@samsung.com>
Subject: Re: (subset) [PATCH v2 02/12] clk: samsung: fsd: Add clk id for
 PCLK and PLL in CAM_CSI block
Message-Id: <175550685171.11777.14695565851704310683.b4-ty@linaro.org>
Date: Mon, 18 Aug 2025 10:47:31 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 14 Aug 2025 19:39:33 +0530, Inbaraj E wrote:
> Add clock id for PCLK and PLL. These clock id will be used for
> operation of CSI driver. PCLK is AXI2APB clock used for register
> access. PLL clock is main clock source for CAM_CSI block.
> 
> 

Applied, thanks!

[02/12] clk: samsung: fsd: Add clk id for PCLK and PLL in CAM_CSI block
        https://git.kernel.org/krzk/linux/c/1a713bd3b0c60d826bdde633919bedc1fd38df4d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

