Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD874570C4;
	Thu,  6 Aug 2026 11:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786014491; cv=none; b=AQvN0emb01K7EiH7g46+r18QB8k5ANBn7Jy+MeRA+u9gsqNNky9G/XYIyUvgSjHCrQdsd6MIpAB9OaqzWnr4RlIUiH85K5CKsYlhIGpIBUP+wE0Zo6bFJE+dMj9i9FqBuJwvXh4ZpS358UYbaerh/xO2Rl4gp1jDXlPYxCCsRDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786014491; c=relaxed/simple;
	bh=wxiVCqFyHpwQdla2oNjV05crJBaooB0lGbLVfcPTCs4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dZT4B/8ulwnFQzUs7QI9YNEPTx43SHyxPTzOJyOtNVd7vVbwvnji6sEsZ+YQbw5lKQrcU059nkwYBEB3svXk+42V35DYyrmWahpvYD1dbW+Podl66/SGqfJE+tSALED1QRBq5XpvcvqSw8l2q99irfOOINqAPszrbFigQzWR2mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b0N/Olc7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b0N/Olc7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D481F000E9;
	Thu,  6 Aug 2026 11:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786014483;
	bh=H1ZT7y+Fuh3uH8IyiwBMjRyo0eh60B1k98FjCltvJRg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b0N/Olc7K0Zez/PCZDSf2I464HU9yP+Ews0bJOe1IIlaw8NQyiMTNE+7x+/d22pAT
	 7A20YEuBZ6T6tJUvWRTej/1u6D8B2ub+OVbg5PsMkb1gmETFzRfnizg6/6dgsQ+uh8
	 g2tGIpxM4cw5/bGRNwqYQ9xidZl5Dfv++sIeAvaxaRRYS/AQ5TRDCW3vuwox7TRYts
	 ILfvDzSFk5K1RphVTbD9aV9hQX6MkTJ3Qne5a3Vb7xdbd6EvPbmSPVxbN/cMpGv+F2
	 ZXjNus4eqKU9uFxwHAT1XYP/LT2eZ5D/bDtJn04rFUU7dfOxbNkE+ulNxhHHD76WVE
	 7uS8u1/UHQtkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v35 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260806-imx-se-if-v35-1-11b25bb308ef@nxp.com>
References: <20260806-imx-se-if-v35-0-11b25bb308ef@nxp.com>
 <20260806-imx-se-if-v35-1-11b25bb308ef@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 11:08:02 +0000
Message-Id: <20260806110803.35D481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The `kernel-doc` directive references a non-existent file `drivers/=
firmware/imx/se_ctrl.c`, which will cause Sphinx build warnings or errors d=
uring documentation generation.
- [Low] Grammatical issues and awkward phrasing in the newly added document=
ation.
--

--- Patch [1]: [PATCH v35 1/7] Documentation/firmware: add imx/se to other_=
interfaces ---
commit 5b71a12dcba08cd85c4d04d9b33297065e03bb54
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

Documentation/firmware: add imx/se to other_interfaces
   =20
Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se).

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
> +i.MX93, i.MX8ULP

[Severity: Low]
This isn't a bug, but the phrasing "with the such secure enclaves(SEs) IPs"
reads a bit awkwardly. Should this perhaps be "with such secure enclave (SE)
IPs" instead?=20

There are a couple of other similar grammatical structures in this section=
=20
(like "The NXP's i.MX HW IP" and "multiple hardware IP") that might also
benefit from being smoothed out.

[ ... ]
> +When a user sends a command to the firmware, it registers its device_ctx
> +as waiter of a response from firmware.
> +
> +Enclave's Firmware owns the storage management over a Linux filesystem.
> +For this c_dev provisions a dedicated slave device called "receiver".
> +
> +.. kernel-doc:: drivers/firmware/imx/se_ctrl.c
> +   :export:

[Severity: Low]
Will this kernel-doc directive trigger Sphinx build warnings during make
htmldocs?

It looks like drivers/firmware/imx/se_ctrl.c is not included in this patch.
Does the file exist in the current tree, or should this documentation patch
be combined with the patch that actually introduces se_ctrl.c to prevent
documentation build errors?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-imx-se-if-=
v35-0-11b25bb308ef@nxp.com?part=3D1
