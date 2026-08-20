Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7122F2DD5F6;
	Thu, 20 Aug 2026 08:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215202; cv=none; b=eQg2N012iyX2b7Oe1ZqRhmtJl5KdlCL2kz6tmjHrZH4xjJ3CWrGM+tE5qcqcEcRu/FsXti4wlhDkVTw3SODoLKI+4TO55U/nrYv9mKvRjFI2RXIZA6IujS6xqwjy/ktb5X8w2Sd+tYQRwma/qz9Ub+2FvifugHPbfE4051hgEWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215202; c=relaxed/simple;
	bh=kgt9B51msG/3u3tXnjKdkZBu/j25zPhFSIcQU+UCH10=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O5CiinLzTHD66EBqDiUIcazkcfX9ePZywPlhNbZipF2krfkfv8WV1jHaaitkX4/v0D4sU65vQfavQ4UXX9W6J8DyScetpVttIqhpLUAObpVVg4ig8peSCGVZjO9Ucpqp+p1v92FR0D7vA8MQRDo1LY0+Aqwyx5pOb+m/eI9zi8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WzgzwFNX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WzgzwFNX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72A81F000E9;
	Thu, 20 Aug 2026 08:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787215201;
	bh=8vHMpbtaEuh5YWlBuZsahQTtAdW6WNKs08CVgQNNMXA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WzgzwFNXfaHEPxH+PiQBphybpOZWtbLY33/tJHmmKXqVjhy60wWIZMfO2XchlTahj
	 HSGSsMl74T/z2izIUaqlQV1JApBE9g4oADH9mQIFZPTE6Fr3IhWR7DrLFHt6LsDZe3
	 hDckCeuJFyTS0yVBo+snhePb3vIjpJlIo49LMo1abhtSy5QmMs1FNRPd2S+40GYjkb
	 oUJNZG6mBZS2/W6S76JZuGRA01KmE++aahEm6n5SDQUDdPF2KZ59Qd1RYdT06XpKLL
	 5DBy/XQ5AtdVNp4x5kH5CZo4e4BRkFDhT8PNp5T55TfMFHEQg4obgncuglcxSIGe6J
	 Mz32eF+4RwBYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] arm64: dts: imx943: Avoid 32-bit PCIe window
 System RAM overlap
Reply-To: sashiko-reviews@lists.linux.dev
To: hongxing.zhu@oss.nxp.com
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260820083620.877251-4-hongxing.zhu@oss.nxp.com>
References: <20260820083620.877251-1-hongxing.zhu@oss.nxp.com>
 <20260820083620.877251-4-hongxing.zhu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 08:40:00 +0000
Message-Id: <20260820084000.A72A81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message incorrectly claims to modify the CPU address =
instead of the PCIe bus address.
--

--- Patch [3]: [PATCH v1 3/3] arm64: dts: imx943: Avoid 32-bit PCIe window =
System RAM overlap ---
commit 06a8fbf859a9df88332de43a908bb91e8293759a
Author: Richard Zhu <hongxing.zhu@nxp.com>

arm64: dts: imx943: Avoid 32-bit PCIe window System RAM overlap

This commit updates the PCIe non-prefetchable memory range for the imx943 to
avoid overlapping with DRAM. It adjusts the outbound address space
configuration to use a safe, reserved range.

> diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/=
dts/freescale/imx943.dtsi
> --- a/arch/arm64/boot/dts/freescale/imx943.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
[ ... ]
> @@ -219,7 +219,7 @@ pcie1: pcie@4c380000 {
>  			      <0 0x4c3c0000 0 0x4000>;
>  			reg-names =3D "dbi", "config", "atu", "app";
>  			ranges =3D <0x43000000 0xa 0x00000000 0xa 0x00000000 0x0 0xe0000000>,
> -				 <0x82000000 0x0 0xe0000000 0xa 0xe0000000 0x0 0x10000000>,
> +				 <0x82000000 0x0 0x10000000 0xa 0xe0000000 0x0 0x10000000>,

[Severity: Medium]
The commit message states that this moves the PCIe non-prefetchable memory
CPU address from 0xe0000000 to 0x10000000. Is this description accurate?

Looking at the ranges property in pcie1, the format is
<child_hi child_mid child_low parent_hi parent_low size_hi size_low>.

This change modifies the third cell (child_low), which represents the PCIe
bus address, from 0xe0000000 to 0x10000000. However, the fourth and fifth
cells representing the parent CPU address remain completely unchanged at
0xa 0xe0000000.

Does the code need to change the parent CPU address cells instead, or should
the commit message be updated to reflect that the child bus address is what
is actually being modified?

>  				 <0x81000000 0x0 0x00000000 0xa 0xf0000000 0x0 0x00100000>;
>  			#address-cells =3D <3>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820083620.8772=
51-1-hongxing.zhu@oss.nxp.com?part=3D3
