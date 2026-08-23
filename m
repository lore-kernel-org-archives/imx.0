Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C92D25524C;
	Sun, 23 Aug 2026 22:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787524556; cv=none; b=BqKYqYsZcowJU0+TbxDL6gV1qjJUmmFzzqcMsIpHRHYWe1j1nhgKTwvnNp7Q3tqW/aBM0K3Z8ocqj3E9/U2j+LF9uwWjU6Obild4zUzMox/+OWy+wikqJnc3f+MZQzukZa5OxtV4bK5f5YnlF5QBwXkOn1Zoth2/B63dLXTJAJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787524556; c=relaxed/simple;
	bh=QQNYF+vq2eHzvXvr6LF/g5eTCLrcpvJfSvMtW/+G7PY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C0G37bpRmvKJR7S2yU2UNZMYbj/yl874TpotzjCwGqRb7aBUkZUCI8m5A52DhcSBNGqA5w8bCfFcsPgJY/YB/dJ+IPZ2ihLkih21Ztv/JkhIPxOmDVOo/5nQ5wFlbqgpY06CnkVvQCDETG4n+PV0COLWpmyAFF2F6iYihzO7rcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPX+hzNR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPX+hzNR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6CC1F000E9;
	Sun, 23 Aug 2026 22:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787524554;
	bh=po7IIoGOeeqrSpZ0T/dO1sDrsRTve3va2HW8MDN/VFU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NPX+hzNR7qJdfJBxOLKw2E+bR+SPnZVFnCoIuRwIx2virIuuge7axHzg6M1w8y+Hg
	 TX82MpT5KOP7wcY751X7V4MIuZ/YJbZ9u0Aj8vt0U/VYpfJkEUvw7ap9UxekQQVGEj
	 WAW9OZcnzbKVc55PU8G+dr8XphHjVDhr8fizWqwy5fHXqN7DAJi3HfCHe5HkF60bar
	 FHhPpO7UCVmSvP2Lil8ReBgC0A4zHV59wcZ1z42VFkwSR74+sdBwMyu5s/Z1y3ONIo
	 /xgunlFK11a8RRH9KGQnBNQ6tvQq3Uf7oPiHjfUFCoskAbiisZ5cgRbnSkGTLuJ95U
	 g/1ExDDeBmsAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: lx2160a: fix incorrect pinmux
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260824-for-upstream-lx2160a-pinmux-fix-v1-1-33a3c8d5ea8a@free.fr>
References: <20260824-for-upstream-lx2160a-pinmux-fix-v1-1-33a3c8d5ea8a@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 22:35:53 +0000
Message-Id: <20260823223554.7A6CC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The pinctrl offset for `dspi2_miso_mosi_pins` is set to `0x3`, whi=
ch is unaligned for a 32-bit register width, triggering a synchronous align=
ment fault on ARM64.
- [High] Pinmux nodes `i2c0_pins` and `gpio0_3_2_pins` specify an incomplet=
e 1-bit mask (`0x1 << 10`), causing the `pinctrl-single` driver to silently=
 reject them.
--

--- Patch [1]: [PATCH] arm64: dts: lx2160a: fix incorrect pinmux ---
commit 361d41dcf4495f73be88ba1bf5234be91b377473
Author: Vincent Jardin <vjardin@free.fr>

arm64: dts: lx2160a: fix incorrect pinmux
   =20
For gpio1 value set for pinctrl is outside the mask and so will do
nothing. Add the missing offset for value field to be the same as the
mask as expected.

Fixes: 284ad7064aaa ("arm64: dts: lx2160a: complete pinmux for rcwsr12 conf=
iguration word")
Signed-off-by: Vincent Jardin <vjardin@free.fr>

> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/=
boot/dts/freescale/fsl-lx2160a.dtsi
> index 1d73abffa6b72..b9f079c49e193 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but is the pinctrl offset unalig=
ned
for dspi2_miso_mosi_pins?

arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:dspi2_miso_mosi_pins {
    ...
    pinctrl-single,bits =3D <0x3 (0x2 << 9) (0x7 << 9)>;
    ...
}

The pinctrl-single driver uses 32-bit accessors when the register width is =
32.
Since the base offset is 0x3, this results in an unaligned I/O access on
arm64, which triggers a synchronous alignment fault.

Could this have been a typo for <0x0 (0x3 << 9) (0x7 << 9)>?

[Severity: High]
This is a pre-existing issue, but does this incomplete mask cause the pin
configuration to be skipped entirely?

arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:i2c0_pins {
    ...
    pinctrl-single,bits =3D <0x8 0x0 (0x1 << 10)>;
    ...
}

This also appears in gpio0_3_2_pins:

arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:gpio0_3_2_pins {
    ...
    pinctrl-single,bits =3D <0x8 (0x1 << 10) (0x1 << 10)>;
    ...
}

Looking at the pinctrl-single driver, it strictly validates that the suppli=
ed
mask matches the hardware function mask shifted to the pin's bit position:

drivers/pinctrl/pinctrl-single.c:pcs_parse_bits_in_pinctrl_entry() {
    ...
    if (submask !=3D mask_pos) {
        dev_warn(pcs->dev,
                "Invalid submask 0x%x for %pOFn at 0x%x\n",
                submask, np, offset);
        continue;
    }
    ...
}

Since the function mask is 0x7, mask_pos would be 0x1c00 (0x7 << 10), but t=
he
supplied mask is 0x400 (0x1 << 10).

Because these do not match, does the driver log an invalid submask warning =
and
skip configuring the pin?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-for-upstre=
am-lx2160a-pinmux-fix-v1-1-33a3c8d5ea8a@free.fr?part=3D1
