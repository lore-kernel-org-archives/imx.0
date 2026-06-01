Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9505A26D4CA;
	Mon,  1 Jun 2026 22:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780353386; cv=none; b=JmFPbNFn728JFXL6uJIIBZrd7InJMrXBqm8G/9l2aTivOaNac8AjtUL7Fa+GSXrKbBdz4pPh2gHVb4hV0qLn/smpsgnNMtomz/MA25BoCz6cOze/Hw3uq52v47rEEqHmHwNueQRQpmVGmxZbtBVkuggxhzhP6N6PkAfUwyaevKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780353386; c=relaxed/simple;
	bh=+Ngmrq8Y97eR+c3I68klHbM5p54ZZk52OZGeeAQeivE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbTz+16Kb/GRG2RwyAp4T+sHV9sPuBUFdGXEV1ctJHsKLqU+9vbfcRATgVS6iQproVsgRwJ2oFn8cvHDvC6JiX91+OQYGMfc5zapbiZUfRf3CtZqs/cTtK2dfQfDuGfK9iPMmMmSmavKfP0h2Sd27y6wUkd9onAKLPTXCrUVyMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AIFho7F6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AIFho7F6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D141F00893;
	Mon,  1 Jun 2026 22:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780353385;
	bh=1gUUWqqYxTcbJn/JdPydY4F1vBSRqbIyTLimI9ChU/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AIFho7F6GmqCNrFJTVhUB5DEiwmGpVic3UL4bVqjqrDX1x+DE4xTRwkocrq555Q1T
	 DQJoy7nqNScmc53Qs3zBMTdXDPLCssf8Ihc0wTsUfwipIbnUn6RSBszqRrOd74kkCj
	 HOE/20asH58Npd94d0xlIdYHvzeugFRAVoAsoPOlT2ZFUP3AYOXdskeySLeXBKRgCD
	 eiMm31CH5kqkzu+RSELUv2RG4qgz6+s0SrmaO1bs4rq6H/cavIH5bhDcu/a5EU2HON
	 XwWN7t0oTOD+svGT7dtG8KygkEQ/gwkDhu9eA5tsbcY2JyEc+TBtNfHRJjFxLbxr6I
	 eijmc3QsNKMeQ==
Date: Mon, 1 Jun 2026 17:36:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sound@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Mark Brown <broonie@kernel.org>, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v4 1/1] ASoC: dt-bindings: Convert eukrea-tlv320.txt to
 yaml
Message-ID: <178035338386.115154.4712502706094039935.robh@kernel.org>
References: <20260515145205.1696584-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515145205.1696584-1-Frank.Li@oss.nxp.com>


On Fri, 15 May 2026 10:52:03 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Convert eukrea-tlv320.txt to yaml format.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v4
> - add minimum and maximum for fsl,mux-int-port and fsl,mux-out-port.
> change in v3
> - add fsl,mux-int-port and fsl,mux-out-port to required
> change in v2
> - Add comments about "The AUDMUX port numbering should start at 1"
>   v1: https://lore.kernel.org/linux-devicetree/CAEnQRZACes8EptdEgg0i0vzdcxgUJwZAfQHU0DEhMnXtA-g01Q@mail.gmail.com/
> ---
>  .../bindings/sound/eukrea,asoc-tlv320.yaml    | 61 +++++++++++++++++++
>  .../bindings/sound/eukrea-tlv320.txt          | 26 --------
>  2 files changed, 61 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/eukrea-tlv320.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

