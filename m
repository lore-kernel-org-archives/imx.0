Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC623C0604;
	Fri, 19 Jun 2026 15:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781884504; cv=none; b=QoNweBktuNKlZ2nufUn06aJYHak6egWRQxWRm2C0UFXY0WaLZN1cAd2WUni2KMFG49Fg5NvSgFusViah+Xzp5k3SSWhkuLghwl9hx0j2ja2xNnzNv5lPfSvSEekIz2FZUSwtMeQOV+6hvqR4XWap+luFXe89+r8K8U8Y16l6V30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781884504; c=relaxed/simple;
	bh=huUerb6I/QkQIhnE2ec1WQNIMv2NXCxKNoK0fgHZjt8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SRtm7VwQBzSPZNmw/0/sM6yeS/HEMMUHs9HYVWpAQgTigX34MWabMnJAceeEy4pIhzrVoXZOg7cmKKFO4kUnS65wN5Niyr/b4kwbpgyLG8R8GbmFmKmbXT1uCWMTOed7HBmyYRPUbNnEMMGgOqpeOWo2GUSr3rVdyvq0qsGKgIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ej66XSQS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ej66XSQS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C384E1F000E9;
	Fri, 19 Jun 2026 15:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781884498;
	bh=BbI+XwrrZIJlt/Uxkuoh7BkxzmUJVluDoJa2CzOmK4Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ej66XSQSyiZEeatGbQFw2IdvKziQ2SGqkmcaXsQn4NWN0lGqxx3b9YEwCMZYzuCoo
	 WcYdfARXiWTrQMYGcjUj0l3+yjGseqAh9G28XdO92/K+uXT8wZlXFQSa53fMVLipN0
	 Tjq5oVqiUnPLZdCsUf/R6tW3CgYvcRD9vTxllO2FLDwpsJvua8CI9BZzXucW/4G+tT
	 XUNoNLhizEgbzKgTFja9KSoPU6x+4LvK9ghRnO09WyzbDf+s5ZC32wEz+sUqv/DQc+
	 VdFM8Ql855LqU9/dLBrhsYByD9MlnPG0gf0imvH3Hthf/kOLhRRlL92sDqgpx0Y2iL
	 9sJ1GL26K1y1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/11] clk: imx: imxrt1050: Remove NOMMU platform
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260619-dts_cleanup_arm_mcore-v1-4-0101795a2662@nxp.com>
References: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
 <20260619-dts_cleanup_arm_mcore-v1-4-0101795a2662@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 15:54:57 +0000
Message-Id: <20260619155457.C384E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Deleting the `include/dt-bindings/clock/imxrt1050-clock.h` header b=
reaks `make dt_binding_check` because the header is still included in the Y=
AML binding example.
- [Low] Incomplete cleanup: Defconfig for the removed vf610m4 platform was =
left behind.
--

commit 19efb4118fc745b70a599c1f992b0e4fad42b13c
Author: Frank Li <Frank.Li@nxp.com>

clk: imx: imxrt1050: Remove NOMMU platform support

This commit removes the IMXRT1050 CCM clock driver and its device tree
binding header. This is part of dropping unused NOMMU platform support
from the kernel.

> diff --git a/include/dt-bindings/clock/imxrt1050-clock.h b/include/dt-bin=
dings/clock/imxrt1050-clock.h
> deleted file mode 100644
> index 93bef0832d16d..0000000000000
> --- a/include/dt-bindings/clock/imxrt1050-clock.h
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> -/*
> - * Copyright(C) 2019
> - * Author(s): Giulio Benetti <giulio.benetti@benettiengineering.com>
> - */
> -
> -#ifndef __DT_BINDINGS_CLOCK_IMXRT1050_H
> -#define __DT_BINDINGS_CLOCK_IMXRT1050_H

[Severity: Low]
Does deleting this header break make dt_binding_check?

The Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml file
still includes this header in its examples section:

Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml:examples()
    examples:
      - |
        #include <dt-bindings/clock/imxrt1050-clock.h>

If the YAML file is not removed or updated, make dt_binding_check will fail
with a missing file error when extracting and building the example.

[ ... ]

[Severity: Low]
Does this series miss cleaning up the vf610m4_defconfig file?

Since the patch series removes NOMMU platform support, including the
vf610m4 device tree files, should arch/arm/configs/vf610m4_defconfig
also be removed? It configures the kernel for the vf610m4 NOMMU platform
and appears to be left behind as an unused configuration.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619-dts_cleanu=
p_arm_mcore-v1-0-0101795a2662@nxp.com?part=3D4
