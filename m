Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010006;
	b=yieZQJI1/BqTEnKayBlBlSjc/j6WSgDuBi2fJrrRHkSeUBh66nCgtPORtjsJI2q0IbNj
	 5YWN2tcoCSzy2jTPO60apdDhN9YH+ewuA7uBJ6Cl+IDh2HEHaO7H3N32xua70WGZYJKbf
	 8Uq99E7t87vNRVK8nCIVqbwRQKfw0nNjVO4KlDqtNJPq0QwyMxAzTYvzbJc2owtN6Q1UV
	 oDj/OC+0BSxBLuuKHI9VI+TMInxj0VHKTXAPXMPkxr20XNUJnYw8cQSybNA6Pd+RK+X4x
	 C+WeG3jMvqXIPEAHRG9aM9SjM37KZcf+jVTt5UAx+Ut10Y6Ogv9tQdauVR1UcADeOIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010006;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Transfer-Encoding;
	bh=XP2lKTQGAydL4R+xsCm0cY669RVVtn0VvIRtylww03o=;
	b=VMCmwPtwG5Xb7SfWR59T1pjeOp2rjpX8DSQ+Ofd1xSrMY7Di9qkeVKbjuq5dy29OFgkV
	 og5I1QXetybgumvEMhxxaOHpQj339oFe3G3fgbppIne5ZsF72Ah6tFqpH/vEZJ6tgbQaE
	 Edx6TRfgpaGb0vvLNMdK1pxeYI5axN8/Pf2ucxj7siUNonWbMCl6FBlLXhN+3+T7KIhvA
	 +ev2GC49Ff4eBItfrRT6betIxMFv6+F+Q+dVoh8XMynpUYQXQ3i9oWAi3fjZXoskd6I92
	 klJYS+uXbuwqWSjlkz7J+JvyV6z1W0F5cNeN8X/nsCf1fxDxINHM+C2dgDjgurtdIwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eRwlbATG;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF9B606A32E
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 00:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FF9B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eRwlbATG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XP2lKTQGAydL4R+xsCm0cY669RVVtn0VvIRtylww03o=;
	b=eRwlbATGuePqRoUfDSZ9qs0RrDdYZ+KAJ7W8YOSwyruxWr6QSwtuhfpmSEKbs0RkuvS3tq
	nDRF7ibxDb2QRowCIcx4fyeXiTxtwfid4l4jQyVnUyDmgMfNi5M3QTGt59FIsuMAveEHIT
	gklSeZm9ZhWhFE3Jsw4LD7nznNwoFKE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-tBdebjeAOCSqRLGcE3lOJA-1; Fri, 06 Nov 2026 19:06:43 -0500
X-MC-Unique: tBdebjeAOCSqRLGcE3lOJA-1
X-Mimecast-MFC-AGG-ID: tBdebjeAOCSqRLGcE3lOJA_1794010003
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e49a1d3b1so210554785a.2
        for <imx@lists.linux.dev>; Fri, 06 Nov 2026 16:06:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010003; x=1794614803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XP2lKTQGAydL4R+xsCm0cY669RVVtn0VvIRtylww03o=;
        b=OHe8DGPegj1606suFMtYSHRWYeKwhDHr/gX6lwvoEHZAqjdlshkXw9VUbms5vBenU3
         YYEsCPPWdrCW8Ygq7Wz/JUJnVfOZX6ibDhtOj3ze8YlS70+zzUKQTwTnAUbybw92D1j/
         EJ8ZbdzhX3AwH3yIr+jVT9k4BOhPjTSIAvXeUs1pzZ0DnI7Rkk1oBZE6qAyY5J93u1yA
         7Zqp0zoxvWgC+hgvHvbCzZaTOhDQdUaDLDVa/8LGB9tnnl6XpY+QrXDG00b/zN/Yhfm3
         emW3ohmVT1agUZ3pKIIPnuLRwIN3WGK5CE7THCI0WRttGwfnckgZhs6zuVUb4cO5dnPC
         lUBg==
