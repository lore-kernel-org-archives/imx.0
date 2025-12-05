Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A8221FF2E;
	Fri,  5 Dec 2025 09:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764925322; cv=none; b=eYVNVwm8TLCKXVpCWZpxyISQiJ3LblmJNhSAn0GESP7Dwsy8VAaTWPdk4t1XGt+g9igE/cuDQHJKRybgjTioM/12uNTLoyKTlfdS2a1IDxuNwF07ZuiA0LZnFTWBO+pg5ipfhIx8mpyOfbYLJANcB5xOBTKvJjsjyA2pVHMe0eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764925322; c=relaxed/simple;
	bh=1tNBZQtY3oCs5M0ltVoHhKs1cSn4IkbJYPNY1Q0/F2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhDUbq/s/KrjW6hisxfn/9FT6sbdXLmpxw3jsXiiYQNieCiiCYLH4rSIqEXrNPAeOJ7QnKU0ZFyyDECAuDhgTNJU5K6xtdNc79NnHnX1PWnVssH4aY8F6g32sG4ZpN8evLxIKlaagJ/bRGTNmtWpZUcbggIeYpxp+n4dJGmokVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jeHTx1nf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jeHTx1nf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181ABC113D0;
	Fri,  5 Dec 2025 09:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764925318;
	bh=1tNBZQtY3oCs5M0ltVoHhKs1cSn4IkbJYPNY1Q0/F2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jeHTx1nfGok3GKapofmisslKWGkE4kDJzlJ0mq9SxLuktKDWaEDCG55iGLELlQ1wQ
	 dIMb6XK1k8D207aPXt5gIZ29CEi1/RfrR3GE9v14U0Vf38j5D1Z0gEzL5Yj17b3zrk
	 H8FmaM9gmvOwMXrFxPwxL/hwGe6kyT0G2hQmKZnlSg69QC/WSQIhqbSmHm6/AnanQr
	 cLcm5iOf46dWdLMydLbaFIFYZWGy5eVIDjYHSIEYXwRJYIDt3IQc6S83L4uz++5kV+
	 yixtbdsm+bQ2z2651RZcOanIZpXIWjUJywRFVP2yA19B4gNpsAE7yb4JNNAW6HPpkJ
	 dSAJ6o1KB42og==
Date: Fri, 5 Dec 2025 10:01:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: fsl: moduline-display: fix
 compatible
Message-ID: <20251205-futuristic-hysterical-salamander-dce94c@quoll>
References: <20251201-disp_fix-v2-0-9b03026311b6@gocontroll.com>
 <20251201-disp_fix-v2-1-9b03026311b6@gocontroll.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251201-disp_fix-v2-1-9b03026311b6@gocontroll.com>

On Mon, Dec 01, 2025 at 12:56:50PM +0100, Maud Spierings wrote:
> The compatibles should include the SoM compatible, this board is based
> on the Ka-Ro TX8P-ML81 SoM, so add it to allow using shared code in the
> bootloader which uses upstream Linux devicetrees as a base.
> 
> Also add the hardware revision to the board compatible to handle
> revision specific quirks in the bootloader/userspace.
> 
> This is a breaking change, but it is early enough that it can be
> corrected without causing any issues.
> 
> Fixes: 24e67d28ef95 ("dt-bindings: arm: fsl: Add GOcontroll Moduline Display")
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

