Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035063ACA6C
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 14:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130305; cv=none; b=rHxQ4VDzmFvzM/1+Hm+EcsxktCpCTtsvP5sYqZcs2z1fyX+txfWfFSPdoEZZtA3IoPZsmUwrojPV78olO8IY98PySZVRWC44Fn2tWEb8xfVWnESDPU5wUnosTT6yBA/pI7EJGMwjf9rp9YYrrLwQOOdmslZwhQll71yXi/c25kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130305; c=relaxed/simple;
	bh=ucMcN0j4Ae1voA0dJmdcb6b3d9m2avLloAVQpB0Ygvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ika1Al3jAMnyYA3AusGjnBoN+AnMzLNDFJGjD5fTABKjVxemGiZRCqxk0VCcbX+qm3xG+CbrEhhTgSwOXIDi9AFxbwULZT1ylyPUn3Me9Gnc3j1tgJYajMjdOJepYRFVJSprdw3jQ50RFyi5NC+wq4s8ILN/+NL6/3Fzve/5cQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ukfkI+/t; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ukfkI+/t"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-481188b7760so38788645e9.0
        for <imx@lists.linux.dev>; Tue, 03 Feb 2026 06:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770130302; x=1770735102; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gVDbMP2h4x/mUb6G2s8x3K2KoBv6D/1Du/nOa/GGM5s=;
        b=ukfkI+/tB3iVOFtWV/X9WzGagC7J+IcUzc5zyUupyd4GiJv3GCEv7kvNLHMQz0zYsT
         AWxVAcBWDPJWMlDhs5or6tziOQ3QxMQg5NZeVgUsYvKC5qw+hqB3wIbm7MxssszNXBFR
         WOOsXtzqUw9P2lBhHwvyvn/9oEK/bgqHWondO2QUJuM7YubUK9Jd/UA3PciB6mXJ/R37
         YUG6rFpELcbLvdFc5iQROhOp3qlp0+aQQtLfbdKh2muAk6OzLjB5AAO47mMHOxuLTMH0
         vAOyF6FgammexMPEhVWKs7k2pd4tBZQ0JgRuJxWzXrLL5njtKsnII0x69REl7Bq2KRS7
         /Bfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770130302; x=1770735102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVDbMP2h4x/mUb6G2s8x3K2KoBv6D/1Du/nOa/GGM5s=;
        b=B9D49c1kwvYU9YWcWqHVivnXpdbNwZVJJa8grFIPF5heoNv1aBjaIYXHaACbFGkntu
         byMLJfdsiRNo1Ie+w6sGHZmEWgDLmxKqMzLnJSHM7AfnDBVPRwJWY230DvFE7fd4xrv/
         y01gwhzjdNIEUTIe+SAVEJRMBIgqdecFzZncRy4XbG/D1ANjshETxhOfIQof52u1LoVf
         Xu0dh3+3ET8hCrcl58jwjg4v3LXZoXPQJIQBqavuZwF0GPy29Pp7IwXyQLrPDUoxmFoF
         eEKJeWOjkTQ+Q07SuvGmAms7vMy50bCeXzBDXmZeOURDcVjixZ1CeCRA3FvQvGP2v+6X
         vFtA==
X-Forwarded-Encrypted: i=1; AJvYcCV25R9XKe+mLbfZsMlCuncXLcQCcPdTyPyWvMxArxmg8Yv246iLHGU7Bx9JK7EnMHYUr9s=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmeQOXAoaBqtyZr8ft4kfWHWNrXQoVY+L4RLsxnfhllAcvE1kD
	de54vmj4EhEuhlseGl/vjh+Joo3Oi7SRSffGYCmN0ah8pQvbCZXis6t601bqEGvf4l4=
X-Gm-Gg: AZuq6aJNFO/N5Z6RLCPIizMaK0212qetp8Se9aoPaPuiMoH1nfB+/79u6EvNd3u48h+
	pOMdFqr0ns/eYqshDM+Qws5rWVpktbuapaDReM4GzmVSfjtD8raDhaVU8OVEqg6JlpyDH1+TA0f
	xHdURGt57y1qJkj9PfBNfMygl8MONOm9Wi6jZzvpwJrRIFoVUp805gxvxBt60Vq8zXAVNk5P/6c
	JUq2HiBMYadCxuNeMiwmxc49vfiXbGkTZh6hVAsZi4+UgpcpbH5brWR8BVCP1eaCgX0R7wQXD2I
	TI5xJ0ES9fmWfH/FqQ6HiIGasjTtQXy1N9UVWqz9AxCc9aibQVf+FzscdE6tKvE2VkjlSHEX3G4
	8d3/gFyvatn/9DvrmtA9hIiZtLhY2WOEJ7mc3ckQhJEKJmmuqB7XbCHDe7wtWDWXi2fRgXxVO5Z
	Tv7OppgzS7TU64eX2E
X-Received: by 2002:a05:600c:859b:b0:482:df17:bbbc with SMTP id 5b1f17b1804b1-482df17bd2cmr154388865e9.20.1770130302262;
        Tue, 03 Feb 2026 06:51:42 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dffd47c2sm121508595e9.0.2026.02.03.06.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 06:51:41 -0800 (PST)
Date: Tue, 3 Feb 2026 17:51:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <mbrugger@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linaro-s32@linaro.org
Subject: Re: [PATCH v6 0/3] s32g: Use a syscon for GPR
Message-ID: <aYILejxAJef9F8bn@stanley.mountain>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
 <bdb7cd69-7dcd-4e8a-b04a-14a2eb902311@redhat.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdb7cd69-7dcd-4e8a-b04a-14a2eb902311@redhat.com>

On Tue, Feb 03, 2026 at 12:18:54PM +0100, Paolo Abeni wrote:
> On 1/30/26 2:19 PM, Dan Carpenter wrote:
> > 
> > Dan Carpenter (3):
> >   net: stmmac: s32: use a syscon for S32_PHY_INTF_SEL_RGMII
> >   dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
> >   dts: s32g: Add GPR syscon region
> 
> It looks like patch 3/3 depends on 1/3 but it should land in a different
> tree, as patches 1 && 2 looks suitable for 'net-next' and 3/3 should
> probably go via the arm/freescale tree.

Yep.  The driver needs to be updated first before the device tree.
(The new driver is compatible with old device trees, of course).

> 
> We either need explicit ack from freescale maintainers or this should be
> split across subtrees, right?
> 

regards,
dan carpenter
