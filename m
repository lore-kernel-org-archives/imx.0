Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300CC239E6C
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 14:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508826; cv=none; b=B+5WNHSqVjFM7izZEuTHQEKk9DwvYLA34zvcLudvnR599QVaVsHYGJ/1ft2knmhY6OTvbavVuAlJ1qN8LFB6CjIQsfOocwiUyemRxXfNxuLi7gm/8Aacq9/wyBP0cO6IRYXxBIv3/0MosehQ91mwcdld0rttHj6QyLJ92UwUc0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508826; c=relaxed/simple;
	bh=SWjs5dj3TCu3z/6b9bho/ZTJi29DUTPyt83vnmEXV+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZH4k3xdeHziawOOAX0RePJnUP+s0h02aBD4HO60256QoDaZarPeHTxh1ACSsqkOeetfAlKfP8GQJA1UMq3UVM8/oP1b/lD08oBe6uy5o9TGfV6ChDhltzaWYUvWCgJvR4HR0mW+fVb2DTenCIwhDCwd/CXaXz4QILohU/BnKSH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTY3TbeW; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTY3TbeW"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15e2dab83eso156096866b.1
        for <imx@lists.linux.dev>; Fri, 31 Jul 2026 07:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785508823; x=1786113623; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wGVPADeki+0/bIy545BYdtbcA87ECTF8VmVOWBf1hwc=;
        b=eTY3TbeWLoYmWhK2RjyX9vlJrqpN8Lnuvrc0bcnkLXJjj05Wpk/iyZ9EqVEVdDAL1K
         UWxnp6lB4l7mBPXmRNidaxHzYaWOiIgHiNjRE3Mp3f6FlG/Yn2sh3h4HwhpcP1+g7ZeR
         GOxIvN4PT8UrSKlf/jRrRncCXYOnPSehz25SefO4nf2eDrCOlZjtdlNLCAewPLo9JcVH
         V3cRXWMg1Is68Ntn4Ej6LLCpi/U3OTXPvNpEmc9iAvJ9j8Y8MDWXd+eaBM/jGEvketaN
         AsW9P6u8AQIkEgIHP5B0heyn/j29muSa81EG7411vnjIaXQ7gLCJFnJ0L/rkH5eCUzIq
         lLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508823; x=1786113623;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wGVPADeki+0/bIy545BYdtbcA87ECTF8VmVOWBf1hwc=;
        b=p8zpySFCFEJHnUr+Tr3ek/qD52W6Xhoztc9CnO0au/0PAU2MwK8L6p5HizLzWMx31f
         fIBqnEc+5XMA4afVbj1/YyKBVSrGIdR/bczU452MPgBP3dH0+5ekfv4vjIbduzRV9/jB
         i0eaHolrNH7MDqgPa9o+/aHYrO+aXbw+ttgExD5QfejVH7UrJr+POxZiahgYbn0VYF5m
         ve0dqwIpdc2Gk+y6gsUuW01Jx8xhPLhiG5UaYwf4OkqHmgxBtb/Bq21+5k6wPbTNQWWn
         ATYs0SMDqV1reYHbYCZzw0vTbi+SUp1joY2bOfAQafhHr7em25eOgtp52RWdaln1aTd7
         7eig==
X-Forwarded-Encrypted: i=1; AHgh+RpRr52pH7haXK4tu+lYFo5mH0H/AjBhKr4wA3UqN/4Y0umGQjfIWOAISSHlkVCpmjXp5Pc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzqvtp/cM5zyb/3NbA0lRZFAVlH9/QKqXoureXWJVdPVjU4VcoW
	gqvjOe2IyCIxQpXkU1PjjgsUZds+7dNmVt/dTZsc5MjqV2hQPsso2cpl
X-Gm-Gg: AR+sD10FIGYXfcTUQRnxOwUmPp+giiJsK3EUspNX18sekwnBjFi5/myZcENSuGvXnjI
	Gpdbprh73Ot0fzolyJE0z4kjrdro5b4OQ4mIVoXtVqSfiS3foPlmUqrUTvk3oEdYQQQi4Blmkrn
	6aIUEJ1WqVZ5dCNJa7tQsPlhFGjDfkr0uOOVlQRk6BA2HNWifGaoL3nUbcjWOnSJj7Y1IvR0QIs
	Akqk/FvrPUOxFGUlxB6dsOvoZGiAL3vG49a1bhO7boew7U4xlAMiIuu/tjqDE6UcVps/jcdpMx/
	DmNt4YYSEnfG1QT41PjWkj2nMvSq9z1ZAo9B/Jm0jXkGE+hxPZ1OYPTv6H2qzI2Ws5DNeaOvF7t
	ZbS6DGpiVubXQnpLfJiFgA70CX+mglNhKx2mIGL6Yng8N1iN11jLNa7PKItUH4/G8JYE3bf+IBB
	yHGov7OfWxlJiGXFoB37ZB1/ByD4M0ts9VzqAJ/y7fkBYEKPHqNMUbuNO/s3OLWBcoqnGEKk32R
	/ToKqDhYjb432mu3OCCaoA7o9wWvTQYkjlOQk1or1oEnKF3bmMzn8bJ1UEFGNtKfgA6lTR5ug5o
	Kp1k4VL0KnC/Txp6Mw5nxCkd6M6ym9qRJ/WlJOb/ZznOEDXyvm1J9atPXXxhfuT6kUU1Slo=
X-Received: by 2002:a17:907:d08e:b0:c16:6e45:5ba7 with SMTP id a640c23a62f3a-c1fd271cb9fmr136450466b.59.1785508823290;
        Fri, 31 Jul 2026 07:40:23 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a8d0-bc01-6d31-3d12-3a11-d2d0.310.pool.telefonica.de. [2a02:3100:a8d0:bc01:6d31:3d12:3a11:d2d0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4453823sm185693866b.40.2026.07.31.07.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:40:22 -0700 (PDT)
Date: Fri, 31 Jul 2026 16:40:21 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 4/4] serial: imx: serialize imx_uart_ports[] lifetime
Message-ID: <amyxxce6haNJBJ3G@gmail.com>
References: <20260719221014.44354-1-kmehltretter@gmail.com>
 <20260719221014.44354-5-kmehltretter@gmail.com>
 <amufrR-1hop2pZOz@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amufrR-1hop2pZOz@SMW015318>

On Thu, Jul 30, 2026 at 02:02:05PM +0100, Frank Li wrote:
> imx_uart_remove()
> {
> 	imx_uart_ports[line] = NULL;
> 	uart_remove_one_port(&imx_uart_uart_driver, &sport->port);
> }
> 
> Is above sequence to avoid use mutex?
> 

I now tried this, but it doesn't work as-is:

uart_add_one_port() may call imx_uart_console_setup(), so the entry
must be present before the call.

uart_remove_one_port() unregisters the console. Clearing the entry first
causes its callbacks to dereference NULL.

The mutex protects those sequences against sibling probes.

Thanks,
Karl
