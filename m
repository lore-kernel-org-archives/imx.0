Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311318;
	b=Y4/SCl9jbkUl6+Mj+hcst50Jb7DgQNa9h0yUrWslUTpE5vIenpfG7nmQ1rFqRlj4fLgm
	 OODbx8VinHF4aZStTcSY49G2zIUxILDTegR8Wv4/0DzVL65fp1BeV7WmDmSUdx7jihHLk
	 qUbljJOVOaAhLOZvY9ExbWhnA2W/dNwy7clwxwJyHk6MCAhGDw8uRyoMq3rAZ2E1mYJ2W
	 ZVZgsVAuR8VkcEbLORGKQhu2yq9vsOiw+nzMlUqQHVqzkoXSVPSKfDOB2Rt4BBNMcDBDM
	 lF2jyaSsk7O6G89+NPNUh7UguAn6W5j0bo1a5kuQn6ebUU6qk6wtnP14NbHqS5LmDAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311318;
	h=DMARC-Filter:Received:DKIM-Signature:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:In-Reply-To:References:Subject:From:Cc:To:
	 Date:Message-ID:User-Agent;
	bh=tSZhKAIK1EHxD3XnyhYBftCRX2avMBVk9Fjkswdk57s=;
	b=u4ksDcAtdTtudTKk8XMcSi3nPGvgUVBZR87AMjZ1kNIsHXmAcBJCSDMQx+3bkYsqN8do
	 2Ds67HApYFUjaAE2r47dBdiufxLh80wUs/mauJhQFsK6Z8r1u281DAj1CIX0bdlCER9oV
	 mE9VAV2R1WgDjLKXioSoYxCzAzqo6eQx392axrt3TvwnJFjLpLzXyurAekjPWoFlYDnDK
	 lGO4nK1IrGtPd2zd6xT/rwb7KqrdkUILbsrfhooqfWAaw+9LVVHtbwTosZsbo64ied5VJ
	 1w3FZnkkfKOtuELZWn/Gutslj1hAXpt8Y1BmOGL6GTcD1aWh7ig711TxlWzd3QXUARg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=qqtOx6p6;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4B3606A325
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 11:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC4B3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=qqtOx6p6
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D05D33D;
	Tue, 10 Nov 2026 12:46:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794311173;
	bh=tSZhKAIK1EHxD3XnyhYBftCRX2avMBVk9Fjkswdk57s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qqtOx6p60ZFA7kfVRbtUBadyGZVACGSAhtNYhMG70e/xaOTbs1fvT3czoHy4nzOub
	 rswa3AR9CdilC95o8FcHOvcnZBq7V55yydP3MsPFIO3VbbjkJcHCuIkgcQ2EJwbr+R
	 rga9Ct3Bo23RZBe8A6a2U96VtderXVHXSRuYobC0=
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261110093954.GA129290@francesco-nb>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com> <20261110093954.GA129290@francesco-nb>
Subject: Re: [PATCH v3 0/4] arm64: dts: freescale: Add Verdin iMX8M OV5640 camera overlays
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>, Francesco Dolcini <francesco@dolcini.it>
Date: Tue, 10 Nov 2026 11:48:33 +0000
Message-ID: <179431131331.194410.16578072822295578866@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Francesco Dolcini (2026-11-10 09:39:54)
> Hello all,
>=20
> On Thu, Oct 22, 2026 at 04:31:24PM +0200, Ernest Van Hoecke wrote:
> > Following feedback on the Verdin iMX8M Mini series, introduce a binding
> > for the connector's sideband GPIO nexus. Add connector mappings to the
> > carrier descriptions and stable labels for the SoM-specific CSI media
> > nodes. This allows one pair of OV5640 overlays to be shared by both SoMs
> > and all three carrier boards.
> >=20
> > The binding intentionally covers only the connector's GPIO signals.
> > MIPI CSI-2 endpoints, I2C, clocks and supplies continue to use their
> > existing bindings and are connected through stable labels in the Verdin
> > device trees.
>=20
> We have now an official page documenting this connector
>=20
> Link: https://developer.toradex.com/hardware/hardware-resources/periphera=
ls/toradex-camera-connector/
>=20
> Ernest: if there is a new patch series, I would mention it.
> Kieran: the danger note in the page is for you ;-)

Awesome. Lets hope the fire stays as imagery :D

I did get my 'camera dt-addon' compiling with Herve's DTC updates, but
there's still (probably quite a bit) more work to do yet before we could
have generic camera addons for connectors.

Looks promising though!

--
Kieran


>=20
> Francesco
>
