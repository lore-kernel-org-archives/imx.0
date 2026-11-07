Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010004;
	b=dH9VSItSd5/+QAOaVhmnrcqQdyVw1AXjeQdQpbCtrvBDry7DMCla++uazqrG/o0gyBd7
	 RdrGU9zMVXbZHahHrcDAm3NSjps9auABscDFozIpSedhqlFJ8mOGGg7UZqP4x2j8x3bXI
	 3HblK1p4ZOgidzLCAKWuaI67wBxzf7/4Z+Sl8FISQeD4sPZVA0UT60AItTuLYZbmwwKby
	 c4tVYjQT/AcsD72u7+UbafHccWGxcH3vpt+9XSzfZkIfu9AwnXrsLbnN+zloQn5MuDV6a
	 vB8ZLLz8rQ4OT6uAQrCsNutiK900Z2KTo0kvhvhvuUqGdkILvRhImOtJ6xR4B3Io+TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010004;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Subject:Date:Message-Id:MIME-Version:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Transfer-Encoding;
	bh=ZgUlYm807ROoByleEtNqO6HkY1e2yjPbq5r68jDHbbY=;
	b=RbB/xMtaYHQwJHfdmxmb0bF+c0Cm8FIc+nH2J4nms0Q13zYaGoNivW26YsbAx17qVeMU
	 gH1AC7xQSozL1/g0hQ/znzvkPPR7PtRY8AVI05HhnJccU289TKtocGJVC/96giBmCIHfW
	 O8Ed9tglXBit2uutMutSJD2PASVfuV8kDmC8QP6wy8TiVdZubEs3Zjl1dFBdggNcrxHX0
	 AMyRqZb6fEfGWPeo4y+dRIrLdSK+bLV1PxX/INdlk+NYo/e6wROQaRrcSP7sSvKFxrWVl
	 ciE0uE2jg041nfjSCO6AGp8S5KbWOUMqF164hLhccqYm6kOzkSL1E+O43a1hH1M64ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YgqXRSdv;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3195F606A339
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 00:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3195F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YgqXRSdv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZgUlYm807ROoByleEtNqO6HkY1e2yjPbq5r68jDHbbY=;
	b=YgqXRSdvzftb8Tb1bdNbuPWztdPRKU9KJFpMvzT8MpB9ONE0S3K2OwHHc8o/QB5SavpYkI
	3Gs+dcS3QN6eNMTLkMiMT1LA5fwCLd+whTwbIp7y+RcaQjrz/s5w6b0mFDUm3U2z/Jpvnu
	AvgFMBzYUiZVKrgTiV5Bs+reXow65jM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-Y3anUeXJMJKnfYkdjHQh9A-1; Fri, 06 Nov 2026 19:06:40 -0500
X-MC-Unique: Y3anUeXJMJKnfYkdjHQh9A-1
X-Mimecast-MFC-AGG-ID: Y3anUeXJMJKnfYkdjHQh9A_1794009999
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f568dee56so243397185a.0
        for <imx@lists.linux.dev>; Fri, 06 Nov 2026 16:06:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794009999; x=1794614799;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZgUlYm807ROoByleEtNqO6HkY1e2yjPbq5r68jDHbbY=;
        b=Q+IeWLbly4eU+BGFTGVctReWw2xcw9qVismciAOVAh2UpAm3U5+3RPxodifAQnCVsh
         VOKMfdN5IfBoB1WbHR4YgAsmXigi4aIvnXrTuvLwDz4ilMSts79jv4G0GcjZdaT/viHc
         NklTIt9h3iUbNmt4tTv1PNPhwe7JWjBnRZ3+wcuaIWd1csIfyMhJAqbuvWAVUerqSXe3
         2os6R3OCh/r4kqm3Rr85E+88M8+lCHAhKM/7ZTpofIGbEhCrB/ZUFcR97aAcmE1yJ6Gn
         hYcWkwEy/Djvq/umeGKfKAiHy0SJ6uoyx09vswoxs11Mf8fMdACz+R87BCeV3ddF0IIm
         YRZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsZZfqr8ucFQCXFNjBk7KA4mkLmCpbww0UidSplzXRPqtT2Y4BklBjJtKuIqqwu4PvT70=@lists.linux.dev
X-Gm-Message-State: APuU4Z+G3cJoik4cBzNO24Rc4Xram2FUem1o8r99VyNQFjbcQ9aT1Ha8
	OUnNjZeFOer5W18kXu403qFrGx6BrNAdHxY3dyXqGbYOoLZy7DsVp4wb3X75MZnzn9kF3osj5cb
	NVIzNp3+oJSAn4xdA5Bh4Nc6expKBWEHq3RMldW5Q4QXPkcxxo2iSPA==
