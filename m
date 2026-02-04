Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FA63ED117
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 12:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770206903; cv=none; b=nph0LJltIjOLlS+pnCle4wAnBTgYA3e6Id2EGtQMeImuMAfDNshLPhgMrw8NVo53VLBZKcx7xkyl1lub72moKmy2+UnK8oaKIFlxaWN7abVyaKKmRCrxCkOCSjeOdfOHIReojOXKkbGX7FCnam4zfRAHDGwWtYWlQjNjD5DRx8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770206903; c=relaxed/simple;
	bh=0t+tXL15cJtzOgmIlBvdrfTA3tDyLplIdYq8kcwmDUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ElDVDrjj12bfB0Zj2C+FCVYHm+ahXhJV8y2/B5dIJbPBgVJ1PGadAp+FBU2sPQHv4LENCsNQr8f8fjZmtW5Ce98o6O2TbxRqVD3g8fjoQ7vr2f58azUNIhrcIzshx52U3oVIFzYhksykk/QRfH4PYkHZPCDSG9aNOjzh3uda51Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R+8xqNcp; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R+8xqNcp"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43246af170aso596176f8f.0
        for <imx@lists.linux.dev>; Wed, 04 Feb 2026 04:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770206901; x=1770811701; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ioG9uYV0HuJP9D1DgqNAsKhOMqjhdFQVQ0SW047PMUE=;
        b=R+8xqNcpCHwJl5zaBcA/X0Kggs5uDHUOG9UNni18ZAZc3aqfS9BbON6uSNBSuSAIVk
         cyFgLceRsjnBpMeYbEOavE2faA/yysFJvXndTAqD8sCG/XyWsLUZPbXM27MfPQglBAW5
         VJGpXNpvMtfQkEtzgKvIhR1KfNVNVRImFkTv54hAy5R2P+/UNR6G0AVZpMEdeRpWXi3x
         K5R8nsdOv3qLcataN6QMQTmGbK1dNuLyCUL3JEYntOa33y9+JnvCqwQG57vMndxgWO1e
         6gaBfKNrnguPUNm6o43J9f+pvjavmJZHaCQnuqLnimmQKqp73MRj3NKmoqNojH7K1gVJ
         wcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770206901; x=1770811701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ioG9uYV0HuJP9D1DgqNAsKhOMqjhdFQVQ0SW047PMUE=;
        b=mSQGMGwmfuzOBlz8KcVJUr0Y9t7D4C1mlzMAH3CXvmArznC+OXLbww6KH1H/2oG5ax
         BRurlwv2+CXKUE2vRZdJcH5E84Bpj1oINwoOqJVXXrPczx+KedtLtNVBBNn3wepVdJff
         VTSV4xoszXCQTvEM2DQ1oiUwRk0aFmniyYfZY2JVMcyyzEuW8UR7OwaffOC44LKJYBEZ
         cNUIzjKHTd6nEOoiNts1AdfkZRVIhgZleOmIDt+CzsiKcwtz7EihxSRLeuiQ3Mc+ErQB
         agHJH6aV3sdr/N3AQ5Hh7Gq90h3T15MM2twUPAsejxIb9qvlUMTvKtHn2x9Zff8LkT3H
         ddUw==
X-Forwarded-Encrypted: i=1; AJvYcCXv5QST26rE5rQhDCWqVwCpJfhvGQ76mkDNSnf4HfoFHfo70WqEFlvcGgoKx3sNF6JPRSI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWi4DZOBfM9X6vXoEe1ccJaz2K1HjtQgv9r4ZhVY0P4qQfYxJf
	1UqSPskLmCrdbvkgAc+x+fiXTknDVWdJzPaxLMCHePvN24sw7eAedSvMaY36EtmmK3U=
X-Gm-Gg: AZuq6aIrP8tgw92JF10NnrRJaY3FfbXnEu7hZkGkm/icsaReHvPNQ5yDdGlLoJJrUZV
	FlOyIX4od49ucR3adIHxiOYVO5qhlhbBBvUBEVGnsZ3+YRvHky67FlecphTQEKQgbeESoOcUn0a
	4QCpRsewZKNvhrViraHoMJrQ+y0DJDYNpkOFbdtK+K4f91JHkrMMBtGtagoL5RsYLGKqB1TUbGR
	2T7y3des1ADXsdcoiXH8NY3xh1/eWs//pVmOGEWYVJyG2dj+zAAkd5zZh4yXIiDzSZJ7gAIZ5zy
	yLHwKGTz6GYobrPe/rlGee8HXpW7i1g1KCEKrejDd80JMU+hIoVfd1dcu8bvPEZtASqWuoL6b8w
	RcPlWc+v/9QVraw54Hu7KO3+I9ctIIBx2c2VOObDGJ2SQJJkhW60H7D+DHs6xTIs5WSp/EhXveu
	Md8y4+ySiTYfTYaBV5/5Wy5QRYTYs=
X-Received: by 2002:a05:6000:288a:b0:435:92c6:d556 with SMTP id ffacd0b85a97d-43617c84202mr4190603f8f.16.1770206901187;
        Wed, 04 Feb 2026 04:08:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618057f7csm5851345f8f.23.2026.02.04.04.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 04:08:20 -0800 (PST)
Date: Wed, 4 Feb 2026 15:08:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>, Chester Lin <chester62515@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	imx@lists.linux.dev, Jan Petrous <jan.petrous@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <mbrugger@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, linaro-s32@linaro.org
Subject: Re: [PATCH v6 0/3] s32g: Use a syscon for GPR
Message-ID: <aYM2sXq2FXCISrCI@stanley.mountain>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
 <bdb7cd69-7dcd-4e8a-b04a-14a2eb902311@redhat.com>
 <20260203145438.5a850b61@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203145438.5a850b61@kernel.org>

On Tue, Feb 03, 2026 at 02:54:38PM -0800, Jakub Kicinski wrote:
> On Tue, 3 Feb 2026 12:18:54 +0100 Paolo Abeni wrote:
> > It looks like patch 3/3 depends on 1/3 but it should land in a different
> > tree, as patches 1 && 2 looks suitable for 'net-next' and 3/3 should
> > probably go via the arm/freescale tree.
> > 
> > We either need explicit ack from freescale maintainers or this should be
> > split across subtrees, right?
> 
> FWIW normally we don't touch the dts patch at all, unless the
> maintainer chimes in and tells us to take it. No waiting for acks.
> Off the top of my head us taking dts patches only happens if 
> the person posting the patch _is_ the platform maintainer..
> 
> For this series we're waiting for the bindings to be reviewed.

Ugh.  Crap.  Rob already reviewed them.  I included his Reviewed-by tag
in v5 but I accidentally removed it that from v6.  I'm so sorry.

https://lore.kernel.org/all/939fdaf94038613486bdbba510a92a1e57e18c71.1769592679.git.dan.carpenter@linaro.org/

regards,
dan carpenter
