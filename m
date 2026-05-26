Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFBF3AF657
	for <imx@lists.linux.dev>; Tue, 26 May 2026 16:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779812245; cv=none; b=OCaH8RlHAeyGaTmQ6b6E7ph4aN0ZqEaliBfhI6CLFR22UuFQjEpWaZzEEziDMrD5c977hoiKWzTMC26FMwfCdi1cL0A5AaiHRDcqREoWBRNUW6CHeTon/aXEO7XG0ZxIu3o6z96mbig/a9rrP8PEG200ntXtc0w65vWj7eoE0Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779812245; c=relaxed/simple;
	bh=B1fXvmrxn+xJ9dJrYlmoayWeTadZmztpSQlgKjR61xU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtT2EhCPlbtA7ghyFUAnF+1yrYyDHBmf4xjqkVo6TNFV4lgHi68JMMEngo/i5mb3Dez1BCM72jF3ZVUnG+3Ze32CjAWJvJttcNFSWhr8iSJ6gp72a+d6NxteEiLgqEx3UzJQexjOQR7U2C6IbG2siHpk3R8hc7+13l3qX4qUVY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Mc3LCoEV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Mc3LCoEV"
Received: from killaraus.ideasonboard.com (unknown [146.0.28.163])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C3FD1176;
	Tue, 26 May 2026 18:17:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779812224;
	bh=B1fXvmrxn+xJ9dJrYlmoayWeTadZmztpSQlgKjR61xU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mc3LCoEV01D+bMLgGQYxAEDMoYrGepDuJiX+BlMhJ2dqnEff7bVB3QpffALLttQCo
	 N3qLoojUVsJzoNvuPwBW+/xMAOmtljRiUiNuzEifLtsNAYhHHSHGV2eXFero9Yj9D2
	 BZtiPDyQCnZ+ZEkUeIcjwSDtX+7lPtbLfwPfXrMo=
Date: Tue, 26 May 2026 18:17:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v12 1/2] media: dt-bindings: nxp,imx8-isi: Drop
 fsl,blk-ctrl requirement for i.MX8ULP
Message-ID: <20260526161721.GF228394@killaraus.ideasonboard.com>
References: <20260424-csi2_imx8ulp-v12-0-da148eabc035@oss.nxp.com>
 <20260424-csi2_imx8ulp-v12-1-da148eabc035@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424-csi2_imx8ulp-v12-1-da148eabc035@oss.nxp.com>

Hi Guoniu,

Thank you for the patch.

On Fri, Apr 24, 2026 at 02:49:50PM +0800, Guoniu Zhou wrote:
> The i.MX8ULP variant does not require the fsl,blk-ctrl property. Add
> fsl,imx8ulp-isi to the exception list alongside fsl,imx91-isi.
> 
> Fixes: 288517a3c6c9 ("dt-bindings: media: nxp,imx8-isi: Add i.MX8ULP ISI compatible string")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v12:
> - New added in v12
> ---
>  Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> index b59c4ce30b8b..279c9cd3034a 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> @@ -117,7 +117,9 @@ allOf:
>          compatible:
>            not:
>              contains:
> -              const: fsl,imx91-isi
> +              enum:
> +                - fsl,imx8ulp-isi
> +                - fsl,imx91-isi
>      then:
>        required:
>          - fsl,blk-ctrl

-- 
Regards,

Laurent Pinchart
