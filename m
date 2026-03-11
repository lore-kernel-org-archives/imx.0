Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457CE27EFFA;
	Wed, 11 Mar 2026 08:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773217240; cv=none; b=c97K/XFWJLGRRevEOijmqfMLmpaEzjMfH9pVrd5V5xEUSfPT17Ty73ZITSPnehbg7c8XYr/dBQE0dcSDetlefYM8rX4Z4JEz8lKonBYanQdX4YWS5uW80gOmL21GuMfnT3ePYWH/GjWnEHSh39SC0k9LchQBRSAnkt9F5khG1NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773217240; c=relaxed/simple;
	bh=H7RUpwdbl9tXjvEOWJNr9j+D7eGEEGQs6/RxxIrYF9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRVcfCaEQGyQMq8EPCPixs2NKqruhPfrda8GzVXYNa8IaefV0p1tl9qeq7fJO5IQAQVna7VHfIKkD/qU0HaDMPByqW8Am/4alvnJ+Br6xJuDSR4BXWCFYS19Vyk06j5JiRy2rBifTO9/uod1VRsNhSXTtH3ioOBZpamgXLinHjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0WA1/TS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0WA1/TS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B39C4CEF7;
	Wed, 11 Mar 2026 08:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773217239;
	bh=H7RUpwdbl9tXjvEOWJNr9j+D7eGEEGQs6/RxxIrYF9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h0WA1/TSV7vcRicRssFJjMvCSBd1wFpYKX2z2Y2AA2l8emu6WHMZ7ec7FxKTwUTw/
	 9vj/lRIw7XjgmOuUnVX+iFHhcrZr95fsQbX3Zt+pMejssDPGKyWnjsvhEnVqt0QfEd
	 g/nesGbBf9Wz412Gk/YZehNUDPQnmDy3TGvgeA+oCZt/QUa3txx3w4xqo0erH1KUk5
	 xhCGoVIO41tg/OWqa5W0NUPB40BM/oEtuZ0kEKQM8B2n1tP+Rzt6v/b6F3rr4q8jJP
	 6YxQjgC5L1KtAxDAbMWi8ArDB7LL0CuioCHUB78Q/FjZuHIwG4IIRZjYcJrlof6edl
	 +lQsIaBHriuJw==
Date: Wed, 11 Mar 2026 09:20:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, shengjiu.wang@gmail.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
Message-ID: <20260311-brave-acoustic-mongrel-b3978d@quoll>
References: <20260310063522.362545-1-chancel.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310063522.362545-1-chancel.liu@nxp.com>

On Tue, Mar 10, 2026 at 03:35:22PM +0900, Chancel Liu wrote:
> The imx-card machine driver originally supported only codecs operating
> in i2s or dsp_b formats. This machine driver can support CS42448 codec
> and this codec typically uses dsp_a for its TDM interface. Therefore,

And what about other formats, which was asked last time?

> dsp_a format support is required for describing such sound cards in DT.
> 
> Update DT bindings to include "dsp_a" in the list of supported DAI
> formats.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/imx-audio-card.yaml | 1 +
>  1 file changed, 1 insertion(+)

Where is changelog?

Where is any explanation how you handled or not handled previous review?

Best regards,
Krzysztof

