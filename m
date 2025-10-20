Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6718C2DFF18;
	Mon, 20 Oct 2025 20:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760992982; cv=none; b=X7MRM1olAOxA/ElOEjBC6Kbk+JQQyjjcRboEUhSb5jnlTxngJQd6L4n1Opj5fuJW7D1iZZibfoGMFpstma15EccTDXguYeZ2+Ne8E84qtNMcdC0EwYaNUfIQhKhVK1VH22qUAVPRSSmGY9TvwmHzlF0AZrnjVne59rckdy4y9xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760992982; c=relaxed/simple;
	bh=ICw2tymwdpgjAi7jhcPJWNLOmDSZpCZMN8Mq3WAbZvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fR6mDvQHzubP5ngIV1ojXlNptZSlaLJvW3nymaSBJLhd2vMw8nNTkO2aeEeq1hW03ecuk3MbIfvSXz2ixex2wIJVUSV2CTEEwWu8Xg+qkQUo07x7RQzIFm6/1tMhoFZl2NnBEvxtktHKaPq8632fJqKWvYVgZYczzeMvPMNrrC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R69E1IQL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R69E1IQL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A546BC113D0;
	Mon, 20 Oct 2025 20:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760992980;
	bh=ICw2tymwdpgjAi7jhcPJWNLOmDSZpCZMN8Mq3WAbZvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R69E1IQLHAg+VkCglHtQ7jfYYiZBlMH6G6VVr5UwKG2JKxJUnQmBoyYwUjYTjwpiG
	 LzbemwGnrE3WwwyCfneg3YNd9kdypNQxp6jCuPXO9ZLEDCAjIpxP+d/YLo9qVrVo9E
	 VuBIWlDPwi3BcL8735Qcg0NaoNrA4fxqyjGi1IvPBL8h9ceUt3FX8pK8GwOjmE6sTf
	 OZqBXL0sGjdkIeQUL/GNkcLBJ2r8IaZl5PEjyFWpy07/UPGgwJDLCJw96uAGDULfua
	 AceGo5xy4hfJtMc8BOarTUexozbSlCMzLbrZ+27NxvQBI+3lqD4a9Wqc5lnJBxp0Kz
	 PUK899RLlA1vA==
Date: Mon, 20 Oct 2025 15:42:59 -0500
From: Rob Herring <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Ripard <mripard@kernel.org>, Liu Ying <victor.liu@nxp.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/4] dt-bindings: bus: don't check node names
Message-ID: <20251020204259.GA1591976-robh@kernel.org>
References: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
 <20251020060951.30776-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020060951.30776-7-wsa+renesas@sang-engineering.com>

On Mon, Oct 20, 2025 at 08:09:50AM +0200, Wolfram Sang wrote:
> Node names are already and properly checked by the core schema. No need
> to do it again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> I'd suggest to give subsystems some time to pick this patch before
> Rob applies it?

Not really any subsystem for this one, so I've applied it. The rest 
should go via subsystems.

> 
>  .../devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml        | 2 +-
>  .../devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml | 2 +-
>  Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml       | 2 +-
>  Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
