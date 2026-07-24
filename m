Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A701A4908C3
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 13:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784900525; cv=none; b=nLnzKWRW6bVEzgaZw1mTJ7dmSf455V+f9S/zgG4co0XIcqnAyNZHQBjySLjCfPLpoPOwade5l6iaK+GnKAKAuJ4ttp18aO86v1Sop1z3TUny8KZWeyI/VnM9xh0XMasS/7+y6Z20DRjiTyLFifQcdf7EjGP0IipDcIwM/eOJYLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784900525; c=relaxed/simple;
	bh=5+b24SGzoRwdE3mntMzGKQSgwrd+rZZA3y+3/WxHods=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mq+nb2ysOCEPJScW+2prrgWLXzmX2VUBikju+0nJJY4EGftjHnXcD3dA19xdSIv03mIBNp5/V63sS508HW2+c0nZRIu1NF4SmUURYr8AXcXbxAxT6scqDPoDtMZ2+IN4O8dt0AZMDdg4iJhJeljxTHt5M03qXXVVrE+dtfhCp6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYTNqSAW; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYTNqSAW"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f97d310caso379360f8f.2
        for <imx@lists.linux.dev>; Fri, 24 Jul 2026 06:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784900521; x=1785505321; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kkz4nyMnu+p0MmuXqpH9H0qUrj19YSj8Cq+qczGuex8=;
        b=nYTNqSAWZ+y4BTL+I5GEqZQe7N/3zGgLVbVkUcwnpIA6F7a3KN05g1NWG1V28d8g9B
         jj80opYPxHwAuJPmmxePtvLtz23UgJBo+C2xVoGZJChQFZv3WI7iWxFMi3Vzv7ZVEkok
         acl+CDkX/LN8ldVJ3y6rYmVJ8juBo13IPKXMH+HJ8UUTOlIbngn0J8aOPYmJGGhg6tpk
         CUKoSowQbLys2wqA+jwRlHKf3oGh+G0fNagQUZY51cQ7Vq4DrkoFuWh1WorG1HpbWV/E
         XWKeq+SLb3F/Fk0OCMWadofIk7H2+GmEF4ewKp1AEjyBR/z6RKHR0oRigMmYL88QZbtr
         X79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784900521; x=1785505321;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kkz4nyMnu+p0MmuXqpH9H0qUrj19YSj8Cq+qczGuex8=;
        b=eOiVJGuDNePW8sR33lXhPs4nqsi2BByCUEzFuibYkWq+7vINwQ1ji6sogVIKEeicXc
         R6E5uXMlPDXeV/d4//heq9xHh3Nlk/D4XOGB+/VNGsWRUXN1ScssPyexo09k+tSFxKQC
         3Y2+NJPqJSvBcpiZRYtmAnpbn/NsEmvhCL+yklFZ2eweWDmsBRX3O8+G+xp0DIaFMLQI
         M9OTzISf13t8GlqQnaep4x67rNQHLXLKth9TKu8u8Ghj2Hd1wsMI6hHeCZnKWdaeNUOP
         0S65KCEnOzb7VjSjLZ3oD380ow4kygEB9O4Fmug/+9ART+MY2o5P1X9LxfIg5iHlTeCF
         hZqA==
X-Forwarded-Encrypted: i=1; AHgh+RqYGp0KsdgXZTA4pa9goGXJmCrajT7VDtoC5xyMts56+VCfso0HFVdooapDsAmZe8HVqkg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHZr0CqywgSgsMlZboBY8JWxV/lSIXLs8nep/SGd5OjRyVdZAn
	xWYA3wv8iNYl2u0qENdwcSC1AhoFBs7uAP53yIWMjsb5K7WvEZn83avi
