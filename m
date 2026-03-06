Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053CB17A31E;
	Fri,  6 Mar 2026 08:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772785994; cv=none; b=b8t5E//qMwovmNZNB5MrauOjytC/bCngHHQ97iYgPhQCGaoak9du0yCOdbEgjGSGHektwcZ7+9GBvHIj1r7jEKiSvW+aW7ogmq9CtVZmwGwIcUZFAZ39BPKw2wZBHJHsBQ0pCIGxAlTAxkaxejkZ/4Oq3DRGnx1joB+1X/yUBlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772785994; c=relaxed/simple;
	bh=SN5+pzGWNBQz6tOepDPonTQdUd634bUktGHyYoxmwEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfGH9HZ5iTCfvMFopQMrwq+Z+fpwuVwXYUmhuXHxHWNu+jF36mNE4lKCS16S/yydGSiaNT6v5L8B1KbhwDgqS5bpyDkQLtlfDmsP+Vd1jZomkOaXv1XtNcjGllZwkqYS/9lp9OFjwBn2V75E/Br3HCI3wwaN3YPPhkByIWcqi4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D33jCfOz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D33jCfOz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05709C19422;
	Fri,  6 Mar 2026 08:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772785993;
	bh=SN5+pzGWNBQz6tOepDPonTQdUd634bUktGHyYoxmwEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D33jCfOzP6hQmRqt0yEZJ81e7N++jbMf+uMWy2FBD75wnT3/xVstWsPVT37htqmMg
	 dVbfJk5I49PrB1dm5u/RutRJvG0A/G47n83jMN7eKhxhjoK1T+NNnwfeyszXecRBb7
	 sPptfG2Oo8Gxb2g3B+XUjj4Rr4LhQlO1/B1jP+vqROd6454zhZ4Mbl0Ci2o7kNIMFs
	 nho66IXZqp4Bf95Y/DwAkiLCGyZdlvPHGk5qhvTOqOHuxDKcMOlmJHFZzbIs+6qpoa
	 Eiz4d/GVnSCuMLTWOBe2K12b187MAc+GMzhfwSuQBtQxEqeEOTSPDjweDVoSsyp7pV
	 WT875zij2TRGw==
Date: Fri, 6 Mar 2026 09:33:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/6] dt-bindings: arm: fsl: add Verdin iMX95
Message-ID: <20260306-berserk-dormouse-of-efficiency-dd4dbe@quoll>
References: <20260305-verdin-imx95-upstream-frank-li-base-v1-0-823fad02def9@toradex.com>
 <20260305-verdin-imx95-upstream-frank-li-base-v1-1-823fad02def9@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305-verdin-imx95-upstream-frank-li-base-v1-1-823fad02def9@toradex.com>

On Thu, Mar 05, 2026 at 06:24:29PM +0100, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> 
> Add DT compatible strings for the Verdin i.MX95 SoM and its supported
> carrier boards: the Verdin Development Board, and the Dahlia, Ivy,
> Mallow and Yavia carrier boards.
> 
> Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
> Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
> Link: https://www.toradex.com/de/products/carrier-board/dahlia-carrier-board-kit
> Link: https://www.toradex.com/products/carrier-board/ivy-carrier-board
> Link: https://www.toradex.com/products/carrier-board/mallow-carrier-board
> Link: https://www.toradex.com/products/carrier-board/yavia
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

