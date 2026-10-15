Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822C15208D7;
	Thu, 15 Oct 2026 12:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068059; cv=none; b=lkXqvMreg1fqWEGm9Az2dmJy6POrr+QPVYb49I+qRs9KBz8o94UTWcEvqq7VQwtLyzm58dV2vxug5SE7JlkPBDw9bAtitqTYZn04TRB0TiBopWaZmdCkKa9BNgCaAfKlZCopZnW0+8UrflO83DmY/8nZbm6tVQpRXK0CUNaJDZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068059; c=relaxed/simple;
	bh=DKwLVcWUN8E3dDYeubpR65D0RJ+UdxowTK4mEXnI/Ds=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=KnVQJsBg3i1m2tXb4HXtYirDX4IX35OmQzU6fK+hfrJdlK1237MwZVfKaPysVkS9F6xOhkRP7TaIpUhmHm/llXCbNNoAovil40dOXJTFPbWPyqyOulv6BZ6GPxEevfcoPjNOsguLO7ethzhiTtjefN/xVX7plLVBqRxZwSoxyts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RYRTWz+m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RYRTWz+m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93161F000C4;
	Thu, 15 Oct 2026 12:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792068058;
	bh=8mr44ruIlIuHraNgUPoKCSk1dsomii5Qenj5BOx/kFI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RYRTWz+mK492CPkvVk5HhwblexUlTQ+xI+DnYLJPL2am88N9UoACtYXvwGy5Y4zvR
	 sX0zzB6cJ4ljq+xfwjxgbBjCPRCTH6xOISQQNe5HjTbYyz6M3TrSe7Lo3i35csCRLo
	 qCERGuwFe9L8dR1FaRv35uSIp/GDgIZSlZkhHhJG2W2oKiGnrZfr8amzifvNtoLgrz
	 LaJOiDanz56oiYFrdjTBln6ZtsSV32mMNd0DkC+Q45BpFAQEJeCs2MaG5btkmLTsHh
	 P5Yg0Fit7U0SpzWIm1NdhbuJXeI4pV85yPdgLIMhh7JvyqNURrugntOQd02rl/k8mI
	 cmFiU31kNNiJQ==
Message-ID: <sashiko-outbox-172832@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v16 2/7] dt-bindings: net: qcom: document the
 ethqos device for SCMI-based systems
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-2-0266c2ead980@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-2-0266c2ead980@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 12:40:57 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: net: missed power-domains constraint in ultrarisc,dp10=
00-gmac.yaml
--

commit eaf763b0d0d309757c6cf7f9fe067155eb99eb11
Author: Bartosz Golaszewski <brgl@kernel.org>

dt-bindings: net: qcom: document the ethqos device for SCMI-based systems

This commit describes the firmware-managed variant of the QCom DesignWare M=
AC
in a separate file. It updates the top-level snps,dwmac.yaml to allow up to
two power domains and restricts existing referencing bindings to a maximum =
of
one power domain.

> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Docu=
mentation/devicetree/bindings/net/snps,dwmac.yaml
> index 2218a492817fd..2c4842404bf67 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml

[ ... ]

> @@ -187,7 +188,8 @@ properties:
>            - enum: [ahb, stmmaceth-ocp]
> =20
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> =20
>    mac-mode:
>      $ref: ethernet-controller.yaml#/properties/phy-connection-type

[Severity: Low]
Was Documentation/devicetree/bindings/net/ultrarisc,dp1000-gmac.yaml missed=
 in
the updates to other bindings?

The commit message states the intent to update existing bindings referencing
snps,dwmac.yaml to limit their maxItems for power-domains to 1. However,
ultrarisc,dp1000-gmac.yaml references snps,dwmac.yaml under its allOf node:

Documentation/devicetree/bindings/net/ultrarisc,dp1000-gmac.yaml:
allOf:
  - $ref: snps,dwmac.yaml#

Because the top-level snps,dwmac.yaml was relaxed to allow 2 power domains
here, and ultrarisc,dp1000-gmac.yaml lacks a local override, does it implic=
itly
inherit the newly relaxed limit of 2?

Could this cause a schema validation regression where device trees for the
hardware could incorrectly specify up to two power domains without failing
validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-qcom-sa825=
5p-emac-v16-0-0266c2ead980@oss.qualcomm.com?part=3D2
