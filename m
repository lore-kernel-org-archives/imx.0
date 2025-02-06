Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368D3155744
	for <imx@lists.linux.dev>; Thu,  6 Feb 2025 08:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738828932; cv=none; b=PDqUCqICnngSq7Ned9oKA81T+l6/J5gT2y7ssnAXM4dR0q2OyAx0rYNOCSPSihSComktLhr2pzLtn8RjS87ua8dFxcDds326NyTOy1rpHD8WGpV2+OdK6B5maRLxBPppQuPMDnvhj09fRBkQR4r+G8tTSq07GkAH3b0r94Nb1ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738828932; c=relaxed/simple;
	bh=Z4nnfybTEaNZ5Db2rmvJ9oxd3OSrK7LFETmYdjxSSAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljzFB9Yfm7uJQAXn2V+BNWlJWXSwEtxJwoB+nhTR/nRcQ7lTHaKZ+OopIt0RtwQMWGLaJYPLwfSti5qGqsN93CmL/2kdjbSZsIf88iQTX6s2ovt/v11HcReZ3tnVqsafN9aHIFupv6Z1z+4MkQ8GbPVnxCgMXr14Od6NZ8hTMAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T9u95CD5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T9u95CD5"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso3269175e9.3
        for <imx@lists.linux.dev>; Thu, 06 Feb 2025 00:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738828928; x=1739433728; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nPXgxL3/vPlBnnI2Yfl6MiqQiCTLYqV9DTTBZ0YDUTk=;
        b=T9u95CD5UuDyxLjvKs+0hBQjaCuYul1GnSs+mPwBLJ2CvrYQT1r/cC0R75NVXQ2/Z5
         UVVAuaBYYJz6x51p34Cvptv57s9rvksGajO21I2xRyezhm97b1FwOtdY1bjtHNWOFYj9
         TT6V0bWtjlmppwp5t6yBGPF1dPpGaLSCyy3IaP+YHwwyO8wN0vWsmpi73oOoSndfF2SG
         rlienebKV9Xiu0deeWe8FULcgdGdC7krRJhUdxe06yNPR5eqnQaxGnznxr+vr03yTrwY
         pzlWrfRN4sTjLwn5E5y4C5N1oHBoE+gnyA7RCSAO5d3aJBcNY6jnO3EKvHqqbrbtZk/+
         N45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738828928; x=1739433728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPXgxL3/vPlBnnI2Yfl6MiqQiCTLYqV9DTTBZ0YDUTk=;
        b=OdRUX+A+x/9CEHwXwIN7FF8As/UQVpJPQJAX8PwT/1aSy3uQ86BgRMUq5RNCrk03b8
         9f9I+B1NuIBw9e7Bh+70S1BfDqyAzH9vr/099ALPhIYvDLv6svn7KsTVzn1tmh+I0QXj
         32JOYjoXPXbMf84+HZ7R0ovk0jWGhE8axnnYET1ODQY4kiIVLHWlRVCeC+xzmNwaTEpr
         P1xe8Y1+5xXiHgonN82sqMRsWSv7DcKEcUAxAGtwaQjxShj1nyLiuQDinSjJrrqCz2EH
         z5nQIOcDYFvp3zOtjCOSF4/yXcWKnj9PHoNAtBMI5pAog1YE0kR8rc2LsnXALG7PsmVl
         13Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUKiqNZlfUaXRfKKkw6+xJbDFabZTKoLsIgUsiRaelh3/WBCUgGVKSawfdM72M+sGaxQa4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVERaiHPhvYgpLS1Fku3gp4eQuM60pGwL9cuEFvIkF+WJL++bA
	DFsG0JabqHXatAiwQm0bOk1SkhjjzUxYgWVXUfDvLu0K1mokmSk3n4meCb8RHd4=
