Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCD2366816
	for <imx@lists.linux.dev>; Wed, 22 Jul 2026 10:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717970; cv=none; b=U+8WSYYrc3Zqe1hSkOkOKNHkXphkKDabXrVNNuPmh6oyNkMrRUvbIWWv7s84MQNuiyt1hdNdfT1bCeXSOwUU+9fVYjaaYV66Wm2fFh1UQknTAZOZgnA1GbPPoL99RwNzjdmiYklSIZhvuOFjMRdUQNlMRsectljrsIKRM1skCSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717970; c=relaxed/simple;
	bh=V9bVEocqPIA08OGfdELeuVnuyE/Cai86e/nWbNSdFwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=roetXJUXHc1SR0SUrjXlsbOrsd2znkRqfGyHM+WlBr/KKWCdzgZGTR/Wf02/hxp4ZcpfY2HdzleNWb4OHs7OLGqNTxIDAk+ik3QJjfQ5zs8Xx7bR0LgadeU2f28dgimq6E8GxabGvkf6x7/9nljuoInVzORrCSvNDMZSG2107D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=hffUt9Vs; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="hffUt9Vs"
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 93F491FDE6;
	Wed, 22 Jul 2026 12:59:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784717959;
	bh=g6bjjE8MyCav7ckmLTNb9JRa4naTxSPm+UshKCPlRm4=; h=From:To:Subject;
	b=hffUt9VsGA0OSrvL+rdaUUo0MdY+KrxYAgPaZPMMNYTtwSWC4ZD4+UcWZLf68hUwA
	 zk684/lV9MCkbCc2vj2yF9D07AFXvpaBNHNfvHf4dWmBDwG1HyeHR8YVVB2fBYQ5qg
	 F/J76FsaJ7LTkAdf4kj9FJZ85czCdJRUacuJ6JP+u68Q8JOw8DTEkJJOMRKF/+Mx3j
	 iH3jdFGY4SEjjfQMxE7sCrr3hY3l6XzZ9jjoB2SjTUqLy4jZxsn8dPPHoZ0Xdnut5a
	 bvcnn1p/7RfBQKCdMpieu6COQeeDuU138P9qFDuGmyyEfh9SNo7UiA5O3MJeknefD9
	 SNqr+auMsPQmw==
Date: Wed, 22 Jul 2026 12:59:14 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
	Frank Li <Frank.li@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 6/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 OV5640 CSI Cameras
Message-ID: <20260722105914.GA72270@francesco-nb>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
 <20260713-v1-verdin-imx8mm-dtbos-v1-6-4acd63db4504@toradex.com>
 <al5mDqeFE8QVbUd9@lizhi-Precision-Tower-5810>
 <3ak4ffamwvdrtgw3bivzvrbtkmyh7g3lvuk4xwvdiuzizi3iu3@uxqvyif7rvpx>
 <178471622928.2174993.5439033710284861967@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178471622928.2174993.5439033710284861967@ping.linuxembedded.co.uk>

Hello Kieran,

On Wed, Jul 22, 2026 at 11:30:29AM +0100, Kieran Bingham wrote:
> Quoting Ernest Van Hoecke (2026-07-22 10:27:32)
> > On Mon, Jul 20, 2026 at 02:16:46PM -0400, Frank Li wrote:
> > > On Mon, Jul 13, 2026 at 05:06:27PM +0200, Ernest Van Hoecke wrote:
> > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > >
> > > > Add device tree overlays for the Toradex OV5640 CSI Camera on Verdin CSI_1.
> > > >
> > > > The default overlay describes the current CSI Camera Set 5MP OV5640 with a
> > > > 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the legacy
> > > > camera module.
> > > >
> > > > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > > > Link: https://www.toradex.com/accessories/csi-camera-ov5640
> > > > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/Makefile             |  6 ++
> > > >  .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  | 17 +++++
> > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   | 78 ++++++++++++++++++++++
> > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   | 18 +++++
> > > >  4 files changed, 119 insertions(+)
...
> I think with the Toradex ecosystem there would be some value in
> supporting or helping with the ongoing dt-connectors or dt-addons topics
> so that we can abstract the hardware which is being 'added'.
> 
> I think it's important that we tackle the problem of combinatorial
> explosions of overlays when we can add a component to multiple
> platforms.
> 
> For example, your OV5640 camera could be added to many different boards
> - and each board could have many different cameras - in different ports.
> 
> We should not be copy/pasting overlays for each combination, or we'll
> have 'thousands' of identical overlays.

I see your point, and I agree that it would be valuable to move this
topic forward. I will raise it internally at Toradex and see how we can
contribute.

At the same time, quoting Marex (https://lore.kernel.org/all/dec2a7f6-80fd-4692-8936-969f8837a555@nabladev.com/):

 | DT connectors have been discussed for the last 10 or so years and three 
 | is still no real progress.
 | 
 | I would be happy to send a follow up patchset which would convert the 
 | DTOs to whatever connector implementation format lands in the future, 
 | but I am concerned that waiting for DT connectors will block this 
 | patchset from landing for a long time.


Francesco

