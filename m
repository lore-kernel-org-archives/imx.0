Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E281E1FCF41;
	Thu,  7 May 2026 01:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778117362; cv=none; b=X9uSwNaOBOKpL8x05muRqTtmvfcqo9e32zjeAdPKamU7isvGiqs8Z6H37GmUUBfpUBgSV2nk+N02mFnWMW2AdrQDinARDUJVLeUxDaMGL6EgIzLjlR/j+Jm9aGh1n+2yDQVLKEVo/MJJFZOZq5BJKHet2XCAOrRdzfifo6cUPcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778117362; c=relaxed/simple;
	bh=OIaWEgDWMvr3TzGXeZFqdGmets0mZIuI7YDFz1mPax8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t52vY30++al3ZnhUCBWBH2qg8oeb3LbiCbsyflBYGZvYrzKIuSUWaz90L0yhOa/ab8cJpH68yBaQfCoGi9HVwqhNKVjS2MJUx57TDxfwNGzKVjvFNIStzvPO1f03SWuisAcHivpm6esziqY7h/TdReh9ArHVtwQXJtC5AuuIX9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NF1UJWmw; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NF1UJWmw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Z6vu7CfiHvFKcOfeY4mER0XoQ6hWmqWVmTclQ5JCJJM=; b=NF1UJWmw4LJk54BrsCTTTCmy6o
	R65J9dOBPdwJFrJqV7FPLmO9cUrfWC6X3F32CCnQwt1pidXdl1mPo232TwbA0NZCwho0zmfc9mZEo
	fHpFqXaikcmga/F/yqL1jEs1N/z7nWLgQa+I9zzNtAHQ6cEgxzMlMLY84jrPoRWQUzuDrmDfMR3fy
	xu8pjlFdNs0/ynDR1jycEsiOZrFoDtlnuYhfeEoyza37Ba3Emno0qfqB9jhnZ6ulrzBoZbcQoTP67
	euSj3ZftMUgXqq64AEDbztZmhbyM7COasPQq1u+C/vDESff6+xe++5rG8x984MRPzJPvXsegdniRf
	G8QFCkgg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKnYF-00000002Qly-0aJa;
	Thu, 07 May 2026 01:29:19 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev
Subject: [PATCH -next] firmware: drivers: imx: fix docs build warning
Date: Wed,  6 May 2026 18:29:17 -0700
Message-ID: <20260507012917.263124-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a blank line to fix a documentation build warning.
Also add a comma to separate the list of Users to improve
readability.

Documentation/ABI/testing/se-cdev:1: ERROR: Unexpected indentation. [docutils]

Fixes: 4de71839142b ("firmware: drivers: imx: adds miscdev")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev

 Documentation/ABI/testing/se-cdev |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20260506.orig/Documentation/ABI/testing/se-cdev
+++ linux-next-20260506/Documentation/ABI/testing/se-cdev
@@ -11,6 +11,7 @@ Description:
 		The ioctl(2)-based ABI is defined and documented in
 		[include]<linux/firmware/imx/ele_mu_ioctl.h>.
 		ioctl(s) are used primarily for:
+
 			- shared memory management
 			- allocation of I/O buffers
 			- getting mu info
@@ -38,6 +39,6 @@ Description:
 		  with the file descriptor.
 
 Users:		https://github.com/nxp-imx/imx-secure-enclave.git,
-		https://github.com/nxp-imx/imx-smw.git
+		https://github.com/nxp-imx/imx-smw.git,
 		crypto/skcipher,
 		drivers/nvmem/imx-ocotp-ele.c
