Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E382367BA;
	Tue, 29 Jul 2025 07:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753773279; cv=none; b=KTxgrvfWSBjcgreXFuPASJyN9+eHvwTCUc9DGTONRwsNiPRKJOe6zfppoJ/dRli25zsBb8JSYxzKKY5yq3Aber/OLPQjATUv2cbAK0TBUHPk7By7gwVz3Xe2BeSOiYCOAh7gNSMESWTwIlPji62bS2lpyP9hb76agdhM6qlD6kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753773279; c=relaxed/simple;
	bh=9jaI39l1Uh8xxeZqcMi491zMxReRhgEiKezb0D06vIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tqJn5mGq+dFF0wwQuhwF6L6jaK0suu83B7mp0pKlYFRnsgAFwg+XuqLcwdudxzbMeufRCO+XVLGEb+eb7PSB7n0NuraM6lRBi9fSwlB+PdDPP3ZWB1dREcxHRTLroRvdKwT0exfR1yLK4KVR3tKWf6Vcco76UYHfGQ5ABaknDDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pZtE34Ul; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pZtE34Ul"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B32C4CEEF;
	Tue, 29 Jul 2025 07:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753773279;
	bh=9jaI39l1Uh8xxeZqcMi491zMxReRhgEiKezb0D06vIc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pZtE34UlOQ1ny5tcZcYAEXUc24qujKBJZSiuRWpp6Ki56TUavO2sKV0aebhNRPVG1
	 CZPO3RcUyeMrRFRGrW6EMGC1GfI8iyJ7LfcUmK0k1DjH1fJUI5pAcFxw7AWb/J0FkZ
	 SufWEBZ2WmKp4p7mY5xHH8Kn8n0WWH/jphoAc16PB+/GLpOo+C5tLtxQBqZBUnkwps
	 A8I818nnQ9aI4vA654zE31NI2/t7+A0ec2S1h8dagkdIUqB00eQ0fJRKazvrMNS5uV
	 eOvpi+z0OukP8odiv9nj/FQYlprzHd2TPaHvtmx03FcB3ZAkxRoVgbEMnxQKt/1X3Z
	 oxVjDzyZtHXeA==
Message-ID: <6f9f3b70-fb5a-4af2-a01c-5bc14fff8b90@kernel.org>
Date: Tue, 29 Jul 2025 09:14:35 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 dt-bindings]dt-bindings: debix-model-a: Add bindings
 for BT and audio
To: WangErQian <WangErQianY@icloud.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, john@polyhex.net
References: <20250729031351.3875406-1-WangErQianY@icloud.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250729031351.3875406-1-WangErQianY@icloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/07/2025 05:13, WangErQian wrote:
> Add bindings for Debix Model A Bluetooth and audio
> 
> This patch adds device tree binding documentation for:

Read submitting patches. It explains how to write appropriate commit msg
and what should be in the patchset.

> - fsl,mxc_bt_rfkill.yaml: Bluetooth RF control node
> - fsl,imx-audio-es8316.yaml: Audio codec interface

Read submitting patches. There is VERY important paragraph called -
separate your changes.

> 
> Signed-off-by: WangErQian <WangErQianY@icloud.com>

No, you need real name.

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

Please use standard email subjects, so with the PATCH keyword in the
title. `git format-patch -vX` helps here to create proper versioned
patches. Another useful tool is b4. Skipping the PATCH keyword makes
filtering of emails more difficult thus making the review process less
convenient.

There is no patch prefix called "dt-bindings".


> ---
>  .../bindings/bluetooth/fsl,mxc_bt_rfkill.yaml | 70 +++++++++++++++
>  .../bindings/sound/fsl,imx-audio-es8316.yaml  | 88 +++++++++++++++++++
>  2 files changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml b/Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml
> new file mode 100644
> index 000000000000..b173de7a4102
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +$id: http://devicetree.org/schemas/bluetooth/fsl,mxc_bt_rfkill.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX Bluetooth RFKill Controller
> +
> +maintainers:
> +  - WangErQian <wangerqiany@icloud.com>
> +
> +description: |
> +  Binding for NXP i.MX Bluetooth RFKill controller, managing power and wake signals via GPIOs.

