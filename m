Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4702ED149
	for <imx@lists.linux.dev>; Thu,  4 Sep 2025 13:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756991108; cv=none; b=OcpxCC1AfEMHtokLSIxKCR9vj68+RVZTQ7wLo7m1I7NXWlTXDGvaRuBhI/aiooTxC9qboShrZsAVdOPkTkRypeZ3Ogadsl1xkNIHhal8bL8v9LFlsLv5BBuyLx/yGuyJXvtu7/q6Bdx1ArLqu9/5UTet32tfbAJ7a2AQU0xm2kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756991108; c=relaxed/simple;
	bh=4+TuaB3AQgdLwq2LWwltTJVy79a442h+ql8Ri/7OV8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SdPm5c9SRWYUWOGKH27GByHphzDYVxYDOlAB+RX6WJTUH737D/H75nlc0TANs0aI1vLRWTiGLyJUltpVDE1kjGK8ReCjsQ+2DmlBlb1Kf59nESSVkt+QJ9RloTs3tqYQluJmUCHoxuQxY8ihSxhDO6GP7WYqGCZ/zpaMzAKtql0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y80wVDIa; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y80wVDIa"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e96ff16fea1so1208702276.0
        for <imx@lists.linux.dev>; Thu, 04 Sep 2025 06:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756991106; x=1757595906; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VRAIqJuFoUxn0IlxAYdnfU5ZQhjUgE5v1C3tZfihKz8=;
        b=Y80wVDIaKBg2xCI36at3E8sf+oHleDEk2od7G0/+jl353vN/O74F0IYCxYjcf+ccgF
         I+5O7+xybVocxykimOUHiacY4fag4zlhd6W+S+/f1KpaziSL5nM3pPhzaN/lhQzsODo+
         LglW0S6Z4P/PTbx6dCoHtpwZuf+EGwfRdW+/sfDi9xjohU5CWA/tEdCjjCdJU7ZWCQbH
         /T/PCY/vfCPXXclifk3oR71w3j1BTI0KtRbKlB0Akmw4KwA8UICazBkFnwVPnovYNThg
         qRxWzg9hrZzcmRlmQ1F7lo/oZbCFh3kXXBp4kquw3GAnOsazQRIpZ9o323GKlsNk9+8C
         rAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756991106; x=1757595906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRAIqJuFoUxn0IlxAYdnfU5ZQhjUgE5v1C3tZfihKz8=;
        b=iZFMj3BXtYni7daFQp3YKiIYcg/2Uclxr/7ltLJGBK/Ys6EJuygvrMSHzhdp7OTSFG
         HG0y3ko2leNHmulEdpopLZVx4PEHA5Lio9dYJPrtQ/pgcQ78McQa7c0w1vmAKKeums2v
         yAPmXtK4nfJGrI0znPOfn01SiL5GDiZkQ/JQwfiWuG9wN33ciHt3JjlckZyDkSri9rhw
         ReCB3y5saLoOh5ArXNT2HUWfrmwYpVW0leJNq3y90mvcghCcYJh8+9cFLnaaQTRcmM2R
         3YaCrpbwx63/7o9itu9prcINH+wBCMJuzamWsZvYGP/YraXp8qrCqprzDXb6URDw0azb
         9MOg==
X-Forwarded-Encrypted: i=1; AJvYcCXJkfaTc+HyG7r86KZqihvJ/25tPQle1cDfAmFr7V+o2OcUaTAFqzNgbZibNTpWdYqXsLo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFqNcQGsx9XKd3XURmvnU6MIX/DtEPdR1xwrwipzfYQYfeSz8q
	+kizs2tybpmoapZ9RFXKrv275Jjb1IoAMZaABCIFjBR4e+cYea8W3owk
X-Gm-Gg: ASbGnctI/54ggw0F68bmsbnhEw4+AXaAeWXBjrAAkatIkBQo6DqKM6veKpZ3R9lWUZF
	iu9JLg+c6nAdYi635qtFptFd+HVUJ4OJI4CrUgg19r5c1wG7aT4HUPMZhj/VkYbaLL5dOzPXh74
	xvNEm/C7mKyglMNSfibr23XrM7z3l79acV882BQff6bIE3VaseJuTG6yOsJ1CnhviXuGru6XjDY
	w6oQe1k10YV5Ib9fsl4ePKRq+MmBxmokavTUeIiwAAPgLGFj/sdJJ3RXj+af4sBlAshdPNgOSgt
	sBgwgO9K6Sa5j2RzMuH4jnP0WZ/lAhB/A0pYVQ7Tbh3iM73DSKB5DbLiokZJ1rQC4QXsKrB97ri
	Cd++0m2L8NQuTzY5RuPnU+C8aPCxymCA30iZXH6b+d+i/JQFrjNV1rReraltzYv4=
X-Google-Smtp-Source: AGHT+IHmWVZV9smFiDb5EAWgukKWH2yUMaPX0VME1uD4yW4vCM5Ef44xf0wr2EDvqQBA5WuTd7GVIQ==
X-Received: by 2002:a05:690e:164b:b0:600:b3e5:d4ff with SMTP id 956f58d0204a3-601782d338bmr2063081d50.31.1756991105967;
        Thu, 04 Sep 2025 06:05:05 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6f:e2d5:5eff:fea5:802f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e9bbdf6d877sm2261100276.15.2025.09.04.06.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:05:05 -0700 (PDT)
Date: Thu, 4 Sep 2025 06:05:02 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>, Frank Li <frank.li@nxp.com>,
	"Y.B. Lu" <yangbo.lu@nxp.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH net-next 0/3] ptp: add pulse signal loopback support for
 debugging
Message-ID: <aLmOfsgjumBX3ftE@hoboy.vegasvil.org>
References: <20250903083749.1388583-1-wei.fang@nxp.com>
 <aLhFiqHoUnsBAVR7@hoboy.vegasvil.org>
 <PAXPR04MB8510785442793740E5237AFA8800A@PAXPR04MB8510.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8510785442793740E5237AFA8800A@PAXPR04MB8510.eurprd04.prod.outlook.com>

On Thu, Sep 04, 2025 at 01:55:43AM +0000, Wei Fang wrote:
> Vladimir helped explain its purpose in the thread, do you still think
> it is pointless?

Vladimir gave practical examples for the use case, so no objection
from my side.  I just wanted to understand how this is useful.

Next time, it would be helpful to have that info in the cover letter.

Thanks,
Richard

