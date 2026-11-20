Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185532;
	b=VVFpQXjjCyIic/yf+p47kZBVp3B5xBNyJH6mf1G6Luob9NM/N6ahPk5bOiWOzEs41G2M
	 OdcikSx3sdBdz9BwkmKp8SFfOv0FHBETckrSEfQABIbNAxuZGFBE91e5J7fRwh9xN5dsJ
	 O87DiWkXZT9AJhHdpkCBQpSnCFLCQpGa1sKJH/RMwlbTSUyA9UaIOzCr1UNj589ZwKhSG
	 wc+YcsUQoU8+oFPDul1jM4bE7HvjNczNE6bg/dK7ljG0EUcTw1Xi6u1oRFOzbKJ5VnTJw
	 FWf0RPTWk1ASTkdRC4fPy08bjDVHICP89itkbJ0LnxkCjcmsueZhqXn0pcRiG5KNA6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185532;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Mg4tO9uvKi9Gwzh0PfSMjaKb+RogQEZ6WjO+Jsmx8hk=;
	b=BIUcM3J9WbDgI+xIWB+aiQU8/wcpY6F/uDLOYG4al5TTq1QSIHyiJFZVVhzdHn+6pJgR
	 UgeznJLUr5H3/bqSVXdQD0eD9hZ24u2HdutfbgLgN6bXlkDlSaNotFv6WdaNIGki+ZcKy
	 GxGj77a/EMASHs5vzaAZB9q6Y+pCHmCxv7/aTreIUUfMewc10hn4KNTtZVe8hGA/bcKk8
	 AQC3lH2pzdUIVhryTbywyEzIHRfnMxHyO/TjgYFwnOS51UHdwQog6mBFktcB7kW1gFW7D
	 NEFsEqhkfgNKfuubrtGHNxFOo7bjw3dFh7t4pVlWM5UpJ0IcCaXjI8IiXrw1d9ewCXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FTdQFNtp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51328606A331;
	Fri, 20 Nov 2026 14:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FTdQFNtp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD1B1F000D3;
	Fri, 20 Nov 2026 14:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795185531;
	bh=Mg4tO9uvKi9Gwzh0PfSMjaKb+RogQEZ6WjO+Jsmx8hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FTdQFNtpVu6zGOw4c+pl81NSiYbcDLna7/0xJ3TQeCLtJSY7Sfd1AIMDKt1tSVCXH
	 Y774gVMNcmIJgWek0APsIQqYa82ejrv7ac+ns2VQdN8+8rNvFJOO2uyAWGCKLoy5Fh
	 AiU+apX/F0EJci0LrF1vI6sQCHh54s6nHnqiTEIoaqMpyNMLAElGT1cHWYS5NOcylr
	 JcNijs5dg6nsjqCUT5W864+FtUMxprZMA1SoaDVCNWJZ8mEBDMtricr36oZY2kbioJ
	 pQhyhuTkiFzOegZSmVRZaqSoZrND9fFnHGfIM+AFvGpB2QnRXuOxRQC2bAIhlEo09H
	 0D41ONaNOO7Cg==
Date: Fri, 20 Nov 2026 15:38:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yannic Moog <y.moog@phytec.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Benjamin Hahn <b.hahn@phytec.de>, 
	Christian Hemp <C.Hemp@phytec.de>, Jan Remmet <j.remmet@phytec.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	upstream@lists.phytec.de
Subject: Re: [PATCH 1/5] dt-bindings: fsl: add phyFLEX-Libra i.MX 8M Plus FPSC
Message-ID: <20261120-successful-amiable-porcupine-cef7ae@quoll>
References: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
 <20261116-imx8mp-phyflex-v1-1-4adcf8b4d373@phytec.de>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116-imx8mp-phyflex-v1-1-4adcf8b4d373@phytec.de>

On Mon, Nov 16, 2026 at 11:54:40AM +0100, Yannic Moog wrote:
> Add bindings for phyFLEX-i.MX 8M Plus System-on-Module [1] along with a
> carrier board (Libra) that join to an SBC.
> 
> [1] https://www.phytec.eu/en/produkte/system-on-modules/phyflex-imx-8m-plus-fpsc/
> 
> Signed-off-by: Yannic Moog <y.moog@phytec.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 656f2596e1d53..2d21a1949d949 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1225,12 +1225,18 @@ properties:
>            - const: kontron,imx8mp-osm-s               # Kontron i.MX8MP OSM-S SoM
>            - const: fsl,imx8mp
>  
> -      - description: PHYTEC phyCORE-i.MX8MP FPSC based boards
> -        items:
> -          - enum:
> -              - phytec,imx8mp-libra-rdk-fpsc  # i.MX 8M Plus Libra RDK
> -          - const: phytec,imx8mp-phycore-fpsc # phyCORE-i.MX 8M Plus FPSC
> -          - const: fsl,imx8mp
> +      - description: PHYTEC i.MX8MP FPSC based boards
> +        oneOf:
> +          - items:
> +            - enum:
> +                - phytec,imx8mp-libra-rdk-fpsc  # i.MX 8M Plus Libra RDK
> +            - const: phytec,imx8mp-phycore-fpsc # phyCORE-i.MX 8M Plus FPSC
> +            - const: fsl,imx8mp

Except lack of testing, don't nest oneOf.

Best regards,
Krzysztof

