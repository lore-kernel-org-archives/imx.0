Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBBF302747
	for <imx@lists.linux.dev>; Sat, 25 Oct 2025 18:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761418381; cv=none; b=uK5QvbDsKJX+UV0OmYYV6yJ6TuWr+rQQ7fzt9dEpM+cFhHYQoIb2Uk04odD0+gCpsFqUi/G5DK6+MaIskFr29YRyfPtOSUHOzzm5Av3ULThi/hgfwfWmzm0VRlZIOryz7g8pBpu2eU+lBcSTfcKHJOzAML+GFjtLF+peUPUgeLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761418381; c=relaxed/simple;
	bh=++qhl4KSNWgMDQx7EKaOxJp4oYwDNeFiiI+BE3om2D0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ViSGOL4Bz1HnXeexUVMoJYwOO6sGD3Cqwc1Q8tUnZ5jYfQri19OsnxZwn/j5FSObBd51W6SHK8bksruWcvAySRMwCUjA7p6dhQ+yGZdLNSZrfQLr37Gq+1EiHNe/9q8KWUjWzGl55AzrKYslLm9sLvI8guVQUcu0wsGLyW7wT9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FuqRZxR9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FuqRZxR9"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ece1102998so2229729f8f.2
        for <imx@lists.linux.dev>; Sat, 25 Oct 2025 11:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761418378; x=1762023178; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rioMXLIytYS2vDdWj/lGi+EnzevNN/0HrVqMOMW5YCw=;
        b=FuqRZxR99DydHklM4/k4d105RljVbrmhw7NqsPB3FDJ4B9wzmEzzxPIhDaTnfxvi5k
         W/moXOLqQBGxiIjUNqawJ+Bka1JRi8oyTjlFwssqxFnKDO9ieEWHtm8pUqlVQNNBuNTf
         7cOD/cXsyBU07zPksBClKUOplQWZUx4RGPVNwg6s3IIJdwyEWpo+KmAadG0NZLcoSrT7
         zE9A6X6vq4Ex9I8KKRdWF6NBlBLjOhQ5BtNGvegSze5khioSEljruSvEY4CBwkXgqth5
         EX5QxcHbzAxZuJWbGrGjZvtgJFDXohRSP7LXKhbiudHOeP9nfYYS7SBEsBJX0UkKBSzS
         RofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761418378; x=1762023178;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rioMXLIytYS2vDdWj/lGi+EnzevNN/0HrVqMOMW5YCw=;
        b=YT8x4vpmCl6IjGqBX+cfaaf4pwlc+5o6DLNhcdp8I3ZgJuOJJLfVpnx9u5IFicTt72
         pc2RPumPcBk5PdlW2y0oobL8xoRjIm5oRNFW757u3Nv6+Dn2hdUnghNwYT0EAn6Kh3JG
         tP0ZjdhHZM800NNHz4DL78F6YAEw1I+l7TfeHlSmV1I0UdSHoQVYQ+HUq28gjeqtklWW
         nmug4XcaG5D0tweWDiZ39Ee427qzqjX2eNBysBVYGnN5kQ6i50ubJTjr6/PzrUvt1OZX
         kpKUpbzEA3nh425PjTt6lrT2g0cR7xEU2wuyfkv51dxrs4LK1dpKR04t0wPcWxkU7esS
         3Vhw==
X-Forwarded-Encrypted: i=1; AJvYcCUKHWIsDm/QFAXi3Ivt5WyC6iLyN0//kfZjJjbtCHsnF16iCmmfrzA0Uufv7EwffnB25LY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyewwRt9Ym7oDcuhOPU5endaivXMzhVYhEigG15Gxn0ux5vdM4A
	qqbUO5UowHFC3t/MtX7S7NduPd3A73d37H+Q/0ECR6XahQGSYVIYzKIK
X-Gm-Gg: ASbGncv/zg4tlFBuG7HhG+bDZ31avSAzxCSgnDlNVZcDi2O4Io32JiYnQob7r0gbJtS
	sJUpND9gH/7nATlPi8XNCaXl7wV3r0CeDjM4x4Jh80otC4+ElapnGgsn8f65bdbMpSQMNxVaW40
	Riuh2YcKEfgaNisiB8kZMilcvpQggjln6bObi4TZJXPaWO18/v7Vtl7E9uD9tDX1UELOghqYCjg
	EusOgsJ3HTjBszgRfpPyjZZlSa0h8cUTGuQ54W7DUR4EW5BFrE40o/RvklB0/vCpXCiwnxqhGa5
	KDo2y83L/0rb69lB6A9gxpIsmXJrEOg+YkNDh3vS1uhPjUMqoeCFh1s9JMzP2hOZ2RZY/RROyju
	hY32nIl0Bp04/4oR+2QV5D7tJlp1J01RlqBrYJ2hh1X0PpboM3CXuvKmQGSw3xEIUgtHVNvSf/6
	Xwzhz2aE0o8K+Bq5ZSwCiz3VCHLIkqqxKpf6JUPXdYQ5uah7C1LB7dpeJjiWYhmIXoGmEGBafph
	ZViJr6afAEVh/PfuzUVhVvHhwfyHjSX46xl/5Ydqrc=
X-Google-Smtp-Source: AGHT+IFje2vw71LCSYtKx715VjGao8U1JqPzcYNORegl3cXgFepLRp8cL8qgkSfxNKDPItoF8ydqmw==
X-Received: by 2002:a05:6000:24ca:b0:428:3fa7:77ff with SMTP id ffacd0b85a97d-4298a04e599mr7818417f8f.14.1761418377510;
        Sat, 25 Oct 2025 11:52:57 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f39:8b00:d401:6211:9005:e76e? (p200300ea8f398b00d40162119005e76e.dip0.t-ipconnect.de. [2003:ea:8f39:8b00:d401:6211:9005:e76e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952cb55asm4956750f8f.17.2025.10.25.11.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Oct 2025 11:52:57 -0700 (PDT)
Message-ID: <6d792b1e-d23d-4b7e-a94f-89c6617b620f@gmail.com>
Date: Sat, 25 Oct 2025 20:52:56 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 net-next 4/4] net: phy: use new iterator
 mdiobus_for_each_phy in mdiobus_prevent_c45_scan
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 linux-omap@vger.kernel.org, imx@lists.linux.dev
References: <07fc63e8-53fd-46aa-853e-96187bba9d44@gmail.com>
Content-Language: en-US
In-Reply-To: <07fc63e8-53fd-46aa-853e-96187bba9d44@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use new iterator mdiobus_for_each_phy() to simplify the code.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/mdio_bus_provider.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/mdio_bus_provider.c b/drivers/net/phy/mdio_bus_provider.c
index a2391d4b7..4b0637405 100644
--- a/drivers/net/phy/mdio_bus_provider.c
+++ b/drivers/net/phy/mdio_bus_provider.c
@@ -249,20 +249,15 @@ static int mdiobus_scan_bus_c45(struct mii_bus *bus)
  */
 static bool mdiobus_prevent_c45_scan(struct mii_bus *bus)
 {
-	int i;
+	struct phy_device *phydev;
 
-	for (i = 0; i < PHY_MAX_ADDR; i++) {
-		struct phy_device *phydev;
-		u32 oui;
-
-		phydev = mdiobus_get_phy(bus, i);
-		if (!phydev)
-			continue;
-		oui = phydev->phy_id >> 10;
+	mdiobus_for_each_phy(bus, phydev) {
+		u32 oui = phydev->phy_id >> 10;
 
 		if (oui == MICREL_OUI)
 			return true;
 	}
+
 	return false;
 }
 
-- 
2.51.1



