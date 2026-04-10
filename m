Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CD6386565;
	Fri, 10 Apr 2026 10:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775818575; cv=none; b=XKULhiuy0x1UUQPIqINdc1zYcWaToX7ipGLjuqeqBCf2rL+YxiseVh57eLXJ4C4KusN2ZIw0DFYGJ9kp2bJjfgNzZ2rOB4vxzq8IFrh9V6boXebL0MTrvTlGprpT1KlfNyhpOhVvfmbvkHt2vC0N5+gIZYX8klUwF0EllM6re9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775818575; c=relaxed/simple;
	bh=WYqHQ/KSVCOpW5gEvy3s00YQa3VfVpDZrOgWzcd0JrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKMtmpSiutpOoFhOZLT3/TCa4Jj34xBVsEZVBNXQ6ixADQWxW05RI7TUq2dd+xai1c3ZkmMu0m4Hq0l9Rs8agh05cLHgL6R5ZWt3pcfD5jKljV+/f+j3zI9IKo2lt0QrKVUXzSA8E3aAlgI7PUEAxriOYBtciZJXALVJbCtMMdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hhv8rmIU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hhv8rmIU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 848A5C19421;
	Fri, 10 Apr 2026 10:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775818575;
	bh=WYqHQ/KSVCOpW5gEvy3s00YQa3VfVpDZrOgWzcd0JrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hhv8rmIU+x5ieL3Y8PJPafaV+eMDeHmJGdnarcpWzJrM42OQnOO2yWwoQgEgW31De
	 aeatVgKRMXOzGeSFMDGjC7nacMGm4SzJMoOywSBuUOeVjtrywZwIjKioUKTYExbrwJ
	 PKJe4C1W5Pp7bAMLevQVMGQvjmYBrr7WFr407hPy3prGIzPF/LdctOBykzgfy8jYbq
	 LA7HpGzIlsHfRM5kge/b3iIGV6S1z6Qm81o9xc2q3dA1gddi90Q8k6B87lF59rEy70
	 rzxRD509NjPXIYxNkPJcZVEebQgsu6c0OAqvakWp1UAIphMhZJfGI8+HU97dZcmEF5
	 6w630GMPaJdSA==
Date: Fri, 10 Apr 2026 12:56:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/7] dt-bindings: arm: fsl: Add verdin imx8m[mp] and
 imx95 zinnia board
Message-ID: <20260410-great-woodlouse-of-judgment-99bd78@quoll>
References: <20260409095855.61252-1-francesco@dolcini.it>
 <20260409095855.61252-2-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260409095855.61252-2-francesco@dolcini.it>

On Thu, Apr 09, 2026 at 11:58:47AM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add Toradex Verdin Zinnia carrier board mated with Verdin
> iMX8M Plus, Verdin iMX8M Mini and Verdin iMX95.
> 
> Link: https://www.toradex.com/products/carrier-board/zinnia-carrier-board
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

