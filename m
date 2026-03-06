Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA26248176;
	Fri,  6 Mar 2026 01:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772759166; cv=none; b=XGLpOXndCn95EJJWdaP7JrrT5fS0ZNUM+GV8AMPYW0ckpQejXiIN+xBRNw6INU+/L/dVXUffDMfWVr6pMeVayheoaV67V4o5RbXv6PVxHCNLNScWeV2/I6+AprXHJnyEVOK9X//k2bhZ3jhVfUe808vnj749wDf8WVCIMjKE594=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772759166; c=relaxed/simple;
	bh=TXhsUtQ1T1eFHHTBTR54dHAz6m+/NdLJN2sBSGnqWdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqyJLLf2AdexTXz30nBK94gHOvRxipgL/IAK67NH7oaBU+3fXqNSPVeXTsm4us3qEroU2PFL+NdEXXUZx4nwS6ezSY8RG74VOhjaYzx1qKI/tkPImsrOOHJz9m+NJfn4Nx9GSjhHyOTTPpZ8Teju4nyYE89FSq+PUUb3Vj0+lPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J38lCU0a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J38lCU0a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2ACC116C6;
	Fri,  6 Mar 2026 01:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772759166;
	bh=TXhsUtQ1T1eFHHTBTR54dHAz6m+/NdLJN2sBSGnqWdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J38lCU0aKRQiDELTdbhsaaGpPT3Jx448LT6fqF7qFCS5hxROoC6tSb/44TyFit4nn
	 O4fAapca7bHIFm19JgksNJm6q6HY+lYMonqjOix2bPg7m1L7mbWYZmYRCni6lCR5dC
	 0bzq/M0gEt0YYEWo+1NT8gnTdkx+Ql2K9yBFYGyJU2MUiaG7BFoZunekJHTldDpq+9
	 O4b65fu/u/Q/zndvSF7WMo37k0YPpMuOCzcUEKpcn/SzXoAVrgKmYIWNROJZw3K57v
	 CysiPIxs+sqBKV3hPD4qeyOGRlIAd+dsmS5tXsncmGm4EgyShbLnsAcw+pRTO3U8F7
	 Wtv7Yrrc+WXOw==
Date: Thu, 5 Mar 2026 19:06:04 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: media: ti,ds90ub953: Add new range
 for remote GPIO data
Message-ID: <177275916426.903680.16610695491601049297.robh@kernel.org>
References: <20260228-ds90ub953-v5-0-056cf07cc8f1@nxp.com>
 <20260228-ds90ub953-v5-1-056cf07cc8f1@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228-ds90ub953-v5-1-056cf07cc8f1@nxp.com>


On Sat, 28 Feb 2026 14:18:19 +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The DS90UB953 supports four pins, GPIO0 through GPIO3. When enabled as an
> output, it can be programed to output local data or remote data coming
> from the remote compatible deserializer.
> 
> Make a different GPIO range for remote ones.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v5:
> - Improve the description for "#gpio-cells" as commented by Conor.
> 
> Changes in v4:
> - Use folder block instead of literal block for #gpio-cell property description.
> 
> Changes in v3:
> - Make GPIO range from 0-3 to 0-7 to support GPIO data from remote
>   compatible deserializer suggested by Rob instead of adding third
>   cell for GPIO controller.
> 
> Changes in v2:
> - Remove new property ti,gpio-data
> - Add third cell for GPIO controller to select GPIO output source.
> ---
>  Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

