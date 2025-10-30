Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D012512E6
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 21:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761860728; cv=none; b=d18pDmupiYDGtAOeuNdIfvf4wTekPLAAiBp+T8rvIgW5kaL0Mpp34627Qs+MAC7GkzwzdJt83mlTMFlcsHvQpyZhvWhJX/WSNkmdCZNEwsp16xO5WDrfayrFVObPBNVAif+fw+poW/gmiXCkMVOFHAMdOT7+xEZY+r4LlAbHU0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761860728; c=relaxed/simple;
	bh=uBkk+tHHrc1rrXHOAF46QAp6kvFsvo1lCdXV+dIoOAg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=eJM2Dm3hpU1EbZW/51lsJ75lxwIbh+/6qOdvwGCpYZWKz4Gx24X1Z0xz+fN8SGlpYovrGpqPl6aU+3YcANl4cj+HB0H3WBOb3dMSBSUbiD1RvtSggXcD5ZmHcfVBZhjddNpCqAjTvltN2q08RdLXZbud2LNk+myO8N7ZAQ1mZvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFQnq7C9; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFQnq7C9"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-61feb87fe26so2624477a12.1
        for <imx@lists.linux.dev>; Thu, 30 Oct 2025 14:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761860725; x=1762465525; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ooLXFnCj1JQf5bLHzgDLlFMnUZG9dG8krO6XUPVWSM=;
        b=EFQnq7C9K6GuQwnEp53f7f8ByA0E9Hdgj0kyqUE5QGeaX8US6SqnbiiVBczz1e3kC4
         5320Y4+Xpv57MWoepaOGeO5pPpDiXC7PQJlLzyWmBJWpmroF1cHsqdNQaPlG9UlFp+n8
         Pn6Cm57TSsuq7cN2ZpRgSQL5HqIrHhtFYz2lgXF3WM5i+AQvV0NLF8SUe8lG7T7QLVuW
         qx7NoeSORMTgZfl2EXwQGJ5Oiu96mKnXnZzVkxH0NvtxiKiJehvv9Fk1rvhW6ELWpf+E
         XiDzLBEip6B50ROSrGu92BSrevxCTEb3tSZNPztB7gD+uswfM/0mXD8NCywoRE2eydmw
         qbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761860725; x=1762465525;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ooLXFnCj1JQf5bLHzgDLlFMnUZG9dG8krO6XUPVWSM=;
        b=tH71+HJZekynoSUjHvrZeWsJKjCQWaSLcC6/1MmziWqGPrXWcCfZ5io/iZP6n7Rsj3
         wIP8RfYpa1g4mevd9F1ev68Bcemvp5CvsYyOV0tylb8F5ZEwFcje+ZDa6lbljIQyx/Wm
         LsJovVc3KFvS5iK9MQ/zGgN6rqfiYJvLPxOB0Uadnx8m86JvFJFZfnf2adCc/ww9Pk2E
         qGK+5f8A0+cGpqtiYUYf3e34lBCIysRZbB0NUXMqFLxUGL/DRUOgY7rd5JyV3UJ/5/K+
         q7Xim4T/3Jq5DT0v64RNh1G2EpHs7VbuKskzVWOgu1DD3BRhbDJZj8b95QUNtj/VAd6m
         BHWA==
X-Forwarded-Encrypted: i=1; AJvYcCUksrq/NGV3blsByCqh+MRjw2Xg3CcKDDH3QNaB2l1AgoLwxAjeIuZyRxo2wWj3JKea9Ps=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzLfYPNMu3UzgFOrOrNHhqG/tZBfAsix1EoiBqXcZgFTOExK1e
	kgjfqFpDtEuLPF94GvGvtPo8nxB5Xs5Q+7qar3FdH7HZhAmvVlMXRU/g
X-Gm-Gg: ASbGncuhOhvM4GfgAaU+WkSoKUl0Dcd50Homck/9ofqn7BBEBXFAs6MhPD1Dz/AzL41
	FcQbXJuuRBTUIbcoMULhi9OGI67CPyrdvTcfsZIRkZZqnvKl1F9M77QyUVqmiSNJoRYikET6JYG
	NAh0U6+zvwgt2zCTknT4AGnWr+0Y1vgdyczl7CRKcbJxe4CA1HHylKHZvJ8mmEPk9VDks669OPQ
	P2OejenZI9WluBGe/tccwva5NKtXCLDDjSb8/B7/f2wyI9Dy7vP0+a1dBmilZEFI3f11fqiuB8e
	ijqXmaA9dkLEWONZIlL39VQPgkuy+re0KdjVkTTXJlbeYd6lZfOc9iLYsiXieE2o1XUfVcWRMbD
	RnSycrnq2DiqzPqBHyBXTT1bmLpRaUhyRyzAXLckNo3Km1rZeTgWxy/YYrVkxYifA7f7AVWR97I
	XDR3fB2GcAXHNdpKP9LjZXbryDcDkVhQN6EGWubJJyME4pvusfA8AzXDQivi0errvyoJPc4SXKH
	l0wwr33SGwDCU8KHZdbYpg4j5dc+pCPH0OSo+WEWzg=
X-Google-Smtp-Source: AGHT+IGhyymQfHr5msGL4ysnrrXsuX5kI/Bs7xqXWjhPsbZ1HNwDrWmnY+RRZo06Z6Ip4+Ixlwd6Nw==
X-Received: by 2002:a05:6402:20d3:10b0:640:6e1e:40a with SMTP id 4fb4d7f45d1cf-64077020c84mr772375a12.25.1761860724741;
        Thu, 30 Oct 2025 14:45:24 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f48:be00:f474:dcfc:be2f:4938? (p200300ea8f48be00f474dcfcbe2f4938.dip0.t-ipconnect.de. [2003:ea:8f48:be00:f474:dcfc:be2f:4938])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b34a735sm17978a12.1.2025.10.30.14.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 14:45:24 -0700 (PDT)
Message-ID: <8983b705-6bca-4728-9283-7aa60f49340f@gmail.com>
Date: Thu, 30 Oct 2025 22:45:30 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 5/6] MIPS: BCM47XX: remove creating a fixed phy
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Chan <michael.chan@broadcom.com>, Wei Fang <wei.fang@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
Content-Language: en-US
In-Reply-To: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Now that b44 ethernet driver creates a fixed phy if needed, we can
remove this here.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/mips/bcm47xx/setup.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/mips/bcm47xx/setup.c b/arch/mips/bcm47xx/setup.c
index a93a4266d..38ed61b4b 100644
--- a/arch/mips/bcm47xx/setup.c
+++ b/arch/mips/bcm47xx/setup.c
@@ -256,12 +256,6 @@ static int __init bcm47xx_cpu_fixes(void)
 }
 arch_initcall(bcm47xx_cpu_fixes);
 
-static const struct fixed_phy_status bcm47xx_fixed_phy_status __initconst = {
-	.link	= 1,
-	.speed	= SPEED_100,
-	.duplex	= DUPLEX_FULL,
-};
-
 static int __init bcm47xx_register_bus_complete(void)
 {
 	switch (bcm47xx_bus_type) {
@@ -282,7 +276,6 @@ static int __init bcm47xx_register_bus_complete(void)
 	bcm47xx_leds_register();
 	bcm47xx_workarounds();
 
-	fixed_phy_add(&bcm47xx_fixed_phy_status);
 	return 0;
 }
 device_initcall(bcm47xx_register_bus_complete);
-- 
2.51.1


