Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0120E235359
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 18:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739815862; cv=none; b=Vc2iBbzVvxBYrC7+sQpfRmgNF0SRt3967GTyT3hBiuWqbzQ09C14i/IhMs+KrLgcVGuQuDwYCbat/reqyS9OsK5hyZb6JgLi33WrSrvRLL//UBuBxni0vifYxSyrU6KqRaYxDG/9dSVF2bgEdsk8UFL6NQNJy8HP5g0q/vNoAAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739815862; c=relaxed/simple;
	bh=+LVuhMm4/4IRWnEOXMkAQzqq62/PlHDeymErvUeBidk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AQWohsOhE9BSjZtVqnQTJlaDHcZaj1gCwTTd7ExwhP7nyzVOe3Dwh/Mw4nSVHii5Y2AtUgWC1WCPGmmAa25La+uH9tT8QBh8oMIW4ULYFYVQmQu1G/VOifKdrHaxriG+90IssMqmpn66ekOFxSNdoBWw+yJhXwRAWzCr+wZLZG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qNao50g5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qNao50g5"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so31899065e9.1
        for <imx@lists.linux.dev>; Mon, 17 Feb 2025 10:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739815858; x=1740420658; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WYdQMpmWfwfRPZrNOq/JI6U8Fyr73ByGTD+9Af1nU7I=;
        b=qNao50g52mDxlvRgr6kZ+k/AeXX26E9WPvo20SIL6SROeltkyuxaAKNtbD3zXeTlaA
         v4Blud6s2eRxLANOMVFzycVdausZ4UNY44OigHKYzE8XX7swbiV5aCAftoI6JUpRRhls
         yazUC1BRc+/iCANgnzIFUjf8DMOhMLEsF7rYpRJp3pQNd5zbiH9VXYxEjC/8Cog3Q1dD
         F2mk9B6FvhEEu0EgYLhEFbsm0R6yNtO+pJBmyK26jZUfn5Gs+MbWnlYLsweep6KCNBk2
         u5WHFRCpyZ5/arWMvfOz245xX9X91gNe4G2W4RTmad+MCeep0YbQjDXzLSluqfF5ptrF
         x/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739815858; x=1740420658;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYdQMpmWfwfRPZrNOq/JI6U8Fyr73ByGTD+9Af1nU7I=;
        b=m//hf+6OFHRtFd7dy9uV0mrE63GrauKqRqrNSyam8yY/AB8MpbhNJLVhPdJ5Tmb1x6
         j2roKZbjsyIK7Ue9ha2e0awt4MaOSnrgx+pbJ0JxLTTGrGaNz767BiPtKOdIeBbEywLj
         jFGRFfSBaWq7Sf/4kG10xEQOfJic2nKdiG0YkoX9SR3xTEyKocY+HVLihG1dlaAINC5k
         xcXQ++Whu0rQMW/uDB9E36BtvS6gyAEx7vx1X5VhNeqRGjdeYuUOHv2CGCyXsooIcYQG
         NKbdpVXOgfMib3+qfB3+AijzUFgQk2RMrld9BJiCixF7VAOqGIAQGyrUtY6qXDFU7QWW
         hCFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAZSxjIzyAn6Oxxu7CuxUsZ3fJoya/akkihXTXeN8B00r29qV56DYRKc1y7Eyi4cZ2TuQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQjnIzLbwyVXAJX19A2/+yz8dMgjr8hP3Ee9uO7bsQqNlc5nxm
	PoW9mLgKQOi2olmoLdpMjtGS/xPk4/WVE6jxE0kaLokyG1rhKMR6+dcTb2Z+5dU=
X-Gm-Gg: ASbGncttMFmzT+oEyvnBHgsTg8O8OHQiY3aDUCvkv17tkcAp1i78+aSTCarBLmV4Jfi
	j3No5i881at4kTJpR2GHCF9hVcouLkovuQg6O64O+Eh5cuRT+cHUjvvrQBk/7ILT8G/nvsDfw0a
	2JTCk+7tn7ET28+mLE1DnbG/8jZuQNI4BxvCnofVaGyThcNqxFViy9AXkn5gtE59bKxXzVCrLGz
	FKle1hK/2Tfl5HhRaULSVSiapvLuEbJzn42wEPB51o+pSV6KsB3g7dqOwCyTSsPhD7YNHithmju
	sTMPWvTolQQRRw==
