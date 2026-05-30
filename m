Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0928C46B5
	for <imx@lists.linux.dev>; Sat, 30 May 2026 00:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101992; cv=none; b=KGUinMLoi7oYcQTLrylUi9hwJSzjBOzVhn7IRW7FbPv5gNIT+1w2ZTAvKhuhlv3qjs6mKW82cvYgDtI4CEIZ33khQLbzfPC50al2PCQU9xcxWFdmnuxxrUAKKYqqw3+Ncnu+3lbLpJ7vcJEpAzu/8NRl6+KRd3cVlMEaswvrdTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101992; c=relaxed/simple;
	bh=AU2baoMUZYcoqXDLmCogu9dFkXk4ifmO0HywzD+lFoE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J36OxBwnG6NJYOXAyCoVqdU4swDzamTWIwBfGgdv40SuCcqmeZFz79Fx9dBgZLaZfFyIgcXfq1Ne5zpErFn8LyX/gJx/qU6R8jWwivmATqloyYvnMt541O+ufjg71kGZFT4F1jBdwD8sXD8qk8QoZ0QsWkVPQG2pl2mOSLflIS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FuNuYUUH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FuNuYUUH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32C51F00899;
	Sat, 30 May 2026 00:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101990;
	bh=YGvkDhduHAXpHCE732When0v45BLbDDAeNPEhO5lScA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FuNuYUUHHoFmjyReFfQLpyJ/cWHjl/xXNLpFbFUunlt87B0iFQoHpj+Cr6WRq7GmZ
	 bwa34eAxu5/k53Y14UsRguUGifme3+rHzt6GxZT/pSJdn0eguCJ5DJ+haPXr+GbA1l
	 NMjG5meYyalUEqVlb58hnF5zT7A13WXAyugvLbsAAKgmMrIPSW7Viit5jTGcy+HaLD
	 DI+6dfLT4chu90Ovt3ZFPxxQ/gA+VV+rdlt6v7lY4GbFzGU1KOaQ+B7c3L1Sge/55k
	 vfySNng/PUnF0OA9k1nhxLFtE4zNqrIgXELdT8nRmzGcSf/dlUFyVMmIPvybXM11rc
	 /qhLXM/8T1rAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 12/12] net: enetc: dynamically allocate
 rxmsg based on VF count
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260522092438.1264020-13-wei.fang@nxp.com>
References: <20260522092438.1264020-13-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:46:30 +0000
Message-Id: <20260530004630.C32C51F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] VLAN promiscuous mode is silently broken for Virtual Functions bey=
ond the first two due to a hardcoded 3-bit mask.
- [High] Potential division by zero when allocating hardware rings to VFs i=
f the device supports 0 VFs and has more than 8 rings.
--

commit 03bc9cb8ddeec88c130b193926ea03b84b9d152b
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: dynamically allocate rxmsg based on VF count

This commit updates the ENETC driver to dynamically allocate the rxmsg array
based on the actual number of Virtual Functions supported by the hardware.
It removes the fixed allocation size to prevent memory over-allocation on
hardware variants with fewer or zero VFs.

>     i.MX94 standalone ENETC: 0 VFs

[Severity: High]
This is a pre-existing issue, but if a device supports 0 VFs and reports
more than 8 hardware rings during probe, will this result in a division by
zero?

In enetc_port_si_configure(), the driver reserves 8 rings for the PF and
distributes the rest to the VFs:

drivers/net/ethernet/freescale/enetc/enetc_pf.c:enetc_port_si_configure() {
	...
	if (num_rings)
		num_rings -=3D ENETC_PF_NUM_RINGS;
	...
	if (num_rings) {
		num_rings /=3D pf->total_vfs;
		val |=3D ENETC_PSICFGR0_SET_TXBDR(num_rings);
		val |=3D ENETC_PSICFGR0_SET_RXBDR(num_rings);
	}
	...
}

If pf->total_vfs is 0 and there are remaining rings, the division by zero
will cause a kernel panic.


>     i.MX94 internal ENETC:   3 VFs

[Severity: High]
This isn't a bug introduced by this patch, but since 3 VFs means there are
4 Station Interfaces (1 PF + 3 VFs) in total, will VLAN promiscuous mode
work for the 3rd VF?

The ENETC_PSIPVMR_SET_VP() macro uses a hardcoded 0x7 mask (3 bits), which
covers only the first 3 Station Interfaces:

drivers/net/ethernet/freescale/enetc/enetc_hw.h:
#define ENETC_PSIPVMR_SET_VP(simap)	((simap) & 0x7)

Because of this mask, the 4th Station Interface (the 3rd VF mapped to bit 3)
is silently dropped from the VLAN promiscuous mode configuration.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522092438.1264=
020-1-wei.fang@nxp.com?part=3D12
