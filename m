Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B0E33F5B3
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 15:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783007627; cv=none; b=g8VdV+JHn4/Bwf2mGxEGpdwF6Z9ERjhr+OL5GsEyd678i84AAV3ryqXnmpknGMajN6hy/VzeMdsEmugWZ7PE9XtQ2qowRvwXwB+eUXFAH2mg76Tl2YgkwY5angYvwKo8hK3piLxDl9l8KY/SQS4pgeI2vJCoQYGHf+KhF+cjPnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783007627; c=relaxed/simple;
	bh=YqqW/cPnYArpEDfel1ZuOY5yT2suBWd/apbOMVJBscU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DL/Z9eDtlCHdAGdIL3iY0rD/vmvoQl9rQywzadj3IAuw0QH2ArU53f1UfkC3vZ3Le86H2ngfxmTxz7wkrQ6DlYXbZOYp4rzT4cyyBh1Z6ovgrnEGU3/WF4I5OugoL7U55BN5BWokbc2ARpDAbmgz7kky+zQ0xR7FG9/u+FIC8OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 22CDE202631;
	Thu, 02 Jul 2026 17:53:44 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wfJjU-005lgD-0C;
	Thu, 02 Jul 2026 17:53:44 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wfJjT-00000000Feq-44uq;
	Thu, 02 Jul 2026 17:53:43 +0200
Message-ID: <4fa5149db18bfac88780382cf8d2d6ee18470c71.camel@pengutronix.de>
Subject: Re: [PATCH v3 1/1] reset: imx7: Correct polarity of MIPI CSI resets
 on i.MX8MQ
From: Philipp Zabel <p.zabel@pengutronix.de>
To: robby.cai@oss.nxp.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	festevam@gmail.com
Cc: krzk+dt@kernel.org, andrew.smirnov@gmail.com, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, aisheng.dong@nxp.com, guoniu.zhou@nxp.com
Date: Thu, 02 Jul 2026 17:53:43 +0200
In-Reply-To: <20260619073115.3778313-1-robby.cai@oss.nxp.com>
References: <20260619073115.3778313-1-robby.cai@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fr, 2026-06-19 at 15:31 +0800, robby.cai@oss.nxp.com wrote:
> From: Robby Cai <robby.cai@nxp.com>
>=20
> On i.MX8MQ, the MIPI CSI reset lines are active-low and not self-clearing=
.
> Writing '0' asserts reset and it remains asserted until explicitly
> deasserted by software.
>=20
> This driver previously treated the MIPI CSI reset signals as active-high,
> which led to incorrect reset assert/deassert sequencing. This issue was
> exposed by commit 6d79bb8fd2aa ("media: imx8mq-mipi-csi2: Explicitly
> release reset").
>=20
> Fix this by reflecting the correct reset polarity and ensuring proper
> reset handling.
[...]

Applied to reset/fixes, thanks!

[1/1] reset: imx7: Correct polarity of MIPI CSI resets on i.MX8MQ
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3D71827776667f

regards
Philipp
