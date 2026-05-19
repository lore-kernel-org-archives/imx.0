Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFCD3CF02E;
	Tue, 19 May 2026 07:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175303; cv=none; b=GlK9ginvtePsEg3bM9Qn/Wi5/PLJ+KVrzVU/wQ7PT/sShs2ZEYnVmXNyvEbMRUbdQycLSEvEyJeM8RdTL6zhKl4Fd3KRA52ROXjuu0xm948IUKF5a9zWK7EhHMWKWUFgFeN2OCgxaH45uCGsxAU2HNKKsfZ19w0Tovte/fDUK0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175303; c=relaxed/simple;
	bh=jbEDqUKIlL++vLBxJkg3oedkFsR/L9hz2AvkQGhaX9A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TPe9WQ+46SLYQkeUE/4SgAIY4AUMcpzKGAyII51McPbd+GAix1XwFuJluHVPgpgyNSszj9Xg/Y0Woanifkul/qBMd+dfD9HKrY7YmyI5Om9r8TSk/URBxhM7OIUaZiOc9i91i/P2HJUTijiTeDspf+r27gX6f/Zx2XT+QG+hfR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URxwBbEz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URxwBbEz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8C0C2BCB3;
	Tue, 19 May 2026 07:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779175302;
	bh=jbEDqUKIlL++vLBxJkg3oedkFsR/L9hz2AvkQGhaX9A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=URxwBbEzDvIvR9ivAz1H1ScmNRTZSRAtr77rPLP5rHHUkrsdD1g+mmRwpzd72zte5
	 Ftpj+nCH+Qond3tSzl/6WoVnRrimhgvYoerSHFn0uEY7TvEOfYzZgESFyS8IB/ZrBZ
	 8pnkv5wFidogtDwxhoUD7vmiFebscJ2+7u+pgMOj0u1Ftl5rd4sWxoPBlVoz58Mwnj
	 qVfbqBSeF9unx0eACckJVShznIAUx5r9nWiBh3NQkKKHkc+/svSenxjLcVEW7WOtmf
	 0oJlmjTXaGahwp7xD9BMnyBKN6kpUYRVb9/H8pJgbq7cri+crhPTDNwQ9QDPn7gp1g
	 HPcYMHp3SEytA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6] arm64: dts: imx95: Correct PCIe outbound address
 space configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Zhu" <hongxing.zhu@nxp.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260519070223.361106-1-hongxing.zhu@nxp.com>
References: <20260519070223.361106-1-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 07:21:41 +0000
Message-Id: <20260519072142.0D8C0C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Expanding the 32-bit PCIe outbound memory window to cover 3.84GB (=
from 0x00000000 to 0xefffffff) intercepts and blackholes inbound 32-bit DMA=
 transactions, breaking device DMA.
--

commit d83be49665e8cce20876ad202979b5eb76f6a536
Author: Richard Zhu <hongxing.zhu@nxp.com>

arm64: dts: imx95: Correct PCIe outbound address space configuration

This commit expands the PCIe outbound memory ranges from 256MB to ~3840MB
for both pcie0 and pcie1 controllers on i.MX95. It also relocates the 1MB
I/O region to offset 0xf0000000 within each window.

> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/d=
ts/freescale/imx95.dtsi
> index 71394871d8dd0..074f8865eb2d3 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1852,8 +1852,8 @@ pcie0: pcie@4c300000 {
>  			      <0 0x4c360000 0 0x10000>,
>  			      <0 0x4c340000 0 0x4000>;
>  			reg-names =3D "dbi", "config", "atu", "app";
> -			ranges =3D <0x81000000 0x0 0x00000000 0x0 0x6ff00000 0 0x00100000>,
> -				 <0x82000000 0x0 0x10000000 0x9 0x10000000 0 0x10000000>;
> +			ranges =3D <0x82000000 0x0 0x00000000 0x9 0x00000000 0x0 0xf0000000>,
> +				 <0x81000000 0x0 0x00000000 0x9 0xf0000000 0x0 0x00100000>;

Will mapping this 3.84GB window into the 32-bit PCI address space intercept
inbound 32-bit DMA transactions?

Because this uses the 0x82000000 flag (32-bit memory space), it covers the
PCI address range from 0x00000000 to 0xEFFFFFFF. A Root Port will typically
not forward memory requests from the PCIe link to the system bus if the
target address falls within its programmed downstream memory base and limit.

This means inbound DMA from a PCIe endpoint using an address in this 3.84GB
range might be treated as a peer-to-peer transaction and dropped or routed
downstream, failing to reach system memory.

If the IOMMU is enabled, the PCI core will reserve this 3.84GB window in the
IOMMU allocator to prevent overlap. Will this leave only 256MB of 32-bit IO=
VA
space available, potentially exhausting it and breaking drivers with 32-bit
DMA masks?

Could this outbound window either be kept small, or mapped into the 64-bit =
PCI
address space (using the 0x83000000 flag) at an address above 4GB to preser=
ve
the 32-bit PCI address space for inbound DMA?

[ ... ]

> @@ -1927,8 +1927,8 @@ pcie1: pcie@4c380000 {
>  			      <0 0x4c3e0000 0 0x10000>,
>  			      <0 0x4c3c0000 0 0x4000>;
>  			reg-names =3D "dbi", "config", "atu", "app";
> -			ranges =3D <0x81000000 0 0x00000000 0x8 0x8ff00000 0 0x00100000>,
> -				 <0x82000000 0 0x10000000 0xa 0x10000000 0 0x10000000>;
> +			ranges =3D <0x82000000 0x0 0x00000000 0xa 0x00000000 0x0 0xf0000000>,
> +				 <0x81000000 0x0 0x00000000 0xa 0xf0000000 0x0 0x00100000>;

Does the same 32-bit DMA mapping limitation apply to this pcie1 configurati=
on
as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519070223.3611=
06-1-hongxing.zhu@nxp.com?part=3D1
