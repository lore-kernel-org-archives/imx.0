Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010010;
	b=nyrQTtngRgZoiC6u2FvnC0XxgTDFyLxbPCtaCvo7OyyDLQDAypwJ5KlxoCRGT96g89t6
	 k+N8ZRn9MON3FbRtvy0aD+kog8X+VVdid6v0iPOlaiHrJUal5ww065SWXRCtbF7qhcYYN
	 8zXz6TemylNyKBY++jjAP5ngsbbxOTlz72UPjCUy0rDYeq6qcwOD+dU8KrEcd8vD8+/1Q
	 FJdoimt60Sr+deDo9vx9KrERdN4zS9TqpU2vkkb/vlr9YrePZPxp3hZ0519uZHongYg7k
	 nVf24j42ivJkW9rFwjacgOxTqF8Bj2+XKL4JvUoKBxNkLPEymd7liDKv3v9i0f+N7rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010010;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Transfer-Encoding;
	bh=b1jw8/k9HF1Z0QFcfzQluiREZXrKVRI5j5BkQVxckCU=;
	b=DCPKcvaefZjtJszoLd0KjKL52nVpiYz48JYR03hYnpT2/4pOps7ILeUvQNZDaE9qRsWr
	 F5LmwB589NYyIt4JZWw9REoDRh1PNiltMuEVZYeyexU5rdtQWh7s0svwe4hYgoZw+fwkW
	 z4KP8wLcSGVpGMYUI35x0+vetY+s+8+bJeysg0H+spVMzxplXOaYDQNFBd0hd7noW0Smr
	 j8GF2KyrY5Cs6MvU3AUmfwrKtcwYHDnYLy5AdfFf/KvP3QFaNfU16Y5RA1BBMUtOi+kue
	 112PofXPqJy1dw2PmwwN5jLq8Fj7Pqeqc3i23u4imcN/kXnDe2bTJG7fH14LsEF5WWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jb8hBDAm;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2218D606A32E
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 00:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2218D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jb8hBDAm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b1jw8/k9HF1Z0QFcfzQluiREZXrKVRI5j5BkQVxckCU=;
	b=Jb8hBDAm0JHwIBcBnEGlrMskZWWKmo3T1uWoWwLPtamxQnUjgLaqjJ0ghTUuxc7gsa8MMH
	iVkA80ZQJ9NbPAtUI2BxGHXs4CetkfrCBKt4AxYhEbjJwG0mOrRw0Ok4s0Xx8GB5s4nT//
	rGZy12dhZ6eWXSZD7sQiaYIdUBWinDQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-zE20EGNRPGybMJi_eXy2dg-1; Fri, 06 Nov 2026 19:06:47 -0500
X-MC-Unique: zE20EGNRPGybMJi_eXy2dg-1
X-Mimecast-MFC-AGG-ID: zE20EGNRPGybMJi_eXy2dg_1794010007
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-544019b1831so23294061cf.0
        for <imx@lists.linux.dev>; Fri, 06 Nov 2026 16:06:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010007; x=1794614807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b1jw8/k9HF1Z0QFcfzQluiREZXrKVRI5j5BkQVxckCU=;
        b=TNuBvKyJSj4P/xt9CRNgKf1VXdMwC6c5GYQSoTfFU1XCWw85s+3ZapJWxvlSXj4l0h
         oige1uNAsF8eR7AvmsYSke9VuPrBgCUI0l80aGhEos3eR+DhbzwDtR2HL0fGDPHv0yKv
         85nixwBtsXAvSnTQjCbd6Nw6p9q0Vsfh9LgUjwlSzlB1fYNRshhf8fAj2KItfs1hxkm0
         Uuz1FgxOZf5ENowQX8XkFSw5p0HOd8hQigx33aloP63pfSKIJS5KaSJvkju5X+20VfmU
         +GTjfRUpww3QcKOILjgBM31wcoxQnNPPY4MhtOfmA12aI+vXWvSZ3LAzVi95E6giKz6W
         OR/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwv50R9i2xYEsyM4W7vKOeP3xla7165o0yc6XX97WbouLL0GX0c8IpkLHXgeuW7DQ5a/Pg=@lists.linux.dev
