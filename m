Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC953F8EA7;
	Fri, 17 Jul 2026 11:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286043; cv=none; b=a1ZO8vIpvh/N4N1tJLh5zP78HS/aAza6EzjRQes1ju/arZ+HSrIMQXRVIhTrwiAYOgxdh8ZLAc8iQp6yTeD76iwiB+3h7EXNHesI8tngz/X11XfUQGCFtl/tzbASsDPzDcJ8inJtTuC8mMLPVkOG4GiG7x+PrA4dybL9g/p4F/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286043; c=relaxed/simple;
	bh=bzN/qkUbGiEZG8wEsRAIo5B2iTgIew+XFMs8Lak6Hjg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fAD0Wc/fKqHYCjRUZ+4ne+FtZ8UFYB8g05HQp95Uam/hszl62n4exhiwEDKvWp0L56lc6gqfPUWGj190BpFRGINL8TcfUgjW3f9oF1hhQNlCLo9X19jrzJJOSi6lvERYLvmRu4Z/nyD286mb+AvF9OsEAiFqopVRIqMnA9nklSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=biJvd7/G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="biJvd7/G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2FC1F00A3D;
	Fri, 17 Jul 2026 11:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784286027;
	bh=e5LSyuWTWKLVr8IE+14DkJ70svz7RXQr9FVyOd24cr8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=biJvd7/Ga/XZigc6xHVV+zS/HpCeDgdByqADeIuDS1zAHyo5ALB0v3tKBPOrtLGIc
	 p+7yu52PJqPgSrWoGWdPaa/wwd6Q4smTzAi1s1XVPwH00P+mmVzVn4fHSlOlPYt4fA
	 O8w0i1mu3Uyc/d8ArCPBboqcsrhzM3uCeUp9Msc1exRY2VUWYdQP2hKNSTUg9NNB9B
	 VyVLqBTMVzvo1/iLhc4Xh80hmwN3Y70BE7hiAqBZKfvSWou9c1Do7Ngq6pvw4wkEaD
	 Lp8vEtmsGSoH5lhL6f4nYf/t8WkkSsTu9/gK6irYFTa/Zyjm9lp6+kCJ5MtqHikJmh
	 ksL34YZ59X+Cg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v28 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717-imx-se-if-v28-1-0a9659c7e69d@nxp.com>
References: <20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com>
 <20260717-imx-se-if-v28-1-0a9659c7e69d@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 11:00:26 +0000
Message-Id: <20260717110026.CD2FC1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The documentation references a missing file `drivers/firmware/imx/s=
e_ctrl.c`.
- [Low] Multiple grammatical and phrasing issues in the newly added documen=
tation hinder readability.
--

--- Patch [1]: [PATCH v28 1/7] Documentation/firmware: add imx/se to other_=
interfaces ---
commit d14736a873782e28bc9a614142ccc96cf497924b
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

Documentation/firmware: add imx/se to other_interfaces

This commit documents the i.MX SoC Service layer and character device
driver for SoCs containing NXP hardware IPs for Secure Enclaves. It
details features like the NXP EdgeLock Enclave on i.MX93 and i.MX8ULP.

> diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Doc=
umentation/driver-api/firmware/other_interfaces.rst
> index 06ac89adaafba..6c6fa9a0ba1df 100644
> --- a/Documentation/driver-api/firmware/other_interfaces.rst
> +++ b/Documentation/driver-api/firmware/other_interfaces.rst
> @@ -49,3 +49,136 @@ of the requests on to a secure monitor (EL3).
> =20
>  .. kernel-doc:: drivers/firmware/stratix10-svc.c
>     :export:
> +
> +NXP Secure Enclave Firmware Interface
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +------------
> +The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedde=
d secure
> +enclave within the SoC boundary to enable features like:

[Severity: Low]
This isn't a bug, but does this documentation contain several awkward
phrases and grammatical errors? Phrases like "The NXP's i.MX HW IP like",
"enabled with the such secure enclaves", and "there is/are dedicated" might
make this difficult to read. Could this section be reworded for clarity?

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
Does this file actually exist in the repository at this commit? Generating
the kernel documentation will likely result in a build warning or error
because the source file drivers/firmware/imx/se_ctrl.c cannot be found.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-imx-se-if-=
v28-0-0a9659c7e69d@nxp.com?part=3D1
