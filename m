Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169CB29E0E1;
	Tue, 23 Dec 2025 17:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766511222; cv=none; b=rq9almBaV5Q2AlqEIluGIzxOlEwuUggWSZ55nHwLJXgkc9QzhlpWdB/tqiiEngU+9V/w29IEXG3WyG3eV/Yq2re0Wl/61ff/lQ4hYqK/UdHFWIzkq49c7AJ09qISfhDtwN73+HDHEVRGeiRDGua7BXLMeiGNbnauzTJz7sR74/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766511222; c=relaxed/simple;
	bh=m7HpFgNLV9TNM8Cr/q/pRPRVkPEEhFM+P9eE+IsCGLg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AeqFkZA10P5HJ9mPm8u28hXtcu7QbIcrfpuEcMtx1S+WrgZLjZEqGnNupZQUxrS8J4DEUB2XcaaHYeY0YtoqilFslzm/Ud+Fnj3kLaxkDV13Pmso/G7zo9xFNGayl7+/MxeErhM/FYiwShX1hwPJ86DqopjOhFsBQ8j6v71WXKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a63U1Y7t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a63U1Y7t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7633C113D0;
	Tue, 23 Dec 2025 17:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766511221;
	bh=m7HpFgNLV9TNM8Cr/q/pRPRVkPEEhFM+P9eE+IsCGLg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a63U1Y7t+uP3fy7j+j3rVDyF8Qn7Ezx49gZ3nu/xsZmcuw3nCyx6HRSf1y68qcUyV
	 uUUwYe1HZtoTP6eAX9UfKqsA2cNDXmUzj6Nq1tmHadGGWi5U/pPf9q44xU/ASjqHP1
	 Ytu/EEvTzvr1PvRhWdo6ZR/YqyYsURAC5a2QCPJ0yIgOilgEL/fiGKQRpInOY0Xgw7
	 e0qy9RNwP/xSTSgQM6jM2qpltSl7wWCFZO0nsvmOL1NUe0rXb1tHgEc1hitcNLd5Am
	 IR/2NFfbFtb9A+uRO+nMvcesIq7/r8xTNoGQCpxvB9ZS445mauauZYo+BaC9PFEe6I
	 4vSVXL78iZ4rQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Franz Schnyder <fra.schnyder@gmail.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>, 
 linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, stable@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
In-Reply-To: <20251126140136.1202241-1-fra.schnyder@gmail.com>
References: <20251126140136.1202241-1-fra.schnyder@gmail.com>
Subject: Re: [PATCH v2] phy: fsl-imx8mq-usb: fix typec orientation switch
 when built as module
Message-Id: <176651121758.749296.4271020306636125527.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 23:03:37 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 26 Nov 2025 15:01:33 +0100, Franz Schnyder wrote:
> Currently, the PHY only registers the typec orientation switch when it
> is built in. If the typec driver is built as a module, the switch
> registration is skipped due to the preprocessor condition, causing
> orientation detection to fail.
> 
> With commit
> 45fe729be9a6 ("usb: typec: Stub out typec_switch APIs when CONFIG_TYPEC=n")
> the preprocessor condition is not needed anymore and the orientation
> switch is correctly registered for both built-in and module builds.
> 
> [...]

Applied, thanks!

[1/1] phy: fsl-imx8mq-usb: fix typec orientation switch when built as module
      commit: 49ccab4bedd4779899246107dc19fb01c5b6fea3

Best regards,
-- 
~Vinod


