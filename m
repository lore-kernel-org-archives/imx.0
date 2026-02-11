Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B216A31815D;
	Wed, 11 Feb 2026 22:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770847601; cv=none; b=ruFs6quRyQPtuo2ouXTBnMCijUVO+IDfsQcDtLx+/fX9opsM/DyJXGLFkl7PPp7534Pg86iY/tsPo2crtFhgPHknjiFQLKFE9ttwdce9+urQn1WyJqgKmjQDU1OkrODkTjKlBfA9hzgMXqIahnJSZdbYEpakNQ8mKQmFtIMscLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770847601; c=relaxed/simple;
	bh=3cqHJl/1uA6t/SIESkJGSB05Ihy6w0r2cxN0FHOjukM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0bp/aiE8uWOZeCXMArDcHg0PoMANCFq4wd2m2z1RsggNZwQBivOWR/+PDKSuU7t4JBTMcDx14V8crSy8CagDn+8k8/BffPq5bF0Vd5ieqZhsW0gYxRvol+FUDSlqlJwfbFFoGdu8INmlATTiCGyEP0sd3ZRi06z8GQuKdSfyzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ffIzkTsA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ffIzkTsA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D99C4CEF7;
	Wed, 11 Feb 2026 22:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770847601;
	bh=3cqHJl/1uA6t/SIESkJGSB05Ihy6w0r2cxN0FHOjukM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ffIzkTsAeE4chBfMhbAUwI10kdgxScHRI/p6YywmRGaVtCIURafR6vvKvyC3b1EQA
	 QM12uf0VWuA90lhe+ihdWQVhN9WX69lDujEzqrPZ4UmtJF8sR5xXMW5x49RQc/Y4nJ
	 J93kAS7v+cR2Jl3uh1uZQP6uhkJAlMFTuvNZs2tZN315CZfH04q4E1N9lnty1m0Pnf
	 evh+CHeAepcgCBcJZWnyKso52GZ1vjJlEDnEpPmE1YEnHEKNnP7bUcakzsj1siKPly
	 bVMX9bTUCfvesrFFr/tyboztWgxyBarFXbOI+Xe9mlsByjxDO/TUMosCYKxfbfqBY9
	 PIQ/io0P5Rxyw==
Date: Wed, 11 Feb 2026 16:06:39 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Joy Zou <joy.zou@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>, imx@lists.linux.dev,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: dma: fsl-edma: add dma-channel-mask
 property description
Message-ID: <177084759873.3973046.826103980569808616.robh@kernel.org>
References: <20260211-b4-imx95-v2x-v4-0-10852754b267@nxp.com>
 <20260211-b4-imx95-v2x-v4-1-10852754b267@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211-b4-imx95-v2x-v4-1-10852754b267@nxp.com>


On Wed, 11 Feb 2026 17:28:24 +0800, Joy Zou wrote:
> Add documentation for the dma-channel-mask property in the fsl-edma
> binding. This property uses an inverted bit definition: bit value 0
> indicates the channel is available, while bit value 1 indicates
> unavailable.
> 
> That was already used widely for i.MX8, i.MX9. Correcting the definition
> will break backward compatibility. This reversal only impacts the eDMA
> dts node and driver, and doesn't impact DMA consumer. Therefore,
> keep the inverted definition.
> 
> Also add a note at the top of the binding to highlight this inverted
> definition to prevent confusion.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---
>  Documentation/devicetree/bindings/dma/fsl,edma.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

