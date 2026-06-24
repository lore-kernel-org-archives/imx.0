Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D818D2D94AF
	for <imx@lists.linux.dev>; Wed, 24 Jun 2026 14:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782311833; cv=none; b=cf041L5V4498z1xfYn8C+shXHRibEwl8C+cxrQGd+jf5yjAPhQuTaPWmxpIIfX0XfTHmPy83v3fsDbk+sfeklnVDZjjRZ84VbGfSjKor64rbAKgs4KSIZNzujJPknbC4UqJnlxrSUr5PxQs34zJVO/sVTzqTNZP+O9apefw6nms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782311833; c=relaxed/simple;
	bh=EOh/Ajnb6MOoJfNFd7guK7Ju9QywrXeclIXU8HTT2tY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DuyNxBCiILEpRTiUWxPTL2hKf6dd5DL4tVTuXXcpIpCF9lHiSzn9Q5yj0+Y4msfSk9+UKL7jlZ2W/Hm4d1d4zF69KobdVRN3ygZOutjZwRaeTtoBqmc/MGWZrjHfTJ4j9tM50b1LQ6m8cvcCGR9KDpbawglaW0DwPwBIIljDULY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABXrtGV6ztqhFIHFQ--.940S2;
	Wed, 24 Jun 2026 22:37:09 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] mailbox: imx: return TXDB_V2 timeout errors
Date: Wed, 24 Jun 2026 22:37:07 +0800
Message-ID: <20260624143707.49344-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABXrtGV6ztqhFIHFQ--.940S2
X-Coremail-Antispam: 1UD129KBjvdXoWruF13Ar4kCr4DJFW7Ww4Durg_yoWfZwc_C3
	95Xas7Ww4jkF98Cr17Jw1rA342vas8W345t34ktFZxW34j934IyrykZrsYkr1UCFZ5Cr9x
	Aa1jv340y34DWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_Jw0_
	GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
	42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUbHa0JUUUU
	U==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

imx_mu_generic_tx() retries TXDB_V2 doorbell sends until the GIR bit
clears, but falls through to the common success return even when every
readl_poll_timeout() attempt failed.

Return the final timeout error after the retry loop so mailbox clients
can observe a failed doorbell send instead of treating it as successful.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/mailbox/imx-mailbox.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 246a9a9e3..86a8a590b 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -253,6 +253,8 @@ static int imx_mu_generic_tx(struct imx_mu_priv *priv,
 						     cp->type, ++count);
 			}
 		}
+		if (ret)
+			return ret;
 		break;
 	default:
 		dev_warn_ratelimited(priv->dev, "Send data on wrong channel type: %d\n", cp->type);
-- 
2.50.1 (Apple Git-155)

