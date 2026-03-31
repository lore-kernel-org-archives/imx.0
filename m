Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E0D3E3C55
	for <imx@lists.linux.dev>; Tue, 31 Mar 2026 12:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774961119; cv=none; b=g2+GHowpPirsVj9oyi1xe1JH07FrpMqJdp6NmppytyxJ4+ZrwjfzXuYyjfAX75sLSqu0k06DOuAhE996/WHNcpGXXby3iXmbvLJ57QNjRt/NWL1o6tzlPQ3AE1YVlisKgRex+TrgxB9eEFB4tMrojWA+hEL4ocwjlT625biJMAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774961119; c=relaxed/simple;
	bh=o8FVivU4Xqh6mQiTq1kCcqbBD36cUXHehs/6f1QTY1E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fDuQTdKYb+s/JuZzKONt8pE4yCtF+4Ag+Uj+XoBGOSwYLIubsDK5tYFwsfSJGPDr8ucCFMxWUxVunTOWIhBL0/2VLZFMALzndH+yH0+np7V5O+LurlQPCrx8yV1lXrxVCLGUxS3LWRjf+Y+O9m4B92LvdmR7dsC/hV3BA52iDnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w7YSy-0004rB-3T; Tue, 31 Mar 2026 14:45:08 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w7YSx-0032jD-16;
	Tue, 31 Mar 2026 14:45:07 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w7YSx-00000000Ab8-13OI;
	Tue, 31 Mar 2026 14:45:07 +0200
Message-ID: <d6cdea5f1a4f2eb3f7b73e6136c77020f444d8f0.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] dt-bindings: reset: imx8mq: Add _N suffix to
 IMX8MQ_RESET_MIPI_CSI*_RESET
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Robby Cai <robby.cai@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 festevam@gmail.com
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	aisheng.dong@nxp.com
Date: Tue, 31 Mar 2026 14:45:07 +0200
In-Reply-To: <20260331101331.1405588-2-robby.cai@nxp.com>
References: <20260331101331.1405588-1-robby.cai@nxp.com>
	 <20260331101331.1405588-2-robby.cai@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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

On Di, 2026-03-31 at 18:13 +0800, Robby Cai wrote:
> The assert logic of the MIPI CSI reset signals is active-low on i.MX8MQ,
> but the existing names do not indicate this explicitly. To improve
> consistency and clarity, append the _N suffix to all
> IMX8MQ_RESET_MIPI_CSI*_RESET definitions. The deprecated
> IMX8MQ_RESET_MIPI_CSI*_RESET versions remain temporarily for DT ABI
> compatibility and will be removed at an appropriate time in the future.

The register description in the latest reference manual I can download,
IMX8MDQLQRM Rev. 3.1 (06/2021), still call these bits
MIPI_CSI1_CORE_RESET and so on (without _N). There is no mention of
polarity in the bitfield description. Is a documentation update
planned?

Right now I'd say this improves clarity, but reduces consistency with
existing documentation.

Are these bits self-clearing, or can the reset be asserted by writing
0? As it stands, the CSI driver using these resets, imx8mq-mipi-csi2.c,
only calls reset_control_assert() in imx8mq_mipi_csi_sw_reset():

          /*                                                         =20
           * these are most likely self-clearing reset bits. to make it
           * more clear, the reset-imx7 driver should implement the  =20
           * .reset() operation.                                     =20
           */                    =20
          ret =3D reset_control_assert(state->rst);

This will probably have to be turned into a deassert together with the
reset driver change.

regards
Philipp
