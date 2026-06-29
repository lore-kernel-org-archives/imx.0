Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80C5309EF9;
	Mon, 29 Jun 2026 09:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725104; cv=none; b=UTrrBi01+LSpdyvee4Y7OTAXwvH7jKCMrKeU5ewfpvOsHKotRR94jZepzlEyGsZirE+1Yc7DS9IpGsIXMMehERHt5XqrU6R2Jokz+e5b0fIfhhWjtHMT4cY4W5Iaz7AQqyExHBvDgHnUAPL1qsGn0nNnKE2twYcBbAsQ2b+HTbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725104; c=relaxed/simple;
	bh=KCcf0qFlEh/XVLoI0a2Gd9TZIqeugHqyyd+6Kud2mgI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=hlMxINLB96x8XkyjnckSUEeEjTBSPBoTIhFUFdSiOo0PmqKH3bokNtMRD7EG1y5h8x0RNY0NwKlU9MpHq9NsUMsuT/oYjcxk+D7Q0c1t2Lgx0PwwWs8aUKcbDq1PbRNXMVuHKy4YEWhbKwZs19DbKe3zb9QpfyxbVWXHvL9r8mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sw7wKvlL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sw7wKvlL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40ADF1F000E9;
	Mon, 29 Jun 2026 09:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782725103;
	bh=BvoBxDaYcxAyprGRisWh5uNQejdq5Yph7yMgOQ/rysE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=Sw7wKvlLu0TQrgS+9IhOHufpEfsY4J0es1JGOsIvejwypUNwzzY/4mdIhpuLqb7vU
	 fHor2wITvy9smgvb4mnHTsHqSJp7ujrNqwPfiudbJibgTX9MsS+isx9N2n8hu5JrGi
	 CGHnIV3if9NBrg0Wirioju4ZHVL8O6+hg2sCKYC9d64EJ0b3oAcb/9ltB1IFms0J9z
	 1w3R5DKqiL6dE7yyxByXIWvHK9GAWgmsyQXqrHxG0njGkP3KnIHiuYtTOXJDkwU+hf
	 2Abmm5fCXFh7N/Wg4jWZNTgW761FjTuUwTbbhMng2u77D7N0aUyOxz/VLpjBLTSVkF
	 UJfyY36kk2XGg==
Date: Mon, 29 Jun 2026 04:25:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, festevam@gmail.com, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 krzk+dt@kernel.org, kernel@pengutronix.de, Frank.Li@nxp.com, 
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org
To: chancel.liu@oss.nxp.com
In-Reply-To: <20260629074734.3643227-2-chancel.liu@oss.nxp.com>
References: <20260629074734.3643227-1-chancel.liu@oss.nxp.com>
 <20260629074734.3643227-2-chancel.liu@oss.nxp.com>
Message-Id: <178272510234.1491191.9572770485267787597.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: connector: Add fsl,aud-io-slot
 binding


On Mon, 29 Jun 2026 16:47:31 +0900, chancel.liu@oss.nxp.com wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> The NXP AUD-IO slot represents a physically present I/O connector on
> the base board. It acts as a nexus that exposes a constrained set of
> I/O resources, such as GPIOs, clocks and interrupts, through fixed
> electrical wiring. All actual hardware providers reside on the base
> board. The connector node only defines index-based mappings to those
> providers.
> 
> This connector type is present on i.MX95 19x19 EVK and i.MX952 EVK,
> where it is used to attach the IMX-AUD-IO audio expansion card[1]. The
> same add-on board can be reused across different base boards that carry
> this connector.
> 
> [1]https://www.nxp.com/part/IMX-AUD-IO
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  .../bindings/connector/fsl,aud-io-slot.yaml   | 113 ++++++++++++++++++
>  1 file changed, 113 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml: clock-map: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml: clock-map-mask: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml: clock-map-pass-thru: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml: Unresolvable reference: /schemas/clock/clock-nexus-node.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.example.dtb: connector (fsl,imx95-19x19-evk-aud-io): False schema does not allow {'compatible': ['fsl,imx95-19x19-evk-aud-io'], 'gpio-controller': True, '#gpio-cells': 2, 'gpio-map': [[0, 0, 4294967295, 8, 1]], 'gpio-map-mask': [65535, 0], 'gpio-map-pass-thru': [0, 1], '#clock-cells': 1, 'clock-map': [0, 4294967295, 1], 'clock-map-mask': [255], '#address-cells': 0, 'interrupt-controller': True, '#interrupt-cells': 2, 'interrupt-map-mask': [65535, 0], 'interrupt-map': [[0, 0, 4294967295, 27, 8]], '$nodename': ['connector']}
	from schema $id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260629074734.3643227-2-chancel.liu@oss.nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

