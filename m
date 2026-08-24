Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEB543C07C
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 14:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787582335; cv=pass; b=kBxI0fQiU6rJwVIj7an6aUD0PP551vyM4XOMseBV/rOVDGVUkkpqOiouhofzlaKUAWONwCxqyf4SjhhCfNfzL09tDQK7cebmL4gGpjeb/k5dqjhpnwEtYtSOfRxrYqENTzsHwXKdqdzklx0ywL4C3ZO2Yb7p5rzWPmS5IkN7+4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787582335; c=relaxed/simple;
	bh=uIVVpMDmMGX0h/fu4HXu0BYDldpKQW0ZxH1umBAPys0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ECAHotUGr438acyxBIZ9/LwFO+728zUOwI0K+LjncZ6GmPF9iGDwoDzeW9Xiu9o6j+SoUIdgrDtM9pzdJbOFNOMx3ZruC3hQUio0SeaqRm5r5uFVSIiI/e7kTfTqmIMW4dpc+Iso/sMjKrCYBWhCt/80cAotFzDgn6LwT/x7fYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BoNeG2rK; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BoNeG2rK"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a15d54ac95so6197774a12.0
        for <imx@lists.linux.dev>; Mon, 24 Aug 2026 07:38:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787582330; cv=none;
        d=google.com; s=arc-20260327;
        b=U4bGi3aa1vIx2ErHamdlG9F0sqBkaGXSiHjB6RSPXtKiXE3dW4qES7vICfvJQBUS35
         b7XKk9qFB76uBrcSyVbuOAYkffBzRiTNxo2aYv4NbjpUfDiVE17EoCmfPxzaq54kVtT4
         CjCJzHG1lV71DzJDwb1WvoyJwaj/vmxuzpSAl+nPsJAtDKyCGv8skvoxiDfAjqqOC9EV
         Of5H5otSW4jdKJ4IqVhJStoUewPs1MZ3T9krr2723ePPfJ/G7bpb/lCus6uFpqgIUwwA
         QquZcY8pUNrBG7oGKHPfJdA7F58EwtZxEXdvTbLe+zeuH3GWvr4J79SLnGpGZ28H3qEx
         LseQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Vm1p9M4lR0nH2xefCtH9dUaY37Y2P9W6T0kJp4WGVyI=;
        fh=9UKZiTjHQ95Aivn2oMwdhXJIjMWd2poEI+gtDrGjhYE=;
        b=Q3Nz0cel40JxeWkUhUBKRJAurGjStuDxu2wdtNPGfZv4JRhkaqvgny732GWnGAVeEo
         fi7KWzAflS72hJGfoJZ67a/pUJvenQof249yMjdJReZCpp0iBbGYy1O0L4G1FhVPpiQH
         yLiu6F65IrvmZRCYo0kq4fOdqTAEsVNAWJn/hisS33c0t7fRR9sa4b+ZwQAqhPm6INhH
         1dR7q/nK/d8xHzmTCp7u182axsARqxj3V7nctQDo5Kh27cj+HMFZPyRHRjDw18rdyZy1
         WbsLJfz1vP1m3JLKHO1MRrDEhv/i7m0fzPyyY9ydTPUcOSdukbzWUH9a6ShN1mHMirv6
         yeWQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787582330; x=1788187130; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vm1p9M4lR0nH2xefCtH9dUaY37Y2P9W6T0kJp4WGVyI=;
        b=BoNeG2rKctV7aTcMti0v5GBbCESOo1lAEPKNSWozHRWXB9ZCZSEIKKyjKgp4pilqFg
         +DaViHafNPnSL8xxh6gN8BsVBvx+/jAY/dWwTM33QDhz9SQQvpsojAcAZ/0cRIB50PX5
         xiJKIL4qjTbTYIR2yhEriTXibsrwHz61WmpqGegSBr8HUZ8mGJWxAiU7JR99L2nEttl7
         HkByE775p6OkalhezkNGIho9plz/0DWuNVrJ7D4gODFMStdifWrQz036WBy6V1ZctaF9
         6pwFB9JvATdRF2Pn3pQjN5qfhYl/gRSz+lt0LoGX23EBdv3KHPbtfCRK0b/5/JN1SbuL
         TOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787582330; x=1788187130;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vm1p9M4lR0nH2xefCtH9dUaY37Y2P9W6T0kJp4WGVyI=;
        b=QaMmAb3K1Ie4bCjj5lw9phZDpk3tzCj7NUPEXP/7tKlV7Dc+QbjX2+013Gs6+r2i2y
         mu+amS/lR0hGiqDCuBqDG0K+E+tWFfblbbQTb1GwBg8fXwyTchI8hzCyt1EEHAXokRoj
         3TdHBNv5iKrCrUtiIAAkT67VqxPMJJg+ze7DfnA880RSgjGej3wy9auQJGh8yHJbEt0Q
         VsS4qXBMt4IYY+NXJ5QmID2Zqvz9Z3yna5H/0qXHsia8k2DBKKm0hmn2SdACtQnZ/pdd
         OJhqIRYE3E2QK0XxdjfRPsLaR65NxQMUV36ayQaSsRTtWKo2CKnjVDsJskano3yRYxgu
         +esQ==
