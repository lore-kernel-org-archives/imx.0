Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788F1395D86;
	Mon, 24 Aug 2026 09:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562569; cv=none; b=kYGagC5c1Q2KEcXETE+6aAWYQ5hw1MOw2v3aiXXIz3ImETtD6kaodlHxdeNxtCZpzzkTeuY/SojDLjkVe+7mJkaXajIas8971bduBTS1vco/wEZc5UaEB3K8KH9uBPMzEDLaCB7ZtoJGwzxI9uqGJp/7Gy8oj66f076HvjhcMmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562569; c=relaxed/simple;
	bh=eCWf39Oq6R1dV4/QbHyL8gv4lIOiAOFmRGTTP3aYLeU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hDEoyfkt41oG7rNiPmsy/c3ym8bqnHHeID8IV5CJgK0P3Pl5EJ+uwPi42Yjsj9wFsf24KJw+mVIuNYJhinjnkJTUaacWiJfSasyuspettm8H1428xaCRZwXrq+ucuQYvJ7qrpXXYFykkyK9PynyJ7POBqEpPfHXrDw6tJ3qaY4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/6RTO09; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/6RTO09"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD741F00A3A;
	Mon, 24 Aug 2026 09:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787562568;
	bh=eCWf39Oq6R1dV4/QbHyL8gv4lIOiAOFmRGTTP3aYLeU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n/6RTO09hzYkG+Q9Ve8rI9r+ZZwzNsM4jwLBGzfLooHbjI8e8DpEHMtwywwrssodm
	 sP8RySPfKNeYFWtU1YHCiJHxmrFOHV2+QN5n2Y6aEx9LUhrHocTVkY/c5jvsStZxhC
	 KdjTAgbk2pFgy/wsl9u9UV2lmq9lCSI3QBCZxxmcQ5CP5rMrrVcdy6t+uoOu29RKMV
	 gQZjsEMvZQ2/zb5xSqYjc9pEpmVjVlbQBsDqX/b8pT8ACcp4erfohPRQCzOYW3sMrD
	 gLyPg5zJbBo1Koq1wOpaO5pCcCRaPtXfTEA6Tkxxmm7/Lz7LeyN1plYy+92rChSZ0Y
	 0hQ/xstw7Kb/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v41 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260824-imx-se-if-v41-1-29cf129e4d86@nxp.com>
References: <20260824-imx-se-if-v41-0-29cf129e4d86@nxp.com>
 <20260824-imx-se-if-v41-1-29cf129e4d86@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 09:09:27 +0000
Message-Id: <20260824090927.EBD741F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Minor grammatical and spacing errors make the text less readable.
--

--- Patch [1]: [PATCH v41 1/7] Documentation/firmware: add imx/se to other_=
interfaces ---
commit 260e585f488d10326488a8cd35371c3b01d9bec6
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

Documentation/firmware: add imx/se to other_interfaces

This commit documents the i.MX SoC Service layer and character device driver
for secure enclaves like the NXP EdgeLock Enclave.

> diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Doc=
umentation/driver-api/firmware/other_interfaces.rst
> index 06ac89adaafba..6c6fa9a0ba1df 100644
> --- a/Documentation/driver-api/firmware/other_interfaces.rst
> +++ b/Documentation/driver-api/firmware/other_interfaces.rst
[ ... ]
> +Each of the above features is enabled through dedicated NXP H/W IP on th=
e SoC.
> +On a single SoC, multiple hardware IP (or can say more than one secure e=
nclave)
> +can exist.
> +
> +NXP SoCs enabled with the such secure enclaves(SEs) IPs are:

[Severity: Low]
This isn't a bug, but there is an extra "the" and a missing space before
"(SEs)". Could this be updated to "with such secure enclaves (SEs) IPs are:=
"?

> +i.MX93, i.MX8ULP
> +
> +To communicate with one or more co-existing SE(s) on SoC, there is/are d=
edicated
> +messaging units(MU) per SE. Each co-existing SE can have one or multiple=
 exclusive

[Severity: Low]
This isn't a bug, but there is a missing space before "(MU)".

> +MUs, dedicated to itself. None of the MU is shared between two SEs. Comm=
unication
[ ... ]
> +NXP Secure Enclave(SE) Interface
> +--------------------------------
> +MU(s) is/are not shared between SE(s). But for an SoC like i.MX95 which =
has
> +multiple SE(s) like HSM, V2X-HSM, V2X-SHE, all the SE(s) and their inter=
faces 'se-if'
> +that is/are dedicated to a particular SE will be enumerated and provisio=
ned using the
> +single compatible node("fsl,imx95-se").

[Severity: Low]
This isn't a bug, but there is a missing space before the parenthesis for t=
he
compatible node name.

> +
> +Each 'se-if' comprises two layers:
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-imx-se-if-=
v41-0-29cf129e4d86@nxp.com?part=3D1
