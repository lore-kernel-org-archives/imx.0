Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02181151991
	for <imx@lists.linux.dev>; Thu,  6 Feb 2025 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738842017; cv=none; b=Edfw8iz5EETyoPUrZi3ZbbOlP/I3MF+MABnuC/VZZ5bRl+VX0Jm49GPplZVBoE6p0/Iz0q86IM7VRplAB/CPcgIE7l5fT1UHh8yjGTNsVrvjwWUJaa/pA0XsGtQ06DxQpjdWkKoGnwjHoYYUlsfrf0GpL/515w0dP4kHynZj3Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738842017; c=relaxed/simple;
	bh=JwrnIDxa7fiK9DOXokfhuwLBPcCS07LencS6UDbMmbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CoiW8LzonXTPd+qogB9HpJpAJTHdbkl4aatM43o3/vPeLdfyBd/OXUK0gEviPJH00vOoHzlcHh2Cdo7ExUoRSbhb1Up1/7b2bKlBkyplS96zjS8klXzUxMdiF5gvik6iFPxqSs13DeiyXwPEMAUWgzq/gAXD/mvl3ZBVhl8X/Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gQF+a153; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gQF+a153"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385dece873cso322843f8f.0
        for <imx@lists.linux.dev>; Thu, 06 Feb 2025 03:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738842014; x=1739446814; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RKka8q8Has39PLR0Yd8RpCT4IAmN7UpWKg6ZilU2jFU=;
        b=gQF+a153ZuOTRQ5EK4bl2NJ1Jv0P5ZZ2VtXKbLYbxXxyuzoB+xyzGGkuXX6koIDtVW
         XoUY05gsaymjscZNuEx8gf4cZfxI67YyGdT/SdhsnQOmMPDBXO1k9z+bwg8qgkwN1FYK
         r34g4u4iQBvB/DwdW1jNdKaNyybQMx0/Db+TeLALAFZc0uqL/MAkib0ItM1RK9bQiq6C
         qLPxuQk6iJn5oMz6pfl8UK6PuZwrdAXxAyYFtLfd9iww16q0vU2NdfX5IBuqbzQ+o91R
         vKIYlW5yNpVf1aYdDNjrg9BFaTzJ+ic7GuarwjmzPOh6A3zBsyTwiN/Zja4GgIh+wkS5
         GnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738842014; x=1739446814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKka8q8Has39PLR0Yd8RpCT4IAmN7UpWKg6ZilU2jFU=;
        b=u8wi4y7yTHCrOCBimc7RhtqeAed6MuUa0Vh3x37a15eCgZQlpbQJnOfsOlGrXC97OW
         +Vpt68CjSMB84tRT3QbnfMNFz+uALV1oKQAWUHWIjI6WPCNI78AM3MVP4L8raNAr/qWk
         plzi9wrBVFNzUsFZ0Z+4Q1ysWqtlO7C909N5Ocn3fnZrAPYMe+t+jWeAB2nfod3oLYJM
         OR+zMuB3kww/SGHLkc1rGpcnD6IGKW2PODq2RNSBBZOcLThgWoIxhrIDP0Fd+YTHUypq
         iDLyLqxKgY4U/WveSynTF1KUJFsYesLOwuoLhn4RsJGbCGnHmKyuRjQqMiBi+ujCZjl8
         1S0w==
X-Forwarded-Encrypted: i=1; AJvYcCX0wWFtJDcUy+7k/W1f6Xu2mkr6U+CAQvDvWHmJam8CXVHhyS+NTJUzKzWd/CFEbkwljfQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmfYaqubV9GPENAs9wdfIh6Scu47zF7oGUWvMrqUk6NgJCP+T5
	lMpKqeKgmrcxvACKkPHigz6B3lGH88zj5A7iEVAg/Bp/X+0+yPEiOwH6SirwWMU=
