Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA121B6CE8;
	Mon,  4 Nov 2024 15:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730734960; cv=none; b=MLeEWp5IyDojn8rzLmPpWColwDp1+6SIJ+kCCdKoegjFY/yEYaZwMD0pHPgMjf9lCMNmKylxu/YWKPmbeMRDZzOfOkjQ45hjo3R4g7CieJ6h5UHHViyXBx6tJorCWmKe7s8utgbsIA6kPPTlfRoTXWhnlRzCGqnFwWjNuPNsQrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730734960; c=relaxed/simple;
	bh=ZcXj/+Ru/C7z54XGjpC8CnE2LPrcJkPTHoyWYQ9pIb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e0opFwy7RH+vPeK/ivQ6MrJbvBRqddKYokKmLuztEDwKiSOlmTgCVgSXZcHJoTmPPshR5JbjK6CcxqpOIjb4o5bHAPdkx0jBS2FDr/6qtHuAL+pDkqdGqinBexpCkqhcjRs5JIVj+nG6itUVCidWrrGykth0MJ58m9G9Cu2SA+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pW1x9gp4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pW1x9gp4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12439C4CECE;
	Mon,  4 Nov 2024 15:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730734960;
	bh=ZcXj/+Ru/C7z54XGjpC8CnE2LPrcJkPTHoyWYQ9pIb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pW1x9gp4OtQx8VqDjK0tsIaYR7endJuHczoLt6iYUv/95h4p332/L1+cC97vYrKXQ
	 //gW+kRhjoe4ilQlsU68+SUsm9MLO9sdMiTbGDsfdP19fHLKez8w3oBFI17P7A/J2h
	 1gadF1NH9mqoqADHr0S74m57GBUcqZiFTjUg7yJWPsLICz8Lq0th1uRT299z2RKeUc
	 eFRdG8AGYExK5odt4EvAxfU5BNby34fmFB1p02tWytWbBBjASlFPY/+nc6JjYHzV9N
	 452d+XtFt22hRTrRA+WKWWjTVBRBfS9fSij44NN5xbIu6dZq1ZMnz4HtEj+ft7MEaG
	 ipyUeA5N8pQOA==
Date: Mon, 4 Nov 2024 09:42:38 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, shawnguo@kernel.org, imx@lists.linux.dev,
	conor+dt@kernel.org, Fabio Estevam <festevam@denx.de>,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	krzk+dt@kernel.org, a.fatoum@pengutronix.de,
	dri-devel@lists.freedesktop.org, andreas@kemnade.info,
	marex@denx.de
Subject: Re: [PATCH v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif
 fallback
Message-ID: <173073495749.210192.9138587910771237679.robh@kernel.org>
References: <20241101135406.47836-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101135406.47836-1-festevam@gmail.com>


On Fri, 01 Nov 2024 10:54:04 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> imx6sx.dtsi has the following lcdif entries:
> 
> compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
> 
> This causes the following dt-schema warning:
> 
> ['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
> 
> To keep DT compatibility, document 'fsl,imx28-lcdif' as a possible
> 'fsl,imx6sx-lcdif' fallback.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v3:
> - Also update the example.
> 
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

