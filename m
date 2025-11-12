Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29655334C06
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 12:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762951317; cv=none; b=HfJHFFinOPv4znO7uP8PoVTqjnPjb3W8xUN7QUyNCySyFFehUsi5WBM5c2nTUd7XGUH2ie5+T2PCO7L3ZaKdJCzxNkcsWK+B6DCcHEeyUaELN0u0EOOxzbA6FMbylbrqp5yc8cbNko2abrlL8BgUNojlmDtxmZKOoZdvO1jRi40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762951317; c=relaxed/simple;
	bh=LLQDTLZhEwI383p4au9J4JBzW8WMvm+21axEr2g03UE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Ug6wz/R5mYXIBN2mRMzDBOQ/IzJaAZWPvt/Mi138ZjhM8gAEZBIDpWO9ErUA+50MsPpIlDClKKeXntjNV7+Js+M7Hy9pepW+0h5IlZ5LNyWy2/27yORdNliCsfg769jbHmVHCQuPKtIP3GMFIhr1BE/yViyLBRn7lIBEr41mZfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rleANA/U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rleANA/U"
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF75CE77;
	Wed, 12 Nov 2025 13:39:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762951193;
	bh=LLQDTLZhEwI383p4au9J4JBzW8WMvm+21axEr2g03UE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rleANA/UnZt2L8Q2lRInyqmF+bbyFtlm+o2pO4RCNJJ1SF8U5/+i1RPGtuyFSq8M2
	 aFthXDSlJec4F1EAfuMfti3DJGll/kTTj/VkNaRg5Qa9ETOuATx2Ji8mM0uJWtaNSG
	 Qzt6fvd5pP2QQnt3iLmjmY59GRgf75vrUnPlqdgU=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aRR-6Nl3ELB2v8gV@shell.armlinux.org.uk>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com> <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch> <aP83bMDWCre7-Sjw@pengutronix.de> <aRR-6Nl3ELB2v8gV@shell.armlinux.org.uk>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Daniel Scally <dan.scally@ideasonboard.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>, Russell King (Oracle) <linux@armlinux.org.uk>
Date: Wed, 12 Nov 2025 12:41:50 +0000
Message-ID: <176295131007.567526.3395425614344577792@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Russell King (Oracle) (2025-11-12 12:34:48)
> On Mon, Oct 27, 2025 at 10:12:12AM +0100, Oleksij Rempel wrote:
> > Please note, RTL8211E PHY do use undocumented SmartEEE mode by default.
>=20
> Same as RTL8211F I believe (as used on the Jetson Xavier NX platform I
> have.) I submitted commit bfc17c165835 ("net: phy: realtek: disable
> PHY-mode EEE") to get EEE working on this platform.
>=20
> > It ignores RGMII LPI opcodes and doing own thing. It can be confirmed by
> > monitoring RGMII TX and MDI lines with oscilloscope and changing
> > tx-timer configurations. I also confirmed this information from other
> > source. To disable SmartEEE and use plain MAC based mode, NDA documenta=
tion
> > is needed.
>=20
> What I saw there was similar to what you describe (although I have no
> way to monitor these signals.) No interrupt storms, but while the
> stmmac TX path would enter LPI mode (whether that provoked anything
> in the PHY, I do not know), the RX path never entered LPI mode because
> the PHY never forwarded that status.
>=20
> So, I don't think having SmartEEE enabled on the RTL8211E would cause
> this interrupt storm that Laurent is reporting.

Perhaps further complicating matters.

I have a Debix Model A as well ... I'm in a different office to Laurent
- and I believe EEE is enabled on my board/network switch.

I do not get an interrupt storm.

I'm not sure how this helps yet, - I don't know what to debug as I can't
reproduce the issue!

I can provide remote access to the board with ssh if that helps anyone
who wants to look at something specific about my setup or run anything
if anyone has ideas of what to check my side.

Perhaps we can find some subtle difference between a working case and a
non-working case...

--
Kieran




> In Emanuele's case, things are different. The TI PHY reports that EEE
> is supported, implements the autoneg registers for EEE, but *doesn't*
> implement the necessary hardware for detecting/entering/exiting LPI
> mode. So, if EEE is negotiated, the remote end thinks it can enter
> LPI mode... which likely causes the link to drop as the TI PHY can't
> cope with that, and I suspect that's the cause of Emanuele's problem.
>=20
> I'm wondering why "arm64: dts: imx8mp: add cpuidle state "cpu-pd-wait""
> impacts this - could it be that entering the idle state does more than
> just affecting the CPU domain, but interferes with the EQOS domain in
> some way. Given that the entry/exit to this state is all buried in
> PSCI stuff, without digging through the ATF implementation for this
> platform and then cross-referencing the iMX8M documentation, I don't
> know what effect this has on the system. Is it possible that PSCI is
> messing with the EQOS?
>=20
> What about the clock tree? Is it possible that the stmmac and/or RGMII
> clocks could be lost when cpu-pd-wait state is entered on all CPUs?
>=20
> Has anyone checked whether there's anything in the errata
> documentation?
>=20
> --=20
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
