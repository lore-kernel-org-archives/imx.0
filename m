Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963D2402B83
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 15:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774540372; cv=none; b=EuUONYuDc1KFS6noAil/Z6q9+BoPz+KWiCKi868QE83s89FnUfincf1mn8/VF199N15MgdRUtO/hAWKD8cutrwRQYZIcPnx+K5NFFP15vCVFPZAmFAC/sd0YiYdv0JIENaNjLJePfLyYPee9023Z/vKe5pYZhOKhWdqCZHoSahs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774540372; c=relaxed/simple;
	bh=JwITcv2kKeMkRaKZERaWtV5p1TZQoN4amNUvBQPTTtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUPe861QXjvj9WOKyUvuVhTZ14YVAS90m2TJ7f6wEmCkES65peJDy+N5LaT4HF1p2H4lTtn9VtWf5ympY6kA7tPRb+uvQgLvUE7Y8YtHl9DwjOvPdMsxtpGyL19AmWtA3paQNl3HIzlOUF27GYBbmRMhaBAXglS9DW0MBGBL9wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTMw/WVP; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTMw/WVP"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso737784f8f.1
        for <imx@lists.linux.dev>; Thu, 26 Mar 2026 08:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774540369; x=1775145169; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SQ1hDzJlfrRklF9YY8ud/90bJ0SI0yIhi54T9lEnFo4=;
        b=iTMw/WVP5fhdC+ZgIKUJBnfqQ6mxVc8xc3WGiINdi/5H9RGUYtMDgtgoujrYGRU4fV
         Ms1VA+2a+AZiJdxcTFzAxDZh4TBgZp2aRS+RPF5L3mv9U3DmD8nwmvO+AXWZFu6euwmI
         o0zThVVc51OVFZzNj8ZKaTKef7efuZkU/QurSlfoFoM75W7fBhDrlWg2aSy9eXQWGTDv
         jb4a/jDVsn4gikxNLv07kb8aYY28IPE26JqpkZp42V1oKkIx2mLQnixXP8n1HpmTiOM5
         uPdt+InD1DCA3cwaOZih2MMbVRxl2cId5IqxlqG9w0x5ieaHoUEwstEsd6YMPAFayY5N
         xf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774540369; x=1775145169;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQ1hDzJlfrRklF9YY8ud/90bJ0SI0yIhi54T9lEnFo4=;
        b=kT0kjpeW7mYw7xAv+SB7LceidXc1ZiK+ogLlXh+VIyE/ksYSK5xIGJkrU5/DQFYqYy
         C4g8M4MNXyzsY9Tr9BZw+rNub9Yh6V8Y8qNzfij4G3gwyK7V0vRlj71Ma+KBcgo/A+9p
         lgSYfEYCoHv5tsqW7nTQ8rTucEelnAtjR4RTNR9BQj3HkkXLw8GMbkW5RtGkogiKXGiS
         NKbILLAaYjyCSyMY2eQcwy4IIlU13DswM3z0WsKYwF6zO7NJJwZwLZ69AlKe9mhZTZ87
         q82axbVCO0d9NQPJmzxoSn5xpzVFe8W3tAv7Gri2uI0xfYKuVy3zcU63oYysJie2pqb9
         HoiA==
X-Forwarded-Encrypted: i=1; AJvYcCVOKU+7j8IyuR8tuQLFu/qzgXWKIFjhSiQIKOl8Mxzz52yrms8ICPU4PXtmHFjH0PIYyaM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGMk3gqYr6LEH/sUnKPtqmkQnqB+LGBWCwcVwXbHpOaRAq4+g6
	aPNbmFrMuMkKGAvBu1gCmYQ6QskU75MWzTZjozd9CIgU2pXiEoiTRF8B
X-Gm-Gg: ATEYQzy5P+KDhdpzu6nAyjPgjGupthb7SK/W988FpxlMiqmHLv4UtIKt+6lqR+xBXor
	I7hXfLf38SNf0MOOGC/WMp+Np0n5nJxKX/K6IgAPIxEhIqNCmSiknvo2vPD3HMnZmrx7QzkSX38
	vgEnT/TWc9Uwfoguys//A9yRxVkKHxmMl2EaRsx6bWbQ/kJcdf1ApHIx2+6sFAz5klqnkilsQtO
	/GE7fROt7oS9KX/OuIrbj77mj+c1BExDM8tXoYkawmZn/+0owvt3YDbYcodU7Kdc1akND0gOS94
	DjqMBAEgZCvsTdn0ng+yp1Pts/NoiVs/jbvqSUNOzwPiksyaVy5isJKeD09wJTOlcllrBY0Smw8
	Wyf6GXNhIqUKtFaCRSYhvHFA1kFVEJVXOzkHxEFFrnpyumbc4GgGvaotCpWQd78cdS9Lnx9k/KS
	Ns9MeOQbhVuWIbfWGaog1jnQSV8qq/KrYVr32gMbg2OW+ezxwUme6PEoWLj8tvGmNEc8C2ZGrJU
	E1C+wjZN35hcZUhHmWNE6UQx87LvXEx8+gFf3liKLrYsABjgp03YVTmsFdfFOz8DI8AseEVzg==
