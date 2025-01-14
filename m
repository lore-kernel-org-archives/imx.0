Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1281FC7C9;
	Tue, 14 Jan 2025 20:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736887563; cv=none; b=KLbyD5GIBzwaVGCor7bTCTq5AsoiDK4R1SBQzjuDkeQ3XJgM2wJw8wAuEKhBzRlnH/rXsJntgGLgaGhxkHArHpsEeLjZDzxqVYWSQH/K6TrtbZhymSTQ1ZT1SwlST0ZifT1GW01b6unOUhU+jwxlYsDhuNrh7b27ttDO/gAjueQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736887563; c=relaxed/simple;
	bh=cbrnKzQADWAdnh86AY10bxSbKYy1bTDuo3KND/+ugYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9PnEFM+vT8W8Zev+xI80uq8YGAeyt8eSqYXaLlUfD+n+Tk77X035ZcUMmZTOU9kau+MPqFFmnI1NkJ/1X5OGSdka9zF1vEw/ViClDfUiUxMDgaL7hhQ94IggcVcNaXP1UwfORuZJWh1LhqMVVl1uC1ZRDWO92u665pF0Bs24tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uPPcCibx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uPPcCibx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14417C4CEDD;
	Tue, 14 Jan 2025 20:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736887563;
	bh=cbrnKzQADWAdnh86AY10bxSbKYy1bTDuo3KND/+ugYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uPPcCibxhGoiDbBIqGpiKdx23HdCyo+Q5vtBiOY0Y/H+mHRV4GYVKQouU8F5BOp2S
	 jocbaJJ2eqXKimxNjukIhVwTud6iJvtViNocLQPW6pN1y40guHPqqqPgCUJe9jxJ8o
	 S+2kkVvYp87mqixeWvT7PMz9uSnaUf2+DQXoKAllI55Usx1lUfZ3m9nqQjzZ9OSCYh
	 PDlshz7jQMhph4C/iq7VlpVh9lloSUggwSsjkT4UWD/IqGFpdbfz40FUP2W3gqGB8f
	 JgtF0+AtdM0wljo6oMWNB1TM/wvW/L40HsP59TrFW6sjoIEh3qpy0QhfzVHdlfPKl6
	 x6pKTFpQpaZJA==
Date: Tue, 14 Jan 2025 14:46:01 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: arm: fsl: add i.MX95 15x15 EVK board
Message-ID: <173688756096.1689612.6453110742993386825.robh@kernel.org>
References: <20250113-imx95_15x15-v1-0-8c20cbaab9ed@nxp.com>
 <20250113-imx95_15x15-v1-1-8c20cbaab9ed@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-imx95_15x15-v1-1-8c20cbaab9ed@nxp.com>


On Mon, 13 Jan 2025 13:01:59 -0500, Frank Li wrote:
> Add DT compatible string for NXP i.MX95 15x15 EVK board.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

