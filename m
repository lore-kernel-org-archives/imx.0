Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490542620E4
	for <imx@lists.linux.dev>; Thu, 13 Mar 2025 08:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741855191; cv=none; b=VpNAABasaPSZHMOtdbOVgBzcfjcBKyYqLYxb85BwyZgAJLZwiWumCjZoqkAMNZ9QkK9jXr44fM1MFh7QoCAQqqaA6ZZcxIoI49yZeiX3FJDS0mSiEEwbHMmo8TyU5vL3btaegd+lTE9a26fT2UVTqGKYNVcd+Z0WDIKkBvBBAZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741855191; c=relaxed/simple;
	bh=Cf6rsk3OuercVA9uw+yCpjusH9Si5XFM6JJkapDMcXE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ji7CcTErEMM/pEr4A9Z0KwviPuOqpj6iba14tcz6cYKC+nL9DwxSPmZQGxheXCHYVDauma2tXAoROJo3BpZH62+NJXPuPVf+9mZsnhD7DGfK8iWo2XvTCheXpNe8JrIlCglf/Muqj+DXCO/kObHvHBHqm16qWCQRGoOdxJF77P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tse6J-00085z-03; Thu, 13 Mar 2025 09:39:35 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tse6H-005VQC-0X;
	Thu, 13 Mar 2025 09:39:33 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tse6H-0003PA-0M;
	Thu, 13 Mar 2025 09:39:33 +0100
Message-ID: <5849017e43db7ece72463f5c84854386aa7d8e9d.camel@pengutronix.de>
Subject: Re: [PATCH v3 02/12] reset: imx: Add SCU reset driver for i.MX8QXP
 and i.MX8QM
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dong
 Aisheng <aisheng.dong@nxp.com>,  Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rui Miguel Silva <rmfrfs@gmail.com>, Martin
 Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Date: Thu, 13 Mar 2025 09:39:33 +0100
In-Reply-To: <20250210-8qxp_camera-v3-2-324f5105accc@nxp.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
	 <20250210-8qxp_camera-v3-2-324f5105accc@nxp.com>
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

On Mo, 2025-02-10 at 15:59 -0500, Frank Li wrote:
> Add System Controller Firmware(SCU) reset driver for i.MX8QM and i.MX8QXP=
.
> SCU Manage resets for peripherals such as MIPI CSI. Currently, support tw=
o
> reset sources: IMX_SC_R_CSI_0 and IMX_SC_R_CSI_1.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied to reset/next, thanks!

[01/12] dt-bindings: firmware: imx: add property reset-controller
        https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D778752759bd0
[02/12] reset: imx: Add SCU reset driver for i.MX8QXP and i.MX8QM
        https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D6b64fde5c183

regards
Philipp
