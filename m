Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF3913BC3D
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 08:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723538410; cv=none; b=bp4FGJeiOVoDKpLXEIZ/W9g0LWdrbf4DHbmgsMsjZLmwVkrDjOVfA128hHa2XTax8ZyqneldBkWi+dbWSKziChH/JH1ju9CwF3DGbHe1hZpmGkgUN9igo2mMEKOV2lN1JkC+5PcmmCwaAA7SOZLY6uWg9fhC+/p84D3TakXB1R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723538410; c=relaxed/simple;
	bh=inEEz4filmbo8qqOPd4E0V8HGmq9VX2EYngrDIfWBXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KCNGFKhpvfuEArdR/jRcFGZkZtNQe3gWUZA5hhhKu1DMo4jnDNS+sYYkESc3mzPnJUU9Q3qr6u9M8i7DG7+S29qeXbzMWIwK76QIoI+WKmLaxNGoPvJC0X6JS6pJbVfB0pB/JX8xAUzISzX08lR1TNhsXoQB9d2YkH/5AuR6/pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=ZvmQyGv9; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=tPnoRsbz reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="ZvmQyGv9";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="tPnoRsbz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723538408; x=1755074408;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lWEnrYT/2zokPYs6W1DQexseb+uW1P/nNlbcer9G350=;
  b=ZvmQyGv9GVlkAut1f56TWGX8+FZ7g+bow6Eelq7CejYpKeGDY5tXD8vA
   rW22sKGIAnpcu7MR+D63MvLShg4PaMusPKKd6qlyQoCjDOvxm0aPJXPBF
   niAxXcF63lxumKaeQxPeG/VT1n4LTcHakJVa+1tBYNYRsSVUu24990Myg
   zM511HjZG3X5bkgWpChz7WE7xKpQfbcGskP213/8JXNMMKQAO2VVfMzNo
   3BMLBrDqwKe5yWLqkClo8mc3qdoBcnH6jZipqtj2jACQ7ZnsQ3kHxOhW+
   OV7DDtS5dqOpdMVGULKtKhFCbbcEO7ROc2oaCgmFnqry8e43EHFoj1plS
   w==;
X-CSE-ConnectionGUID: 9CA1SSZ6Ri6prkb6IjLvEw==
X-CSE-MsgGUID: gI2OKmTiSMmFMuUPLWmyGg==
X-IronPort-AV: E=Sophos;i="6.09,285,1716242400"; 
   d="scan'208";a="38379221"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 13 Aug 2024 10:40:06 +0200
X-CheckPoint: {66BB1BE6-19-751552D8-F91D2344}
X-MAIL-CPID: 11420822777CC4675A7EDCCC6C392185_4
X-Control-Analysis: str=0001.0A782F29.66BB1BE6.0182,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ABA6E164B7F;
	Tue, 13 Aug 2024 10:40:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723538402;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lWEnrYT/2zokPYs6W1DQexseb+uW1P/nNlbcer9G350=;
	b=tPnoRsbz1yjwAD8SQ6xexda0bhZqZOyO7HzvwHPzYNJNbXFVE3tmzkgLT9/azVosf6xKnl
	Gle8tCXj9oi8HH59z6HUX1/DjU2CnUH/I/Yw4pV4XnO4pa0OmKXSerVrTAfv9UPxxwez1R
	Y3QLkdEgdNAOqc4Px0Eye/o9gn0UnpDo58lTz1ofZnB3sW5t7bKi2sf+tWMoKmoNeJUuLY
	Dx1zq7CVa5oB3Vwh6LXluky9woKWkY8HgUS2TB162nSdWg5NwI78cKWCc7PkWccCv4AAq8
	2s+w5SJaOsC14DRKuWUQK6DBVctqokXitbg4469gpZ909Z6IJHG7TOg3ze2Ovw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Gregor Herburger <gregor.herburger@ew.tq-group.com>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux@ew.tq-group.com, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 15/17] arm64: dts: imx93-tqma9352-mba93xxla: rename hub to usb
Date: Tue, 13 Aug 2024 10:40:04 +0200
Message-ID: <1802961.VLH7GnMWUR@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240813-imx_warning-v1-15-3494426aea09@nxp.com>
References: <20240813-imx_warning-v1-0-3494426aea09@nxp.com> <20240813-imx_warning-v1-15-3494426aea09@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Dienstag, 13. August 2024, 06:35:10 CEST schrieb Frank Li:
> Rename hub to usb to fix below warning:
> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: hub@1: $noden=
ame:0: 'hub@1' does not match '^usb(@.*)?'
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Thanks.

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts | 2 +-
>  arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts b=
/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
> index 852dd3d2eac74..325d8097bf7fc 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
> @@ -533,7 +533,7 @@ &usbotg2 {
>  	samsung,picophy-dc-vol-level-adjust =3D <7>;
>  	status =3D "okay";
> =20
> -	hub_2_0: hub@1 {
> +	hub_2_0: usb@1 {
>  		compatible =3D "usb424,2517";
>  		reg =3D <1>;
>  		reset-gpios =3D <&expander1 2 GPIO_ACTIVE_LOW>;
> diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts b=
/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
> index da8f19a646a98..b1fcbc12bd882 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
> @@ -486,7 +486,7 @@ &usbotg2 {
>  	samsung,picophy-dc-vol-level-adjust =3D <7>;
>  	status =3D "okay";
> =20
> -	hub_2_0: hub@1 {
> +	hub_2_0: usb@1 {
>  		compatible =3D "usb424,2517";
>  		reg =3D <1>;
>  		reset-gpios =3D <&expander1 2 GPIO_ACTIVE_LOW>;
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


