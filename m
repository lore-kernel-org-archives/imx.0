Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A520D314B7A
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 21:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761860614; cv=none; b=TXssBBlyft+ZiLM32xZYmmszKBv/Ca7Ld5vT1Ayqi0a+WboJBWVoRyqsk/e2S9gQzPmlMDfmPtigwlpRjr7dWava1ktIjNYZyJhrJQyHN5SvcYiXZB9fNmHj2WdkDlk4nNqVvDwQYj6vK3ivDL5xkugwIIZmvz3NwTKri+VWi5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761860614; c=relaxed/simple;
	bh=726SBCQ2p6EtS2laU45uEz8m/+eOynHeRtx/IHLwsK4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mgr/LzncdAEB0+z6645DOt0BoAWYjsio2+pCjEn3A9cTqfVjQ58F8uRMtEkqBhf7kiqvGpsp9wIrAiQm6+2PzDPvbyy1tu/JOoC8uuxeB/0l3SO2AsDUZ5oXDk+nZfD/WJSHMlFYWU+8u3QTeqtQqcKSZbk6TVq7iyfcO9QBvIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbe5LVBt; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbe5LVBt"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-63bdfd73e6eso5079777a12.0
        for <imx@lists.linux.dev>; Thu, 30 Oct 2025 14:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761860611; x=1762465411; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ir8AQa1wMUOcSt+/a7sUYtl8GxEW4QEfEGayOfnmqow=;
        b=bbe5LVBtdH6u1UXDjv/X2imum+GFvQ5ngNyacTkG0ojlTkMHkpGvJhLZBnIkvfmdPB
         BeqkdZYJ9x+Bqr1S4xpJxyk7tkp7S7iDa+0jOT5MejEjTuYm9TkzOuVeMMYxAJMCFjJp
         gPfY5kB6GHTxuMVvGwLH21HDsjqpe3N79vbrVvV765B95ZmdQ7hQgUKGB0FYnGXB4VIk
         nM0JeAra34bDLXFyNWawZIyPcAwHwL1B0CUBP/kcv6inkBdNC2kZRYOKQFKuJ9p+vqcz
         iqr4aK3TUKw2Ze5LU/IScgr4P1vKKSYbAgV1a1TG7l8JplDhG36UDjLz9JNiooO3HORi
         BhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761860611; x=1762465411;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ir8AQa1wMUOcSt+/a7sUYtl8GxEW4QEfEGayOfnmqow=;
        b=SDMVrKb7PA/+cNDQmXJ4EquS5S7TeaItFOMep3zLsSiDGJ9ZBW+yq5z6ySUlzWy2SG
         N7aDPdN5BKkYTjveZY8fdLCIkPGzgWjxdiLH/yv2Sc7JslseCSMbDk6aCZB+IVpgouWE
         RNJR2bVO/8MrB77J1zx6TzWcpoQiqGZfzB0ak1NU+O5l7W2bZ9olqfprciUf7igsycgY
         VEME2KVw9mcRR7VygXdSieO+8GsuxSV23BOf49lTPDdk46OddLlSTCy7AZH4x6MZOITk
         DalvMW8HBaoSk3BLZuRSANgYRrF9ZcofD43xq1gt9JpreK4Jz/UTogRfzIGAOMGQ7QM8
         YjeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNV/zqbVfdSuJ2hqPQhhslzmatyvFtCh6V1a8fGNKL4+6Uv5XKmEqV8WTHowRZap+ElH8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxaimxh551+2MyowlEJlEv97ySYmL6hORZNaFbbE1gxigbXD6Ze
	xl8gogSBjGF3pw1/CLBuWhRKy3DmRP189eIMWecJM+n3iD3E0Ij2NMqt
X-Gm-Gg: ASbGncuDDDmLbLaBg5KY27vJi0sreW89Es9NuS57AAZJ5pEeel3hIbdKUu4sifHcFFk
	FfAZFVso5AgCZrA408k9qyhvrOsMaXu10OMcKcJ84dwsoaU57W8n1hXREVMquSkxp/HIonk7v8l
	KrUmokHvVo0xV7ABuzlHvZl42k8W6NiBS4k/8gq+Ks5VDBVsWbtA1FD6gtZKgtsbjJbrvVoqI9h
	f56KCGBfBYgZbNVSvzYbugcOA780RwKfFzxf0b3FBQ4H0/gPNQVp5VxxBcoyLgKa7FsH2PbqfWx
	ovJWefg+S8ZnY59rJ8xVexKaInMfsYPq7OJhCeWXX/zsZ1qntv8QewO9eN1CTQ4Kk0Q/wWHEIBP
	xxeYODCx4d+6YsvPnjtQnYq1jeaBwo7u9jLhSpmIoQqyaicYUmTWn/8yujQCHiEUxhHeOphmJ+8
	ERBb9Pu+kzvNZM87sa7PjZWbR7eftOkSGJcnF/x4xUQUN8GJjj77NtP8Sjv6JnnWYwGo0FNwKIz
	EgEhW7vpzLXcv6TJcpfygxVEoyqxeSKrImag3eNDDE=
X-Google-Smtp-Source: AGHT+IFin9LuBkbb0AYlwQbtnRdbrtyDgRJm0skxN5mswL3VB45tj8ToOhRdUQJToapuvAyVdWHmfg==
X-Received: by 2002:aa7:cb83:0:b0:634:bff4:524c with SMTP id 4fb4d7f45d1cf-6405efcc89dmr3248794a12.9.1761860610802;
        Thu, 30 Oct 2025 14:43:30 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f48:be00:f474:dcfc:be2f:4938? (p200300ea8f48be00f474dcfcbe2f4938.dip0.t-ipconnect.de. [2003:ea:8f48:be00:f474:dcfc:be2f:4938])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b34a03asm14294a12.3.2025.10.30.14.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 14:43:30 -0700 (PDT)
Message-ID: <212e0cb5-a2f5-460f-8e03-3c3369d0acf1@gmail.com>
Date: Thu, 30 Oct 2025 22:43:36 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 3/6] m68k: coldfire: remove creating a fixed phy
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

Now that the fec ethernet driver creates a fixed phy if needed,
we can remove this here.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/m68k/coldfire/m5272.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/m68k/coldfire/m5272.c b/arch/m68k/coldfire/m5272.c
index 918e2a323..28b3ffa25 100644
--- a/arch/m68k/coldfire/m5272.c
+++ b/arch/m68k/coldfire/m5272.c
@@ -16,7 +16,6 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/phy.h>
-#include <linux/phy_fixed.h>
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
@@ -103,23 +102,9 @@ void __init config_BSP(char *commandp, int size)
 
 /***************************************************************************/
 
-/*
- * Some 5272 based boards have the FEC ethernet directly connected to
- * an ethernet switch. In this case we need to use the fixed phy type,
- * and we need to declare it early in boot.
- */
-static const struct fixed_phy_status nettel_fixed_phy_status __initconst = {
-	.link	= 1,
-	.speed	= 100,
-	.duplex	= 0,
-};
-
-/***************************************************************************/
-
 static int __init init_BSP(void)
 {
 	m5272_uarts_init();
-	fixed_phy_add(&nettel_fixed_phy_status);
 	clkdev_add_table(m5272_clk_lookup, ARRAY_SIZE(m5272_clk_lookup));
 	return 0;
 }
-- 
2.51.1


