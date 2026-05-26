Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BFF33F5AB;
	Tue, 26 May 2026 09:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779787132; cv=none; b=T6gOVF1zeuHQ/hVu3L2ESlWKs0FB2lkMpXZTO38HzyTNyREz3ADTIgLNbMkBoPm9furHlUl5jQ2GfYXQbS0/+/k+9uK7YaNxH7SZzpu8/Rceab4lXp3/YP3uQoAg4lg5bTCs3fMp30nsYeJ6HNwkCyGGhsoYRh7WRxgQbUr8+Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779787132; c=relaxed/simple;
	bh=0ETd1Jt6YxKzgm3EOdK5RT2ztbo4n7tcmqn7nISRKYE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p19mjgf1Spf5nnkohLvn4LgaRhTmuh6I4as4q+CTehgFcuIpT9E0mYieAbeZ5tIWpdgBFl1Bdb+VqA0kPPh+dPatQUl8+5ZT4VdBOpo3q8DnbehrrXI3YyqpzcNcZApd7GTPP9BlUaeY9PA0KPBnCJeBHfg96Nj7LxYfZwueLiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BW+vivDS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BW+vivDS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFCB31F000E9;
	Tue, 26 May 2026 09:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779787128;
	bh=4fAwYv5601n3Mn8rVOFXUhflbHhd3iilupoPAXjNfrg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BW+vivDSCXqf4FWX8WiL4PmSVf+3tI57BUi0PQqh9x8+FiXAMxoIM9tYm3DpchR9r
	 9SK+v9AdBN7VyM05ed7i0Tac43YvXteCnANhGiQSwCoMA6oQOcZIkpbZ2Nkxbl1tLN
	 fbAChDyQicwOYM8xzAPbr9kRUcFOVl4/3p9EafE8uikUoX/aQe17ZgtwgxjihiNhay
	 yyTjPtvaQHP/zThlRH5InKvoX+7GZ9JLiQxE7xcnuNVkjn20aLXMK2BslOxH2hkvHu
	 kjV4t21sQlznCHOq7uC/4R21CGBa4tL0Qc/wY6u6Y1H6WRVMQaMflkQkfz5zYR1oZq
	 8pkqgwDvN6/iA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/3] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guoniu Zhou" <guoniu.zhou@oss.nxp.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260526-csi_formatter-v9-2-ca3d8c334c39@oss.nxp.com>
References: <20260526-csi_formatter-v9-2-ca3d8c334c39@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 09:18:47 +0000
Message-Id: <20260526091847.CFCB31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] Unit address mismatch in the example's syscon parent node.
- [Low] Missing 'ranges' property in the parent syscon node in the example.
- [Low] Poor formatting in the device tree example block.
--

commit 1b3ddadbdea2fb3bc19aa036199bd1e0ef56413b
Author: Guoniu Zhou <guoniu.zhou@nxp.com>

media: dt-bindings: Add CSI Pixel Formatter DT bindings

This commit adds the device tree binding schema for the i.MX95 CSI pixel
formatter module. It defines the constraints and ports required to interface
the CSI-2 host controller with the Pixel Link definition.

> diff --git a/Documentation/devicetree/bindings/media/fsl,imx95-csi-format=
ter.yaml b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.=
yaml
> new file mode 100644
> index 0000000000000..61068ea0a69a0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> +
> +    syscon@4c100000 {
> +        compatible =3D "nxp,imx95-camera-csr", "syscon";
> +        reg =3D <0x4ac10000 0x10000>;

[Severity: Low]
This isn't a bug, but the unit address in the node name (4c100000) does not
match the base address specified in the reg property (0x4ac10000). Should t=
he
node be named syscon@4ac10000 to match the reg property and avoid unit_addr=
ess
validation warnings?

> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +        #clock-cells =3D <1>;
> +        clocks =3D <&scmi_clk 62>;
> +        power-domains =3D <&scmi_devpd 3>;

[Severity: Low]
Does this syscon parent node need a ranges property?

Because it specifies address and size cells and contains a memory-mapped
child node (formatter@20), omitting the ranges property prevents correct
address translation for the child node and typically results in dtc warning=
s.

> +
> +        formatter@20{

[Severity: Low]
This isn't a bug, but there is a missing space before the opening brace.

> +            compatible =3D "fsl,imx95-csi-formatter";
> +            reg =3D <0x20 0x100>;
[ ... ]
> +                port@0 {
> +                    reg =3D <0>;
> +
> +                    endpoint {
> +                        remote-endpoint =3D <&mipi_csi_0_out>;
> +                    };
> +
> +               };

[Severity: Low]
This isn't a bug, but the closing brace here is indented incorrectly compar=
ed
to the rest of the block.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-csi_format=
ter-v9-0-ca3d8c334c39@oss.nxp.com?part=3D2
