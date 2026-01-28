Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F592EFDBF;
	Wed, 28 Jan 2026 11:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769600766; cv=none; b=vGLpEuYd65sWRfNS7Ks0HYKABfXij9IIY7/ZZchuy/WsvrJehaVCFlNsVg84MRJgLwZRoULNh7OeYQ6A62Xayd7f8v5lAb8Xxw1aQgIT9HtZlonYw0cy41yhmmF2V8yni2p3ErNcC/s3nXxV6A0y92GATiFFRdvC5uiRbkhsJaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769600766; c=relaxed/simple;
	bh=gkOEXyC/0gCse7bBNhfu8r/cAT6OuOtpOsSIyHaDmlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XnWQa0X1FRupv/VN7g3ujvZL5ftlOtGsZjHcMhQ6rue1S84MBMam9zx5W+Sst0igj2tmZPadEhGBhWwtxTh+Iz6wTZirP3qILkTgE6KwsZpE9uorX3k/jABkaOF7PvkPXxZT2y4RbEsVYJ3mnsZcdDpBoZzS1KO6PhVixBRSEWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DewNZW4x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DewNZW4x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B48BC4CEF1;
	Wed, 28 Jan 2026 11:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769600766;
	bh=gkOEXyC/0gCse7bBNhfu8r/cAT6OuOtpOsSIyHaDmlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DewNZW4xe/HsC2IwNbH7ZHZuQK/jdLOGAoXLQmB7DAVHUIz7pWjSYl0TsDcNtU892
	 iaTLLo762MtsBUd8L4iVtF1NF4/KXtzmt5M7jf4jG6Awnm/o+sDNOxXWuL19S3VFNI
	 CKohONU8IJXABxx4UkdUxEh1lBVRh6pFYZeV5XVJI5td0nYaAqbjATZI4Q0uNowdGL
	 iYkS8pMD6pJU4QyAen/oTp6p5vndkJMf+p3PsoCVSx34y/DplORAoxjNyIhwAuCDyt
	 hQKwPjYmCp4eLKzbtqy2UykO8DIBrwgVqYA/JIdHnXzUw9Rzxvx8RrHshpIdH2ekL6
	 srqp/vndJGnQQ==
Date: Wed, 28 Jan 2026 12:46:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, 
	nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl,imx-asrc: Add support for
 i.MX952 platform
Message-ID: <20260128-daft-rabbit-of-abracadabra-fe3274@quoll>
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-2-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260128071853.2602784-2-shengjiu.wang@nxp.com>

On Wed, Jan 28, 2026 at 03:18:51PM +0800, Shengjiu Wang wrote:
> Add new compatible string 'fsl,imx952-asrc' for i.MX952 platform

We see this from the diff. Say something useful.

Also, why power domains are not required?


Best regards,
Krzysztof

