Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507A038D;
	Tue,  3 Mar 2026 06:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772520717; cv=none; b=SfVKG/hA7Q3GogqM51OWfLjevF4ajtiqYcl3+RATxfjQ9jCVZO6AVFioulPbPDL/8biM29Y13+B4zJVLLtrgPFZNbJ8oGMLDfmYRDgDJNKIpryQgm0UZe7VzFp3we/a5pyGbgZrrWCMeA9/pfIQxtFOGQzq2UgY38F1fKEuQ82k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772520717; c=relaxed/simple;
	bh=C5He0Shh3Nc4LenLLbkryUeH2KhCx1b+RL5r+ILGntE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYt1qw5/i8nc8BMoh/6kSTJxHRUGbXEJVpWrxi8xLkufI/WG+Vz1JONHP/r58XIEFIHre+qVuWhNP+TUoBb4EabMb//EVIe5hwLFsa3t4zPRszGBS4+3qdil9cfzZwVpoxhKEVsMfvDfRPdp8T9Cq+Wkc/o5D25e7Bvj8JsCHTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s7/Ye/30; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s7/Ye/30"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64ED1C116C6;
	Tue,  3 Mar 2026 06:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772520717;
	bh=C5He0Shh3Nc4LenLLbkryUeH2KhCx1b+RL5r+ILGntE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s7/Ye/30R2BX84QSrXsrPSwHTwm/VH++iQcZdGJGGxVnIt2PNR3ZGtyyZPxhheXxX
	 WYdAJtiq/OqUaItEyUT2Mmj9OmRiJmD8Vy9HlYJoCU9FZVvAKYFDh7RULL71tBOdn5
	 mZMpW4yfmv3N+cH419L/vsyODjFxVFXgeedLZoqr4Nyt3zvN3XkDo1uxNSCsE225eZ
	 tgoLmp/vY/wlbumZ3ucP7QybJgZhXtNNuIp32XWXRr0ITtNv4JB5iwleVf33hnAnwI
	 saWE1uzRBcVeShX4U7Y/C2ZtzmyewovFJnQPSwiL8Jas/Vfq5mm7ikWxYr/AzNbHHe
	 ixkJzWCjAu2Sg==
Date: Tue, 3 Mar 2026 07:51:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, shawnguo@kernel.org, laurent.pinchart+renesas@ideasonboard.com, 
	antonin.godard@bootlin.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH 05/14] dt-bindings: arm: fsl: add
 variscite,var-som-imx6ull
Message-ID: <20260303-hospitable-cordial-smilodon-af6300@quoll>
References: <20260302190953.669325-1-hugo@hugovil.com>
 <20260302190953.669325-6-hugo@hugovil.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302190953.669325-6-hugo@hugovil.com>

On Mon, Mar 02, 2026 at 02:03:41PM -0500, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> Add support for the imx6ull CPU variant of the Variscite concerto
> board evaluation kit with a VAR-SOM-6UL.
> 
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

