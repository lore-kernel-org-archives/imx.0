Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1AE26A1BA;
	Thu,  6 Mar 2025 17:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741281772; cv=none; b=L3O5R0oIMRCwU55amr32DgSoiaA0mkG3GzVbFQU9f0ArWBEMAdJTZ99+Jpx0+55sN9IXfO7vkK2UtRwm/8QkSb4K7PUA6bdmbUJHH6LgrivjY2l9OE9AbJTL22RDgJmKdt9ng3QocBtXGoEuEcCDxrBCecKHgNhN+QqRqKhUP1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741281772; c=relaxed/simple;
	bh=8MDbostjxGfBi/qDdO3rFCsLUo6pHB2J+hQRBUW4lyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7BJCFNOrg+ehr5kIPz2fJMSM1Ic/8UqXgw3e24wDWAWjIILdh06UEltA1C0ezOY9vd9c8ETYO0a0LUZUpbmtDXUAeLe/HemGwBHMAh4tNCeB5jXxI9RPUVMriVUaVQEqbFnnzNNYivaqG+CsNGQSxstmuqOstU/AqxmjtGz4ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NEjCBiDk; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEjCBiDk"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-223f4c06e9fso18897535ad.1;
        Thu, 06 Mar 2025 09:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741281770; x=1741886570; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRtVMgZ55zLMGI/NlOCcgv9aGOQgHktJls4Rai2LzFE=;
        b=NEjCBiDkm2SvHxsHhXA+8JmZJGKRYBGpeiXKINxfxQFfUihdcw6zPGiazX9s0bKZwt
         lL+XybmgcAbw7XYygrZogQI3TSDNd51jazxJjNm2RgTMsMnnF3KEJYw5X3hx/x14Z+ta
         dzAxNSklSQy18y5s9K00Hv+YNwWXTIl5BLvPK2RMcxfpFAGiKnOIUrIPFhsVb0tA4p+M
         k4EZy2mqhkVEpcTWfwRurrwG+nhhE6C7EC8uhMv2BaeaKCOqqVJbzOc38oVAGGIB6u6A
         IEUYJMWXjxxvDvPOQCZT59Va5xHW3570niRmTt9KO6f8w/Vlb61rmODJsiF7BG2DdECS
         iwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741281770; x=1741886570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRtVMgZ55zLMGI/NlOCcgv9aGOQgHktJls4Rai2LzFE=;
        b=TREx9nmtPRpEamyf9DyStm1fuFL3l4UhFCGpYh8l49KqU9gTr/M4V0CLBrWFGbXb9J
         jYEDjusVKaDyZtkaxEgKes+Sxw462puj+yZChXIS3ZSid33QJGOabY+mpZ3b6FlplGU3
         0V0FUqTbE9d0Augkm3MKq7Ve8gqEhz7pM35YOvV2WndLpNMnnkP3MGX2m6PU+hZ7Xbi+
         LxeUGeuzsAsybYqmDK7l7QtESxgm6gurJFddBWvLhqbJPEywC3qmLyeCVKyKMkA/bNo4
         whvn0hRngM1b6A2DraEiNIW8tDGcOqUdjn3+ifpTeuyoLjGfQydJ5ECd/vS74zLOtiNo
         Uu+g==
X-Forwarded-Encrypted: i=1; AJvYcCVdSoN+VvV1GjTcH3R47oHzCdiMyZRMb2djZ9Se2WHylWeYVKp4tmEhQ9Q5WepCFS7eXKGr@lists.linux.dev, AJvYcCW3niHVVLymkGN/sAUinjTs76ZtjpCRNeBva2xAKVQ3T98ivzP7BCLrunji0KKf2Zuw1WREh41Rj4WVyUSwtnQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxfHHCLCxmf+hKKDPtx1EJnr2XRx4bayGMwE6ExRn+c13tqYT/z
	983o/Ymqpfd0fm8rAr/MkhPpRkagGdpxuTVYz3r65UhzAm8cQxzw
X-Gm-Gg: ASbGncsg8gxIIK1yfcRGNXxZXefKlOAUKTuAyFeGg7msFlxGo4grELhYAU4EY14zzdy
	Zv488RW7HVCavRnKRgv0WMQ0ae4u7ccvs9XUEGWOgnbDTxMQg6pQd6OwmcPGST1okV17ZYi/BBW
	bMR/ggSemkc07mgT8DFUzIkf6Sgb9gFfqKJfObXiZD4QEpo4CbVBVSCyyZfH1l85tpmST1CZ7if
	mYDPz7/YqPlhgHL/joC/Fnix81i+jtme1Zc9ftfDV/zFrUGDNtC9n+vd7gZi13SPQ/ixZDAn4l/
	uLvmBYcKYs0y3pRDW/kh9T5Pe6NAhERvhpDCK9EkBBMwxrZkN+OgujqmJA==