X-Gm-Gg: ASbGnctFVkMzn3EHiOE7vyp93wXA1lib/eR4hpFGQpCJL+13ms6u59yTVxfeKBzLz0r
	t1NCG4c+pkg+BmXfcsRyxNEhFQWJLPkoPMDDW0P+P6UVF9U8sLbnCZ+EEQxf4opvQa01VgPcDtw
	nNREc7y8wHANssfvWfBfQR0GtcLwFujQmqdkTCNS5cqFuPna8CQz/vhDP+EOUtUHVrplgOCXhDn
	10JVNfHkhG1h03HYZOAzoTAKwDyl7SPCgnvq1+owGmzLH8Cb4itcTe5JvkuowFs0YNPR3aN23eC
	SaIQ4rohh1sFWF3FagdH
X-Google-Smtp-Source: AGHT+IHK7xN1+O0lC7SA+Z4hYlZwlXq1mhwhsAv5rC/JniJV62KNS95+EeAeYIVWA7BzbT+PnwAdWQ==
X-Received: by 2002:a5d:588c:0:b0:38d:b6e6:4445 with SMTP id ffacd0b85a97d-38db6e647bamr3919617f8f.24.1738842014402;
        Thu, 06 Feb 2025 03:40:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4390d9334e7sm52136505e9.6.2025.02.06.03.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 03:40:14 -0800 (PST)
Date: Thu, 6 Feb 2025 14:40:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Add machine_allowlist and
 machine_blocklist
Message-ID: <15f20562-d5f3-4432-94e1-06c8174bf3c1@stanley.mountain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com>
 <230612a4-92ee-4acc-85bf-f1c47dc3c35b@stanley.mountain>
 <20250206110508.GB22527@localhost.localdomain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206110508.GB22527@localhost.localdomain>

On Thu, Feb 06, 2025 at 07:05:08PM +0800, Peng Fan wrote:
> Hi Dan,
> 
> On Thu, Feb 06, 2025 at 11:02:04AM +0300, Dan Carpenter wrote:
> >On Mon, Jan 20, 2025 at 03:13:30PM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> There are two cases:
> >> pinctrl-scmi.c and pinctrl-imx-scmi.c, both use SCMI_PROTOCOL_PINCTRL.
> >> If both drivers are built in, and the scmi device with name "pinctrl-imx"
> >> is created earlier, and the fwnode device points to the scmi device,
> >> non-i.MX platforms will never have the pinctrl supplier ready.
> >> 
> >> Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
> >> With both drivers built in, two scmi devices will be created, and both
> >> drivers will be probed. On A's patform, feature Y probe may fail, vice
> >> verus.
> >> 
> >> Introduce machine_allowlist and machine_blocklist to allow or block
> >> the creation of scmi devices to address above issues.
> >> 
> >> machine_blocklist is non-vendor protocols, but vendor has its own
> >> implementation. Saying need to block pinctrl-scmi.c on i.MX95.
> >> machine_allowlist is for vendor protocols. Saying vendor A drivers only
> >> allow vendor A machine, vendor B machines only allow vendor B machine.
> >> 
> >
> >I think patches 2-4 should be combined into one patch.  This commit
> 
> They are in different subsystems, so I separate them.
> 

I mean if the i.MX driver prevents the generic driver from working then
we need a Fixes tag.  It really makes it simpler to understand and backport
if they're sent as one patch.  Normally we would collect Acks from the
maintainers who're involved and but still do it as one patch.

> >message is a bit confusing.  I don't really understand how the
> >"fwnode device points to the scmi device".  I understand vaguely
> >what that means but in terms of code, I couldn't point to it.
> 
> Sorry for not being clear.
> 
> The devlink framework will take i.MX as pinctrl provider, because the
> fwnode is occupied by i.MX pinctrl scmi device which is created earlier
> than generic pinctrl scmi device.
> 

Ah.  Got it.  Thanks.

> >
> >> Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
> >> With both drivers built in, two scmi devices will be created, and both
> >> drivers will be probed. On A's patform, feature Y probe may fail, vice
> >> verus.
> >
> >You're describing the code before.  Is it a problem that only one driver
> >is probed successfully?  I thought that would be fine.  What's the
> >problem?
> 
> VendorA 0x80
> VendorB 0x80
> 
> If both drivers runs into probe, VenderB 0x80 driver may crash VendorA firmware
> if the firmware not designed well.
> 
> Not big issue. I just think we should block the probe.
> 

This is a theoretical issue for now.  I would just leave it out of the
commit message because it's kind of confusing and it might not even happen
in real life.

regards,
dan carpenter

