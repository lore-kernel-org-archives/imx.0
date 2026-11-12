Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794516790;
	b=WvYHnPF2s8tHG2Uv9qQAzgjD+xVLh0ShA/0qptC3wNFIvC+IIKN6FZ3/HotzT4KJ5WkL
	 pIdGuBfvKpAJhbbWn5NP2df6M/gSWj8C6niOsnjBlGdmxr9MvbNUY5vkqiIcovAcnCMb5
	 O1IRm4egU0NALgHulUy3L4T2+/LR9b1bLa9GAIzsoDn9Lq8+limegm/YTItC/T/SU31CZ
	 AO+VN20N2Y2S3V9QPMwBKYz5n+7SZ39CWpzgVVjwLVCmH/Ny7o44fXXwpcb/is7CoS/p2
	 CNuRVD8aBMPAsXuZjM+SITbYABIv9jGhKB0MOxkn7toCiN+2f/aIhbHTwXiyapu4ySw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794516790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
	b=Mk/LWloIWCOLkjYyy2pc+pZrm2ePa8+UvnhpZuFE6XonDoNcwled3zeCzkbL3ojUKAGz
	 ZVzqMlGDwmbnMIzNw1lJ71yBd0lr+8eeXbK5ojZsh9/Ha8q7XBYC7eAZR2VGeXyErUe3m
	 +nQXngraKX4BOcXp2s1vbueZyHtGDDfHkgFGH7NVK8CZeJ38OditZ8ZKDOqWiOo0mYh02
	 p6IsWqZDF3UNRaMfsIBDMfYN73qvQZYiOuXNLc/qeDX4C5I/Wf4kVMEEUttPZ9MSXM/RV
	 ATj5MX3FpgcY54EnNJVDy6scmCSqrM/kvkVAGMO+Y8z3B+h44NJniPr1Alta/W39DkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UaZAsWj0;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F7C606A883
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 20:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51F7C606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UaZAsWj0
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so2807635e9.2
        for <imx@lists.linux.dev>; Thu, 12 Nov 2026 12:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794516789; x=1795121589; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
        b=UaZAsWj0N7XwaDksCWXvuuN+eGaY7BtBUPpDT3sCkU/XJ2Nb5DC+v9Fj1oFYUjnJwD
         9pv4RjOrScrwPlqfywDg7TNCFYE63v7lxf08nFjZ2KQsZErzq2I3X7c/tzcPqp8/uAIq
         3IwhSJGYnnx0WQa0BJha71N/cYtgth5TMKVKQxRRV7WrO9ZuQQ6h8er9w1bnCoOSM4s9
         w10anssMrmt9h55LnebL27dEHbl/VfEANSVpywHXmvHWvOdBW9fhj8oFHDhEsDitrxSp
         mscSXPRWfDb4U2M9h+SUtE2b0r5XRz1v1rMsvXsJK80tqa5eWsjCbWBWKifprheENVLa
         ejYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794516789; x=1795121589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
        b=Ke97F1w53eBxf2PZU6gw3NDUONfCzLOaXba1aCR07ABxuGX7qyQaoFQeQ5lM4twkOl
         0ltTO4GpZuStfW8qvzFcJlhPwwdma5oNZiFyrNBF+5KVLneCphyiEM0mjgj0ETWHirxD
         NxkA+L2cBJvM+VwAgnC++gWSxEVQmn/IAzV+AplTowSoYWhrmwFXPN193EkqQf8cropR
         nE1Inxz6YXa0B7kUm2UY0eU5fo9IjQXUefyMJilknjyYGISYqFvf1ie37IB9XZxqBsEa
         GvHtOFP9qRZHYRigNBgxc95bXgpKrA1qVUkdsWmzWT9dpuewVpsV4ose/8M5JStJVaf/
         KujQ==
X-Forwarded-Encrypted: i=1; AL+hErHq/4JGojwn/CZ/kjODlzh1dVASxTwpfl9GICQ2HM9p/GJISDfELXUs560qV7HsPu4Fwd4=@lists.linux.dev
X-Gm-Message-State: APuU4Z9wBYT67wCQLy/BBpbsHNOkXJc+7TPMApbi4wSEnRwrUIlISjCz
	+8P5MV/4KNCHUMWRzmUK0qDCmvKpBAljvu5DKQC9Ng92xhkl2GMJMQrr
X-Gm-Gg: AYBFou36LSAvbuMXhJog7gFrw3JkoeRtv5YImYG6XLDWdf9TSRFYMJsmnqnXoPH/C6p
	+U/GjAPErZUst2jPGl33aW+SsMWMXXnk9YQ+jj+GxDeDK5tXXTJWa0OlyAvGJLMU8lcDit2tZ2p
	/j7ANGsmurNoJvTHbU47EyJZOzGd0UTrm88EdM1VFxIrq6YNG9XkC3KVNKABIh6zJJ7V54Vfvwn
	jhRX4P3w4DIqsFxqMhPpVOJRUKpI0L4gM1M475JQdcgvglZDeSL5WvJgtgqJadcIrTmp+Q9V+4y
	KRyfnyjqBi7YVy4mcN6QoGYC4lqv2s6xP9nCX6Lp7NohjetwuaYk0b8Az7Jc0lZiSB0S9rfk2Nb
	Ru7xcXh1bxT/XeMCG5vSY8N8GMoYlPB9Ke66nOMMC8gxttm0DRIiQtxm/hZuhWAW1Dp7D0VVCeS
	XQdFEjQr99U+dtDsQCtPEc8nSaLOSEeQkB+ggq5vWE7UkU3atKsk2a6zooZ/vb/t0CGL/JB/Dor
	ut8kzdhXSrqmAfrurZrI8DxwTSugUelF9ZItaC5Jnh9yzg6w2LXggm9Xy5Ejys45lTVqbiAjk/l
	NBpg4fXn15yJ2XYcDKHszE3wQYyF5IQcVWmPERYs93nDpCXRifBMnAAtYNGzJY8=
X-Received: by 2002:a05:600c:1f96:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4bb55a4ea81mr7826645e9.14.1794516788712;
        Thu, 12 Nov 2026 12:53:08 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm8695655e9.10.2026.11.12.12.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 12:53:08 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] ARM: imx_v6_v7_defconfig: drop the SY7636A MFD option
Date: Thu, 12 Nov 2026 20:52:28 +0000
Message-ID: <20261112205228.42630-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112205228.42630-1-pmazzini@gmail.com>
References: <20261112205228.42630-1-pmazzini@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SY7636A is no longer bound through an MFD.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index ed588add8d31..f02b5605e533 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -239,7 +239,6 @@ CONFIG_MFD_DA9062=y
 CONFIG_MFD_DA9063=y
 CONFIG_MFD_MC13XXX_SPI=y
 CONFIG_MFD_MC13XXX_I2C=y
-CONFIG_MFD_SY7636A=y
 CONFIG_MFD_RN5T618=y
 CONFIG_MFD_STMPE=y
 CONFIG_MFD_ROHM_BD71828=y
-- 
2.52.0

