Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910DD31AF1F;
	Tue, 16 Dec 2025 06:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765864978; cv=none; b=Epic1zIqU1QRMO+S5/hG2Pri5Xol5iIQMUns+AMos+b/b2XoqEvuTfJ9P80+hvH43nVAMIp7UK0WXqoIP78vgsP+ZtJhhxfFMEi0hXHk7+mbJSWzzVQTYEci2ZRb4YI6K6jPgFfkMg269UbBoop+olEfGcNniMxdd/eCe5XrY9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765864978; c=relaxed/simple;
	bh=Em6+p8Pu/6Vb7snDG9aA3wExt/uZfpztPqqJRPy+fdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xp1C+2KjWX7xyvWSH71OkQn+mX44Lx+ew4qtqORFtzMrNCgGPd0Jq4C3PV3Z61P90+rtrcpGma/VVZh2gHNa+LYUT5gEDB47oAYfGo9bvbxDU68rNjUH7QpzgJanA7UjvEI0F8A3qDNf/89qaiSkmlsDJbwB8zzSP1Xe9DSwC2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMS4yQlo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMS4yQlo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7EFC113D0;
	Tue, 16 Dec 2025 06:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765864977;
	bh=Em6+p8Pu/6Vb7snDG9aA3wExt/uZfpztPqqJRPy+fdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IMS4yQloi5hK9U3mbjIstm+y8nVJ4PngK72sD1tqlkt+A2n9H/tUVaCNir9v43FEY
	 pQtGBfjXcW/f+g/m67tx56ViSTQkBCDdnDbDN+vFK605fdYsI7+93TmcsYJbBroeE0
	 FDxsClrc6D/s6OAmMeNTcwfKUOOIK3fgw8qistpGP711amqxtvkPR28rmpLNCty5Ac
	 8PmnE7jx/7mkr++aoob9s5yOwuZ26liengFZdCcmmKclEkCT8MEfHok2ub8usJImu1
	 tuyDK8xMRU+MmJSAvG7iXlxqlQkOHsmBt8TXzC+ULYCsEcwvZAdukBARJLeA1yuzkS
	 8Cm6HQ4FsVRPQ==
Date: Tue, 16 Dec 2025 07:02:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Justin Jiang <justin.jiang@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, qijian.guo@oss.nxp.com
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: imx Add FRDM-IMX91 board
Message-ID: <20251216-energetic-bittern-of-diversity-b2e851@quoll>
References: <20251212-imx91_frdm-v2-0-4dd6d289e81d@nxp.com>
 <20251212-imx91_frdm-v2-1-4dd6d289e81d@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251212-imx91_frdm-v2-1-4dd6d289e81d@nxp.com>

On Fri, Dec 12, 2025 at 11:31:33AM +0900, Joseph Guo wrote:
> Add the board FRDM-IMX91 in the binding document.
> 
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
> ---
> Change in v2:
> - rename 'frdm-imx91' to 'imx91-11x11-frdm'
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

