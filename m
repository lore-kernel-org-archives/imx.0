Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629581E98EF
	for <imx@lists.linux.dev>; Fri, 19 Jun 2026 12:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781871900; cv=none; b=M8l3dNGMcShRX8Z4wnGuIe6Zgc3SJkWS141NJDLjet8gwW0VsaeFGOWYBjAQdaJ7P14MC6DW/CF2ar4ri5IUgxLNW/ndZbcBKi+JgOu5hAk2RfdA4kX2BG2rMLsthXFIcxi/RUw3IgJZXMGrBHae8fMk4Zq0Z/KDhcBMRqj8Sx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781871900; c=relaxed/simple;
	bh=Y/mBFtaVYBOY+OMX7nksB5YG9+YGWKaUEIaJSzn9PCc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=ZjlgwX/xmxznaOhhR7YufITZ3C3eIioTsK16tyfc3Go8BgvDopUIb7QS9Y0cw9LGpZxRi+/sJpe7lkGvhJS+Fe55jpF2qk9hcMPsY2XgbEuQZp80pKbwDjJtPj/thSHTUF4d9zmKYkAm0Cm0t481wDfH7D1+XA6fbYYUsWC7Msk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O0q7RMQM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O0q7RMQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781871898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+rOB7Eiz0TZhGqA7xx5E72SsurOzDSCiMo/FEh87h1A=;
	b=O0q7RMQM4m+z65sMSIHHsnAzvGDQGBKgMiyJENIGeeYobMu8aIXmZTo7iBcMtN81wy2CV4
	xmcftsUk2ZDmHwVpR9x4vfEmC39JVqoyYz+jPVBis9QU0a1O8RwyJOaEyJmEybgw6Cpk4R
	fWKSZbvK6s7mgmAm90vOZiPte5QJr78=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-194-pzui6LjpPumhTVYE_8K11Q-1; Fri,
 19 Jun 2026 08:24:56 -0400
X-MC-Unique: pzui6LjpPumhTVYE_8K11Q-1
X-Mimecast-MFC-AGG-ID: pzui6LjpPumhTVYE_8K11Q_1781871895
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 944691933E39;
	Fri, 19 Jun 2026 12:24:54 +0000 (UTC)
Received: from thuth-p1g4.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 240931624;
	Fri, 19 Jun 2026 12:24:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: imx: Replace __ASSEMBLY__ with __ASSEMBLER__ in header file
Date: Fri, 19 Jun 2026 14:24:48 +0200
Message-ID: <20260619122448.188046-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: dJ9jmdOp9pqohmqrwgS0i12X8ksAjE1pKPKUW_Irv90_1781871895
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Thomas Huth <thuth@redhat.com>

While the GCC and Clang compilers already define __ASSEMBLER__
automatically when compiling assembly code, __ASSEMBLY__ is a
macro that only gets defined by the Makefiles in the kernel.
This can be very confusing when switching between userspace
and kernelspace coding, or when dealing with uapi headers that
rather should use __ASSEMBLER__ instead. So let's standardize now
on the __ASSEMBLER__ macro that is provided by the compilers.

This is a completely mechanical patch (done with a simple "sed -i"
statement).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Note: This patch has been split from an earlier bigger patch of
 mine to ease reviewing.

 include/soc/imx/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/soc/imx/cpu.h b/include/soc/imx/cpu.h
index 0bf610acafd06..8c53150acd76e 100644
--- a/include/soc/imx/cpu.h
+++ b/include/soc/imx/cpu.h
@@ -30,7 +30,7 @@
 #define MXC_CPU_VF600		0x600
 #define MXC_CPU_VF610		(MXC_CPU_VF600 | MXC_CPU_VFx10)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 extern unsigned int __mxc_cpu_type;
 #endif
 
-- 
2.54.0

