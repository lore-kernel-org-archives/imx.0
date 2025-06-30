Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D8F1482E7
	for <imx@lists.linux.dev>; Mon, 30 Jun 2025 18:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751308270; cv=none; b=ByU0/8CvUpD34MRMG0TTUcuCJcZCi29FczdxLI7aByWx2Ch9FuM8+AoTGZDe4N/6v/GXDRnl8VyUiIaPbrS2BzbBgtIek7qNY+n40sfZH+ugS7/961pTf1oVcGPgJSycntTPgAU0MbSXHdWOUfc+Sr1Hs0VRIgLPWX/rDbwP+tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751308270; c=relaxed/simple;
	bh=QWChR3Bdm/NXwz4NQqvvVjxKeDXNgvFduFPy7gDqv0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m57ezZfdhgvn9LSaoZxWQQaeMfCLCTQvGUVlIWN7g7PuDleR+fMrwKwldEgkc/izMJja6VTbqw1O7CnmS7iez5VUPNRJj1jmXGWSfBToo6/57TPAHT3JJJv+cUeQez26Ci9WLiZy1lMZgXX97fJAnNav07QmQzrCXYtRSTxg47s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BrH00oPl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BrH00oPl"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 30718928;
	Mon, 30 Jun 2025 20:30:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751308245;
	bh=QWChR3Bdm/NXwz4NQqvvVjxKeDXNgvFduFPy7gDqv0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BrH00oPlwj6XiobcNQkW8Ica64b5bjxL/g9umDE6MW4K5MEUAdYX14icC4sd4Y/g9
	 Xa3SigFlepqpIAoOUtewZEdBcX2IKpNKtAKrvIErT8CGY4edlvXKPzDkcP2TUmvxrL
	 LlaNzl569ykom8IxBWW1sHJyNhC0MbraPsevTwmQ=
Date: Mon, 30 Jun 2025 21:30:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, inux-media@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: Compatible vs onnn,model at ap1302 binding
Message-ID: <20250630183041.GA17697@pendragon.ideasonboard.com>
References: <aGLRbiqT8qVdG40z@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aGLRbiqT8qVdG40z@lizhi-Precision-Tower-5810>

Hi Frank,

On Mon, Jun 30, 2025 at 02:04:21PM -0400, Frank Li wrote:
> Hi Rob:
> 
> There are long discussion about AP1302 support.
> 
> https://lore.kernel.org/imx/20250623-ap1302-v3-0-c9ca5b791494@nxp.com/T/#m9ecad9fcbfd1ac1c59b3aa5737e3860a64db2eb4
> previous thread
> https://lore.kernel.org/linux-media/1631091372-16191-1-git-send-email-anil.mamidala@xilinx.com/
> 
> Let me summary the key points.

Thanks for the summary.

> AP1302 is I2C ISP processor, which can connect to some RAW sensors. such as
> AR0144. AR0144 can work alone, a RFC upstreaming at
> https://lore.kernel.org/linux-devicetree/20240630141802.15830-2-laurent.pinchart@ideasonboard.com/
> 
> When AR0144 connect to AP1302, it is not 100% transparents for software,
> It needs power supplies for it.
> 
> The basically there are two methods now.
> 
> Method 1 ( Laurent Pinchart purposed ):
> 
> use a vendor's specific property like model
> 
> camera@3c {
>         compatible = "onnn,ap1302";
>         ...
>         sensors {
>                 onnn,model = "onnn,ar0144";
>                 ^^^^
>                 sensor@0 {
>                         reg = <0>;
>                         vdd-supply = <&mt6358_vcamd_reg>;
>                         vaa-supply = <&mt6358_vcama1_reg>;
>                         vddio-supply = <&reg_1p8v_ext>;
>         ....
> 
> 
> Method 2 ( suggested by Rob at 2021 ):
> 
> use compatible string:
> 
> camera@3c {
>         compatible = "onnn,ap1302";
>         ...
>         ports {
>                 port@0 {
>                         compatible = "onnn,ar0144";
>                         ^^^^
>                         reg = <0>;
>                         vaa-supply = <&vaa_regulator>;
> 
>         ...
> 
> 
>                Method 2                              Mathod 1
> The same hardware should use the         There are not driver to match onnn,ar0144.
> same binding regardless connect to       AR0144 is not visilable from host point.
> which bus/devices
> 
>                                          compatible means software comaptible, but
>                                          there are not driver for it at this case.
> 
> reg in difference spi/i2c also have      reg is i2c's address, but here is port or
> difference means.                        sensor index.
> 
> Similar case for spi and i2c devices.    There are difference set of mandatory properties
>                                          when connect to ISP or SoC.
> 
> 
> Rob and Laurent Pinchart:
> 
>         Need a direction to move forwards!

There are two things to consider here. One is the DT property we want to
use to identify the sensor model. It can be argued that the "compatible"
property is widely used for this purpose. This is true, but the
"compatible" property is meant to indicate compatibility from an
operating system software point of view (regardless of which operating
system is used). As a result, it serves as the central piece around
which drivers are bound to devices, and therefore is also used to match
DT schemas for the device.

What we need here is to identify the sensor model, first and foremost to
load the corresponding AP1302 firmware, and to know which power supplies
the AP1302 driver needs to control for the sensor. Note that it would be
entirely feasible for the sensor power supplies to be connected to GPIOs
of the AP1302 and entirely controlled by the AP1302 firmware, but on
some designs those power supplies are connected to GPIOs of the main
SoC, and therefore need to be controlled by the AP1302 driver.

While I think a custom property is better, I could live with
"compatible" *iif* it does not imply at the corresponding DT schema for
the sensor is pulled in. The DT binding for the sensor when controlled
from the main SoC describe the properties of the sensor that are
required for that use case, and those only overlap slightly with the
properties of the sensor needed by the AP1302. Using "compatible" in
such a case would in my opinion be misleading as it would imply
compatibility with the sensor DT binding.

-- 
Regards,

Laurent Pinchart