X-Gm-Message-State: APuU4Z+C7XIwnBRcFHO0iW0rXmHO8GZec2Gl5dgoGcfcS/NUE5TE4jG9
	qUyadWjD8MrBZ1ohe93mLcbZO6gARR4hJBu5XTs+a0ZVdLnRNReIsQ2aY2hZxHL2OASqNBrz+8I
	wlgft8IEfR6KTlqP3sfb5gH+2anm6UbCtsF9a/lUmaAMAzVINMkmSRg==
X-Gm-Gg: AYBFou2Oyw9gMKs40UpRr+krC69LhAzYjcS1oqI9Px7zHLp2/fERfHfC30oCT4plN8n
	IONabEJsFPA/3QsmrmGeBpU8ZTgm/D07H2OJDDMqnrr17VcZEiLsooWD8fhrxDw3sPBjfCF6fDo
	9ar8k2Pgl/nis2wrtw/eSsKoCphaB3xi63ArrkbgQ+96aWkg4J0m0p84z9dLThoSTMHx742fLRK
	Z9pTESkIuRl37sri4QS1g9cQv0eVBLMEZVnhw6dVXifJYGnQ2Bqa9KkfSZzT7CQGHa4pmFFxGsS
	afKWppzYmM1JyD8eVWXkDgUIed9udkgJgqd1F/0oDSr+q3A47i8/2/yNPwAxTqc+c6x88ai2ZC3
	/XpUr3mWQ6cNPPSfHIzLVemXQodcg9NOGZjwvX8qjosAe+oQzeCsyNW9NqVt/DLmgkHYvVSubO/
	vw8/pwgEGbIbUbcU7R
X-Received: by 2002:a05:622a:114b:b0:537:f05d:881a with SMTP id d75a77b69052e-54e132997ddmr61751671cf.12.1794010007253;
        Fri, 06 Nov 2026 16:06:47 -0800 (PST)
X-Received: by 2002:a05:622a:114b:b0:537:f05d:881a with SMTP id d75a77b69052e-54e132997ddmr61751141cf.12.1794010006668;
        Fri, 06 Nov 2026 16:06:46 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acc4a7sm31624376d6.44.2026.11.06.16.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:06:42 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:06:10 -0500
Subject: [PATCH 3/3] dmaengine: fsldma: convert to subsys_platform_driver()
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Message-Id: <20261106-dmaengine-subsys-v1-3-780eeddbf3ef@redhat.com>
References: <20261106-dmaengine-subsys-v1-0-780eeddbf3ef@redhat.com>
In-Reply-To: <20261106-dmaengine-subsys-v1-0-780eeddbf3ef@redhat.com>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 Zhang Wei <zw@zh-kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-actions@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=hy3g6mWddGYLX6Myo7kSoYtQp+hY5Hbo/vUsysOb4zQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeZbeeNxabtVqgmXFuKMOEE2yy/Scinn4R5Zj7TWhOt
 atoruLqjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACbiOouR4cR1jkNqh68wrEm/
 stlDUKbx8PxggVfG0h+OhJx8eL8//yQjw16uPZumb/y3PVJc7N7WsJVuGVcamc2sSnpsTuX05Pi
 UMQAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V0wBga4NWPBHGbHgeG1jpx7kHwGEukH9O5oC1K-iUxY_1794010007
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Note that this driver previously displayed a log message during init
time, and this change drops that message.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/dma/fsldma.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 99a878ed1444..fd3dca7616a8 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1431,19 +1431,7 @@ static struct platform_driver fsldma_of_driver = {
 /* Module Init / Exit                                                         */
 /*----------------------------------------------------------------------------*/
 
-static __init int fsldma_init(void)
-{
-	pr_info("Freescale Elo series DMA driver\n");
-	return platform_driver_register(&fsldma_of_driver);
-}
-
-static void __exit fsldma_exit(void)
-{
-	platform_driver_unregister(&fsldma_of_driver);
-}
-
-subsys_initcall(fsldma_init);
-module_exit(fsldma_exit);
+subsys_platform_driver(fsldma_of_driver);
 
 MODULE_DESCRIPTION("Freescale Elo series DMA driver");
 MODULE_LICENSE("GPL");

-- 
2.56.0

