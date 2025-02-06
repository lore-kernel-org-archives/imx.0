Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EE1214209
	for <imx@lists.linux.dev>; Thu,  6 Feb 2025 11:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738842394; cv=none; b=aF8wBzou8F5Ue8nHmePAJAkA29UVOIJJbxnu7CV7Jh2hKboYqzeoCLOT8zfFaGBsVER4jo9GwI+FsEuWq2Etgr/1u2X7mUhMae13CMTjeSfBe6OK1/ZLAtR6LLg0jI2o5drWeamTiTOL8c96kBObeeAAXqP9Ju39FLEPcynIKds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738842394; c=relaxed/simple;
	bh=SWLeWEosbUy80lmFYLGxuNYrhdqQAQNo1/a0CmehxD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GavRnMueb+nQpLbMtvR0IZnLs56x9uMkffmgpyERh/lPvv/ujDq2Cz4PsGxe1oev09/GpluP8uIQjw2HpiHsT+REtOmscToRJDflVrRVNjsmGYeddP18qxHvrufR0uo0TcW4awumYpX7Fq+bJcKu34sfacAP6DqaRS56wdv3W7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cbLAKIy9; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cbLAKIy9"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4363ae65100so8952075e9.0
        for <imx@lists.linux.dev>; Thu, 06 Feb 2025 03:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738842390; x=1739447190; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S+k8Ga6Qst85KoJ7YqADf5P3tQdSviLmFNQm0uA5O60=;
        b=cbLAKIy9qms2pOhU/40hukjRHeumA9V9QTNrDOdfwyn1V15ePfkDb6d8m+E4aB3sGd
         1mFK1R8/1GzDHsByg6aHMFCD5/fDu3NVznmqWqYFDx26+nfE5O6ZU/DCPwFm70S+2kwG
         8fSGA6w2BTC6kLXb2wWtq2eO7crcvuznl04xvqzhzdwt7LnyqpDN2THZrrT3J+KwGMgQ
         9ppgheNrGq1hZeffZmMPJW9UOvSyD2xvGHsUIFNcXFbb03fHHVBwGHCYowKZGWkc8FdZ
         N9MPlwvsaoYanufTfJMs789A4VQdZXSIOyDbILBeoihCzamWTCxiTpbyVKgjX1asLbvY
         zCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738842390; x=1739447190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+k8Ga6Qst85KoJ7YqADf5P3tQdSviLmFNQm0uA5O60=;
        b=lMeSrbX+E+ENvWT02sQ9bVofFFefSbx99UbQK6dPQCOP5PLxyWReQlqqpzIaWKCAkK
         v9OqrK3XTt9T+/LPWci6ln5e/6QuPhuFM4BAFu8Xpl3hVlByqwpbmSC37DrT7PaW0VzK
         mmO+dkwQCmACRtJDWplFDznzLs+2nJAGyYTj2g7cl18CkmQ5QEqLJUlq9O1xouddXklq
         zXXeraNfIHtaWotE+QScTCrkUMU142/ANNvei4bZ0GoZugwdMPYSKuyBDSnxhkdn9eby
         sUqIUY3UlmBU7zWwaFqJo7Bn7pu/EHXxAMTjFVfIrqbT6EYgUuURmtQFOnqCWI3w8fAW
         VlxA==
X-Forwarded-Encrypted: i=1; AJvYcCVJLyGpGkFZOdF+HYG5JrXJ7RSAx87z+lcp/7rQc2KbMs18oItCyvr2dGe1nuH6mBZD5q0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYc8yfTVHzwODF/BsTYBjwn+ABZ6AmsL4qGHdFBNrdPScz1aVK
	zdT49b0kOAtNtAFEH86F5CSQEz9OvjIYcsgGVXVEgrvgHYx3Vmfp+KWOwIIJQKM=
