Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61F21FF60A;
	Mon, 28 Apr 2025 07:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745827186; cv=none; b=t0nQxVA6WdWU1MDmyLfve5eiSSZa7JV4dbV+E9MYZKS8ttibMt2pyKMSPM74phYAgaiWW+APNT5nX7TiGYxc/9jWXWvFUKVj0CW04DJVX6XJD7QYJHDoAn2GahSZNuwi29fr6k3YJAuezHqQh4UeuJGAiKVKVpv/lBTvldB7Ctk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745827186; c=relaxed/simple;
	bh=vurruFqLtF8yoeklNaL/NrKmDFnF7HGf/qbXQ8ET/Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLRKNPwXWkyG/ooVsLSMaSLpcQ9LF8PZSG7FPr/bxf68oiyPlJggFWs2MgpCMQV/LpQpMn9MzABRjt0P9JDAV0MFamKzvr/F4ZZEdDZZxPoLTFmC0UDnf2XBYX+j6XT//oPzQqpqAorfgI6oaALiot3Y45XxK5/PPIP2El7ymg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PzJ+lsZA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PzJ+lsZA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A24E9C4CEE4;
	Mon, 28 Apr 2025 07:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745827185;
	bh=vurruFqLtF8yoeklNaL/NrKmDFnF7HGf/qbXQ8ET/Z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PzJ+lsZAS1otJLR8mP6WCOo6R3WaMZo5HTBVvGuciQld5qH+wpHUDzrkUV0UvP6FU
	 7vqu3JattTkocjlCF/HNPy2RItdz+UItRdmX3MdtmJlRx7fMURg5/QQa0ltd3O+/zV
	 K8V1/KR5kHgh3M+rkl3h9ZQq08w27TWKAObu1uk/BTv2Za5qHhyM64PrzdKoCtFtqr
	 g545sVd85CEHiInw1Db2ROtvtDNP5BQ/rzbwKGXCitDUKjIX/Krw/Viy49+mnZB636
	 vg/GLbRn/rpqfKnV1O3YyAkZ4fAcBwDbRgJiCtVdBaJO/C9qdqMTK9IoNsWyY3JG0E
	 LrUgxxBVR3bWQ==
Date: Mon, 28 Apr 2025 09:59:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com, 
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: imx8mq-usb: improve some tuning
 properties
Message-ID: <20250428-thankful-observant-trogon-a5a003@kuoka>
References: <20250423094607.1029429-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250423094607.1029429-1-xu.yang_2@nxp.com>

On Wed, Apr 23, 2025 at 05:46:06PM GMT, Xu Yang wrote:
> Commit b2e75563dc39 ("dt-bindings: phy: imx8mq-usb: add phy tuning
> properties") add many tuning properties, but some parameter value doesn't
> match the register description. It made some changes based on the original
> value: add offset to a negative number so turn it to a non-negative number.
> However, this conversion bring many pain when some properties need to be
> improved.
> 
> Because device-tree supports negative parameter number, this will improve
> some propertie's parameter.
> 
> Mainly include below properties:
>  - fsl,phy-tx-vref-tune-percent
>  - fsl,phy-tx-rise-tune-percent
>  - fsl,phy-comp-dis-tune-percent
> 
> The parameter value of above 3 properties are USB PHY specific. i.MX8MP
> and i.MX95 USB PHY has different meanings. So this add restrictions for
> them.
> 
>  - fsl,phy-tx-vboost-level-microvolt
> 
> For this property, the parameter value is wrong in register description.
> This will correct it according to true value.
> 
> For detailed info, please refer to i.MX8MP and i.MX95 latest reference
> manual.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  .../bindings/phy/fsl,imx8mq-usb-phy.yaml      | 43 +++++++++++++++----
>  1 file changed, 35 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> index daee0c0fc915..b09e3dab4c59 100644
> --- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> @@ -43,15 +43,11 @@ properties:
>    fsl,phy-tx-vref-tune-percent:
>      description:
>        Tunes the HS DC level relative to the nominal level
> -    minimum: 94
> -    maximum: 124

Widest constraints should always stay here.

>  
>    fsl,phy-tx-rise-tune-percent:
>      description:
>        Adjusts the rise/fall time duration of the HS waveform relative to
>        its nominal value
> -    minimum: 97
> -    maximum: 103
>  
>    fsl,phy-tx-preemp-amp-tune-microamp:
>      description:
> @@ -63,15 +59,12 @@ properties:
>    fsl,phy-tx-vboost-level-microvolt:
>      description:
>        Adjust the boosted transmit launch pk-pk differential amplitude
> -    minimum: 880
> -    maximum: 1120
> +    enum: [844, 1008, 1156]
>  
>    fsl,phy-comp-dis-tune-percent:
>      description:
>        Adjust the voltage level used to detect a disconnect event at the host
>        relative to the nominal value
> -    minimum: 91
> -    maximum: 115
>  
>    fsl,phy-pcs-tx-deemph-3p5db-attenuation-db:
>      description:
> @@ -112,6 +105,40 @@ allOf:
>          reg:
>            maxItems: 1
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - fsl,imx8mq-usb-phy
> +            - fsl,imx8mp-usb-phy
> +    then:
> +      properties:
> +        fsl,phy-tx-vref-tune-percent:
> +          minimum: -6
> +          maximum: 24

That's ABI break with vague reason "some pain".

Best regards,
Krzysztof

