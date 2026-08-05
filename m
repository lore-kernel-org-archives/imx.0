Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D1646E005;
	Wed,  5 Aug 2026 16:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785945875; cv=none; b=Yd2GCtwpm7eEuJwEpu/9nvhv4pWQJ3PkCoFpS/0kddks4BSqkwyRaJi30EWSPR+lR4G7gGOHK8pgiZZV44hlP9iY9M5l8uNSphSLHEH6/64A44G0YfGnpyzKMCm2uuMmaaOGuWPx1iPpS1wfFnHbV4SqsXSKzCO6jDr3RXl4e0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785945875; c=relaxed/simple;
	bh=kGBLAuA3ZtmmPZaDWTXcigeNkug138/i/YnKDazmHTc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e1hJvxMPhRNO4gwTpNbYyY2MTlqV3F9Yt6LWIQdRbcjgL/ueUVklKLrvSh0Eqjr2N4pvarDAtFzV2n75Yqlf5Pw1AIkme+pAPYVzbAQIgFAsXQxuiORIAVIGDbGjr4saM/qN5PDw7Hfa4fciPpYzANfHvWHs0+H3AEF3UlvhtcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=llKb93Xi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="llKb93Xi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9251F000E9;
	Wed,  5 Aug 2026 16:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785945874;
	bh=Mj0iCuVFXItvn1QR2+5vTBFtEfsQGA9lXfhGy6F6c9A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=llKb93XiEcTdigasanvg+hX24fQAFWFCi5nCH3KnDoP0F4kq3ADCd8PRYRHOdEMNf
	 CU6Mkwg1fkSueEF7dTyWCoDhLWe3fxkTAgkSsW7JC+X8AD1n1t87/9bvglq1IbTKsl
	 Te/pt7q5CZ9yxikpASixMY03YUz4bcJb1jXIAt+fKfaV46BZuIJmtsQrV/Xs3wf8r2
	 1/GuunbAOlro7POjzrhJ1r8+EdiARNXCR/yaW3lyD/e1sllRangFPpibfURVJ5SpPQ
	 ro2yK0VXW342KNsbdQfIXb0auToh2bZYpb+ns3mRmN0g2pylwnWTRZmoDERERCdaOn
	 g3+moSV5v8VRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v34 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260805-imx-se-if-v34-1-7e4713d14e0a@nxp.com>
References: <20260805-imx-se-if-v34-0-7e4713d14e0a@nxp.com>
 <20260805-imx-se-if-v34-1-7e4713d14e0a@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 16:04:33 +0000
Message-Id: <20260805160433.BF9251F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The kernel-doc directive references a non-existent file 'drivers/fi=
rmware/imx/se_ctrl.c', which breaks documentation builds.
--

--- Patch [1]: [PATCH v34 1/7] Documentation/firmware: add imx/se to other_=
interfaces ---
commit 2a1a9962f9352382d58e5f7ad151d5b2fd1a395f
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

Documentation/firmware: add imx/se to other_interfaces

Documents the i.MX SoC Service layer and C_DEV driver for selected SoCs
containing NXP hardware IPs for Secure Enclaves.

> diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Doc=
umentation/driver-api/firmware/other_interfaces.rst
> --- a/Documentation/driver-api/firmware/other_interfaces.rst
> +++ b/Documentation/driver-api/firmware/other_interfaces.rst
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
Does drivers/firmware/imx/se_ctrl.c exist in the source tree at this commit=
?=20
It appears this directive references a file that is not present, which will=
=20
cause warnings or failures during documentation builds.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-imx-se-if-=
v34-0-7e4713d14e0a@nxp.com?part=3D1
