Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CEA1BDCF;
	Tue, 29 Jul 2025 13:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753794777; cv=none; b=NGkXeiIYt+74syD8HN7oyjM+DDYU4fEgfbT6CtZyJoA+Mn7cSyTKEGM+vCfmz/yD1fOvTxJJOhdFkOoSj/9RuxwOHGQ7Mrnfl65ASvBlY7QdrKuQg9sWgrZyLcTqXdb7/fZudEBOpZ7/YzBBvOlsNVmoMmNcYXAqCm9Dp9TuNNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753794777; c=relaxed/simple;
	bh=ZYf2Y5Gf2AmhWIYZ16idIUzzM0Y2potg0/rjZjCDgJc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=JW4uU6zusjS8ah/SLWTHDeNR5dotUhmVXJqb8aywy7NVqy38YIJGVQQqr9N4qPOBq382AIkPvPtgReNn64wzj/LaiXuGfprsePZAsw6vCMMNCBHto/RGDfifaZzoyWe75/6EZ4qzymMRsBnX+wOQ2EeQApgUAGiI/HbWT4Kda0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uf40uzF+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uf40uzF+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A2AC4CEEF;
	Tue, 29 Jul 2025 13:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753794776;
	bh=ZYf2Y5Gf2AmhWIYZ16idIUzzM0Y2potg0/rjZjCDgJc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=uf40uzF+GvhUO93onC6SIES/BWmFXoppojG6HmARmQlGzA/cm5Q9q+JVsbPpCgBpr
	 A4Dz6SS3hc447U3R86lapPlTUpegI42cKyWp3bnwxYIEF7wl/ZCU1UnldCaOBW36BL
	 Doi72w57H6KwfDKvFAmYs0e/H4mrRMFXGeKyPqYSQc95WJo2xMBSFdnaTKjxw5dzdH
	 fnzWDoL5HLCUH7sJB/cCm2nqIzY38p3+ItXWeI3K/3LF4qYsFQrQvFv317PV7h59cK
	 q/OzxlgsGz4ZeTZNL72DGZDDvAM2hQJHyIksAlFZuQJpid5qcQtErs6QLZI7iK0LbC
	 dRv6TCPQ2S7og==
Date: Tue, 29 Jul 2025 08:12:55 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, john@polyhex.net, 
 imx@lists.linux.dev
To: WangErQian <WangErQianY@icloud.com>
In-Reply-To: <20250729031351.3875406-1-WangErQianY@icloud.com>
References: <20250729031351.3875406-1-WangErQianY@icloud.com>
Message-Id: <175379477491.387965.6675785034730375913.robh@kernel.org>
Subject: Re: [PATCH v1 dt-bindings]dt-bindings: debix-model-a: Add bindings
 for BT and audio


