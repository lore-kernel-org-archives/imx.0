Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6974B1799F;
	Thu,  5 Mar 2026 16:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772726803; cv=none; b=aBqiQrJHkpoIR847XzFOfIsuRmqAauvhNKmWgXhJljFuVD8PPBavG+idmDucwdfCaM/50QM/e5pjpJjo9KLt1rVOVIg4pdJ4Lu7qqV3zpZxbvRdsq6fFppxnUNpqmziCO7jvA4ei2A90VNsZ8rSLtAau38cAK8K535UegFbexIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772726803; c=relaxed/simple;
	bh=e1CBqI+y/aXrYiG5MwBxKZj92vyniLerzJuuwmm71Ss=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=a8Olg1z/fc1t29sPWWl8xyVILbjLnzYi05e/xldaKNbzfO14kcmPzqYjSDZZIgd4/Aifz7VJi92DwzcQxHTZIfcGS4YpT0d++xpSTEAsMG3kkW8IKPS52YYhXlY73AAqFvkcpLPHakVrGdkDSA70yt9D6FL/C9+cj/YRfMWDiPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=HwXvKMDF; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="HwXvKMDF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=VURAe1VBJ++jhd1qN9FU3U4sNtpuG6QDqgVP27ujLLQ=; b=HwXvKMDFPKFt/NwsiuXU2mlZnZ
	QWDSk6365MrHNW3TYaw+6EPMeJVIjcF/pnvE2e7iBVGgBLCaJCI0hcokrMxvLp5olfn9x84uGbMy+
	cuFWWWzl5J/mCqXEBx3DBK/EgStY7tVKBdr76PdWtiJahJi/3CGXl6UyeWmk+eyDXNEs=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:42578 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vyBDD-0002QH-SQ; Thu, 05 Mar 2026 11:06:09 -0500
Date: Thu, 5 Mar 2026 11:06:06 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: "Antonin Godard" <antonin.godard@bootlin.com>
Cc: "Frank Li" <Frank.li@nxp.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
 <festevam@gmail.com>, <shawnguo@kernel.org>,
 <laurent.pinchart+renesas@ideasonboard.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 "Hugo Villeneuve" <hvilleneuve@dimonoff.com>
Message-Id: <20260305110606.f24f17ee4f96d7d2b9b08c2d@hugovil.com>
In-Reply-To: <DGTU9887GHPO.2FUQ3QITRG7F8@bootlin.com>
References: <20260302190953.669325-1-hugo@hugovil.com>
	<20260302190953.669325-9-hugo@hugovil.com>
	<aaX5E7-3xvkaVV-o@lizhi-Precision-Tower-5810>
	<20260302161545.f6b76209400e8fbe35cd51a0@hugovil.com>
	<DGTU9887GHPO.2FUQ3QITRG7F8@bootlin.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -3.3 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH 08/14] ARM: dts: imx6ul-var-som: factor out SD card
 support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

Hi Antonin,

On Wed, 04 Mar 2026 09:01:20 +0100
"Antonin Godard" <antonin.godard@bootlin.com> wrote:

> Hi,
> 
> On Mon Mar 2, 2026 at 10:15 PM CET, Hugo Villeneuve wrote:
> > Hi Frank,
> >
> > On Mon, 2 Mar 2026 15:54:43 -0500
> > Frank Li <Frank.li@nxp.com> wrote:
> >
> >> On Mon, Mar 02, 2026 at 02:03:44PM -0500, Hugo Villeneuve wrote:
> >> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> >> >
> >> > Move SD support to a separate include, since it cannot be used at the
> >> 
> >> s/include/dtsi/
> >
> > Ok. I will also change it in all the other commit messages.
> >
> >  
> >> > same time as the Wifi/BT module.
> >> 
> >> what's relation ship between wifi/bt? you just move sd related part to a
> >> dtsi file.
> >
> > As stated in commit message, the SD card interface cannot be used if
> > the Wifi/BT module is in use.
> >
> > Sd card is not mandatory, for example on our board we do not have it,
> > so we need to have it disabled.
> 
> My two cents: if SDCard and WiFi/Bt support are the only mutually exclusive
> features for this SoM, then how about the following organization:

They maybe are not. There are other peculiarities, for example using the
touch panel configuration has some impacts on an oscillator used by the
Wifi/Bt module. The Varisctite documentation is not entirely clear or
evident about all these details.


> Three SoM dtsi files:

This is already the case (apart from the -bt suffix)?

> 
> imx6ul-var-som-common.dtsi
> 
>   imx6ul-var-som-wifi-bt.dtsi:
>     #include "imx6ul-var-som-common.dtsi"

No need to include it, as it is already included by
imx6ul-var-som-concerto.dts

> 
>   imx6ul-var-som-sd.dtsi:
>     #include "imx6ul-var-som-common.dtsi"

Same...

> 
> A common concerto dtsi file:
> 
>   imx6ul-var-som-concerto-common.dtsi
> 
> Separate concerto dts files:
> 
>   imx6ul-var-som-concerto-wifi-bt.dts:
>     #include "imx6ul-var-som-wifi-bt.dtsi"
>     #include "imx6ul-var-som-concerto-common.dtsi"
> 
>   imx6ul-var-som-concerto-sd.dts
>     #include "imx6ul-var-som-sd.dtsi"
>     #include "imx6ul-var-som-concerto-common.dtsi"
> 
> And possibly the following one to avoid breaking compatibility:
> 
>   imx6ul-var-som-concerto.dts
>     #include "imx6ul-var-som-sd.dtsi"
>     #include "imx6ul-var-som-concerto-common.dtsi"
> 
> In any case, the imx6ul-var-som-concerto-common.dtsi should be full-featured
> (and thus avoid the imx6ull-var-som-concerto-full.dts file from patch 09/14), if
> that's possible?

I am not convinced that it needs to be full-featured. For our custom
boards, we want to include only the relevant dtsis, because for example
we do not use sd, or enet1 or enet2, or audio. Having these options in
separate dtsi allows our custom boards to include/enable only the
required features.

The full dts is only there as a reference, and to make sure all dtsi
are included and therefore compiled-checked. In it I have enabled
enet1 and enet2, but some boards may use enet1, and not enet2, or
vice-versa, or some boards (like our custom boards) we are not using
either one.

> But I don't know if this follows common practices, and if this is possible, but
> I think it's clearer as a user to know if the DTS I will use will support
> WiFi/BT _or_ support SDCard by looking at its name.
> 
> Of course this is based on the assumption that those two features are the only
> mutually exclusive ones.
> 
> What do you think?

Yes, but there is an exponential number of different
combinations, and thus would require a lot of different DTS...

If you look at the Variscite git repos, you will see a lot of different
DTS to support only a subset of the possible combinations, and it
already looks like a mess to me :) I would like to keep things simple if
possible.

-- 
Hugo Villeneuve
