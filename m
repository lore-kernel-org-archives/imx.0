Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2246D3672A0;
	Thu, 21 May 2026 16:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779380647; cv=none; b=kyZi2Dw2tFyVCvqWV81cOGpKT7XPxaiFCelRhbXklhEdnwNEVwABJTiIftnO/H1WpJ9bUJ0IsAhEce+U640OHX0nfxmMYb9pWguJv4d8UuI7S4FIVfZ3YPVrPbg0uJo5v1Y40YRQYV2vrn8a01usgmWi4aL4lXvd/dQbiRvMX/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779380647; c=relaxed/simple;
	bh=GYidv/I6cRskugQ1KHCwIWAYPn987orkfzQF2MzoIDc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kIOvOCXjwHhQXyQlfOk2zPxsJjCCQLuYLE+Eh47gg7xVGVu8T2O8nubq9w4j6bACUpp8zbBUuFFBT4n+75OXpS/IZZ90Ed5Mv//fxU3+KlIDEX0VmcWypFPmAB6zI7tcxo8jRKekKhV6j3yrYjjotlugJLqDZn3TOEJ4/+ZmCtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=s7PzemUL; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="s7PzemUL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=j9BWViu2SpWt7Rj6XMWPmrgjG6rA+onWCpewnCfYlnQ=; b=s7PzemULtOwfVJPGZe380o8FCH
	Ox3Fin9xFVsNn6I2c2+c/byyh8SKz+3aGFTyvtsoGgz8uOjibUR9Vvtrxznxc2vCikoRLnqP0+c9l
	baw9lqMUwBVYAxoDJErmQsJwFhgkBcSblolqdS6T9j77woqnmIzPP00yIL8GRmkEZLp8=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1wQ6Be-000000003xE-2ZGi;
	Thu, 21 May 2026 12:23:54 -0400
Date: Thu, 21 May 2026 12:23:53 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: krzk@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
 laurent.pinchart+renesas@ideasonboard.com, antonin.godard@bootlin.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 14/15] dt-bindings: display/lvds-codec: add
 ti,sn65lvds93
Message-Id: <20260521122353.82651a97984e58d2ec8309c5@hugovil.com>
In-Reply-To: <20260511114406.24673c770d112b2ca4aba2eb@hugovil.com>
References: <20260305180651.1827087-1-hugo@hugovil.com>
	<20260305180651.1827087-15-hugo@hugovil.com>
	<20260511114406.24673c770d112b2ca4aba2eb@hugovil.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam_score: -2.0
X-Spam_bar: --

On Mon, 11 May 2026 11:44:06 -0400
Hugo Villeneuve <hugo@hugovil.com> wrote:

> Hi,
> 
> On Thu,  5 Mar 2026 13:06:29 -0500
> Hugo Villeneuve <hugo@hugovil.com> wrote:
> 
> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > 
> > Add compatible string for TI SN65LVDS93. Similar to
> > SN65LVDS83 but with an industrial temperature range.
> > 
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> Now that this series landed in linux-next/master, except for this
> patch, we now have an error since it is required:
> 
> https://lore.kernel.org/oe-kbuild-all/202605071909.lXKPelNA-lkp@intel.com/

Hi DT folks,
wondering if someone could pick/apply this patch to fix the build error?

Hugo.


> > ---
> >  Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > index 4f52e35d02537..f2cb74b86cc05 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > @@ -37,6 +37,7 @@ properties:
> >                - ti,ds90c185   # For the TI DS90C185 FPD-Link Serializer
> >                - ti,ds90c187   # For the TI DS90C187 FPD-Link Serializer
> >                - ti,sn75lvds83 # For the TI SN75LVDS83 FlatLink transmitter
> > +              - ti,sn75lvds93 # For the TI SN75LVDS93 FlatLink transmitter
> >            - const: lvds-encoder # Generic LVDS encoder compatible fallback
> >        - items:
> >            - enum:
> > -- 
> > 2.47.3
> > 
> > 
> 
> 
> Hugo Villeneuve <hugo@hugovil.com>


-- 
Hugo Villeneuve
