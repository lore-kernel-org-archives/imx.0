Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573D91C4A24
	for <imx@lists.linux.dev>; Tue, 15 Jul 2025 21:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752615369; cv=none; b=imTGrz1Ol6KuEEZ6pic/bABQcldZCKnWcBdOyEAM6blId4gq/h0uZzG9CwRlyUdf4yKxOf1xod2aLeo+57A4sZ4mmnLT1wYZ//P+EcF3bXVlVu8r/EpVeISdUJsQ/Qi7U7wwuAtN+LYgUyiyfDPXBJfjbsPeEAvhTOnkfufNf2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752615369; c=relaxed/simple;
	bh=jH0P1jJT9HcJ9LDe4t29cRUynt4zoILGOK7RXrWM7l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQaq31P3bDQSCfHEWlVjcDxuhS1A+kUt3QD/rV5xGz3c4SFdPHz+mHR7IYi7AD8RBxO8s9KQh8b6dl2HCxQh0u3TAOa+x9BIcb9yr6IBLxdzCmXl0PL8s54AcdPQr7+AC0TpTqpV4Kljurca3dop8MEc07e09haTqryNQpLAobs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=s+zxybaD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="s+zxybaD"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A2099111D;
	Tue, 15 Jul 2025 23:35:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752615332;
	bh=jH0P1jJT9HcJ9LDe4t29cRUynt4zoILGOK7RXrWM7l4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s+zxybaDPiiQFPSPxoclpQxPpo6ISUVSXejEFkWnyRPyVECCdlaTMaFuUlXZHEuJQ
	 dzjY4ZECsjx+yVJT65W8NOrOo8Rfxs0YMxFweIC+7VmZIp537tYOinWodVi92N27PN
	 yW3E3UgnNlbbNeXVQTDe/1cHgHwenelRiAX7NcsM=
Date: Wed, 16 Jul 2025 00:36:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>, devicetree@vger.kernel.org,
	inux-media@vger.kernel.org, imx@lists.linux.dev
Subject: Re: Compatible vs onnn,model at ap1302 binding
Message-ID: <20250715213603.GO20231@pendragon.ideasonboard.com>
References: <aGLRbiqT8qVdG40z@lizhi-Precision-Tower-5810>
 <20250630183041.GA17697@pendragon.ideasonboard.com>
 <20250715195404.GA1794419-robh@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250715195404.GA1794419-robh@kernel.org>

Hi Rob,

