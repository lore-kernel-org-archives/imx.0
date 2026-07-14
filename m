Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF2D48B362;
	Tue, 14 Jul 2026 15:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784043747; cv=none; b=UeCAK+zHSG7u9CiOH1RGQjJzXdvZVBHnm6UUZ92CCf4Z7XolRUQUZN7jl4VMFiRXOvFKkUyz5nt/WSS5pR3CBWkmVJIBJR8CleNf5mCDvNYMYuLVy0uuacJsIZE6A4Xkpxo712KWgeEvQLPRyNPVRaalwiKkeXtn7IOUWR33G9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784043747; c=relaxed/simple;
	bh=/pelhpvu6dO0IIGQCST7m4gb+zKnR/dT/i7j5BaCT84=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aSepeqG6PAQezUFFjBwfmYsbTQW2t3u7XOTt8dUveK0Yj0YVmYaKG1B1y/xciQYwML9x6XNr/Sz9apr12OP9J1ULNIX9S3UurMGhAaKYt4lNkkQHgW911gAT3Qrsi+TPXX6lOafR0JMM87uX+oaOlNIxHZTCieC0BpTWVU7nlro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CcpxwEyN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CcpxwEyN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09CDF1F00A3E;
	Tue, 14 Jul 2026 15:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784043746;
	bh=h1jl/MaLKetDl0dySqCl9UjmTtIv8JQ09lo0H+A0TRI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CcpxwEyN5N71uxm4ski6Paen3vGnwsiFeLe1Gpv69NEjR6oNgmnOeBpGDw7oMQow9
	 eJeqpHKvF15i3bKhEU43VWbPAV2J2wAqHPMmeZSXpvteI24pOgIEDQFSHZoQ09cLSa
	 TtEun4vp6UFZtuBIVXkVdEdGQQePjfvrlvhOco0t1hwxwnhCpuPeRxv9Hg5kdDslSO
	 6oSw6c/DjXWigmc9TkkbnzkorklzfMc9pzxSFj6NZTtM6Ee6l3afWOYPVOMSes4eiR
	 /D1Z7hwj30LWITysMFZGX/Brm+Phvh73uIrqXcrKZldUFcnWNZZunhTsrbglGXwczZ
	 /0PABbAE8U4iQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v13 04/10] dt-bindings: net: qcom: document the
 ethqos device for SCMI-based systems
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com, neil.armstrong@linaro.org
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-4-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
 <20260713-qcom-sa8255p-emac-v13-4-119f8699ef8e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 15:42:25 +0000
Message-Id: <20260714154226.09CDF1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Two bindings referencing snps,dwmac.yaml were missed when updati=
ng existing bindings with the `maxItems: 1` constraint for `power-domains`,=
 unintentionally relaxing their validation bounds.
--

--- Patch [4]: [PATCH net-next v13 04/10] dt-bindings: net: qcom: document =
the ethqos device for SCMI-based systems ---
commit f14d5198abd1c0f54fbb8e9d86982b940a5a6bc0
Author: Bartosz Golaszewski <brgl@kernel.org>

dt-bindings: net: qcom: document the ethqos device for SCMI-based systems

Describe the firmware-managed variant of the QCom DesignWare MAC in a separ=
ate
file. This also updates the maximum number of power domains in snps,dwmac.y=
aml
and limits maxItems to 1 for existing bindings referencing it.

> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Docu=
mentation/devicetree/bindings/net/snps,dwmac.yaml
> index 2449311c6d28e..d3aff1df3070d 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
[ ... ]
> @@ -185,7 +186,8 @@ properties:
>            - const: ahb
> =20
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2

[Severity: Medium]
The commit message mentions updating existing bindings referencing
snps,dwmac.yaml to limit their power-domains maxItems to 1. However, it loo=
ks
like nuvoton,ma35d1-dwmac.yaml and spacemit,k3-dwmac.yaml were missed.

Because they rely on snps,dwmac.yaml and lack an explicit power-domains
definition, do they now unintentionally inherit this newly relaxed maxItems=
: 2
limit?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-qcom-sa825=
5p-emac-v13-0-119f8699ef8e@oss.qualcomm.com?part=3D4