No, explain the hardware, not what binding is.

> +
> +properties:
> +  compatible:
> +    const: fsl,mxc_bt_rfkill

There is no user of this, so why posting this binding?

> +
> +  pinctrl-names:
> +    maxItems: 1
> +    items:
> +      - const: default
> +
> +  pinctrl-0:
> +    type: phandle
> +    description: Phandle to default pin control configuration
> +
> +  bt-power-gpios:
> +    description: GPIO controlling Bluetooth power (active low)
> +    maxItems: 1
> +
> +  wake-bt-gpios:
> +    description: GPIO for waking Bluetooth device (active low)
> +    maxItems: 1
> +
> +  wake-host-gpios:
> +    description: GPIO for host wake-up signal (active low)
> +    maxItems: 1
> +
> +  status:
> +    type: string
> +    enum: [ "okay", "disabled" ]
> +    default: "okay"

Do you see ANY binding with such syntax? No. There is no and this should
be a hint that you are doing something wrong.

Anyway, entire binding does not describe the hardware, so this cannot be
accepted. Bindings describe real hardware devices, not virtual beings
like some containers for GPIOs.


...

> diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml b/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml
> new file mode 100644
> index 000000000000..35f13d656caf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +$id: http://devicetree.org/schemas/sound/fsl,imx-audio-es8316.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX Audio Interface with ES8316 Codec
> +
> +maintainers:
> +  - WangErQian <wangerqiany@icloud.com>
> +
> +description: |
> +  Binding for NXP i.MX platforms using the Everest ES8316 audio codec.

Same comments

> +  Defines the connections between CPU DAI (SAI), codec, and audio routing.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx-audio-es8316

There is no user for it or your commit msg is incomplete.

> +
> +  model:
> +    type: string
> +    description: Descriptive name of the audio setup (e.g., board-specific)
> +    default: "imx-audio-es8316"

How other bindings do this?

> +
> +  audio-cpu:
> +    type: phandle
> +    description: Phandle to the CPU audio interface (e.g., SAI node)
> +    maxItems: 1
> +
> +  audio-codec:
> +    type: phandle
> +    description: Phandle to the audio codec (ES8316 node)
> +    maxItems: 1
> +
> +  format:
> +    type: string
> +    description: Audio data format (e.g., i2s, left-justified)
> +    enum: ["i2s", "right-justified", "left-justified", "dsp-a", "dsp-b"]
> +    default: "i2s"

How other bindings do this?

> +
> +  hp-det-gpio:
> +    type: phandle-array
> +    description: GPIO for headphone detection (active high)
> +    maxItems: 1
> +    items:
> +      - description: GPIO specifier (controller + pin + flags)
> +
> +  audio-routing:
> +    type: string-array
> +    description: Connection mapping between codec pins and audio components
> +    items:
> +      minItems: 2
> +      maxItems: 2

These are redundant. I don't think this was tested.

> +      items:
> +        - description: Source endpoint (e.g., "Mic Jack")
> +        - description: Sink endpoint (e.g., "MIC2")
> +
> +required:
> +  - compatible
> +  - audio-cpu
> +  - audio-codec
> +  - audio-routing
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    sai3: sai@40031000 {
> +        compatible = "fsl,imx8mp-sai";
> +        reg = <0x40031000 0x1000>;
> +    };

Drop node, not relevant.

> +
> +    codec: es8316@11 {
> +        compatible = "everest,es8316";
> +        reg = <0x11>;
> +    };

Drop node, not relevant.


> +
> +    sound {
> +        compatible = "fsl,imx-audio-es8316";
> +        model = "imx-audio-es8316";
> +        audio-cpu = <&sai3>;
> +        audio-codec = <&codec>;
> +        format = "i2s";
> +        hp-det-gpio = <&gpio4 29 GPIO_ACTIVE_HIGH>;
> +        audio-routing =
> +            "Mic Jack", "MIC2",
> +            "Headphone Jack", "HPOL",
> +            "Headphone Jack", "HPOR";
> +    };


Best regards,
Krzysztof
