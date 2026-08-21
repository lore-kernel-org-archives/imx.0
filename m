Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848DC3ADBA7;
	Fri, 21 Aug 2026 07:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787297932; cv=none; b=iu0mgeIXrLPEqA0QTRQiDJvZbE36J737P6Yo/SOjvpGCIg86YHFRPVRdo1WIsamrl0pnGYljrmlOrs/9063lccDVmPACGzz4+dx7Bvr8Ji3ponptVJ5Ut4r/iJ8z2JX3xG0bLefskgWJrtutCRiB70rApBas6CiJGiPq6US8ef0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787297932; c=relaxed/simple;
	bh=796p1UwVu7/5utWia1DmfQgeXkzh0ipMoE9fN97tgSU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uPOSOM7DER/1bt1kcE1ryNmRSjTbQTmGxmuatT/AitZHZuFwUaj5OTed8z7l82vYYL6Dr/seFyUPj2EuI5yjIRkT8bhhQAbvLJ9qwGhXYm3oaXxzOdH+JVg+lWDpYxP8wDjh83pJzO9bT3w0hZP1SBoXcJ0BQ1316A4MWrL9XNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPhEpsFZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPhEpsFZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628291F000E9;
	Fri, 21 Aug 2026 07:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787297924;
	bh=796p1UwVu7/5utWia1DmfQgeXkzh0ipMoE9fN97tgSU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hPhEpsFZ+czgD3Ub13rHwfS7olb0b+MHii0rYabyCLYViKffNlx/yxg6V/eVYXwzG
	 XAxl06tA5r3YKLjqv1sDv4MMUOiozHlJhcTPi8tpys0JNnDs9Zb0L/TD07YHFQDKbe
	 k034cjC2CshrnReFVBAqf3MTgld6h0pvNoyb5LACb6MrGrhj0I/Ba65cy1VRXRnXJx
	 RWCNqJME8wTzP6+u3VDdGN66rm8scbqzaljGh6uotYFd3dv3ESjSNT6/30AyFUoX2d
	 XZxH46z2GS9W10uDRZVYOAxKkSPbC8RBjMteWXOWoXmnfVUwG3xzb6ETG8TRfse4JD
	 60f6gndyNG8/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v39 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260821-imx-se-if-v39-1-41e4257c2afc@nxp.com>
References: <20260821-imx-se-if-v39-0-41e4257c2afc@nxp.com>
 <20260821-imx-se-if-v39-1-41e4257c2afc@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 07:38:43 +0000
Message-Id: <20260821073844.628291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Grammatical and phrasing errors in the newly added documentation.
--

--- Patch [1]: [PATCH v39 1/7] Documentation/firmware: add imx/se to other_=
interfaces ---
commit fe039b37299ef0c736ad2dd27910cd638e874b3d
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

Documentation/firmware: add imx/se to other_interfaces

This commit documents the i.MX SoC Service layer and C_DEV driver for
selected SoCs that contain NXP hardware IPs for Secure Enclaves.

> diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Doc=
umentation/driver-api/firmware/other_interfaces.rst
> index 06ac89adaafba..6c6fa9a0ba1df 100644
> --- a/Documentation/driver-api/firmware/other_interfaces.rst
> +++ b/Documentation/driver-api/firmware/other_interfaces.rst
[ ... ]
> +Introduction
> +------------
> +The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedde=
d secure

[Severity: Low]
This isn't a bug, but could the phrasing here be adjusted? For example,
using "NXP i.MX hardware IPs" might read a bit more naturally than
"The NXP's i.MX HW IP".

> +enclave within the SoC boundary to enable features like:
> +
> +- Hardware Security Module (HSM)
> +- Security Hardware Extension (SHE)
> +- Vehicular to Anything (V2X)
> +
> +Each of the above features is enabled through dedicated NXP H/W IP on th=
e SoC.
> +On a single SoC, multiple hardware IP (or can say more than one secure e=
nclave)
> +can exist.
> +
> +NXP SoCs enabled with the such secure enclaves(SEs) IPs are:

[Severity: Low]
This isn't a bug, but there appears to be a typo here. Should "with the suc=
h"
be changed to "with such"? Also, adding a space before the parenthesis in
"enclaves (SEs)" might improve readability.

> +i.MX93, i.MX8ULP
> +
> +To communicate with one or more co-existing SE(s) on SoC, there is/are d=
edicated
> +messaging units(MU) per SE. Each co-existing SE can have one or multiple=
 exclusive
> +MUs, dedicated to itself. None of the MU is shared between two SEs. Comm=
unication

[Severity: Low]
This isn't a bug, but the grammar could be slightly improved. Would it be
better to say "None of the MUs are shared" instead of "None of the MU is
shared"?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-imx-se-if-=
v39-0-41e4257c2afc@nxp.com?part=3D1
