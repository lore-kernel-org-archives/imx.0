Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1910B28B40E;
	Thu, 29 Jan 2026 18:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769710681; cv=none; b=rlEjCzmmIJtULdRUU2bujO14IpAeZ+Dqo02rEmLBSGU/+k39l1oYfcWZPXt9YZyG6YKjWuRIsrqJITkoRtv/HAc4QhRNdsC5/ySmRkSE5kakoopNOaXMhBmBsd2XUE/J81NVK+zR18WbOrNywHgoIdidXTR/Efcd7es1CweX1jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769710681; c=relaxed/simple;
	bh=SAcQ/bmpw40uH4VH8bWJdp31ASTq8tWQB6is8ATklbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dli430o8HC2b0oO+XpgMULedpOJkPwlTPONv0axTLvr6KrWKpMRS+LREQn6GCMTQHitW5ZeWgR//CmsAfUp9aFGANJGaeuM5D0e+Fkr17p1BoubmO3VJu7qQ7ThcocsVB/YXr/LTa3sP8EeQB+ygwkqQlSeES4SDDedT8hBPct4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pl+b8Bx8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pl+b8Bx8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703CCC4CEF7;
	Thu, 29 Jan 2026 18:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769710680;
	bh=SAcQ/bmpw40uH4VH8bWJdp31ASTq8tWQB6is8ATklbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pl+b8Bx85WmBaZE+dMuCA9qa/uWVXY0HAj0BKaWDi9HtemQ+k5udGdtLooX9k0Ghg
	 OYnIWvnLHw+VCN5kpT2KVaAABUmQbJsLvK2rzI+hWJg634Wu2zdD4wX4ZiRXoJnl+y
	 hGca/wJFeP1aDWHvJK/XnmENjl60+er+2o8Ilv3d6m5epkOD8649wp3kI8zv9Ev+nP
	 divV4d1H3lF93um2qG/ByQn3dSDRPayVmKYfqC/QMXKYFl6Y9/y/9aAoHA735FA/ZC
	 HvDS6DXmdLmykq4czSfgagCPwYVUxUNSUQjSlXpd8uXDbgEUBf2Trmh/anE12lmGkY
	 zkGFuAjO3i+Lg==
Date: Thu, 29 Jan 2026 12:17:59 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Frank Li <frank.li@nxp.com>
Subject: Re: [PATCH v2] dt-bindings: firmware: fsl,scu: Mark multi-channel MU
 layouts as deprecated
Message-ID: <176971067833.1454686.17086963865281930203.robh@kernel.org>
References: <20260127-scu-v2-1-03f3aaa56e1b@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-scu-v2-1-03f3aaa56e1b@nxp.com>


On Tue, 27 Jan 2026 07:06:00 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The SCU MU driver has already supported the simple and efficient single-TX
> and single-RX channel layout since 2021. The older multi-channel MU
> configurations (tx0..tx3 and rx0..rx3) are less efficient in practice and
> not needed.
> 
> Mark these legacy mbox-names and mboxes tuple layouts as deprecated in the
> binding schema. The driver continues to support them for backward
> compatibility in case firmware publishes the legacy properties.
> 
> The example section is updated accordingly to demonstrate the recommended
> layout.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v2:
> - A minor grammer update in commit log
> - Link to v1: https://lore.kernel.org/r/20260126-scu-v1-1-b9d31da12860@nxp.com
> ---
>  .../devicetree/bindings/firmware/fsl,scu.yaml        | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 

Applied, thanks!

