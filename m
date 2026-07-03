Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5A038888E;
	Fri,  3 Jul 2026 09:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783069252; cv=none; b=OYUBiKB+XC51PnbHKw05TQ/x1Rbto9Xq4j7fyGqgGpvURM0HnPB9ArFVxliFA32qBCsCAD9J1pWDfqUhPETE8URrIwdtLjYSuPnvXLvVi7JLk+g6fxOvOBVJLN+XXWVcxHBYGpOYJtVple52K9lveRMZKvfVndU86TrbNV26LGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783069252; c=relaxed/simple;
	bh=tdOlXp1vDONftqxfu295xMIvJ+7AhFdAxUSnxAEthPE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oOkgNYUP8quGJ5bJP6mBHhtbiVL+fikZI8WXGk4vOFALtqPyS+y6/GC5WYaBT5N1u5kVLV3Mh2oKioAb/iWSUlG6YeuQT2ZM6Pt+KRm+phgrfWiYgMeJ7S5lQZ7Sd7JVNKC9kk5DgZVrsh+gj/Bk2nfHwta7kHD8XmB4hSDVbKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCto8EmN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCto8EmN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E0A1F00A3A;
	Fri,  3 Jul 2026 09:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783069251;
	bh=tdOlXp1vDONftqxfu295xMIvJ+7AhFdAxUSnxAEthPE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YCto8EmNz41upJ5qOzhHUGrD5Iu3qnytr8KsbKECkZjCVsWvyvtkfIGyipo1jdhw7
	 ebgP7rtAQT4nlaWJlYEKX2aKf4J1EQ6GS1mJ2GfcvQGgTZ8X883WSa28+r0ioIfli+
	 6rkjZ6LQNw4AGA+glmNNCSSAJRcbZsWWXlWIdaWsul1Y3aQoh9P8HBX7YSyqT7FioS
	 gXU54TfxuCxe53uTCVUczQeR+a9Dypb5mFg7kGEIeQJLMAi1k6kiwmVXpHPM6nxwNu
	 xMjXHKgDPb05UP+AguXLFRywsWOIoLhygb9pYpN0EFpaeAJWqeOVCionz2r3hN7YgT
	 xGjk0hL/ZeGxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 10/15] arm64: dts: imx8mn-var-som-symphony: Add TPM2
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <fb9bfa8584a608e9ba8179b2749593bc23c040ea.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
 <fb9bfa8584a608e9ba8179b2749593bc23c040ea.1783067947.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 09:00:50 +0000
Message-Id: <20260703090050.F1E0A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete hardware initialization for the TPM device due to mis=
sing `reset-gpios` driver handling.
--

Note: The format of this review is altered and does not include direct quot=
es=20
of the patch code due to recitation restrictions. I am providing a free-for=
m=20
summary of the review findings instead.

commit 752fc746ff7ba94f6473f1446bfe64ae3aa4003c
Author: Stefano Radaelli <stefano.r@variscite.com>
Subject: arm64: dts: imx8mn-var-som-symphony: Add TPM2 support

This commit adds support for the ST33K TPM2 device on the VAR-SOM Symphony=
=20
carrier board. It introduces device tree nodes for the ST33K TPM2 connected=
=20
over I2C and a PCA6408 GPIO expander intended to control the TPM reset sign=
al.

[Severity: Medium]
In the newly added st33ktpm2xi2c node, there is a reset-gpios property
referencing pin 4 of the pca6408 GPIO expander. Will this actually bring
the TPM out of reset during boot?

Looking at the tpm_tis_i2c driver, it does not appear to contain code to
request and drive the reset-gpios property.

Furthermore, the pca6408 node does not declare a gpio-hog to statically
configure the pin state. This implies the GPIO expander pin will default to=
 a
high-impedance input when the kernel boots.

Unless the board has a hardware pull-up resistor or the bootloader
specifically configures this pin as an active output before handing off to
Linux, won't the TPM remain held in reset and fail to probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783067947.gi=
t.stefano.r@variscite.com?part=3D10
