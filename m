Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535132E888A;
	Wed, 19 Aug 2026 06:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787120166; cv=none; b=HsXmfZi1N/3xGeSOu3OPSHJC7zpnKSNuWJcNdGzMHtzYBK/FFlQxBU7nb2xQuM5sLOYvGojd51obU43wW3pRnNEqUqE9h2snmpGdi23RKFgK/hh9MBr1mct5EaRv2bf+ioigUDdYSj8DPrlJpiZPGrXbClY2Fw+H3wZxGw+ql3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787120166; c=relaxed/simple;
	bh=WChs9zj7HnQ35M+hdofNmSrLrbHhiOKPmlmbqvBdehk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t+MEcS1g0QAti4UDGcAPPbt3cCsPsIrEDrF8AMO9IrPbJbUhm35K1uhrIoeZ/MdyxIQ2X88Dm2zWW+hCifVgYhRF2u99jjm3eey9HAMDn4lHTfzO2EZ4F7URxIuLrNL3Hl7UAb1Msu0EuP77tMyKgc4PjmDju5s9HqKp1Ggs05c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2JdfMbo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2JdfMbo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA8081F000E9;
	Wed, 19 Aug 2026 06:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787120164;
	bh=MlaEcysSijIXR0+QepfhGHVFu5bEO38sEjEJwRGQGlc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A2JdfMbob4eYfRSJPZObdLhUI7/kIExWEfK+db3L8irCwuOK3AlgMFnYuXUHtyPb1
	 2Cy+4R6yQSpU7EcRrDEGANl9a1xzqB3m+L58KN2vkjSKaE3tUOm4q3u4blEGWbx4K3
	 CehLYRapbl52JU3fTkIfaEl4peTFj/WiwMCHgtC95Z6rz61Ia6UWPWxPJV3uwzrRLc
	 bVGN0nhOIa8LB6E4bmNo0cEHp141FzhU5BA9e441NWcgWE/qnCfvKLQvpJ/kFxmBha
	 Q7zzTR/URh/nv5nqU8u5nGmI2+49pfV7KQ+arRk7wH7XrI6Lv8C8pOXaiKZjRCxG1A
	 ykG/A3qSFUl6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v37 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pankaj Gupta" <pankaj.gupta@nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260819-imx-se-if-v37-1-5ef5de9ff1dc@nxp.com>
References: <20260819-imx-se-if-v37-0-5ef5de9ff1dc@nxp.com>
 <20260819-imx-se-if-v37-1-5ef5de9ff1dc@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 06:16:04 +0000
Message-Id: <20260819061604.AA8081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The kernel-doc directive references a non-existent file (`drivers/f=
irmware/imx/se_ctrl.c`), which will cause Sphinx builds to fail or emit war=
nings.
--

--- Patch [1]: [PATCH v37 1/7] Documentation/firmware: add imx/se to other_=
interfaces ---
commit ac0ee8751fff1b6f43a912d3cdc22822ca9395fb
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

Documentation/firmware: add imx/se to other_interfaces

This commit documents the i.MX SoC's Service layer and C_DEV driver for
selected SoCs containing NXP hardware IPs for Secure Enclaves.

> diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Doc=
umentation/driver-api/firmware/other_interfaces.rst
> index 06ac89adaafba..6c6fa9a0ba1df 100644
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
Does drivers/firmware/imx/se_ctrl.c exist at this point in the tree?

Referencing a non-existent file in a kernel-doc directive will cause the
Sphinx documentation build to emit warnings or fail.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-imx-se-if-=
v37-0-5ef5de9ff1dc@nxp.com?part=3D1
