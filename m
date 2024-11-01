Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDBA5D8F0;
	Fri,  1 Nov 2024 19:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730490455; cv=none; b=ALAAIhWFbRKjIAAKA675X0PvJiAJ3EhHYn9qXJUzsuZC2VRN+CuO+FEm4373qPUR14czCcoukdkhRhVXGxMRwYPgw2XwAcuS9XXE+IWMteurOIZI0bwyWDaaJ/JhJ/+xrpuyHnAFpccHPxUeTTwCwWKCYjCjEwwtZFjkJz9V6Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730490455; c=relaxed/simple;
	bh=B+lUXNUnGKnkUkqXfymc/e9SpMpB4y1++c6mOoxHc8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGdvVvtV/ebhvIoU/ftP2OhewJXQbn1yhH/1UWNP4FGzunT9K37j9qSFJfFMA6gwmVyc+PDR6EKSnWrQ3XOn/KBF4CAbfyjmwDs5R9y01YQFgr12AayC7Ye7G+mcnTQVa8/snakJJe0cMOIZMaVz6XOERHQuaFa6w/ILWTH+8IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z6AqLWWW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6AqLWWW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0571C4CECD;
	Fri,  1 Nov 2024 19:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730490454;
	bh=B+lUXNUnGKnkUkqXfymc/e9SpMpB4y1++c6mOoxHc8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z6AqLWWWGWwkE6bYBR7023sarjXeRnXyjJwR+sQ3ZR0nLHXlhrEDaN+DxTV2BgPPB
	 LhwBtrFV84d/SvuHpp5NlZOTc88jQVYTW1nYgjdKdCPnnA6FjZUCMh1ZJ2L3Ct/VFu
	 jcxmC2gy9bRwjgjppVxnkd/61YMKDwHA5r3HwD2pQ9tMoDKx/l3NzUcypt2SPqYK81
	 c6qwSPk30U+nBHtOkJCk47eYR5h8IzaGdYaBQR8u8Ka+rOF/mkZZEVEwzLZDotTddn
	 rJ8D6CEukxNJYjjYBFt/cPGCNIPJf8Pt28xWnX5ZjTjhZbLR7lFak3mj/qHAWmn2Q1
	 vz4/gBYYasoIg==
Date: Fri, 1 Nov 2024 14:47:32 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl-esai: allow fsl,imx8qm-esai
 fallback to fsl,imx6ull-esai
Message-ID: <20241101194732.GA4088016-robh@kernel.org>
References: <20241028-esai_fix-v1-0-3c1432a5613c@nxp.com>
 <20241028-esai_fix-v1-1-3c1432a5613c@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-esai_fix-v1-1-3c1432a5613c@nxp.com>

On Mon, Oct 28, 2024 at 03:49:31PM -0400, Frank Li wrote:
> The ESAI of i.MX8QM is the same as i.MX6ULL. So allow fsl,imx8qm-esai
> fallback to fsl,imx6ull-esai.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,esai.yaml | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)

Acked-by: Rob Herring (Arm) <robh@kernel.org>
