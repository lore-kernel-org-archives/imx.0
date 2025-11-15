Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9BF18CC13;
	Sat, 15 Nov 2025 11:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763207607; cv=none; b=PVh4WVNjbsKxwRiXuStN0V8ndxX+nqrgPGbFyg7chLH3AY2hgv40h4VNiOuLLZChUKPbq22pRJzVkbWgq1vJ5kLVKQz+e1QYjM7SX9gMQxTmKEnRR7Gg4TzD1usbLU5OteXlHjN4GaoAVmjjwkJvnyJxXpk4FfnJ/EkGhDGoahs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763207607; c=relaxed/simple;
	bh=D3IZQ41ljbOFBJR+0W2Ew4JgT55JZ3FTpbKG4ou+aYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mi/wo11hci7WW5NpUob5FrDXn4V6Uj4FZcqzC5SkGRhHqy5dqr4EKkvtSBsMupdrQXNZxcPBYu+3ilsuPGUrDq8FGV+2gCleiZMwwpWf6q6r3J4rLVU93t/+FI+c9IDa0SYzTUOw+C4F8HSC2jz1StoGnUBmC5PYsuSwsp/9Tns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pvrNxn6Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pvrNxn6Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F69C113D0;
	Sat, 15 Nov 2025 11:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763207606;
	bh=D3IZQ41ljbOFBJR+0W2Ew4JgT55JZ3FTpbKG4ou+aYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pvrNxn6Qpy0xKwoi/njFVhX6Stcy5YSXfgVxKasMFqqTquUDSBb01L6MVWBgV5idE
	 2UME7pZsFhH8loRYLEgySoF512XrFF6o9PUzYMiDiATwXIQ/RsGoWWwtsvww+Tqczp
	 bjyOL0Ol5gTlZiyKqx6uZ+9AtFXFhajfpTTpPGOKsBhs184Wihi3isW/c+ciyssJ2p
	 S5qf9OdoRiXGrjyxwD8Pt5PiRVZUvqFsT6DuM3tVleeOMjRZ0gBHe6Oh3KdRxSMHuf
	 q68e2Ckb1vF/jkUTzFNYy9TshLiTAzTEvRMhkHcoRt244oyxkC+d0VzgM+XpQuLQPR
	 dJOm64VufQraA==
Date: Sat, 15 Nov 2025 12:53:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: fsl: moduline-display: fix
 compatible
Message-ID: <20251115-liberal-lori-of-youth-a9c3fd@kuoka>
References: <20251114-disp_fix-v1-0-49cbe826afc2@gocontroll.com>
 <20251114-disp_fix-v1-1-49cbe826afc2@gocontroll.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251114-disp_fix-v1-1-49cbe826afc2@gocontroll.com>

On Fri, Nov 14, 2025 at 03:11:49PM +0100, Maud Spierings wrote:
> The compatibles should include the SoM compatible, this board is based
> on the Ka-Ro TX8P-ML81 SoM, so add it. Also add the hardware revision to
> the board compatible.
> 
> This is a breaking change, but it is early enough that it can be
> corrected without causing any issues.
> 
> Fixes: 24e67d28ef95 ("dt-bindings: arm: fsl: Add GOcontroll Moduline Display")
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 21b7168d61f5..8949a98acd87 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1105,7 +1105,6 @@ properties:
>                - gateworks,imx8mp-gw74xx   # i.MX8MP Gateworks Board
>                - gateworks,imx8mp-gw75xx-2x # i.MX8MP Gateworks Board
>                - gateworks,imx8mp-gw82xx-2x # i.MX8MP Gateworks Board
> -              - gocontroll,moduline-display # GOcontroll Moduline Display controller
>                - prt,prt8ml             # Protonic PRT8ML
>                - skov,imx8mp-skov-basic # SKOV i.MX8MP baseboard without frontplate
>                - skov,imx8mp-skov-revb-hdmi # SKOV i.MX8MP climate control without panel
> @@ -1163,6 +1162,12 @@ properties:
>            - const: engicam,icore-mx8mp             # i.MX8MP Engicam i.Core MX8M Plus SoM
>            - const: fsl,imx8mp
>  
> +      - description: Ka-Ro TX8P-ML81 SoM based boards
> +        items:
> +          - const: gocontroll,moduline-display-106

You need old compatible here as well, you cannot drop it.

I don't understand why you need board revision - commit msg should
explain that.

> +          - const: karo,tx8p-ml81
> +          - const: fsl,imx8mp

Best regards,
Krzysztof

