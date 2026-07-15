Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29B147A0B8;
	Wed, 15 Jul 2026 17:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784136306; cv=none; b=KVt0FdVqzcFYR4FIhd464l8kQcaZm6JAkFDWH6X5F2T+yQQ1yl/sCBa20z79mEG/d9YlmAVZB0nma3Rnyl36aqhdY0xP2ZS2A0ahDUHrDTjWx0Qe9j9r9K2uMh44Ethd3ddGe7uLsCtpmWHTT3V0mytnEABEGiQIXd5jWd+QSsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784136306; c=relaxed/simple;
	bh=CzCD5rHiWNN0DrWd0OczC3Add7tB+WuVH7kLwW4X6XM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WxifKitv56KeQi0jQMmAqOCVJTktTmJVS5JmzB9LDqPVdIu2Aag3ijJBrOu60YsCep0gwPiBRe8Qy0dgoJadqQn7lRwFWsOxzjkoWo+9MgAhr2B2pY1vnYUUNwof43elSdO0l7WX9y3a0EIaqzV2gjhO29MUTlWMFsy52fCwANc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YDJnqzjA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDJnqzjA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE611F00A3A;
	Wed, 15 Jul 2026 17:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784136302;
	bh=92mKnev/QLNn4eRJmAXR1P0nxc26h6HztsxxTcNzmCs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YDJnqzjAkBSyJK2pxgth2U/LZH72/Y2xdvJxHggc7Wex8tsW56whI5wAoQuSL/Ay9
	 nzAiMFVzNW0yUOYTHOPaPeU9NQu0c9dAQG34FzQrjW828/pyIxnE6hgY8+XQp6kN9f
	 3lJD0kLIZ3QdMmIwg9Y+JK3wqJi2YpxnQ9eR8CEwWcQ3hdj1oue46R/ErZOuB5tbsH
	 D4R5dztLluIJ1YET+C7DhKDmeAZFAsQLuZXsgNXNPBsXH8KyMS1XZXdDxqLBTAGJuN
	 Sqv56xcrNl1fUIlElX4Byh+rKY6h+mquGRnX+pvK0Z7aHfMxPU4GQj6wdz0N1kH7ze
	 pXROPCATaTRMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v27 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260715-imx-se-if-v27-1-bb7c45952f06@nxp.com>
References: <20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com>
 <20260715-imx-se-if-v27-1-bb7c45952f06@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 17:25:00 +0000
Message-Id: <20260715172500.EAE611F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch adds a `kernel-doc` directive referencing `drivers/firmwa=
re/imx/se_ctrl.c`, but this file does not exist in the source tree. This wi=
ll cause Sphinx to emit a build warning or error when building the kernel d=
ocumentation (`make htmldocs`).
--

--- Patch [1]: [PATCH v27 1/7] Documentation/firmware: add imx/se to other_=
interfaces ---
commit 11c72cefa6ce5b082289d8b3c32eb18ba17eea92
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

Documentation/firmware: add imx/se to other_interfaces

This commit documents the i.MX SoC Service layer and character device drive=
rs
for NXP hardware IPs such as the EdgeLock Enclave.

> diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Doc=
umentation/driver-api/firmware/other_interfaces.rst
> index 06ac89adaafba..6c6fa9a0ba1df 100644
> --- a/Documentation/driver-api/firmware/other_interfaces.rst
> +++ b/Documentation/driver-api/firmware/other_interfaces.rst

[ ... ]

> @@ -49,3 +49,136 @@ of the requests on to a secure monitor (EL3).
> =20
>  .. kernel-doc:: drivers/firmware/stratix10-svc.c
>     :export:
> +
> +NXP Secure Enclave Firmware Interface
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

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
Will this cause Sphinx build warnings?

It appears that drivers/firmware/imx/se_ctrl.c does not exist in the source
tree, which can cause make htmldocs to emit a build warning or error when it
attempts to extract the documentation.

Is this file missing from this patch series, or does the directive need to =
be
removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-imx-se-if-=
v27-0-bb7c45952f06@nxp.com?part=3D1