On Tue, 29 Jul 2025 11:13:52 +0800, WangErQian wrote:
> Add bindings for Debix Model A Bluetooth and audio
> 
> This patch adds device tree binding documentation for:
> - fsl,mxc_bt_rfkill.yaml: Bluetooth RF control node
> - fsl,imx-audio-es8316.yaml: Audio codec interface
> 
> Signed-off-by: WangErQian <WangErQianY@icloud.com>
> ---
>  .../bindings/bluetooth/fsl,mxc_bt_rfkill.yaml | 70 +++++++++++++++
>  .../bindings/sound/fsl,imx-audio-es8316.yaml  | 88 +++++++++++++++++++
>  2 files changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml:2:1: [error] missing document start "---" (document-start)
./Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml:40:13: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml:40:21: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml:41:14: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml:2:1: [error] missing document start "---" (document-start)
./Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml:21:14: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml:36:12: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml:36:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml:36:38: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml:36:56: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml:36:65: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml:37:14: [error] string value is redundantly quoted with any quotes (quoted-strings)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml: ignoring, error in schema: properties: pinctrl-0: type
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: ignoring, error in schema: properties: hp-det-gpio: type
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml: properties:pinctrl-0:type: 'anyOf' conditional failed, one must be fixed:
	'phandle' is not one of ['array', 'boolean', 'integer', 'null', 'number', 'object', 'string']
	'phandle' is not of type 'array'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml: properties:pinctrl-names: {'maxItems': 1, 'items': [{'const': 'default'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml: properties:pinctrl-0:type: 'phandle' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml: properties:status:type: 'string' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:audio-routing:type: 'anyOf' conditional failed, one must be fixed:
	'string-array' is not one of ['array', 'boolean', 'integer', 'null', 'number', 'object', 'string']
	'string-array' is not of type 'array'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:audio-cpu:type: 'anyOf' conditional failed, one must be fixed:
	'phandle' is not one of ['array', 'boolean', 'integer', 'null', 'number', 'object', 'string']
	'phandle' is not of type 'array'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:audio-codec:type: 'anyOf' conditional failed, one must be fixed:
	'phandle' is not one of ['array', 'boolean', 'integer', 'null', 'number', 'object', 'string']
	'phandle' is not of type 'array'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:hp-det-gpio:type: 'anyOf' conditional failed, one must be fixed:
	'phandle-array' is not one of ['array', 'boolean', 'integer', 'null', 'number', 'object', 'string']
	'phandle-array' is not of type 'array'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:audio-routing:items: {'minItems': 2, 'maxItems': 2, 'items': [{'description': 'Source endpoint (e.g., "Mic Jack")'}, {'description': 'Sink endpoint (e.g., "MIC2")'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:audio-routing:items: 'oneOf' conditional failed, one must be fixed:
	[{'description': 'Source endpoint (e.g., "Mic Jack")'}, {'description': 'Sink endpoint (e.g., "MIC2")'}] is too long
	[{'description': 'Source endpoint (e.g., "Mic Jack")'}, {'description': 'Sink endpoint (e.g., "MIC2")'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:hp-det-gpio: {'type': 'phandle-array', 'description': 'GPIO for headphone detection (active high)', 'maxItems': 1, 'items': [{'description': 'GPIO specifier (controller + pin + flags)'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:model:type: 'string' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:audio-cpu:type: 'phandle' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:audio-codec:type: 'phandle' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:format:type: 'string' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:hp-det-gpio:type: 'phandle-array' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:audio-routing:type: 'string-array' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:hp-det-gpio: 'anyOf' conditional failed, one must be fixed:
	'type' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'items' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	Additional properties are not allowed ('type' was unexpected)
		hint: Arrays must be described with a combination of minItems/maxItems/items
	'type' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	'items' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	1 is less than the minimum of 2
		hint: Arrays must be described with a combination of minItems/maxItems/items
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/gpios.yaml#
Error: Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.example.dts:21.17-18 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dts:26.13-26: Warning (reg_format): /example-0/es8316@11:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: sai@40031000 (fsl,imx8mp-sai): 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: sai@40031000 (fsl,imx8mp-sai): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8mp-sai'] is too short
	'fsl,imx8mp-sai' is not one of ['fsl,imx6ul-sai', 'fsl,imx7d-sai']
	'fsl,imx8mp-sai' is not one of ['fsl,imx6sx-sai', 'fsl,imx7ulp-sai', 'fsl,imx8mq-sai', 'fsl,imx8qm-sai', 'fsl,imx8ulp-sai', 'fsl,imx93-sai', 'fsl,imx95-sai', 'fsl,vf610-sai']
	'fsl,imx8mp-sai' is not one of ['fsl,imx94-sai']
	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: sai@40031000 (fsl,imx8mp-sai): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: sai@40031000 (fsl,imx8mp-sai): 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: sai@40031000 (fsl,imx8mp-sai): 'dmas' is a required property
	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: sai@40031000 (fsl,imx8mp-sai): 'dma-names' is a required property
	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: sai@40031000 (fsl,imx8mp-sai): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: es8316@11 (everest,es8316): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sound/everest,es8316.yaml#
Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: /example-0/sound: failed to match any schema with compatible: ['fsl,imx-audio-es8316']
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1526: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250729031351.3875406-1-WangErQianY@icloud.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

