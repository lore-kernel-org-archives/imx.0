Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011961A0BD0;
	Thu, 11 Jun 2026 05:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781157079; cv=none; b=ohbAuxfrR9jT/tyWFF9HGK+2e+ayJ8ZUXEKZOVcTWZDt/CgnXdnfyRNLg2UMt/gsJPnL9ka8HU6y7U6qM8fnm8n9DAI/UFGjgelD8r+rJL5Bsb+eVbpxYhTF4uUAs0nDsBshu6WrBoJzmZuhhUNQZ2kKd8qUzV2TpEqWkWcHPTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781157079; c=relaxed/simple;
	bh=lWmvqh+4cHDVAXkHFCtWF9PTv/whSNrvB4Ozcvf1YL4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gedx+yxH0LgrSGE0/u0LRAPNudZvxGizKWnouOL9qxDECceheRotM5SO4/S1IX83z4Js++4qsdPPoPc2LdVUAh4RSmBCqpv2WQEAmir37sIxgVXMDMA1jyQo9h00RK9Sn5TtQsbq9GfX80bNbe3U7GpEaNWEN5O06UEj5sHjnTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TvoNd8jx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TvoNd8jx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620D91F00893;
	Thu, 11 Jun 2026 05:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781157078;
	bh=DfAXXx1CJ6TSjqeW+mrfldmHh9X0zU0bdX8mXNm+FG0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TvoNd8jxPrFVrI2JGUDycYfwOPfr6PlMZSRBoAqNUDx1sQIfP63vVTszEqZiQORlt
	 UR4zOSK1VG9t4aASu1bH6yXYQfXEINJyHICHrE3UXXrkTjG9FAdKX7FHHa3+mYsYcW
	 xluOuxNuE4VjTGK6JyhuBXLDRH7pLIs0BynE5Ag7aEYo3PrrmukhruT0VazRVLvgy3
	 D+5M55gy8SRQ+eJ4je8bR747BHFOkWTwzn/QjN34o/tG+7D5D5uQcmmmJn++3Zd4Sr
	 qI7ddCHHqzXJ9bE+3M7rpl2xBbq3wIWP0RtHlzMOjVregzUxE0koBX9afi1GCnZdkI
	 IAvmdt0YB9flw==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>, 
 Joy Zou <joy.zou@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
In-Reply-To: <20260211-b4-imx95-v2x-v4-0-10852754b267@nxp.com>
References: <20260211-b4-imx95-v2x-v4-0-10852754b267@nxp.com>
Subject: Re: (subset) [PATCH v4 0/3] Reserve eDMA channels 0-1 for V2X
Message-Id: <178115707400.468137.2385832019756326414.b4-ty@kernel.org>
Date: Thu, 11 Jun 2026 11:21:14 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 11 Feb 2026 17:28:23 +0800, Joy Zou wrote:
> 
> 

Applied, thanks!

[1/3] dt-bindings: dma: fsl-edma: add dma-channel-mask property description
      commit: 75b28d74f90c79e788e0e86caf0173fc0b2e92aa

Best regards,
-- 
~Vinod