X-Forwarded-Encrypted: i=1; AHgh+RrxEpXLoE4ReUXnhBBrdEo/kJhJTp57Hm4npiARRzxKJBrmv73ij16BRcBP/3cQFcJnX/o=@lists.linux.dev
X-Gm-Message-State: AFuF++mkyGkwX71fiqRdEAJLCcF2KYefqUtI53tuhrd82qP1Ul0Hjwnf
	drTbDLV5+qZTTcHsqlteE8Gv96JP8HdBw9QL8nnyCfzKqwuPGqBmKIO5XWyeDeYuC+fsCuWWrPB
	3qtRcpcTf+JpAuH/Wcf7z3YYwybPCg8FScfLlqzyfxg==
X-Gm-Gg: AR+sD1004PBArhMpQE6r3m4s3nIk2caZ/K9huVrh+VqgGX8hkxA2aI1S5FxzsUmC56i
	HKuBl8PtEY0O+eYJ/HzpcenoXX7aJGMqar1xopszhPEBUgxRQAvvYsF1qSXLpzgem696+sw4jzV
	F3Uv3DV+laGoyYsJHvQDsCfO4Q5lMwM/hUiV1JGU22aMvY93s8H1OgOpWNR1EAhcVmqefNBUHOq
	xCKz/vZ5Fr8nNJEGTSrx7Nhh6zH4wT6aECPv+J9L3ySpgpYtuL8ediqvfO5qK4Rmq6rGc37LyJJ
	TCMzsMA8Tgq9K4Wrqf3fv01+todn1ndmkjmn5ZE93+OTcJ/kFoHPZ45gpEc1VwpltjdbfrXWS+q
	k5W0=
X-Received: by 2002:a05:6402:a50a:10b0:6a4:cc9:e32b with SMTP id
 4fb4d7f45d1cf-6a582b608b0mr13946214a12.9.1787582330522; Mon, 24 Aug 2026
 07:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com> <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
In-Reply-To: <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 24 Aug 2026 08:38:38 -0600
X-Gm-Features: AcwNN1WkCFZbvWxe4PQA8OwbQcV2Qi4oWD0S_a9VEHwbP89HadQ5rWBGiqMxI74
Message-ID: <CANLsYkxZbr9hKaJJGXwYXErLwQ-A07eb-oeNXY1CceHHa0Tdmg@mail.gmail.com>
Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
To: Shenwei Wang <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Jul 2026 at 14:48, Shenwei Wang <shenwei.wang@oss.nxp.com> wrote:
>
> From: Shenwei Wang <shenwei.wang@nxp.com>
>
> Remote processors may announce multiple GPIO controllers over an RPMSG
> channel. These GPIO controllers may require corresponding device tree
> nodes, especially when acting as providers, to supply phandles for their
> consumers.
>
> Define an RPMSG node to work as a container for a group of RPMSG channels
> under the imx_rproc node. Each subnode within "rpmsg" represents an
> individual RPMSG channel. The name of each subnode corresponds to the
> channel name as defined by the remote processor.
>
> All remote devices associated with a given channel are defined as child
> nodes under the corresponding channel node.
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 55 +++++++++++++++++++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 53 ++++++++++++++++++
>  2 files changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> new file mode 100644
> index 000000000000..41eb2e149942
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-rpmsg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic RPMSG GPIO Controller
> +
> +maintainers:
> +  - Shenwei Wang <shenwei.wang@nxp.com>
> +
> +description:
> +  On an AMP platform, some GPIO controllers are exposed by the remote processor
> +  through the RPMSG bus. The RPMSG GPIO transport protocol defines the packet
> +  structure and communication flow between Linux and the remote firmware. Those
> +  controllers are managed via this transport protocol. For more details of the
> +  protocol, check the document below.
> +  Documentation/driver-api/gpio/gpio-rpmsg.rst
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,rpmsg-gpio
> +          - const: rpmsg-gpio
> +      - const: rpmsg-gpio
> +
> +  reg:
> +    description:
> +      The reg property represents the index of the GPIO controllers. Since
> +      the driver manages controllers on a remote system, this index tells
> +      the remote system which controller to operate.
> +    maxItems: 1
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +allOf:
> +  - $ref: /schemas/gpio/gpio.yaml#
> +
> +unevaluatedProperties: false
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c18f71b64889..b9b559b186af 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -88,6 +88,34 @@ properties:
>        This property is to specify the resource id of the remote processor in SoC
>        which supports SCFW
>
> +  rpmsg:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      Represents the RPMSG bus between Linux and the remote system. Contains
> +      a group of RPMSG channel devices running on the bus.
> +
> +    properties:
> +      rpmsg-io:
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          '#address-cells':
> +            const: 1
> +
> +          '#size-cells':
> +            const: 0
> +
> +        patternProperties:
> +          "^gpio@[0-9a-f]+$":
> +            type: object
> +            $ref: /schemas/gpio/gpio-rpmsg.yaml#
> +            unevaluatedProperties: false
> +
> +        required:
> +          - '#address-cells'
> +          - '#size-cells'
> +
>  required:
>    - compatible
>
> @@ -150,5 +178,30 @@ examples:
>                  &mu 3 1>;
>        memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
>        syscon = <&src>;
> +
> +      rpmsg {
> +        rpmsg-io {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          gpio@0 {
> +            compatible = "rpmsg-gpio";
> +            reg = <0>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +          };
> +
> +          gpio@1 {
> +            compatible = "rpmsg-gpio";
> +            reg = <1>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +          };
> +        };

As I (and Arnaud) have stated before, I don't think this is the best
way to lay out bindings for rpmsg-gpio nodes.  I am currently thinking
about a representation that aligns better with other virtio devices.

> +      };
>      };
>  ...
> --
> 2.43.0
>
