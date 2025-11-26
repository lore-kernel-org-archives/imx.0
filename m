Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701F92DECDF;
	Wed, 26 Nov 2025 09:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150213; cv=none; b=h7C1CMcZRh7NI2wRMUBStY+LR8NfZ94W92Q3juLPjxRHDp1OgtGpSppdhyB9+gW1FheurSE0Xf9uWlI7GQ9vhJ3ZwjLAcqC34nN9ws5zxbD26mx18Re8eShvbp27UOwupxNf/ONiSvfpWIeX0Rt96Nl4G2wD2w41HfTlxMyR12Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150213; c=relaxed/simple;
	bh=JWPUcitBJ/2M/fR3u302ELJCtt2/p8EGJveANa8B9KM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czEp9VWVQpZJnWpHizNSqkHYqpR/ClD/2pp1RBmeUkdlKWYbl+EOAvFnda7WBdUbZQHEizxbfSIzFJhKa13N6LtHTjisYUN6viB97PUw1OB8zVMLFMBF4NwtKAg5JfUt6D2mHmvTHz0wCDtrj6WL3yWfb/2IQhgBR5WIxoeig3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwFfWPQF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwFfWPQF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69459C113D0;
	Wed, 26 Nov 2025 09:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764150212;
	bh=JWPUcitBJ/2M/fR3u302ELJCtt2/p8EGJveANa8B9KM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KwFfWPQF+efOTX2luRkKb2J9DqVFgF1Yjvb4m4IKWMZEjIIeijoJTpsle/pTzI6WA
	 PSkW59xXHMvRxLOaKUzRpjTExl44paz/HaeKGh1WZRhMT5CcHxUbJszwzd9o6Rc5FB
	 7uI4m8GGQtXm6C2Ri8xJE1sPFRHvUxYzywXw0OW62UMG/MGZ71K9s0dUEHrwtgVp3R
	 +qBK/I9SY1EW/O44uQFkOmU+8Y7wGr9sPtuq7RaLreVftV5u36BDrPfg0ucloovsG5
	 WqWPLijwDgb3cn2BZDsIQg7oXXhpv/KGJ/xYCulmV9S3s/tphDHCY3Hq7opi5//TlW
	 jSxvTYrsQqI1Q==
Date: Wed, 26 Nov 2025 10:43:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: soc: imx93-media-blk-ctrl: Fix
 indentation
Message-ID: <20251126-singing-stoat-of-valor-2beade@kuoka>
References: <20251125105006.1612348-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251125105006.1612348-1-alexander.stein@ew.tq-group.com>

On Tue, Nov 25, 2025 at 11:50:05AM +0100, Alexander Stein wrote:
> Indentation is 4 spaces in DT bindings.

2 or 4 spaces. We do not change the indentation alone, if the file uses
correct 2-spaces indent, it's too much churn. Also, if ever doing it,
then do it per subsystem, not one file (not sure if that's the case
here).

> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     | 32 +++++++++----------
>  1 file changed, 16 insertions(+), 16 deletions(-)

Best regards,
Krzysztof

