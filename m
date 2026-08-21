Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F6843CED9
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 08:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787300911; cv=none; b=I16+R0oU+m5hn/dTZHyT6uhfjfMKMoCm3fmoElvCAoO3nYlVyQdJMRRX0GtIMt9IdzlxOKtWLweLv3aOoKrbphC29cYDCZhEqVbpPKg/tOuB3xKTevAzVB0Uy6fDjdbTGF5yC+BWVPdteFtKavw67rbit2ZlvSr2aGpt5ynk9yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787300911; c=relaxed/simple;
	bh=qJhcjKHLUyuQxuR0sYe4zCiQEHkG6x3ET9S81uqzmTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=oiYFOJGZ4xPXvdIzTxYOzuu3HwsQocRlVunpkU+udrRSvczNoq/MzT1Qv6Oe/M6SVQSpXF+ACpnsqxvekTFLJTppqhRX6JfttYzgVzoIcVE1PJHqv3vODTIsEcmqPjavsbPn3mkObmIvwMA0ceWrfJhxDT0ZURMk3mElMUuLGvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T1ywMr9a; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T1ywMr9a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787300905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=h2cGhuhLE40OVedXzpfrCNv2r3gg+Q9pq5IchGV8kzo=;
	b=T1ywMr9a0QnCWaffh8qqbYWQKmAFq1sqrksTOlH6RBsbNcS2lCV2y022scgLwJvO/FFyJd
	fiJbR4+/DVpV5oU4Bwu96uWnAZnBEblyMRYw1EPaBh8IoG7BKcFNOfHFJTHKa6S/uznw8g
	+Zr/3ZQwBjvrN5TFy2IP+sQG76UcEIo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-257-IohSBfaDNnuAMBKdACNN3g-1; Fri,
 21 Aug 2026 04:28:18 -0400
X-MC-Unique: IohSBfaDNnuAMBKdACNN3g-1
X-Mimecast-MFC-AGG-ID: IohSBfaDNnuAMBKdACNN3g_1787300896
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 89B7F195604F;
	Fri, 21 Aug 2026 08:28:16 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.129])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6DDD87D8;
	Fri, 21 Aug 2026 08:28:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: imx: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Fri, 21 Aug 2026 10:28:09 +0200
Message-ID: <20260821082809.185110-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: lzCeHXlnBL3K-1uuA58sL3RuJnI7atzC819gF5YpwiE_1787300896
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

While the GCC and Clang compilers already define __ASSEMBLER__ auto-
matically when compiling assembly code, __ASSEMBLY__ is a macro that
only gets defined by the Makefiles in the kernel. This can be very
confusing when switching between userspace and kernelspace coding, or
when dealing with uapi headers that rather should use __ASSEMBLER__
instead. Let's standardize now on the __ASSEMBLER__ macro to avoid
this confusion.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Note: This has been split from an earlier bigger patch of mine into
       a separate patch to ease reviewing

 arch/arm/mach-imx/hardware.h | 2 +-
 arch/arm/mach-imx/mxc.h      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-imx/hardware.h b/arch/arm/mach-imx/hardware.h
index 0760fff39a0b3..71f09648c7778 100644
--- a/arch/arm/mach-imx/hardware.h
+++ b/arch/arm/mach-imx/hardware.h
@@ -7,7 +7,7 @@
 #ifndef __ASM_ARCH_MXC_HARDWARE_H__
 #define __ASM_ARCH_MXC_HARDWARE_H__
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <asm/io.h>
 #include <soc/imx/revision.h>
 #endif
diff --git a/arch/arm/mach-imx/mxc.h b/arch/arm/mach-imx/mxc.h
index fe2d0f5abfcc2..1d13e3959159e 100644
--- a/arch/arm/mach-imx/mxc.h
+++ b/arch/arm/mach-imx/mxc.h
@@ -16,7 +16,7 @@
 
 #define IMX_DDR_TYPE_LPDDR2		1
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #ifdef CONFIG_SOC_IMX6SL
 static inline bool cpu_is_imx6sl(void)
-- 
2.55.0

