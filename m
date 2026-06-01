Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B0E8C1F;
	Mon,  1 Jun 2026 02:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780280164; cv=none; b=ZC/DXeXCCr/srGdysVZzO+y+BoqaRagwFG/omEjNbfk9TYCkcgJnlYHokFTM7W6JbHAzoLJ8o/FIwFQghznnrXS0oLEB/av8iYYMNr4M4C3fXFEG+Rol+enE0AYGol8rOnTzDXfzc4z557Kksu+bZvdgim0As+tU4bjcKxTenTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780280164; c=relaxed/simple;
	bh=A5vFJf9F57RdKxzETRxU//Pof2JOoHIwfKE7a/DnqRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6pfGCiAGhj6NBUVAkAmcdfN/oXuYDtSnJqjA3Q/AU5or2U8Sb5dF31dmF96FzkWCKk2Qit0H2nebco/Ex1tbTtSAK1BGD9W1fKd7DSXGFoyuTbiHUg0z9/P0V9F+YoObZcWXpOWv7fZSJw6SSM6jH4PifTcQsNTveG6IhHsQDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BgzRNauK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BgzRNauK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 050941F00893;
	Mon,  1 Jun 2026 02:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780280163;
	bh=yP/TRVjC/7Q9E9T3KmokV8Ki6NrjRZ4h0baPgK9eilk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BgzRNauKAd9kY/bAeTwLzMQaFgF1dSIweh7ys5pMWuiIQerJZF9XxyxTWVlhwq+5X
	 NQKUlO5n3hsLxbATQw0YgNf5/8niuKa6uzklYKLdKb16N62sda1KSST4CbLPb7J6UL
	 gA2UT0cXHWb+ogTQYjy8iCl+P+zflSSsXAvp9Ru1/hZyEjlAUB/pGJLXYSfWEVf1x4
	 Pt5Oj14jlGp931fYhNtvBLeCroyfwewEUxXYb8m2RTuhKhndXbURP6MM3NvZFm0fM1
	 3QfVYRtdzPK/S6eJdIWAqY2b2qbYKA2Ueyo9CFfmDhQ40o+bw9S39Io3+O/jpsjEAu
	 FgCThEsTkxI8w==
Date: Sun, 31 May 2026 21:16:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Frank Li <Frank.Li@nxp.com>, David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 1/1] dt-bindings: display: imx: Add television encoder
 (TVE) for imx53
Message-ID: <178028016047.3956673.12104802707727267478.robh@kernel.org>
References: <20260521193734.1496372-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521193734.1496372-1-Frank.Li@oss.nxp.com>


On Thu, 21 May 2026 15:37:32 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add television encoder (TVE) for legacy i.MX53 (over 15 years) to fix below
> DTB_CHECK warnings:
>   arch/arm/boot/dts/nxp/imx/imx53-ard.dtb: /soc/bus@60000000/tve@63ff0000: failed to match any schema with compatible: ['fsl,imx53-tve']
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v2
> - add Krzysztof Kozlowski's review tag
> - move fsl,tve-mode to required list
> 
> About cleanup 300 lines warnings for i.MX ARM platformi
> ---
>  .../bindings/display/imx/fsl,imx53-tve.yaml   | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx53-tve.yaml
> 

Applied, thanks!

