Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AA826980F
	for <imx@lists.linux.dev>; Wed, 22 Jul 2026 12:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722819; cv=none; b=msKFy2tEU8jTztTb96VGoCBC4TZ/wI4CJHNXHZ74d2ZVbq1/qIoaQE1CQHVdg+lBaJcWHUKPQrTitBGPnIBwmvoh/miqCkoZgqs6R8bCKzwRUoF2wdnwvh6xLwqyOb+a5vsnxZgk5JbYzJUJimLZrkD9EO5XFhGiNXWSIdhD6mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722819; c=relaxed/simple;
	bh=OR3C+MZQvvsJuOWJcFo5RnW0WVeS2gXhbaRmc10Nc0s=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=J+WbbmqLImuanHhw1CWGpWjaDiHXCSkqDNmYSwdm5wv+gK4czipx7wbMfYEMbOEhY+qKNmSoNIIqjY1ZJHMWlspRNEE+lN4oiizxiZxKFOjxSD8drEMJlodFStKJvl2KZJIk4ve1iwv0H3Jq6ELNJrHBax0oSbWDR7cjhDEhz9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QnLtmuoq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QnLtmuoq"
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 34698447;
	Wed, 22 Jul 2026 14:19:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784722756;
	bh=OR3C+MZQvvsJuOWJcFo5RnW0WVeS2gXhbaRmc10Nc0s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=QnLtmuoqSRVW2RE4pWzzl2zfoCHKnNf4wS5ejRLNBzCXqZc2+HvRhttqGshbHEhhr
	 Hy9uicCJ6lyKN8MNEDwvaHBny+Wp9iBWq8p/wR0eQhIRP24sKvS+JsouJayamGKz13
	 rZI71iNII6zxmDUM3NYsxmT1UHZQ7CRjPVFfHiH4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260722105914.GA72270@francesco-nb>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com> <20260713-v1-verdin-imx8mm-dtbos-v1-6-4acd63db4504@toradex.com> <al5mDqeFE8QVbUd9@lizhi-Precision-Tower-5810> <3ak4ffamwvdrtgw3bivzvrbtkmyh7g3lvuk4xwvdiuzizi3iu3@uxqvyif7rvpx> <178471622928.2174993.5439033710284861967@ping.linuxembedded.co.uk> <20260722105914.GA72270@francesco-nb>
Subject: Re: [PATCH 6/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex OV5640 CSI Cameras
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Ernest Van Hoecke <ernestvanhoecke@gmail.com>, Frank Li <Frank.li@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
To: Francesco Dolcini <francesco@dolcini.it>, Francesco Dolcini <francesco.dolcini@toradex.com>
Date: Wed, 22 Jul 2026 13:20:13 +0100
Message-ID: <178472281366.2174993.11700327197935285507@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Hi Francesco,

Quoting Francesco Dolcini (2026-07-22 11:59:14)
> Hello Kieran,
>=20
> On Wed, Jul 22, 2026 at 11:30:29AM +0100, Kieran Bingham wrote:
> > Quoting Ernest Van Hoecke (2026-07-22 10:27:32)
> > > On Mon, Jul 20, 2026 at 02:16:46PM -0400, Frank Li wrote:
> > > > On Mon, Jul 13, 2026 at 05:06:27PM +0200, Ernest Van Hoecke wrote:
> > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > >
> > > > > Add device tree overlays for the Toradex OV5640 CSI Camera on Ver=
din CSI_1.
> > > > >
> > > > > The default overlay describes the current CSI Camera Set 5MP OV56=
40 with a
> > > > > 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the=
 legacy
> > > > > camera module.
> > > > >
> > > > > Link: https://developer.toradex.com/hardware/accessories/cameras/=
csi-camera-module-5mp-ov5640-arducam
> > > > > Link: https://www.toradex.com/accessories/csi-camera-ov5640
> > > > > Link: https://developer.toradex.com/hardware/legacy-products/othe=
r/csi-camera-module-5mp-ov5640/
> > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/freescale/Makefile             |  6 ++
> > > > >  .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  | 17 +++++
> > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   | 78 ++++++++=
++++++++++++++
> > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   | 18 +++++
> > > > >  4 files changed, 119 insertions(+)
> ...
> > I think with the Toradex ecosystem there would be some value in
> > supporting or helping with the ongoing dt-connectors or dt-addons topics
> > so that we can abstract the hardware which is being 'added'.
> >=20
> > I think it's important that we tackle the problem of combinatorial
> > explosions of overlays when we can add a component to multiple
> > platforms.
> >=20
> > For example, your OV5640 camera could be added to many different boards
> > - and each board could have many different cameras - in different ports.
> >=20
> > We should not be copy/pasting overlays for each combination, or we'll
> > have 'thousands' of identical overlays.
>=20
> I see your point, and I agree that it would be valuable to move this
> topic forward. I will raise it internally at Toradex and see how we can
> contribute.
>=20
> At the same time, quoting Marex (https://lore.kernel.org/all/dec2a7f6-80f=
d-4692-8936-969f8837a555@nabladev.com/):
>=20
>  | DT connectors have been discussed for the last 10 or so years and thre=
e=20
>  | is still no real progress.
>  |=20
>  | I would be happy to send a follow up patchset which would convert the =

>  | DTOs to whatever connector implementation format lands in the future, =

>  | but I am concerned that waiting for DT connectors will block this=20
>  | patchset from landing for a long time.

Indeed, it's been around for a long time - and yet the problem persists,
and that's why it worries me here. It won't be fixed until someone works
on it or supports the development.

Marex is an independent community developer - without someone buying produc=
ts
to support his development. It wouldn't be fair to push back on him
personnally. He has no mechanism to support the development required.

--
Kieran


>=20
>=20
> Francesco
>
