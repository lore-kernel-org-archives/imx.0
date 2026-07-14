Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6211138A722;
	Tue, 14 Jul 2026 12:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030811; cv=none; b=AhyWbRqmq2MOak7Wg2ri2OLXW6SJo9CqNUHKwWch/MlWiYp/qUKRc6I/3QzcvgDSmYUGultcaf5BDF+5kSNJOPPdfXskamwM7M63DCBcJGdHdXFuEQAI/Y/2Mhxl6XP/dMxUQCn7Guw2fmcHbwPKy/o0PxT+Ku6Bsoao2j9WN1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030811; c=relaxed/simple;
	bh=ZmvS0+8GuBtd9iAyjF4Cr9VcLF3E0Yy+Gdartxxdr3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qQAygTx17OftnBNW0LVAUlk+Qjg9uUfCfQ3N9vJ+kTwltIlP+dvO8pTJ7jYkuTLYyF0VxtOUB5VhvtcKH8gVEyRGav5KaQPkgCi/cE0BVUqnz6c2sxwACkkPTW7/7lZ273+EFJS4+ACwe5IssAwCp6JbYJnlg/bLrdzAfRr8Yhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=NmLFuFUg; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="NmLFuFUg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ZmvS0+8GuBtd9iAyjF4Cr9VcLF3E0Yy+Gdartxxdr3w=; b=NmLFuFUgt84zB+sJBpji4IR+V9
	20r7IQxycTJ5nZIvLCCCcE8txKiuKDzb8A8VOEDwnGUDxe9nMnCJCo1bakM3xwTMFu6LkMzQo6oFX
	PymRum5aj4xs2ui+ySp3ilSH9rQChvq5Wrvv3wzR0MDOwW+yaMRx0WGbDojvVfRlZZF5/AgHpjeCl
	0lECrvC9RvDqB3Y3Bqb0aCL/y2WJH3JPlztY2A3CsOofSE8XyvcWmFyrw99eNTh5ZEsDlKtD/36q8
	M7shaEpFu5S0FP4g2A3y3hvK/Ac9e1AjCTvBlPCzuIhzR1pWH/FEOL4NLz6jiw4bf9fAE7/x/YFmh
	zohUrpQg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjbuK-000K0H-1G;
	Tue, 14 Jul 2026 14:06:40 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjbuJ-0008J7-12;
	Tue, 14 Jul 2026 14:06:39 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-arm-kernel@lists.infradead.org
Cc: Francesco Dolcini <francesco@dolcini.it>,
 Frieder Schrempf <frieder@fris.de>, Srinivas Kandagatla <srini@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Pankaj Gupta <pankaj.gupta@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Francesco Dolcini <francesco@dolcini.it>
Subject:
 Re: [PATCH v2 10/10] arm64: dts: imx93-kontron: Enable ELE firmware driver
Date: Tue, 14 Jul 2026 14:06:38 +0200
Message-ID: <2420855.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260714093354.GC22086@francesco-nb>
References:
 <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
 <4b7b7823-00c5-4801-8ba4-19e5670f339d@kontron.de>
 <20260714093354.GC22086@francesco-nb>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28060/Tue Jul 14 08:25:07 2026)

Am Dienstag, 14. Juli 2026, 11:33:54 CEST schrieb Francesco Dolcini:
> On Tue, Jul 14, 2026 at 10:43:56AM +0200, Frieder Schrempf wrote:
> > On 14.07.26 10:32, Francesco Dolcini wrote:
> > > On Tue, Jul 14, 2026 at 10:09:11AM +0200, Frieder Schrempf wrote:
> > >> Hi Francesco,
> > >>
> > >> On 14.07.26 08:59, Francesco Dolcini wrote:
> > >>> Hello Frieder,
> > >>>
> > >>> On Mon, Jul 13, 2026 at 04:53:46PM +0200, Frieder Schrempf wrote:
> > >>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> > >>>>
> > >>>> Add the ELE firmware API node and pass its handle to the OCOTP
> > >>>> driver. This allows us to gain read/write access to the OTP fuses.
> > >>>
> > >>> This seems something we should have in the soc dtsi (imx93/imx91), =
it
> > >>> does not seems board specific.
> > >>
> > >> My original intention was to move as much as possible into the SoC d=
tsi.
> > >> The problem is that the memory node is somewhat board specific due to
> > >> the DDR. And I can't move the firmware node into the SoC dtsi and as=
sign
> > >> the memory node in the board dts as the checks for all boards not
> > >> specifying a memory node would fail then.
> > >=20
> > > What is the reason to have this memory address different on various
> > > boards? Can we have a default in the soc dtsi, and allow the board to
> > > override the address if needed?
> >=20
> > There is no real point in having different addresses on different
> > boards. But the node describes memory that is physically on the board
> > and not on the SoC. And I think that is why DT maintainers want to have
> > it in the board DT. It's the same with the memory nodes for the
> > remoteproc drivers to communicate with the Cortex M-Cores in the i.MX.
> > But maybe I'm wrong and if there is a possibility to move this to the
> > SoC DT I will definitely take it.

We are talking about reserved memory, so this is highly board-specific.
So for different hardware variants with different amount of RAM you have to
go for the minimum anyway.

> > >=20
> > > Or can't you add the address in all the boards, and keep everything e=
lse
> > > in the soc dtsi?
> > This could be a possible way, yes. In that case maybe we could even
> > create a generic dtsi to contain such defaults for all boards.
>=20
> I would go for this solution, we could have something like
> `k3-am62-ti-ipc-firmware.dtsi`, include it from all the boards, have a
> sane default memory address, and have an easy way to override the memory
> address from the board dts, if needed.

So what is a sane default? At the end of the minimal possible RAM?
I'm not really fond of something you have to make sure matches to your
hardware, but won't raise an error if you forgot.

How about providing defaults for the SoC part and users have to provide the=
ir
memory on board-level? Similar to the VPU nodes on imx8qm/imx8qxp. There you
have to specify memory-region in your board.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