X-Gm-Gg: AR+sD11xU+Kn/xyB/RHA3I7Io5Uxs6XoCBBuIq6hb0SvBsAiBV7bwdygtpClZi050ib
	IZg3m7tTOad9UWFayd0Tu1xLj9vkEzCNaLVjgP3itfm61CcjHisWZ46HVLqeSm8tMDACv4PO6fT
	6Yl94BD1TMeMNHWBi+b9me+S+vmz6AR0BSUYZf7pvcVnPpyuF1v2Fe2XrvWmAxyjwJLJmxxX0cf
	x6ZtSpElS8uSNE9f9Eppi9BFuIXLyZNnVp95UPiMfKJcJ/rYQAEdnjsUXiZid9x7lGslHTq0oD9
	dzPAqtN068VFJqFlRZPOBGiT4/5MeeoSPT/1Z7Evkcck4lruVDFzT0Or782KDyNQ+ecsp2yOAM/
	bHuHKJF43LZw9120BcND6eIgCpKSexSviQvtd/LxwMsbk19rspDqYPGiRBu163BGHwlF8a8hg4M
	6yG/LUczMY7LZzKatw1gk0ZMR8IvfUsM9YMULqtd6r1FQe8yu6+zEsY7KDkWNoIPYLQW1Wa0cDC
	lpHbA==
X-Received: by 2002:a05:600c:1f82:b0:495:7426:c392 with SMTP id 5b1f17b1804b1-4957426c545mr83063625e9.1.1784900520632;
        Fri, 24 Jul 2026 06:42:00 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c531basm24736797f8f.19.2026.07.24.06.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 06:42:00 -0700 (PDT)
Date: Fri, 24 Jul 2026 15:41:59 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 6/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 OV5640 CSI Cameras
Message-ID: <sr26lfvwasgcosfzcf4ydtwxwjjutlio2yqpgxldatpzjo7e4y@77k7gefnjzvl>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
 <20260713-v1-verdin-imx8mm-dtbos-v1-6-4acd63db4504@toradex.com>
 <al5mDqeFE8QVbUd9@lizhi-Precision-Tower-5810>
 <3ak4ffamwvdrtgw3bivzvrbtkmyh7g3lvuk4xwvdiuzizi3iu3@uxqvyif7rvpx>
 <178471622928.2174993.5439033710284861967@ping.linuxembedded.co.uk>
 <20260722105914.GA72270@francesco-nb>
 <amDXGRT80HfyJwCt@SMW015318>
 <vrw2wmtywuokachenclid4dnrosaq2xqlzqtyqe75tsdt27yzx@ntztzwyxoadw>
 <amJrv2FDbdkbvMKQ@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amJrv2FDbdkbvMKQ@SMW015318>

