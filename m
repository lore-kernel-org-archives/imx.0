Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94843373BF4;
	Tue,  3 Mar 2026 07:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772521854; cv=none; b=kjZlQ8ORs8AKAf1oXOM/9Q4UpimIEx5EWqm1HxtnZjmFArtLXikVnxCt7C+wugzA86AkgUft46lLUErE5eFoexUPor2QSVZ8CB3qwYpZ0EaYk5tziFIaj0Nj5ZLKor+qtUWJs+3/4lvPz8aPQ6w65ZoqCeXiUrXcesokCSMX9kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772521854; c=relaxed/simple;
	bh=pBHQLMDwk1MY9/39mtqq/JiDGHIU87rGe3pEu29CWLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lxkASa0DgqneLamZYppcUlIK/GTjBaJZDIWE6KZpqy9MpExHRjBgAN26XBC8F6X2eqF8gbfEMTGIxtZeoyxUckUO+2YHkVZ0fUsHH11nj+0OUZhNf5f9RDi3/dGdzzTuEnfymQTZgfCRdf/eCFlk+P4nZyTaQr0vhBznlo1GkzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpHGIKcu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpHGIKcu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5567C116C6;
	Tue,  3 Mar 2026 07:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772521854;
	bh=pBHQLMDwk1MY9/39mtqq/JiDGHIU87rGe3pEu29CWLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NpHGIKcu+rt4IsNFB7vxOydVo4a2Zit6xSIB4dZdDP7+9aR2cwMdHaEBRkG7RycU0
	 +rGDnNsbt2qHHvh7R+lxNXMwX6GufP2QZxfvyO4B6jSUNkcvDPVTDPcXoRzcJ0nDYV
	 0jMJVKDTS9QyqEG2+F0JbVllCrtbZVYFMZo76pdCXL6daxKQqLAp3ttWfbV5EVlUwq
	 Aki9qA16Swm5iS+TcO6MudNns36+8UcHrncNwvtLp1xhEwKoAH2XIbJGUzB6dbZ1+e
	 7iJ4mmYFWU5wUSWu5ey6DWkvkqQmLKn7iKDm7KmcrG62QE9tYHwGl7yyaJr+zGj8a0
	 IsEmHjuMFxCEg==
Date: Tue, 3 Mar 2026 08:10:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, shawnguo@kernel.org, laurent.pinchart+renesas@ideasonboard.com, 
	antonin.godard@bootlin.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH 04/14] dt-bindings: arm: fsl: change incorrect
 VAR-SOM-6UL model name
Message-ID: <20260303-rational-thundering-firefly-9dcaa9@quoll>
References: <20260302190953.669325-1-hugo@hugovil.com>
 <20260302190953.669325-5-hugo@hugovil.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302190953.669325-5-hugo@hugovil.com>

On Mon, Mar 02, 2026 at 02:03:40PM -0500, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> There is no Variscite module named VAR-SOM-MX6UL.

VAR-SOM-MX6? And there is.
https://dev.variscite.com/var-som-mx6/

> 
> The official name from the manufacturer is VAR-SOM-6UL.
> 
> Change SOM model name to VAR-SOM-6UL to reduce confusion.

That's just one paragraph. Please write concise commit msgs so reading
them will be fast and easy.

Not a sentence.

By a sentence.

In multiple steps.

> 
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 5716d701292cf..99dc1b3f1ba92 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -688,7 +688,7 @@ properties:
>            - const: phytec,imx6ul-pcl063   # PHYTEC phyCORE-i.MX 6UL
>            - const: fsl,imx6ul
>  
> -      - description: i.MX6UL Variscite VAR-SOM-MX6 Boards
> +      - description: i.MX6UL Variscite VAR-SOM-6UL Boards
>          items:
>            - const: variscite,mx6ulconcerto
>            - const: variscite,var-som-imx6ul
> -- 
> 2.47.3
> 
