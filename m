Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4886018C008;
	Tue, 17 Dec 2024 06:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734418590; cv=none; b=LtId7rCDxGEriksJeKAKYAJqfA/hzm+YGQnvzeOEfElJ8IB7BBS6L+32WqX4UrEs/g23b0m+GAdHqeVWyQXaaDpeTrJ5teOnyy/TjS+E88PCO1SIuVqbsFUXkf0Hjg5296LeIRE68dVs3Q0Dzt+EC0DlBTRHvkI06seXNt483Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734418590; c=relaxed/simple;
	bh=FCSExKI+sgfvXIQDvMbcaGs6YRB5dHmX79mWUjjc3eA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=osaPNcXG5b/JDH/oGnvwk/X0sOLTGqsI0Zu20m3kgoHkoBlFhkvFgm9R0+fztb2DIy7o6JWXU3pp8mmFa3Yvz3BCSYecDlczQogcgGi6f1JZfNEmmypv6TG+DqJ80LZlmGLc5ZEMr5HlfscWkW23bYKfwLSN55iNro3FA1wujaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFfO8JQg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFfO8JQg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C729C4CED3;
	Tue, 17 Dec 2024 06:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734418590;
	bh=FCSExKI+sgfvXIQDvMbcaGs6YRB5dHmX79mWUjjc3eA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bFfO8JQg3wxopxrXFvL6Gw3ZPLinopI5zBctBetd4wKhWw4eaY+ogB5PbWvBlVwg7
	 C+LjxWNxzudKW61+tD/qQ8wNTzA/bmYXcSRH1fSIl/FFtOsfEnQeYT2+fyyl56F+mu
	 zAjaF91teEODc4HFMIzFCO2XgYn+AgG/C6QWao0JlVgeiDcmaswLwgA+f8soTbzMTG
	 gr4E+DFIx56etk80NP/eZ5bVd+7XLvFzXmxpKgGidL8SWD+QRejrM2nVpoi47qVzf0
	 kwZFYMyJnLlJIF7RK83pxjEDSP+caRx+8DrAKcTDN1VBMTng9RB94vt2vxwW3ACyaZ
	 gXaGfW0W2eQuQ==
Date: Tue, 17 Dec 2024 07:56:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Takashi Iwai <tiwai@suse.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Jaroslav Kysela <perex@perex.cz>, Frank Li <Frank.li@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] ASoC: dt-bindings: support imx95's CM7 core
Message-ID: <jwhjz7a7spikaj3sgrpqqt5deygeedspz4iar7h6tofadk44nr@ytl7dnnbcrom>
References: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
 <20241216145039.3074-3-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241216145039.3074-3-laurentiumihalcea111@gmail.com>

On Mon, Dec 16, 2024 at 09:50:36AM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add binding for imx95's CM7 core, used for audio processing.

Adding common binding and using it should be the same patch, for such
relatively small bindings.

> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../bindings/sound/fsl,imx95-cm7-sof.yaml     | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml

...

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    cm7-cpu@80000000 {
> +        compatible = "fsl,imx95-cm7-sof";
> +        reg = <0x80000000 0x6100000>;
> +        mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
> +        mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
> +        memory-region = <&adma_res>;
> +        port {
> +          /* SAI3-WM8962 link */

Keep consistent indentation.

> +          endpoint { remote-endpoint = <&wm8962_ep>; };

This should not be one line, but three lines.

> +        };
> +    };
> -- 
> 2.34.1
> 
