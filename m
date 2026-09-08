Received: from flow-b8-smtp.messagingengine.com (flow-b8-smtp.messagingengine.com [202.12.124.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C6F4349B2
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 19:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788896614; cv=none; b=c4DO5IMmqNVeTyynkRD4TDKScrMEHOsGDUB0fotjftFq5oAiBXci6WD4+LyLrKfgtarTkMzYrl6+fccKNhjJyrea7hYHqlZVbmZXJElfGH7anb0R2hO4IVHDN3jE6hx9DmChTwbNmY0/M3MaDwp25zcJGTcCV8sjEA8kYquSK3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788896614; c=relaxed/simple;
	bh=xlqEswEziPGf0ZRlGaptPva6ELMXLnrVfl8OWXiHUlg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=CFjIOoyg3JsYAug5H5003ED5idhD9uxjNKonE9j27P6FhUbcqMhtSFmr2ZqOdOoQZ5kiJHmHaNcGAYYvY+3rGPFEdiMzRwUKPVn8hndNuiHxKoGvf6LTc6PFQXYHnHzcSIhOHmQN1AtZ/X6vIcMhqBE19zEi7h+htL2sE6C9kIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=X5LkevlL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pvZ5V3cV; arc=none smtp.client-ip=202.12.124.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="X5LkevlL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pvZ5V3cV"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.stl.internal (Postfix) with ESMTP id 0ADAF1300C33;
	Tue,  8 Sep 2026 15:43:25 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 08 Sep 2026 15:43:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788896605;
	 x=1788903805; bh=4IJjsl35hy6uWhJvFuqE8L4yxSGKu+5lpZymIsb8Msc=; b=
	X5LkevlLGq9hwbix4pFg7wOUqgYe4MxbEIW19xLFjKJrm3U/zgwZzFzztNtQUOBh
	RFtrQ64pKImJP00Et/2RAHViyAWPNjGoNOXGGXFn/GWtHYhp8++J6ek/B4+laPjv
	QKM6egjpTH2RBLgCwb4Lf6Y4byjkhTVD6N4UxoZ0NEovEHriYTQSAYPUhY//VhmW
	aXKzm4lxftMtoQrJ6OE4fJE8t+2IOjEfu4pqnbnRA/mVQoYEBrZw3F/ihwM42TLt
	fbjwxXFtFsOMmixbLAQfRpvpjuuPJrly1ovWZAaodEqn9QTYhIEMzBxkD5K7brC8
	s74uT0Oph1HGjtq0+W+0xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788896605; x=
	1788903805; bh=4IJjsl35hy6uWhJvFuqE8L4yxSGKu+5lpZymIsb8Msc=; b=p
	vZ5V3cVoyjNATgyblqyW6OoU5UVMW2sJt9Mv0Hb6dqkExYlcInH3dXxty2JJLrKa
	2L88Uh61zR29akIgJUY7R7UM32Kf9G5d/9EFsY4VFUPXih8BOHbjLg8Wwu6rVZyU
	8swdRGghSiq7Qd+OzlzDB8g2UFrhsdwPbIq7goKM0oljJLhBsBIW4woOtyJphPjD
	2Sgo6swnotWArYS56NuiVX1gzo3vvdjYBAFUsixfVlamrkCZgRSABhhEy79rGxGZ
	SzLkE9WBoSWAvgrz3RAldfQI4VNW4QyvLJjynLKHznjnv8WwuTnwDmGjhyasnNkV
	cdBJRmagCN9xNmqtOFNCg==
X-ME-Sender: <xms:TGWgaugDTuyvTPL-dn7pSrPgOLRTtR3TxBJ-vzxEv4GdIIhS9ALWpA>
    <xme:TGWgap3tKFpon6D5_zbOwa7Tbq-frSBILuWpi0aAVU25A_U91r_sShzlS_IpRx4uQ
    ao4VaRRG1Cj4GGDFM75cptsxkX9koy0IOSnleTJYP4enIxFdBKDBNE>
X-ME-Proxy-Cause: dmFkZTGLFhWYBtHQEXq81tVhy+uy/MhH0rumW3g0yZvcQsbh0yNyrcAK4KlJT0tiE7xHCS
    j4Ej93wV0cyqPDE7MbKgNUlNdDRaBReEAZ159s6i1PqLV4RtO/Pgki3pZYlW+lCD7zGKH8
    AitwYFf8Q6/NC4sGgmnKnkDBONHDG6eNN2foQMpVn9j3mlJwvgGPVqfdkID9U3krTwHfvT
    ugjSCsYNWzUA/PuLF2mMImuh9Z2j6SXIDdGhyoAc+33JWK2xZcJYtt3p0a1zuvJtxwR4MI
    uQoF3AohencpXK77GuBiwGyP352+M/K8OnHWjZgIBjVEA7Mz9bN85ENnEsE+DNTHLDfegm
    DsYkyMDgPUDBCPOplHS5/5v4VqNOe6rWbgdiL56qMt6BpO9lIHF5nx79cYjHP8FBAaYnFZ
    9kE4XKrlT1yg45pREJwLabRo9QbOlrDZygCRXcJgzflnXrSTk3hwfzlTMuRf0A4gE/xLbf
    MFltriCZ86x8E1vs7P3HvIZtQwI9XqRirk9SjIh4X5XaqibIi9gkzP1KT55V4YCcg3V10I
    l90Vj1l1xrd2bqBTskPcITG9ymdzIZU6yKr3VQE2V73/sMIF/fEePVedrYJqBNMGhEWIQu
    DXfQpryhjjRooduoa5pPnZ/3QCNk9GKLvJdiFGgqV2PFHh+gOHtLT2oVXY+Q
X-ME-Proxy: <xmx:U2Wgag68iOgFBZnMGoZdBybFhY13xhgPFcPnLmpv0rQmPCp0OotdJg>
    <xmx:U2Wgaj4tgVucIbKCwFlL1z4JpK4WXjI__dLdijbTtkqDze2cnT8pMg>
    <xmx:U2WgajysCDCx2ljtPUTHjTY_tAdeZfX-0eUJ5ru3Q1ejC0WdjQFvZw>
    <xmx:U2WgatVZoy_vZ2FQwK_rqWrVYin94ECpGT9zf2XRlTUd5dKMW17BOg>
    <xmx:XWWgaglMGEftEChcN2ZQ-BRA6p8EoT0iFpV0AKPEmXefACCdLfDIepXH>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 25BF232A0078; Tue,  8 Sep 2026 15:43:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: ABtt46vjHSU-
Date: Tue, 08 Sep 2026 21:42:42 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Karl Mehltretter" <kmehltretter@gmail.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Linus Walleij" <linusw@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Drew Fustini" <fustini@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Liviu Dudau" <liviu.dudau@arm.com>,
 "Sudeep Holla" <sudeep.holla@kernel.org>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>,
 "Vladimir Zapolskiy" <vz@mleia.com>, "Stefan Agner" <stefan@agner.ch>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Andreas Kemnade" <andreas@kemnade.info>,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Roger Quadros" <rogerq@kernel.org>, "Tony Lindgren" <tony@atomide.com>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Andrew Lunn" <andrew@lunn.ch>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Kristoffer Ericson" <kristoffer.ericson@gmail.com>,
 "Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 "Shawn Guo" <shawnguo@kernel.org>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Nicolas Pitre" <npitre@baylibre.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 "Paul Walmsley" <paul@pwsan.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Helge Deller" <deller@gmx.de>, "Tero Kristo" <kristo@kernel.org>,
 "Stephen Boyd" <sboyd@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org
Message-Id: <5c7ef711-0e5b-4006-831f-c1129acc65be@app.fastmail.com>
In-Reply-To: <aqBXOemS4boakDGt@gmail.com>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-7-arnd@kernel.org> <aqBXOemS4boakDGt@gmail.com>
Subject: Re: [PATCH 06/13] ARM: omap2: remove omap24xx support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Sep 8, 2026, at 21:21, Karl Mehltretter wrote:
> On Tue, Sep 08, 2026 at 05:27:56PM +0100, Arnd Bergmann wrote:
>>  86 files changed, 60 insertions(+), 10696 deletions(-)
>
>> -CONFIG_ARCH_MULTI_V6=y
>>  CONFIG_OMAP_RESET_CLOCKS=y
>> -CONFIG_ARCH_OMAP2=y
>
> With CONFIG_ARCH_MULTI_V6 gone, CONFIG_ARM_ERRATA_411920=y a few lines
> down can be deleted (savedefconfig drops it)

fixed now

>> diff --git a/arch/arm/mach-omap2/gpmc.h b/arch/arm/mach-omap2/gpmc.h
>> deleted file mode 100644
>
> perl scripts/get_maintainer.pl --self-test=patterns now warns:
>   ./MAINTAINERS:19896: warning: no file matches	F:	arch/arm/mach-omap2/*gpmc*

Ah perfect, I was looking for that command, and will check
the rest of my series now.

>> @@ -560,13 +533,11 @@ void __init pdata_quirks_init(const struct of_device_id *omap_dt_match_table)
>>  	 * We still need this for omap2420 and omap3 PM to work, others are
>
> Stale comment about omap2420

fixed.

>> diff --git a/arch/arm/mach-omap2/voltagedomains2xxx_data.c b/arch/arm/mach-omap2/voltagedomains2xxx_data.c
>> deleted file mode 100644
>> [...]
>> -void __init omap2xxx_voltagedomains_init(void)
>
> The declaration for this is still in voltage.h.

fixed.

Thanks a lot for taking a look here.

       Arnd
