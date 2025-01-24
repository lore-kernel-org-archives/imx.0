Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F167218E85;
	Fri, 24 Jan 2025 08:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737707121; cv=none; b=ZMW153NFDnn5uKqiGt7zDM3JgaLzXcO98IagKc8/e9nx6uc8WT25r44y8Yf4kURUd3N62L+t9K6K+N74kUH6a5CySEVAHi8W6jcOCPHBzXtSZ7mnd/gjU/BuL8E3hkkRT1yZUB010/Q1556g0b7X9om3LsIqUYt30e8iOR6Cul8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737707121; c=relaxed/simple;
	bh=avPkR0WZvpgTxvx1IutqBvspKK1NkA3OyHUlutbIs1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qFcldmsxBR7ahmHybvSWKrrvy+/cD9JCj9BOz1VdM96XjW36SRqWoCuOZDy2j/PobJHAu2iyyCMof34/Mi11uGV9BfqgdQLwhDIGNd7I/gqtBQXVzUzsw7lP6fasPklPx1pDKuXqJ22OYroLNdCkV8kqSgvZPluILe3tN+mwqQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=azExpTcO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="azExpTcO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD7EC4CED2;
	Fri, 24 Jan 2025 08:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737707121;
	bh=avPkR0WZvpgTxvx1IutqBvspKK1NkA3OyHUlutbIs1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=azExpTcOnITnBTMVmrHIeeLyPJDcBA+wpDCwpVFDweJTFjKumRPGtdhq/DxH/cnYp
	 X/Lm5mC7ppddhZOfMUO7nqa8oewpZrsxPArKRHQXQy6Rd3Aot4DMbq2MVSYMZifzG6
	 jqfkWoYF4reefhmttytvukO1uSwVcXLmmQbs6RwYlTr6kJXHcbDzj7J6qWhoqGDrnE
	 B9UiPzBTfWL2e3ALvgxacnM4JMO2aZqS6oWG6cgyB2+Bkp0XT5ToX1CgEv+D3Kabp5
	 xJ+J9F2/ThSturDL2QDo0XtxU51gU50y/qLk7CUXxhq+hx7FopjOpZj5dOQ1awarSG
	 wPOgGsyJq3Yyw==
Date: Fri, 24 Jan 2025 09:25:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, broonie@kernel.org, 
	shawnguo@kernel.org, conor+dt@kernel.org, peng.fan@nxp.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, lgirdwood@gmail.com, 
	peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org, imx@lists.linux.dev, 
	Iuliana Prodan <iuliana.prodan@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: arm: imx: Add board revisions for
 i.MX8MP, i.MX8QM and i.MX8QXP
Message-ID: <20250124-meaty-tunneling-raven-eabb6a@krzk-bin>
References: <20250122163544.1392869-1-daniel.baluta@nxp.com>
 <20250122163544.1392869-2-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250122163544.1392869-2-daniel.baluta@nxp.com>

On Wed, Jan 22, 2025 at 06:35:41PM +0200, Daniel Baluta wrote:
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
> 
> wm8960 codec is EOL so we have i.MX8MP EVK Rev B4,
> i.MX8QM MEK Rev D and i.MX8QXP MEK WCPU boards with
> wm8962 codec.
> Therefore, add compatibles for them.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

