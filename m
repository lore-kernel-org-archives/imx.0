Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11E7175A60;
	Fri, 17 Jul 2026 21:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784323540; cv=none; b=m3zkCLr9P3c+9a83GXDavMhHD8HX6eLt0bzz8O7LZ6CKxcCTgyz3Hd2J+/3hvW4vSLYXk1loGQdox1BbJw8acpsdofOEk9x/w8MnhBeTqaFnC+64PNEcEIi03aU9OgK8NKRvzC8s2ydsrfm3j37AWh0u1rl3lpTtLr4PmrmaVaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784323540; c=relaxed/simple;
	bh=yC0POvPsfRNhdhiUDbp40bKMTP/i1hzVEOnmK6V1bcw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=WmeTU5bL5CGykD0qz25yn3YF+W+xW5aJ2c9M0IfSaF1JN2KUFYO0I5cgR+EF+CfCfkbFnuV63mLe8T/LegjhlLZAksHsRfMBWABAwTrMmwGP1/tA2o8hSpE2dv2yXEAOez5nGE8sRhz9IB61KMHeP3WyzxO0KhwwiwurNo8i7lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=daIMHzfC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="daIMHzfC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E8F1F00A3A;
	Fri, 17 Jul 2026 21:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784323538;
	bh=QZH8NbU6Pjk6keXGAJ73rI0VCvSsVgApqc8JqdUGKRA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=daIMHzfCeyc+1NhwDFp2eN/v/EtUrBeyqQcKZ/Bp5AL+omM1fSTL14slLwR/W2eNg
	 wiiFr91N8b/dkhfrCUv76/9JOCeaihPzP1P/PICtVvKsZHGQDj9K5FHdfkpygMNYrk
	 gNN+c9JOHgn0hivyAzehXjlcZWUem8ffgEMxA34SoRLCHslw+3W4WvvuwLcQHZ5gPy
	 74s6R3CfAZE8LadZdjd7Ws9K8COvToRLzCR32mzThm4x4XKkiqFtaZuL6XLcCokZWJ
	 R+U0XrKfZh5V/4PWLnfaP9nCWmyeY6QTnRPFVizsEC2r4T/PWE4qaZdbbWnW32dX+N
	 4DfRE1fMklUXA==
Date: Fri, 17 Jul 2026 16:25:37 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
 devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
To: Frank.Li@oss.nxp.com
In-Reply-To: <20260717201519.844259-1-Frank.Li@oss.nxp.com>
References: <20260717201519.844259-1-Frank.Li@oss.nxp.com>
Message-Id: <178432353778.2692844.15138095566024676604.robh@kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: soc: imx-iomuxc-gpr: allow
 bridge@18 as child node


On Fri, 17 Jul 2026 16:15:17 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> The legacy i.MX6SX (>15 year) SoC imx-iomuxc-gpr contains one LDB_CTRL
> register. Allow the LVDS Display Bridge(LDB) child node under
> imx-iomuxc-gpr.
> 
> Fix below CHECK_DTBS warnings:
>   arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - remove status = "disabled" at example
> ---
>  .../bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml  | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.example.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): bridge@18:reg: [[24, 4]] is too short
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.example.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260717201519.844259-1-Frank.Li@oss.nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

