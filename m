Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CFD3FF1D0;
	Fri, 15 May 2026 16:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778863885; cv=none; b=CoWAM6lRGbkoCi2XR37mkE1lZYXePzYY5HiwG+6cAw2npGLBt2OcDSjmuKzSFSbvkDaAmhm+WPCI8Y7Rd6Ek/xSHR3ZmU9oWUVedCH1e+AGQIQ2Ai4yz7sYtG8mrgDJ2s+dOburcqtCwKyEl8EzSAmJM5TK84jH8bJC88Kb0uyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778863885; c=relaxed/simple;
	bh=gYnz88czFF/TXVF5StMI73PYX0W16Hr9d9tw3EzwPjc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ezkweKU2Vy+nLjxvD1CwAbZunM5dH+ujswAcU/QeVk/vPWOYvNAYRhc0b4aBzBcAoJ2YrdOf0CBCf25DoITYxiOSyPDVFbiCJFfQTHbiVOALtWqLJIcT4iZkglJcL3kQXBF1RhcX9LHwynym2kog8kiiVx/WGDU1GYEMvjh9vlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTAoHnJT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTAoHnJT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C53C2BCB3;
	Fri, 15 May 2026 16:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778863885;
	bh=gYnz88czFF/TXVF5StMI73PYX0W16Hr9d9tw3EzwPjc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=nTAoHnJTCjvgaVWYUBrwzcaF2pGaKGNG/IpnxRnEidsQdDNb1fg7ToJCxiVrhiqVM
	 rlELrcRv3x3mJWAHut3BRwEhGOcvqCtsiJmjgID5I7//+3hJQHOMXBKuG7yNd9vnMS
	 OH1ZJIqpcLqmwBdgLnJina3MBA0eboLGPuzvTss2A8BIquVl3pRGdei0OWLLob6Iw9
	 uB/PP+tydHuW38FiU8T2+mjx1zczh/r39YUpdpphVoYMzh3euSazuzEqXdl9D6UJZe
	 djPeUezDu9oBjTKy9/8DHF1OkmqWNPZ9C/fm5DXHpruERcAnJxugQ9zHkbd3L4uuaF
	 23dV6YmI7zo4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: trivial-devices: add fsl,mc1323
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, krzk+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515163959.1948799-1-Frank.Li@oss.nxp.com>
References: <20260515163959.1948799-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 16:51:24 +0000
Message-Id: <20260515165125.26C53C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Miscategorization of the fsl,mc1323 complex network transceiver =
as a trivial device.
--

commit 21d3bd06bf5d8d09338547376852b755873e842b
Author: Frank Li <Frank.Li@nxp.com>
dt-bindings: trivial-devices: add fsl,mc1323

This commit adds support for the Freescale 2.4 GHz IEEE 802.15.4/ZigBee
mc1323 by listing it as a compatible string in the trivial-devices schema.

> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Doc=
umentation/devicetree/bindings/trivial-devices.yaml
> index 23fd4513933a4..28b059c858dd1 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
[ ... ]
> @@ -127,6 +127,8 @@ properties:
>            - domintech,dmard09
>              # DMARD10: 3-axis Accelerometer
>            - domintech,dmard10
> +            # Freescale 2.4 GHz IEEE=C2=AE 802.15.4/ZigBee
> +          - fsl,mc1323

The trivial-devices.yaml binding is intended for simple SPI/I2C devices and
strictly enforces additionalProperties: false. Since the Freescale MC1323 is
a complex System-on-Chip that includes an MCU and a transceiver, wouldn't it
require additional properties like reset lines, regulators, clocks, or MAC
address configurations?

Adding it here might restrict the binding and cause future schema validation
failures when someone attempts to properly define those necessary hardware
properties.

Should this device have a dedicated binding schema instead of being
categorized as a trivial device?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515163959.1948=
799-1-Frank.Li@oss.nxp.com?part=3D1
