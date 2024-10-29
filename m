Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680AB192D9E;
	Tue, 29 Oct 2024 20:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730233649; cv=none; b=iOOf0psM/elaFE7XqCJmUjFhuvMEW+N8tKpiLNaUVe9/+jq3eYojMM++P8FoGOrl0uWH6cwRTQtu7yJrxXSfLrE2RnTo+5/8zX8PLLsYJEdXWNkzXXeRodPy8QK0iDDxgu8PHdok9UAUVSod9ZQdZzyGZ8SYLEzZJZWPDF/BC1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730233649; c=relaxed/simple;
	bh=U4SnKlnxNPeXXDgnYqCkV6Hwn50RacK0HlNJIo7xwTg=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=ig5uSWcCIr94d70ESXJRivKA/J1NUQH0F8bpnTQM+1+kIqBzd03kSPOvQ9haqSG/04ydkk9wrDdeTlGupb0qGTuS/6qSDDIGYkVp1ygH9wggKBVS4effk9RYKA5zJD6j102xtxnWbcoHHrpCqoxW+IvSsp0rgLeR5V/467utHOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZZrvhWt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZZrvhWt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5940C4CEE4;
	Tue, 29 Oct 2024 20:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730233649;
	bh=U4SnKlnxNPeXXDgnYqCkV6Hwn50RacK0HlNJIo7xwTg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=OZZrvhWt/ldqTuIpEVGFPwXGiKshjCdRgSAoP0HCu+0bcVhs5/D9la1N6VGCAFxDO
	 54rc81Hot7Fqcro3JTALFNsKUWHqqnc+bUxoMXHYq+i6A12muILYbOKxaBXhSyNpC+
	 Nodip9bi7BFYn2o2+nldWlmJ9cWz1re2A00Ia+44SlTRyFTcGBfEVMAkGKsuM3L+5j
	 LuNr+eoE2vTDcAbOac4h8g1jSgbVc98o+jies1SFbNlLl/j4R79+erUdfe+/AQPJd2
	 gJwoyFy1tyDMZ4uj5F64BSrZNxE2owyYa+kMtua55/csWatHZc8KdckzMLo6y4Qo8V
	 YNitSfncSg29A==
Date: Tue, 29 Oct 2024 15:27:27 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: conor+dt@kernel.org, a.fatoum@pengutronix.de, andreas@kemnade.info, 
 imx@lists.linux.dev, Fabio Estevam <festevam@denx.de>, marex@denx.de, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 kernel@pengutronix.de, shawnguo@kernel.org, dri-devel@lists.freedesktop.org, 
 krzk+dt@kernel.org
In-Reply-To: <20241029191640.379315-1-festevam@gmail.com>
References: <20241029191640.379315-1-festevam@gmail.com>
Message-Id: <173023364718.1604322.9871635763168871763.robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif
 fallback


On Tue, 29 Oct 2024 16:16:38 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> imx6sx.dtsi has the following lcdif entries:
> 
> compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
> 
> This causes the following dt-schema warning:
> 
> ['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
> 
> To keep DT compatibility, document 'fsl,imx28-lcdif' as a possible
> 'fsl,imx6sx-lcdif' fallback.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v2:
> - Only document fsl,imx6sx-lcdif with a fallback.
> 
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/fsl,lcdif.example.dtb: display-controller@2220000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx6sx-lcdif'] is too short
	'fsl,imx6sx-lcdif' is not one of ['fsl,imx23-lcdif', 'fsl,imx28-lcdif', 'fsl,imx8mp-lcdif', 'fsl,imx93-lcdif']
	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241029191640.379315-1-festevam@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

