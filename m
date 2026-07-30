Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B7B30D3E8;
	Thu, 30 Jul 2026 02:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785378069; cv=none; b=LplH++OBkiZVByKaOGjaVrNeAP9Kjd5E1wOtwb3OSFj2bKYWK90HKGdOevMfOmeZOVkdwD3nkbAjIOrquw0mddPBJk3Ydh1NdsZG7WMXgorYf1Ez3mylBN3n/c5X3EV+qGt+pFmy53Xbn5W/iAQfvYcV7BIQf4863K7BpEBhjZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785378069; c=relaxed/simple;
	bh=SZAA2lCRhhXjNSiaIclRfo7bT2ezB+cRFmt8g39IpCo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cdc7qZqg+rrNd5i/PLC5nq3B8PlFhtkuoeeclSuspK13dankKrHX6MvU45faAplHQt0BQMQDiTOCtEzWNB9f2adTkRp9c0zbw/uyU1SK/CG3jFeYoFnXQR7YBC8MuFw5RQZzMtFj5ji7eIVmuotiWhIXEaCFPl5KFgLfdUsTh/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=crcKHjfn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="crcKHjfn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0CEC1F000E9;
	Thu, 30 Jul 2026 02:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785378068;
	bh=KMgDxvS7USIl9URr+qZs2e47GIpXh1YB7zCNEUe8AK0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=crcKHjfnYLmlny9F8cNpupRHYFL8iKMFE1SQbbEB9jQEybfNHTgzvLKQ0tstCmGDX
	 fww/Vu9rH05+C2GgKe659ZZfjMK8MYm5dYO02eqSLLFj6LSIjZ0jUnpqdcyqtCVq+M
	 9McVBfI0bO4mBWjbHZzvBtfA1D+p7Wd6rV9FAlUhc5yh7a4mWGbfYCwakgtHJBcS2v
	 3HwKRABWPe7gBbBp+3FqJToIzmcSJ79+Co6Ybl6p20Xfq6NR25kUEPS3+iK8E64k8o
	 3DSOBaX8+JyIg9Lz43UyEfWTPcJIIW+DlUyarHymxpQAQGpPvrD2BVnFIcTAJrwFk4
	 y0AiZzPRKoffA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v32 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260730-imx-se-if-v32-1-95f56dff4ba9@nxp.com>
References: <20260730-imx-se-if-v32-0-95f56dff4ba9@nxp.com>
 <20260730-imx-se-if-v32-1-95f56dff4ba9@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 02:21:07 +0000
Message-Id: <20260730022107.A0CEC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The documentation references a non-existent source file (`drivers/f=
irmware/imx/se_ctrl.c`) using a `kernel-doc` directive, which will cause do=
cumentation build warnings or failures.
--

--- Patch [1]: [PATCH v32 1/7] Documentation/firmware: add imx/se to other_=
interfaces ---
commit 596e79c16cd58344a1eb725fe075ae129cefa874
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

Documentation/firmware: add imx/se to other_interfaces

This commit documents the i.MX SoC Service layer and character device driver
for hardware IPs like the NXP EdgeLock Enclave. It details the communication
interfaces, message serialization, and character device contexts used to
interact with the secure enclaves.

> diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Doc=
umentation/driver-api/firmware/other_interfaces.rst
> --- a/Documentation/driver-api/firmware/other_interfaces.rst
> +++ b/Documentation/driver-api/firmware/other_interfaces.rst
[ ... ]
> @@ -49,3 +49,136 @@ of the requests on to a secure monitor (EL3).
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
Does drivers/firmware/imx/se_ctrl.c exist in the tree at this commit?=20

It looks like this kernel-doc directive references a file that is not
present, which might cause documentation build targets to fail or emit
warnings because Sphinx cannot locate it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-imx-se-if-=
v32-0-95f56dff4ba9@nxp.com?part=3D1
