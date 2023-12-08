Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F441B27B
	for <imx@lists.linux.dev>; Fri,  8 Dec 2023 11:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rBZLw-0005Wy-0d; Fri, 08 Dec 2023 12:49:08 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rBZLt-00EPDB-Se; Fri, 08 Dec 2023 12:49:05 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rBZLt-0006SD-2c;
	Fri, 08 Dec 2023 12:49:05 +0100
Message-ID: <95ef7a9fa76bf3d6fd17c9fbf00d7d561883765c.camel@pengutronix.de>
Subject: Re: [PATCH 3/9] PCI: imx6: Simplify reset handling by using by
 using *_FLAG_HAS_*_RESET
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: imx@lists.linux.dev, Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach
 <l.stach@pengutronix.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring
 <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,  Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,  Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 "open list:PCI DRIVER FOR IMX6" <linux-pci@vger.kernel.org>, "moderated
 list:PCI DRIVER FOR IMX6" <linux-arm-kernel@lists.infradead.org>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Date: Fri, 08 Dec 2023 12:49:05 +0100
In-Reply-To: <ZXH8guDh+pLbg0Tn@lizhi-Precision-Tower-5810>
References: <20231206155903.566194-1-Frank.Li@nxp.com>
	 <20231206155903.566194-4-Frank.Li@nxp.com>
	 <e314466b31dd8e88212ae5d7ac2fecf26b851829.camel@pengutronix.de>
	 <ZXH8guDh+pLbg0Tn@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On Do, 2023-12-07 at 12:10 -0500, Frank Li wrote:
> On Wed, Dec 06, 2023 at 05:52:23PM +0100, Philipp Zabel wrote:
[...]
> > I wonder whether we should just defer the check whether apps/pciephy
> > resets should be used to the device tree validation, and make this an
> > unconditional call to get an optional reset control:
> >=20
> > 	imx6_pcie->apps_reset =3D devm_reset_control_get_optional_exclusive(de=
v, "apps");
>=20
> I think double check here is neccesary. No sure if dts file version
> binding yaml was exactly matched driver. Sometime user use old version dt=
s.=20
> Double check here will help identify the dts problem.=20

Makes sense to me,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