X-Gm-Gg: AYBFou0AuyWkyJ5HTzwkhVT0fQr0v8EFCU+SWP0Uz6ZLJW3UZkUr48eO2ppoO3TQx2h
	A8EESAfq3ThdAbQ29GIi7dLrR7s5uEgCeEjYeUmSFtnX3hm5OvWxU37N2ApicGh+NbNA79Ki1ta
	C5FlNOsMyFtJGfYaTXUp/DNmCepgmu0bYcQSRhCTOUjtZLafuT2rIUuc4tInsTUN5hEAN5g6OQB
	nQTzuyMI4CB1EURte9bu+E1YGaD0CXTP6FNwZk0CM6SN+tOX1UgtlBFtpq7G2ceu6hsol0joMSi
	n8YIYe695orOv6i20EAGxXanVnYqBkfwdhWSIgQSzjM3aZ6HCKg9SR6AQC8NNMk9MWcSLOC3qGp
	AnLjtYuGOKLrcBPnb8G1dm85Pt7Mb6wIfdXFfx2alr9ICvtMnKYI3MT/c2YV9MHPUqKmKy5jodF
	ZapmulM+B0JQkUvswO
X-Received: by 2002:a05:620a:4487:b0:93e:c12c:fbbf with SMTP id af79cd13be357-945f36131dfmr656683685a.76.1794009999310;
        Fri, 06 Nov 2026 16:06:39 -0800 (PST)
X-Received: by 2002:a05:620a:4487:b0:93e:c12c:fbbf with SMTP id af79cd13be357-945f36131dfmr656679385a.76.1794009998935;
        Fri, 06 Nov 2026 16:06:38 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acc4a7sm31624376d6.44.2026.11.06.16.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:06:38 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/3] dmaengine: convert to subsys_platform_driver() and
 subsys_platform_driver_probe()
Date: Fri, 06 Nov 2026 19:06:07 -0500
Message-Id: <20261106-dmaengine-subsys-v1-0-780eeddbf3ef@redhat.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBCF4auEWRvItDaCVxEXMZnEEYySaYsl5
 O5Gu/zgvb+CUGESOKsKhVYWfuUOPCjwd5cTaQ7dMJjBIppJh6ejnDiTluUmm2gM/oQWRxPxCP3
 2LhT5809errv78kF+/nWgtS91cMYmdAAAAA==
X-Change-ID: 20261105-dmaengine-subsys-1dc716130f14
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1433; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=oVVsVvvwfxfCApVHL620mY2qW7PKDgCvH3JDOSlJNIU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeZdcF1fMUmH+rXipql15WdnT/1AeSXHt/1r/5ue1r9
 M+H33PedJSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCR/hkM/8zit2odZXRSqNV5
 sVO+W9Z/z9Uvm+4UuU33k+g7uHdzqgojQ8N5ObsWa4OmxOCDrNu7b3qnL/RZuSGFoz3q0Oawy6H
 sjAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -yYcdb-FMWYmcUVMpkK47c5K0_25BHVzZCOM0DjYhRg_1794009999
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Reduce boilerplate code in these drivers and convert them over to use
the macros subsys_platform_driver() and subsys_platform_driver_probe().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (3):
      dmaengine: convert to subsys_platform_driver()
      dmaengine: convert to subsys_platform_driver_probe()
      dmaengine: fsldma: convert to subsys_platform_driver()

 drivers/dma/at_xdmac.c          | 12 +-----------
 drivers/dma/bestcomm/bestcomm.c | 18 +-----------------
 drivers/dma/dma-jz4780.c        | 12 +-----------
 drivers/dma/dw/platform.c       | 12 +-----------
 drivers/dma/fsl-edma-main.c     | 12 +-----------
 drivers/dma/fsldma.c            | 14 +-------------
 drivers/dma/imx-dma.c           |  6 +-----
 drivers/dma/mcf-edma-main.c     | 12 +-----------
 drivers/dma/moxart-dma.c        | 12 +-----------
 drivers/dma/owl-dma.c           | 12 +-----------
 drivers/dma/sa11x0-dma.c        | 12 +-----------
 drivers/dma/sf-pdma/sf-pdma.c   | 14 +-------------
 drivers/dma/ste_dma40.c         |  6 +-----
 drivers/dma/ti/omap-dma.c       | 12 +-----------
 14 files changed, 14 insertions(+), 152 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261105-dmaengine-subsys-1dc716130f14

Best regards,
--  
Brian Masney <bmasney@redhat.com>

