Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CB8361666
	for <imx@lists.linux.dev>; Fri, 17 Apr 2026 08:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776415680; cv=none; b=s7J3TjjSf5RK9IUmPI0RDo3ovQty/ZBqV/sP2KVcls25CLpZXjZWdbpGe60X6OikhqSrmHRhaE7HZdcl4pIptkSc3i25h9vJK5Pc+BhY8Auiq7j7oCLFP1EJglxz8hILIKZMp/Ks6SX/WbK4NC5cSD1pE26zNkUF8MHKjRikSlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776415680; c=relaxed/simple;
	bh=vKGT8+oI5jlDL3ravEcBTgJNErtqCMhd0V3+TKrCmZc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bHH51xx5D+lhWlpY8UIHFKIHMIuv6GywCoW0bSa9a/ThYrf+OKtOZZy2w57hP4NA7Ia64scE94H6QWStlEcMVgzf9hiuXc5sIwWKyr8c2PU0MPntkHdKYWNn28bLYBi1FpyapI1fFlDqFkFVqEg1KJj2WpAp5pN+NwnbHQTJamk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wDerd-000563-6L; Fri, 17 Apr 2026 10:47:49 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wDerc-005osV-2o;
	Fri, 17 Apr 2026 10:47:48 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wDerc-0000000047U-3JDd;
	Fri, 17 Apr 2026 10:47:48 +0200
Message-ID: <2605c4332e8a3e8950b0b15fc5377423cfed4a1f.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/1] reset: imx7: Correct polarity of MIPI CSI resets
 on i.MX8MQ
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Robby Cai <robby.cai@nxp.com>, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 	festevam@gmail.com
Cc: krzk+dt@kernel.org, andrew.smirnov@gmail.com, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, aisheng.dong@nxp.com, guoniu.zhou@nxp.com
Date: Fri, 17 Apr 2026 10:47:48 +0200
In-Reply-To: <20260417080851.489303-1-robby.cai@nxp.com>
References: <20260417080851.489303-1-robby.cai@nxp.com>
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

On Fr, 2026-04-17 at 16:08 +0800, Robby Cai wrote:
> On i.MX8MQ, the MIPI CSI reset lines are active-low and not self-clearing=
.
> Writing '0' asserts reset and it remains asserted until explicitly
> deasserted by software.
>=20
> This driver previously treated the MIPI CSI reset signals as active-high,
> which led to incorrect reset assert/deassert sequencing. This issue was
> exposed by commit 6d79bb8fd2aa ("media: imx8mq-mipi-csi2: Explicitly
> release reset").

If this patch is backported without 6d79bb8fd2aa, or the other way
around, will that break MIPI CSI-2 on older kernels? That would warrant
a Cc: stable tag.


Otherwise,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
