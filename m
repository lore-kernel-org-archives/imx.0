Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8708C31ED80
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 16:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770826084; cv=none; b=W0AVlYwvRAOLOuXXNjUzG3/EoQd5bLhccMwgSKsDshREdEu7o0bjv3mk72f9svFI8kefybS2EIYYVs7IUpN/4y7Ib/3jJq0wRbiXwbNLSS7HdM6Zby6hkzQJc9TKQ1vYJMAzMreTJhBYFnrZj9M2cmEVS+FC0X+WBe4s4Iexa1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770826084; c=relaxed/simple;
	bh=s04o5hTyrMpNFBENViq5Qgrk2QRSzV1Z2DuGYu8iosI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VM4bD3IkTlD22a5VvkccbrXTPIh4iRMiV75n+7aWodgVoAqoqXeg8pqnF9NIsnqQXF1DSO25CLuJ9uTTVcxwcWMwY6umZlaiq44jQj/SSOQ+ZyQAN+RYX/fVTQKV5d5i1QuiuSQLrzaZuL5xbNCDusVVO1CZ25VKgOMDms5Z0Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Oi9+o0GP; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Oi9+o0GP"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5036d7d14easo64754441cf.1
        for <imx@lists.linux.dev>; Wed, 11 Feb 2026 08:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1770826082; x=1771430882; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i6MYvX1gR68dNM+fhSBJT97Ks8m4rTWUudCKuKAg+KA=;
        b=Oi9+o0GPo8cDgW/1ifb8y3zbpDWabGtp5DirEWESnofRK0fPjKu0+0eTM8F9HJMv9W
         vCaenYvK7CKozOwJVZaDvTSQ7JE5L+goWKo/x0dX4gXcCfi1qzEIrKWzyG3pYDcGeYdl
         rb7brQahJHrV2eRVWfPuo0J+ve+ulR8dFGcv30cj7VxlgTMukiTNhwOxOm8J97jFdrw4
         jXsEKBr/zLxoR2ekv4v7h1fLhN1h4fL/u87G1mhPrd24Ph5VpPSMuX7Ysn7cqo7DvMsP
         XzXcxpDXW1IjanKJ8C0+KMKIHj0zsBU1UZREU8czqfhJSaC7CRBO/JrGlJp+z38H2jXy
         AKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770826082; x=1771430882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6MYvX1gR68dNM+fhSBJT97Ks8m4rTWUudCKuKAg+KA=;
        b=MGTy6+Cs8ZRQSgwyydCWt5zXhwWrt/tts4u98n6cnieQxMh43Qc+Pt984gAvdKW/XF
         /KO+onhiAE9C1TnLiqvZpc3p9fBh5k+9pldPyeZFnSDYIIpHjEiw8c0jBbbcJ/Ojehbe
         fGYdYK0K9+NjwEQVYhI5qy/E5etQziurxQy+jlEZekLhYhzjsgKluQK8bx7/IXVhAXhP
         5vb6OjeTgUx1YPCkfj81SQs+ivQTS1vM1laq3Aw5rXxA/qtqoCslGJg5zcsa/YIpkWPQ
         yix4TUjp1uM2MtfZPq9Tz2M/BA4jy0hhdTb6viwbDYnKQGUopxUEagKgZDLXOMNkUK7k
         l+NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIf5YFzKGrKCUizzA55x5gZ0tXZZt9XzpXWhdnvjBeWwev7fjCLKxQQEukzsRP6Nb8mn0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwiPgQQhyOK4kKyaU/OfdRCZnJcaNBUZIo9KyPEjW0Xle8Uet20
	wrRZV8lVXboI9dHeeA98h0c4KgCJ3fFnlgY5mGFxPVab4MvhAdSUqlKN7ddDMtmp2g==
