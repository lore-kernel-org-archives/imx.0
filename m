Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A75E30F81B
	for <imx@lists.linux.dev>; Wed, 31 Dec 2025 23:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767224482; cv=none; b=oBu+Lvj7mSxUnLmT5y6WnHK4mV1OFDEsk4YyA8bNZGHwCQSDFgDgnYC5px9Nr5NcgpNc0CCTIqAbTqWt2yfC5ICrTfjC5sh6aLjpnv9cGZMgxRRYfuoqBIgqOv49jP1qxcOmENtl5pjqsxamrBpG+T4WYr6TOLHqyS1h2OWmgVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767224482; c=relaxed/simple;
	bh=BWy1gXyOOWYNnYUBz6Zo1eDM/lnD8SOnC63pK454g8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/lyR2Xzbj4CZxFXCA/XPAU2wXmaGvOgwQKKbIVxPvqyA2hXqbsXtZA5Fz3qWIVfXcooNmkKu8rHjH4Wb1+v+NaL6bQhFwEDAG/8YLRGiIhnnPYC/28f4oy383tzpFn2kdBRho+nrB/mVIA6ZjjV9vjuv77Nsj5Cq4REcMdKj+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwcwKQTq; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwcwKQTq"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7f1243792f2so7480501b3a.1
        for <imx@lists.linux.dev>; Wed, 31 Dec 2025 15:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767224480; x=1767829280; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BWy1gXyOOWYNnYUBz6Zo1eDM/lnD8SOnC63pK454g8g=;
        b=YwcwKQTqo48fcYchOeDHzmYIYz3vnonmO+SZic+6hSX7TMcTi4TfxABYI5pYskKclb
         +VtoN+7tvH5DLeNTZvdFyM6enVe7nWv3Hv82pk46oNn7ivX0HGGw4YW6u+4P0CFJrlq4
         1MkmQ4wL9ikv5KLGpIryswySveRgfbYSPW1QlPNDXvDJkmlSgIIDclnhX7z5TZCg5VjA
         ah6Q4Z6YbZOVwio8gtXtCg5CplDlCwh1jxWjl5sJ2eemQNPbde1B+YNh/0AfFQ3cKNhl
         jZrShfLdNBU+cUhepn3ego07CmkbXA+sKX/W+1q7ij5uwZ5bu72/Gza3RbfyLI6nnAFR
         2Vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767224480; x=1767829280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BWy1gXyOOWYNnYUBz6Zo1eDM/lnD8SOnC63pK454g8g=;
        b=eqkUc2wXQYQO3arYaWU1dzU8CpLRz2pCHbDmbrfe43YA/syBq6aXnm3hz7/ngg4AEH
         z5A0CVzIhfizg54t23MetdjlYybFwMp70aFY8FwyAHwOmMZRvHgvUuDjtTSWese+sa+U
         7MrIwD9KIWKYpd9YQGC4hsGOnfOuLTs6B+YOP55Pww7NTESz9p0mmip3tmnLuczutfXy
         vzVtllidgYKkUTS14AbrS/e1indNuwjOR1qRdp24pG8bt+i8dueJjWDV/awnQ0VEKDQ+
         B+6fBT/UQhCM3SOlFpMzotm3EFAnWISMDWm/aUOp7mrSrdmda42Aqs1dPWQToMHm/YJe
         rJFw==
X-Forwarded-Encrypted: i=1; AJvYcCVVLhDQww9nMl3zzY0jhZUFgTZdTVRr401HvKK5YvkrxJewUBH3lxWtFMhY3fxQzS5kaQQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmNDCyPEj5vtCAY9sg1PrVVbl7lRJDEwNq+RrdlkwWf09VVGBI
	VslpDMa4lIHWP94hQi43eCg0Ry/5Ap4+IVxSqyospCT82zxKs+/EzJEe
X-Gm-Gg: AY/fxX43Qjo2Bob5WO9g9HGEtyVY096jwcVxVwRofyFmR7vACXZuf7c24PjINIL57wr
	6LrdLeJneJ1eH9+sxJd6cZjQmDRjczBbxzrRQMogvWnjNQyhuLkdvT8d81DBMWeOGzSvHy60n/v
	SG/nqg55LpgP68WwBA93GI+tvkUIQ+b8SaeEOEDZupp4JbDbSTrGFTZmspAzMqrQhz9ZnkUJBGA
	PvI6os8sFGjw1m/ek522hwK4CNvGUDB1fVMm87F+4S8nu3YVuoKhlahmQe2FjmhsqbZO54nF+2u
	X4+gE9Kpu+hvBWDZCvTfDpv3lOOgK13CJWTqk6rvpf57Uey6piem1sfkwVyLf8WgT8quNoUS4sf
	/rO+mYdPkHGwOvmWFnn3DI3/vXb+XxvcYQc+fJFU5QtbRgwMrGbpTDBz3PTv9qPmQDGKqIJPaLb
	KfkBAPausKFizeIZo7bKPQieUq
X-Google-Smtp-Source: AGHT+IHdS1XCFIF/s+R2MzEjCr3KsXQm81WSnRd7sNkVOMb7Y4hp3EFixXPpBvYYArS7H/0Gwn6dbQ==
X-Received: by 2002:a05:7022:3b8d:b0:119:e55a:9bfa with SMTP id a92af1059eb24-121722b46d6mr35420452c88.22.1767224480383;
        Wed, 31 Dec 2025 15:41:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c058sm143562327c88.11.2025.12.31.15.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 15:41:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 31 Dec 2025 15:41:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nandor Han <nandor.han@gehealthcare.com>
Cc: wim@linux-watchdog.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] watchdog: imx2_wdt: Allow to continue in low power
 mode
Message-ID: <ee2771f2-539d-4bb2-adc1-663e39488148@roeck-us.net>
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
 <20251229145000.421426-2-nandor.han@gehealthcare.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229145000.421426-2-nandor.han@gehealthcare.com>

On Mon, Dec 29, 2025 at 04:49:59PM +0200, Nandor Han wrote:
> By default, the driver suspends the watchdog in low power modes (STOP
> and DOZE). In some situations this is not desired.

Following up on Krzysztof's comment to the devicetree patch:
Assuming the watchdog is in low power mode while the system is
suspended, it is all but impossible to imagine what those situations
might be. A reset by watchdog after the system is suspended simply
does not make sense. A system which must not go into suspend mode
must not be permitted to go into suspend mode to start with, or in
other words suspend mode must not be enabled to start with on such
systems.

Guenter