X-Gm-Gg: ASbGncsc6E3fOypiakQz9l2p2F6Jqaqdu0ertead5EpQJ0Q4FNw8VrIScZ9FBa29FEf
	loAvHCPqTV5X2/sYjPq2/LnsEf7vYPIoO2AinvpUrqSDfXY/3NopkNqfavM0v1f7ni5g3mzPi/c
	hGQWYdbFleW5/h1xgZFE+ZpKee586Ba3X4/Q8KZHNYDISogzKsawD6SzVTJuyX6svGQwQP+3Q7H
	uXpKphVg563zw9sbFNOmdQOjKOs4Qgq0nFB++oidqVMMmkZNdBckDhJCstWYjgQPw4H/7kbpnzT
	ZMd4cAqJt7oJysxHcBvZ
X-Google-Smtp-Source: AGHT+IEErhO90EdplG1wZoluik8CF2AbSDTMnm0SPZkrxbnqggqrDc2mlAX4JRbsHtEmSfgQX/5rGA==
X-Received: by 2002:a5d:6acb:0:b0:385:d7f9:f16c with SMTP id ffacd0b85a97d-38db4912832mr4737364f8f.46.1738842390567;
        Thu, 06 Feb 2025 03:46:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38dbdd55656sm1542702f8f.50.2025.02.06.03.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 03:46:30 -0800 (PST)
Date: Thu, 6 Feb 2025 14:46:27 +0300
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
Message-ID: <119bdeb3-f1d4-4f35-bff3-190eccc7c325@stanley.mountain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com>
 <230612a4-92ee-4acc-85bf-f1c47dc3c35b@stanley.mountain>
 <20250206110508.GB22527@localhost.localdomain>
 <15f20562-d5f3-4432-94e1-06c8174bf3c1@stanley.mountain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15f20562-d5f3-4432-94e1-06c8174bf3c1@stanley.mountain>

On Thu, Feb 06, 2025 at 02:40:11PM +0300, Dan Carpenter wrote:
> On Thu, Feb 06, 2025 at 07:05:08PM +0800, Peng Fan wrote:
> > Hi Dan,
> > 
> > On Thu, Feb 06, 2025 at 11:02:04AM +0300, Dan Carpenter wrote:
> > >On Mon, Jan 20, 2025 at 03:13:30PM +0800, Peng Fan (OSS) wrote:
> > >> From: Peng Fan <peng.fan@nxp.com>
> > >> 
> > >> There are two cases:
> > >> pinctrl-scmi.c and pinctrl-imx-scmi.c, both use SCMI_PROTOCOL_PINCTRL.
> > >> If both drivers are built in, and the scmi device with name "pinctrl-imx"
> > >> is created earlier, and the fwnode device points to the scmi device,
> > >> non-i.MX platforms will never have the pinctrl supplier ready.
> > >> 
> > >> Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
> > >> With both drivers built in, two scmi devices will be created, and both
> > >> drivers will be probed. On A's patform, feature Y probe may fail, vice
> > >> verus.
> > >> 
> > >> Introduce machine_allowlist and machine_blocklist to allow or block
> > >> the creation of scmi devices to address above issues.
> > >> 
> > >> machine_blocklist is non-vendor protocols, but vendor has its own
> > >> implementation. Saying need to block pinctrl-scmi.c on i.MX95.
> > >> machine_allowlist is for vendor protocols. Saying vendor A drivers only
> > >> allow vendor A machine, vendor B machines only allow vendor B machine.
> > >> 
> > >
> > >I think patches 2-4 should be combined into one patch.  This commit
> > 
> > They are in different subsystems, so I separate them.
> > 
> 
> I mean if the i.MX driver prevents the generic driver from working then
> we need a Fixes tag.  It really makes it simpler to understand and backport
> if they're sent as one patch.  Normally we would collect Acks from the
> maintainers who're involved and but still do it as one patch.
> 

Wait.  Just to be clear.  Does PATCH 1/4 fix that bug so that when both
are built-in then the generic driver works?  This is in some ways an
alternative way to fix the same bug as well as being a cleanup?

regards,
dan carpenter