On Thu, Jul 23, 2026 at 02:30:07PM -0500, Frank Li wrote:
> On Wed, Jul 22, 2026 at 06:15:50PM +0200, Ernest Van Hoecke wrote:
> > On Wed, Jul 22, 2026 at 09:43:37AM -0500, Frank Li wrote:
> > > On Wed, Jul 22, 2026 at 12:59:14PM +0200, Francesco Dolcini wrote:
> > > > Hello Kieran,
> > > >
> > > > On Wed, Jul 22, 2026 at 11:30:29AM +0100, Kieran Bingham wrote:
> > > > > Quoting Ernest Van Hoecke (2026-07-22 10:27:32)
> > > > > > On Mon, Jul 20, 2026 at 02:16:46PM -0400, Frank Li wrote:
> > > > > > > On Mon, Jul 13, 2026 at 05:06:27PM +0200, Ernest Van Hoecke wrote:
> > > > > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > > >
> > > > > > > > Add device tree overlays for the Toradex OV5640 CSI Camera on Verdin CSI_1.
> > > > > > > >
> > > > > > > > The default overlay describes the current CSI Camera Set 5MP OV5640 with a
> > > > > > > > 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the legacy
> > > > > > > > camera module.
> > > > > > > >
> > > > > > > > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > > > > > > > Link: https://www.toradex.com/accessories/csi-camera-ov5640
> > > > > > > > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > > > > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > > > ---
> > > > > > > >  arch/arm64/boot/dts/freescale/Makefile             |  6 ++
> > > > > > > >  .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  | 17 +++++
> > > > > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   | 78 ++++++++++++++++++++++
> > > > > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   | 18 +++++
> > > > > > > >  4 files changed, 119 insertions(+)
> > > > ...
> > > > > I think with the Toradex ecosystem there would be some value in
> > > > > supporting or helping with the ongoing dt-connectors or dt-addons topics
> > > > > so that we can abstract the hardware which is being 'added'.
> > > > >
> > > > > I think it's important that we tackle the problem of combinatorial
> > > > > explosions of overlays when we can add a component to multiple
> > > > > platforms.
> > > > >
> > > > > For example, your OV5640 camera could be added to many different boards
> > > > > - and each board could have many different cameras - in different ports.
> > > > >
> > > > > We should not be copy/pasting overlays for each combination, or we'll
> > > > > have 'thousands' of identical overlays.
> > > >
> > > > I see your point, and I agree that it would be valuable to move this
> > > > topic forward. I will raise it internally at Toradex and see how we can
> > > > contribute.
> > > >
> > > > At the same time, quoting Marex (https://lore.kernel.org/all/dec2a7f6-80fd-4692-8936-969f8837a555@nabladev.com/):
> > > >
> > > >  | DT connectors have been discussed for the last 10 or so years and three
> > > >  | is still no real progress.
> > > >  |
> > > >  | I would be happy to send a follow up patchset which would convert the
> > > >  | DTOs to whatever connector implementation format lands in the future,
> > > >  | but I am concerned that waiting for DT connectors will block this
> > > >  | patchset from landing for a long time.
> > > >
> > >
> > > I do quick check for ov5640, we can use partial connectors, which already
> > > in kernel tree.
> > >
> > > use duplicate label like
> > >
> > > in mainboard
> > > csi_io_i2c: &i2c3 {
> > > 	...
> > > }
> > >
> > > csi_io_regualotor_3v3: ....
> > >
> > >
> > > csi_io: connector_csi {
> > > 	compatible = "...";
> > > 	gpio-map = <0 0 &gpio1 3 3>;
> > > 	...
> > > 	irq-map =<0 &gpio1 4 1>;
> > > 	...
> > > }
> > >
> > > in 5640 overlay
> > >
> > > &csi_io_i2c {
> > > 	camera@xx {
> > >
> > > 		reset-gpios = <&csi_io 0 ACTIVE_HIGHT>;
> > > 	}
> > > }
> > >
> > > https://lore.kernel.org/imx/AM9PR04MB8353AC7DF91C5F73C34019E0E3F72@AM9PR04MB8353.eurprd04.prod.outlook.com/
> > >
> > > Only clock part have dependence. other parts. I am working mipi dsi for
> > > display, almost work except panel show have some problem, which is not
> > > related with connector.
> > >
> > > Frank
> >
> > This is very interesting and I agree with both you and Kieran that it
> > would be great to abstract these connections away and kill the need for
> > so many variations.
> >
> > Certainly I will read up on this and spread it internally as well.
> >
> > That said, since there are still unresolved dependencies, I am not
> > convinced that we should already head this way with this series. It
> > supports hardware that exists today in the currently standard and clean
> > way.
> 
> Your ov5640 have not such dependence. You can try connector firstly.
> 
> display most like can go through connector, (I remember pwm already
> supported, but not sure).
> 
> others continue go through old method until dependence clear.
> 
> Frank
> 

The ov5640 still requires a clock nexus which is not merged yet.

I have been playing around with it locally now and find the work here
very interesting. Certainly this is also useful for Toradex and I would
like to use it to reduce duplication.

We will repeat this work for the Verdin iMX8MP. So I see real value in
using these new mechanisms to map the GPIOs such that the Verdin ov5640
overlay can be reused. However, this would also require a new binding
for a "verdin_csi" device.

Therefore, I could consider dropping the ov5640 overlays from this
series and sending them as a follow up with the partial connectors
support. But I don't want to block the series from getting merged for
this non-trivial effort.

If we go that way, I wonder where the verdin-ov5640 overlay should go?
We also have Verdin modules with a TI SoC, with the OV5640 overlays
already merged, that could be refactored. Those live in ti/, not
freescale/. Do you have any input on how we should deal with that?

Personally I am still more in favour of merging now and refactoring with
our next series for other SoMs, but I understand the desire to start on
this now so there are more consumers of this new behaviour.

Thanks for your input and kind regards,
Ernest

