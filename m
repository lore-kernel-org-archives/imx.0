Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8D31DFFD
	for <imx@lists.linux.dev>; Wed,  9 Apr 2025 21:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744232733; cv=none; b=fwK8eY9nhWtDCZxBFEKOb1BD1IM7H4RvzZZYwMx2GIigLO+c9XbbLJF9pHpwf9C4FGbAtJHgxSBMYZ+2/5Hgv5gGupDwFtM12bFJo7XvMHKYg3SpQtsfxCAVn8O2gxU3PR4dKvay1uxMHqsSuHrQDTZa7vYxDZQzlAUbyk6RYBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744232733; c=relaxed/simple;
	bh=N5hlXF96Ode30eEYmbK2mv3z6B7j9bK3qeuxbUlrazg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aakGjemUQiEt1puBvy/ITR1SMnWplAW+kUZuC4y67UAavmMQLu5zCMpg29WYGrietk1Gwd9fWDks/RYmLYZMr5+suI5MTYpt25Gc3enipVB7SvUDmMou4o46Xvcrnri0m0MhHWtFpaLTsN+aRDzIAHrNJGqYj3K+XMgGBlCywFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nw/pc+I1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nw/pc+I1"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B67E82E;
	Wed,  9 Apr 2025 23:03:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744232611;
	bh=N5hlXF96Ode30eEYmbK2mv3z6B7j9bK3qeuxbUlrazg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nw/pc+I16ePWEVbKyb01L2UFQxqyd/+UIweSrUTVP3P5jyEYnukYlgV7CGSAx3xn0
	 woOxLCKtUkthcbk5Qx1e1GD4PkByWdVkFt2w/UK5g32SY5uWLUt5amY0Xl+fHbuI5y
	 hIaqLva2mobQgbxZFvn7aSzAsRpQ8jPEVsVOu+8M=
Date: Thu, 10 Apr 2025 00:05:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: Need Help Enabling HDMI on Debix Model A
Message-ID: <20250409210504.GB12162@pendragon.ideasonboard.com>
References: <PN3P287MB1829E84B6B79E9C7189D7CB78BAA2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250407130257.GD3924@pendragon.ideasonboard.com>
 <PN3P287MB1829692B4C3D5AD273CB62DE8BAA2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB1829692B4C3D5AD273CB62DE8BAA2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>

Hi Tarang,

On Mon, Apr 07, 2025 at 02:06:35PM +0000, Tarang Raval wrote:
> > On Mon, Apr 07, 2025 at 11:10:23AM +0000, Tarang Raval wrote:
> > > Hi Laurent,
> > >
> > > I’m trying to bring up HDMI on the Debix Model A board using the
> > > mainline kernel, but I’m currently facing issues.
> > >
> > > I saw that you tested the patch for HDMI support on this board in
> > > mainline, so I am hoping you could help me figure out what might be
> > > missing.
> > >
> > > To clarify — I'm using the prebuilt image provided by Debix, but I replaced
> > > the kernel image and the device tree (DTS) file in the /boot directory with
> > > ones built from the mainline kernel.
> > >
> > > I’ve enabled the following configurations in the kernel:
> > > CONFIG_DRM_DISPLAY_CONNECTOR=y
> > > CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE=y
> > > CONFIG_DRM_IMX8MP_HDMI_PVI=y
> > > CONFIG_DRM_IMX_LCDIF=y
> > > CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY=y
> > >
> > > When I boot the board, I see the following HDMI/DRM related logs:
> > > debix@imx8mp-debix:~$ dmesg | grep -iE "drm|hdmi"
> > > [    0.121979] /soc@0/bus@32c00000/display-bridge@32fc4000: Fixed dependency cycle(s) with /soc@0/bus@32c00000/hdmi@32fd8000
> > > [    0.122164] /soc@0/bus@32c00000/hdmi@32fd8000: Fixed dependency cycle(s) with /soc@0/bus@32c00000/display-bridge@32fc4000
> > > [    0.127417] /soc@0/bus@32c00000/hdmi@32fd8000: Fixed dependency cycle(s) with /hdmi-connector
> > > [    0.127608] /hdmi-connector: Fixed dependency cycle(s) with /soc@0/bus@32c00000/hdmi@32fd8000
> > > [    1.947962] imx8mp-dw-hdmi-tx 32fd8000.hdmi: Detected HDMI TX controller v2.13a with HDCP (SAMSUNG HDMI TX PHY)
> > > [    1.949220] imx8mp-dw-hdmi-tx 32fd8000.hdmi: registered DesignWare HDMI I2C bus driver
> > > [    1.956365] [drm] Initialized imx-lcdif 1.0.0 for 32fc6000.display-controller on minor 0
> > > [    2.016601] imx-lcdif 32fc6000.display-controller: [drm] fb0: imx-lcdifdrmfb frame buffer device
> > > [    8.380915] systemd[1]: Starting Load Kernel Module drm...
> > >
> > >
> > > I also checked that the display's modeline is recognized under sysfs :
> > >
> > > root@imx8mp-debix:~# ls /sys/class/drm/card0-HDMI-A-1/
> > > connector_id  dpms          modes         subsystem/
> > > ddc/          edid          power/        uevent
> > > device/       enabled       status
> > >
> > > However, there is still no HDMI output on the display. Instead,
> > > I only see a white blinking cursor on the screen.. I'm not sure
> > > what I'm missing.
> > 
> > The white blinking cursor means the display is working from the kernel
> > point of view. What are you expecting, are you running an X server or
> > Wayland compositor ?
> 
> I'm expecting to see the Ubuntu desktop environment on the HDMI 
> display — just like how it appears with the original prebuilt image provided 
> by Debix. I'm running the default Ubuntu 22.04 LTS prebuilt image, and I only
> replaced the Image and .dtb file
> 
> I'm not explicitly launching an X server or Wayland compositor myself
> 
> However, based on your response, I now realize that I may also need to 
> enable GPU support in the mainline device tree. Specifically, I believe I 
> need to enable the gpu2D and gpu3D nodes to allow the graphical 
> environment to start properly and render the desktop over HDMI.
> 
> Does that sound correct, or is there anything else I should check or 
> enable?

That's a plausible explanation. The 2D GPU is probably not used by the
compositor, but a 3D GPU could be required. I'd recommend checking the
system logs to see why the compositor (or session manager) failed to
start.

> > > Could you please help me out or point me in the right direction?
> > >
> > > Thank you for your time.

-- 
Regards,

Laurent Pinchart
