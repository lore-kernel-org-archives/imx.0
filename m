Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F552346A02;
	Tue,  7 Jul 2026 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783433500; cv=none; b=eiUnko1bSPzXoDdhZgxuqrqFPrC9faGS0FTtQXFCxFgv9BrdImDO84Gfr4PywbvmVrtG0CrN4Pbx9PDcVZRBqtyhiyDCVNSW2Z2C3F5oumEnmYljuU0FWNIRB/HHSeQ+6Zaxoa8rprZ7HRGx5/PQv9/I5hpCxCRsMFSF6HFBkKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783433500; c=relaxed/simple;
	bh=ckq5dzFJ3uvu3aiOcWFE9vWICSPlLmaKPIODkiQTrIM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mt29wAnwNmu+C/4OxgmXdPLzIP8TqTDq3NiplY5FVlAl85InenGfyoPTyBw/VJiQzd/d9KvKiD2n3pa0lYyxxMOH/hlvN8Ku/ZV9LYiIaaGuQcmJjgndvtF0foSLx20DYFoU2TY7v4yNzc//EqjFPg0do5XY8fHqRHYOrwTfFJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=enDqMtlq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="enDqMtlq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90881F00A3D;
	Tue,  7 Jul 2026 14:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783433498;
	bh=QvOkRjNNXyNBULDO3YhwROa7FJoE/Fu63a+r6ZP3gGM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=enDqMtlqswZM7ZTmdcuIHCv25Z2Hi52Wa3SWLflYMCgX9F39TJL9hMFOw3PgxYos5
	 9wBYzqcAVkiIUIODHls/QGbZAcj8h9+wYV1uGETMT1ak2iwzx3qGXlLjZKOVm1fBL+
	 FF8AxzWzzrcpDvHOyVqWUVTELGqYtxJPt7YoUbwG4LKOI89uc0nc4CleJ7Cq+vprFQ
	 2NCBwp6PoKbSY6A6pDnxpgZe5mGOEOiMNdMdwS1FTk6Jsu9Q/OVAfy4z0PVBh8+07z
	 tMHdg51Vrvm3nveYs6yDl6RERMLaI6GYPwzklR/47F9o1G7l7uvcvoE2kaQJpHpZt1
	 GAVlpAQ8aHPPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v12 3/7] dt-bindings: net: qcom: document the
 ethqos device for SCMI-based systems
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, neil.armstrong@linaro.org, imx@lists.linux.dev, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-3-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
 <20260706-qcom-sa8255p-emac-v12-3-e3ab1ecf2901@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 14:11:37 +0000
Message-Id: <20260707141137.B90881F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The device tree bindings for Nuvoton MA35D1 and Spacemit K3 DWMA=
C were not updated to restrict `power-domains` to `maxItems: 1`, contradict=
ing the commit message claim and inadvertently relaxing their constraints.
--

commit 172a7357589e2c110ace7edfdec50dee477c4a83
Author: Bartosz Golaszewski <brgl@kernel.org>

dt-bindings: net: qcom: document the ethqos device for SCMI-based systems

This patch describes the firmware-managed variant of the QCom DesignWare MA=
C.
It introduces the qcom,sa8255p-ethqos binding and increases the power-domai=
ns
maximum to 2 in the top-level snps,dwmac.yaml schema, while updating existi=
ng
referencing bindings to limit their power-domains maxItems back to 1.

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
The commit message states that existing bindings referencing the top-level
snps,dwmac.yaml were updated to limit their maxItems for power-domains to 1.
Were Nuvoton MA35D1 (nuvoton,ma35d1-dwmac.yaml) and Spacemit K3
(spacemit,k3-dwmac.yaml) missed during this refactoring?

Since both of those schemas inherit from snps,dwmac.yaml, they will now
inadvertently inherit the relaxed maxItems: 2 constraint, allowing invalid
configurations to pass validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-qcom-sa825=
5p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com?part=3D3
