Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F3B32694D;
	Sat, 17 Jan 2026 05:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768628117; cv=none; b=RPjuXwD9NLatWFoJg9RY7mOkSN88bCM8X5LkZnNVR63s2is/LHS8/9u1PS7GIqciqnJE43h522t8hcJnWafSqMsiRSMix/eMgAX172xPXvQkAY7loenxf6qa+KnyB8GctB2w5xyG2sC8C53LKbmCIWFcZkYiZeOQW75Pj8GSMvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768628117; c=relaxed/simple;
	bh=ceJeR19228xDyeAf7C6ytS7EXYJ6ms0mb5AIMVr7rVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nX1grPcnJjqGMzr/FwJuaHZIeJLUNL6Bsn0R6/asxlnKgsVKJ+jL99GeCWZ0y2DEKamydZNtMUJegisTf2SXUjbGTo9Z6URJBcnc6ijTxy+nKNFRA5+S1emc5QNf8XzyZbsTVqb6doYr8toij53H0y5/p3y3jBOuHgGBVcl2EeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GjcOSWVI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GjcOSWVI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4074C4CEF7;
	Sat, 17 Jan 2026 05:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768628116;
	bh=ceJeR19228xDyeAf7C6ytS7EXYJ6ms0mb5AIMVr7rVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GjcOSWVIRQ1clNcdTf12UnxA2dLkPUV6bd8jHSggg3bYjltwQY6EgMzkO/wo7ofv3
	 Mc7+T4A/1R6lMhetZrejlNY2J5oVUsaSKaQKvGlCb7z/SUqCGPUbXAHDTMEBfYfVZt
	 e/sebQmpYqjhrfvxuRPPZua0O8LyDAoHV7RUqn5oduU0FIO5yS/GHf/Lr7rDcoXbij
	 BQhp+u2kwv4xfMBYIoP2OSa5t0qbumXrsILxU7LudZqp14zwwUTf9UnDjXmyUdoNIv
	 +I1FXS9aKFRmQ5Zk5WTHhHXSkxChrS6WqAcAFZBFbyXyJXqtyIYCrBUivJtuEJ/0Lp
	 q7ifkYnt7O0PA==
Date: Sat, 17 Jan 2026 13:35:09 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rain Yang <jiyu.yang@oss.nxp.com>, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: imx95: Use GPU_CGC as core clock for GPU
Message-ID: <aWsfjTMz04r07bEU@dragon>
References: <20251129143220.14834-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129143220.14834-1-marek.vasut@mailbox.org>

On Sat, Nov 29, 2025 at 03:31:30PM +0100, Marek Vasut wrote:
> The i.MX95 imx-sm introduced new GPU_CGC clock since imx-sm commit
> ca5e078833fa ("SM-128: Add clock management via CCM LPCG direct control")
> which are downstream clock of GPU clock. These new GPU_CGC clock
> gate the existing GPU clock. Currently, without clk_ignore_unused
> on kernel command line, those new GPU_CGC clock are unused and the
> kernel will disable them. This has no impact on i.MX95 A0/A1, but
> does prevent GPU register access from working at all on i.MX95 B0.
> The GPU_CGC clock are present on both i.MX95 A0/A1/B0, therefore
> update the DT such, that the GPU core clock are the GPU_CGC clock.
> When the panthor driver enables the GPU core clock, it enables both
> the GPU_CGC as well as its parent GPU clock.
> 
> Fixes: 67934f248e64 ("arm64: dts: imx95: Describe Mali G310 GPU")
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Applied, thanks!
