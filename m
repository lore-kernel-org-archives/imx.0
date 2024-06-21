Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C218E13C802
	for <imx@lists.linux.dev>; Fri, 21 Jun 2024 06:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718951217; cv=none; b=jqw273Lj0JwfkvKQ0it++YJrUsI0HstGKUCQrM2HcAEFEf1vjQWf0cDu3wBb6MTt9RDxKFq1RV0Mk3sram52kZbuCCnMHlXqhxBZGP8tMD/rHXWPgO40LpTJfjrmEqP+2bkRT0zFjw2M/9ah5mqgLcB+TKT4A+iR+NfsXQ8KVvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718951217; c=relaxed/simple;
	bh=zFv4mioop9B0X7lvQYF/BT8imt8BNhs7fZ6tP2Yv38M=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CjUgPaNNG4aSSrSGbK5M1nYCObiUXtCv7DRPDsZEdalhOJARutZ4yojV/w4NaPXoqjzgnoLRoVjlQGg3pfPiqLP5N+2sZ+TxOCVQyOi04NeT1ft1MKiFqWmo60Xx+Loyr2TWl1BJj7UgQXmTXY1Z5xr4BJvsS9Mnc5S5bETmMCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lch/XdrD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lch/XdrD"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4217d451f69so15250495e9.0
        for <imx@lists.linux.dev>; Thu, 20 Jun 2024 23:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718951214; x=1719556014; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7nWgs+bjEPUf8IVnahxV/5glWCv+VYIvB+XUT3ZBU88=;
        b=lch/XdrD7/2zk5Oubu9GQNJUJUJxgNXjzuSGG6QUkCTkEfOfvy8WXqeLiIYkO94zVc
         u0A+MEbtDX0txhi+pgiyTaSVyYdVTkZBkHZNkbnuoKaAWL62DJ/uUrIEZLxgue4ElDJ6
         AHFtD2iZlZf0B1FgdI5jqgAXQFVfC2hnUlqTeBGaIJc35/pxM0Erw7nRBZlNZmDoltSM
         ypDMGA9s/nvC94qNcw9VaS9bXzJovLfeVmlRcLJ/ScUcHTqXrxRK19N1PvorJsdqNM8C
         ZGvmX1g/YbS7hIXf5Bvn66s9o6VJ8n0tGN2Qcl2V3SltfVDkouDbdyjwJE3RIlxtNFYB
         UASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718951214; x=1719556014;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nWgs+bjEPUf8IVnahxV/5glWCv+VYIvB+XUT3ZBU88=;
        b=heQi+LmLNLDzdOegKGn/iHKTdjzkoK4cKw1mk7gZm28ArXwB8iZdlFpoDeZr3CUrSy
         S2lCWAEa0KwYDgMGfQ1MAbyDuHtlQkL1bdTOx4p2rXP9g4N7lDsVTVTvZGNScqgsnZrh
         SpgOMs2abrbuspzqJfw4sc4JlHMmpfK2SNJ1e3m00jLsR0Te+8lq5Y3BdU+INCHJv49Y
         4Hv01csgtHaXpE3UK9/o3mfXyUGJaa1zuLkWCMUAUWkcPqRT4lJ/iiPXtmzva2zKwkw+
         xWpf1YDMB96GRbq6CAeCJ9LH+6MQWEs9ymi9UL3zhSRzjnPEFFnWTTO/jJU1XPldYuxi
         UFhw==
X-Forwarded-Encrypted: i=1; AJvYcCXBgCNfTtLKmUElk9gPE9ZyZ82wFukCW5B6aiwWw4CO60M7AWPnC9ZiMYpPFVoGBIkfVvnN7OerBFoQiZZwOx95IXdD
X-Gm-Message-State: AOJu0YzSVSKhEVqlOF0V2ler8LatfA93FNne610+rqePhh4nRQXSmYn2
	m044ItCqsJx+ToC0TkFBuZi/74E9lNE/NASKkl4VXsYuLZpFsk8W+J1/Ty6II0s=
X-Google-Smtp-Source: AGHT+IFonmbENerID4dVvrf+FLqhGaAMP/UU/IXAT+9b7VYljrDzoGq76BubZlxlU8cuj0D0Dtz4Tw==
X-Received: by 2002:a05:600c:6552:b0:424:6d96:48ae with SMTP id 5b1f17b1804b1-4247517f18fmr58473725e9.23.1718951214007;
        Thu, 20 Jun 2024 23:26:54 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42481910d5csm14424065e9.36.2024.06.20.23.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 23:26:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: p.zabel@pengutronix.de, abelvesa@kernel.org, peng.fan@nxp.com, 
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 marex@denx.de, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1718350923-21392-1-git-send-email-shengjiu.wang@nxp.com>
References: <1718350923-21392-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v8 0/5] clk: imx: clk-audiomix: Improvement for
 audiomix
Message-Id: <171895121238.3616871.12573343188535489268.b4-ty@linaro.org>
Date: Fri, 21 Jun 2024 09:26:52 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 14 Jun 2024 15:41:58 +0800, Shengjiu Wang wrote:
> Some improvement for audiomix driver:
> Add CLK_SET_RATE_PARENT flags for clocks
> Correct parent clock for earc_phy and audpll clocks.
> Add reset controller for EARC function, use the auxiliary device
> framework:
> https://lore.kernel.org/lkml/b86c83a520f0c45a60249468fa92b1de.sboyd@kernel.org/
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: clock: imx8mp: Add #reset-cells property
      commit: d7d9ef1f40dc0639ba0901097139fcdc4bedb32e
[2/5] clk: imx: clk-audiomix: Add reset controller
      commit: 6f0e817175c5b2e453f7ad6a4e9a8a7fd904ee4a
[3/5] reset: imx8mp-audiomix: Add AudioMix Block Control reset driver
      commit: b7604e8b805a6e52161ff98728122005e6975a46
[4/5] clk: imx: clk-audiomix: Add CLK_SET_RATE_PARENT flags for clocks
      commit: 163e678c0b24d0e45f617f4496c4ae9b1afd8d63
[5/5] clk: imx: clk-audiomix: Correct parent clock for earc_phy and audpll
      commit: 22fb849ead1b109f868e83b309223d906e4b7d96

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

