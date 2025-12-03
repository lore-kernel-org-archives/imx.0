Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F1127A904
	for <imx@lists.linux.dev>; Wed,  3 Dec 2025 12:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764764349; cv=none; b=TdHA4nwwdu7ZYmoCHhmrGJpcTSzA9lX0yRamgG4Y1Wt8CadwrRjjxOQXny/4WrBcyzrylvUuEd5B01WGi34daNm37vzAyUevRCo9e7+UXZWfWUUayDPmlh5JMXbaPdYu186doV+O/oWBPSN/UGDs+WUM7kT+st6qEvUMy4ROvOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764764349; c=relaxed/simple;
	bh=c9qCQV2MwwHxy/d1vZt7uuMhVnvFVbsT7lephxyOpRo=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=pyNRjiYe4pLj8hlHpz7jFGuJdlhBOtDrdJIxFZ0VCZbH4ejGCto2lQqKoZrPOsV3jSmYDY2Yd4ertfkBeldmm9/ixNOTW7ii+5I5V1IMbYKQuYY11UEZgPY33Rs+pFfTgCaL+8UNv+FQr7VetvvvUnmDiYuOYgcjNkvOKlBRUtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FQmH4ocK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FQmH4ocK"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477770019e4so56761935e9.3
        for <imx@lists.linux.dev>; Wed, 03 Dec 2025 04:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764764346; x=1765369146; darn=lists.linux.dev;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1cAxsmEpFJXSScw6H8R77cdefHfZunUBKjjqkWhIJ4=;
        b=FQmH4ocKHYzMR1P2HFHTm5Er3zJhkgIf02gJNSfX9KXU73f9pRhGNBLZ8X690QXhcw
         dLwY6meQgnCN7k/SOPxuSqvQBi2+XuKCR2iAtSk11jgHFvqrhhHZIjIUOt701vesGpBy
         HbPfJUwygITnsr2bNOafRFlCvDiQjXvLPG7qIG8iqxTb+LSYqEvGF/UwhTPZWyhFZlyN
         pPmOICsJHYpvkSzLAsccJfjyMYrVVPM+5OmihCHkz7/6ZpxqFq3OUo6izf1ZP+ETskVB
         PoyEymGtoyfDsyuO7gUUpvRs467zSfOqfmrgoOdcqBYnuZRbg9D5UZOJ4sz4U2qjhSKt
         9QTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764764346; x=1765369146;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U1cAxsmEpFJXSScw6H8R77cdefHfZunUBKjjqkWhIJ4=;
        b=Ayr0uaIUJdc/E9rSHqK9cT4OfycYvZ6ovDcxYS664tTqsc3G0wlGtK3s3+uHQ6f1bz
         sNZOLuFltRHcbPoj0IxhwYphvcj4JxaXjByAkFo4iT1kYsn5QLnJsPH/UQ4x5l8A/TWf
         NN8VKI5FTqB1qqqaZckB9cCjnnXoRaJPCvBYLzwJ2ZmPNCq/cJdvjeF0758BmQnAkPH4
         dmlgqFKHwgXyi7Yj3m/UWd0TVbIkY7o4zRssNVSZ41zO2CsS2QXmX2TD1YahY0fla08s
         m19LZOsPKqGqYkh2afpd7rHEaSe9TwDgZRWOPkgBTS5hL93tjqN63pn3x9NYN+Kc7iN+
         q14Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkCzANXxI1g/Gm0lquZfn5mV+7Zsavh1H1F80d2QKbKhxHTXVgZGKg5IRqeasX7tNBZYQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQq7tqlsk/Y6KsE8v1eRtgiqlSV4zJcUNLK7HAj4TSUr/CGb/Y
	mp4T2b2pgVTi7xBgwvAPUaY75RgTIF9gD1bTNvoWwz1a9My2/56BZFrO84oexxO8S0g=
X-Gm-Gg: ASbGncvOhBy0Yd5izxf78IZKAAzZWzz057oDRFAz2GedXaXyItVgDcqaJZtlW+Z4EWv
	BNlRYKMq7eAhl82vdJcCnxI+6NhTAwAzo6/kdQpR3ysCA+aVmGUiJiM0Zu4jIeuEq6JGJvB8Hb6
	SC9te/Aew65w/LwF9eFlh52l7/dFK4MgqRRhRO/zwdX69TThWTc1Ll4OLWZzqeK7tVvUXzc0ElO
	fiuhQ90RXAgGaHE1gyNT8ZUeRpe50glHOYqWtPIjtUj9S6rV5n+/8sqJa3bgvUlozYS9t3+xKAS
	jfLKJ3ySvrXG+QyFHIkZZGmkM6lUddj0FcFVGUKm0KTGLdEHD3huKkJTCrpQ1bi27NqCI50HSaB
	1jlF7gkcpu1SmFOnJZ9jjY17FkhFEeDtnzlgj9BMcOk3jpiPUX2SDllRabqFn3NXlKyLfggOYej
	GtP2aRDqImuC+B6wU/8lC4aHOocTLa31gPpp1HJ8D1dKDybtleDE3u
