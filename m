Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD1339E
	for <imx@lists.linux.dev>; Tue, 12 Dec 2023 22:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-59082c4aadaso3076053eaf.0
        for <imx@lists.linux.dev>; Tue, 12 Dec 2023 14:44:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702421068; x=1703025868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMphJ493+DciN8lLws8RSRlMD94qy0SoU2WP5DJOjj4=;
        b=bH0uSd/3c/1sRGQl6axA2+nwx6jNiLwJHsH+F37laFzT7mPkDec1OirRMyw1szMMt5
         hbliOMzVUNV2bcfHoEPBGVeOiG23bcuGvGdWAFsrr5mRaWVTbs0yZXkDMyWszVzdhuX2
         HnhNpjzN+szZeLW4bvQJIiXLjeZ8ijsDB0j9UhEYpwsAInJsJqg+3kcNuUzUfgQrN/y0
         +ZLLZGPJ1SEDOD75V369w+5KD83lNTy0EvmL4K0fbT1ojtEA5p+rH4Mw/QdQVK6PQjzm
         efoD03omf3XSBaopzqROqQinCy1vZtK//3cB1XV1Gc/sFk9eOcJ5KtXhZ7SmXXRqtl97
         1xog==
X-Gm-Message-State: AOJu0YxL4XanzR/varwe7uHoXclVmEnASBGiqc3y5jMqBrDqG2KhaT+u
	T5hd1hOTsa5OJbYG0sjMIA==
X-Google-Smtp-Source: AGHT+IFjb8zyZy6HgbNr/jID6qfej7EjNW9FQEisDXKCGMer4Y5UYOBAfKHQdPfu1aEWyVUhGqcagQ==
X-Received: by 2002:a05:6808:148a:b0:3b9:ca51:5186 with SMTP id e10-20020a056808148a00b003b9ca515186mr7781124oiw.42.1702421068119;
        Tue, 12 Dec 2023 14:44:28 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ct7-20020a056808360700b003b9fd2af1f1sm1970848oib.32.2023.12.12.14.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 14:44:27 -0800 (PST)
Received: (nullmailer pid 2966246 invoked by uid 1000);
	Tue, 12 Dec 2023 22:44:26 -0000
Date: Tue, 12 Dec 2023 16:44:26 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: bhelgaas@google.com, conor+dt@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com, helgaas@kernel.org, hongxing.zhu@nxp.com, imx@lists.linux.dev, kernel@pengutronix.de, krzysztof.kozlowski+dt@linaro.org, kw@linux.com, l.stach@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org, s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH v3 08/13] dt-bindings: imx6q-pcie: Add imx95 pcie
 compatible string
Message-ID: <20231212224426.GA2948988-robh@kernel.org>
References: <20231211215842.134823-1-Frank.Li@nxp.com>
 <20231211215842.134823-9-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211215842.134823-9-Frank.Li@nxp.com>

On Mon, Dec 11, 2023 at 04:58:37PM -0500, Frank Li wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
> 
> Add i.MX95 PCIe "fsl,imx95-pcie" compatible string.
> Add "atu" and "serdes" to reg-names.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
> 
> Notes:
>     Change from v2 to v3
>     - Remove krzy's ACK tag
>     - Add condition check for imx95, which required more reg-names then old
>     platform, so need Krzy review again,
>     
>     Change from v1 to v2
>     - add Krzy's ACK tag
> 
>  .../bindings/pci/fsl,imx6q-pcie.yaml           | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> index 81bbb8728f0f9..b8fcf8258f031 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> @@ -29,6 +29,7 @@ properties:
>        - fsl,imx8mq-pcie
>        - fsl,imx8mm-pcie
>        - fsl,imx8mp-pcie
> +      - fsl,imx95-pcie
>  
>    reg:
>      items:
> @@ -90,6 +91,22 @@ required:
>  allOf:
>    - $ref: /schemas/pci/snps,dw-pcie.yaml#
>    - $ref: /schemas/pci/fsl,imx6q-pcie-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - fsl,imx95-pcie
> +    then:
> +      properties:
> +        reg:
> +          minItems: 4
> +        reg-names:
> +          items:
> +            - const: dbi
> +            - const: serdes

Did you test this? It should fail because 'serdes' would need to be 
added to snps,dw-pcie.yaml.

Is this really not a separate phy block? A separate node would be 
ideal. If not, there's already a 'phy' name you can use here. We don't 
want more random names.

Rob
