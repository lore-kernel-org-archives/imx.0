Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D6E126C03;
	Wed, 22 Jul 2026 19:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784750211; cv=none; b=jwGpq3OITXsqDMbO9Hps+YRJsIyZ2Agqtdj8SzgbFrn1H6LPRQi941eGGInmp5wOeOan3lk0mBKi4AzPs9o06JegxqRFZSTScLKn63v0gvP7FPTnxKu2fgZzO/ecwASwgXT42Pk9W+y9cYbfYkfEGx+D7TuhtLMbn5VbXhrgUrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784750211; c=relaxed/simple;
	bh=tiwIA7KCgddAbbWXGofv5rcvJ6WMyu1PXO97sMFn/1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FmbC17Xzp2Z2e2JKnBNzGSP6q8ihBLxSth8uHPHBROnSLXetMWhNrp3jeCIrxlBIJOmSuK2JZye5y09cwJgAp/yH3Oi7M4xNldrZMvLomycDbUdUgebxwhnku+YWWX94MeXouHQI5MZ6K927s8+dl7dvNrkZQuQ7mUPEFMa2SPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ERXAovC5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ERXAovC5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD6C1F000E9;
	Wed, 22 Jul 2026 19:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784750209;
	bh=/13IFkourPJ3q+Gp0lTQXJ7Ps7+KWl80QhcTpK/ZKb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ERXAovC5lP6dgMDxc7azFX/mcUyyspLfo7aPNJxkjChKLzwZj5sDA7Teh7Pn79bxq
	 frCrORlm0jkSZ7FBBjlA5Dc6eWuAxJo03RDvycMKosJ/8yLamF9XqbzMGj9yktXB8G
	 2xRPH+06zN04ZdtBwcXKXbigqMH2qH/m+pC2FgzhEm37vmCPrtfkvyUcf5Mw5829Kj
	 EcVI0OWhjuA/LzYBOWApWrGiR1wptJiIPJHk5GfNsA9Bi0qNR1UiQ4OtSc4Cwgpxgo
	 P7gBM+G1oXn4oj+0t0907SaSr4pxg7ohFDaxubbWBXgjMBc6hhzW+vGEODq6UE7xml
	 0hfwBmsCtco8g==
Date: Wed, 22 Jul 2026 14:56:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: justin.jiang@nxp.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>, joy.zou@nxp.com,
	Frank Li <Frank.Li@nxp.com>, qijian.guo@oss.nxp.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add i.MX952 FRDM board
Message-ID: <178475020884.1686663.9740518227138895376.robh@kernel.org>
References: <20260720-imx952_frdm-v1-0-6d145eaaa5c4@nxp.com>
 <20260720-imx952_frdm-v1-1-6d145eaaa5c4@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-imx952_frdm-v1-1-6d145eaaa5c4@nxp.com>


On Mon, 20 Jul 2026 15:28:53 +0900, Joseph Guo wrote:
> Add DT compatible string for NXP i.MX952 FRDM board.
> 
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

