Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987F01E32A2;
	Wed, 25 Mar 2026 09:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429311; cv=none; b=IKb+N1jmJzsIc52iGRApVJ+BCQLy6CE8ksG5/+zS+DqzVtAhQuHjTpEYhjQaYljT1w4bxQTuD5066XDGfkNEOS/Sw+vEzsU8U5tHzx454Qrp/lEVYb7KTaEhgua2ahWJba1QajwzHM4Cr0inW9swHXU8E7vqXhmbBSdoL5pCtHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429311; c=relaxed/simple;
	bh=XvAxCyWu0L7zLc1NFfaPzwcbGzeBeEzFp0l8Vyl4SjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uo4wUFS9R60C+uNboX8dQa+qIBUC/yCmrSJCSAz8alhNidbmDvaoOgAO/Ss1FA6UKcwMRWJCn9WwMS1vqsVWeibiZg4Sq5rRiQ+WazpIeJWCNK0uUXKvf7IpWQch4Ef5IZiA4Li621lGZ60CLlTIGNYZb1P2FXsiyb5WDogvvlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9928HfE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9928HfE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB99EC4CEF7;
	Wed, 25 Mar 2026 09:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774429311;
	bh=XvAxCyWu0L7zLc1NFfaPzwcbGzeBeEzFp0l8Vyl4SjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A9928HfEqco1L2ksGkLq5J1XZwYZB+wm7R1NLMjjKjFYzz6eZ99J1UyYE1eHxR9X1
	 qvdNKIGZx+sVQ0KQsN77oD/kIlZO1jtn/gRmv27o+JtuIggY1/anV5/Q/8y+fxs7m4
	 qDi32SBacHZ5rQDUp4GhuMEpWezxbGT8bT5V+MmCzmRY7TNLy9I9570yVxZ+56jIYo
	 2F0fN7sdIi/8ez29j/W2yliQk5hv5rx1iZYIURdYTf5tsIL8FUbjWpS3pG2XoUR4gU
	 s/5rH9rkplweCxt5UaFDyuAVjBcnJ9+dnzEby/UVAJzOWXMOw98JX9aCuSBKSbrNAn
	 3PKB2/EtBipsA==
Date: Wed, 25 Mar 2026 10:01:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, Frank.Li@nxp.com, dario.binacchi@amarulasolutions.com, 
	alexander.stein@ew.tq-group.com, maudspierings@gocontroll.com, josua@solid-run.com, 
	Markus.Niebel@tq-group.com, matthias.schiffer@tq-group.com, primoz.fiser@norik.com, 
	francesco.dolcini@toradex.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add compatible for i.MX95
 15x15 audio board (version 2)
Message-ID: <20260325-axiomatic-cunning-oriole-5badeb@quoll>
References: <20260324061556.980621-1-shengjiu.wang@nxp.com>
 <20260324061556.980621-2-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324061556.980621-2-shengjiu.wang@nxp.com>

On Tue, Mar 24, 2026 at 02:15:55PM +0800, Shengjiu Wang wrote:
> Introduce a new DT compatible string for the NXP i.MX95 15x15 audio board
> (version 2).
> 
> i.MX Audio Board is a configurable and functional audio processing
> platform. Integrating a variety of audio input and output interfaces into
> the system, the i.MX Audio Board supports HDMI input, HDMI eARC,
> S/PDIF I/O, 2-ch ADC line-in, 24-ch DAC line-out and more. Based on these
> features, rich audio application cases can be realized.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

