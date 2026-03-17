Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7AD21CA13;
	Tue, 17 Mar 2026 15:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773762620; cv=none; b=SRM5PeGiyOO84M2YuQ9KgQdtclAhST95dRsgL6C76FwJO+aOF1S4bADZWUZaR9rVGrLKzytzWRPKLvuHB2FE89p8JKj4/BJbLX6SOe3ZKsuiH/g9CS5mmzP74xjJrNtYsmCKzLqrZEtSPBXd8QpmrjJnTIDjV03CbQFzOHwxI84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773762620; c=relaxed/simple;
	bh=Bs0jmeOlBNI56rDpcZTABMQqKuYEGTfs6CUlPLcuYdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gzNFr/T+0pRSiy85iFlvU8ILykVJO6ToxzcOS4xEVSq2bnjIESjX0ErTNv9d5zkDa6cnKjA3Y/O8cN6slBNk+6l9zvqnklMsNRbAg+ROE3pIoxmG/M+gV/JEiapuMmUQDvaYuFR1u0Ft0i8lKmDv2MvlmDe+711vqW9PxJ65f/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=lg8M8Gmv; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="lg8M8Gmv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=rOQHrjKwGcczje2v+eU1aZvCLFert0kO8lT/mQtbxsQ=; b=lg8M8Gmvt96POhHYdOGTrWhd9a
	RNHAQctN7q1Ib/FrqD3/4Oq7XRfiiIHrhmySXDpF3Pi8KwTETfkxdjTD1pD8PtpwSgTl4Xwz5JVFU
	rjo9GZqffOI6n/TG8Wr541n/67T78b84cqiFqzO5QTWqBRzyishrQrLOlkc+/zr3wB6QA1a/X5ydE
	8IRcwSR/3SVv1Nmo+NbJTKAP2eYBddVi1SMPPOAlJx/U14GyepUk0RmG0iyFCtX5yW4Lo0o1JYIbY
	DgmAcNEqTxDZJZEu+bFeGisYqCSiMsrfrg2aLtIZ9Y6srfQbZL5WwLJ/hl+Z3ZJ3wD/91RMLVc9ol
	oiCxp0IQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w2WgL-000GUf-0R;
	Tue, 17 Mar 2026 16:50:09 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w2WgK-0007xR-1x;
	Tue, 17 Mar 2026 16:50:08 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
Subject:
 Re: [PATCH 3/3] arm64: dts: freescale: imx93-tqma9352-mba93xxla-mini: Add
 WLAN/BT overlay
Date: Tue, 17 Mar 2026 16:50:07 +0100
Message-ID: <5087680.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <79135f84-68cd-4b82-b7d7-4dec364933fc@oss.nxp.com>
References:
 <20260317111704.1075938-1-alexander.stein@ew.tq-group.com>
 <20260317111704.1075938-4-alexander.stein@ew.tq-group.com>
 <79135f84-68cd-4b82-b7d7-4dec364933fc@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27943/Tue Mar 17 07:24:09 2026)

Am Dienstag, 17. M=E4rz 2026, 14:09:42 CET schrieb Daniel Baluta:
> On 3/17/26 13:17, Alexander Stein wrote:
> > From: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
> >
> > This overlay enables the LWB5+ M.2 wlan module from ezurio.
> >
> > Signed-off-by: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> I was expecting this patch to be in line with this comment:
>=20
> /*
>  * Display is not fixed, so compatible has to be added from
>  * DT overlay
>  */

Well, the DT overlay from this patch is only about the WiFi and
Bluetooth module. Display overlay is a different one, yet to be
included as this depends on [1]. I need to respin this after
imx91/imx93 pdfc patch is included.

But if it is preferred to not include backlight/display until the
display overlay is available, I'm fine with that as well.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20250304154929.1785200-1-alexander.stein@ew=
=2Etq-group.com/
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


