Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41382200BA4
	for <imx@lists.linux.dev>; Wed, 27 Nov 2024 19:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732735896; cv=none; b=Y+QCNZkJeJdnzXjccnO1ZahRnYu6YesdC3r5/ZkuQM98NGO7/bRCZQj5sN/mB80hM3yfX83NX5wDw/lneltn3eYE7VJXg0jhL2X+TJF2d3ppOnOfbAswIkAJo6/1NVzkpRfZBeJBxvY5+e9OJCqbzA7O8c+d1dfCSqNoWMhazAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732735896; c=relaxed/simple;
	bh=AAgJwSV0mVzTCYsU8hvaJ9VvJZzKOykSTytAQPu8r04=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=SFFIfLjqscPdCWV0b6LxLcMi78Xjr9ZEd4RtERLCuPVLHIXjnu+YyvhXZSj9GBdyd0EGERj6lZR9ZpIIB5p/zBXlCu+KIwunLn4lh2PehFAU+qlqe9pGXBkPKg5fJLr6P5ItIquw7lRmb05XiUIe+TCUPBrVyOdChk8PxYiDIgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=siZX0ijy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=2+JaBt9x; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="siZX0ijy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="2+JaBt9x"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 4AAF113801A0;
	Wed, 27 Nov 2024 14:31:33 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 27 Nov 2024 14:31:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732735893;
	 x=1732822293; bh=+g141tCONTqB5hpfb+ItfP7sq5bc8beb7Ysknq11Dyc=; b=
	siZX0ijyS3KKZQCQM11sRK0aYL/UGLpWhzzNoHuhzO9W2scObICm0ksLv3/1yCfV
	WekG2ob/DsOMJvkCJhpw59Z91c5gjT7/Hr1yLXGM3cZYsWVfyzxrOmUQu27YwCC4
	ZZ5tgKl8RJBC0L2qgFANSSiYCxDiroZInomlUPIiPwN6v6E0if2v6UAf2Vyu3Cit
	MbpbrtvrgEklRco0Bbk/+Ug/j8qawVqgW1hB7OmebHKcvmWIbThrmcg1hEtCkdy3
	3P4OJjlBpi5S1d8Ey/7b1CiLix44Zl7zE07Pk+yCDwKS/LlU0jLeBEZHG6ftf2Es
	4l1ECrUGI0xSUL/H1P9AJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1732735893; x=
	1732822293; bh=+g141tCONTqB5hpfb+ItfP7sq5bc8beb7Ysknq11Dyc=; b=2
	+JaBt9xs18XWLsAsQ+VisxWQtvO2htE5bTFmB49/EBkz/pJKBa4LH+63jf40WmXK
	YVyAtYofNRfrLkfFZoBBC69LAjULnPC1fJSopQXuYBFHSXG+NWYmUP/OqSMD26El
	x/wN9s4hkj/CgQZrHc0cN0Hhw+QPIYYA27+OdyzTMFN7aFaaXZQPxfV+kDL72IqO
	1kKmVXCk2pc38sXxNtw1pbEUUqckYuH8Z8B3c/UP7muzErSXMkdqcCxcFgtyvmPs
	nQmsOWOHGWtnG3hoxt5orEzcSOr+gPVHh0gu+5McRpxzy6+KfCZbpdb8kc/lvEmX
	zNJKC1/M4kLPGlzgBTh1Q==
X-ME-Sender: <xms:lHNHZ2M3pV3CO9sxbtRIO-ydbzLs-oGasGR6gaCS_w9x-p8ex7n-dA>
    <xme:lHNHZ0-jVYAkQkFl9EmMuU75hN57JMA8yOuRNyVOz8uIBiFFNeTzfsDeMJR0usHHm
    K5rljsq7l9FB8DWQi0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrgeelgdduvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeek
    keelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghr
    nhgusgdruggvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehf
    vghsthgvvhgrmhesuggvnhigrdguvgdprhgtphhtthhopegvshgsvghnsehgvggrnhhigi
    drtghomhdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphht
    thhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhush
    drfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqrghr
    mhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    epihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehsrdhhrghuvghr
    sehpvghnghhuthhrohhnihigrdguvg
X-ME-Proxy: <xmx:lHNHZ9TaY5tMEt0Ui0Dot4mCBCtUO9P_ld7HATWIcAkYpw29Z06dPA>
    <xmx:lHNHZ2sQcrgJVpCZTa7eHzLLyAvJn3F472FTnKiZmIetMyVV7fdWIg>
    <xmx:lHNHZ-fjOCzxTyxuf0bZWQSbCTvmkextzTW8FxTOKRIZOIOIsYEyCg>
    <xmx:lHNHZ60v1dz30FzdC7rla7_oL4y7H_RbrZlRWas8VAVKhGB6DvI5NA>
    <xmx:lXNHZ-4hqGZTt3JHMK7QxYK5TEXZ_OB_8VcxGo4iGfsvd9bB_Y3Aj6VB>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 314472220071; Wed, 27 Nov 2024 14:31:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 27 Nov 2024 20:31:11 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Fabio Estevam" <festevam@gmail.com>, "Shawn Guo" <shawnguo@kernel.org>
Cc: "Russell King" <linux@armlinux.org.uk>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Esben Haabendal" <esben@geanix.com>, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, "Guenter Roeck" <linux@roeck-us.net>,
 "Fabio Estevam" <festevam@denx.de>
Message-Id: <f65d65b3-b60c-4c5c-a002-81370821ee1f@app.fastmail.com>
In-Reply-To: <20241127190605.1367157-1-festevam@gmail.com>
References: <20241127190605.1367157-1-festevam@gmail.com>
Subject: Re: [PATCH v2] ARM: imx: Re-introduce the PINCTRL selection
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 27, 2024, at 20:06, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
>
> Since commit 17d210018914 ("ARM: imx: Allow user to disable pinctrl"),
> the CONFIG_PINCTRL option is no longer implicitly selected, causing
> several i.MX SoC pinctrl drivers no longer getting selected by default.
>
> This causes boot regressions on the ARMv4, ARMv5, ARMv6 and ARMv7
> i.MX SoCs.
>
> Fix it by selecting CONFIG_PINCTRL as before.
>
> This defeats the purpose of 7d210018914 ("ARM: imx: Allow user to disable
> pinctrl"), but it is the less invasive fix for the boot regressions.
>
> The attempt to build Layerscape without pinctrl can still be explored
> later as suggested by Arnd:
>
> "Overall, my best advice here is still to not change the way
> i.MX pinctrl works at all, but just fix Layerscape to not depend
> on i.MX. The reason for the 'select' here is clearly that the
> i.MX machines would fail to boot without pinctrl, and changing
> that because of Layerscape seems backwards."
>
> Fixes: 17d210018914 ("ARM: imx: Allow user to disable pinctrl")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: 
> https://lore.kernel.org/linux-arm-kernel/49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net/
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Acked-by: Arnd Bergmann <arnd@arndb.de>

     Arnd
