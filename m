Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40C33AB47A;
	Wed, 23 Sep 2026 07:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149522; cv=none; b=FY66Bz0CgTAzm8y6ZUn4xQZ/oAbWge4pREfFKrAKWwjlGjkGu413rqCwSfIRnqHLyw3Qzngedl9HfpEOwbftXEHkkVeTa580LEHe/S1SS1xoup7+0BwCrydK2pATaiZTHoFtWKnXSUr62YDVFD8iwp3qK6imHchDID7Zq/hfxHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149522; c=relaxed/simple;
	bh=sOcJ+pckBpXMKqOtYbfzLWqnJmtVJaQomk47lK2jRRA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PkSb/UjDki9HS9ET2EbJ4HStcfGotWBVEglSl9YSgz2Edb7KuXe/MJG07PrqlXLSA6NuPXDMO1FD08SWkW8gIsZd5jyRJH2dk5kOx0dVkVroJebzDgsnx5xSkQJdQUo+Jm6wkMSIB5ngdwSl/K2cUOGv4Z9cwQaduaqHDO/jnyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n1dVmZWb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n1dVmZWb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3633C1F000FF;
	Wed, 23 Sep 2026 07:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790149520;
	bh=7EkzHJVdRiY+gMlohbYZbH//kpa0TK3dKCSopfPqvbY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n1dVmZWbx7HN9FIPL0ejI6en3ir14h4v+yx+zVLezHmHfsLBScg6YYu2Cm4+Rz0G5
	 +Sr4WgTLZlSpOzdVuWBZVwpVNCwz0t92w4uM8ByftAGcFZK7MN7PPohV/JzsxY7hLh
	 h9ggX9TZ/gWOHoYywVljQLl6BBtC0dHpuHaQ+w+ubOsizoyPuUnuOiskAicSgHWztY
	 EhNjnoVE9AQqG4EdJ/ldgwlJNztoya+Y74FhN3uLVQvloFP+3N1OlZr2u+mexCp5ug
	 Dhdn4VHrCGVE8uk7g3YEewrQniBBJdlS5Cw4qFv4hTxozqIyvNNuDZMwcxgxv2PNJ5
	 sKLwJQV8czoyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: imx6qdl: phycore-som: Add custom
 volt/freq table
Reply-To: sashiko-reviews@lists.linux.dev
To: "Primoz Fiser" <primoz.fiser@norik.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260923070505.494949-3-primoz.fiser@norik.com>
References: <20260923070505.494949-1-primoz.fiser@norik.com>
 <20260923070505.494949-3-primoz.fiser@norik.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 07:45:19 +0000
Message-Id: <20260923074520.3633C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: imx6dl: missing fsl,soc-operating-points violates hardware co=
nstraint
--

commit a3b6d4e5af39862c78043d8917ba381472b78ee4
Author: Yunus Bas <y.bas@phytec.de>

    ARM: dts: imx6qdl: phycore-som: Add custom volt/freq table

The PHYTEC phyCORE-i.MX6QDL SOM-modules are operating with slightly differe=
nt
voltage and frequency values. Introduce imx6q- and imx6dl-phycore dtsi files
with the modified power tables to achieve stable condition.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-phycore-som.dtsi b/a=
rch/arm/boot/dts/nxp/imx/imx6dl-phytec-phycore-som.dtsi
> new file mode 100644
> index 0000000000000..de85c084ac8d3
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-phycore-som.dtsi
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2021 PHYTEC Messtechnik GmbH
> + * Author: Yunus Bas <y.bas@phytec.de>
> + */
> +
> +#include "imx6qdl-phytec-phycore-som.dtsi"
> +
> +&cpu0 {
> +	operating-points =3D
> +		/* kHz    uV */
> +		<996000 1275000>,
                ^^^^^^^^^^^^^^^^
[Severity: High]
This overrides the operating-points to increase VDD_ARM to 1.275V for the
996MHz tier, but lacks a corresponding fsl,soc-operating-points override.

Without it, VDD_SOC will inherit the default 1.175V from imx6dl.dtsi.

The NXP i.MX6 DualLite hardware datasheet specifies that VDD_ARM_IN must not
exceed VDD_SOC_IN by more than 50mV to prevent latch-up and instability.

Does this 100mV gap risk system instability or hardware damage by violating
this constraint? Note that the newly added imx6q-phytec-phycore-som.dtsi
correctly includes the fsl,soc-operating-points property.

> +		<792000 1175000>,
> +		<396000 1150000>;
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923070505.4949=
49-1-primoz.fiser@norik.com?part=3D2