X-Received: by 2002:a05:6000:18a8:b0:43b:464a:28de with SMTP id ffacd0b85a97d-43b8899cdb7mr11877706f8f.14.1774540368645;
        Thu, 26 Mar 2026 08:52:48 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf5aesm9975594f8f.24.2026.03.26.08.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:52:48 -0700 (PDT)
Date: Thu, 26 Mar 2026 16:52:47 +0100
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Francesco Dolcini <francesco@dolcini.it>, 
	Manivannan Sadhasivam <mani@kernel.org>, Frank Li <frank.li@nxp.com>
Subject: Re: Clear CLKREQ# override breaks functionality
Message-ID: <35zryv5twyy5qzqlfyebnfqllm6xbosxn5h2qlkibvxqogmzix@svk73dvj4tf4>
References: <jfefktil6ywvugvbxdplbvry6g5efka5g4bpr2dwhha2mtrkm5@6gkcmj2glvwo>
 <AS8PR04MB8833063C53B769C0ACB086958C56A@AS8PR04MB8833.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8833063C53B769C0ACB086958C56A@AS8PR04MB8833.eurprd04.prod.outlook.com>

On Thu, Mar 26, 2026 at 08:17:29AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Franz Schnyder <fra.schnyder@gmail.com>
> > Sent: 2026年3月26日 16:00
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: Franz Schnyder <franz.schnyder@toradex.com>;
> > linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > imx@lists.linux.dev; linux-kernel@vger.kernel.org; Francesco Dolcini
> > <francesco@dolcini.it>; Manivannan Sadhasivam <mani@kernel.org>; Frank
> > Li <frank.li@nxp.com>
> > Subject: Clear CLKREQ# override breaks functionality
> > 
> > Hi Richard,
> > 
> > While integrating the `supports-clkreq` DT property on our iMX95-based
> > SoM, we had failures in our CI on one of the two M.2 PCIe slots on our
> > development board.
> > The failing slot uses a card that does not advertise L1 PM substates.
> > This issue comes from commit a152a90f5390 ("PCI: imx6: Clear CLKREQ#
> > override if 'supports-clkreq' DT property is available"), which clears the
> > CLKREQ# override based only on the DT property.
> > 
> > It seems that clearing the CLKREQ# override should happen only when the
> > driver knows that the downstream device advertises L1 PM Substates.
> > Otherwise CLKREQ# should remain asserted to keep compatibility with cards
> > that do not support L1 PM Substates.
> > 
> > Thoughts?
> Hi Franz:
> No, CLKREQ# is not dependent on L1 PM Substates capabilities.
> 
> According to the PCI Express Card Electromechanical Specification r6.0,
> Section 2 (Auxiliary Signals):
> 
> "CLKREQ# (optional) signal is an open drain, active low signal that is driven
> low by the card to request that the PCI Express reference clock be available
> (active clock state) to allow the PCI Express interface to send/receive data."
> 
> When the 'supports-clkreq' property is present, it indicates that the endpoint
> device supports CLKREQ# signaling and will actively drive the signal low when
> it needs the reference clock.
> 
> Therefore, the RC (Root Complex) controller can safely clear any CLKREQ#
> active-low override settings, allowing the endpoint to control the clock
> request through proper CLKREQ# signaling.
> 
> If the endpoint devices on your platform can't drive the CLKREQ# signal to
> low, remove 'supports-clkreq' property from your board's device tree file.
> 
> Best Regards
> Richard Zhu
> > 
> > Kind Regards
> > 
> > Franz
Hi Richard,

Thanks for the explanation. I managed to find a PCIe specification, and
I can now see that my assumption was wrong. The L1 PM Substates mechanism
requires CLKREQ#, but not vice versa. To be safe with cards which lack
support, we'll just remove the 'supports-clkreq' property for now.

Kind regards

Franz
