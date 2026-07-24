Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90AA3CDBD7;
	Fri, 24 Jul 2026 08:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784881139; cv=none; b=a+FmpJkAAoGGnOxY7PGrVUvEvib5DxUGRSxHzATZU1F+DVbcGz29IH+YeFOpahJBZApPfs2eKvh4QppQs1nIWhL54WrrubXpIMQmWu4oVlo0N2aflvsxgO8xwl2cqnVDVjB0jB+JQO31J9z6WDv1sshn7DId2xUDI0OdP3eOZIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784881139; c=relaxed/simple;
	bh=8u2BPq31ZA6Hdh+CPpeYreM3z0l+QFHE94Hi64T3JBA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WC0H1+tTlhEK49IbR83wPrx8G5pacyuUDGfHkfzmS17vvknzdoeP/bNTL9S7s2uf4aGNrXmSzDrEJVRN9FNhILvilQ2D2WNGBBQjE+2s3USFUD7Lsvs9umwDTkp6JDAN0taWqjj1vYpajWhG8zckzhMGgJ26QoI2B0GJWfwi+co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NNLqsPXA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NNLqsPXA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9731F000E9;
	Fri, 24 Jul 2026 08:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784881134;
	bh=SRe1lxKgF/YYPa1FmeLYJsLI4vi3xClyMf+2QbdaUDE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NNLqsPXAISsEYbIp5z+kxZT8PVrTWPrMZybFxsdCj0/benV+mI8BX2K5RMemE7uFF
	 4NJatk1q5cEwAjvThYc9u+yg6uVfvNOWFvMtrwgDfhuvGvfvmv1CAVqPpOTnBy1IBj
	 LpTcZHKinBQLsjJJ4EB9s6qGJ/Wv6xHfYJW7Mm+CPtwSDwqCxON7xOIZz8UMW4lKzB
	 urA4qS+o43IyGHsMyt4o7rBAQQXizLhSqeKun26HbAfJ4TW+1J7AsMTr5/Pr/YY4ca
	 ikcyV6zZBqGoTbR+OIXNlbPkoBKljr1kbd7Mcr5izP7belqQV1bLMXX74nQ2X5JaGu
	 CywozBneMMAGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v30 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <20260724-imx-se-if-v30-1-ce8ba256692c@nxp.com>
References: <20260724-imx-se-if-v30-0-ce8ba256692c@nxp.com>
 <20260724-imx-se-if-v30-1-ce8ba256692c@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 08:18:53 +0000
Message-Id: <20260724081853.9C9731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch adds a `kernel-doc` directive for a file (`drivers/firmwa=
re/imx/se_ctrl.c`) that does not exist in the source tree.
--

--- Patch [1]: [PATCH v30 1/7] Documentation/firmware: add imx/se to other_=
interfaces ---
commit 43e18a35856ddc18eb46afd1a11d10f39aa86e8d
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

Documentation/firmware: add imx/se to other_interfaces

Documents i.MX SoC's Service layer and C_DEV driver for selected SoCs that
contain NXP hardware IPs for Secure Enclaves.

> diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Doc=
umentation/driver-api/firmware/other_interfaces.rst
> index 06ac89adaafba..6c6fa9a0ba1df 100644
> --- a/Documentation/driver-api/firmware/other_interfaces.rst
> +++ b/Documentation/driver-api/firmware/other_interfaces.rst
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
Does this source file exist in the tree yet? It appears=20
drivers/firmware/imx/se_ctrl.c is missing from this patch series, which will
cause documentation builds to fail or emit warnings when trying to extract =
the
kernel-doc comments.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-imx-se-if-=
v30-0-ce8ba256692c@nxp.com?part=3D1
