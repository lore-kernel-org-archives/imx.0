Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550BD3EFD2E;
	Mon,  8 Jun 2026 14:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930512; cv=none; b=SKHGa/TIIzjgdfHgJ7WSYLrmbxO+pnInf8UZsOcgLj45HAHGISEA06Cii8jLgqunAo7+8hePMCxtJxz8pNfbpaEa9teD6ZVXq2lC6/mH5ZA/31ArQ5MOInrVjdJdjkulyT9HoqMSHkNqA5zRrj9+LTdVuKeuTlXSdpIRMeeQGK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930512; c=relaxed/simple;
	bh=efD5WqtlqRfwifxxwoK5B9N/dCynfQHG10xfXW5An3w=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=FeWYozVjYB9a0mR5A3noeOrtw+wcUm6r8JzU3jU3o6N6XTx9hzW2zucZYFrkm0BjfE+RPMC4FLY3Lq4ysXTUNmeGjrYaYwAlluGw6vCfl3dv2q9mSH26smG2qpfU3/9odPMvUkb0+P1ugRz0Y+xxJRMRVOUTZvqJvhrtHQgUNFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=sV/EbSJ1; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="sV/EbSJ1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=NqHxMoguK2gDguhbFbY8cwX2FqYEftuj+HxBPwP9Wnk=; b=sV/EbSJ1NcIMQOjzOgvWNV/CLJ
	psBOODM9g/F7lI+pZYYCveKgOETLgh/IYMMsdRJKhNIIQ0DI1MeSq1sheu81G+pc5H+oDtSXuD2YQ
	8ykH94/DeKpIGp0LZso5akvv0AZ2qnITY+ocy9v3Lk61VxFB57vMntoSmDAwoD8KGhL4=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1wWb1q-000000000gS-1u7V;
	Mon, 08 Jun 2026 10:32:38 -0400
Date: Mon, 8 Jun 2026 10:32:36 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: krzk@kernel.org
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
Message-Id: <20260608103236.efd8db82877ce76b09fde75b@hugovil.com>
In-Reply-To: <20260521122353.82651a97984e58d2ec8309c5@hugovil.com>
References: <20260305180651.1827087-1-hugo@hugovil.com>
	<20260305180651.1827087-15-hugo@hugovil.com>
	<20260511114406.24673c770d112b2ca4aba2eb@hugovil.com>
	<20260521122353.82651a97984e58d2ec8309c5@hugovil.com>
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

On Thu, 21 May 2026 12:23:53 -0400
Hugo Villeneuve <hugo@hugovil.com> wrote:

> On Mon, 11 May 2026 11:44:06 -0400
> Hugo Villeneuve <hugo@hugovil.com> wrote:
> 
> > Hi,
> > 
> > On Thu,  5 Mar 2026 13:06:29 -0500
> > Hugo Villeneuve <hugo@hugovil.com> wrote:
> > 
> > > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > > 
> > > Add compatible string for TI SN65LVDS93. Similar to
> > > SN65LVDS83 but with an industrial temperature range.
> > > 
> > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > 
> > Now that this series landed in linux-next/master, except for this
> > patch, we now have an error since it is required:
> > 
> > https://lore.kernel.org/oe-kbuild-all/202605071909.lXKPelNA-lkp@intel.com/
> 
> Hi DT folks,
> wondering if someone could pick/apply this patch to fix the build error?

Ping...

Hugo.


> > > ---
> > >  Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > > index 4f52e35d02537..f2cb74b86cc05 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > > @@ -37,6 +37,7 @@ properties:
> > >                - ti,ds90c185   # For the TI DS90C185 FPD-Link Serializer
> > >                - ti,ds90c187   # For the TI DS90C187 FPD-Link Serializer
> > >                - ti,sn75lvds83 # For the TI SN75LVDS83 FlatLink transmitter
> > > +              - ti,sn75lvds93 # For the TI SN75LVDS93 FlatLink transmitter
> > >            - const: lvds-encoder # Generic LVDS encoder compatible fallback
> > >        - items:
> > >            - enum:
> > > -- 
> > > 2.47.3
> > > 
> > > 
> > 
> > 
> > Hugo Villeneuve <hugo@hugovil.com>
> 
> 
> -- 
> Hugo Villeneuve
> 


-- 
Hugo Villeneuve
