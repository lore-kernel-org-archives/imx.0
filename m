Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B34E22F773
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 10:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745403714; cv=none; b=lKRsNXL+RisWjFa+QS3/DGTthx4ObhBlPmO1ohEGs1V3SjRzNwV+n7lIX/NjcFUFAc3GM2oRERmFTgxmZIDJDOH8dnfzY6QTddnpXXdOWh1Q31+WOqF83+RtwBHL7sqxzWNqqbdvBx+5UGIuc8bb37G39ECNMPEx5wfFCk5U6rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745403714; c=relaxed/simple;
	bh=EzJ4TVYM7nZiaOGpLXPH1VDEv7n0lyNcyhQoLP0U2hM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGKSUAGWxJQys1lXY/LLfTQQdfqlsemIQiyfTFeQGYpDCN5iEeUFwrZTKDsNDY3pIrB/c6MIgWNYb5F7pGaG10SXvSl2nPI0L3BM/YbziO5Jch0SJQmi1JHuKNyixKLGKUF4DxP21fk0yRx0AC+y07AnuGlL9fFZPOAc8NIzk3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=bs9vJAu8; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="bs9vJAu8"
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 39DB71F971;
	Wed, 23 Apr 2025 12:21:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745403709;
	bh=UpUgGYYSAAKZGIFCG/nSCZXQYMN9IB2AgKsoywhruMI=;
	h=Received:From:To:Subject;
	b=bs9vJAu8mvqc64WiUDtIkUvfcUb4obpM/9YuSrhL8j7Vf7lxVPdfW71e+syvIXd1a
	 Z5lEEGZEWw1DTQnmiQFEiVdPLzJiUThmOm5/z3mgV298aExt2W5sPjXWagKqSnLEqY
	 KX/SLQeGzGMWzNkNp/QyLeYq+CIxgSxMSV7me4oj8/4qud415eWABSKV+rzFXm6YpU
	 zVPFjVu4lOM2/b3UrIH/MPyyPog7ySt+d9Ob5Us1hr2WRQ8R/MgEYBur+xIBooNxWj
	 g3ZYkcSG/fIurgTtS8TcwVQuSv2gSfthjHosrHA+uBiVcsl3gXBo94k+8HZgcg5gm7
	 aXSusdN1PxU+A==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id E57297F820; Wed, 23 Apr 2025 12:21:48 +0200 (CEST)
Date: Wed, 23 Apr 2025 12:21:48 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Philippe Schenker <philippe.schenker@impulsing.ch>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Wojciech Dubowik <Wojciech.Dubowik@mt.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v3] arm64: dts: imx8mm-verdin: Link reg_usdhc2_vqmmc to
 usdhc2
Message-ID: <aAi_PPaZRF26pv_d@gaggiata.pivistrello.it>
References: <20250422140200.819405-1-Wojciech.Dubowik@mt.com>
 <20250423095309.GA93156@francesco-nb>
 <222ce25ee0bb1545583ad7a04f621bac2617893c.camel@impulsing.ch>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <222ce25ee0bb1545583ad7a04f621bac2617893c.camel@impulsing.ch>

On Wed, Apr 23, 2025 at 10:16:43AM +0000, Philippe Schenker wrote:
> 
> 
> On Wed, 2025-04-23 at 11:53 +0200, Francesco Dolcini wrote:
> > On Tue, Apr 22, 2025 at 04:01:57PM +0200, Wojciech Dubowik wrote:
> > > Define vqmmc regulator-gpio for usdhc2 with vin-supply
> > > coming from LDO5.
> > > 
> > > Without this definition LDO5 will be powered down, disabling
> > > SD card after bootup. This has been introduced in commit
> > > f5aab0438ef1 ("regulator: pca9450: Fix enable register for LDO5").
> > > 
> > > Fixes: f5aab0438ef1 ("regulator: pca9450: Fix enable register for
> > > LDO5")
> > > 
> > no empty lines in between commit message tags, not sure if Shawn can
> > fix
> > this up or you need to send a v4.
> > 
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
> > 
> > Tested-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > I would backport this to also older kernel, so to me
> > 
> > Fixes: 6a57f224f734 ("arm64: dts: freescale: add initial support for
> > verdin imx8m mini")
> 
> NACK for the proposed Fixes, this introduces a new Kconfig which could
> have side-effects in users of current stable kernels.

The driver for "regulator-gpio" compatible? I do not agree with your argument,
sorry. 

The previous description was not correct. There was an unused
regulator in the DT that was not switched off just by chance.

Francesco


