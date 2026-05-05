Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB3848A2AC
	for <imx@lists.linux.dev>; Tue,  5 May 2026 15:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995995; cv=none; b=qY7Pg9LcfgLKve2oZ8Kq2qmr6V0qdOHvNzXhDfxDh8h4KRan7szvFN9C9SesyJal5jHXh6J4abGyTq0kT1E0o+9tT/CSWlYmZrXDTmgv8u9O11asCQUhJIpCxTDqK73eHVx4HSvUuG7M9mNQ/TrC4376R/Xfr0TQOgZuDF05fDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995995; c=relaxed/simple;
	bh=rPgtOYp44AMEE4w8jb+sAMH6oh60u9dHF+uoLjTnEHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WAM45WWFdGF2qXsTkN6LT2yPJH4LWLLfY3JrfCgkVr/UrR8Ta6VcEwMxWduhjjNMd2TJ+DF4r1hySJ7EhCxjOCYujmeSeCl3xnFJCAQ7PG0OC+JNvth+Om5kkXQ9Ry43wbex7+Hn1sTgPKxNoRWZnBaNf/fdF/NVxXI8qcqTts8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1wKHyA-0002ON-5T; Tue, 05 May 2026 17:45:58 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1wKHy7-000bK5-3A;
	Tue, 05 May 2026 17:45:56 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1wKHy8-00000001KYi-17yu;
	Tue, 05 May 2026 17:45:56 +0200
Date: Tue, 5 May 2026 17:45:56 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, laurentiu.palcu@oss.nxp.com, 
	victor.liu@nxp.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] Revert "dt-bindings: display: bridge: ldb: Fill in
 reg property"
Message-ID: <2bl2mwpk57xgkuye2gydliymjkzikiovnb7ovnb73olwtfkjwn@byn3732grvnh>
References: <20260504-v7-1-topic-ldb-fixes-v1-0-0125d937ff7f@pengutronix.de>
 <20260504-v7-1-topic-ldb-fixes-v1-2-0125d937ff7f@pengutronix.de>
 <20260505141538.GA2547282-robh@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505141538.GA2547282-robh@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 26-05-05, Rob Herring wrote:
> On Mon, May 04, 2026 at 10:21:42PM +0200, Marco Felsch wrote:
> > This reverts commit 16c8d76abe83d75b578d72ee22d25a52c764e14a.
> > 
> > Remove the 'reg' and 'reg-names' property from the LDB.
> > 
> > The LDB is either part of the IOMUX_GPR (i.MX6SX) or the BLKCTRL
> > (i.MX8MP, i.MX93) register space. Both IOMUX_GPR and BLKCTRL are
> > register ranges with loose register definitions. E.g.
> > 
> >   - On the i.MX8MP there is one register which controls the AXI
> >     threshold for two different IPs (BIT(31:16) - IP1, BIT(15:0) - IP2).
> >   - On the i.MX6SX IOMUXC_GPR5 controlls: CSI2 mux, WDOG3 settings, PXP
> >     handshake, ...
> > 
> > In conclusion: it can't be ensured that one register belongs to one
> > dedicated IP and the LDB is rather an exception than the rule.
> 
> It is fine if there's a child node for LDB if the LDB registers are 
> consistent, but the other misc things are represented by the parent 
> node. It is certainly not a requirement that either everything be in 
> child nodes or nothing be in child nodes.
> 
> What I don't see in this series is what problem does this fix? If you 
> are going to break compatibility, then there had better be a good 
> reason.

Hi Rob,

with the upcoming i.MX9x SoCs the parent syscon (BLKCTRL) controlls
multiple other IPs, e.g. a DPI mux added by commit 3feaa4342637
("dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC subnode to schema and
example").

During the discussion of the above commit we agreed that the sub-devices
of the syscon shall not use the reg property due to the fact that one
register serves multiple purposes. In the above case the same register
controlling the dpi-mux also controlls MIPI-DSI bits. The MIPI-DSI bits
can be abstracted as drm-bridge as well. Two sub-devs using the same
'reg' property below the same parent seems odd and I don't know if this
allowed either.

Now the LDB is also part of this BLKCTRL syscon device but requires the
reg property. TBH, I don't know why the reg property was added in the
first place, due to the above fact (multiple sub-devs - same register).

Of course, we could limit the breakage to i.MX9* SoCs only which is done
by:
 - https://lore.kernel.org/all/20260329-fsl_ldb_schema_fix-v1-1-351372754bc0@nxp.com/

but I don't think that this would be nice from user and from maintainer
perspective, because:
 1) The same LDB "IP" would have a different dt-binding
    (user perspective)
 2) It introduces another dimension drivers need to care about
    (maintainer perspective)

Therefore I went this way to drop it all together to make it easier for
the user and the maintainers.

Regards,
  Marco



> 
> Rob
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
