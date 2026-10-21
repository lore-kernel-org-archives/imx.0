Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575134;
	b=Up9vyhNejbVyUCNoyPegS1jhL0d3NQgSyZz6za1jDExUoczG7LRSF7ooAJh0zlGpHAqq
	 Gat6Bp3udOhhKVzMqpRGcIVEb7DuZ9mu/hjVXHTvW1aphLVuIfuabEBnPZSd0FRz1g9Is
	 LspU0I8zeBZj8IxgBmni3ndAhjkVv93r+SF3VvJ7ugQk4WtoeHbHNcLSM2Zd23Q6J/OsA
	 mvLR/r8lWw3/7dKaRX6qPL5GNNDHVjfRa3Eefg+RBcDOyXdl5ncj2+4/B+2QuKRXuKGhH
	 gsRQZ5sMQdRKsQ6yYIhAfeBT6TEO95NiJiYRqx50/+EbTpwQmLc1ve0d++AQOvoW1Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575134;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IUY1fCqEHX8J35zjkedjJrWL9/Qrq4hqTKstwVPkKHY=;
	b=VlCXArZ/2dE+3m5t4GEw70mvob5zuCS35sXX2eDikzcvjFuJOAshUUanoPTF0zVyalR9
	 ilAmL3ydsp7qizea4B77YBaDj/NisyDh6j9b5zpuR5D7IYSTWlXDYtipYYvQPBDOu3ctv
	 T133Jel91GXzaJ97OiFTyunhRQbLDv9d1x/UilvSsvsl/V0B8bC+f8FZx+PDtURuEI5Ip
	 jHM0BDcVPX/FJL6vrOvBOJMSYgNemqrWZHvzxYKsHddly8CrUi+2K4bepDZebEDC3vnXU
	 9aDPHS0S7w2MagL7cxCmp+Nqx/v/js8FLZ615dot0K34JlCaZxYaYGhoPFxs1Q7/m4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QmZ3fnx1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C33606A319;
	Wed, 21 Oct 2026 09:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QmZ3fnx1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793B61F000C9;
	Wed, 21 Oct 2026 09:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792575133;
	bh=IUY1fCqEHX8J35zjkedjJrWL9/Qrq4hqTKstwVPkKHY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QmZ3fnx1tFBcperJYWUNpxFVuBFharhqVfjjZ2s2OyV9b/F5T2EL/3BZ7dKYIjbYQ
	 XSzJ1HHSWGpWC4CTMDugLNRBByrp7LjLmlegwxdzY5SISqoQbLeIM+x+i1nM7WC3cY
	 WZ07sTmijhpW8BMeKLc+0o4elG0WSmZcWZ5g3g4gLhTmresnfr2Xh2fOSj5EcjbvLO
	 eglU+YJqUQH29QFOZJ1glgM907Hu+1vEVkJghPC5TaX63odIlT3vIP1la72DDCO7sQ
	 1RDFcZ4nDRX379bLFiVuuxjAH5Q2c4cxiF+CE/Lw3eZ1Xh6ZnKW2FFPB7Q70+B2Vip
	 KS6fpg+5UiPbA==
Message-ID: <sashiko-outbox-180038@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261021092140.4142493-2-petko.manolov@konsulko.com>
References: <20261021092140.4142493-1-petko.manolov@konsulko.com>
 <20261021092140.4142493-2-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 09:32:12 +0000
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
- [Low] dt-bindings: arm: fsl: undocumented draeger vendor prefix
--

commit 795e5eabed6a73f1faa10f56606455efcbd039b8
Author: Petko Manolov <petko.manolov@konsulko.com>

dt-bindings: arm: fsl: add Draeger M48 dual-cpu board

This commit adds devicetree binding compatible strings for the imx6q and
imx6dl variants of the Draeger M48 board to
Documentation/devicetree/bindings/arm/fsl.yaml.

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
Should the draeger vendor prefix also be documented under patternProperties
in Documentation/devicetree/bindings/vendor-prefixes.yaml?

Currently, Documentation/devicetree/bindings/vendor-prefixes.yaml has no
entry for draeger between dptel and dragino:

  "^dptel,.*":
    description: Guangdong Dapu Telecom Co., Ltd.
  "^dragino,.*":
    description: Dragino Technology Co., Limited

Without an entry in vendor-prefixes.yaml, process() in scripts/checkpatch.pl
reports an undocumented vendor prefix warning when device tree files (such
as arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts and
arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts) or driver match tables
reference draeger,imx6q-m48 or draeger,imx6dl-m48, and any draeger,*
vendor-specific properties will fail schema validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021092140.4142=
493-1-petko.manolov@konsulko.com?part=3D1
