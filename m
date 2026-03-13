Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70C735DA4A
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 15:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417290; cv=none; b=SJ1ZT/sOSMDfu8vrlVTZpo/S9f0XVTkeZlpRxbsym4PwkdHpH/Kjijnww7qLMy4OtXF/zHQAKWu9vKR9teIfkkaGPUDA7vL0cOAJ1ZA9UvmyFojjB8y+77Td7GtBcYKD1UaM4pYxq7FDNHrcDBAJAju4BGmAS/0Eh9Mrqjl3JE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417290; c=relaxed/simple;
	bh=QU0COKVBZgcQvC7snPKzffi0EyDjoeKXuLaFakEaPio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDDPpcF9dWdb2sjA6RWz5DJsL58YtQh9DsKrtVTC2PsNekp2JPTB4mdFw33xTYJ/638aVDDa+xixsK+hgHc278ge5keDzqpdTEwQplZ+luZyz88yxZ2o3fR1z5PQfX/fIwnvupB1xmXU6pLvKRGYJ0Nk6HMEfNhZ5nsBxv5ISeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3nlpUY0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3nlpUY0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852e09e23dso20780655e9.0
        for <imx@lists.linux.dev>; Fri, 13 Mar 2026 08:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773417286; x=1774022086; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vGPit1GISWqr5Tp7ZscfP1p3dWxXhNTpfxNr4BRLST4=;
        b=Q3nlpUY0vuDhObnmV2uD7TcyE3csWeMOaaWy4Awfry7e1e2mCClOHzk+KyVD8m8TUD
         e06dTlrCNyjTk9Qh+8iRW+qyGaVjhbkNKJ7MTeOJhMHtPxYbZcsuZm/cVItRardZwTiA
         pSHVCjoXUeXzYlvTDKAe3quCKqUaox75m3lEo6772jQtr7+kTURJrn0utjpTUKYOpJys
         qrTSlMOeYa7nWa4aXEE5EhAkcZ6DBzF39/MhRqjxfuBSyMeiGSChGIY+DmKaNk+eLTSp
         yaXTYTG00iZKHS7M4vsdRvNZ8GFd8mmzTGL9fS0hdtBKKO1t2UZcou8GMNHAdAZOXw70
         8GzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773417286; x=1774022086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGPit1GISWqr5Tp7ZscfP1p3dWxXhNTpfxNr4BRLST4=;
        b=si8y8Mtr69KDHg7BxUxfgnsYcl6BFo4+08cBnZ5KbhK/1w+VucFVdfQwDaaw/pUufs
         ec3fp/zJnl6zWJELwxu6L/evW7sRTsI4t4RpPv6CRxwiq4IKaTXSkVAVfkvAbp3AEgql
         bk/bqHXAC7D4MIWeqkknEIBDHJ6ddROLfFFw6/4WeYdWOl1nzDCx4O+3itxFYuGVW3U6
         +iZorCymJXoZFh71xB0kK/V1b7jTUh7g3b7grKM5efSM5pw3clyvzob2h1cYqnxdwH3/
         8s1yiEeWt66XAPvtCHo3ChxoUa81MuhPRevSwa9fLBnv/QvWX8o9OHgyET1nGL/9Ymqe
         2s0w==
X-Forwarded-Encrypted: i=1; AJvYcCU6cYIt6f4dtwlXkblyXDb3EUkLThX9bFpLL2WWarmBaLYmja/vfpldsIlP5EarmJsjGqI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpmQiCuGH4HEDnwD5ZDXXW0wSmJZboBYBBohXMS5s/QaT1qKWp
	b9BQgGRHbgZa6BdMrBGVjDnJSN4UTwyIqTqKqkLDWhoarXdGJQwTmJjb
X-Gm-Gg: ATEYQzwpAR5l0Wo5ZsX54lXZTrDFSn2yQiarjk4tUXGp/l6VpcKV+Xbg/euBNE1jGoU
	s6ArqCWfkz5iCgl0BvXFa9CizzpfMiE3oenygSLuhSSt0mm9FLo9Md88iYCVEh2jAZu7JjT0UAW
	e7L1sRtsQwi3J812xpGSnpGJa9GIEW+/8sqxqIFoFR4C3EY78fVxijJur8MNgkhwblZT5O5o5Ca
	cDEQaoTPl/2JmgHgBBiHnxv7bwigny4kOce5SsoHm092+ThC6Vd7S4oHVoxXbVB8H2hqBfb3q90
	h3G3Qmzp6ptQJoUVJWZob7uzh5rrTEXWOHn7o7WLWgiOa9OTx6r3ArFfDYZ18bHT0fzinEordjZ
	3+oQdS5gYqokYRgZCbd7jxTLVXwMgC/f7IBzBCiT2yVlcYtU/+Vfe0XORD8xerw2nvixu1nmB3Z
	IVYkykyuU2gPgrRRarN46UfXNczR4u9NoCT73+8h/ENT8IIwAvVNHVW3I1iTh04j1Rp97pUky5A
	moAQEQcJHRU9/oKUWrh8l4rZvCFkE78rzBliDlw6IZmfA==
X-Received: by 2002:a05:600c:c162:b0:485:35ee:f836 with SMTP id 5b1f17b1804b1-485566c94a6mr62238805e9.2.1773417285577;
        Fri, 13 Mar 2026 08:54:45 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855725572csm52482715e9.2.2026.03.13.08.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:54:45 -0700 (PDT)
Date: Fri, 13 Mar 2026 16:54:42 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/3] Add support for Variscite DART-MX91 and Sonata
 board
Message-ID: <abQzQnmG0Xh7wXjt@Lord-Beerus.station>
References: <cover.1772642881.git.stefano.r@variscite.com>
 <abQpn9whz_o4n86u@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abQpn9whz_o4n86u@lizhi-Precision-Tower-5810>

Hi Frank,

On Fri, Mar 13, 2026 at 11:13:35AM -0400, Frank Li wrote:
> 
> Can you rebase to my for-next tree
> https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/log/?h=for-next
> 
> And new file, run https://github.com/lznuaa/dt-format to keep node nice
> ordered.
> 

Sure, I will rebase the series on top of your for-next branch and send an
updated version.
If possible, it would be great if the series could be merged as soon as
possible, to avoid having to rebase it again on newer changes.

Regarding dt-format, I can run it, but in my experience it is a bit buggy.
It sometimes moves comments to completely unrelated locations and does not
always keep a logical ordering of nodes. For example, I saw cases where
usdhc3_wlan was moved before usdhc3_sleep, and pinctrl nodes were not kept
at the end of the file.

Best regards,
Stefano