X-Gm-Gg: ASbGncv0au+EE1nuRPMiW9Y1knr0TsddTnfAn7LO0FFxGcjqRpY/mvfSnLut7RzZmgY
	hKDaYvh7Im3L0U+l7hf6YY9YoySipQPh4zduwImvi0la+J6bvqB07Msu1rXYnsOk9z2MUm911R2
	JzrnKIbrgZvT5s6wZMSY18HuAEaMsSE7BE/O+yBjdAoGM8K32xhZ1C3NEWioUGqFSKELeVZ6Jbg
	DCbhUG2yxQ0OKo8ZTmhqPwZld2/ExMVgQEAE/b2jAWGHhBGUcYoXvfZKyCMlGPge+7ISZ/rvs4c
	CI6MiooZ/BZTZBVrnIeh
X-Google-Smtp-Source: AGHT+IEWof4zjE60RbTVNnoMwQe4mseAM8axdA44ewFLN78LsrMf1OHW5JZiuHAT9VHpIyLKYwWl9g==
X-Received: by 2002:a05:6000:1a8b:b0:38c:5b9e:ab83 with SMTP id ffacd0b85a97d-38db48caa3bmr5083926f8f.40.1738828928370;
        Thu, 06 Feb 2025 00:02:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4391dfd7d7asm10502945e9.36.2025.02.06.00.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 00:02:07 -0800 (PST)
Date: Thu, 6 Feb 2025 11:02:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
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
Message-ID: <230612a4-92ee-4acc-85bf-f1c47dc3c35b@stanley.mountain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com>

On Mon, Jan 20, 2025 at 03:13:30PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> There are two cases:
> pinctrl-scmi.c and pinctrl-imx-scmi.c, both use SCMI_PROTOCOL_PINCTRL.
> If both drivers are built in, and the scmi device with name "pinctrl-imx"
> is created earlier, and the fwnode device points to the scmi device,
> non-i.MX platforms will never have the pinctrl supplier ready.
> 
> Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
> With both drivers built in, two scmi devices will be created, and both
> drivers will be probed. On A's patform, feature Y probe may fail, vice
> verus.
> 
> Introduce machine_allowlist and machine_blocklist to allow or block
> the creation of scmi devices to address above issues.
> 
> machine_blocklist is non-vendor protocols, but vendor has its own
> implementation. Saying need to block pinctrl-scmi.c on i.MX95.
> machine_allowlist is for vendor protocols. Saying vendor A drivers only
> allow vendor A machine, vendor B machines only allow vendor B machine.
> 

I think patches 2-4 should be combined into one patch.  This commit
message is a bit confusing.  I don't really understand how the
"fwnode device points to the scmi device".  I understand vaguely
what that means but in terms of code, I couldn't point to it.

> Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
> With both drivers built in, two scmi devices will be created, and both
> drivers will be probed. On A's patform, feature Y probe may fail, vice
> verus.

You're describing the code before.  Is it a problem that only one driver
is probed successfully?  I thought that would be fine.  What's the
problem?

It should have a Fixes tag.
Fixes: b755521fd6eb ("pinctrl: imx: support SCMI pinctrl protocol for i.MX95")

Here is my suggestion for a commit message:

  We have two drivers, pinctrl-scmi.c which is generic and
  pinctrl-imx-scmi.c which is for IMX hardware.  They do the same
  thing.  Both provide support for the SCMI_PROTOCOL_PINCTRL protocol.

  If you have a kernel with both modules built in then they way it
  was designed to work is that the probe() functions would only
  allow the appropriate driver to probe.  Unfortunately, what happens
  is that <vague>there is an issue earlier in the process so the
  fwnode device points to the wrong driver.</vague>  This means that
  even though the correct driver is probed it still wants to use
  whichever driver was loaded first so if the driver you want came
  second then it won't work.

  To fix this, move the checking for which driver to use into the
  scmi_protocol_device_request() function.

  Now both drivers will be probed but only one will be used?

regards,
dan carpenter

