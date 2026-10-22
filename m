Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678237;
	b=U+QR1hEZgSMfFWICUvJ3YcIEwk7YVG8MPiLuTDw2fdZy/nXnBywNaP/1K/o90I4V/yws
	 EFVFet/YpBSnmBBCBZd+wzm01JmbFWGMktIMyBlQThgMgNFkMfCrdy36TDzlHj0EhAxj1
	 S5vc2WLBV+zIWmYm+aeKM6oUp7aI7H3lXsdzWG043Lz8WJLaxvTcgwHwhUPhPSnLkUXoy
	 C5tX0v6i8pCGCHa9VQnrkarLD1lbkyhrLftvUXjalODoGdXQrxDCGqJE/vqODa0BdmTAT
	 5M23ubX9TK3aDPXZdEBA0XV+znvf9VTjgUGhNfXhT/jDoiDlkqx+XYLwzBJn0jlAGpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678237;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=weVRdQtifwkxw5sFIAJqPF/iG+27RAB5rTL5mR7KELY=;
	b=Wq3pNVWq0IhzFPr/ZjsRQJuyeoJUNCjE1e96ego5aR/zCaLUid4TqA65GjdgMeMyXiMe
	 sHppMx3B9oBmzQgHHNCjRSSWQnPuyMTGJzP8dWjmlUdjvOd4fuNLjD9VwAsouMjPQM4sv
	 RtEqVSoMn66BxoKshnyfZ8sFrDKuA8rlaHJjIgpK3ca082CBYF9H8xjfJXdXd8CZ6a6Wm
	 9bnRLWSMhG+IDQyte4ZKgJWlSFW0crIo2V35zznzKbtIv6/u5P1eoHcUSgwxgn0gU4/zn
	 N0R7TgKfbU9PO4wAcXhs99VWTyWw7bfCrWhslaALba7QlmgzspGhCxMl3nUgFOfGdSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nJ7Ww7JO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C0F60A260A;
	Thu, 22 Oct 2026 14:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nJ7Ww7JO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A4B1F000C3;
	Thu, 22 Oct 2026 14:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792678237;
	bh=weVRdQtifwkxw5sFIAJqPF/iG+27RAB5rTL5mR7KELY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nJ7Ww7JOTSBg+vBYOaSZFAq+VsYPt0Z+Jr+MNxpyRwl1yeo8ZymvWqW1KJEpw3xD6
	 0hseAlqMtCZiCSrzp6C39ZQEEtno/gwXmFQMqbWbAhRq37lUkiVFcNPvEUcj/PvJ/D
	 vcUCzKxUghZCoAxKyhMFBgcB4pz7dIhis7QIafOV7/wrso/vjAB+xk3zpuoymsdLgo
	 KiRdMyNfousXfFJIum9ZlYS7N0cluBir6G01goapltHYh/ZwhCOlejGmsD5MRKZI+G
	 mouBbtxw0d2QxNdudN/j+ZXvAD57+qgdmeKKdKySIMjQABIvO3071SuMeSeH03UWyJ
	 Wbf3r/MMaTN3w==
Message-ID: <sashiko-outbox-181612@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261022140244.3476844-2-petko.manolov@konsulko.com>
References: <20261022140244.3476844-1-petko.manolov@konsulko.com>
 <20261022140244.3476844-2-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 14:10:36 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: arm: fsl: undocumented draeger vendor prefix in fsl.ya=
ml
--

commit 3465979b7c116a128c865587fd61bc41cff5927b
Author: Petko Manolov <petko.manolov@konsulko.com>

dt-bindings: arm: fsl: add Draeger M48 dual-cpu board

This commit adds the draeger,imx6q-m48 and draeger,imx6dl-m48 board
compatible strings to Documentation/devicetree/bindings/arm/fsl.yaml.

> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index 656f2596e1d53..8f3a04228780a 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -260,6 +260,7 @@ properties:
>                - boundary,imx6q-nitrogen6x
>                - compulab,cm-fx6           # CompuLab CM-FX6
>                - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
> +              - draeger,imx6q-m48         # Draeger imx6q variant of M48
>                - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
>                - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
>                - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
> @@ -458,6 +459,7 @@ properties:
>                - boundary,imx6dl-nit6xlite     # Boundary Devices Nitroge=
n6 Lite
>                - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitroge=
n6x
>                - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
> +              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48
>                - eckelmann,imx6dl-ci4x10
>                - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
>                - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL So=
M on Avari Base

[Severity: Low]
Both hunks in properties:compatible of
Documentation/devicetree/bindings/arm/fsl.yaml introduce compatible strings
with the draeger vendor prefix (draeger,imx6q-m48 and draeger,imx6dl-m48),
and the follow-up commit 6e00402d882f ("arm: dts: nxp: imx: Add devicetree
files for M48") uses them as well.

However, patternProperties in
Documentation/devicetree/bindings/vendor-prefixes.yaml does not appear to
have a matching "^draeger,.*" entry:

  "^dptel,.*":
    description: Guangdong Dapu Telecom Co., Ltd.
  "^dragino,.*":
    description: Dragino Technology Co., Limited

Should the "^draeger,.*" vendor prefix be added to
Documentation/devicetree/bindings/vendor-prefixes.yaml so that
scripts/checkpatch.pl (in process()) and devicetree schema validation
(dt_binding_check and dtbs_check) do not report draeger as an undocumented
vendor prefix?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022140244.3476=
844-1-petko.manolov@konsulko.com?part=3D1