X-Forwarded-Encrypted: i=1; AKwUvBzBTgt0EmbENrMmf55SHZ1RoVMzZlC+q2WU28hy0gRjM2EEXvzjaDKUo3Bz7ZmJTC9vVVk=@lists.linux.dev
X-Gm-Message-State: APuU4Z+HBovKsSuUr+paDsrfBpTPbfd85CB5g0wNqFohdxsaMNgkgo6P
	v+LMMLVHqTOfadYb//5M/bJKPeffk/EzElJhq+hSfK1iNagAHvPO4Wn93hVxP3quGYKz7vuJZIy
	uvzNTqePYx5kU+xl6DRZ0fcCY1XlaVU7bc2goQ64qN0bn+BzGlnJcAw==
X-Gm-Gg: AYBFou3TgHKymfZ/U6idmowgJbK0E7jEFKzhRyeZMZ+K5wUJFKEicuMLZvL30nVhajb
	LmF6BkY3FFpxkNLmEfifQrtua41ak6w+f3bBs323EmtUSz0bus6/1FZLJ9Si52VZd+kKmC4eO4X
	9gCdV5RvPJKf8QYFk5i3mw29E0SwIfXt2XejBo6FfnT9mwEj240lrD0Po7Gz094j50ztCq/phIM
	3/H8I1qW1FyAcCI96qrEDpLjkvI3X1wpggP+q38scKg2xBlj7KJ8LYzNz9l1fI8+MB7bJHveFK+
	reXTWi8K3QNKhzBg0bcIpH5eSrRNhdC8mAoOW5blWy6mKzTMBZnFqeVErrR1mpr8eEt7KV20vps
	WowzXZjYZ2Qtb560nbgJkdwjXYv5a6xo3DNoKsmR+f6zrozLzA+yBt0MlHMKZoaQPRk+U5OPsl2
	EOmjQg2gnMR4AbXZuD
X-Received: by 2002:a05:620a:468f:b0:93e:6325:ae6d with SMTP id af79cd13be357-945f349ce35mr704447085a.40.1794010002601;
        Fri, 06 Nov 2026 16:06:42 -0800 (PST)
X-Received: by 2002:a05:620a:468f:b0:93e:6325:ae6d with SMTP id af79cd13be357-945f349ce35mr704441785a.40.1794010002132;
        Fri, 06 Nov 2026 16:06:42 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acc4a7sm31624376d6.44.2026.11.06.16.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:06:41 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:06:09 -0500
Subject: [PATCH 2/3] dmaengine: convert to subsys_platform_driver_probe()
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Message-Id: <20261106-dmaengine-subsys-v1-2-780eeddbf3ef@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=FjTOp1M8Xy8WBCnxDwFzONX6zQMkkI1R2AYzFx+nwrU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeZbdoi/pLp60VjjwvcUxslVrirb5DV/utktpvPDq5W
 Wn/wb71HaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEykdQkjw6JqyU0+3VVfSzWl
 u41X9l86OG0B89PfCwV8v3te0lN3YmD4K1PKxrDgtUqx6oLWQ+/ii6VYfpw6XSt0c6OA5Me1z50
 zWAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W38lxUDYGsJP2YCV5p3qZlnFXmjZ-6L48xGLdfC2VE8_1794010003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver_probe().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/dma/imx-dma.c   | 6 +-----
 drivers/dma/ste_dma40.c | 6 +-----
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index 81c6276436f8..8e0e82df8c5b 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -1238,11 +1238,7 @@ static struct platform_driver imxdma_driver = {
 	.remove		= imxdma_remove,
 };
 
-static int __init imxdma_module_init(void)
-{
-	return platform_driver_probe(&imxdma_driver, imxdma_probe);
-}
-subsys_initcall(imxdma_module_init);
+subsys_platform_driver_probe(imxdma_driver, imxdma_probe);
 
 MODULE_AUTHOR("Sascha Hauer, Pengutronix <s.hauer@pengutronix.de>");
 MODULE_DESCRIPTION("i.MX dma driver");
diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 2e83503f71d1..4fb54c8f2d23 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3990,8 +3990,4 @@ static struct platform_driver d40_driver = {
 	},
 };
 
-static int __init stedma40_init(void)
-{
-	return platform_driver_probe(&d40_driver, d40_probe);
-}
-subsys_initcall(stedma40_init);
+subsys_platform_driver_probe(d40_driver, d40_probe);

-- 
2.56.0