On Tue, Jul 15, 2025 at 02:54:04PM -0500, Rob Herring wrote:
> On Mon, Jun 30, 2025 at 09:30:41PM +0300, Laurent Pinchart wrote:
> > On Mon, Jun 30, 2025 at 02:04:21PM -0400, Frank Li wrote:
> > > Hi Rob:
> > > 
> > > There are long discussion about AP1302 support.
> > > 
> > > https://lore.kernel.org/imx/20250623-ap1302-v3-0-c9ca5b791494@nxp.com/T/#m9ecad9fcbfd1ac1c59b3aa5737e3860a64db2eb4
> > > previous thread
> > > https://lore.kernel.org/linux-media/1631091372-16191-1-git-send-email-anil.mamidala@xilinx.com/
> > > 
> > > Let me summary the key points.
> > 
> > Thanks for the summary.
> > 
> > > AP1302 is I2C ISP processor, which can connect to some RAW sensors. such as
> > > AR0144. AR0144 can work alone, a RFC upstreaming at
> > > https://lore.kernel.org/linux-devicetree/20240630141802.15830-2-laurent.pinchart@ideasonboard.com/
> > > 
> > > When AR0144 connect to AP1302, it is not 100% transparents for software,
> > > It needs power supplies for it.
> > > 
> > > The basically there are two methods now.
> > > 
> > > Method 1 ( Laurent Pinchart purposed ):
> > > 
> > > use a vendor's specific property like model
> > > 
> > > camera@3c {
> > >         compatible = "onnn,ap1302";
> > >         ...
> > >         sensors {
> > >                 onnn,model = "onnn,ar0144";
> > >                 ^^^^
> 
> Why is this outside the sensor node?

Because when the AP1302 is used with two sensors, it requires both of
them to be identical. The property could go to the sensor nodes, but it
would then be redundant, and would make it possible to write incorrect
DT. When designing APIs, one of my goals is to make them difficult to
use incorrectly, so I think the property is better placed here.

This being said, it won't cause lots of issues if we moved the property
to the sensor nodes. I think it's suboptimal with no benefit, but if
that's the only contention point, I can compromise :-)

> > >                 sensor@0 {
> > >                         reg = <0>;
> > >                         vdd-supply = <&mt6358_vcamd_reg>;
> > >                         vaa-supply = <&mt6358_vcama1_reg>;
> > >                         vddio-supply = <&reg_1p8v_ext>;
> > >         ....
> > > 
> > > 
> > > Method 2 ( suggested by Rob at 2021 ):
> > > 
> > > use compatible string:
> > > 
> > > camera@3c {
> > >         compatible = "onnn,ap1302";
> > >         ...
> > >         ports {
> > >                 port@0 {
> > >                         compatible = "onnn,ar0144";
> > >                         ^^^^
> > >                         reg = <0>;
> > >                         vaa-supply = <&vaa_regulator>;
> 
> Please don't hijack the graph binding (ports and port nodes). 
> 
> > > 
> > >         ...
> > > 
> > > 
> > >                Method 2                              Mathod 1
> > > The same hardware should use the         There are not driver to match onnn,ar0144.
> > > same binding regardless connect to       AR0144 is not visilable from host point.
> > > which bus/devices
> > > 
> > >                                          compatible means software comaptible, but
> > >                                          there are not driver for it at this case.
> > > 
> > > reg in difference spi/i2c also have      reg is i2c's address, but here is port or
> > > difference means.                        sensor index.
> > > 
> > > Similar case for spi and i2c devices.    There are difference set of mandatory properties
> > >                                          when connect to ISP or SoC.
> > > 
> > > 
> > > Rob and Laurent Pinchart:
> > > 
> > >         Need a direction to move forwards!
> > 
> > There are two things to consider here. One is the DT property we want to
> > use to identify the sensor model. It can be argued that the "compatible"
> > property is widely used for this purpose. This is true, but the
> > "compatible" property is meant to indicate compatibility from an
> > operating system software point of view (regardless of which operating
> > system is used). As a result, it serves as the central piece around
> > which drivers are bound to devices, and therefore is also used to match
> > DT schemas for the device.
> > 
> > What we need here is to identify the sensor model, first and foremost to
> > load the corresponding AP1302 firmware, and to know which power supplies
> > the AP1302 driver needs to control for the sensor. Note that it would be
> > entirely feasible for the sensor power supplies to be connected to GPIOs
> > of the AP1302 and entirely controlled by the AP1302 firmware, but on
> > some designs those power supplies are connected to GPIOs of the main
> > SoC, and therefore need to be controlled by the AP1302 driver.
> > 
> > While I think a custom property is better, I could live with
> > "compatible" *iif* it does not imply at the corresponding DT schema for
> > the sensor is pulled in. The DT binding for the sensor when controlled
> > from the main SoC describe the properties of the sensor that are
> > required for that use case, and those only overlap slightly with the
> > properties of the sensor needed by the AP1302. Using "compatible" in
> > such a case would in my opinion be misleading as it would imply
> > compatibility with the sensor DT binding.
> 
> Why not a new compatible (e.g. onnn,ar0144-isp)? Seems to me there would 
> be at least some overlap. If there are supplies, then the names should 
> be the same, right?

Would that be a top-level compatible for the AP1302, or am I
misunderstanding something ? Or maybe a compatible = "onnn,ar0144-isp"
for the sensor node, not the AP1302 ? The AR0144 could be used with
other ISPs (I recently upstreamed support for the THP7312 external ISP
from THine for instance, which could work with the AR0144 from onsemi),
so the "compatible" property in the sensor node needs to be evaluated in
the context of its parent, not in isolation. I think that departs enough
from the compatible model to be better served by a different property,
instead of introducing usage of "compatible" with a semantics (both from
the point of view of the OS, and from the point of view of the DT
binding validator).

> If you really want onnn,model, then that's fine. Probably there's not 
> enough different sensors for me to really care...

The AP1302 is typically used with a subset of the onsemi sensors in my
experience, so I indeed don't think we'll have scaling issues.

-- 
Regards,

Laurent Pinchart
