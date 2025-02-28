Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3CB23E35A;
	Fri, 28 Feb 2025 12:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740745813; cv=none; b=BglA9MeTSB//JkVlcdJSQtDy7GfgpQSoIsm4r5pVsSqx5EGBlOc1yLYreBrS0glJre/v9uO/cNZ/BmA8ehtPOoHrDUzXWsy4mfTLkJ2p/Mn+8dGhxKVtRrKOOQOYX2o6jRc0ptudkMhr3YeYnkGVv43/2RZ6v8dc8nXLEirynFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740745813; c=relaxed/simple;
	bh=rS106VtMPb1KbJZduI0sp/CcUh0CsKV3sOXYVMNfj4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGaZ5O02RPTPfDIho3kh93qJHJ2S8kT17qYCHXwUdmIYBbb4LTWWmRGWtzu/BgyXiXXfIu8yxlWtcaf5V4781IHwg6NXbFVkMdoZS8VEtG71bqJ1KkL5dCBhku+JP80Sx6jqlMINvKall733T2QkjvGJXjgclbh0NYoDZ2y3138=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TOCQpJlY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOCQpJlY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8B7C4CED6;
	Fri, 28 Feb 2025 12:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740745812;
	bh=rS106VtMPb1KbJZduI0sp/CcUh0CsKV3sOXYVMNfj4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TOCQpJlYFxbd/ZR/kW+lCWGmgETx68IuB3zjrfexJbn9FlmIhomoD95s5psT0RImm
	 /JhE0P89cN9hHgSwukDIjAYhLXiJ8NocdJR1EcG7R+TE66VU+/op/b7PCzWZ3EQ2iB
	 bY9UwDSqoA4JRq3YyCIbD84nonSs7drvgWGWQliDvS6Q+lrUBty+IHEMK0kB6FumgR
	 4EAi30ZxVMWlvEXsynyiV1SkDUjed9hztalLRCBW9sN0FmgDsUscfAOYrE8zIBTVcf
	 dmo3wg86j5ctxqwRhZl984iz27LmdhHsEySxsfXInH7Ct9fRzThDBAqcPHIkbVOXi1
	 Fyv0rfyotqwbw==
Date: Fri, 28 Feb 2025 06:30:10 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: Re: [PATCH 7/9] dt-bindings: gpu: mali-valhall-csf: Document i.MX95
 support
Message-ID: <20250228123010.GB2321092-robh@kernel.org>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-8-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227170012.124768-8-marex@denx.de>

On Thu, Feb 27, 2025 at 05:58:07PM +0100, Marek Vasut wrote:
> The instance of the GPU populated in Freescale i.MX95 is the
> Mali G310, document support for this variant.

You should combine patch 4 with this one and make resets required for 
imx95 since you said it is required.

> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> index 0efa06822a543..3ab62bd424e41 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> @@ -18,6 +18,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - fsl,imx95-mali            # G310
>                - rockchip,rk3588-mali
>            - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
>  
> -- 
> 2.47.2
> 
