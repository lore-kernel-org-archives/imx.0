Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E995342AB7
	for <imx@lists.linux.dev>; Sun,  1 Mar 2026 16:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772382195; cv=none; b=GJK9qJ7S3oscoMmr9axb2DcZKKmIzQ/WV1yj9YdXNA7wmmDI0AzHBmlSaTxxx1ypYCPM2PqNsFzL5+AR/ZUVyR/3m05JIl/mvfAQ4fZ88RKPch9IbkE0/Azhwp+CAsSy7n/MhDvIDRKYAq3HnwqyHM3fADIVaM3zF3g5qxM6xRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772382195; c=relaxed/simple;
	bh=9eRyUiK0/9uja+PNMqhpVO14GsThaMS0Xfyg5RhUQSw=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=SVXytCDcWfusF3qK7nweeidGYh/44swfXzHlys8Y/0H5BXp0uE+IWoCGGAkozjWFrUiYOUTB9EyhfS1Q9CPRsbJrF2aPJ905bCg4hB2LNF7r4M0RlOQI7qNIHqmqjzUL33373MEgFYmT1lck1OvCcq4tJwyt5bqxjbus8Z6w+E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=QU6r7CSU; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="QU6r7CSU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1772382181; bh=FxOGfWAcvu8utBdn+O1zmIsYuW7wtW7N4+J3Xi+kwB8=;
	h=From:To:Cc:Subject:Date;
	b=QU6r7CSUbVF/5S0Tfw1HcXWelo6RXRdYCLc/ughPRD1MPVx8nYC3dtq0EuaBFoNv4
	 bdgI5ctxjobZnY6d7Mgni6weI0PjWVIa9mjhln1ZBzIfU14hE7jEqA02OU2DBjIXlu
	 t7ps+I7kwem4z+7YJcXC1n7+pKvHAINuA+OyiwwI=
Received: from admin.. ([2001:da8:205:20a0:6eeb:b6ff:fe15:94a7])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 5BA3884F; Mon, 02 Mar 2026 00:22:58 +0800
X-QQ-mid: xmsmtpt1772382178th2l0aroy
Message-ID: <tencent_AB29FADF1FAD67D818283B6BB4FDF66F2F08@qq.com>
X-QQ-XMAILINFO: M8SslFiB5g9ISFL2SGn5VXSgyojemWtaTJZt6q3a5EITqt9Wcfx11YnIWPWNwP
	 KXelWv8ze0gJz2zuC/q/Pm6AIfGBtRPy9LWM1xlThmm+e/OFWZvMvxT+hULDo5wv4eJy1Lxtb3d5
	 +GUlgHABoxg5bWfL/7OwhBgeGjl3WOYKsmscJr8G2RuVgnQTP6JX18h/mUtu9lgCKvpXlb0OVqD2
	 FLbre00Psevvm9fbLzjxvL07WdKnaddkrbqn9vBpdU+Q75rnQnJMlDiuiRo6JRJAi1Pen/Y6216C
	 paxiZsem16YMFhub/r4O2hj8gZqqqFGPObHgUXiGR6Mog8EkSm9WLKNESOWK9TUWTMKaajQAbTXr
	 2TB1IEbZxNnjTspJqWCMm8Cu3PiZM3JyxbLT65iGKhXD0Ir7aEmklZOsS99jKRaA/AwpVgQ41xoF
	 kDT4VFhJFbm+9V+zcYSmF6ZuWTIFfKXrI5eV+AlDpvTN5/tHt5gjPZ0N+bSs2SqYNMpwkG1XywVj
	 0l+9Gw0/s+Ar0r9qlod4AHsnmbfsiUgsS5Tp1b7wiJzcLjbZBymiKpHL+gPF8wBiiiDO2D+JBjpa
	 xIr62Qnob3O66nZYADBWoWgMpYSW+IoLRu9fmm27Okovr03KMtRihFJx9feRYureRyuLh5rLOrEx
	 QZ0iGHTsnAY2QAwP3XO1AoxJAHSu/eqVGqU60Uyiq/tWSW7YSpo5qFzYRwSPZ3RgXbngdTR5QAFt
	 ywd4ByM+vHJr/op4mQ4NwrmKSvPp2XxRjQD/gUvVdPxFPgfFR82gzk6+wPBsU7lrIpzM0Uu2pvdO
	 62WYWfrhs5+k94+bVSvk1+yFiJo39GPKOWecJpSsTZ4kc/LucPDcrfj6S4OXdGzy++jQWyMb7nO4
	 wghKzBS55LgL8wNrRRW52NfM93v8hFvgtcydHrkTtb05h2mbgWFMnce/toT/1t4VyNFwUa7tAjrT
	 LIstUpUwap2XLs5pLq1x6xC0a53+SHIqsRhGoaa5ckdsjC2anJMBSLW5b66h5CnTEspOBOxSkxvr
	 y6RZ4/sCaP5+ATul4SzoYeolRS7WNY6GJGsPuvOVS7yE6gT80vVafhtyKdOPAM95NDMtwHX5RFRQ
	 ZPxNbH
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Zhaoyang Yu <2426767509@qq.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zhaoyang Yu <2426767509@qq.com>
Subject: [PATCH] serial: auart: check clk_enable() return in console write
Date: Sun,  1 Mar 2026 16:22:56 +0000
X-OQ-MSGID: <20260301162256.267212-1-2426767509@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a check for clk_enable() in auart_console_write(). If
clk_enable() fails, return immediately to avoid accessing
hardware registers while the clock is not enabled.

Signed-off-by: Zhaoyang Yu <2426767509@qq.com>
---
 drivers/tty/serial/mxs-auart.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index cc65c9fb6446..693b491f1e75 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -1318,7 +1318,8 @@ auart_console_write(struct console *co, const char *str, unsigned int count)
 	s = auart_port[co->index];
 	port = &s->port;
 
-	clk_enable(s->clk);
+	if (clk_enable(s->clk))
+		return;
 
 	/* First save the CR then disable the interrupts */
 	old_ctrl2 = mxs_read(s, REG_CTRL2);
-- 
2.34.1

