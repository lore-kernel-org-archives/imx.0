Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84125231CA3;
	Mon, 13 Jan 2025 09:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736759781; cv=none; b=JJCvtmQ8TeBQvlvNTIDjMjHAXVvGX0TX0Qz4CpTk4PdkQbbr7PSfpAi4yVRlj9bdNbRQKKyOY1JhIT7/lsfTpgEsEpM1biqDR9Ap4jqG7sw401rOySEkCGl/8DrU9vESTpJGHE2w+5av8OVS7lxfkhi6pal9aZCmYJvOha5PRKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736759781; c=relaxed/simple;
	bh=3yK1CkFMlEOY/PMetAalc6+5NlmHuoFvXe8naQX+ibc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5f1N1EUD0pTRPePlDh/HQQ0zCvoYvn36ByCn2XFTuu0zfpoCKNgYqmsIoc9EW1KwVvgPooFXRrGqSQrsxlEohT+L8cHmrWKepE/11SSFuokZni7CbJVPrwsfvxUGI6TIKSPDBPgJXHpjj9xKQalMO79Ry+G4/4bMQdY2T0Y+lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqYj4ms/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqYj4ms/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA21C4CEE2;
	Mon, 13 Jan 2025 09:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736759780;
	bh=3yK1CkFMlEOY/PMetAalc6+5NlmHuoFvXe8naQX+ibc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fqYj4ms/J59VU+rulw5bVn1dpacZEPaDFi4u5FfQfCtx0YqZob88dC2qEedkQZe8r
	 DXsUtla/sIjD3QoKjPJSvMMZ99PMkMwbz1YrPdx9wQ/vG4JIt5AQmbw0fY3RqhFEuR
	 p0vToZ0FkZ6EyVGHnhO7TewLbyXqBin8my7w4rvCItoW6BHWj+Yam8zO72HNtEIU1x
	 sXGzIG9s55gd99X+7IsIY9TFIUt+QuUvQixCJKJSAyUC6tQiF9VyXWuBa88jdC4KGe
	 SCLWdX3EbgxCNB+rJYKUOkETRfcA6gjZotnf/DKGrF0xnvoeWiwMbfyg/K+O0tkVBv
	 nWR0blci4JIBA==
Date: Mon, 13 Jan 2025 10:16:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, kernel@pengutronix.de, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2 2/2] dt-bindings: clock: imx5: Fix the CCM interrupts
 description
Message-ID: <irln3zatlquwajbh66uxfo5kvw32pjzrldjfnuxc4bawv7k4q3@6dp4wnonvtw3>
References: <20250112152745.1079880-1-festevam@gmail.com>
 <20250112152745.1079880-2-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250112152745.1079880-2-festevam@gmail.com>

On Sun, Jan 12, 2025 at 12:27:45PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> On the i.MX5 chips the peripheral interrupts are represented directly only
> by their interrupt numbers.
> 
> Make the CCM nodes to follow this format.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Use interrupts = <71>, <72>;

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

