Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4B5418A26;
	Fri, 17 Jul 2026 13:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784296627; cv=none; b=HHT/XyauUi+gtZwP2SVYZmE9rj8/gPAeginJV0A+tEITr/AcRMktM/eY5Rlaf1Yb61N9jmdY36Xu71dhrezqsnMgLUlwtFMnVm/HPqMyMpzsKsCHtcAvIVtBC9nt+cQDoEdWbu9hP3PqggL0Tk8EtdnEislDBzyyHZW1kmqydkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784296627; c=relaxed/simple;
	bh=tRo01ZnsdmaBUcxgfoPvFM50N75wI5GCSHmXDK+EO7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJs45PY1FU58Iv0vtjzJVCiLgMhESZ8XKhVMuv+e/hQXQyLHPPPx/GVdv1KNwxg2u7qapG5d6+oS7CEh+IKSYJpiZQwJoHjy0K6gAQqzRsWF7exSLd2TX51PPEG1BD2OSe+8kMr68rEPQDoo46BEgk+TUz78XkISYPltjFS7eCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DpXp5xnv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DpXp5xnv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7781F000E9;
	Fri, 17 Jul 2026 13:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784296625;
	bh=FlVXC7W3Skpm9RYAW4sywASWkvrDuQ/ggS7YvWhRR1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DpXp5xnvOcGSK/b59TJd3pGVfNvqEa33XLlHCMM5tXbEJzi5jlLVuUYm0wPqAwVd7
	 Hq9lJjV4HVhyMaR/PGmEQaWskAQTqr8jWXaPl5KAw+xLKB+OCNh/zevrb1mUY4h+MO
	 8Nk/hzVwZ7FPx4MokAZn2CrpZS4ZIQLKVt1brZxC7nUDdZDnctRfm7x29CtbFL1/c3
	 iWbyfKIjK5z/eHkH5zxJXYQDZFUqc8YpoMMydLExEXqDGgBbVrcg3Q3Ce5va2p7a5O
	 yg2qdWick+4YI3M5aAwSHDjz1t5ch3o8nGaeOprYG0gYxVaqKwKw5Fre6h6sh7F/Lz
	 QoQ4OZt8Mu7EQ==
Date: Fri, 17 Jul 2026 08:57:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	vladimir.oltean@nxp.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: fsl,fpga-qixis: Add fsl,ls1021aqds-fpga
 compatible string
Message-ID: <178429662426.549410.11088440756266736676.robh@kernel.org>
References: <20260708-ls-fpga-v1-0-06c8a099b2a5@nxp.com>
 <20260708-ls-fpga-v1-1-06c8a099b2a5@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-ls-fpga-v1-1-06c8a099b2a5@nxp.com>


On Wed, 08 Jul 2026 14:55:13 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add fsl,ls1021aqds-fpga compatible string for ls1021a qds's FPGA on board
> controller chips, which connect CFI interface.
> 
> With following patches to fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1530000 (fsl,ifc): board-control@3,0: 'oneOf' conditional failed, one must be fixed:
>         'bank-width', 'device-width' do not match any of the regexes: '^gpio@[0-9a-f]+$', '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
>         /home/lizhi/source/linux-upstream-pci-ep-arm/arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1530000 (fsl,ifc): board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
>                 ['simple-mfd'] is too short
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

