Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957012F33
	for <imx@lists.linux.dev>; Fri,  5 May 2023 19:14:23 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6a5f852002dso1359713a34.3
        for <imx@lists.linux.dev>; Fri, 05 May 2023 12:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683314062; x=1685906062;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ob/tYM63KWmpHL+MbVncyNEUjCaAQy3a3Q0ZpHwG/qc=;
        b=Q5ROtcdr3r1CHyDytwXa4xLzi4G7UebH8MPxnpnSID8Z+ff9n+C+w5U3Ln1a/aqeVW
         mKOQkTd9sx3eEOm4y9UaF+faT/5OlG/xI3Anx24g+e9hW1W9KVlVkVU10OH5kev6ypB+
         vEklL5j0noFWpp9EbEae1dwtGbaZ7JYOaDz44YNVrP9ic9VeC6eVWijChleVaN96VPou
         XeaPM8rzYb41XstdV5oWbzJ4IJhYen8vkIAhosUCzmn96wVWM0dqw3L1i2UU1knrJV7T
         RyId49tqbCxeHcvpPCPb2Oe/phPrD2GQMsiGk8RD0RNiJ4DXK+StadT/uXFl30nFRXHs
         MsEQ==
X-Gm-Message-State: AC+VfDxVa0ZoksHXJacdmvgA6qXmwa+OZXXSGmLQxJyfTSbvCPHiSowQ
	JdRV/80L5gYta4T6xcBigA==
X-Google-Smtp-Source: ACHHUZ6FK7GAnvCJYewkHMMfv4Kk0sJFerm0OriIL32hAr3N87hUS6kt7QUf+IvQqrQPQ3I++KfXOA==
X-Received: by 2002:a05:6871:40f:b0:180:2a5e:7f8f with SMTP id d15-20020a056871040f00b001802a5e7f8fmr1374449oag.22.1683314062575;
        Fri, 05 May 2023 12:14:22 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ec51-20020a0568708c3300b001727d67f2dbsm2153520oab.40.2023.05.05.12.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 12:14:21 -0700 (PDT)
Received: (nullmailer pid 3406638 invoked by uid 1000);
	Fri, 05 May 2023 19:14:20 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: shawnguo@kernel.org, devicetree@vger.kernel.org, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, imx@lists.linux.dev, fushi.peng@nxp.com, krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, kishon@kernel.org, vkoul@kernel.org, robh+dt@kernel.org
In-Reply-To: <20230505185247.1854677-2-Frank.Li@nxp.com>
References: <20230505185247.1854677-1-Frank.Li@nxp.com>
 <20230505185247.1854677-2-Frank.Li@nxp.com>
Message-Id: <168331406075.3406622.9380633591504481297.robh@kernel.org>
Subject: Re: [PATCH 2/2] doc: dt-binding: cdns-salvo-phy: add property
 usb2-disconnect-threshold-microvolt
Date: Fri, 05 May 2023 14:14:20 -0500


On Fri, 05 May 2023 14:52:47 -0400, Frank Li wrote:
> Add usb2-disconnect-threshold-microvolt property to address fake USB
> disconnection issue during enumeration or suspend state for difference
> platform.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml: properties:usb2-disconnect-threshold-microvolt: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230505185247.1854677-2-Frank.Li@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

