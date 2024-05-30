Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08771E532
	for <imx@lists.linux.dev>; Thu, 30 May 2024 15:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717081335; cv=none; b=NX/Zr+qA7cFQ6bpZsEJ0yNGlL/J7kl6eQ8I5tlIA08/RkI0o1Y1ihvitb5qV/2oda5TZTkCyUd+JxlQZWI7gtqPAijCTOIv5Ndfl9GZwQmcnowl8zWfxIRsoy+uuOYY1ex4ZlsF9hlxltwv918PJsCsW7htQ/QKqfvUIyBQ9xqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717081335; c=relaxed/simple;
	bh=Gh9cbHiV0vQlIQ0Ybp3Zq7HDBJmoleGPJjiVwVpWMcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+Bbu3E3EoZ2VbXv/+pdUZ/CJt/LGTt/Orvs5+MlzIrPm1fzfLy4ih9JNSMyW01mCnm82a/oV1cQlqq0oc10G0PV0ETe04dxifGIX4lbFK8dKz+yHSYIOefUCgqUessFjFvJs3QDiBxh6h74RsKCCEoxnt2tblxABOJYI5eCn6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a22cgIii; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a22cgIii"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-421140314d5so10464835e9.0
        for <imx@lists.linux.dev>; Thu, 30 May 2024 08:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717081332; x=1717686132; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=giZRcSqmVr6pTJj0L38lY8BgbAhYw8xa4kQEZAhZtZw=;
        b=a22cgIiihQ7S+h1+zi5MzmZ19eBnJPyZGwLCyDbAViLRqLPPsBgYyOaERzv0LpHSiI
         Yw/zO6/zy4e6+YnNNlAp0a8itWS7KSF5wRM9hvKnAg0101YOcYu8ywu9CY/+TlyJMHVH
         RFZohnNEph+pa6GX9vcwS0ZwQG851OQYknVxj5jWtDyhH7jRrTRk7F+XdYLloUtgtI3R
         xhIhKJhR1vLBezTo2b7d64OnR3uI5tL01AnLiavvLwGxxVCNtzLjQjQ9Ed8N1j/ijiwu
         fHRK1tNZPcZ8gT6FE8VV18423m9fAsKxLTzTeB4xsiMgJONNL+gTj9nFuskaupUs4ILJ
         0MxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717081332; x=1717686132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=giZRcSqmVr6pTJj0L38lY8BgbAhYw8xa4kQEZAhZtZw=;
        b=SuctNALUJz+cDojdOOtoqUqb2Nb1mV1imQqktgimDbbFEE/JnJV6uOgHd6hxsGabSl
         JKa3YeA/jAxIckQbkLgfxI5NnZb3S5Vpw/yZu7j8z0UxxSv4jsVBBqqKsuX6jeTFXdyI
         HnQzMSuo/8/GTqjn0BedguWUIQNo3HMICDidNwMaD68z7SxL+1XjCHU2GvEJiUjVho1Z
         Ba2Ss1kdAYI3GyDqL+ARcZrJTl5Rdx6Dc9Fj0OzZXUOeRI9hnEQSCgPII7OR9T8v+ewg
         yATpaU1+/R+rkGeQZcBQkuiQ56aGmy3HaF/ZS7RpZhxCU8h8/t8wuyyNsbIuCUrZ7mZk
         KIYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZnzcw7zI0b2olF9R7znsQq+ssKx49+DEJHcDshLcBQ0fUyJwrmsWsVmko4BsAo3VdJ4RPHHJsMm5aBfd1W3d4L9rE
X-Gm-Message-State: AOJu0YzSpklGPRoj3lUJicxrAKhrFsia5I30HYS4hTlA3YJeYCGk3Cpb
	kA+QI9pMd+zml4hz8ET4MYF4qFp6pCWCDkNZzFvdw7Hnetf+rGbi
X-Google-Smtp-Source: AGHT+IFjQF/lcM7ZPr6DlNqP24gQj5UIxSjOg0Yx8aoFMh9AlWjbAddylnUOhdKXlfOwpdRpBPxpGA==
X-Received: by 2002:a05:600c:4ba4:b0:421:15f:186a with SMTP id 5b1f17b1804b1-42127932790mr20985215e9.39.1717081331646;
        Thu, 30 May 2024 08:02:11 -0700 (PDT)
Received: from skbuf ([188.25.55.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421270662bfsm27600385e9.15.2024.05.30.08.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 08:02:10 -0700 (PDT)
Date: Thu, 30 May 2024 18:02:08 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] spi: dt-bindings: fsl-dspi: Convert to yaml format
Message-ID: <20240530150208.k3xdobbxznaqchch@skbuf>
References: <20240529193651.1029840-1-Frank.Li@nxp.com>
 <20240529193651.1029840-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529193651.1029840-1-Frank.Li@nxp.com>
 <20240529193651.1029840-1-Frank.Li@nxp.com>

Hi Frank,

On Wed, May 29, 2024 at 03:36:50PM -0400, Frank Li wrote:
> Convert dt-binding spi-fsl-dspi.txt to yaml format.
> 
> Addtional changes during convert:
> - compatible string "fsl,ls1028a-dspi" can be followed by
> fsl,ls1021a-v1.0-dspi
> - Change "dspi0@4002c000" to "spi@4002c000" in example
> - Reorder properties in example
> - Use GIC include in example
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> 
> Notes:
>     pass dt_binding_check
>     
>     make dt_binding_check DT_SCHEMA_FILES=fsl,dspi.yaml
>       SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>       CHKDT   Documentation/devicetree/bindings
>       LINT    Documentation/devicetree/bindings
>       DTEX    Documentation/devicetree/bindings/spi/fsl,dspi.example.dts
>       DTC_CHK Documentation/devicetree/bindings/spi/fsl,dspi.example.dtb
> 
>  .../devicetree/bindings/spi/fsl,dspi.yaml     | 126 ++++++++++++++++++
>  .../devicetree/bindings/spi/spi-fsl-dspi.txt  |  65 ---------
>  2 files changed, 126 insertions(+), 65 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/fsl,dspi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
> 
> diff --git a/Documentation/devicetree/bindings/spi/fsl,dspi.yaml b/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
> new file mode 100644
> index 0000000000000..12a67b2cc25c8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
> @@ -0,0 +1,126 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Freescale DSPI controller
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  fsl,spi-cs-sck-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      a delay in nanoseconds between activating chip
> +      select and the start of clock signal, at the start of a transfer.
> +  fsl,spi-sck-cs-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      a delay in nanoseconds between stopping the clock
> +      signal and deactivating chip select, at the end of a transfer.

Thanks for this patch and for picking up on this task.

But fsl,spi-cs-sck-delay and fsl,spi-sck-cs-delay are not controller
properties as this schema makes them appear, but rather, child node
properties.

Could you try and take a look at how the previous attempt went, and
incorporate some of its good parts?
https://lore.kernel.org/linux-spi/20221111224651.577729-1-vladimir.oltean@nxp.com/
