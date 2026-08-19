Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1918E392C2A;
	Wed, 19 Aug 2026 13:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787145611; cv=none; b=DVkOidVn0S1ckWboP5NxWrQTAnn3u6OjjogIGXeNqmQSppIei2YbzXjqocVXbQOaRBPXKHJWroWoR/tIrTY/gJxpX6u2hzt+N13ho4zW/G06PCCGTYVvtXeLXcx7ARLryGSkD4XnxUsnfCM9wgGWTAAFor8hMi7iGUjd3/wYsPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787145611; c=relaxed/simple;
	bh=LtbLcFG7niLBFAHPYvLhq7qyS0f3y1lN3EatvlsJKO4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GZgEl1y/qggDlguKnhHB4rIuWdAtMI65mmtpxFcHHE06leK97wWhb2HckW91Z0C/Iqzdoe/RrZq8pQLVqD7pbNoJvcT/DcduaDWfhKwseDkzs01e2TXL1y4AeNaJKZqtY9vUf2HQoHCjOogJO9IdB053Crn1vg38c9F0jIESDU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFErZIpm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFErZIpm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC841F000E9;
	Wed, 19 Aug 2026 13:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787145609;
	bh=jFSpx4HwwJYmV//EbrLBvKxaqtpESp2E6j/wbzsUcNQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VFErZIpmxiRhYKtm1Q0+vbZ85KKq7TYgsn4k+cehig8UTEuY9YfQA/xNW2TDR6Kre
	 z4FnoeL+w1UJ0aOqyK3AnMPdwXI+xnLqnpdIlYmGXXEXVuuwA4oNnoVuFJIp6AhqGn
	 +R+da9uRNWDNRhjpVgDdY9BjL1nqeq4nJYBFIkblktQAxqxQymskhKpbgZo3phASvA
	 2w1z/Ch6uAvwXcxlzGXL0M42FanNSgYW48s627SlV/zmbKQ3GbKZo596fiiln5++yV
	 hFMVqpWp6dU+ksLW1oi42zmwgcN1DoWAoc4oikMGMrmVGp+/ez1Rq6NXAV4ME9gNSK
	 ZmOuOVFv4uI3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v38 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260820-imx-se-if-v38-1-5df4a4cff736@nxp.com>
References: <20260820-imx-se-if-v38-0-5df4a4cff736@nxp.com>
 <20260820-imx-se-if-v38-1-5df4a4cff736@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 13:20:08 +0000
Message-Id: <20260819132009.4DC841F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch includes a `kernel-doc` directive for a file (`drivers/fi=
rmware/imx/se_ctrl.c`) that does not exist in the source tree at this revis=
ion.
--

--- Patch [1]: [PATCH v38 1/7] Documentation/firmware: add imx/se to other_=
interfaces ---
commit 9d7548655ebb737efce2e2011a588d419c6d261b
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
Does this file exist in the source tree at this revision? It appears that
building the htmldocs will generate warnings because=20
drivers/firmware/imx/se_ctrl.c is not present in the tree yet.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-imx-se-if-=
v38-0-5df4a4cff736@nxp.com?part=3D1
