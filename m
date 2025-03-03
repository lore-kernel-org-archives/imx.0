Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C8C214A60
	for <imx@lists.linux.dev>; Mon,  3 Mar 2025 17:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741023167; cv=none; b=Rr3DLirDtl1Bu/8D9sGc+pkPPF1XoiBMhu/W6OrYxbea8PvmBWNxH9XYzz1D4xUkHoTWNpL3k2qtRsI4HJ60UVf6OM7drRKSQGgjGT14s8UZn1znlMgS/4MqiCYM4ryl+jY575FkCEUN7WF2yTtRp3ijZCd7a/WOWZlvh2udHYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741023167; c=relaxed/simple;
	bh=3M7BlSm/KhV3uvgWvgNvRYmy6Y1rGKPzZoOe+NOLyeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pef753MecQglc5LEPKWnEAEnadZKymaEoTGWf0i81dKnMJZ+vVsYzQl+B9AEHic6jVE4va5MzlwV97dJYzFOrtKmaXrqD5eCcV1InU2WweY7BxlkBgRtAIWOkPHrMIElXJWbqy3r1o+VBkfp8m0joMl4jZSXuuHYwUnzlhyP4yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XPbKoJe2; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XPbKoJe2"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e0573a84fcso6521717a12.2
        for <imx@lists.linux.dev>; Mon, 03 Mar 2025 09:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741023164; x=1741627964; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ/4qxzis310JPKxwHfUD3sy7Z1En+4L5qdqwXsp4Gc=;
        b=XPbKoJe2BK5qbPE/yCMeTwin1FvV+XUQnSCtdyIJzYt7rd3ejyQvorgorH+3MKXhWn
         5s4pOQ7PMkHm7NPgf9spj39oxc9jzq4maYlkR7ukK7fZDyMn6DyHP7OpjuOUxZ33sCHM
         xRuRA5npsC8/vKyGoDQbhCqxQ47Rf7kjZJKaksyyjcWkoDZmKd9MOai5Wgehip6/JUPz
         AtVmejxXhuQ9CkAlQPyKQSKINC1VB9JvmeOAmmkbKKloj5cO5h5NhmPC37zo3k6rxfaD
         Gqa3bfPmqQzNVRPX/2wGqe5ycrQDOOImASmXNYcuNMkXQiNHpm4y1HVB1qE/I3J6Ypc+
         yr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741023164; x=1741627964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZ/4qxzis310JPKxwHfUD3sy7Z1En+4L5qdqwXsp4Gc=;
        b=MxCQliIAsUnxRBZTqhGj6y0x+a3tEr/cCWlbS/g3K0+oZ9yfoHDnAX64pDlBO3/bfA
         TLrKhFg8iIhx8U3s+HdOTpX3RnL3QKCMYFfi+j8fhjB0PtSEUfGYiewPKC/Fg2dZE/6c
         jKvMQQvRv8q6HNUgoctbSe29ztfc4wku/UKkPo9TbHSh4NlnOgi4Y+CtHsocSS+cxr5Z
         36zJ02mI9Oz15UY9RKWYEZfZa7z430TkL0Bn5biDCoVrhGg+ePLutwTEiokN24wi95FF
         D9F1iJ8Xb230zTcNXIyJE+f5zcoMwNS+cGgYUGcZ0znNqjt/C1mbaqbRZBl/stBgWflV
         NfEg==
X-Forwarded-Encrypted: i=1; AJvYcCUydOQZPd4X19CSwO5MuNdkA1xalmiupDlwCGY2/t1axakWdTGt6cCw4qef+buehEcAQZA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxiylNDauvWUhJKet4EeaXxSpm6/Q4j3y3mo6sbdMxOxNfOVXPT
	XDLaZdDDPDOT3VzF2i7btV5AiyQTon5WlJJEp3lFk4f9W9bKV3v+23GJQ4wQO2E=
X-Gm-Gg: ASbGncvt9VzjP7m72Lh6PL6hTiqahewAESukD3w57kHfRPCzZgTNWgxCNLLdp4UmHUG
	WqM27zc2oAbhj39eCjGrApVdNvajFMDGsk4cCXshXtWwZPuo991O2wJ+cJB03ZLcQ0elGaKfpmP
	by34Cy8j8ADT3JEjtKEYA2TB19fjwWds4aAPQ1n64YL3S3O2mpw8mXg+ASOp/x3QJzBCGZjJ10a
	vIrhsRDJUbXWVbESHhq6v9Tig+jJ6MoBzCAO84HafX+tko6ZYHgC2X8wRV8GXvpbHOUXAMewF3k
	uEicqB3LXIBdcaLHVn1uYdQzHNeLT9m4SvcQ+WkMbg==
X-Google-Smtp-Source: AGHT+IFplOERSX9U+E9Rz8azUp8fETio6bPVPJ+92Yo7dBFoDZjtI8Gwjb0JWHGO53dujJ5eWDY9Fg==
X-Received: by 2002:a05:6402:3506:b0:5e4:d401:590a with SMTP id 4fb4d7f45d1cf-5e4d6ad4209mr13888763a12.4.1741023164183;
        Mon, 03 Mar 2025 09:32:44 -0800 (PST)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4cc6b2daasm6666153a12.25.2025.03.03.09.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 09:32:42 -0800 (PST)
Date: Mon, 3 Mar 2025 19:32:40 +0200
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
Subject: Re: [PATCH v4 0/6] arm64: dts: freescale: imx8mp-skov: switch to
 nominal drive mode
Message-ID: <Z8XnuIIfDFykrKH8@linaro.org>
References: <20250218-imx8m-clk-v4-0-b7697dc2dcd0@pengutronix.de>
 <174102306220.2928950.8878245519332562153.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174102306220.2928950.8878245519332562153.b4-ty@linaro.org>

On 25-03-03 19:31:02, Abel Vesa wrote:
> 
> On Tue, 18 Feb 2025 19:26:40 +0100, Ahmad Fatoum wrote:
> > Unlike the i.MX8MM and i.MX8MN SoCs added earlier, the imx8mp.dtsi
> > configures some clocks at frequencies that are only validated for
> > overdrive mode, i.e., when VDD_SOC is 950 mV.
> > 
> > For the Skov i.MX8MP board, we want to run the SoC at the lower voltage of
> > 850 mV though to reduce heat generation and power usage. For this to work,
> > clock rates need to adhere to the limits of the nominal drive mode.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/6] dt-bindings: clock: imx8m: document nominal/overdrive properties
>       commit: d5992f1af1550a9e11e42cfa2ca1ad2a1b7fd7f3
> [2/6] arm64: dts: imx8mp: Add optional nominal drive mode DTSI
>       (no commit info)
> [3/6] arm64: dts: imx8mp: add fsl,nominal-mode property into nominal.dtsi
>       (no commit info)
> [4/6] arm64: dts: freescale: imx8mp-skov: configure LDB clock automatically
>       (no commit info)
> [5/6] arm64: dts: freescale: imx8mp-skov: operate SoC in nominal mode
>       (no commit info)
> [6/6] clk: imx8mp: inform CCF of maximum frequency of clocks
>       commit: 06a61b5cb6a8638fa8823cd09b17233b29696fa2

Applied only patches 1 and 6.

My b4 setup messed up. Sorry.

> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 
