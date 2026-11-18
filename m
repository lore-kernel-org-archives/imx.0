Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993884;
	b=WZGX3LJYSJgtmDM/gVR39nsJfTMdMY9VayQLx3sVKJ5FhGrESFhhIFsK0fJ0rbC6zSQG
	 dO7XePjLXFgFYEfXFZ3oyxK1LprQwaAZ5NBHZyTc0g4b8cvUQwjZk7F3JkcA1jjmLYfFH
	 2zdcCR1qM0zC0OUMh5CNMsiFaXH+jOcMB5Uxfawlg7DEShlPoH9nLvwRvfnp1I7kKxtPd
	 SwAm3ZXesWRTnZRWGX2BcxXj7ZD9/mUJkvXY9wIlDREJCt8Xn30YwCGRzm8lQvmoAWQxv
	 wtWAG4EtniaEEnExZAf5DZbtCzPOuWkenzntRZvzW/XxToFty+dcxGrImINHfkZD6Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993884;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XEcukLWCsTBXumUpfO8m6GUmCmS52S6S7BSWA/MA88Q=;
	b=uHFsNByAUnwR5YW9lwcr2Dv5+HqgPZwIlZMjEejzHOpOp1VQ3QI5HNgGcwSWbeQeD55Y
	 AVTOoBR3M721KtklBEXDkzCkJsWTUyWTVrkxiWAXPnwIpynmBU/UUNAB8ig2uEO9ZU6Up
	 lZFs2Lo7erAjxiUjjuYzvG5HuhmEjevupdQM9AlKoGeCgQUwp9TjXxRomJz0weX/Qg7+y
	 VQa45h+mv0sLMiZ19gH1KH4D7LHk/yXalc+q6lr9l0hzWxQqkBD6o1Kiw0tmC2MiLHJuu
	 8f6XMnW26DDtf7l8Hb7aCQTTn2y9iZ+hdrmi+T/aAxpDMFHI+6cd4lMFX48oIHSB5Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RPI7B2OV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06814606A31C;
	Wed, 18 Nov 2026 09:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RPI7B2OV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337931F000C4;
	Wed, 18 Nov 2026 09:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794993883;
	bh=XEcukLWCsTBXumUpfO8m6GUmCmS52S6S7BSWA/MA88Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RPI7B2OVIHyeRGB4S5EXuBRuIQvYSa0G5OjPCB8v4IiNRgo72Ul7znuAluBy0eqn0
	 BLszd+5yLQH5qa1VncnpkN5rB3ZJ+q0JQ1lNfhVYPOLLkcWDdB3MUrz+3OFYkgh43z
	 pxXzFwPvPVODPikvutFcPtl38UxvgcT0ABz1esmtgscCrlLBDH3pgSyTXovfPgMvrH
	 R2N0nphWJZeqn0O3TpaCsu7WYy1WZja8KLiwBUJC+AENyVTvZeHJUmsPrVz6p1foxu
	 gCHVYSmakW0XN0vThm5i78Ixbmm7MyPw+pr9eGGdYVHXOQviuqSTlMnSwmpWPwhLXp
	 JtEnfUWXkDetg==
Message-ID: <sashiko-outbox-220552@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261118090914.38082-2-petko.manolov@konsulko.com>
References: <20261118090914.38082-1-petko.manolov@konsulko.com>
 <20261118090914.38082-2-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 09:24:42 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: arm: fsl: undocumented draeger vendor prefix in
  fsl.yaml
--

commit 8e20d52f09f0bb31e6607b78e6cf44266f04fbf1
Author: Petko Manolov <petko.manolov@konsulko.com>

dt-bindings: arm: fsl: add Draeger M48 dual-cpu board

This commit adds the draeger,imx6q-m48 and draeger,imx6dl-m48 board
compatible strings to the Freescale i.MX6 devicetree bindings.

> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index c8290a83205b6..d0126f54b3877 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -261,6 +261,7 @@ properties:
>                - boundary,imx6q-nitrogen6x
>                - compulab,cm-fx6           # CompuLab CM-FX6
>                - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
> +              - draeger,imx6q-m48         # Draeger imx6q variant of M48
>                - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
>                - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
>                - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
> @@ -459,6 +460,7 @@ properties:
>                - boundary,imx6dl-nit6xlite     # Boundary Devices Nitroge=
n6 Lite
>                - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitroge=
n6x
>                - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
> +              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48

[Severity: Low]
As reported by Frank Li on v4 [1], should the draeger vendor prefix also
be documented under patternProperties in
Documentation/devicetree/bindings/vendor-prefixes.yaml?  Without a
"^draeger,.*" entry there, scripts/checkpatch.pl and devicetree schema
validation report draeger as an undocumented vendor prefix.

[1] https://lore.kernel.org/r/aton_teIric7IKX8@SMW015318

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118090914.3808=
2-1-petko.manolov@konsulko.com?part=3D1
