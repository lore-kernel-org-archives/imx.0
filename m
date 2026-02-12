Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19773446CB;
	Thu, 12 Feb 2026 11:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770897051; cv=none; b=ns37Lbme9tBbREqNOW2QmAMIb9orx+iYZa8FfYZZ1XpHeavqVNFvWj5W1EXIE34A5Ha/Z/se2CfYSh2MLA3y1vozU7sYqSTMEVll39qYyX8YcZpiQRIco3ljFVUEgxEeBeHwMW+HbxHpatrEQQFmbLhzif1HRSgVcaLcFQNLVpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770897051; c=relaxed/simple;
	bh=+mExdPYywevcvTVMOl/PdDwU0c7GmCCHMXPzvVMq6UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJt7jslUeIumHYdPISQbKeOnlVXiP35o56RkVl5te8rvep2NrUMiLdP88R0hnbBghzsuetfN+cBclEX/CyRss/tZ9CFIG2WXUqcKJu7Z+99tcyOIbH2StJYkoxwAZqOXle0WZZCtouW6v37mEpDzycfjt3t8eXlxA15nJ5zpjv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gfhq4X7N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gfhq4X7N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0827EC4CEF7;
	Thu, 12 Feb 2026 11:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770897050;
	bh=+mExdPYywevcvTVMOl/PdDwU0c7GmCCHMXPzvVMq6UM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gfhq4X7Nd2ol8tYyzTSAp2DJsTjXTg6NnzF49nXm3CiqnOFg1D2UnzKsMukVc2hfJ
	 43rlm9JVEo3sHFFZVAtY6C/noH7tpJjK08akCTRD96BwRkoXeKnBlYXpi6vvmxpOD8
	 aueMn3LZZL9bu6msxr0L42nI14XyVazKBQisY4vxk+1MFhEGB67lbTmv3FuMVohhqP
	 GtCXa+afth+5xWL6xOanccLURNOl1tCVVEXZXdaK5/phYSN7FJoY6VBRd1abG3ENuI
	 ph8AUknVr9XyW4Nm0TYfyI6SyQ9VXfbHn4Zufp7fggTtcrkZnPaLPL4M9V/Pl5+bJm
	 deWCG4G8K3j/g==
Date: Thu, 12 Feb 2026 12:50:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/1] dt-bindings: timer: fsl,imxgpt: add compatible
 string fsl,imx25-epit
Message-ID: <20260212-vengeful-pretty-seriema-9f6b74@quoll>
References: <20260211214947.3705328-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211214947.3705328-1-Frank.Li@nxp.com>

On Wed, Feb 11, 2026 at 04:49:47PM -0500, Frank Li wrote:
> Add compatible string fsl,imx25-epit to fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/bus@53f00000/timer@53f94000: failed to match any schema with compatible: ['fsl,imx25-epit']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

I see you are preparing for the next LPC status of validation :). Nice!

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

