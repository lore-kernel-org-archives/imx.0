Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841E43890FB
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 08:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611294; cv=none; b=kwoXzES+h1tODiWnBdJUP6RX9FEA8fK2ceyvrDTlGugf7r7W3ENQwtby4XuY6ykRxun/vIEbbu6ipvnSkKb1TEKUtKA0saezVaCqIaqxAJNhrk1ayKwNebVvjbvYSnrAX/Kz9nVqTNhKD2pw4c8HBZ4uqPVI3o2fe/tHozx837A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611294; c=relaxed/simple;
	bh=4fX78MIcE7tbm3F+4FhgdlR2KoXjcbcAT2iiQLrMxQA=;
	h=Content-Type:Date:Message-Id:Cc:From:To:Subject:Mime-Version:
	 References:In-Reply-To; b=WSt1pLMe6ZAqU8cqQ2M6oSeox9ANgGYt/Kryo2mYR8Xo3QnATGOimMMyUUDx2OfKesVpgWDOXXtIUqjI2Fv1l8iy5uCu4DfQP5f7rw7KHN+/CJH/QpLBN+t2n5G2ExSAnw4KiV0nRsedLQrYB4Q+1oZ4hh+ZLQXj09TM2J7pq3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sEfJKaEN; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sEfJKaEN"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CAAE74E42531;
	Wed,  4 Mar 2026 08:01:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98F0D5FF5C;
	Wed,  4 Mar 2026 08:01:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B9B810369414;
	Wed,  4 Mar 2026 09:01:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772611287; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EUWq5kpBIjsc0+kAM5GMY0X+W2LCngNN6LmjmMbSbKA=;
	b=sEfJKaEN0ReR/PcKLCvhIin7UaqONdSGTccrky3vrUuXx1S+uI3hVV8kw1lhdbSmiSvb8n
	7eAZy5FGo8RTXiMTycVYB/O1IZ8HyFZ1fObyINHKAAWCZ75WNY3XpD2zS67JfzKUDbZByd
	oeoX/SbQUvv6tn36HHgjOecMSgQIovWqIQdQlhi0XhBVD6NAfnSOLP/qN123etXDHZjk9g
	wEAquxlveb/dWrboNrT0UrC+g2a1yKDbzDyqyhuG13xuPh3gH8+YSpMJckD8hJMEURWaZ2
	HfVM8VIjyEtyz2QdB5MyPEmPuEzk04gZVU0SFxBd5QqDEgue9bnuJmZB+o8DqA==
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 09:01:20 +0100
Message-Id: <DGTU9887GHPO.2FUQ3QITRG7F8@bootlin.com>
Cc: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
 <festevam@gmail.com>, <shawnguo@kernel.org>,
 <laurent.pinchart+renesas@ideasonboard.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, "Hugo
 Villeneuve" <hvilleneuve@dimonoff.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Hugo Villeneuve" <hugo@hugovil.com>, "Frank Li" <Frank.li@nxp.com>
Subject: Re: [PATCH 08/14] ARM: dts: imx6ul-var-som: factor out SD card
 support
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260302190953.669325-1-hugo@hugovil.com>
 <20260302190953.669325-9-hugo@hugovil.com>
 <aaX5E7-3xvkaVV-o@lizhi-Precision-Tower-5810>
 <20260302161545.f6b76209400e8fbe35cd51a0@hugovil.com>
In-Reply-To: <20260302161545.f6b76209400e8fbe35cd51a0@hugovil.com>
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On Mon Mar 2, 2026 at 10:15 PM CET, Hugo Villeneuve wrote:
> Hi Frank,
>
> On Mon, 2 Mar 2026 15:54:43 -0500
> Frank Li <Frank.li@nxp.com> wrote:
>
>> On Mon, Mar 02, 2026 at 02:03:44PM -0500, Hugo Villeneuve wrote:
>> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>> >
>> > Move SD support to a separate include, since it cannot be used at the
>>=20
>> s/include/dtsi/
>
> Ok. I will also change it in all the other commit messages.
>
> =20
>> > same time as the Wifi/BT module.
>>=20
>> what's relation ship between wifi/bt? you just move sd related part to a
>> dtsi file.
>
> As stated in commit message, the SD card interface cannot be used if
> the Wifi/BT module is in use.
>
> Sd card is not mandatory, for example on our board we do not have it,
> so we need to have it disabled.

My two cents: if SDCard and WiFi/Bt support are the only mutually exclusive
features for this SoM, then how about the following organization:

Three SoM dtsi files:

imx6ul-var-som-common.dtsi

  imx6ul-var-som-wifi-bt.dtsi:
    #include "imx6ul-var-som-common.dtsi"

  imx6ul-var-som-sd.dtsi:
    #include "imx6ul-var-som-common.dtsi"

A common concerto dtsi file:

  imx6ul-var-som-concerto-common.dtsi

Separate concerto dts files:

  imx6ul-var-som-concerto-wifi-bt.dts:
    #include "imx6ul-var-som-wifi-bt.dtsi"
    #include "imx6ul-var-som-concerto-common.dtsi"

  imx6ul-var-som-concerto-sd.dts
    #include "imx6ul-var-som-sd.dtsi"
    #include "imx6ul-var-som-concerto-common.dtsi"

And possibly the following one to avoid breaking compatibility:

  imx6ul-var-som-concerto.dts
    #include "imx6ul-var-som-sd.dtsi"
    #include "imx6ul-var-som-concerto-common.dtsi"

In any case, the imx6ul-var-som-concerto-common.dtsi should be full-feature=
d
(and thus avoid the imx6ull-var-som-concerto-full.dts file from patch 09/14=
), if
that's possible?

But I don't know if this follows common practices, and if this is possible,=
 but
I think it's clearer as a user to know if the DTS I will use will support
WiFi/BT _or_ support SDCard by looking at its name.

Of course this is based on the assumption that those two features are the o=
nly
mutually exclusive ones.

What do you think?

Antonin
