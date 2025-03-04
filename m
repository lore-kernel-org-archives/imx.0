Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646F21E9B28;
	Tue,  4 Mar 2025 13:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741093997; cv=none; b=BU3NJrzJ4aa4unebWOb3j5ErlGW2Q/LcE1PPDMzXkMJkw/S7Dxu7NiI0N+LlCydamvYaAdFUTX8cPgQXURQ0rQsgZ+iPF7+2ls/nFOMBhQp3V0SMPJcY4KuHYUphYHTEtbcAlONReKHjdv94NlJIILvvzcTHKxIvbah3RjrvtU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741093997; c=relaxed/simple;
	bh=fsADMD9lYuaMAbx3BxcPQB8mdRwc2qg5M7LaXTLNEIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/GOgboQtAjXq33kIeLhrdiEa9tcP0P59hkHgUw/u0Gdakwe9steZnHycQlXeXZ4l36FKPKoG8WfA3A8hz0ejfS1iNg41HNNK9Vj2Y/7Cax1DjpxWhLs+0oYEhqD5R9ECZTkfBfasgPSoO3EjRtrbD8ytwpbXDuQZao3VzxoJa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DwuXRMFd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DwuXRMFd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F921C4CEE5;
	Tue,  4 Mar 2025 13:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741093995;
	bh=fsADMD9lYuaMAbx3BxcPQB8mdRwc2qg5M7LaXTLNEIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DwuXRMFdGMXNPXdwKt7wTcT8iGPI3teyjyZPw5JUrgaJIWLPRiE4vnvito3yH450J
	 sRHo6hrvgyNC6pRI/3HkSx3rXbI3C6AbTLAntHRvVfHe5AtnbqXgh5p3aiVBjVmPLZ
	 OVhSI3aqUaFODNa3BN82v4d9V3rmfVu5weIkNTyFssFebcp3n8SxNl9TDvIr856VGQ
	 8YEzCFm8qUh9EN2z0eZ+tovSXtxPZ4StMHPPS5C7SHeKIVvjlJYRuuxte5/dlGyybG
	 VBf7M3oLZjWbHsk0i9etptjzEdoFedY+SXk8rYonRtt8ObkRrttO+bnsPeP7RED+Dd
	 PHGkL14s5D5dQ==
Date: Tue, 4 Mar 2025 07:13:14 -0600
From: Rob Herring <robh@kernel.org>
To: Jacky Bai <ping.bai@nxp.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
	peng.fan@nxp.com, frank.li@nxp.com
Subject: Re: [PATCH v2 1/4] dt-bindings: dma: fsl-edma: add
 interrupts-extended property
Message-ID: <20250304131314.GA2441686-robh@kernel.org>
References: <20250304093127.1954549-1-ping.bai@nxp.com>
 <20250304093127.1954549-2-ping.bai@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304093127.1954549-2-ping.bai@nxp.com>

On Tue, Mar 04, 2025 at 05:31:24PM +0800, Jacky Bai wrote:
> Add interrupts-extended property for edma that has multiple interrupt
> controllers used.

Did you try using interrupts-extended? No. Because either is supported 
by the tools already.

> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  - v2 changes:
>   - newly added entry
> ---
>  Documentation/devicetree/bindings/dma/fsl,edma.yaml | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> index d54140f18d34..549afb8611a9 100644
> --- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> +++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> @@ -38,6 +38,10 @@ properties:
>      minItems: 1
>      maxItems: 64
>  
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 65

Doesn't match the size for interrupt-names:

> +
>    interrupt-names:
>      minItems: 1
>      maxItems: 64
