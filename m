Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628B62505A2
	for <imx@lists.linux.dev>; Mon,  3 Mar 2025 17:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741023069; cv=none; b=O2XF8ZhFn9TalDXyGDchQu9MSzeC51VGV25MSBB8ofXWByz7vsOedD+P0eYB1qOCtcMmExJFxnoDS5vnrBMP84n8aEFxVx1EdQSSnQbvSepYPMu+oSyXuI1t8MDqqhHG28JQ94G7v0VqrGzIbBn/fTD/iFTwFoDBoqIZbCAIKaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741023069; c=relaxed/simple;
	bh=nqVSHW1hb8CGjJ3aX4TgRZ7EInx0TlUtu+JIylVTgfk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XXka1R1T2IVVu2DhjkdtAOsvgb1kPWv7CFLuDDIOYwzYNjh+dU8ulZhMNmBcPPv2pMwIRKzRhDN+Z06q35UBr7CxyZXPT52CcOzOHKLyl4uK896XyGW/SA2Cvzlqx9S9pstRXY6LfLwkAl3Tuat4OpdmlX1JPNR/J3gTnWW3BUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=enF2SQip; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="enF2SQip"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e50de0b5easo3314477a12.3
        for <imx@lists.linux.dev>; Mon, 03 Mar 2025 09:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741023066; x=1741627866; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pF2rTDt4Vl7NBjjbuhRzwdVJI8zgAEslXXnd2LthCLM=;
        b=enF2SQipGLltqow5tq2jo52HUsNbl9/Od6/QHgM+eHIHrVAaBYC36ys9vMwt4rdMfJ
         WxnMDqrLFLH7FhSflUwl4UNakqvifh0MB4oqFPS66eCG8XgGYlW6nDLIsYGoFo3/XeSs
         qBbVdc3CfwLgC6PkeLrKZ1i7NVovKD9evaAf5kkDQpXOUBQ1g37LdR/nkeEzxeUHgpTT
         J0fohChuR3EDCEoG7GI+PaM9Y2CcGe41UJqvbjV2a4JtrhqiII7UuTdusen1nb5qlqCA
         lTCegWJvc8dGmAtFmQ3Sr85Z0toVEWfugNu03/tJf4qdUd1aLUrPylt++Wz3fQJilobp
         UDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741023066; x=1741627866;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pF2rTDt4Vl7NBjjbuhRzwdVJI8zgAEslXXnd2LthCLM=;
        b=r2SsjqWHQ+tMZPt53U1c1alYjUQ8dDPCYyHonzISoZDLRFnIFu2AUnVOcnzO8Bh7pW
         82QTau7iXAvME6rfajiOoDKw6oocSniv6zRrKrW7t5Cd060VQf6BQ3qWKi8I5rqnwljU
         K/fZIVpPgV7xf5k99Hc8UFXvsneWVWl8TQh5a4gyxRBnVQB9hnty+z4htdxSqJq+akso
         hCZ6tt6WuyNcT7g5BzJ1Xal/XezmVxlFJTxkAVFw89wkmP48WkW55fCQ7gVlJkUb4Whf
         6TgODZ8/EvWe3R282exzH3qdDxeQY8IlULfv/FpCPSk5VsUD/Tw0C1VtvBSINsMT6EqE
         Sm5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoL6dQrLYOQLuloQvpqps+HY0Z71QGeUvfMBfnyDaYMNXvPHcObCDpu+acLjoxu/Baw9E=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXZUgd0G9zCV3FTGYKRwvZbKKjdP7tIYe02LtC4YZY4FpISxeu
	1SqidYxWp+8CU7vSXOI7N6BIRgLmkD347BiPzJ9fei2xidU3zi2ZDjRkUj9j1a4=
X-Gm-Gg: ASbGnct7TtzDLDjm/D3kU0KWHtmWKN6uHKVAU/kP5m4FZPD9nROyHIresVwykvE/dXt
	hbC+4moBFc3gkDO+lbOXSNHm0Ppu7c3tqH4emkoIwTINpJFhDusVsI1drRHlppe6sMhyeF0Vs2g
	Y4QA/vON+P9O72p3AdcDF4QPXjIZWLia65xJpVYgK6iUdNucDyNmKUiE77qfTrBNmIWQxbdTJUE
	DCBGnzynOy/qxdtxlxU5LF/8HTkjXV78uG57xY23VyORs/SrT7aDQxs3hPWlBiWSnxJWZ4F21dt
	cVsk/FbZBR7fXqZn8W2w0FDgq9w9zzhQ6jOqz5JuToQ=
X-Google-Smtp-Source: AGHT+IHZFUDG4I1s5mhjx5BD8Nhn984lVguIKOxIFYPolda1uofxljVhHU7U+dUntUauGH1gOLaGlg==
X-Received: by 2002:a05:6402:3491:b0:5dc:7643:4f3d with SMTP id 4fb4d7f45d1cf-5e4d6ad4170mr14262858a12.1.1741023065567;
        Mon, 03 Mar 2025 09:31:05 -0800 (PST)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b6d26esm7085355a12.20.2025.03.03.09.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 09:31:04 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.li@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250218-imx8m-clk-v4-0-b7697dc2dcd0@pengutronix.de>
References: <20250218-imx8m-clk-v4-0-b7697dc2dcd0@pengutronix.de>
Subject: Re: [PATCH v4 0/6] arm64: dts: freescale: imx8mp-skov: switch to
 nominal drive mode
Message-Id: <174102306220.2928950.8878245519332562153.b4-ty@linaro.org>
Date: Mon, 03 Mar 2025 19:31:02 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8


On Tue, 18 Feb 2025 19:26:40 +0100, Ahmad Fatoum wrote:
> Unlike the i.MX8MM and i.MX8MN SoCs added earlier, the imx8mp.dtsi
> configures some clocks at frequencies that are only validated for
> overdrive mode, i.e., when VDD_SOC is 950 mV.
> 
> For the Skov i.MX8MP board, we want to run the SoC at the lower voltage of
> 850 mV though to reduce heat generation and power usage. For this to work,
> clock rates need to adhere to the limits of the nominal drive mode.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: clock: imx8m: document nominal/overdrive properties
      commit: d5992f1af1550a9e11e42cfa2ca1ad2a1b7fd7f3
[2/6] arm64: dts: imx8mp: Add optional nominal drive mode DTSI
      (no commit info)
[3/6] arm64: dts: imx8mp: add fsl,nominal-mode property into nominal.dtsi
      (no commit info)
[4/6] arm64: dts: freescale: imx8mp-skov: configure LDB clock automatically
      (no commit info)
[5/6] arm64: dts: freescale: imx8mp-skov: operate SoC in nominal mode
      (no commit info)
[6/6] clk: imx8mp: inform CCF of maximum frequency of clocks
      commit: 06a61b5cb6a8638fa8823cd09b17233b29696fa2

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