X-Google-Smtp-Source: AGHT+IFTAKZ9BquOVY29sEYMChLDnuqHcqVlSqR4NiZlMjD4bUMe9qRI5EU9r/6iyIf02WCX+Y2KzA==
X-Received: by 2002:a5d:4cca:0:b0:38a:2b34:e13e with SMTP id ffacd0b85a97d-38f33f28c01mr7768806f8f.18.1739815856721;
        Mon, 17 Feb 2025 10:10:56 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:a529:8667:e9bd:7f7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4395afaf052sm155075695e9.13.2025.02.17.10.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 10:10:55 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,  Ira Weiny
 <ira.weiny@intel.com>,  "Rafael J. Wysocki" <rafael@kernel.org>,  Stephen
 Boyd <sboyd@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,  Danilo Krummrich
 <dakr@kernel.org>,  Conor Dooley <conor.dooley@microchip.com>,  Daire
 McNamara <daire.mcnamara@microchip.com>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Douglas Anderson <dianders@chromium.org>,
  Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 1/7] driver core: auxiliary bus: add device creation
 helpers
In-Reply-To: <2025021501-tamer-sank-142a@gregkh> (Greg Kroah-Hartman's message
	of "Sat, 15 Feb 2025 07:53:12 +0100")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
	<20250211-aux-device-create-helper-v3-1-7edb50524909@baylibre.com>
	<2025021437-washout-stonewall-d13e@gregkh>
	<1jwmdsxugx.fsf@starbuckisacylon.baylibre.com>
	<2025021501-tamer-sank-142a@gregkh>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Mon, 17 Feb 2025 19:10:54 +0100
Message-ID: <1jikp8xx01.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Sat 15 Feb 2025 at 07:53, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

[...]

>> 
>> >
>> >> +							int id)
>> >> +{
>> >> +	struct auxiliary_device *auxdev;
>> >> +	int ret;
>> >> +
>> >> +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
>> >> +	if (!auxdev)
>> >> +		return ERR_PTR(-ENOMEM);
>> >
>> > Ick, who cares what the error value really is?  Why not just do NULL or
>> > a valid pointer?  That makes the caller much simpler to handle, right?
>> >
>> 
>> Sure why not

I have tried the 'NULL or valid' approach. In the consumers,
which mostly return an integer from their various init function, I got
this weird to come up with one from NULL. EINVAL, ENOMEM, etc ... can't
really pick one.

It is actually easier to pass something along.

>> 
>> >> +
>> >> +	auxdev->id = id;
>> >> +	auxdev->name = devname;
>> >> +	auxdev->dev.parent = dev;
>> >> +	auxdev->dev.platform_data = platform_data;
>> >> +	auxdev->dev.release = auxiliary_device_release;
>> >> +	device_set_of_node_from_dev(&auxdev->dev, dev);
>> >> +
>> >> +	ret = auxiliary_device_init(auxdev);
>> >
>> > Only way this will fail is if you forgot to set parent or a valid name.
>> > So why not check for devname being non-NULL above this?
>> 
>> If auxiliary_device_init() ever changes it would be easy to forget to
>> update that and lead to something nasty to debug, don't you think ?
>
> Yes, this is being more defensive, I take back my objection, thanks.
>
>> >> +	if (ret) {
>> >> +		kfree(auxdev);
>> >> +		return ERR_PTR(ret);
>> >> +	}
>> >> +
>> >> +	ret = __auxiliary_device_add(auxdev, modname);
>> >> +	if (ret) {
>> >> +		/*
>> >> +		 * NOTE: It may look odd but auxdev should not be freed
>> >> +		 * here. auxiliary_device_uninit() calls device_put()
>> >> +		 * which call the device release function, freeing auxdev.
>> >> +		 */
>> >> +		auxiliary_device_uninit(auxdev);
>> >
>> > Yes it is odd, are you SURE you should be calling device_del() on the
>> > device if this fails?  auxiliary_device_uninit(), makes sense so why not
>> > just call that here?
>> 
>> I'm confused ... I am call auxiliary_device_uninit() here. What do you
>> mean ? 
>
> Oh wow, I got this wrong, sorry, I was thinking you were calling
> auxiliary_device_destroy().  Nevermind, ugh, it was a long day...
>

No worries

> thanks,
>
> greg k-h

-- 
Jerome
