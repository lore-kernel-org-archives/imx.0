Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78603449B3D;
	Wed, 29 Jul 2026 09:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785318934; cv=none; b=aOCzmBvLxiWCgkCJuXEsKMxUkjBcpg7kt3DO2EWQ9O3voNeHTQPeHQND46NTVCUCZdMO0TFV0hpaRG9yy95XdKqWEirGYdCypprftQRZdnz03ObV8X1hJeqSswTEVZgGqBRE1wX6UaS5lv0h+ED6hDwDQcjSRT8zPh4PNcjxad4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785318934; c=relaxed/simple;
	bh=0KkAkURwbPQH1QbXFXT1I9Vp8mOAw++0OKtIyYW1xSc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=twB1YgyWNylHovPBnaBdjx2s197EwSmVrZvl9jmH5KrvHqh9Crq5XXJe7EyvNjbjaPtzH8YakW+zH1QttDoeY0M/yCRXXhd2YhkWMDNTMJESL25eZs3Q1vhYCKhI3oHxUFIQMmliiR6sgdpaTZ+eHtUDB+UhKJrLt0zltvREZGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDnuPtVV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDnuPtVV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E17EB1F00A3A;
	Wed, 29 Jul 2026 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785318927;
	bh=1d3MPah4DmGoFCrOxPM4LfyyeJb/X6wJHqnILdkPdy8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PDnuPtVVsUnyb57yUD3Rr+mTFVY0Tr0nsqozREnkHlPE3JViRAVbix+OSYtUPRiPf
	 LNgM4MdqE5KHgnuMfE1ohG+KvDNDsUITToRWeSn4unJA72GYsPH4O1UuZG3CvYULOH
	 qEVKhA3xQwdnoOCZF1IWbJ8pBzhw6fJtbmxoJQXCNEDPYOSk80erBIQIB4qZb8aiHp
	 h4PM9kOSuhqyVNVc7E3t9ApNt/bqANzX6QKfhpuaKMVX+c1fO79m+AVbvbZ//YJwyw
	 CM4iiRQcC0uHZI2NR8d+LAixcnlS1HqBzutCd8sK5U9NQfqxrqfnyTrY7a4QhUYd/f
	 w8s5mp7sPRKpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v31 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729-imx-se-if-v31-1-e59af7adb784@nxp.com>
References: <20260729-imx-se-if-v31-0-e59af7adb784@nxp.com>
 <20260729-imx-se-if-v31-1-e59af7adb784@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 09:55:26 +0000
Message-Id: <20260729095526.E17EB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch references a non-existent source file in a kernel-doc dir=
ective, which will cause documentation build failures.
--

--- Patch [1]: [PATCH v31 1/7] Documentation/firmware: add imx/se to other_=
interfaces ---
commit 2f907f8c1c676d8fed14e2e8d6058fd4c768cfd8
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

Documentation/firmware: add imx/se to other_interfaces

This commit documents the i.MX SoC Service layer and character device
driver for selected SoCs containing NXP hardware IPs for Secure Enclaves.
It details the communication protocol and layers used to interface with
these enclaves.

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
Does drivers/firmware/imx/se_ctrl.c exist in the tree at this point?=20

It looks like this kernel-doc directive references a file that is not
included in this patch or the current source tree, which will cause the
documentation build to fail when it cannot find the specified source file.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-imx-se-if-=
v31-0-e59af7adb784@nxp.com?part=3D1