X-Google-Smtp-Source: AGHT+IHHTbJIcnGQCc0utWINMQd+ZLj+OqfQUAbKCEsDG7jK0rWei2cfpyaMVepvuB3KAsYLzf4COg==
X-Received: by 2002:a05:600c:45ca:b0:46e:4a30:2b0f with SMTP id 5b1f17b1804b1-4792af486d7mr23114625e9.29.1764764345668;
        Wed, 03 Dec 2025 04:19:05 -0800 (PST)
Received: from localhost (a109-48-201-233.cpe.netcabo.pt. [109.48.201.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a8ccdfbsm47268455e9.14.2025.12.03.04.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 04:19:05 -0800 (PST)
From: Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Dec 2025 12:19:04 +0000
Message-Id: <DEOKQZMPDTLY.3H4NBUEC3LNHE@linaro.com>
Cc: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, "Hans Verkuil" <hverkuil+cisco@kernel.org>,
 "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Martin Kepplinger" <martink@posteo.de>, "Purism
 Kernel Team" <kernel@puri.sm>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, <linux-media@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, "Alice Yuan"
 <alice.yuan@nxp.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "Robert Chiras" <robert.chiras@nxp.com>,
 "Zhipeng Wang" <zhipeng.wang_1@nxp.com>, "Hans Verkuil"
 <hans@jjverkuil.nl>, "Sakari Ailus" <sakari.ailus@iki.fi>, "Kieran Bingham"
 <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v4 0/5] media: imx8qxp: add parallel camera support
To: "Frank Li" <Frank.li@nxp.com>, "Rui Miguel Silva" <rmfrfs@gmail.com>
References: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
 <20250805010822.GC24627@pendragon.ideasonboard.com>
 <aLbcpEZXm5G1Onq7@lizhi-Precision-Tower-5810>
 <20250902123920.GM13448@pendragon.ideasonboard.com>
 <aLhJDXnz9HPGrWcp@lizhi-Precision-Tower-5810>
 <aQuDSROHLGHIhtlh@lizhi-Precision-Tower-5810>
 <20251105171928.GB6046@pendragon.ideasonboard.com>
 <aQul/VGG8e3MJxhx@lizhi-Precision-Tower-5810>
 <DE1JMG95RZME.2YSV10RI9AME4@gmail.com>
 <aQzFiEOQvtZjHIsr@lizhi-Precision-Tower-5810>
 <aS9NvkAWTa42j7KW@lizhi-Precision-Tower-5810>
In-Reply-To: <aS9NvkAWTa42j7KW@lizhi-Precision-Tower-5810>

Hey Frank,
On Tue Dec 2, 2025 at 8:36 PM WET, Frank Li wrote:

> On Thu, Nov 06, 2025 at 10:58:00AM -0500, Frank Li wrote:
>> On Thu, Nov 06, 2025 at 10:34:48AM +0000, Rui Miguel Silva wrote:
>> > On Wed Nov 5, 2025 at 7:31 PM WET, Frank Li wrote:
>> >
>> > > On Wed, Nov 05, 2025 at 07:19:28PM +0200, Laurent Pinchart wrote:
>> > >> Hi Frank,
>> > >>
>> > >> On Wed, Nov 05, 2025 at 12:03:05PM -0500, Frank Li wrote:
>> > >> > On Wed, Sep 03, 2025 at 09:56:29AM -0400, Frank Li wrote:
>> > >> > > On Tue, Sep 02, 2025 at 02:39:20PM +0200, Laurent Pinchart wrot=
e:
>> > >> > > > On Tue, Sep 02, 2025 at 08:01:40AM -0400, Frank Li wrote:
>> > >> > > > > On Tue, Aug 05, 2025 at 04:08:22AM +0300, Laurent Pinchart =
wrote:
>> > >> > > > > > Hi Frank,
>> > >> > > > > >
>> > >> > > > > > Thank you for the patches.
>> > >> > > > > >
>> > >> > > > > > I've quite busy these days, and I don't believe I will ha=
ve time to
>> > >> > > > > > review this series before coming back from OSS Europe at =
the beginning
>> > >> > > > > > of September. Let's see if anyone on CC could volunteer.
>> > >> > > > >
>> > >> > > > > Laurent Pincha
>> > >> > > > > 	I hope you have good time at OSS.
>> > >> > > > >
>> > >> > > > > 	Do you have chance to review this patch?
>> > >> > > >
>> > >> > > > I'm going through my mail backlog, which is really big at the=
 moment.
>> > >> > >
>> > >> > > Understand.
>> > >> > >
>> > >> > > > I'd like someone else to volunteer to review this series. It =
won't scale
>> > >> > > > if I have to review all NXP media patches in my spare time :-=
/
>> > >> > >
>> > >> > > Yes, but none volunteer review this in passed months. Expeciall=
y key
>> > >> > > reviewer. I am reviewing i3c patches. but Not familiar v4l syst=
em yet. It
>> > >> > > need scalable solution. I can help filter some common and simpl=
e problem
>> > >> > > from beginning.
>> > >> >
>> > >> > Laurent Pinchart:
>> > >> >
>> > >> > 	Do you have chance to check this serise? this one should be rela=
ted simple.
>> > >> > 	This one sent at 7/29. Still not any volunteer to review it.
>> > >>
>> > >> I'm afraid I won't have time to review this for the time being. My =
spare
>> > >> time is already exhausted by all the other drivers I maintain upstr=
eam.
>> > >>
>> > >> > 	How do we move forward?
>> > >>
>> > >> I think this is a question for the subsystem maintainers. Hans, Mau=
ro ?
>> > >
>> > > Mauro Carvalho Chehab and Hans Verkuil:
>> > >
>> > > 	Laurent provided great help about review and land i.MX related
>> > > patches in past, who are quite famillar with i.MX chips. But he is q=
uite
>> > > busy. So the whole reviews cycles takes quite long time and offten c=
ross
>> > > some merge windows.
>> > >
>> > > 	In pull requests for 6.19:
>> > > https://lore.kernel.org/all/4989c563-47f4-478c-80c4-41f7e98597e4@ker=
nel.org/
>> > > only 10 patches, and 4 patches is trivial clean up.
>> > >
>> > > 	In reviewing patch queue, there are
>> > > 	1: media: nxp: imx8-isi: Add ISI support for i.MX95
>> > > 	   https://lore.kernel.org/imx/20251105-isi_imx95-v3-0-3987533cca1c=
@nxp.com/T/#t
>> > > 	   This one already review, but I am not sure if it capture 6.19 cy=
cle because
>> > > PULL-request already sent.
>> > >
>> > > 	2: Add MIPI CSI-2 support for i.MX8ULP
>> > > 	   https://lore.kernel.org/imx/20251023-csi2_imx8ulp-v7-0-5ecb081ce=
79b@nxp.com/
>> > >
>> > > 	3: media: add imx93 mipi/controller csi support
>> > > 	   https://lore.kernel.org/imx/20250821-95_cam-v3-0-c9286fbb34b9@nx=
p.com/
>> > > 	   This one is quite big, but first 10 patches is simple trivial cl=
eanup patches.
>> > > 	   I post at 8/27, but get first feedback around 10/27, I am not
>> > > 	   sure if missing somethings.
>> > >
>> > > 	4: This series, laurent already said no time review it.
>> > >
>> > > 	5: ap1302 sensor patches
>> > >            https://lore.kernel.org/imx/20250811-ap1302-v4-0-80cc41b9=
1662@nxp.com/
>> > >            binding already ACK, most maintainer want to pick binding=
 with
>> > > 	   driver together, but not an feedback since 8/11.
>> > >
>> > > 	I jump into and help do some review.
>> > >
>> > > 	The questions is how to move forward pending patches, like [3], [4]=
,
>> > > [5]. How to keep good community channel to avoid long time pending?
>> >
>> > Sorry, but like Laurent I am really without spare cycles to go over th=
e
>> > patch series that have arrived in media (also I do not have any hw any=
more).
>> > So, Frank or maybe Laurent knows someone that would like to be add als=
o as
>> > maintainer of this drivers for me would be great, that would also help=
 to
>> > avoid such bottlenecks.
>>
>> If there are not other candidate, I can help maintain it although I am m=
ore
>> familar with dt binding, i3c and dmaengine. I can start from simple patc=
hes
>> and we have test team to help cover testing on the real hardware.
>
> Rui:
> 	Any update? How to move forward? It was already passed more than 3
> month!

Sorry, I did not realise something was blocked because of me, specially imx=
8
related. I thought you have sent the update to MAINTAINERS.

For me it is fine, it makes perfect sense since you have access to hardware
and documentation, for you to be the maintainer and steer the features and=
=20
improvements in the imx media. you can move me to Reviewer, since there are
already other 2 persons (and Laurent already handle the pulls, thanks for t=
hat)
much more active in the IMX media subsystem.

Thanks again and Cheers,
    Rui
