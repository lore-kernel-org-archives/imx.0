Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374513E9580
	for <imx@lists.linux.dev>; Thu, 18 Jun 2026 10:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778306; cv=none; b=ZJno3vTW2nljCPZzsq56lj6fMzT0eG3Rkxu+QmkclhEJnjKu2/WB3Yl9weLuJ07HssKF0Hw3fUCnJH7H9VDzOeJNDf7mwi1u80WvaM8lvbjZBOubXRaBgjkffG7+YupFYTwKLLAiUH4PiRlOmkfe8rx7OG5F0peH1+rwl1U4QdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778306; c=relaxed/simple;
	bh=WwSMfiQMCeU4lUUB9fPK6vGImyG1aOQJtSY6EGHF59Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XsQj8dB8IB6fG6Qbrdr+8moVXhEYvfGRv1vfpI6t57U2eWIWao7gRp/h+qewYUjs6vIqSBQeoqvz/SLOF1oRB6/trQOZBIITVJwBbElWLZ/xf/VdUCVEdzgKsHVEisJoJJ/IXXwZJA8ekQMrIMNsDA+2/96iHAH4MvEoI7HHpWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 18529200275;
	Thu, 18 Jun 2026 12:24:58 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa9vd-003QBv-3C;
	Thu, 18 Jun 2026 12:24:58 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa9vd-000000006dq-3gVl;
	Thu, 18 Jun 2026 12:24:57 +0200
Message-ID: <922d581718c90c9ca603a35ece7c44da7c425e0a.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/1] reset: imx7: Correct polarity of MIPI CSI resets
 on i.MX8MQ
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Robby Cai <robby.cai@nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com, 
	krzk+dt@kernel.org, andrew.smirnov@gmail.com, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, aisheng.dong@nxp.com, guoniu.zhou@nxp.com
Date: Thu, 18 Jun 2026 12:24:57 +0200
In-Reply-To: <20260417092809.GA582835@shlinux88>
References: <20260417080851.489303-1-robby.cai@nxp.com>
	 <2605c4332e8a3e8950b0b15fc5377423cfed4a1f.camel@pengutronix.de>
	 <20260417092809.GA582835@shlinux88>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fr, 2026-04-17 at 17:28 +0800, Robby Cai wrote:
> On Fri, Apr 17, 2026 at 10:47:48AM +0200, Philipp Zabel wrote:
> > On Fr, 2026-04-17 at 16:08 +0800, Robby Cai wrote:
> > > On i.MX8MQ, the MIPI CSI reset lines are active-low and not self-clea=
ring.
> > > Writing '0' asserts reset and it remains asserted until explicitly
> > > deasserted by software.
> > >=20
> > > This driver previously treated the MIPI CSI reset signals as active-h=
igh,
> > > which led to incorrect reset assert/deassert sequencing. This issue w=
as
> > > exposed by commit 6d79bb8fd2aa ("media: imx8mq-mipi-csi2: Explicitly
> > > release reset").
> >=20
> > If this patch is backported without 6d79bb8fd2aa, or the other way
> > around, will that break MIPI CSI-2 on older kernels? That would warrant
> > a Cc: stable tag.
> >=20
>=20
> Yes, will break.
> These two patches should be backported as a pair to ensure correct behavi=
or.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Can you please resend with

Cc: <stable@vger.kernel.org> # 6d79bb8fd2aa: media: imx8mq-mipi-csi2: Expli=
citly release reset

regards
Philipp