X-Gm-Gg: AZuq6aJSht0QmWXvIwCSCfvdaUEvIM50OiR0iF1kJIrbD6+8qeRdYx2ou7PuP1/oWVN
	NFAhLDgM4635YbU7W/Delz6lyLIDDee2BB67guJUHH2aEiG6ISwOJ3HBqiGvAwULPEcb4leaSP+
	O/pYOnfSVGYomt8/C1cwPy/aMkgQrovCe5pvvCQeR1b0sEvGOh/423FzTPmL4Q5NUPb8bf+yJ5M
	9ilvqSvOoisayJB2rC00ye2xG2UlukQ7v6xz2aSlwER9hILdHT3MrdeYUI4lDCmd/TrajfWu3sW
	GMmX+ZpK0/JZATWXl0cXAMHOvf0yX25KfkzeoHeJC8M3IHkFo05umcPtcD2K5Nj8v32yV3BiZLe
	Z7cbS74bIWjEfZ5/38YMS31hSWhTZD3elm+Y8fzbvAWgpkrGrOW4xDtt6nuA3eh8b2lCVLpXNhg
	9L1meJ59UGAASSzRYIdkUUozWY+oNXvKPHDDSnOOHH2g==
X-Received: by 2002:a05:622a:4ce:b0:501:b1be:c31b with SMTP id d75a77b69052e-5068102b8c5mr43217181cf.14.1770826082356;
        Wed, 11 Feb 2026 08:08:02 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0bc8f5sm143497785a.6.2026.02.11.08.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 08:08:01 -0800 (PST)
Date: Wed, 11 Feb 2026 11:07:57 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Xu Yang <xu.yang_2@nxp.com>, m.grzeschik@pengutronix.de,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: port: add delay after usb_hub_set_port_power()
Message-ID: <5639afb1-217e-47f3-906d-e2b7b87bbe7f@rowland.harvard.edu>
References: <20260211103628.3265850-1-xu.yang_2@nxp.com>
 <1be3ca8a-032d-487e-92f4-67b2070be213@rowland.harvard.edu>
 <2026021153-tactful-steadily-5eae@gregkh>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026021153-tactful-steadily-5eae@gregkh>

On Wed, Feb 11, 2026 at 04:47:42PM +0100, Greg KH wrote:
> On Wed, Feb 11, 2026 at 10:04:32AM -0500, Alan Stern wrote:
> > On Wed, Feb 11, 2026 at 06:36:28PM +0800, Xu Yang wrote:
> > > When disable the root hub port, somehow the device is disconnected and
> > > re-connected again. This happens because usb_clear_port_feature() does not
> > > clear a truly happened port change. That says, in fact, port change event
> > > may happen after usb_clear_port_feature() is called. Then the subsequent
> > > port change event will have impact on usb device suspend routine.
> > 
> > This is not a very good description of the problem.  Here's a better 
> > one:
> > 
> > When a port is disabled, an attached device will be disconnected.  This 
> > causes a port-status-change event, which will race with hub autosuspend 
> > (if the disabled port was the only connected port on its hub), causing 
> > an immediate resume and a second autosuspend.  Both of these can be 
> > avoided by adding a short delay after the call to 
> > usb_hub_set_port_power().
> 
> What guarantees that a "short delay" will solve this?  And how long of a
> delay?  What guarantees that sleeping will not just reduce the race
> window?

There is no guarantee, but the probability is high.  The delay merely 
needs to be long enough for the hub driver's kernel thread to handle the 
port-status-change event.  For root hubs, this is interrupt-driven so it 
should happen pretty quickly (unless the thread is busy handling another 
device or root hub).  For external hubs, the delay won't be long enough.

And even if the delay doesn't work, we're no worse off than we are now 
-- you end up with an autosuspend-autoresume-autosuspend sequence in 
quick succession, where the first two aren't necessary but do no real 
harm.

Another way to avoid the problem would be to set the root hub's 
autosuspend delay to a few milliseconds.  But we set the delay to 0 in 
commit 596d789a211d ("USB: set hub's default autosuspend delay as 0") 
for what seemed to be good reasons.

Alan Stern
