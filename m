Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD873C2B8D;
	Mon, 17 Aug 2026 08:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786955946; cv=none; b=hxvhome9D641VIQZQ7m3jaEQcZZ4s3C+U0lscBV+2Zz08M0MSiNKoZt/1KUzblBU0s60vSHGFxYClYp1P9du+bqWYSAFVVem7RcWfTdJc7Hb9Tp0YUEF9inJi+SPmRebxySjzGd8ahXocmjVxuXfoG6P4jOU2kEgyzmwc3ZR5K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786955946; c=relaxed/simple;
	bh=aJEKkdq9CsXd7fbqFaeiotvb9gyDHcUTdy5GATf3IwA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lhhQIJ02zWOTOjX5RT0Non2yakPObD0fJAuJbSFXNcnqrgjRI1zcixtBSCDzH86izdRYVBuEhdFzXQqFeKt9T3jFDd/wlsO/KnsPVMP/ahv3wjWjIRIoLKfdjiFmGbYpPCR874Esm6oqkW4FZdVdLXQA7VqtDnLSgZKAQLxGsXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DulTUMEG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DulTUMEG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E7001F000E9;
	Mon, 17 Aug 2026 08:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786955944;
	bh=/7Ws/zXlk9a8wU3UpFrYhAOQLgoXWCX/e+bQBw1yqIE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DulTUMEGEVV7ICVOrPIovVv5G4IfOGh/y3zj9g7JM1EwDBA4Mz2bcGFZzb77KLa4s
	 j8lsAyk9JPx7y5yYuYw6kEsDBeJyGVJiEkgnivIk42dCriCLYNvNMstNbveL4iJRUP
	 Q0Qrb71od6UK3cPjFXRMreM0ZcH0gHmlrRAnw6qn6UOVifIE8jspeG1XtfOtkps209
	 9TD9ugoi8Szek2/OOSCLrvnB4SMYNLFWM4BLo+BfBi257YaUozQ2cnrvKTZfFrmYGQ
	 sWQMQf/MoI02CcqZrTCrzLXyDTppEJxq2T39yPvHwv/FC6HbLf8sjhXcLgSDjwez2e
	 w0/u6yz8bDzBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v36 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGFua2FqIEd1cHRhIChPU1Mp?= <pankaj.gupta@oss.nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260817-imx-se-if-v36-1-45c42847bfd8@oss.nxp.com>
References: <20260817-imx-se-if-v36-0-45c42847bfd8@oss.nxp.com>
 <20260817-imx-se-if-v36-1-45c42847bfd8@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 08:39:03 +0000
Message-Id: <20260817083904.8E7001F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch adds a kernel-doc directive referencing `drivers/firmware=
/imx/se_ctrl.c`, which does not exist in the source tree, causing Sphinx bu=
ild warnings/errors.
--

--- Patch [1]: [PATCH v36 1/7] Documentation/firmware: add imx/se to other_=
interfaces ---
commit 82d675982ce8a0c3aea4e77e567697a3f74c3a7b
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

Documentation/firmware: add imx/se to other_interfaces

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

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
Does drivers/firmware/imx/se_ctrl.c exist in the tree yet? Referencing a
missing file in the kernel-doc directive will cause Sphinx build warnings or
errors when generating htmldocs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-imx-se-if-=
v36-0-45c42847bfd8@oss.nxp.com?part=3D1
