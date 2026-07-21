Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99219332906;
	Tue, 21 Jul 2026 10:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630244; cv=none; b=Zkh5Z7kkSWnCKLhO27sBilDv1wWzfkGMPJCJJhjy2vDNfldY20r2WQtd0r8pWiMDDLnJK+BT4ij87OO7OBvRWSE3PCjCn+nVAsudWZ3MSruVeXlHsUwj/qhIY0i4BpC/NeQM4qijJDg/Bx5NEmpHHPy645NAGnbUE5l3ojO45vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630244; c=relaxed/simple;
	bh=eWLF6M4l3DSUELfbHBYZmDUooFf/KO4B/NbcTFCPzkc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sjEQANw/vkisqoTr4cvJvz/5dhoC4p8VzWq4Z13ZLG6L6jN0clpaYVpbEXN2t7mnIkG1JXC2JjWYckMWioq+YuipoB2XgT99rtmYbeoTycUAt1TLjIUFpdVGo4oVn3iD12CD+4uHNiWOch8UICK2rfucwLEfvNPkk9TXr/mbdjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOde2LCk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOde2LCk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBABB1F000E9;
	Tue, 21 Jul 2026 10:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784630243;
	bh=jPiV/GHqNwGBkrN3BpUgbzr0W7EuSdtk4MMVVjc9s00=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UOde2LCkxd8Avim6N7VjcWY51lACAg7q2P8NG/ZLZrUmVKZZKVWcHGbd5crdoNyHq
	 fGrXhopVVrJdZCHavKhsHXXMnlRWgIrA9iLJw8+YumAQ/+agemBx7ONrgv4rDWjYkl
	 Hm9Ccu+SO9QM3hSMlvwkBxCR6NXdrOHoI4RXZJ4r7txMBFpeXioPJ1ZXU1JKod3Bht
	 1QvTLOl4CKwkrpq3d8mXc35WG5vNTqN8uhoY2sJ/b4BE9qXaVdhesViP8sSOnmVoGX
	 7+ZrNwerJtb9I40G6GPh96YCbETrZAkXRgFiAugm28zl4R0T4MCum2otsL0tWefeXG
	 2/GZXco/7fCEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v29 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721-imx-se-if-v29-1-04a362f4fcca@nxp.com>
References: <20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com>
 <20260721-imx-se-if-v29-1-04a362f4fcca@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:37:22 +0000
Message-Id: <20260721103722.CBABB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch adds a kernel-doc directive referencing `drivers/firmware=
/imx/se_ctrl.c`, but this file does not exist in the repository at this com=
mit, causing a documentation build warning.
--

--- Patch [1]: [PATCH v29 1/7] Documentation/firmware: add imx/se to other_=
interfaces ---
commit a3ebc2d6148d8ccb6cc329a101fcbc2ad8e624ff
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

    Documentation/firmware: add imx/se to other_interfaces
   =20
    Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
    that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
    - NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

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
Is this kernel-doc directive pointing to a missing file?

The file drivers/firmware/imx/se_ctrl.c does not appear to exist in the
tree at this commit.

Will this cause a regression when generating the documentation by introduci=
ng
a new build warning?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-imx-se-if-=
v29-0-04a362f4fcca@nxp.com?part=3D1
