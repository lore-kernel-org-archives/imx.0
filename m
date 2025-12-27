Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C33731CA68;
	Sat, 27 Dec 2025 13:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766840557; cv=none; b=XsJ7BsX3Hbnzh53ourUFAGs7n+XbFK4sJZAnazqx8f5HATlsV//gSoXTaOVSmw9Am1DH/r/VNpUNsZ2I5TY5KnTLoWtaqBYGsg12QKj8QcwzXifzt9VVnNFzYUwJ75LQ0ZIJWEr6vPmRsdJprkShcImoc5/fhZzujndCZAzgxyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766840557; c=relaxed/simple;
	bh=eu9YmoAVPx9G2RqP7sOlI4dEJ+qLQ8lmQAKMzvDuWsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTIMv+Hqij4zw43ynrOBvgqhEDSpFqowBK5voXm5EldH8BUb81+zIc2MfzcoDmjI+hDE3Pe+F5T9MY8hj9BixisTYPm8arXvsxpxriLLPeS/AFSlc9ZcPBfxUH6/HOhpm3FGaewsUG25j80UUFkVj45QDMoJa8D46x4tI9QCihE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LKlVrq2b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LKlVrq2b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767F0C4CEF1;
	Sat, 27 Dec 2025 13:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766840557;
	bh=eu9YmoAVPx9G2RqP7sOlI4dEJ+qLQ8lmQAKMzvDuWsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LKlVrq2bOy4hP0YLqKJFavJ9XAk3qcaSNstmLmXaSWJTtmxvgzPfKCR5IxIyVfITO
	 BHCfndgnHaCAiiLY6ViRURNysOKKryRO5DDerfAl/YueantgNOHcfY9Zm+MPLTetHI
	 Ct0ddu5FJFkVvl6FG+g7aiJtQgLUqcVL9RArpt/UfbtVQGx4kcGM/x83SWxc/LHbBQ
	 WKgHwN3OAKiQcmCdUluDDGZLPS5aZyBE/n22kmidWFkxAUD680Ch/Zy1+BsbW5DsFp
	 Fwhwpydgle0/CKnQ77apLrYdLXD7VIdsUACW0oMikGZWCWcjVBa8giyQNdrxVu2WfH
	 4EzaW++2usE7w==
Date: Sat, 27 Dec 2025 14:02:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/4] dt-bindings: arm: fsl: Add Apalis iMX8QP
Message-ID: <20251227-polite-malachite-chameleon-f446cc@quoll>
References: <20251223162833.138286-1-francesco@dolcini.it>
 <20251223162833.138286-2-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251223162833.138286-2-francesco@dolcini.it>

On Tue, Dec 23, 2025 at 05:28:27PM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add binding documentation for the Apalis iMX8QP SoM mated with Apalis
> Ixora and Apalis Evaluation board.
> 
> Apalis iMX8QP is a variant of the Apalis iMX8QM, using an NXP i.MX8QP
> SoC instead of the i.MX8QM. The two SoCs are pin to pin compatible, with
> the i.MX8QP being a lower end variant, with a slower GPU and one Cortex
> A72 core instead of two.
> 
> The two Apalis SoMs variants share the same schematics and PCB, and the
> iMX8QP variant exists only on revision V1.1 of board.
> 
> Link: https://www.nxp.com/products/i.MX8
> Link: https://www.toradex.com/computer-on-modules/apalis-arm-family/nxp-imx-8
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