X-Google-Smtp-Source: AGHT+IH26VxHQcLOQhDT0ENeuoRX0h2QLaU456Pm5UWb84f30oMCU5DkYbKfP44zoaE1dDrw9v5TnA==
X-Received: by 2002:a17:902:e845:b0:215:a56f:1e50 with SMTP id d9443c01a7336-22426fd8a0cmr4582335ad.8.1741281769817;
        Thu, 06 Mar 2025 09:22:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410aa4f83sm15011285ad.217.2025.03.06.09.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:22:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 6 Mar 2025 09:22:47 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: George Cherian <gcherian@marvell.com>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	"wim@linux-watchdog.org" <wim@linux-watchdog.org>,
	"jwerner@chromium.org" <jwerner@chromium.org>,
	"evanbenn@chromium.org" <evanbenn@chromium.org>,
	"krzk@kernel.org" <krzk@kernel.org>,
	"mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
	"thomas.richard@bootlin.com" <thomas.richard@bootlin.com>,
	"lma@chromium.org" <lma@chromium.org>,
	"bleung@chromium.org" <bleung@chromium.org>,
	"support.opensource@diasemi.com" <support.opensource@diasemi.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"andy@kernel.org" <andy@kernel.org>,
	"paul@crapouillou.net" <paul@crapouillou.net>,
	"alexander.usyskin@intel.com" <alexander.usyskin@intel.com>,
	"andreas.werner@men.de" <andreas.werner@men.de>,
	"daniel@thingy.jp" <daniel@thingy.jp>,
	"romain.perier@gmail.com" <romain.perier@gmail.com>,
	"avifishman70@gmail.com" <avifishman70@gmail.com>,
	"tmaimon77@gmail.com" <tmaimon77@gmail.com>,
	"tali.perry1@gmail.com" <tali.perry1@gmail.com>,
	"venture@google.com" <venture@google.com>,
	"yuenn@google.com" <yuenn@google.com>,
	"benjaminfair@google.com" <benjaminfair@google.com>,
	"maddy@linux.ibm.com" <maddy@linux.ibm.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"npiggin@gmail.com" <npiggin@gmail.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"naveen@kernel.org" <naveen@kernel.org>,
	"mwalle@kernel.org" <mwalle@kernel.org>,
	"xingyu.wu@starfivetech.com" <xingyu.wu@starfivetech.com>,
	"ziv.xu@starfivetech.com" <ziv.xu@starfivetech.com>,
	"hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>,
	"mhiramat@kernel.org" <mhiramat@kernel.org>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: Re: [EXTERNAL] Re: [PATCH v4 1/2] watchdog: Add a new flag
 WDIOF_STOP_MAYSLEEP
Message-ID: <925869a6-7563-459b-b42b-b7b9b8ea0b0a@roeck-us.net>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-2-george.cherian@marvell.com>
 <irmewriceyzxr6jvbiao5vqrvelpftbjalmheodx5w63zi6k2y@dg3wlvs6zryd>
 <PH8PR18MB538122CE6706872B8A836A94C5CB2@PH8PR18MB5381.namprd18.prod.outlook.com>
 <7ac2b8db-22c7-4168-b1b7-4f9f0ab10531@pengutronix.de>
 <28a711e5-b2cb-4d5f-bb78-259a01cd4bcc@roeck-us.net>
 <PH8PR18MB53812FCAE180303E5D434275C5CA2@PH8PR18MB5381.namprd18.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH8PR18MB53812FCAE180303E5D434275C5CA2@PH8PR18MB5381.namprd18.prod.outlook.com>

On Thu, Mar 06, 2025 at 12:18:20PM +0000, George Cherian wrote:
> Hi Guenter,
> 
> I am summarizing the topics we discussed in multiple threads here.
> 
> >>On 3/5/25 03:01, Ahmad Fatoum wrote:
> >> Hi George,
> >> Hi Guenter,
> >> 
> >> On 05.03.25 11:34, George Cherian wrote:
> >>>> why is armada_37xx_wdt also here?
> >>>> The stop function in that driver may not sleep.
> >>> Marek,
> >>>
> >>> Thanks for reviewing.
> >>> Since the stop function has a regmap_write(), I thought it might sleep.
> >>> Now that you pointed it out, I assume that it is an MMIO based regmap being used for armada.
> >>> I will update the same in the next version
> >> 
> >> Failure to add WDIOF_STOP_MAYSLEEP when it's needed can lead to
> >> kernel hanging. Failure to add an alternative WDIOF_STOP_ATOMIC
> >> would lead to the kernel option being a no-op.
> >> 
> >> I think a no-op stop_on_panic (or reset_on_panic) is a saner default.
> >> 
> >
> >Agreed. Also, I like WDIOF_STOP_ATOMIC more than the WDIOF_STOP_NOSLEEP
> >I had suggested in my other response.
> 
> 1. Instead of blacklisting drivers as WDIOF_STOP_MAYSLEEP, the option will an opt-in.
> 2. This may not be WDIOF_STOP_AOMIC, instead would be a generic flag not limited to STOP
>     operation. May be WDIOF_OPS_ATOMIC (OPS include - .start, .stop, .set_timeout, .ping)

I don't see a value in this because AFAICS atomic operation is only needed when
stopping the watchdog. At least in theory, some watchdogs might need to sleep
for other functions, but not for the stop operation. Please provide a rationale.

> 3. Remove the kernel command line option (stop_on_panic) and have a generic reset_on_panic.
> 4. reset_on_panic=60 (by default )  meaning on a panic the wdog timeout is updated to 60sec
>      or the clamp_t(reset_on_panic, min, max_hw_heartbeat_ms).

Default should be the current behavior, that the watchdog keeps running with the
configured timeout.

> 5. if reset_on_panic=0, it means the watchdog is stopped on panic.

If we need both a panic timeout and the ability to disable the watchdog entirely
on panic, there should be two parameters - one to select the watchdog timeout
on panic, and one to disable the watchdog entirely on panic. If there is only
one parameter, it should be the watchdog timeout on panic, with ==0 meaning
"keep the configured timeout" (i.e., the current behavior).

Thanks,
Guenter
