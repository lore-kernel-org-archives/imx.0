Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9458E3290D4;
	Thu, 26 Feb 2026 18:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772130051; cv=none; b=jAZOq3SacgECpdxf5a83fNzMCLBlzduyIKFWUXGyUVoPnJg/e+HL2KgrsVqLw8eQTnH03mop/gEHhOZ+5H06DGWCBFUBvRbhZ+2gmymlf8lfWASFASEV6whC3bT/k5HRYxmcrKqwM37h31QTbVEVZm2ATZDFg1WXTNPvkl/puUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772130051; c=relaxed/simple;
	bh=ykhRp35CpXtvgun0tnxM65Z2vkAxdIk7nxGE/Pgqc4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlcTDE4aZcbBN2nF+B+bj2v6tLlbrdghzVfVF6ylb/rPpyGXIYoXIpqL5XzT27vm0XGMcO0Q15ex5aXW98fEXM5v9585wB1XbXuhA6bbiJzW30jrI6CZ14IsSOTN7cpeJJIH2coGtPhs4KpEY9tIFu6kMbCAHbGNqi08ypfaxBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mOOL1DeA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mOOL1DeA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB925C116C6;
	Thu, 26 Feb 2026 18:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772130051;
	bh=ykhRp35CpXtvgun0tnxM65Z2vkAxdIk7nxGE/Pgqc4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mOOL1DeAx63/HB+MC86W4fw96P/QRAb9wayFDU4UcXOCM6Bp+XJg/H+N3INcDpbLx
	 53Eqx4X9GcbanjYXCYLWW5dmYv4neupTqYrZyLb5KGY734Nh+WzTqEl6/iuXIE9fT8
	 PGAwW0RaM7mTKmaCGnAxDN0iC756h7G5yDAPt+y7CE4fiFku0VlykepQ7C9RCBvBKC
	 OQstgCrIElOsdLOZPsXab2EFNGSNFzskrwu8uIQf8Zhqi/Lm/wDNup43GWg/BPOcqB
	 xRtpS7liIZstIIjVJDPHXQRY/XEC1RNtD9bAcXwkvM5fBOkhH2DlSMm4X8dIWq8ZWI
	 +oW9HF63p1TbA==
Date: Thu, 26 Feb 2026 18:20:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Cc: Oded Gabbay <ogabbay@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	Jiwei Fu <jiwei.fu@nxp.com>, Forrest Shi <xuelin.shi@nxp.com>,
	Alexandru Taran <alexandru.taran@nxp.com>
Subject: Re: [PATCH 3/9] dt-bindings: npu: Add bindings for NXP Neutron
Message-ID: <20260226-unthread-reformat-92b855c4acf9@spud>
References: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
 <20260226-neutron-v1-3-46eccb3bb50a@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7ibRsXdeFBfJ4JJq"
Content-Disposition: inline
In-Reply-To: <20260226-neutron-v1-3-46eccb3bb50a@nxp.com>


--7ibRsXdeFBfJ4JJq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 03:40:42PM +0200, Ioana Ciocoi-Radulescu wrote:
> Add the bindings for Neutron, a Neural Processing Unit from NXP.
>=20
> Signed-off-by: Jiwei Fu <jiwei.fu@nxp.com>

You are the author and submitter. What did Jiwei do?

> Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
> ---
>  .../devicetree/bindings/npu/nxp,imx95-neutron.yaml | 95 ++++++++++++++++=
++++++
>  1 file changed, 95 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/npu/nxp,imx95-neutron.yaml=
 b/Documentation/devicetree/bindings/npu/nxp,imx95-neutron.yaml
> new file mode 100644
> index 000000000000..ba1f6851866b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/npu/nxp,imx95-neutron.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/npu/nxp,imx95-neutron.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP Neutron NPU
> +
> +maintainers:
> +  - Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
> +  - Jiwei Fu <jiwei.fu@nxp.com>
> +
> +description:
> +  Neutron is an NPU from NXP targeting edge AI inference applications.
> +  Initially supported on i.MX95 SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,imx95-neutron
> +
> +  reg:
> +    items:
> +      - description: Register space
> +      - description: Instruction area of the TCM space
> +      - description: Data area of the TCM space
> +
> +  reg-names:
> +    items:
> +      - const: regs
> +      - const: itcm
> +      - const: dtcm
> +
> +  memory-region:
> +    description:
> +      Phandle referencing a "shared-dma-pool" to be used for Neutron
> +      inference buffers, which need to be 1MB aligned.
> +
> +      The memory region must be defined with alignment of 1MB and size
> +      should be large enough to accommodate the targeted ML models. It
> +      should be marked as reusable.
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 3
> +
> +  clock-names:
> +    minItems: 2
> +    items:
> +      - const: npu
> +      - const: npu_apb
> +      - const: npu_cgc

clocks should be done as reg is, with the descriptions in the !-names
property. Not really keen on the names either, these are all npu clocks
so the npu prefix is odd.

Additionally, why is the number of clocks variable when you only have
one platform?

> +
> +  iommus:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - memory-region
> +  - interrupts

Odd that clocks are not mandatory!

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    bus {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      neutron@4ab00000 {

"neutron" is not a generic node name. This should be something like
"accelerator" or similar.

pw-bot: changes-requested

Cheers,
Conor.

> +              compatible =3D "nxp,imx95-neutron";
> +              reg =3D <0x0 0x4ab00000 0x0 0x00000400>,
> +                    <0x0 0x4AB10000 0x0 0x00010000>,
> +                    <0x0 0x4AB08000 0x0 0x00008000>;
> +              reg-names =3D "regs", "itcm", "dtcm";
> +              memory-region =3D <&neutron_pool>;
> +              interrupts =3D <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
> +              clocks =3D <&scmi_clk 68>, <&scmi_clk 67>;
> +              clock-names =3D "npu", "npu_apb";
> +              power-domains =3D <&scmi_devpd 20>;
> +      };
> +    };
> +...
>=20
> --=20
> 2.34.1
>=20

--7ibRsXdeFBfJ4JJq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaCO/AAKCRB4tDGHoIJi
0hpqAQCmVF7gHL1AHHYNmwRPLmwdR6aB4QNQWo7Hjh4liYM6HwEA6bQx3XTkSL/D
n8+I7p0CSNFlPE3uOoh5v65E8bfM3QA=
=rsXb
-----END PGP SIGNATURE-----

--7ibRsXdeFBfJ4JJq--
